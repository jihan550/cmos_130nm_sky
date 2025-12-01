v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 70 -740 870 -340 {flags=graph
y1=0
y2=2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=2e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="reset
clk"
color="4 4"
dataset=-1
unitx=1
logx=0
logy=0
rawfile=$netlist_dir/untitled.raw
autoload=1
digital=1}
C {counter_4bit.sym} 220 -80 0 0 {}
C {code.sym} 710 -120 0 0 {name=code 
only_toplevel=false 
value=
"
* include sky130 HD standard cell spice models
.include "/home/jihan/eda/open_pdks/sky130/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice"

* include synthesized counter netlist
.include "/home/jihan/projects/units/top/sim/synth/counter_4bit_xschem.spice"

* instantiate the counter (7 pins: clk reset count.0..3 VGND)
XU1 clk reset count.0 count.1 count.2 count.3 0 counter_4bit

* stimulus
VCLK   clk   0  PULSE(0 1.8 0 100p 100p 5n 10n)
VRESET reset 0  PULSE(1.8 0 0 100p 100p 20n 100n)

.tran 0.1n 200n
"}
C {ipin.sym} 370 -130 2 0 {name=p1 lab=clk
}
C {opin.sym} 370 -50 0 0 {name=p3 lab=count.2}
C {opin.sym} 370 -70 0 0 {name=p4 lab=count.1}
C {opin.sym} 370 -30 0 0 {name=p5 lab=count.3
}
C {opin.sym} 370 -90 0 0 {name=p2 lab=count.0}
C {ipin.sym} 370 -110 2 0 {name=p6 lab=reset
}
C {launcher.sym} 180 -280 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/untitled.raw tran"
}
