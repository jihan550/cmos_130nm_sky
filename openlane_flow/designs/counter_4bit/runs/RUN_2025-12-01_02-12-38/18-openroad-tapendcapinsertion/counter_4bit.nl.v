module counter_4bit (clk,
    rst_n,
    count);
 input clk;
 input rst_n;
 output [3:0] count;

 wire _00_;
 wire _01_;
 wire _02_;
 wire _03_;
 wire _04_;
 wire _05_;

 sky130_fd_sc_hd__inv_2 _06_ (.A(count[0]),
    .Y(_00_));
 sky130_fd_sc_hd__a21oi_2 _07_ (.A1(count[1]),
    .A2(count[0]),
    .B1(count[2]),
    .Y(_04_));
 sky130_fd_sc_hd__and3_2 _08_ (.A(count[1]),
    .B(count[0]),
    .C(count[2]),
    .X(_05_));
 sky130_fd_sc_hd__nor2_2 _09_ (.A(_04_),
    .B(_05_),
    .Y(_02_));
 sky130_fd_sc_hd__xor2_2 _10_ (.A(count[3]),
    .B(_05_),
    .X(_03_));
 sky130_fd_sc_hd__xor2_2 _11_ (.A(count[1]),
    .B(count[0]),
    .X(_01_));
 sky130_fd_sc_hd__dfrtp_2 _12_ (.CLK(clk),
    .D(_00_),
    .RESET_B(rst_n),
    .Q(count[0]));
 sky130_fd_sc_hd__dfrtp_2 _13_ (.CLK(clk),
    .D(_01_),
    .RESET_B(rst_n),
    .Q(count[1]));
 sky130_fd_sc_hd__dfrtp_2 _14_ (.CLK(clk),
    .D(_02_),
    .RESET_B(rst_n),
    .Q(count[2]));
 sky130_fd_sc_hd__dfrtp_2 _15_ (.CLK(clk),
    .D(_03_),
    .RESET_B(rst_n),
    .Q(count[3]));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Right_0 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Right_1 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Right_2 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Right_3 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Right_4 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Right_5 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Left_6 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Left_7 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Left_8 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Left_9 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Left_10 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Left_11 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_12 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_13 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_14 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_15 ();
endmodule
