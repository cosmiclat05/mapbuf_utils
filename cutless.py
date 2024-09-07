from BlifGraph import BLIFGraph
from cuts import Cut
from label import TimingLabel

class cutless_enumeration_params:

    use_zero_order_cut: bool = True
    use_first_order_cut: bool = False
    use_infinite_order_cut: bool = True
    use_all_buffered_cut: bool = False

    # this will overwrite the above settings
    use_old_cut_expansion: bool = False



def expand_cut_at(g: BLIFGraph, leaves: set, leaves_to_expand: str):

    # we can call it on multiple leaves
    new_leaves: set = set(list(leaves)[:])  # deep copy

    if isinstance(leaves_to_expand, set):
        for leaf in leaves_to_expand:
            new_leaves.remove(leaf)
            for h in g.node_fanins[leaf]:
                new_leaves.add(h)

    elif isinstance(leaves_to_expand, str):
        leaf = leaves_to_expand

        new_leaves: set = set(list(leaves)[:])  # deep copy
        new_leaves.remove(leaf)
        for h in g.node_fanins[leaf]:
            new_leaves.add(h)

    # Example:
    #
    #  a, b
    #
    #       c = f(a,b)
    #       d = f(a,b)
    #       e = f(a,b)
    #
    # initial leaves: c, d, e
    # if we expand the cut at node c, then we get {a, b, d, e}, which is redundant
    #
    # however, this could cause a problem and skip the channels
    #
    # for instance,
    #  a, b
    #
    #       c = f(a)
    #       d = f(a, b)
    #       e = f(a, b)
    #
    # initial leaves: c, d, e
    while True:
        updated = False
        for h in new_leaves:
            if h not in g.node_fanins:
                continue

            # here the plus 1 is because we haven't remove h from leaves yet!
            if len(new_leaves.union(g.node_fanins[h])) <= len(new_leaves) + 1:
                new_leaves.remove(h)
                new_leaves = new_leaves.union(g.node_fanins[h])
                updated = True
                break
        if not updated:
            break

    return new_leaves

def label_propagation(
    graph: BLIFGraph,
    arrival_time: callable,
    signal: str,
    cut_size_limit: int,
    max_expansion_level: int,
):

    optimal_timing_label = TimingLabel()

    leaves: set = graph.fanins(signal).copy()  # deep copy
    best_leaves: set = leaves.copy()  # deep copy

    curr_expansion_level = 0

    # we should also consider the constants
    while True:

        # we count the number of non-constant leaves
        num_leaves: int = 0
        for f in leaves:
            if f in graph.const0 or f in graph.constant1s():
                continue
            num_leaves += 1

        # we stop when the number of leaves is larger than the limit
        if num_leaves > cut_size_limit:
            curr_expansion_level += 1

        else:
            curr_expansion_level = 0

        # break if the expansion level is larger than the limit
        if curr_expansion_level > max_expansion_level:
            break

        arrival_times: list = []
        for leaf in leaves:
            arrival_times.append((arrival_time(leaf), leaf))

        maximum_timing_label, _ = max(arrival_times)

        # we only update the result if the cut is valid (curr_expansion_level = 0)
        if curr_expansion_level == 0:
            if optimal_timing_label > maximum_timing_label + 1:
                optimal_timing_label = maximum_timing_label + 1

                # we update the best leaves
                best_leaves = leaves.copy()

        # can't expand further
        if maximum_timing_label == TimingLabel(0):
            break

        # should we stop?
        done: bool = False

        # we prepare for the next expansion
        leaves_to_expand = set()
        for label, leaf in arrival_times:

            if label == maximum_timing_label:

                # the leaf is on the critical path, but we cannot expand it
                if leaf not in graph.node_fanins:
                    done = True
                    break

                leaves_to_expand.add(leaf)

        if done:
            break

        # we expand the cut
        leaves = expand_cut_at(graph, leaves, leaves_to_expand)

    best_cut = Cut(signal, best_leaves)

    return optimal_timing_label, best_cut


def zero_order_cut_expansion(
    g: BLIFGraph,
    signal: str,
    labels: dict,
    signal_to_channel: dict,
    cut_size_limit: int,
    max_expansion_level: int,
) -> list:
    def arrival_time(f: str) -> TimingLabel:
        assert f in labels
        return labels[f]

    return label_propagation(
        g, arrival_time, signal, cut_size_limit, max_expansion_level
    )

def cleanup_dangling_cuts(cuts: dict) -> dict:
    """Cleanup dangling cuts.

    we remove all the cuts that are dangling, i.e., the cut is only for one input signal.
    those cuts are useless, and they will cause the MILP solver to fail.
    but they are not removed in the previous steps, because they are not dangling for the output signals.

    >>> MADBuf/Synthesis/CutEnumeration/RemoveDanglingCuts.py

    Args:
        cuts (dict): a dictionary of cuts, indexed by the signal name, and each entry is a set of cuts (of type Cut).

    Returns:
        dict: a dictionary of cuts, indexed by the signal name, and each entry is a set of cuts (of type Cut).
    """

    signal_to_cuts: dict = {}

    # remove all the cuts for the inputs
    for signal in cuts:
        cut_set = cuts[signal]

        if len(cut_set) == 0:
            continue

        if len(cut_set) == 1:
            cut: Cut = cut_set[0]
            if cut.size() == 1:
                if signal in cut.leaves:
                    continue

        signal_to_cuts[signal] = list(set(cut_set))

    return signal_to_cuts

def precompute_timing_labels(
    g: BLIFGraph,
    signal_to_channel: dict = {},
    cut_size_limit: int = 6,
    max_expansion_level: int = 4,
    cutless_hueristic: int = 0,
    verbose: bool = False,
) -> tuple:
    """Get timing labels

    Args:
        g (BLIFGraph): the subject graph
        signal_to_channel (dict, optional): the mapping from signals to the channels. Defaults to {}.
        cut_size_limit (int, optional): the K value in K-LUT mapping. Defaults to 6.
        max_expansion_level (int, optional): the expansion level in which we torelant the cut size violation. Defaults to 0 (zero tolerance).

    Returns:
        tuple (dict, dict): (labels, cuts)
    """
    cutless_enumeration_params.use_zero_order_cut: bool = True
    cutless_enumeration_params.use_first_order_cut: bool = False
    cutless_enumeration_params.use_infinite_order_cut: bool = True
    cutless_enumeration_params.use_all_buffered_cut: bool = False
    cutless_enumeration_params.use_old_cut_expansion: bool = True
    
    if verbose:
        print(f"Precompute timing labels, cut size limit = {cut_size_limit}")

    labels: dict = {}
    all_buffered_labels: dict = {}
    signal_to_cuts: dict = {}

    channel_to_signals: dict = {}
    for signal in signal_to_channel:
        channel = signal_to_channel[signal]
        if channel not in channel_to_signals:
            channel_to_signals[channel] = []
        channel_to_signals[channel].append(signal)

    for signal in g.topological_traversal():
        signal_to_cuts[signal] = []
        cuts = []

        if g.is_ci(signal):
            labels[signal] = TimingLabel(0)
            all_buffered_labels[signal] = TimingLabel(0)
            signal_to_cuts[signal] = [Cut(signal, [signal])]
            continue

        if cutless_enumeration_params.use_zero_order_cut:
            optimal_timing_label, zero_order_cut = zero_order_cut_expansion(
                g,
                signal=signal,
                labels=labels,
                signal_to_channel=signal_to_channel,
                cut_size_limit=cut_size_limit,
                max_expansion_level=max_expansion_level,
            )
            labels[signal] = optimal_timing_label

            cuts.append(zero_order_cut)

        if cutless_enumeration_params.use_infinite_order_cut:
            # infinite order cuts
            cuts.append(Cut(signal, g.fanins(signal)))

        signal_to_cuts[signal] = cuts

        # unique cuts
        signal_to_cuts[signal] = list(set(signal_to_cuts[signal]))

    return labels, signal_to_cuts


def cutless_enumeration_impl(network: BLIFGraph, **kwargs) -> dict:
    """
    Cutless enumeration of cuts
    """

    signal_to_channel = {}
    lut_size_limit = 6
    verbose = False
    max_expansion_level = 4
    cutless_hueristic = 1


    if signal_to_channel == None:
        signal_to_channel = {}

    signal_to_channel = (
        kwargs["signal_to_channel"] if "signal_to_channel" in kwargs else {}
    )
    lut_size_limit = kwargs["lut_size_limit"] if "lut_size_limit" in kwargs else 6
    verbose = kwargs["verbose"] if "verbose" in kwargs else False
    max_expansion_level = (
        kwargs["max_expansion_level"] if "max_expansion_level" in kwargs else 0
    )

    if signal_to_channel == None:
        signal_to_channel = {}

    labels, cuts = __get_timing_labels(
        network, signal_to_channel, lut_size_limit, max_expansion_level
    )

    if verbose:
        for signal in network.topological_traversal():
            print(
                f"labels = {labels[signal]}, cuts = {len(cuts[signal])}, signal = {signal}"
            )

    cuts = cleanup_dangling_cuts(cuts)

    return cuts

def print_cut_summary(signal_to_cuts: dict):

    total_cut_count = 0
    cut_count_by_size = {}
    max_cut_count: int = 0

    for signal in signal_to_cuts:
        total_cut_count += len(signal_to_cuts[signal])

        if len(signal_to_cuts[signal]) > max_cut_count:
            max_cut_count = len(signal_to_cuts[signal])

        for cut in signal_to_cuts[signal]:
            cut_size = cut.size()
            if cut_size not in cut_count_by_size:
                cut_count_by_size[cut_size] = 0
            cut_count_by_size[cut_size] += 1

    print(f"Total cut count = {(total_cut_count)}")
    print(f"Max cut count = {(max_cut_count)}")
    for cut_size in cut_count_by_size:
        print(f"Cut size {cut_size} count = {cut_count_by_size[cut_size]}")

    stats = {}
    stats["total_cut_count"] = total_cut_count
    stats["max_cut_count"] = max_cut_count
    for cut_size in cut_count_by_size:
        stats[f"cut_size_{cut_size}_count"] = cut_count_by_size[cut_size]

    return stats

def write_cuts(signal_to_cuts: dict, filename: str) -> None:
    with open(filename, "w") as f:
        for signal in signal_to_cuts:

            cuts = signal_to_cuts[signal]
            num_cuts = len(cuts)

            f.write(f"{signal} {num_cuts}\n")

            cut: Cut
            for index, cut in enumerate(cuts):
                f.write(f"Cut #{index}: {cut.size()}\n")
                for leaf in cut.leaves:
                    f.write(f"\t{leaf}\n")


def read_cuts(filename: str) -> dict:
    with open(filename, "r") as f:
        lines = f.readlines()
        lines = [line.strip() for line in lines]

        signal_to_cuts = {}

        index = 0
        while index < len(lines):
            line = lines[index]
            index += 1
            signal, num_cuts = line.split()
            num_cuts = int(num_cuts)

            cuts = []
            for i in range(num_cuts):

                line = lines[index]
                index += 1

                assert line.startswith(f"Cut #{i}:")
                num_leaves = int(line.split()[-1])

                # parse leaves
                leaves = []
                for j in range(num_leaves):
                    line = lines[index]
                    index += 1
                    leaves.append(line)

                cuts.append(Cut(signal, leaves))

            signal_to_cuts[signal] = cuts

        return signal_to_cuts

def __expand_cut_at(g: BLIFGraph, signal_to_channel: dict, leaves: set, leaves_to_expand: str):

    # we can call it on multiple leaves
    new_leaves: set = set(list(leaves)[:])  # deep copy

    if isinstance(leaves_to_expand, set):
        for leaf in leaves_to_expand:
            new_leaves.remove(leaf)
            for h in g.node_fanins[leaf]:
                new_leaves.add(h)

    elif isinstance(leaves_to_expand, str):
        leaf = leaves_to_expand

        new_leaves: set = set(list(leaves)[:])  # deep copy
        new_leaves.remove(leaf)
        for h in g.node_fanins[leaf]:
            new_leaves.add(h)

    while True:
        updated = False
        for h in new_leaves:
            if h not in g.node_fanins:
                continue

            # do not skip the channels
            if h in signal_to_channel:
                continue

            # here the plus 1 is because we haven't remove h from leaves yet!
            if len(new_leaves.union(g.node_fanins[h])) <= len(new_leaves) + 1:
                new_leaves.remove(h)
                new_leaves = new_leaves.union(g.node_fanins[h])
                updated = True
                break
        if not updated:
            break

    return new_leaves

def __get_timing_labels(
    g: BLIFGraph,
    signal_to_channel: dict = {},
    cut_size_limit: int = 6,
    max_expansion_level: int = 0,
) -> tuple:
    """Get timing labels

    Args:
        g (BLIFGraph): the subject graph
        signal_to_channel (dict, optional): the mapping from signals to the channels. Defaults to {}.
        cut_size_limit (int, optional): the K value in K-LUT mapping. Defaults to 6.
        max_expansion_level (int, optional): the expansion level in which we torelant the cut size violation. Defaults to 0 (zero tolerance).

    Returns:
        tuple (dict, dict): (labels, cuts)
    """

    labels: dict = {}
    cuts: dict = {}

    for signal in g.topological_traversal():
        cuts[signal] = []

        if g.is_ci(signal):
            labels[signal] = TimingLabel(0)
            cuts[signal] = [Cut(signal, [signal])]
            continue

        assert signal in g.node_fanins

        # 
        if True: #CutlessEnumerationImplOld_params.skip_feedthrough:
            if len(g.node_fanins[signal]) == 1:
                fanin = g.fanins(signal)[0]
                
                assert fanin in labels
                labels[signal] = labels[fanin]
                cuts[signal] = [Cut(signal, [fanin])]
                continue

        optimal_timing_label = TimingLabel()

        leaves: set = set(list(g.fanins(signal))[:])  # deep copy
        best_leaves: set = leaves.copy()  # deep copy
        cuts[signal].append(Cut(signal, leaves))

        # while len(leaves) <= cut_size_limit:
        curr_expansion_level = 0

        # we should also consider the constants
        while True:

            # we count the number of non-constant leaves
            num_leaves: int = 0
            for f in leaves:
                if f in g.const0 or f in g.constant1s():
                    continue
                num_leaves += 1

            # we stop when the number of leaves is larger than the limit
            if num_leaves > cut_size_limit:
                curr_expansion_level += 1

            else:
                curr_expansion_level = 0

            # break if the expansion level is larger than the limit
            if curr_expansion_level > max_expansion_level:
                break

            arrival_times: list = [(labels[f], f) for f in leaves]
            maximum_timing_label, f = max(arrival_times)

            # we only update the result if the cut is valid (curr_expansion_level = 0)
            if curr_expansion_level == 0:
                optimal_timing_label = min(
                    maximum_timing_label + 1, optimal_timing_label
                )
                best_leaves = leaves.copy()

            if maximum_timing_label == TimingLabel(0):
                break


            is_reaching_cis = False
            is_on_channel = False
            leaves_to_expand = set()
            for label, f in arrival_times:
                
                # we need to stop if we reach the CIs
                if f not in g.node_fanins:
                    is_reaching_cis = True
                    break

                # we need to remember the leaves that are on the channel
                if f in signal_to_channel:
                    is_on_channel = True

                # we only expand the leaves that have the maximum timing label
                if label == maximum_timing_label:
                    leaves_to_expand.add(f)

            if is_reaching_cis:
                break

            if is_on_channel:
                if curr_expansion_level == 0:
                    cuts[signal].append(Cut(signal, leaves))

            leaves = __expand_cut_at(g, signal_to_channel, leaves, leaves_to_expand)

        labels[signal] = optimal_timing_label
        cuts[signal].append(Cut(signal, best_leaves))

    return labels, cuts