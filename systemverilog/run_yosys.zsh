#!/usr/bin/env zsh
set -e

LIB="/home/jihan/eda/open_pdks/sky130/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib"

yosys -D LIB="$LIB" -s synth_fsm.ys
