from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

# Parse the Verilog file
ast, _ = parse(['./fir.v'])

# Define a node transformer
class MyTransformer(object):
    def visit(self, node):
        if isinstance(node, Wire):
            # Change wire names ending with _ready to _ready_anchor
            if node.name.endswith('_ready'):
                node.name = node.name[:-6] + '_ready_anchor'
        elif isinstance(node, Identifier):
            # Change identifiers (which could be wire references) ending with _ready
            if node.name.endswith('_ready'):
                node.name = node.name[:-6] + '_ready_anchor'
        
        for child in node.children():
            self.visit(child)
        
        return node

# Apply the transformer
transformer = MyTransformer()
modified_ast = transformer.visit(ast)

# Generate modified Verilog code
codegen = ASTCodeGenerator()
modified_code = codegen.visit(modified_ast)

# Write the modified code to a new file
with open('modified_verilog.v', 'w') as f:
    f.write(modified_code)
