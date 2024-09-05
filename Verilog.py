import re
import subprocess
import os
from blifparser import blifparser


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
            if wire_name.endswith('valid') or wire_name.endswith('ready'):
                anchor_in = wire_name + '_anchors_in'
                anchor_out = wire_name + '_anchors_out'
                self.input_dict[anchor_in] = self.wire_dict[wire_name]
                self.output_dict[anchor_out] = self.wire_dict[wire_name]
                wires_to_delete.append(wire_name)
            elif wire_name + '_valid' in self.wire_dict or wire_name + '_ready' in self.wire_dict:
                anchor_in = wire_name + '_anchors_in'
                anchor_out = wire_name + '_anchors_out'
                self.input_dict[anchor_in] = self.wire_dict[wire_name]
                self.output_dict[anchor_out] = self.wire_dict[wire_name]
                wires_to_delete.append(wire_name)
            else:
                continue

            input_keywords = ('ins', 'ctrl', 'condition', 'data', 'lhs', 'rhs', 'dataFromMem', 'addrIn')
            output_keywords = ('outs', 'result', 'falseOut', 'trueOut', 'addrOut', 'dataOut')
            for i, line in enumerate(self.lines):
                if ('mc_load' in line) or ('mc_support' in line):
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
                                self.lines[i] = line.replace(wire_name, anchor_in)
                            else:
                                self.lines[i] = line.replace(wire_name, anchor_out)
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



hdl_dir = "./"
filename = "fir_no_touch.v"
module_path = os.path.join(hdl_dir, filename)

parser = VerilogParser(module_path, "./hdl/fir.v")
parser.parse_file()
parser.insert_anchors()
parser.write_file()

blif_name = "./yosys_blif_anchor.blif"
subprocess.run(["bash", "yosys_run.sh", "./hdl/*.v", blif_name], check=True)

rewriteBlif(blif_name, blif_name)

# get the file path and pass it to the parser
filepath = os.path.abspath(blif_name)
#parser = blifparser.BlifParser(filepath)

subprocess.run(["bash", "abc_run.sh", blif_name], check=True)




