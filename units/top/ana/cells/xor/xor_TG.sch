v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 380 -2140 1390 -1700 {flags=graph,unlocked
y1=0
y2=2
ypos1=-0.3
ypos2=1.7
divy=5
subdivy=1
unity=1
x1=0
x2=2e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="VA;va
VB;vb"
color="7 11"
dataset=-1
unitx=1
logx=0
logy=0
rawfile=$netlist_dir/xor_TG.raw
digital=1
autoload=1}
B 2 1510 -2130 2540 -1700 {flags=graph
y1=0
y2=2
ypos1=-0.4
ypos2=1.6
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
color=1
dataset=-1
unitx=1
logx=0
logy=0
rawfile=$netlist_dir/xor_TG.raw
digital=1
autoload=1}
N 1300 -1060 1300 -990 {lab=#net1}
N 1210 -1090 1260 -1090 {lab=VA}
N 1210 -1090 1210 -960 {lab=VA}
N 1210 -960 1260 -960 {lab=VA}
N 1300 -650 1300 -580 {lab=#net2}
N 1210 -680 1260 -680 {lab=VB}
N 1210 -680 1210 -550 {lab=VB}
N 1210 -550 1260 -550 {lab=VB}
N 1700 -1110 1700 -950 {lab=VB}
N 1760 -1110 1760 -950 {lab=Y}
N 1300 -1030 1490 -1030 {lab=#net1}
N 1490 -1240 1490 -1030 {lab=#net1}
N 1490 -1240 1730 -1240 {lab=#net1}
N 1730 -1240 1730 -1150 {lab=#net1}
N 1150 -1030 1210 -1030 {lab=VA}
N 1180 -1030 1180 -840 {lab=VA}
N 1180 -840 1730 -840 {lab=VA}
N 1730 -910 1730 -840 {lab=VA}
N 1170 -610 1210 -610 {lab=VB}
N 1190 -880 1190 -610 {lab=VB}
N 1190 -880 1630 -880 {lab=VB}
N 1630 -1040 1630 -880 {lab=VB}
N 1630 -1040 1700 -1040 {lab=VB}
N 2070 -1120 2070 -960 {lab=#net2}
N 2010 -1120 2010 -960 {lab=Y}
N 1730 -840 2040 -840 {lab=VA}
N 2040 -920 2040 -840 {lab=VA}
N 1730 -1240 2040 -1240 {lab=#net1}
N 2040 -1240 2040 -1160 {lab=#net1}
N 1300 -610 2130 -610 {lab=#net2}
N 2130 -1040 2130 -610 {lab=#net2}
N 2070 -1040 2130 -1040 {lab=#net2}
N 1760 -1040 2010 -1040 {lab=Y}
C {sky130_fd_pr/nfet3_01v8.sym} 1280 -960 0 0 {name=M1
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
C {sky130_fd_pr/pfet3_01v8.sym} 1280 -1090 0 0 {name=M2
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
C {vdd.sym} 1300 -1120 0 0 {name=l1 lab=VDD}
C {gnd.sym} 1300 -930 0 0 {name=l2 lab=GND}
C {sky130_fd_pr/nfet3_01v8.sym} 1280 -550 0 0 {name=M3
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
C {sky130_fd_pr/pfet3_01v8.sym} 1280 -680 0 0 {name=M4
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
C {vdd.sym} 1300 -710 0 0 {name=l3 lab=VDD}
C {gnd.sym} 1300 -520 0 0 {name=l4 lab=GND}
C {ipin.sym} 1150 -1030 0 0 {name=p1 lab=VA}
C {ipin.sym} 1170 -610 0 0 {name=p2 lab=VB}
C {sky130_fd_pr/pfet3_01v8.sym} 1730 -1130 1 0 {name=M5
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
C {sky130_fd_pr/nfet3_01v8.sym} 1730 -930 3 0 {name=M6
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
C {sky130_fd_pr/pfet3_01v8.sym} 2040 -1140 1 0 {name=M7
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
C {sky130_fd_pr/nfet3_01v8.sym} 2040 -940 3 0 {name=M8
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
C {opin.sym} 1890 -1040 3 0 {name=p3 lab=Y}
C {vsource.sym} 380 -680 0 0 {name=VB value="pulse(0 1.8 0 0.1n 0.1n 20n 40n)" savecurrent=false}
C {gnd.sym} 380 -650 0 0 {name=B1 lab=GND}
C {vsource.sym} 380 -820 0 0 {name=VA value="pulse(0 1.8 0 0.1n 0.1n 10n 20n)" savecurrent=false}
C {gnd.sym} 380 -790 0 0 {name=l15 lab=GND}
C {lab_pin.sym} 380 -850 0 0 {name=p5 sig_type=std_logic lab=VA}
C {lab_pin.sym} 380 -710 0 0 {name=p6 sig_type=std_logic lab=VB}
C {devices/code.sym} 320 -1210 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
.lib /usr/local/share/pdk/sky130B/libs.tech/ngspice/sky130.lib.spice tt
.option wnflag=1
"}
C {devices/code.sym} 330 -1030 0 0 {name=STIMULI
only_toplevel=true
place=end
value="
.save v(VA) v(VB) v(Y) 
.tran 0.1n 200n
"}
C {vsource.sym} 380 -520 0 0 {name=VDD value=1.8 savecurrent=true}
C {gnd.sym} 380 -490 0 0 {name=l13 lab=GND}
C {vdd.sym} 380 -550 0 0 {name=l14 lab=VDD}
C {launcher.sym} 440 -1600 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/xor_TG.raw tran"
}
