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
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net10;
 wire net11;
 wire net12;
 wire clknet_0_clk;
 wire clknet_1_0__leaf_clk;
 wire clknet_1_1__leaf_clk;

 sky130_fd_sc_hd__inv_2 _15_ (.A(net12),
    .Y(_04_));
 sky130_fd_sc_hd__inv_2 _16_ (.A(net9),
    .Y(_05_));
 sky130_fd_sc_hd__a21oi_1 _17_ (.A1(net1),
    .A2(net8),
    .B1(net12),
    .Y(_06_));
 sky130_fd_sc_hd__a21o_1 _18_ (.A1(net12),
    .A2(net3),
    .B1(_06_),
    .X(_07_));
 sky130_fd_sc_hd__o31a_1 _19_ (.A1(net12),
    .A2(net1),
    .A3(net8),
    .B1(_07_),
    .X(_00_));
 sky130_fd_sc_hd__nand4_1 _20_ (.A(_04_),
    .B(net1),
    .C(net8),
    .D(net9),
    .Y(_08_));
 sky130_fd_sc_hd__nand2_1 _21_ (.A(_05_),
    .B(_06_),
    .Y(_09_));
 sky130_fd_sc_hd__o211a_1 _22_ (.A1(_04_),
    .A2(net4),
    .B1(_08_),
    .C1(_09_),
    .X(_01_));
 sky130_fd_sc_hd__o211a_1 _23_ (.A1(net12),
    .A2(net1),
    .B1(net8),
    .C1(net9),
    .X(_10_));
 sky130_fd_sc_hd__nor2_1 _24_ (.A(net10),
    .B(_10_),
    .Y(_11_));
 sky130_fd_sc_hd__a41o_1 _25_ (.A1(net1),
    .A2(net8),
    .A3(net9),
    .A4(net10),
    .B1(net12),
    .X(_12_));
 sky130_fd_sc_hd__a2bb2o_1 _26_ (.A1_N(_11_),
    .A2_N(_12_),
    .B1(net2),
    .B2(net5),
    .X(_02_));
 sky130_fd_sc_hd__or2_1 _27_ (.A(net11),
    .B(_12_),
    .X(_13_));
 sky130_fd_sc_hd__nand2_1 _28_ (.A(net10),
    .B(net11),
    .Y(_14_));
 sky130_fd_sc_hd__o221a_1 _29_ (.A1(_04_),
    .A2(net6),
    .B1(_08_),
    .B2(_14_),
    .C1(_13_),
    .X(_03_));
 sky130_fd_sc_hd__dfrtp_1 _30_ (.CLK(clknet_1_0__leaf_clk),
    .D(_00_),
    .RESET_B(net7),
    .Q(net8));
 sky130_fd_sc_hd__dfrtp_1 _31_ (.CLK(clknet_1_1__leaf_clk),
    .D(_01_),
    .RESET_B(net7),
    .Q(net9));
 sky130_fd_sc_hd__dfrtp_1 _32_ (.CLK(clknet_1_0__leaf_clk),
    .D(_02_),
    .RESET_B(net7),
    .Q(net10));
 sky130_fd_sc_hd__dfrtp_1 _33_ (.CLK(clknet_1_1__leaf_clk),
    .D(_03_),
    .RESET_B(net7),
    .Q(net11));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Right_0 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Right_1 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Right_2 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Right_3 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Right_4 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Right_5 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Right_6 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Right_7 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Left_8 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Left_9 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Left_10 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Left_11 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Left_12 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Left_13 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Left_14 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Left_15 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_16 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_17 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_18 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_19 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_20 ();
 sky130_fd_sc_hd__buf_1 input1 (.A(en),
    .X(net1));
 sky130_fd_sc_hd__clkbuf_1 input2 (.A(load),
    .X(net2));
 sky130_fd_sc_hd__clkbuf_1 input3 (.A(load_value[0]),
    .X(net3));
 sky130_fd_sc_hd__clkbuf_1 input4 (.A(load_value[1]),
    .X(net4));
 sky130_fd_sc_hd__clkbuf_1 input5 (.A(load_value[2]),
    .X(net5));
 sky130_fd_sc_hd__clkbuf_1 input6 (.A(load_value[3]),
    .X(net6));
 sky130_fd_sc_hd__dlymetal6s2s_1 input7 (.A(rst_n),
    .X(net7));
 sky130_fd_sc_hd__buf_2 output8 (.A(net8),
    .X(count[0]));
 sky130_fd_sc_hd__buf_2 output9 (.A(net9),
    .X(count[1]));
 sky130_fd_sc_hd__buf_2 output10 (.A(net10),
    .X(count[2]));
 sky130_fd_sc_hd__buf_2 output11 (.A(net11),
    .X(count[3]));
 sky130_fd_sc_hd__clkbuf_2 fanout12 (.A(net2),
    .X(net12));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_0_clk (.A(clk),
    .X(clknet_0_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_1_0__f_clk (.A(clknet_0_clk),
    .X(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_1_1__f_clk (.A(clknet_0_clk),
    .X(clknet_1_1__leaf_clk));
endmodule
