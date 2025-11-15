v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 280 -2450 1610 -1860 {flags=graph
y1=0
y2=2
ypos1=-0.042162072
ypos2=1.9578379
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
color="7 4"
dataset=-1
unitx=1
logx=0
logy=0
rawfile=$netlist_dir/half_adder_TG.raw
digital=1}
B 2 1800 -2450 3130 -1860 {flags=graph
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
node="CARRY;carry
SUM;sum"
color="8 6"
dataset=-1
unitx=1
logx=0
logy=0
digital=1
autoload=1
rawfile=$netlist_dir/half_adder_TG.raw}
T {AND GATE } 1820 -880 0 0 0.8 0.8 {}
T {XOR GATE [A ? B' : B]
} 1650 -1610 0 0 0.8 0.8 {}
N 1960 -1460 1990 -1460 {lab=VB}
N 1960 -1460 1960 -1320 {lab=VB}
N 1960 -1320 1990 -1320 {lab=VB}
N 2030 -1430 2030 -1350 {lab=Sum}
N 1750 -1420 1750 -1340 {lab=#net1}
N 1680 -1450 1710 -1450 {lab=VA}
N 1680 -1450 1680 -1310 {lab=VA}
N 1680 -1310 1710 -1310 {lab=VA}
N 2300 -1470 2300 -1330 {lab=Sum}
N 2360 -1470 2360 -1330 {lab=VB}
N 1840 -1200 1840 -1170 {lab=VDD}
N 1940 -1170 1940 -1120 {lab=VDD}
N 1740 -1170 1740 -1120 {lab=VDD}
N 1740 -1170 1810 -1170 {lab=VDD}
N 1810 -1170 1940 -1170 {lab=VDD}
N 1740 -1060 1740 -1010 {lab=#net2}
N 1940 -1060 1940 -1010 {lab=#net2}
N 1740 -1010 1740 -950 {lab=#net2}
N 1740 -890 1740 -830 {lab=#net3}
N 1740 -770 1740 -730 {lab=GND}
N 1560 -1090 1700 -1090 {lab=VA}
N 1560 -1090 1560 -810 {lab=VA}
N 1560 -810 1560 -800 {lab=VA}
N 1560 -800 1700 -800 {lab=VA}
N 1840 -1090 1900 -1090 {lab=VB}
N 1840 -1090 1840 -1040 {lab=VB}
N 1630 -1040 1840 -1040 {lab=VB}
N 1630 -1040 1630 -920 {lab=VB}
N 1630 -920 1700 -920 {lab=VB}
N 2100 -1000 2100 -950 {lab=Carry}
N 2030 -1030 2060 -1030 {lab=#net2}
N 2030 -1030 2030 -920 {lab=#net2}
N 2030 -920 2060 -920 {lab=#net2}
N 1980 -990 2030 -990 {lab=#net2}
N 2100 -980 2270 -980 {lab=Carry}
N 1940 -1010 1940 -990 {lab=#net2}
N 1940 -990 1980 -990 {lab=#net2}
N 1740 -990 1940 -990 {lab=#net2}
N 2030 -1290 2030 -1270 {lab=#net1}
N 1750 -1380 1860 -1380 {lab=#net1}
N 1860 -1380 1860 -1270 {lab=#net1}
N 1860 -1270 2030 -1270 {lab=#net1}
N 1580 -1380 1680 -1380 {lab=VA}
N 1610 -1550 1610 -1380 {lab=VA}
N 1610 -1550 2030 -1550 {lab=VA}
N 2030 -1550 2030 -1490 {lab=VA}
N 2030 -1550 2330 -1550 {lab=VA}
N 2330 -1550 2330 -1510 {lab=VA}
N 2030 -1270 2330 -1270 {lab=#net1}
N 2330 -1290 2330 -1270 {lab=#net1}
N 1930 -1390 1960 -1390 {lab=VB}
N 2030 -1390 2300 -1390 {lab=Sum}
N 2360 -1410 2430 -1410 {lab=VB}
N 2430 -1410 2430 -1240 {lab=VB}
N 1930 -1240 2430 -1240 {lab=VB}
N 1930 -1390 1930 -1240 {lab=VB}
N 2030 -1240 2030 -1190 {lab=VB}
N 1870 -1190 2030 -1190 {lab=VB}
N 1870 -1190 1870 -1090 {lab=VB}
N 1610 -1380 1610 -1090 {lab=VA}
C {sky130_fd_pr/pfet3_01v8.sym} 1730 -1450 0 0 {name=M1
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
C {sky130_fd_pr/nfet3_01v8.sym} 1730 -1310 0 0 {name=M2
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
C {vsource.sym} 950 -910 0 0 {name=VB value="pulse(0 1.8 0 0.1n 0.1n 20n 40n)" savecurrent=false}
C {gnd.sym} 950 -880 0 0 {name=B1 lab=GND}
C {vsource.sym} 950 -1050 0 0 {name=VA value="pulse(0 1.8 0 0.1n 0.1n 10n 20n)" savecurrent=false}
C {gnd.sym} 950 -1020 0 0 {name=l15 lab=GND}
C {lab_pin.sym} 950 -1080 0 0 {name=p5 sig_type=std_logic lab=VA}
C {lab_pin.sym} 950 -940 0 0 {name=p6 sig_type=std_logic lab=VB}
C {devices/code.sym} 890 -1440 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
.lib /usr/local/share/pdk/sky130B/libs.tech/ngspice/sky130.lib.spice tt
.option wnflag=1
"}
C {devices/code.sym} 900 -1260 0 0 {name=STIMULI
only_toplevel=true
place=end
value="
.save v(VA) v(VB) v(Sum) v(Carry)
.tran 0.1n 200n
"}
C {sky130_fd_pr/pfet3_01v8.sym} 2010 -1460 0 0 {name=M3
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
C {sky130_fd_pr/nfet3_01v8.sym} 2010 -1320 0 0 {name=M4
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
C {vdd.sym} 1750 -1480 0 0 {name=l1 lab=VDD}
C {gnd.sym} 1750 -1280 0 0 {name=l4 lab=GND}
C {ipin.sym} 1580 -1380 0 0 {name=p1 lab=VA}
C {ipin.sym} 1930 -1390 0 0 {name=p2 lab=VB}
C {sky130_fd_pr/nfet3_01v8.sym} 2330 -1310 3 0 {name=M5
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
C {sky130_fd_pr/pfet3_01v8.sym} 2330 -1490 1 0 {name=M6
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
C {opin.sym} 2170 -1390 3 0 {name=p3 lab=Sum}
C {vdd.sym} 1840 -1200 0 0 {name=l9 lab=VDD}
C {gnd.sym} 1740 -730 0 0 {name=l10 lab=GND}
C {opin.sym} 2270 -980 0 0 {name=p4 lab=Carry}
C {sky130_fd_pr/nfet3_01v8.sym} 1720 -800 0 0 {name=M10
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
C {sky130_fd_pr/nfet3_01v8.sym} 1720 -920 0 0 {name=M15
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
C {sky130_fd_pr/pfet3_01v8.sym} 1720 -1090 0 0 {name=M17
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
C {sky130_fd_pr/pfet3_01v8.sym} 1920 -1090 0 0 {name=M18
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
C {vdd.sym} 2100 -1060 0 0 {name=l11 lab=VDD}
C {gnd.sym} 2100 -890 0 0 {name=l12 lab=GND}
C {sky130_fd_pr/pfet3_01v8.sym} 2080 -1030 0 0 {name=M19
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
C {sky130_fd_pr/nfet3_01v8.sym} 2080 -920 0 0 {name=M20
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
C {launcher.sym} 380 -1710 0 0 {name=h5
descr="load waves (ctrl + lmb)" 
tclcommand="xschem raw_read $netlist_dir/half_adder_TG.raw tran"
}
C {title-2.sym} 140 -230 0 0 {name=l16 author="Author: Jihan" rev=1.0 lock=true
page=1
pages=1
title="Title: Half Adder TG"}
C {vsource.sym} 950 -750 0 0 {name=VDD value=1.8 savecurrent=true}
C {gnd.sym} 950 -720 0 0 {name=l13 lab=GND}
C {vdd.sym} 950 -780 0 0 {name=l14 lab=VDD}
