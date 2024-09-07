#!/bin/bash
input_file="$1"
output_file="$2"
top_module="$3"
yosys -p "read_verilog $input_file;
        hierarchy -check -top $top_module;
        proc;
        opt -nodffe -nosdff;
        memory -nomap;
        techmap;
        flatten;
        clean;
        write_blif $output_file" > /dev/null