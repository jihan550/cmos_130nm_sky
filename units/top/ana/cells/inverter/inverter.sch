v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 80 -1480 1190 -1020 {flags=graph
y1=0
y2=2
ypos1=-0.2
ypos2=1.8
divy=5
subdivy=1
unity=1
x1=-1e-08
x2=1.9e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="Z;z
VA;va
pfetmfive
nfetmsix"
color="4 6 8 15"
dataset=-1
unitx=1
logx=0
logy=0
digital=1
autoload=1
rawfile=$netlist_dir/inverter.raw
legend=1}
N 760 -320 760 -290 {lab=GND}
N 760 -430 760 -380 {lab=nfetmsix}
N 760 -710 760 -640 {lab=#net1}
N 760 -800 760 -770 {lab=VDD}
N 760 -580 760 -490 {lab=Z}
N 760 -680 940 -680 {lab=#net1}
N 940 -680 940 -640 {lab=#net1}
N 760 -540 1280 -540 {lab=Z}
N 880 -610 900 -610 {lab=Z}
N 880 -610 880 -540 {lab=Z}
N 610 -740 720 -740 {lab=VA}
N 610 -740 610 -350 {lab=VA}
N 610 -350 720 -350 {lab=VA}
N 610 -610 720 -610 {lab=VA}
N 610 -460 720 -460 {lab=VA}
N 550 -540 610 -540 {lab=VA}
N 760 -790 1080 -790 {lab=VDD}
N 1080 -790 1080 -720 {lab=VDD}
N 1080 -660 1080 -540 {lab=Z}
N 760 -310 880 -310 {lab=GND}
N 980 -450 1040 -450 {lab=Z}
N 980 -540 980 -450 {lab=Z}
N 940 -580 940 -490 {lab=pfetmFive}
N 880 -310 940 -310 {lab=GND}
N 940 -430 940 -310 {lab=GND}
N 1080 -420 1080 -410 {lab=nfetmsix}
N 760 -410 1080 -410 {lab=nfetmsix}
N 1080 -540 1080 -480 {lab=Z}
C {sky130_fd_pr/pfet3_01v8.sym} 740 -740 0 0 {name=M1
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
C {sky130_fd_pr/nfet3_01v8.sym} 740 -460 0 0 {name=M2
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
C {sky130_fd_pr/pfet3_01v8.sym} 740 -610 0 0 {name=M3
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
C {sky130_fd_pr/nfet3_01v8.sym} 740 -350 0 0 {name=M4
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
C {vdd.sym} 760 -800 0 0 {name=l1 lab=VDD}
C {gnd.sym} 760 -290 0 0 {name=l2 lab=GND}
C {sky130_fd_pr/pfet3_01v8.sym} 920 -610 0 0 {name=M5
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
C {ipin.sym} 550 -540 0 0 {name=p1 lab=VA}
C {res.sym} 1080 -690 0 0 {name=R1
value="81.61"
footprint=1206
device=resistor
m=1}
C {opin.sym} 1280 -540 0 0 {name=p2 lab=Z}
C {res.sym} 940 -460 0 0 {name=R2
value="89.95"
footprint=1206
device=resistor
m=1}
C {sky130_fd_pr/nfet3_01v8.sym} 1060 -450 0 0 {name=M6
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
C {vsource.sym} 190 -380 0 0 {name=VA value="pulse(0 1.8 0 0.1n 0.1n 10n 20n)" savecurrent=false}
C {gnd.sym} 190 -350 0 0 {name=l15 lab=GND}
C {lab_pin.sym} 190 -410 0 0 {name=p5 sig_type=std_logic lab=VA}
C {devices/code.sym} 130 -770 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
.lib /usr/local/share/pdk/sky130B/libs.tech/ngspice/sky130.lib.spice tt
.option wnflag=1
"}
C {devices/code.sym} 140 -590 0 0 {name=STIMULI
only_toplevel=true
place=end
value="
.save v(VA) v(Z) v(pfetmFive) v(nfetmsix) v(p1) v(p2) v(p3) v(p4)
.tran 0.1n 200n
"}
C {vsource.sym} 190 -230 0 0 {name=VDD value=1.8 savecurrent=true}
C {gnd.sym} 190 -200 0 0 {name=l13 lab=GND}
C {vdd.sym} 190 -260 0 0 {name=l14 lab=VDD}
C {launcher.sym} 180 -950 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/inverter.raw tran"
}
C {ipin.sym} 940 -560 2 0 {name=p3 lab=pfetmFive}
C {ipin.sym} 1030 -410 3 0 {name=p4 lab=nfetmsix}
