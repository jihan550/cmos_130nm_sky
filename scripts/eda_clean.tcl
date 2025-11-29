#!/usr/bin/env tclsh
#
# cleanup_installs.tcl
#   Go through *-installs dirs under a root (default: $HOME/eda)
#   and, in each, delete at most ONE old version directory.
#   "Old" means its YYYYMMDD date (in name) != today's date.

# ----- config -----
# Default root where your *-installs dirs live
if {$argc >= 1} {
    set rootDir [lindex $argv 0]
} else {
    if {[info exists ::env(HOME)]} {
        set rootDir [file join $::env(HOME) "eda"]
    } else {
        puts stderr "HOME is not set and no root dir was given."
        exit 1
    }
}

if {![file isdirectory $rootDir]} {
    puts stderr "Root directory '$rootDir' does not exist or is not a directory."
    exit 1
}

set today [clock format [clock seconds] -format "%Y%m%d"]

# Helper: in a single installs dir, delete one old version subdir
proc cleanup_one_installs_dir {installsDir today} {
    # Get all subdirectories (version dirs)
    set kids [glob -nocomplain -types d [file join $installsDir *]]

    if {[llength $kids] == 0} {
        puts "$installsDir: no version directories found, skipping."
        return
    }

    set candidates {}

    foreach d $kids {
        set base [file tail $d]

        # Look for a trailing YYYYMMDD in the name
        # e.g. dev-20251129, v1.2-20251101, etc.
        if {[regexp {([0-9]{8})$} $base -> dateStr]} {
            # Skip today's dir
            if {$dateStr ne $today} {
                # store {date fullpath} as a proper list element
                lappend candidates [list $dateStr $d]
            }
        } else {
            # No date → ignore this dir
            # puts "$installsDir: skipping '$base' (no YYYYMMDD suffix)"
        }
    }

    if {[llength $candidates] == 0} {
        puts "$installsDir: no old-dated dirs to delete (or only today's), skipping."
        return
    }

    # Sort by date (YYYYMMDD string works as integer)
    set sorted [lsort -integer -increasing -index 0 $candidates]

    # Oldest = first element. If you want newest-old, use [lindex $sorted end 1]
    set target [lindex $sorted 0 1]

    puts "$installsDir: deleting old directory: $target"
    file delete -force $target
}

puts "Root: $rootDir"
puts "Today: $today"
puts ""

# Find only *-installs directories directly under rootDir
set pattern [file join $rootDir "*-installs"]
set installsDirs [glob -nocomplain -types d $pattern]

if {[llength $installsDirs] == 0} {
    puts "No *-installs directories found under $rootDir."
    exit 0
}

foreach inst $installsDirs {
    puts "Processing installs dir: $inst"
    cleanup_one_installs_dir $inst $today
    puts ""
}

puts "Done."
