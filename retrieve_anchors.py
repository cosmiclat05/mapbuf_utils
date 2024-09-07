from BlifGraph import *
from retrieve_subject_graph import *
from Channels import *
from retrieve_components import *


def retrieve_channels(graph: BLIFGraph) -> dict:

    signal_to_channel: dict = {}

    # we only consider those anchors in the outputs
    #   the anchor has the structure of:
    #              out (v)
    #              |
    #              PO    PI
    #                    |
    #                    in (u)
    #
    for signal in graph.pos():

        c: Channel = retrieve_channel_from_anchor(signal)
        if c is None:
            continue

        if "__in" in signal:
            continue

        else:
            assert "__out" in signal

            ni = signal.replace("__out", "__in")

            # channel is marked not at the input, but the output
            signal_to_channel[ni] = c

    return signal_to_channel


def retrieve_information_from_subject_graph_with_anchors(graph: BLIFGraph) -> tuple:
    """Retrieve anchors from a BLIF graph

    >>> MADBuf/SubjectGraph/RetrieveAnchors.py

    Args:
        graph (BLIFGraph): the graph with anchors

    Returns:
        tuple(new graph | signal_to_channel | signals_in_component):
            - new_graph: the graph without anchors, and the anchors are removed from the
                         graph's inputs and outputs
            - signal_to_channel: a dictionary that maps a signal to its channel
            - signals_in_component: a dictionary that maps a component to its signals

    Example:
        >>> network, signal_to_channel, signals_in_component = retrieve_information_from_subject_graph_with_anchors(blif)
    """
    g = retrieve_subject_graph(graph)
    signal_to_channel = retrieve_channels(graph)
    signals_in_component = retrieve_components(graph)

    return g, signal_to_channel, signals_in_component