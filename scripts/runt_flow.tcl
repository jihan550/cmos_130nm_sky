#!/usr/bin/env tclsh
#
# Usage (new style):
#   ./run_flow.tcl t=<rtl1.sv rtl2.sv ...> tb=<tb.sv> f=<output_dir>
#
# Examples:
#   # RTL sim + Yosys synth
#   ./run_flow.tcl \
#       t=rtl/counter_4bit.sv \
#       tb=testbench/tb_counter_4bit.sv \
#       f=build/counter_4bit
#
#   # Yosys only (no RTL sim)
#   ./run_flow.tcl \
#       t=rtl/counter_4bit.sv \
#       f=build/counter_4bit
#
# Conventions:
#   - Top RTL module name = basename of first RTL file (e.g. counter_4bit.sv -> counter_4bit)
#   - Testbench top module = basename of TB file (e.g. tb_counter_4bit.sv -> tb_counter_4bit)
#
# Optional (recommended for SPICE / techmapping to sky130):
#   export SKY130_HD_TT="~/eda/open_pdks/sky130/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib"
#

# ============================================================
# Command Line Argument Parsing (t= tb= f= style)
# ============================================================

set rtl_files {}
set tb_file ""
set out_dir ""

set i 0
while {$i < $argc} {
    set arg [lindex $argv $i]

    # Match key=value pattern
    if {[regexp {^([^=]+)=(.*)$} $arg -> key val]} {
        switch -- $key {
            "t" {
                # First value after t=...
                if {$val ne ""} {
                    lappend rtl_files $val
                }
                # Also collect following args that don't look like key=...
                incr i
                while {$i < $argc} {
                    set next_arg [lindex $argv $i]
                    if {[regexp {^[^=]+=} $next_arg]} {
                        incr i -1
                        break
                    }
                    lappend rtl_files $next_arg
                    incr i
                }
            }
            "tb" {
                set tb_file $val
            }
            "f" {
                set out_dir $val
            }
            default {
                puts "Unknown option key: $key"
                puts "Usage: $argv0 t=<rtl1.sv rtl2.sv ...> tb=<tb.sv> f=<output_folder>"
                exit 1
            }
        }
    } else {
        puts "Unknown argument format: $arg"
        puts "Usage: $argv0 t=<rtl1.sv rtl2.sv ...> tb=<tb.sv> f=<output_folder>"
        exit 1
    }

    incr i
}

if {$rtl_files eq {} || $out_dir eq ""} {
    puts "ERROR: Missing required arguments."
    puts "Usage: $argv0 t=<rtl1.sv rtl2.sv ...> tb=<tb.sv> f=<output_folder>"
    puts "Note: tb= is optional. If omitted, RTL sim is skipped and only Yosys synth runs."
    exit 1
}

# ============================================================
# Normalize paths to avoid relative-path headaches
# ============================================================

set norm_rtl_files {}
foreach f $rtl_files {
    lappend norm_rtl_files [file normalize $f]
}
set rtl_files $norm_rtl_files

if {$tb_file ne ""} {
    set tb_file [file normalize $tb_file]
}

set out_dir  [file normalize $out_dir]

# Design name = basename of first RTL file (no extension)
set first_rtl   [lindex $rtl_files 0]
set design_name [file rootname [file tail $first_rtl]]

# Assume top module names by convention
set rtl_top $design_name

# If TB is provided, assume TB top = basename of tb file
if {$tb_file ne ""} {
    set tb_top [file rootname [file tail $tb_file]]
} else {
    set tb_top ""
}

# ============================================================
# Directories
# ============================================================

set sim_dir    "$out_dir/sim"

# design-specific synth directory
set synth_root "$out_dir/synth"
set synth_dir  "$synth_root/$design_name"

file mkdir $out_dir
file mkdir $sim_dir
file mkdir $synth_root
file mkdir $synth_dir

# cleanup old ana/rtl dirs under out_dir if they exist
if {[file exists "$out_dir/ana"]} {
    file delete -force "$out_dir/ana"
}
if {[file exists "$out_dir/rtl"]} {
    file delete -force "$out_dir/rtl"
}

set sim_exe  "${design_name}_simv"
set vcd_file "${design_name}_tb.vcd"


# ============================================================
# Helper Function
# ============================================================

proc run_cmd {cmd} {
    puts ">>> $cmd"
    flush stdout
    if {[catch {eval exec $cmd} result]} {
        puts "!! ERROR: $result"
        exit 1
    } else {
        puts $result
    }
}

# ============================================================
# 1. RTL SIMULATION (optional, only if tb_file is given)
# ============================================================

if {$tb_file ne ""} {
    puts "\n===== RTL SIMULATION ====="
    puts "RTL Files : $rtl_files"
    puts "Testbench : $tb_file"
    puts "Top TB    : $tb_top"

    # Build iverilog command
    set compile_cmd [concat \
        iverilog -g2012 \
        -o "$sim_dir/$sim_exe" \
        -s $tb_top \
        $rtl_files $tb_file]

    run_cmd $compile_cmd

    set cwd [pwd]
    cd $sim_dir

    run_cmd "vvp $sim_exe"

    if {[file exists $vcd_file]} {
        run_cmd "gtkwave $vcd_file &"
    } else {
        puts "!! WARNING: $vcd_file not found."
        puts "   Did your testbench call: \$dumpfile(\"$vcd_file\"); ?"
    }

    cd $cwd
} else {
    puts "\n===== RTL SIMULATION SKIPPED ====="
    puts "No tb=... provided; skipping iverilog/vvp and going straight to Yosys."
}

# ============================================================
# 2. YOSYS SYNTHESIS + SPICE FOR XSCHEM
# ============================================================

puts "\n===== YOSYS SYNTHESIS ====="

set yosys_script "$synth_dir/synth.ys"
set yosys_out_v  "$synth_dir/${design_name}_synth.v"
set yosys_out_j  "$synth_dir/${design_name}.json"
set yosys_out_sp "$synth_dir/${design_name}_xschem.spice"

# Get SKY130 lib path from env variable
set have_sky130 0
if {[info exists ::env(SKY130_HD_TT)]} {
    set sky130_lib $::env(SKY130_HD_TT)
    set have_sky130 1
    puts "Using SKY130 lib: $sky130_lib"
} else {
    puts "NOTE: SKY130_HD_TT not set; synthesis will not be tech-mapped to sky130_fd_sc_hd."
}

set fh [open $yosys_script "w"]

# Join RTL files into a single space-separated string
set rtl_files_str [join $rtl_files " "]

puts $fh "# Auto-generated by run_flow.tcl"
puts $fh "read_verilog -sv $rtl_files_str"
puts $fh "hierarchy -check -top $rtl_top"
puts $fh "proc; opt; fsm; opt; techmap; opt"


if {$have_sky130} {
    puts $fh "read_liberty -lib $sky130_lib"
    puts $fh "dfflibmap -liberty $sky130_lib"
    puts $fh "abc       -liberty $sky130_lib"
}

puts $fh "synth -top $rtl_top"
puts $fh "opt_clean"
puts $fh "stat"

puts $fh "write_verilog $yosys_out_v"
puts $fh "write_json    $yosys_out_j"

# SPICE netlist (for xschem/ngspice)
puts $fh "write_spice -top $rtl_top -inames -pos VPWR -neg VGND $yosys_out_sp"

close $fh

run_cmd "yosys -s $yosys_script"

# ============================================================
# 3. Post-process SPICE: wrap in .subckt/.ends for xschem
#    (generic: derive pin list from SPICE nets)
# ============================================================

if {[file exists $yosys_out_sp]} {
    # Read original SPICE as one big string
    set fh_in [open $yosys_out_sp r]
    set spice_text [read $fh_in]
    close $fh_in

    # Split into lines for pin analysis
    set spice_lines [split $spice_text "\n"]

    # ---- Collect candidate top-level pins from net names ----
    array unset pin_seen
    set pin_set {}

    foreach line $spice_lines {
        set trimmed [string trim $line]

        # Only look at instance and source lines
        if {![string match {X*} $trimmed] && ![string match {V*} $trimmed]} {
            continue
        }

        set tokens [split $trimmed " \t"]
        set ntokens [llength $tokens]
        if {$ntokens < 3} { continue }

        set instname [lindex $tokens 0]

        # For V* sources: Vname net1 net2 [DC value]
        if {[string match {V*} $instname]} {
            # nets ~ tokens[1..ntokens-3]  (drop DC + value)
            set nets [lrange $tokens 1 [expr {$ntokens-3}]]
        } else {
            # For X* instances: Xname net... celltype
            # nets ~ tokens[1..ntokens-2]
            set nets [lrange $tokens 1 [expr {$ntokens-2}]]
        }

        foreach n $nets {
            set n_trim [string trim $n]
            if {$n_trim eq ""} continue
            if {$n_trim eq "0"} continue           ;# pure ground

            # Skip obvious Yosys internal nets
            if {[string match "_abc_*" $n_trim]} continue
            if {[string match "_techmap_*" $n_trim]} continue

            if {![info exists pin_seen($n_trim)]} {
                set pin_seen($n_trim) 1
                lappend pin_set $n_trim
            }
        }
    }

    # ---- Classify pins for nicer ordering ----
    set clk_pins {}
    set rst_pins {}
    set supply_pins {}
    set other_pins {}

    foreach p $pin_set {
        set lower [string tolower $p]

        if {[regexp {^clk} $lower]} {
            lappend clk_pins $p
        } elseif {[regexp {^(rst|reset)} $lower]} {
            lappend rst_pins $p
        } elseif {[lsearch -nocase {vdd vss vdda vssa vpwr vgnd vccd1 vssd1} $lower] != -1} {
            lappend supply_pins $p
        } else {
            lappend other_pins $p
        }
    }

    # Final pin order: clk, reset, others, supplies
    set pin_list [concat $clk_pins $rst_pins $other_pins $supply_pins]

    # ---- Rewrite SPICE file with .subckt wrapper ----

    # Use first line as the original header comment, rest as body
    if {[llength $spice_lines] > 0} {
        set firstline [lindex $spice_lines 0]
        set body_lines [lrange $spice_lines 1 end]
    } else {
        set firstline ""
        set body_lines {}
    }

    set fh_out [open $yosys_out_sp w]

    # Keep original first line (usually Yosys comment)
    if {[string trim $firstline] ne ""} {
        puts $fh_out $firstline
    }

    # Add subckt header
    puts $fh_out ".subckt $rtl_top [join $pin_list " "]"

    # Dump the original body, but strip old decorative footer lines
    foreach line $body_lines {
        set trimmed [string trim $line]
        if {$trimmed eq "************************"} continue
        if {$trimmed eq "* end of SPICE netlist *"} continue

        puts $fh_out $line
    }

    # Close the subckt and add a single footer
    puts $fh_out ".ends $rtl_top"
    puts $fh_out "************************"
    puts $fh_out "* end of SPICE netlist *"
    puts $fh_out "************************"

    close $fh_out

} else {
    puts "!! WARNING: SPICE file $yosys_out_sp not found; skipping .subckt wrapping."
}

puts "\n===== DONE ====="
puts "Simulation output : $sim_dir"
puts "Synthesis output  : $synth_dir"
puts "SPICE for xschem  : $yosys_out_sp"
