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

proc selected_tool {tool} {
    puts ""
    puts [color "======================" $::COLOR_BRIGHT_BLUE]
    puts [color "   SELECTED TOOL: $tool" "$::COLOR_BRIGHT_BLUE$::COLOR_BOLD"]
    puts [color "======================" $::COLOR_BRIGHT_BLUE]
    puts ""
}

# ================== Helper Procs ================== #

proc usage {} {
    log_error "Usage: updateEDA <flag>"
    puts "  -x : update xschem          (uses \$XSCHEM_TOP)"
    puts "  -m : update magic           (uses \$MAGIC_TOP)"
    puts "  -y : update yosys           (uses \$YOSYS_TOP)"
    puts "  -i : update icarus/iverilog (uses \$ICARUS_TOP)"
    puts "  -n : update ngspice         (uses \$NGSPICE_TOP)"
    puts "  -p : update open_pdks       (uses \$OPEN_PDKS)"
    puts "  -o : update openlane2       (uses \$OPENLANE)"
    exit 1
}

proc run_cmd {cmd_list} {
    puts ""
    puts [color ">>> [join $cmd_list { }]" $::COLOR_BRIGHT_BLUE]
    if {[catch {eval exec $cmd_list} result]} {
        log_error "!!! Command failed: [join $cmd_list { }]"
        puts "$result"
        exit 1
    } else {
        puts "$result"
    }
}

# Write a modulefile for a versioned tool + update "default"
proc write_modulefile {tool special_config version install_prefix src_dir} {
    set home $::env(HOME)
    set mod_root "$home/modules/eda/$special_config"

    if {![file isdirectory $mod_root]} {
        file mkdir $mod_root
    }

    # Versioned modulefile: ~/modules/eda/<tool>/<version>
    set modfile "$mod_root/$version"
    log_info "Writing $tool modulefile: $modfile"

    set fh [open $modfile "w"]
    puts $fh "#%Module1.0"
    puts $fh "module-whatis \"$tool $version (local build)\""
    puts $fh "set root $install_prefix"
    puts $fh "prepend-path PATH            \$root/bin"

    switch -- $special_config {
        xschem {
            puts $fh "setenv XSCHEM_SHAREDIR       \$root/share/xschem"
            puts $fh "setenv XSCHEM_TOP            $src_dir"
        }
        magic {
            puts $fh "setenv MAGIC_TOP             $src_dir"
        }
        yosys {
            puts $fh "setenv YOSYS_TOP             $src_dir"
        }
        iverilog {
            puts $fh "setenv ICARUS_TOP            $src_dir"
        }
        ngspice {
            puts $fh "setenv NGSPICE_TOP           $src_dir"
        }
        default {
            # nothing extra
        }
    }

    close $fh

    # Default modulefile pointing to latest
    set default_file "$mod_root/default"
    log_info "Updating $tool default modulefile: $default_file"
    set fh [open $default_file "w"]
    puts $fh "#%Module1.0"
    puts $fh "module-whatis \"$tool (default -> $version)\""
    puts $fh "module load $special_config/$version"
    close $fh
}

# ================== Jobs (cores) ================== #

set jobs 1
if {![catch {exec nproc} n]} {
    if {$n > 0} {
        set jobs 1
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
        set needs_sudo 0                 ;# versioned under $HOME
        set special_config "xschem"
    }
    -m {
        set tool "magic"
        if {![::info exists ::env(MAGIC_TOP)]} {
            log_error "Error: MAGIC_TOP is not set in your environment."
            exit 1
        }
        set dir $::env(MAGIC_TOP)
        set version_cmd {magic -version}
        set needs_sudo 0                 ;# versioned under $HOME
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
        set needs_sudo 0
        set special_config "yosys"
    }
    -i {
        set tool "icarus (iverilog)"
        if {![::info exists ::env(ICARUS_TOP)]} {
            log_error "Error: ICARUS_TOP is not set in your environment."
            exit 1
        }
        set dir $::env(ICARUS_TOP)
        set version_cmd {iverilog -V}
        set needs_sudo 0
        set special_config "iverilog"
    }
    -n {
        set tool "ngspice"
        if {![::info exists ::env(NGSPICE_TOP)]} {
            log_error "Error: NGSPICE_TOP is not set in your environment."
            exit 1
        }
        set dir $::env(NGSPICE_TOP)
        set version_cmd {ngspice -v}
        set needs_sudo 0
        set special_config "ngspice"
    }
    -p {
        set tool "open_pdks"
        if {![::info exists ::env(OPEN_PDKS)]} {
            log_error "Error: OPEN_PDKS is not set in your environment."
            exit 1
        }
        set dir $::env(OPEN_PDKS)
        # open_pdks is special; leave non-versioned for now
        set needs_sudo 1
        set special_config "open_pdks"
    }
    -o {
        set tool "openlane2"
        if {![::info exists ::env(OPENLANE)]} {
            log_error "Error: OPENLANE is not set in your environment."
            exit 1
        }
        set dir $::env(OPENLANE)
        set version_cmd {}
        set needs_sudo 0
        set special_config "openlane2"
    }
    default {
        usage
    }
}

selected_tool $tool

if {![file isdirectory $dir]} {
    log_error "Error: $dir is not a directory."
    exit 1
}

cd $dir
log_info "Source directory: $dir"
log_info "Current directory: [pwd]"

# ================== 1. git pull (if git repo) ================== #

set is_git_repo 0
if {![catch {exec git rev-parse --is-inside-work-tree} _]} {
    set is_git_repo 1
}

if {$is_git_repo} {
    puts ""
    puts [color ">>> git pull" $::COLOR_BRIGHT_BLUE]

    if {[catch {exec git pull} git_out]} {
        # git returned non-zero exit, but we still want to see the output
        log_warn "git pull reported a non-zero status, continuing anyway."
        puts "$git_out"
        # DO NOT exit here; maybe it still updated or only gave a warning
    } else {
        puts "$git_out"
        # Only skip rebuild if it is clearly already up to date
        if {[string match "*Already up to date.*" $git_out] || \
            [string match "*Already up-to-date.*" $git_out]} {
            log_warn "$tool is already up to date. No rebuild or install needed. 😁"
            exit 0
        }
    }
} else {
    log_warn "Not a git repository (skipping git pull)."
}
# ================== 2. Special: openlane2 ================== #

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

# ================== 3. Versioned install computation ================== #

set install_prefix ""
set version ""

# Tools we want fully versioned under $HOME/eda
set versioned_tools {xschem magic yosys iverilog ngspice}

if {[lsearch -exact $versioned_tools $special_config] != -1} {
    # Determine version string from git (or fallback to date)
    set version "dev"
    if {$is_git_repo && ![catch {exec git describe --tags --always} v]} {
        set version $v
    } elseif {![catch {exec date +%Y%m%d} d]} {
        set version "dev-$d"
    }

    set home $::env(HOME)
    set install_dirname "${special_config}-installs"
    set install_prefix "$home/eda/$install_dirname/$version"

    log_info "$tool version string: $version"
    log_info "$tool install prefix: $install_prefix"

    # Ensure base dir exists
    set base_dir "$home/eda/$install_dirname"
    if {![file isdirectory $base_dir]} {
        file mkdir $base_dir
    }
}

# ================== 4. configure ================== #

if {[file executable "./configure"]} {
    if {$install_prefix ne ""} {
        # Any versioned tool: configure with computed prefix
        set cfg_cmd [list ./configure "--prefix=$install_prefix"]

        if {$special_config eq "ngspice"} {
            # ngspice typical configure flags
            lappend cfg_cmd "--with-x" "--enable-xspice"
        }

        run_cmd $cfg_cmd
    } elseif {$special_config eq "open_pdks"} {
        # leave open_pdks as system-ish (can refine later)
        run_cmd {./configure}
    } else {
        run_cmd {./configure}
    }
} else {
    log_warn "No ./configure script found, skipping configure step."
}

# ================== 5. make & make install ================== #

if {[file exists "Makefile"] || [file exists "makefile"]} {
    run_cmd [list make "-j$jobs"]

    set install_cmd [list make install]
    if {$needs_sudo} {
        set install_cmd [linsert $install_cmd 0 sudo]
    }
    run_cmd $install_cmd
} else {
    log_warn "No Makefile found, skipping 'make' and 'make install'."
}

# ================== 6. Generate modulefiles for versioned tools ================== #

if {$install_prefix ne "" && $version ne ""} {
    if {[lsearch -exact $versioned_tools $special_config] != -1} {
        write_modulefile $tool $special_config $version $install_prefix $dir
        log_info "Hint: ensure MODULEPATH includes \$HOME/modules/eda"
        log_info "Then you can use:  module load $special_config   or   module load $special_config/$version"
    }
}

# ================== 7. version check ================== #

if {[llength $version_cmd] > 0} {
    log_info "Checking $tool version:"
    run_cmd $version_cmd
} else {
    log_warn "No version command defined for $tool, skipping version check."
}

log_success "Done updating $tool!"
