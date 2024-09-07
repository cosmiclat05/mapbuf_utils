from BlifGraph import *
from find_loop import *

graph: BLIFGraph = read_blif(blif_name)

loop = find_loop(graph)
if loop:
    print("There is a loop in the graph")
    print(loop)

assert find_loop(graph) == None, "There is a loop in the graph"