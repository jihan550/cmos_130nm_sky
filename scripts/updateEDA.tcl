#!/usr/bin/env tclsh

# ================== Helper procs ================== #

proc usage {} {
    puts "Usage: updateEDA <flag>"
    puts "  -x : update xschem          (uses \$XSCHEM_TOP)"
    puts "  -m : update magic           (uses \$MAGIC_TOP)"
    puts "  -y : update yosys           (uses \$YOSYS_TOP)"
    puts "  -i : update icarus/iverilog (uses \$ICARUS_TOP)"
    puts "  -p : update open_pdks       (uses \$OPEN_PDKS)"
    puts "  -o : update openlane2       (uses \$OPENLANE)"
    exit 1
}

proc run_cmd {cmd_list} {
    puts "\n>>> Running: [join $cmd_list { }]"
    if {[catch {eval exec $cmd_list} result]} {
        puts "!!! Command failed: [join $cmd_list { }]"
        puts "Output / error:"
        puts $result
        exit 1
    } else {
        puts $result
    }
}

# Get number of cores (fallback to 1 if nproc not available)
set jobs 1
if {![catch {exec nproc} n]} {
    if {$n > 0} {
        set jobs $n
    }
}

# ================== Arg parsing ================== #

if {$argc != 1} {
    usage
}

set flag [lindex $argv 0]
set tool ""
set dir ""
set version_cmd {}
set needs_sudo 0
set special_config ""

switch -- $flag {
    -x {
        set tool "xschem"
        if {![info exists ::env(XSCHEM_TOP)]} {
            puts "Error: XSCHEM_TOP is not set in your environment."
            exit 1
        }
        set dir $::env(XSCHEM_TOP)
        set version_cmd {xschem -v}
        set needs_sudo 1
        set special_config "xschem"  ;# force --prefix=/usr/local
    }
    -m {
        set tool "magic"
        if {![info exists ::env(MAGIC_TOP)]} {
            puts "Error: MAGIC_TOP is not set in your environment."
            exit 1
        }
        set dir $::env(MAGIC_TOP)
        set version_cmd {magic -version}
        set needs_sudo 1
        set special_config "magic"
    }
    -y {
        set tool "yosys"
        if {![info exists ::env(YOSYS_TOP)]} {
            puts "Error: YOSYS_TOP is not set in your environment."
            exit 1
        }
        set dir $::env(YOSYS_TOP)
        set version_cmd {yosys -V}
        set needs_sudo 1
    }
    -i {
        set tool "icarus (iverilog)"
        if {![info exists ::env(ICARUS_TOP)]} {
            puts "Error: ICARUS_TOP is not set in your environment."
            exit 1
        }
        set dir $::env(ICARUS_TOP)
        set version_cmd {iverilog -V}
        set needs_sudo 1
    }
    -p {
        set tool "open_pdks"
        if {![info exists ::env(OPEN_PDKS)]} {
            puts "Error: OPEN_PDKS is not set in your environment."
            exit 1
        }
        set dir $::env(OPEN_PDKS)
        # leave version_cmd empty
        set needs_sudo 1
    }
    -o {
        set tool "openlane2"
        if {![info exists ::env(OPENLANE)]} {
            puts "Error: OPENLANE is not set in your environment."
            exit 1
        }
        set dir $::env(OPENLANE)
        # set version_cmd {openlane --version} if you have a CLI wrapper
        set version_cmd {}
        set needs_sudo 0
        set special_config "openlane2"
    }
    default {
        usage
    }
}

puts "Selected tool: $tool"
puts "Source directory: $dir"

if {![file isdirectory $dir]} {
    puts "Error: $dir is not a directory."
    exit 1
}

cd $dir
puts "Current directory: [pwd]"

# ================== 1. git pull (if git repo) ================== #

set is_git_repo 0
if {![catch {exec git rev-parse --is-inside-work-tree} _]} {
    set is_git_repo 1
}

if {$is_git_repo} {
    puts "\n>>> Running: git pull"
    if {[catch {exec git pull} git_out]} {
        puts "!!! Command failed: git pull"
        puts "Output / error:"
        puts $git_out
        exit 1
    } else {
        puts $git_out
        # If repo is already up to date, skip rebuild/install for all tools
        if {[string match "*Already up to date.*" $git_out] || \
            [string match "*Already up-to-date.*" $git_out]} {
            puts "\n$tool is already up to date. No rebuild or install needed."
            exit 0
        }
    }
} else {
    puts "Not a git repository (skipping git pull)."
}

# ================== Special case: openlane2 ================== #

if {$special_config eq "openlane2"} {
    # Update submodules (if any)
    if {$is_git_repo} {
        puts "Updating git submodules for openlane2..."
        run_cmd {git submodule update --init --recursive}
    }

    # If it's a Python project, reinstall in editable mode
    if {[file exists "pyproject.toml"] || [file exists "setup.py"]} {
        puts "Detected Python project (pyproject.toml/setup.py)."
        puts "Running 'pip3 install -e .' for openlane2 (no sudo)."
        run_cmd {pip3 install -e .}
    } else {
        puts "No pyproject.toml or setup.py found; skipping pip install for openlane2."
    }

    if {[llength $version_cmd] > 0} {
        puts "\nChecking $tool version:"
        run_cmd $version_cmd
    } else {
        puts "\nNo version command defined for $tool, skipping version check."
    }

    puts "\nDone updating $tool!"
    exit 0
}

# ================== 2. configure (non-openlane2) ================== #

if {[file executable "./configure"]} {
    if {$special_config eq "xschem"} {
        # Force xschem into /usr/local, so binary is /usr/local/bin/xschem
        run_cmd [list ./configure "--prefix=/usr/local"]
    } else {
        run_cmd {./configure}
    }
} else {
    puts "No ./configure script found, skipping configure step."
}

# ===== Special case: magic =====
if {$special_config eq "magic"} {
    # Magic: "./configure" already ran, now exactly what it tells us:
    # "Use 'make' to compile and 'make install' to install."
    run_cmd [list make "-j$jobs"]

    set install_cmd [list make install]
    if {$needs_sudo} {
        set install_cmd [linsert $install_cmd 0 sudo]
    }
    run_cmd $install_cmd

    if {[llength $version_cmd] > 0} {
        puts "\nChecking $tool version:"
        run_cmd $version_cmd
    }

    puts "\nDone updating $tool!"
    exit 0
}

# ================== 3. make (generic for others) ================== #

if {[file exists "Makefile"] || [file exists "makefile"]} {
    run_cmd [list make "-j$jobs"]
} else {
    puts "No Makefile found, skipping 'make' step."
}

# ================== 4. make install (generic for others) ================== #

if {[file exists "Makefile"] || [file exists "makefile"]} {
    set install_cmd [list make install]
    if {$needs_sudo} {
        set install_cmd [linsert $install_cmd 0 sudo]
    }
    run_cmd $install_cmd
} else {
    puts "No Makefile found, skipping 'make install'."
}

# ================== 5. version check ================== #

if {[llength $version_cmd] > 0} {
    puts "\nChecking $tool version:"
    run_cmd $version_cmd
} else {
    puts "\nNo version command defined for $tool, skipping version check."
}

puts "\nDone updating $tool!"
