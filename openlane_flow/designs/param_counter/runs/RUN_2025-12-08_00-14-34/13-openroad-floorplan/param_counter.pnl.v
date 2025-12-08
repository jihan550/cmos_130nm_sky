module param_counter (clk,
    en,
    load,
    rst_n,
    count,
    load_value);
 input clk;
 input en;
 input load;
 input rst_n;
 output [3:0] count;
 input [3:0] load_value;

 wire _00_;
 wire _01_;
 wire _02_;
 wire _03_;
 wire _04_;
 wire _05_;
 wire _06_;
 wire _07_;
 wire _08_;
 wire _09_;
 wire _10_;
 wire _11_;
 wire _12_;
 wire _13_;
 wire _14_;
 wire VPWR;
 wire VGND;

 sky130_fd_sc_hd__inv_2 _15_ (.A(load),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_04_));
 sky130_fd_sc_hd__inv_2 _16_ (.A(count[1]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_05_));
 sky130_fd_sc_hd__a21oi_2 _17_ (.A1(en),
    .A2(count[0]),
    .B1(load),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_06_));
 sky130_fd_sc_hd__a21o_2 _18_ (.A1(load),
    .A2(load_value[0]),
    .B1(_06_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_07_));
 sky130_fd_sc_hd__o31a_2 _19_ (.A1(load),
    .A2(en),
    .A3(count[0]),
    .B1(_07_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_00_));
 sky130_fd_sc_hd__nand4_2 _20_ (.A(_04_),
    .B(en),
    .C(count[0]),
    .D(count[1]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_08_));
 sky130_fd_sc_hd__nand2_2 _21_ (.A(_05_),
    .B(_06_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_09_));
 sky130_fd_sc_hd__o211a_2 _22_ (.A1(_04_),
    .A2(load_value[1]),
    .B1(_08_),
    .C1(_09_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_01_));
 sky130_fd_sc_hd__o211a_2 _23_ (.A1(load),
    .A2(en),
    .B1(count[0]),
    .C1(count[1]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_10_));
 sky130_fd_sc_hd__nor2_2 _24_ (.A(count[2]),
    .B(_10_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_11_));
 sky130_fd_sc_hd__a41o_2 _25_ (.A1(en),
    .A2(count[0]),
    .A3(count[1]),
    .A4(count[2]),
    .B1(load),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_12_));
 sky130_fd_sc_hd__a2bb2o_2 _26_ (.A1_N(_11_),
    .A2_N(_12_),
    .B1(load),
    .B2(load_value[2]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_02_));
 sky130_fd_sc_hd__or2_2 _27_ (.A(count[3]),
    .B(_12_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_13_));
 sky130_fd_sc_hd__nand2_2 _28_ (.A(count[2]),
    .B(count[3]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_14_));
 sky130_fd_sc_hd__o221a_2 _29_ (.A1(_04_),
    .A2(load_value[3]),
    .B1(_08_),
    .B2(_14_),
    .C1(_13_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_03_));
 sky130_fd_sc_hd__dfrtp_2 _30_ (.CLK(clk),
    .D(_00_),
    .RESET_B(rst_n),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(count[0]));
 sky130_fd_sc_hd__dfrtp_2 _31_ (.CLK(clk),
    .D(_01_),
    .RESET_B(rst_n),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(count[1]));
 sky130_fd_sc_hd__dfrtp_2 _32_ (.CLK(clk),
    .D(_02_),
    .RESET_B(rst_n),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(count[2]));
 sky130_fd_sc_hd__dfrtp_2 _33_ (.CLK(clk),
    .D(_03_),
    .RESET_B(rst_n),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(count[3]));
endmodule
