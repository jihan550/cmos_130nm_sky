#!/usr/bin/env tclsh

# ================== Color Helpers ================== #
# ANSI color codes (Tcl-safe: brackets escaped)
set COLOR_RESET  "\033\[0m"
set COLOR_RED    "\033\[31m"
set COLOR_GREEN  "\033\[32m"
set COLOR_YELLOW "\033\[33m"
set COLOR_BLUE   "\033\[34m"
set COLOR_MAG    "\033\[35m"
set COLOR_CYAN   "\033\[36m"
set COLOR_BOLD   "\033\[1m"
set COLOR_AMBER  "\033\[93m"  
set COLOR_BRIGHT_CYAN "\033\[96m" 
set COLOR_MAGENTA "\033\[95m"
set COLOR_BRIGHT_BLUE "\033\[94m"
set COLOR_BRIGHT_RED "\033\[91m"

proc color {txt clr} {
    return "${clr}${txt}\033\[0m"
}

proc log_info {msg} {
    puts [color $msg $::COLOR_BRIGHT_CYAN]
}
proc log_success {msg} {
    puts [color $msg $::COLOR_GREEN]
}
proc log_warn {msg} {
    puts [color $msg $::COLOR_AMBER]
}
proc log_error {msg} {
    puts [color $msg $::COLOR_BRIGHT_RED]
}

# ================== Helper Procs ================== #

proc usage {} {
    log_error "Usage: updateEDA <flag>"
    puts "  -x : update xschem          (uses \$XSCHEM_TOP)"
    puts "  -m : update magic           (uses \$MAGIC_TOP)"
    puts "  -y : update yosys           (uses \$YOSYS_TOP)"
    puts "  -i : update icarus/iverilog (uses \$ICARUS_TOP)"
    puts "  -p : update open_pdks       (uses \$OPEN_PDKS)"
    puts "  -o : update openlane2       (uses \$OPENLANE)"
    exit 1
}

proc run_cmd {cmd_list} {
    puts ""
    puts [color ">>> [join $cmd_list { }]" $::COLOR_BLUE]
    if {[catch {eval exec $cmd_list} result]} {
        log_error "!!! Command failed: [join $cmd_list { }]"
        puts "$result"
        exit 1
    } else {
        puts "$result"
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
        if {![::info exists ::env(XSCHEM_TOP)]} {
            log_error "Error: XSCHEM_TOP is not set in your environment."
            exit 1
        }
        set dir $::env(XSCHEM_TOP)
        set version_cmd {xschem -v}
        set needs_sudo 1
        set special_config "xschem"  ;# force --prefix=/usr/local
    }
    -m {
        set tool "magic"
        if {![::info exists ::env(MAGIC_TOP)]} {
            log_error "Error: MAGIC_TOP is not set in your environment."
            exit 1
        }
        set dir $::env(MAGIC_TOP)
        set version_cmd {magic -version}
        set needs_sudo 1
        set special_config "magic"
    }
    -y {
        set tool "yosys"
        if {![::info exists ::env(YOSYS_TOP)]} {
            log_error "Error: YOSYS_TOP is not set in your environment."
            exit 1
        }
        set dir $::env(YOSYS_TOP)
        set version_cmd {yosys -V}
        set needs_sudo 1
    }
    -i {
        set tool "icarus (iverilog)"
        if {![::info exists ::env(ICARUS_TOP)]} {
            log_error "Error: ICARUS_TOP is not set in your environment."
            exit 1
        }
        set dir $::env(ICARUS_TOP)
        set version_cmd {iverilog -V}
        set needs_sudo 1
    }
    -p {
        set tool "open_pdks"
        if {![::info exists ::env(OPEN_PDKS)]} {
            log_error "Error: OPEN_PDKS is not set in your environment."
            exit 1
        }
        set dir $::env(OPEN_PDKS)
        # leave version_cmd empty
        set needs_sudo 1
    }
    -o {
        set tool "openlane2"
        if {![::info exists ::env(OPENLANE)]} {
            log_error "Error: OPENLANE is not set in your environment."
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

log_info "Selected tool: $tool"
log_info "Source directory: $dir"

if {![file isdirectory $dir]} {
    log_error "Error: $dir is not a directory."
    exit 1
}

cd $dir
log_info "Current directory: [pwd]"

# ================== 1. git pull (if git repo) ================== #

set is_git_repo 0
if {![catch {exec git rev-parse --is-inside-work-tree} _]} {
    set is_git_repo 1
}

if {$is_git_repo} {
    puts ""
    puts [color ">>> git pull" $::COLOR_BLUE]
    if {[catch {exec git pull} git_out]} {
        log_error "!!! Command failed: git pull"
        puts "$git_out"
        exit 1
    } else {
        puts "$git_out"
        # If repo is already up to date, skip rebuild/install for all tools
        if {[string match "*Already up to date.*" $git_out] || \
            [string match "*Already up-to-date.*" $git_out]} {
            log_warn "$tool is already up to date. No rebuild or install needed 😁"
            exit 0
        }
    }
} else {
    log_warn "Not a git repository (skipping git pull)."
}

# ================== Special case: openlane2 ================== #

if {$special_config eq "openlane2"} {
    if {$is_git_repo} {
        log_info "Updating git submodules for openlane2..."
        run_cmd {git submodule update --init --recursive}
    }

    if {[file exists "pyproject.toml"] || [file exists "setup.py"]} {
        log_info "Detected Python project (pyproject.toml/setup.py)."
        log_info "Running 'pip3 install -e .' for openlane2 (no sudo)."
        run_cmd {pip3 install -e .}
    } else {
        log_warn "No pyproject.toml or setup.py found; skipping pip install for openlane2."
    }

    if {[llength $version_cmd] > 0} {
        log_info "Checking $tool version:"
        run_cmd $version_cmd
    } else {
        log_warn "No version command defined for $tool, skipping version check."
    }

    log_success "Done updating $tool!"
    exit 0
}

# ================== 2. configure (non-openlane2) ================== #

if {[file executable "./configure"]} {
    if {$special_config eq "xschem"} {
        # xschem -> force /usr/local
        run_cmd [list ./configure "--prefix=/usr/local"]
    } else {
        run_cmd {./configure}
    }
} else {
    log_warn "No ./configure script found, skipping configure step."
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
        log_info "Checking $tool version:"
        run_cmd $version_cmd
    }

    log_success "Done updating $tool!"
    exit 0
}

# ================== 3. make (generic for others) ================== #

if {[file exists "Makefile"] || [file exists "makefile"]} {
    run_cmd [list make "-j$jobs"]
} else {
    log_warn "No Makefile found, skipping 'make' step."
}

# ================== 4. make install (generic for others) ================== #

if {[file exists "Makefile"] || [file exists "makefile"]} {
    set install_cmd [list make install]
    if {$needs_sudo} {
        set install_cmd [linsert $install_cmd 0 sudo]
    }
    run_cmd $install_cmd
} else {
    log_warn "No Makefile found, skipping 'make install'."
}

# ================== 5. version check ================== #

if {[llength $version_cmd] > 0} {
    log_info "Checking $tool version:"
    run_cmd $version_cmd
} else {
    log_warn "No version command defined for $tool, skipping version check."
}

log_success "Done updating $tool!"
