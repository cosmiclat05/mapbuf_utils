#!/bin/bash
input_file="$1"
output_file="$2"
yosys -p "read_verilog $input_file;
        hierarchy -check -top fir;
        proc;
        opt -nodffe -nosdff;
        memory -nomap;
        techmap;
        flatten;
        clean;
        write_blif $output_file" > /dev/null