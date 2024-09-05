#!/bin/bash
input_file="$1"
abc -c "read_blif $input_file;
        strash;
        if -K 6;
        write_blif ./abc_result_anchor.blif"