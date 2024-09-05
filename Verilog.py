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
        pass




hdl_dir = "./hdl/"
filename = "fir.v"
blif_name = "./yosys_blif_anchor.blif"

module_path = os.path.join(hdl_dir, filename)

parser = VerilogParser(module_path, module_path)
parser.parse_file()
parser.write_file()

subprocess.run(["bash", "yosys_run.sh", "./hdl/*.v", blif_name], check=True)

rewriteBlif(blif_name, blif_name)

# get the file path and pass it to the parser
filepath = os.path.abspath(blif_name)
parser = blifparser.BlifParser(filepath)



subprocess.run(["bash", "abc_run.sh", blif_name], check=True)




