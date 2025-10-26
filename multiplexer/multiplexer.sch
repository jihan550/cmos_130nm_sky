v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 2190 -1510 2190 -1470 {lab=#net1}
N 2190 -1410 2190 -1350 {lab=#net2}
N 2190 -1290 2190 -1240 {lab=#net3}
N 2180 -990 2180 -950 {lab=#net4}
N 2180 -890 2180 -830 {lab=#net2}
N 2180 -770 2180 -720 {lab=#net5}
N 1940 -1540 2150 -1540 {lab=A0}
N 1940 -1540 1940 -1230 {lab=A0}
N 1940 -1230 1940 -1220 {lab=A0}
N 1940 -1220 1940 -1210 {lab=A0}
N 1940 -1210 2150 -1210 {lab=A0}
N 2000 -1320 2150 -1320 {lab=#net6}
N 2000 -1320 2000 -920 {lab=#net6}
N 2000 -920 2140 -920 {lab=#net6}
N 2040 -1020 2140 -1020 {lab=A1}
N 1940 -1020 2040 -1020 {lab=A1}
N 1940 -1020 1940 -700 {lab=A1}
N 1940 -700 1940 -690 {lab=A1}
N 1940 -690 2140 -690 {lab=A1}
N 1750 -1150 1750 -1050 {lab=#net6}
N 1650 -1180 1710 -1180 {lab=S}
N 1650 -1180 1650 -1020 {lab=S}
N 1650 -1020 1710 -1020 {lab=S}
N 1350 -1100 1650 -1100 {lab=S}
N 1500 -1440 2150 -1440 {lab=S}
N 1500 -800 2140 -800 {lab=S}
N 1500 -1440 1500 -1100 {lab=S}
N 1500 -1100 1500 -800 {lab=S}
N 1750 -1110 2000 -1110 {lab=#net6}
N 1330 -1540 1940 -1540 {lab=A0}
N 1350 -690 1940 -690 {lab=A1}
N 2190 -1380 2450 -1380 {lab=#net2}
N 2450 -1380 2450 -880 {lab=#net2}
N 2450 -880 2450 -860 {lab=#net2}
N 2180 -860 2450 -860 {lab=#net2}
N 2780 -1160 2780 -1040 {lab=Y}
N 2670 -1190 2740 -1190 {lab=#net2}
N 2670 -1190 2670 -1010 {lab=#net2}
N 2670 -1010 2740 -1010 {lab=#net2}
N 2450 -1110 2670 -1110 {lab=#net2}
N 2780 -1100 3030 -1100 {lab=Y}
N 2190 -1540 2270 -1540 {lab=VDD}
N 2190 -1440 2270 -1440 {lab=VDD}
N 2180 -1030 2260 -1030 {lab=VDD}
N 2180 -920 2260 -920 {lab=VDD}
N 2190 -1320 2270 -1320 {lab=GND}
N 2190 -1210 2270 -1210 {lab=GND}
N 2180 -800 2260 -800 {lab=GND}
N 2180 -690 2260 -690 {lab=GND}
N 1750 -990 1750 -950 {lab=GND}
N 1750 -1020 1810 -1020 {lab=GND}
N 1810 -1020 1810 -970 {lab=GND}
N 1750 -970 1810 -970 {lab=GND}
N 1750 -1180 1810 -1180 {lab=VDD}
N 1810 -1220 1810 -1180 {lab=VDD}
N 1750 -1260 1750 -1210 {lab=VDD}
N 1810 -1240 1810 -1220 {lab=VDD}
N 1750 -1240 1810 -1240 {lab=VDD}
N 2780 -1190 2860 -1190 {lab=VDD}
N 2780 -1010 2860 -1010 {lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} 2170 -1320 0 0 {name=M1
W=1
L=0.15
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
C {sky130_fd_pr/pfet_01v8.sym} 2170 -1540 0 0 {name=M2
W=1
L=0.15
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
C {sky130_fd_pr/pfet_01v8.sym} 2170 -1440 0 0 {name=M3
W=1
L=0.15
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
C {sky130_fd_pr/nfet_01v8.sym} 2170 -1210 0 0 {name=M4
W=1
L=0.15
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
C {sky130_fd_pr/nfet_01v8.sym} 2160 -800 0 0 {name=M5
W=1
L=0.15
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
C {sky130_fd_pr/pfet_01v8.sym} 2160 -1020 0 0 {name=M6
W=1
L=0.15
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
C {sky130_fd_pr/pfet_01v8.sym} 2160 -920 0 0 {name=M7
W=1
L=0.15
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
C {sky130_fd_pr/nfet_01v8.sym} 2160 -690 0 0 {name=M8
W=1
L=0.15
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
C {gnd.sym} 2190 -1180 0 0 {name=l1 lab=GND}
C {gnd.sym} 2180 -660 0 0 {name=l2 lab=GND}
C {vdd.sym} 2190 -1570 0 0 {name=l3 lab=VDD}
C {vdd.sym} 2180 -1050 0 0 {name=l4 lab=VDD}
C {sky130_fd_pr/pfet_01v8.sym} 1730 -1180 0 0 {name=M9
W=1
L=0.15
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
C {sky130_fd_pr/nfet_01v8.sym} 1730 -1020 0 0 {name=M10
W=1
L=0.15
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
C {gnd.sym} 1750 -950 0 0 {name=l5 lab=GND}
C {vdd.sym} 1750 -1260 0 0 {name=l6 lab=VDD}
C {sky130_fd_pr/pfet_01v8.sym} 2760 -1190 0 0 {name=M11
W=1
L=0.15
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
C {sky130_fd_pr/nfet_01v8.sym} 2760 -1010 0 0 {name=M12
W=1
L=0.15
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
C {gnd.sym} 2780 -980 0 0 {name=l7 lab=GND}
C {vdd.sym} 2780 -1220 0 0 {name=l8 lab=VDD}
C {ipin.sym} 1330 -1540 0 0 {name=p1 lab=A0}
C {ipin.sym} 1350 -1100 0 0 {name=p2 lab=S}
C {ipin.sym} 1350 -690 0 0 {name=p3 lab=A1}
C {lab_pin.sym} 2270 -1540 2 0 {name=p4 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 2270 -1440 2 0 {name=p5 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 2260 -1030 2 0 {name=p6 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 2260 -920 2 0 {name=p7 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 2270 -1320 2 0 {name=p8 sig_type=std_logic lab=GND}
C {lab_pin.sym} 2270 -1210 2 0 {name=p9 sig_type=std_logic lab=GND}
C {lab_pin.sym} 2260 -800 2 0 {name=p10 sig_type=std_logic lab=GND}
C {lab_pin.sym} 2260 -690 2 0 {name=p11 sig_type=std_logic lab=GND}
C {opin.sym} 3030 -1100 0 0 {name=p12 lab=Z}
C {lab_pin.sym} 2860 -1190 2 0 {name=p13 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 2860 -1010 2 0 {name=p14 sig_type=std_logic lab=GND}
C {title-3.sym} 880 -180 0 0 {name="MUX" author="Author: Jihan S" title="Title: 2:1 MUX" rev=1.0 lock=true}
