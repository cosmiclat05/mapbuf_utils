#!/bin/bash
input_file="$1"
output_file="$2"
abc -c "read_blif $input_file;
        strash;
        if -K 6;
        write_blif $output_file"