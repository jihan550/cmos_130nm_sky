v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S { title: ="Inputs" }
F {}
E {}
B 2 510 -2570 1660 -2090 {flags=graph,private_cursor
y1=0
y2=2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=1.6543612e-24
x2=2e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="VB;vb
VA;va"
color="4 7"
dataset=-1
unitx=1
logx=0
logy=0
digital=1
autoload=1
sim_type=table}
B 2 1750 -2570 2920 -2090 {flags=graph,private_cursor
y1=-0.8
y2=1.2
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
node="Carry;carry
Sum;sum"
color="8 6"
dataset=-1
unitx=1
logx=0
logy=0
digital=1
autoload=1}
T {XOR GATE [SOP: (A'B) + (AB')]
} 1780 -1870 0 0 0.8 0.8 {}
T {AND GATE } 2050 -660 0 0 0.8 0.8 {}
T {A} 1700 -1620 0 0 0.4 0.4 {}
T {A} 2170 -1590 0 0 0.4 0.4 {}
T {A} 2440 -1360 0 0 0.4 0.4 {}
T {A'} 2170 -1710 0 0 0.4 0.4 {}
T {A'} 2170 -1400 0 0 0.4 0.4 {}
T {B'} 2440 -1270 0 0 0.4 0.4 {}
T {B} 1700 -1350 0 0 0.4 0.4 {}
T {B} 2390 -1710 0 0 0.4 0.4 {}
T {B} 2170 -1280 0 0 0.4 0.4 {}
T {B'} 2380 -1560 0 0 0.4 0.4 {}
T {PDN} 2430 -1150 0 0 0.4 0.4 {}
T {PUN} 2370 -1770 0 0 0.4 0.4 {}
T {B} 2090 -910 0 0 0.4 0.4 {}
T {B} 1910 -690 0 0 0.4 0.4 {}
T {A} 1900 -900 0 0 0.4 0.4 {}
T {A} 1910 -610 0 0 0.4 0.4 {}
T {PUN} 1990 -990 0 0 0.4 0.4 {}
T {PDN} 1910 -770 0 0 0.4 0.4 {}
N 1920 -1610 1920 -1560 {lab=#net1}
N 1850 -1640 1880 -1640 {lab=VA}
N 1850 -1640 1850 -1530 {lab=VA}
N 1850 -1530 1880 -1530 {lab=VA}
N 1800 -1590 1850 -1590 {lab=VA}
N 1920 -1340 1920 -1290 {lab=#net2}
N 1850 -1370 1850 -1260 {lab=VB}
N 1850 -1260 1880 -1260 {lab=VB}
N 1800 -1320 1850 -1320 {lab=VB}
N 2240 -1650 2240 -1590 {lab=#net3}
N 1920 -1590 2020 -1590 {lab=#net1}
N 2020 -1680 2020 -1590 {lab=#net1}
N 2020 -1680 2200 -1680 {lab=#net1}
N 1820 -1590 1820 -1460 {lab=VA}
N 1820 -1460 2170 -1460 {lab=VA}
N 2240 -1730 2240 -1710 {lab=VDD}
N 2240 -1730 2370 -1730 {lab=VDD}
N 2310 -1760 2310 -1730 {lab=VDD}
N 2370 -1730 2450 -1730 {lab=VDD}
N 2450 -1730 2450 -1710 {lab=VDD}
N 2450 -1650 2450 -1590 {lab=#net3}
N 2240 -1620 2450 -1620 {lab=#net3}
N 1920 -1320 2410 -1320 {lab=#net2}
N 2410 -1560 2410 -1320 {lab=#net2}
N 1820 -1440 1820 -1320 {lab=VB}
N 1820 -1440 2370 -1440 {lab=VB}
N 2370 -1680 2370 -1440 {lab=VB}
N 2370 -1680 2410 -1680 {lab=VB}
N 2240 -1490 2450 -1490 {lab=#net4}
N 2450 -1530 2450 -1490 {lab=#net4}
N 2450 -1490 2580 -1490 {lab=#net4}
N 2700 -1500 2700 -1450 {lab=Sum}
N 2630 -1530 2660 -1530 {lab=#net4}
N 2630 -1530 2630 -1420 {lab=#net4}
N 2630 -1420 2660 -1420 {lab=#net4}
N 2580 -1490 2630 -1490 {lab=#net4}
N 2700 -1480 2870 -1480 {lab=Sum}
N 2250 -1400 2500 -1400 {lab=#net4}
N 2250 -1340 2250 -1280 {lab=#net5}
N 2500 -1340 2500 -1270 {lab=#net6}
N 2320 -1490 2320 -1400 {lab=#net4}
N 2110 -1680 2110 -1370 {lab=#net1}
N 2110 -1370 2210 -1370 {lab=#net1}
N 2170 -1460 2430 -1460 {lab=VA}
N 2430 -1460 2430 -1370 {lab=VA}
N 2430 -1370 2460 -1370 {lab=VA}
N 1820 -1320 1820 -1170 {lab=VB}
N 1820 -1170 2170 -1170 {lab=VB}
N 2170 -1250 2170 -1170 {lab=VB}
N 2170 -1250 2210 -1250 {lab=VB}
N 2380 -1320 2380 -1240 {lab=#net2}
N 2380 -1240 2460 -1240 {lab=#net2}
N 2250 -1220 2250 -1170 {lab=GND}
N 2250 -1170 2500 -1170 {lab=GND}
N 2500 -1210 2500 -1170 {lab=GND}
N 1820 -1740 1820 -1590 {lab=VA}
N 1820 -1740 2140 -1740 {lab=VA}
N 2140 -1740 2140 -1560 {lab=VA}
N 2140 -1560 2200 -1560 {lab=VA}
N 2380 -1170 2380 -1150 {lab=GND}
N 2240 -1530 2240 -1490 {lab=#net4}
N 1850 -1370 1880 -1370 {lab=VB}
N 2070 -980 2070 -950 {lab=VDD}
N 2170 -950 2170 -900 {lab=VDD}
N 1970 -950 1970 -900 {lab=VDD}
N 1970 -950 2040 -950 {lab=VDD}
N 2040 -950 2170 -950 {lab=VDD}
N 1970 -840 1970 -790 {lab=#net7}
N 2170 -840 2170 -790 {lab=#net7}
N 1970 -790 1970 -730 {lab=#net7}
N 1970 -670 1970 -610 {lab=#net8}
N 1970 -550 1970 -510 {lab=GND}
N 1790 -870 1930 -870 {lab=VA}
N 1790 -870 1790 -590 {lab=VA}
N 1790 -590 1790 -580 {lab=VA}
N 1790 -580 1930 -580 {lab=VA}
N 2070 -870 2130 -870 {lab=VB}
N 2070 -870 2070 -820 {lab=VB}
N 1860 -820 2070 -820 {lab=VB}
N 1860 -820 1860 -700 {lab=VB}
N 1860 -700 1930 -700 {lab=VB}
N 2330 -780 2330 -730 {lab=Carry}
N 2260 -810 2290 -810 {lab=#net7}
N 2260 -810 2260 -700 {lab=#net7}
N 2260 -700 2290 -700 {lab=#net7}
N 2210 -770 2260 -770 {lab=#net7}
N 2330 -760 2500 -760 {lab=Carry}
N 2170 -790 2170 -770 {lab=#net7}
N 2170 -770 2210 -770 {lab=#net7}
N 1970 -770 2170 -770 {lab=#net7}
N 1490 -1590 1800 -1590 {lab=VA}
N 1490 -1590 1490 -1350 {lab=VA}
N 1490 -1350 1490 -740 {lab=VA}
N 1490 -740 1790 -740 {lab=VA}
N 1620 -1320 1800 -1320 {lab=VB}
N 1600 -1320 1620 -1320 {lab=VB}
N 1600 -1320 1600 -1090 {lab=VB}
N 1600 -1090 1600 -780 {lab=VB}
N 1600 -780 1600 -770 {lab=VB}
N 1600 -770 1860 -770 {lab=VB}
N 1460 -1110 1490 -1110 {lab=VA}
N 1570 -1090 1600 -1090 {lab=VB}
C {vdd.sym} 1920 -1400 0 0 {name=l1 lab=VDD}
C {vdd.sym} 1920 -1670 0 0 {name=l2 lab=VDD}
C {gnd.sym} 1920 -1230 0 0 {name=l3 lab=GND}
C {gnd.sym} 1920 -1500 0 0 {name=l4 lab=GND}
C {ipin.sym} 1460 -1110 0 0 {name=p1 lab=VA}
C {ipin.sym} 1570 -1090 0 0 {name=p2 lab=VB}
C {vdd.sym} 2310 -1760 0 0 {name=l5 lab=VDD}
C {vdd.sym} 2700 -1560 0 0 {name=l6 lab=VDD}
C {gnd.sym} 2700 -1390 0 0 {name=l7 lab=GND}
C {opin.sym} 2870 -1480 0 0 {name=p3 lab=Sum}
C {gnd.sym} 2380 -1150 0 0 {name=l8 lab=GND}
C {vsource.sym} 1130 -730 0 0 {name=VB value="pulse(0 1.8 0 0.1n 0.1n 20n 40n)" savecurrent=false}
C {gnd.sym} 1130 -700 0 0 {name=B1 lab=GND}
C {vsource.sym} 1130 -1010 0 0 {name=VDD value=1.8 savecurrent=true}
C {gnd.sym} 1130 -980 0 0 {name=l13 lab=GND}
C {vdd.sym} 1130 -1040 0 0 {name=l14 lab=VDD}
C {vsource.sym} 1130 -870 0 0 {name=VA value="pulse(0 1.8 0 0.1n 0.1n 10n 20n)" savecurrent=false}
C {gnd.sym} 1130 -840 0 0 {name=l15 lab=GND}
C {devices/code.sym} 1070 -1440 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
.lib /usr/local/share/pdk/sky130B/libs.tech/ngspice/sky130.lib.spice tt
.option wnflag=1
"}
C {devices/code.sym} 1080 -1260 0 0 {name=STIMULI
only_toplevel=true
place=end
value="
.save v(VA) v(VB) v(Sum) v(Carry)
.tran 0.1n 200n
"}
C {launcher.sym} 630 -2010 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/half_adder.raw tran"
}
C {sky130_fd_pr/pfet3_01v8.sym} 1900 -1640 0 0 {name=M16
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
C {sky130_fd_pr/pfet3_01v8.sym} 2220 -1680 0 0 {name=M1
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
C {sky130_fd_pr/pfet3_01v8.sym} 2220 -1560 0 0 {name=M5
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
C {sky130_fd_pr/pfet3_01v8.sym} 2430 -1680 0 0 {name=M6
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
C {sky130_fd_pr/pfet3_01v8.sym} 2430 -1560 0 0 {name=M7
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
C {sky130_fd_pr/pfet3_01v8.sym} 2680 -1530 0 0 {name=M8
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
C {sky130_fd_pr/pfet3_01v8.sym} 1900 -1370 0 0 {name=M3
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
C {sky130_fd_pr/nfet3_01v8.sym} 1900 -1260 0 0 {name=M4
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
C {sky130_fd_pr/nfet3_01v8.sym} 1900 -1530 0 0 {name=M2
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
C {sky130_fd_pr/nfet3_01v8.sym} 2230 -1250 0 0 {name=M12
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
C {sky130_fd_pr/nfet3_01v8.sym} 2230 -1370 0 0 {name=M11
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
C {sky130_fd_pr/nfet3_01v8.sym} 2480 -1370 0 0 {name=M9
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
C {sky130_fd_pr/nfet3_01v8.sym} 2480 -1240 0 0 {name=M14
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
C {sky130_fd_pr/nfet3_01v8.sym} 2680 -1420 0 0 {name=M13
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
C {vdd.sym} 2070 -980 0 0 {name=l9 lab=VDD}
C {gnd.sym} 1970 -510 0 0 {name=l10 lab=GND}
C {opin.sym} 2500 -760 0 0 {name=p4 lab=Carry}
C {sky130_fd_pr/nfet3_01v8.sym} 1950 -580 0 0 {name=M10
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
C {sky130_fd_pr/nfet3_01v8.sym} 1950 -700 0 0 {name=M15
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
C {sky130_fd_pr/pfet3_01v8.sym} 1950 -870 0 0 {name=M17
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
C {sky130_fd_pr/pfet3_01v8.sym} 2150 -870 0 0 {name=M18
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
C {vdd.sym} 2330 -840 0 0 {name=l11 lab=VDD}
C {gnd.sym} 2330 -670 0 0 {name=l12 lab=GND}
C {sky130_fd_pr/pfet3_01v8.sym} 2310 -810 0 0 {name=M19
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
C {sky130_fd_pr/nfet3_01v8.sym} 2310 -700 0 0 {name=M20
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
C {title-2.sym} 130 -360 0 0 {name=l16 author="Author: Jihan" rev=1.0 lock=true
page=1
pages=1
title="Title: Half Adder"}
C {lab_pin.sym} 1130 -900 0 0 {name=p5 sig_type=std_logic lab=VA}
C {lab_pin.sym} 1130 -760 0 0 {name=p6 sig_type=std_logic lab=VB}
