import os
from retrieve_subject_graph import *
from write_blif import *
from BlifGraph import *

graph: BLIFGraph = read_blif(f"abc_result_anchor.blif")

for signal in graph.pis():
    if "anchors" in signal:
        #remove signal from graph inputs
        graph.inputs.remove(signal)

for signal in graph.pos():
    if "anchors" in signal:
        #remove signal from graph inputs
        graph.outputs.remove(signal)

write_blif(graph, "./unanchored_subject.blif")

def remove_anchors(input_file, output_file):
    with open(input_file, 'r') as f:
        content = f.read()
    
    # Remove _anchors_out and _anchors_in patterns
    modified_content = content.replace('_anchors_out', '').replace('_anchors_in', '')
    
    with open(output_file, 'w') as f:
        f.write(modified_content)

# Use the function
input_file = "./unanchored_subject.blif"
output_file = "abc_result_unanchored.blif"
remove_anchors(input_file, output_file)

print(f"Anchors removed. Unanchored BLIF file saved as {output_file}")


new_graph = retrieve_subject_graph(graph)

write_blif(new_graph, "./unanchored_subject.blif")


import blifparser.blifparser as blifparser

# get the file path and pass it to the parser
filepath = os.path.abspath("abc_result_anchor.blif")
parser = blifparser.BlifParser(filepath)

# get the object that contains the parsed data
# from the parser
blif = parser.blif
