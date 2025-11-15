// fsm.sv - Simple 3-state FSM (SystemVerilog) for Yosys
module fsm_example (
    input  logic clk,
    input  logic rst_n,
    input  logic start,
    input  logic done,
    output logic busy
);

    // State encoding; Yosys will re-encode if it wants.
    typedef enum logic [1:0] {
        IDLE = 2'b00,
        RUN  = 2'b01,
        HOLD = 2'b10
    } state_t;

    state_t state, next_state;

    // State register
    always_ff @(posedge clk, negedge rst_n) begin
        if (!rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next-state + output logic
    always_comb begin
        next_state = state;
        busy       = 1'b0;

        unique case (state)
            IDLE: begin
                busy = 1'b0;
                if (start)
                    next_state = RUN;
            end

            RUN: begin
                busy = 1'b1;
                if (done)
                    next_state = HOLD;
            end

            HOLD: begin
                busy = 1'b0;
                next_state = IDLE;
            end

            default: begin
                next_state = IDLE;
                busy       = 1'b0;
            end
        endcase
    end

endmodule
