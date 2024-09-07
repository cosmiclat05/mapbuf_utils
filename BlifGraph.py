import os
class BLIFGraphBase:
    def __init__(self):

        self.top_module = ""
        self.inputs = set()
        self.outputs = set()
        self.nodes = set()
        self.register_inputs = set()
        self.register_outputs = set()
        self.ro_to_ri: dict = {}

        # __signals is a list of all the nodes in the network in the topological order
        # this is private and should not be modified directly
        self.__signals = []

        self.const0 = set()
        self.const1 = set()

        # node fanins return the set of fanins of a node
        #  - note that only nodes can be looked up in this dictionary
        #  - __signals are not safe when directly looked up
        self.node_fanins: dict = {}
        self.node_funcs: dict = {}

        self.node_fanouts: dict = {}

        self.submodules = {}

    def is_po(self, signal: str) -> bool:
        return signal in self.outputs

    def is_pi(self, signal: str) -> bool:
        return signal in self.inputs

    def is_ro(self, signal: str) -> bool:
        return signal in self.register_outputs

    def is_ri(self, signal: str) -> bool:
        return signal in self.register_inputs

    def num_nodes(self) -> int:
        return len(self.nodes)

    def num_latch(self) -> int:
        return len(self.register_outputs)

    def num_pis(self) -> int:
        return len(self.inputs)

    def num_pos(self) -> int:
        return len(self.outputs)

    # the CO (combinational outputs are the primary outputs and the register inupts)
    def is_co(self, signal: str) -> bool:
        return signal in self.outputs or signal in self.register_inputs

    # the CI (combinational inptus are the primary inputs and the register outputs)
    def is_ci(self, signal: str) -> bool:
        return (
            signal in self.inputs
            or signal in self.register_outputs
            or signal in self.const0
            or signal in self.const1
        )

    def topological_traversal(self) -> set:
        return self.__signals

    def constants(self):
        return sorted(self.const0 | self.const1)

    def cos(self):
        return sorted(self.outputs | self.register_inputs)

    def cis(self):
        return sorted(self.inputs | self.register_outputs | self.const0 | self.const1)

    def constant0s(self):
        return sorted(self.const0)

    def constant1s(self):
        return sorted(self.const1)

    def pis(self):
        return sorted(self.inputs)

    def pos(self):
        return sorted(self.outputs)

    def ris(self):
        return sorted(self.register_inputs)

    def ros(self):
        return sorted(self.register_outputs)

    def fanins(self, signal: str):
        return sorted(self.node_fanins[signal])
    
    def get_nodes(self):
        return sorted(self.nodes)

    # sort __signals in a topological order
    # TODO: support runtime modification and maintain the topogical order
    def traverse(self):
        self.__signals = []
        for signal in self.cis():
            assert signal not in self.__signals
            self.__signals.append(signal)


        for signal in self.cos():
            self.trav_rec(signal)

        for signal in self.__signals:
            self.node_fanouts[signal] = set()

        # prepare fanouts: this should be recomputed after each network modification
        for signal in self.__signals:
            if signal in self.node_fanins:
                for f in self.fanins(signal):
                    self.node_fanouts[f].add(signal)

    # topological traversal, used to sort the __signals in a topological order
    def trav_rec(self, signal: str, pending_signals: set = set()):
        if signal in self.__signals:
            return
        
        if signal not in self.node_fanins:
            print(f"recursion stoped at node {signal}")
            exit()

        pending_signals.add(signal)

        for f in self.fanins(signal):
            assert f != signal, f"node {signal} is its own fanin"
            if f not in self.__signals:
                if f in pending_signals:
                    # we have a loop
                    # print(f"recursion stoped at node {signal}")
                    # print(f"pending signals: {pending_signals}")
                    return
                self.trav_rec(f)

        pending_signals.remove(signal)
        self.__signals.append(signal)

    def num_fanouts(self, signal: str):
        return len(self.node_fanouts[signal])

    #
    # graph modifications
    #
    def create_pi(self, name: str):
        assert name not in self.inputs and "the input to create already exists"
        self.inputs.add(name)

    def create_po(self, name: str):
        assert name not in self.outputs and "the output to create already exists"
        self.outputs.add(name)

    def create_ri(self, name: str):
        assert (
            name not in self.register_inputs
            and "the register input to create already exists"
        )
        self.register_inputs.add(name)

    def create_ro(self, name: str):
        assert (
            name not in self.register_outputs
            and "the register output to create already exists"
        )
        self.register_outputs.add(name)

    def create_node(self, name: str, fanins: set, func: list):
        assert name not in self.nodes and "the node to create already exists"
        self.nodes.add(name)
        self.node_fanins[name] = set(list(fanins)[:])  # deep copy
        self.node_funcs[name] = func[:]  # deep copy
        self.node_fanouts[name] = set()

    def create_and(self, f1: str, f2: str, name: str):
        self.create_node(name=name, fanins=set([f1, f2]), func=["11 1"])

    def create_or(self, f1: str, f2: str, name: str):
        self.create_node(name=name, fanins=set([f1, f2]), func=["1- 1", "-1 1"])

    def create_buf(self, fin: str, fout: str):
        self.create_node(name=fout, fanins=set([fin]), func=["1 1"])

    def create_latch(self, ri: str, ro: str):
        self.register_inputs.add(ri)
        self.register_outputs.add(ro)
        self.ro_to_ri[ro] = ri

class BLIFGraph(BLIFGraphBase):
    def __init__(self, *args, **kwargs) -> None:

        if len(args) == 0:
            BLIFGraphBase.__init__(self)

        elif len(args) == 1:
            print(f"Warning: using unstable method")
            self = args[0]

def on_input(g: BLIFGraph, line: str):
    for s in line.split()[1:]:
        g.inputs.add(s.strip())


def on_output(g: BLIFGraph, line: str):
    for s in line.split()[1:]:
        g.outputs.add(s.strip())


def on_latch(g: BLIFGraph, line: str):
    ri = line.split()[1].strip()
    ro = line.split()[2].strip()
    g.register_inputs.add(ri)
    g.register_outputs.add(ro)
    g.ro_to_ri[ro] = ri


def on_gate(g: BLIFGraph, line: str, sop: list):
    fanout = line.split()[-1]

    # constants
    # this should not be directly connected to a input, instead, we should reserve:
    #   - constant 0
    #   - constant 1
    # as two unique inputs, and connect this signals to them
    if len(line.split()) == 2:
        if len(sop) == 0:  # constant 0
            g.const0.add(fanout)
        elif len(sop) == 1:  # constant 1
            g.const1.add(fanout)
        return

    # regular nodes
    g.nodes.add(fanout)

    if fanout not in g.node_fanins:
        g.node_fanins[fanout] = set()

    for fanin in line.split()[1:-1]:
        g.node_fanins[fanout].add(fanin)
        g.node_funcs[fanout] = sop[:]  # slicing to trigger a deep copy


def on_subckt(g: BLIFGraph, line: str):
    module: str = line.split()[1].strip()
    _g: BLIFGraph = g.submodules[module]
    for d in line.split()[2:]:
        p: str = d.split("=")[0].strip()
        s: str = d.split("=")[1].strip()
        if p in _g.pos():
            g.inputs.add(s)
        if p in _g.pis():
            g.outputs.add(s)

def read_blif_impl(graph: BLIFGraph, filename: str) -> None:
    """Read BLIF file and construct a BLIF graph

    Args:
        graph (BLIFGraph): the graph to be constructed
        filename (str): the BLIF file name

    Raises:
        FileNotFoundError: if the file is not found
    """

    if os.path.exists(filename) == False:
        raise FileNotFoundError(f"File {filename} not found")

    modules: dict = {}
    module: str = ""
    with open(filename, "r") as f:
        for line in f:
            while line.strip().endswith("\\"):
                line = line.strip()[:-1] + next(f)

            if line.startswith("#"):
                # we skip comments
                continue

            if line.strip() == "":
                # we skip empty lines
                continue

            if line.startswith(".model"):
                module = line.split()[1].strip()
                modules[module] = []

                if graph.top_module == "":
                    graph.top_module = module
                continue

            modules[module].append(line)

    # sub modules
    for module in modules:
        if module == graph.top_module:
            continue
        _g: BLIFGraph = BLIFGraph()
        for line in modules[module]:
            if line.startswith(".input"):
                on_input(_g, line)
            if line.startswith(".output"):
                on_output(_g, line)
        graph.submodules[module] = _g

    index: int = 0
    while True:
        assert index < len(modules[graph.top_module]) and "index out of range"
        line = modules[graph.top_module][index]
        if line.startswith(".end"):
            break
        elif line.startswith(".input"):
            on_input(graph, line)
            index += 1
        elif line.startswith(".output"):
            on_output(graph, line)
            index += 1
        elif line.startswith(".latch"):
            on_latch(graph, line)
            index += 1
        elif line.startswith(".names"):
            # also add the logic
            sop: list = []
            while True:
                index += 1
                _nextline: str = modules[graph.top_module][index].strip()
                if len(_nextline) == 0:
                    break
                if _nextline.startswith("."):
                    index -= 1  # we already reached the next useful line
                    break
                sop.append(_nextline)
            on_gate(graph, line, sop)
            index += 1
        elif line.startswith(".subckt"):
            on_subckt(graph, line)
            index += 1
        else:
            # here there are several possible situations:
            #   - comment: not possible because it is filtered out
            #   - empty line: skip
            index += 1
            continue

    graph.traverse()

def read_blif(*args):
    if len(args) == 1:
        g: BLIFGraph = BLIFGraph()
        read_blif_impl(g, args[0])
        return g

    elif len(args) == 2:
        read_blif_impl(args[0], args[1])