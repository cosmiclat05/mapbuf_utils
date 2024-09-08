import sys
import os
import subprocess
import re
import blifparser.blifparser as blifparser
from blifparser.blifparser import *

from BlifGraph import *
from find_loop import *
from retrieve_anchors import *
from write_blif import *
from cutless import *


def rewriteBlif(inputFile: str, outputFile: str):
    """
    Carmine's code (31.05.2024) 
    """
    with open(inputFile, "r") as f:
        lines = f.readlines()
    with open(outputFile, "w") as f:
        for line in lines:
            line = line.strip()
            if "DFF" in line:
                # Regex pattern to match the C, D, and Q parts
                pattern = r"\b(C|D|Q)=([\w\\\[\]:.$]+)"
                matches = re.findall(pattern, line)
                clock = matches[0][1]
                input = matches[1][1]
                output = matches[2][1]
                line = ".latch {0} {1} re {2} 3".format(input, output, clock)
            f.write(line + "\n")

class VerilogParser:     
    input_file_name = str()
    output_file_name = str()
    top_module_name = str
    input_dict = {} #input name, bit length
    output_dict = {}
    wire_dict = {}
    assign_dict = {}
    lines = []

    anchor_prefix = "__"
    
    def __init__(self, input_file_name, output_file_name):
        self.input_file_name = input_file_name
        self.output_file_name = output_file_name

    def parse_file(self):
        parsing_top = 0
        with open(self.input_file_name, 'r') as file:
            for line in file:
                line = line.strip()
                if line.startswith('//'):
                    continue
                elif line.startswith('module'):
                    parsing_top = 1
                    line = line.strip(',();')
                    words = line.split()
                    self.top_module_name = line.split()[1]
                elif line.startswith('input'): 
                    line = line.strip(',();')
                    words = line.split()
                    if (len(words) == 3): #input [31:0] in;
                        self.input_dict[words[2]] = words[1]
                    else: #input in;
                        self.input_dict[words[1]] = "[0:0]"
                elif line.startswith('output'): 
                    line = line.strip(',();')
                    words = line.split()
                    if (len(words) == 3): #output [31:0] out;
                        self.output_dict[words[2]] = words[1]
                    else: #output out;
                        self.output_dict[words[1]] = "[0:0]"
                elif line.startswith('wire'): 
                    line = line.strip(',();')
                    words = line.split()
                    if (len(words) == 3): #wire [31:0] out;
                        self.wire_dict[words[2]] = words[1] 
                    else: #wire out;
                        self.wire_dict[words[1]] = "[0:0]"
                elif line.startswith('assign'): #assign out = in
                    line = line.strip(',();')
                    words = line.split()
                    self.assign_dict[words[1]] = words[3] 
                else:
                    if (line == ');') and parsing_top == 1:
                        parsing_top = 0
                        continue
                    else:
                        self.lines.append(line)

    def write_file(self):
        with open(self.output_file_name, 'w') as file:
            # Write the top module name as the first line
            file.write(f"module {self.top_module_name}(\n")

            file.write("  // inputs\n")
            for input_name, bit_length in self.input_dict.items():
                if bit_length == "[0:0]":
                    bit_length = ''
                file.write(f"  input {bit_length} {input_name},\n")

            file.write("  // outputs\n")
            for i, (output_name, bit_length) in enumerate(self.output_dict.items()):
                if bit_length == "[0:0]":
                    bit_length = ''
                if i == len(self.output_dict) - 1:
                    file.write(f"  output {bit_length} {output_name}\n")
                else:
                    file.write(f"  output {bit_length} {output_name},\n")

            file.write(");\n")

            for wire_name, bit_length in self.wire_dict.items():
                if bit_length == "[0:0]":
                    bit_length = ''    
                file.write(f"  wire {bit_length} {wire_name};\n")

            file.write("\n  // module outputs\n")

            for assign_name, assign_value in self.assign_dict.items():
                file.write(f"  assign {assign_name} = {assign_value};\n")

            # Write the rest of the lines
            for line in self.lines:
                file.write(line + '\n')


    def insert_anchors(self):
        wires_to_delete = list()
        for wire_name in list(self.wire_dict.keys()):
            if wire_name.endswith('valid'):
                anchor_in = wire_name + f'{self.anchor_prefix}anchors_in'
                anchor_out = wire_name + f'{self.anchor_prefix}anchors_out'
                self.input_dict[anchor_in] = self.wire_dict[wire_name]
                self.output_dict[anchor_out] = self.wire_dict[wire_name]
                wires_to_delete.append(wire_name)
            elif wire_name.endswith('ready'):
                anchor_in = wire_name + f'{self.anchor_prefix}anchors_in'
                anchor_out = wire_name + f'{self.anchor_prefix}anchors_out'
                self.input_dict[anchor_in] = self.wire_dict[wire_name]
                self.output_dict[anchor_out] = self.wire_dict[wire_name]
                wires_to_delete.append(wire_name)
            elif wire_name + '_valid' in self.wire_dict or wire_name + '_ready' in self.wire_dict:
                anchor_in = wire_name + f'{self.anchor_prefix}data_anchors_in'
                anchor_out = wire_name + f'{self.anchor_prefix}data_anchors_out'
                self.input_dict[anchor_in] = self.wire_dict[wire_name]
                self.output_dict[anchor_out] = self.wire_dict[wire_name]
                wires_to_delete.append(wire_name)
            else:
                continue

            input_keywords = ('ins', 'ctrl', 'condition', 'data', 'lhs', 'rhs', 'dataFromMem', 'addrIn')
            output_keywords = ('outs', 'result', 'falseOut', 'trueOut', 'addrOut', 'dataOut', "dataToMem")
            for i, line in enumerate(self.lines):
                if ('mc_load' in line) or ('mc_support' in line) or ('mc_store' in line):
                    continue
                if re.search(r'\b{}\b(?!_)'.format(re.escape(wire_name)), line):
                    words = line.split() 
                    if any(keyword in words[0] for keyword in input_keywords):
                        if wire_name.endswith('ready'):
                            self.lines[i] = line.replace(wire_name, anchor_out)
                        else:
                            self.lines[i] = line.replace(wire_name, anchor_in)
                        
                    elif any(keyword in words[0] for keyword in output_keywords):
                            if wire_name.endswith('ready'):
                                self.lines[i] = line.replace(wire_name, anchor_in)
                            else:
                                self.lines[i] = line.replace(wire_name, anchor_out)
                    elif ('index' in words[0]):
                        if ('control_merge' in line):
                            if wire_name.endswith('ready'):
                                if 'mux' in self.lines[i-3]:
                                    self.lines[i] = line.replace(wire_name, anchor_out)
                                else:
                                    self.lines[i] = line.replace(wire_name, anchor_in)                                
                        else:
                            if wire_name.endswith('ready'):
                                self.lines[i] = line.replace(wire_name, anchor_out)
                            else:
                                self.lines[i] = line.replace(wire_name, anchor_in)

            for key, value in self.assign_dict.items():
                if value == wire_name:
                    if wire_name.endswith('ready'):
                        self.assign_dict[key] = anchor_in
                    else:
                        self.assign_dict[key] = anchor_out


        for wire_name in wires_to_delete:
            del self.wire_dict[wire_name]

 
def main():
    hdl_dir = "./hdl/"
    top_module = "fir"
    filename = f"{top_module}.v"
    module_path = os.path.join(hdl_dir, filename)

    parser = VerilogParser(f"./no_touch_hdl/fir_no_touch.v", module_path)

    parser.parse_file()
    parser.insert_anchors()
    parser.write_file()

    yosys_out_dir = "./yosys_outputs"
    blif_name = "./yosys_blif.blif"
    yosys_out_path = os.path.join(yosys_out_dir, blif_name)
    subprocess.run(["bash", "./tools/scripts/yosys_run.sh", f"{hdl_dir}/*.v", yosys_out_path , top_module], check=True)

    rewriteBlif(yosys_out_path, yosys_out_path)
        
    abc_out_dir = "./abc_outputs"
    abc_result = "./abc_result.blif"
    abc_out_path = os.path.join(abc_out_dir, abc_result)
    subprocess.run(["bash", "./tools/scripts/abc_run.sh", yosys_out_path, abc_out_path], check=True)

    graph: BLIFGraph = read_blif(abc_out_path)

    for signal in graph.pis():
        if "anchors" in signal:
            #remove signal from graph inputs
            graph.inputs.remove(signal)

    for signal in graph.pos():
        if "anchors" in signal:
            #remove signal from graph inputs
            graph.outputs.remove(signal)

    blif_dir = "./removal_blifs"
    unanchored_blif = "unanchored_blif.blif"
    unanchored_blif_path = os.path.join(blif_dir, unanchored_blif)
    write_blif(graph, unanchored_blif_path)

    with open(unanchored_blif_path, 'r') as f:
        content = f.read()
    
    # Remove _anchors_out and _anchors_in patterns
    modified_content = content.replace('__data_anchors_out', '').replace('__data_anchors_in', '')
    modified_content = modified_content.replace('__anchors_out', '').replace('__anchors_in', '')
    
    with open(unanchored_blif_path, 'w') as f:
        f.write(modified_content)
    
    graph: BLIFGraph = read_blif(unanchored_blif_path)

    print(graph.get_nodes())

    cuts = cutless_enumeration_impl(network=graph)

    signal_to_cuts = {}

    for n, cut_list in cuts.items():
        if n not in signal_to_cuts:
            signal_to_cuts[n] = []
        signal_to_cuts[n].extend(cut_list)

    #signal_to_cuts = cleanup_dangling_cuts(signal_to_cuts)
    
    write_cuts(cuts, f"./cuts.txt")

    for n, cut_list in cuts.items():
        print(n)
        print(cut_list)
if __name__ == '__main__':
    main()