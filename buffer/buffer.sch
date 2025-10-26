v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
P 4 1 270 -220 {}
N 340 -200 340 -160 {lab=#net1}
N 260 -130 300 -130 {lab=Vin}
N 260 -230 260 -130 {lab=Vin}
N 260 -230 300 -230 {lab=Vin}
N 210 -180 260 -180 {lab=Vin}
N 340 -180 380 -180 {lab=#net1}
N 340 -290 340 -260 {lab=VDD}
N 340 -100 340 -70 {lab=GND}
N 340 -230 430 -230 {lab=VDD}
N 340 -130 440 -130 {lab=GND}
N 440 -130 440 -80 {lab=GND}
N 340 -80 440 -80 {lab=GND}
N 430 -270 430 -230 {lab=VDD}
N 340 -270 430 -270 {lab=VDD}
N 540 -200 540 -160 {lab=Vout}
N 540 -180 580 -180 {lab=Vout}
N 540 -290 540 -260 {lab=VDD}
N 540 -100 540 -70 {lab=GND}
N 540 -230 630 -230 {lab=VDD}
N 540 -130 640 -130 {lab=GND}
N 640 -130 640 -80 {lab=GND}
N 540 -80 640 -80 {lab=GND}
N 630 -270 630 -230 {lab=VDD}
N 540 -270 630 -270 {lab=VDD}
N 470 -230 500 -230 {lab=#net1}
N 470 -230 470 -130 {lab=#net1}
N 470 -130 500 -130 {lab=#net1}
N 380 -180 470 -180 {lab=#net1}
N 340 -290 540 -290 {lab=VDD}
N 440 -330 440 -290 {lab=VDD}
N 340 -70 540 -70 {lab=GND}
N 440 -70 440 -40 {lab=GND}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 320 -230 0 0 {name=M1
W=1
L=0.35
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 320 -130 0 0 {name=M2
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
model=nfet_01v8_lvt
spiceprefix=X
}
C {gnd.sym} 440 -40 0 0 {name=l2 lab=GND}
C {vsource.sym} 80 -260 0 0 {name=Vdd value=1.8 savecurrent=true}
C {gnd.sym} 80 -230 0 0 {name=l3 lab=GND}
C {vdd.sym} 80 -290 0 0 {name=l4 lab=VDD}
C {vsource.sym} 80 -110 0 0 {name=Vin value=0 savecurrent=true}
C {gnd.sym} 80 -80 0 0 {name=l6 lab=GND}
C {code.sym} 760 -300 0 0 {name=tt
only_toplevel=false
value="
.lib /usr/local/share/pdk/sky130B/libs.tech/ngspice/sky130.lib.spice tt
.option wnflag=1

*--- Run ----------------------------------

.control 
run
wrdata untitled.raw V(Vout) V(Vin) V(VDD) I(Vdd) 
.endc
"}
C {code_shown.sym} 770 -90 0 0 {name=SPICE only_toplevel=false value=".dc Vin 0 3.3 0.01
.save all"}
C {lab_pin.sym} 210 -180 0 0 {name=p1 sig_type=std_logic lab=Vin}
C {lab_pin.sym} 80 -140 2 0 {name=p2 sig_type=std_logic lab=Vin}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 520 -230 0 0 {name=M3
W=1
L=0.35
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 520 -130 0 0 {name=M4
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
model=nfet_01v8_lvt
spiceprefix=X
}
C {vdd.sym} 440 -330 0 0 {name=l5 lab=VDD}
C {lab_pin.sym} 580 -180 2 0 {name=Vout1
 sig_type=std_logic lab=Vout}
