`timescale 1ns/1ps

module tb_counter_4bit;

    // Testbench signals
    reg        clk;
    reg        reset;
    wire [3:0] count;

    // DUT instantiation
    counter_4bit dut (
        .clk   (clk),
        .reset (reset),
        .count (count)
    );

    // Clock generation: 100 MHz (10 ns period)
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;   // toggle every 5 ns → period = 10 ns
    end

    // Stimulus
    initial begin
        // VCD dump for GTKWave
        $dumpfile("counter_4bit_tb.vcd");
        $dumpvars(0, tb_counter_4bit);

        // Initial state
        reset = 1'b1;   // assert reset
        #20;            // hold reset for 20 ns

        reset = 1'b0;   // release reset, counter should start incrementing

        #200;           // let it count for a while

        // Pulse reset again to see it go back to 0
        reset = 1'b1;
        #20;
        reset = 1'b0;

        #200;           // more counting

        $finish;
    end

endmodule
