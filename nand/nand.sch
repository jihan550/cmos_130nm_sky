v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1450 -1430 1450 -1400 {lab=VDD}
N 1550 -1400 1550 -1350 {lab=VDD}
N 1550 -1320 1600 -1320 {lab=VDD}
N 1600 -1370 1600 -1320 {lab=VDD}
N 1550 -1370 1600 -1370 {lab=VDD}
N 1350 -1320 1400 -1320 {lab=VDD}
N 1400 -1370 1400 -1320 {lab=VDD}
N 1350 -1400 1350 -1350 {lab=VDD}
N 1350 -1400 1420 -1400 {lab=VDD}
N 1420 -1400 1550 -1400 {lab=VDD}
N 1350 -1370 1400 -1370 {lab=VDD}
N 1350 -1290 1350 -1240 {lab=Y}
N 1350 -1240 1560 -1240 {lab=Y}
N 1560 -1240 1650 -1240 {lab=Y}
N 1550 -1290 1550 -1240 {lab=Y}
N 1350 -1240 1350 -1180 {lab=Y}
N 1350 -1120 1350 -1060 {lab=#net1}
N 1350 -1150 1380 -1150 {lab=#net1}
N 1380 -1150 1380 -1100 {lab=#net1}
N 1350 -1100 1380 -1100 {lab=#net1}
N 1350 -1000 1350 -960 {lab=GND}
N 1350 -1030 1380 -1030 {lab=GND}
N 1380 -1030 1380 -1020 {lab=GND}
N 1380 -1020 1380 -990 {lab=GND}
N 1380 -990 1380 -980 {lab=GND}
N 1350 -980 1380 -980 {lab=GND}
N 1170 -1320 1310 -1320 {lab=VA}
N 1170 -1320 1170 -1040 {lab=VA}
N 1170 -1040 1170 -1030 {lab=VA}
N 1170 -1030 1310 -1030 {lab=VA}
N 1450 -1320 1510 -1320 {lab=VB}
N 1450 -1320 1450 -1270 {lab=VB}
N 1240 -1270 1450 -1270 {lab=VB}
N 1240 -1270 1240 -1150 {lab=VB}
N 1240 -1150 1310 -1150 {lab=VB}
N 1650 -1240 1720 -1240 {lab=Y}
C {nmos4.sym} 1330 -1150 0 0 {name=M2 model=nmos w=5u l=0.18u del=0 m=1}
C {vdd.sym} 1450 -1430 0 0 {name=l1 lab=VDD}
C {gnd.sym} 1350 -960 0 0 {name=l2 lab=GND}
C {pmos4.sym} 1330 -1320 0 0 {name=M3 model=pmos w=5u l=0.18u del=0 m=1}
C {vsource.sym} 780 -1300 0 0 {name=Vdd value=3.3 savecurrent=true}
C {gnd.sym} 780 -1270 0 0 {name=l3 lab=GND}
C {vdd.sym} 780 -1330 0 0 {name=l4 lab=VDD}
C {pmos4.sym} 1530 -1320 0 0 {name=M1 model=pmos w=5u l=0.18u del=0 m=1}
C {nmos4.sym} 1330 -1030 0 0 {name=M4 model=nmos w=5u l=0.18u del=0 m=1}
C {sky130_fd_pr/res_high_po.sym} 1650 -1210 0 0 {name=R1
W=1
L=1
model=res_high_po
spiceprefix=X
mult=1}
C {sky130_fd_pr/cap_mim_m3_1.sym} 1650 -1150 0 0 {name=C1 model=cap_mim_m3_1 W=1 L=1 MF=1 spiceprefix=X}
C {gnd.sym} 1650 -1120 0 0 {name=l5 lab=GND}
C {ipin.sym} 1720 -1240 2 0 {name=p4 lab=Y}
C {vsource.sym} 780 -1190 0 0 {name=VA value="pulse(0 3.3 0 0.1n 0.1n 10n 20n)" savecurrent=false}
C {vsource.sym} 780 -1080 0 0 {name=VB value="pulse(0 3.3 0 0.1n 0.1n 20n 40n)" savecurrent=false}
C {gnd.sym} 780 -1160 0 0 {name=l6 lab=GND}
C {gnd.sym} 780 -1050 0 0 {name=l7 lab=GND}
C {code.sym} 1820 -1440 0 0 {name=tt
only_toplevel=false
value="
.lib /usr/local/share/pdk/sky130B/libs.tech/ngspice/sky130.lib.spice tt
.option wnflag=1

.save v(VA) v(VB) v(Y)

.option rawfmt=psfascii
.control
run
wrdata nand.raw v(VA) v(VB) v(Y)
.endc


"}
C {code_shown.sym} 1820 -1180 0 0 {name=SPICE only_toplevel=false value="
* --- simple MOS models (for generic nmos/pmos symbols) ---
.model nmos nmos level=1 VTO=0.5  KP=200e-6 GAMMA=0.4 LAMBDA=0.02
.model pmos pmos level=1 VTO=-0.5 KP=80e-6  GAMMA=0.4 LAMBDA=0.02

* --- analysis ---
.tran 0.1n 200n
.save all
"}
C {ipin.sym} 780 -1220 0 0 {name=p3 lab=VA}
C {ipin.sym} 1170 -1180 0 0 {name=p5 lab=VA}
C {ipin.sym} 780 -1110 0 0 {name=p2 lab=VB}
C {ipin.sym} 1240 -1210 0 0 {name=p6 lab=VB}
C {title-3.sym} 220 -220 0 0 {name=l8 author="Jihan S" rev=1.0 lock=true}
