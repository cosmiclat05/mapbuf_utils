# import the os library: useful to get the absolute path to the input file
import os
# import this library
#import blifparser.blifparser as blifparser
from blifparser import blifparser

# get the file path and pass it to the parser
filepath = os.path.abspath("yosys_blif.blif")
parser = blifparser.BlifParser(filepath)

# get the object that contains the parsed data
# from the parser
blif = parser.blif

# # get the name of the model
# print(blif.model.name)

# # get the list of the inputs
# print(blif.inputs.inputs)

# # get the list of the outputs
# print(blif.outputs.outputs)

# # get the list of .search keyword
# print(blif.imports)

# # get the imported file name/path of the first .search keyword
# first_import = blif.imports[0]
# print(first_import.filepath)

# # get the list of subcircuits (.subckt)
# print(blif.subcircuits)

# # get data from the first subcircuit definition
# first_subcircuit = blif.subcircuits[0]
# print(first_subcircuit.modelname)  # name of the model
# print(first_subcircuit.params)     # subcircuit's parameters

# # get the list of boolean functions (.names)
# print(blif.booleanfunctions)

# # get data from the first boolean function definition
# first_boolfunc = blif.booleanfunctions[0]
# print(first_boolfunc.inputs)      # list with the names of the inputs
# print(first_boolfunc.output)      # string with the name of the output
# print(first_boolfunc.truthtable)  # list of lists (each row is a truth table row)

# # get the dictionary with the number of occurrencies of each keyword
# print(blif.nkeywords)

# # get the list of problems/issues
# print(blif.problems)

# # get the list of the latches
# print(blif.latches)

# # get the data of the first latch
# first_latch = blif.latches[0]
# print(first_latch.input)    # name of the input
# print(first_latch.output)   # name of the output
# print(first_latch.type)     # type of latch (like "re", ...)
# print(first_latch.control)  # clock name
# print(first_latch.initval)  # initial value

# # get the data of the FSM (Finite State Machine)
# print(blif.fsm.i.num)       # number of inputs
# print(blif.fsm.o.num)       # number of outputs
# print(blif.fsm.s.num)       # number of states
# print(blif.fsm.p.num)       # number of state transitions
# print(blif.fsm.r.name)      # name of the reset state
# print(blif.fsm.transtable)  # list of lists (contains the transition table)