`timescale 1ns/1ps

module param_counter_tb;

  reg clk;
  reg rst_n;
  reg en;
  reg load;
  reg [3:0] load_value;
  wire [3:0] count;

  // Instantiate the DUT
  param_counter #(
    .WIDTH(4),
    .DOWN(0),
    .SATURATE(1)
  ) dut (
    .clk        (clk),
    .rst_n      (rst_n),
    .en         (en),
    .load       (load),
    .load_value (load_value),
    .count      (count)
  );

  // Clock generation: 50 MHz
  initial begin
    clk = 0;
    forever #10 clk = ~clk; // 20 ns period
  end

  //stimulus
  initial begin
    // VCD dump for waveform viewing
    $dumpfile("param_counter_tb.vcd");
    $dumpvars(0, param_counter_tb);
    // Initialize signals
    rst_n = 1'b0;
    en = 1'b0;
    load = 1'b0;
    load_value = 4'd0;

    #25;
    rst_n = 1'b1; // Release reset
    
    #20;
    en = 1'b1; // Enable counting

    #200;
    load = 1'b1; // Load new value
    load_value = 4'd10;

    #20;
    load = 1'b0; // Stop loading
    #200;
    en = 1'b0; // Disable counting
    
    #50;
    rst_n = 1'b0; // Assert reset
    
    #20;
    $finish;
  end

endmodule
