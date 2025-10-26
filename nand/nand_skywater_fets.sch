v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 400 -1730 1520 -1290 {flags=graph,private_cursor
y1=-0.17
y2=3.4
ypos1=-0.7055
ypos2=2.8645
divy=5
subdivy=4
unity=1
x1=0
x2=2e-07
divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0
node="VA;va
VB;vb"
dataset=-1
unitx=1
logx=0
logy=0
digital=1
rainbow=1
rawfile=$netlist_dir/nand_skywater_fets.raw
color="7 6"
autoload=1
legend=1}
B 2 1650 -1720 2450 -1320 {flags=graph
y1=-0.17
y2=3.4
ypos1=-0.7055
ypos2=2.8645
divy=5
subdivy=1
unity=1
x1=0
x2=2e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="Y;y"
color=11
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=0
digital=1
autoload=1}
N 1270 -1000 1270 -970 {lab=VDD}
N 1370 -970 1370 -920 {lab=VDD}
N 1170 -970 1170 -920 {lab=VDD}
N 1170 -970 1240 -970 {lab=VDD}
N 1240 -970 1370 -970 {lab=VDD}
N 1170 -860 1170 -810 {lab=Y}
N 1170 -810 1380 -810 {lab=Y}
N 1380 -810 1470 -810 {lab=Y}
N 1370 -860 1370 -810 {lab=Y}
N 1170 -810 1170 -750 {lab=Y}
N 1170 -690 1170 -630 {lab=#net1}
N 990 -890 1130 -890 {lab=VA}
N 990 -890 990 -610 {lab=VA}
N 990 -610 990 -600 {lab=VA}
N 990 -600 1130 -600 {lab=VA}
N 1270 -890 1330 -890 {lab=VB}
N 1270 -890 1270 -840 {lab=VB}
N 1060 -840 1270 -840 {lab=VB}
N 1060 -840 1060 -720 {lab=VB}
N 1060 -720 1130 -720 {lab=VB}
N 1470 -810 1540 -810 {lab=Y}
N 1170 -570 1170 -550 {lab=GND}
C {vdd.sym} 1270 -1000 0 0 {name=l1 lab=VDD}
C {gnd.sym} 1170 -550 0 0 {name=l2 lab=GND}
C {vsource.sym} 600 -870 0 0 {name=Vdd value=3.3 savecurrent=true}
C {gnd.sym} 600 -840 0 0 {name=l3 lab=GND}
C {vdd.sym} 600 -900 0 0 {name=l4 lab=VDD}
C {opin.sym} 1540 -810 0 0 {name=p4 lab=Y}
C {vsource.sym} 600 -760 0 0 {name=VA value="pulse(0 3.3 0 0.1n 0.1n 10n 20n)" savecurrent=false}
C {vsource.sym} 600 -650 0 0 {name=VB value="pulse(0 3.3 0 0.1n 0.1n 20n 40n)" savecurrent=false}
C {gnd.sym} 600 -730 0 0 {name=l6 lab=GND}
C {gnd.sym} 600 -620 0 0 {name=l7 lab=GND}
C {ipin.sym} 600 -790 0 0 {name=p3 lab=VA}
C {ipin.sym} 990 -750 0 0 {name=p5 lab=VA}
C {ipin.sym} 600 -680 0 0 {name=p2 lab=VB}
C {ipin.sym} 1060 -780 0 0 {name=p6 lab=VB}
C {devices/code.sym} 1640 -790 0 0 {name=STIMULI
only_toplevel=true
place=end
value="
.save v(va) v(vb) v(y)
.tran 0.1n 200n
"}
C {devices/code.sym} 1630 -940 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
.lib /usr/local/share/pdk/sky130B/libs.tech/ngspice/sky130.lib.spice tt
.option wnflag=1
"}
C {sky130_fd_pr/nfet3_01v8.sym} 1150 -600 0 0 {name=M4
W=1
L=0.15
body=GND
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet3_01v8.sym} 1150 -720 0 0 {name=M3
W=1
L=0.15
body=GND
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} 1150 -890 0 0 {name=M2
W=1
L=0.15
body=VDD
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} 1350 -890 0 0 {name=M5
W=1
L=0.15
body=VDD
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {title-3.sym} 0 0 0 0 {name=l5 
author="Author: Jihan" 
title="TITLE: NAND SKYWATER FETS" 
page=1
pages=1
rev=1.0 
lock=true}
C {launcher.sym} 140 -1380 0 0 {name=h5
descr="load waves (ctrl+lmb)"
tclcommand="xschem raw_read $netlist_dir/nand_skywater_fets.raw tran"}
