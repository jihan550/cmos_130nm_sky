/* 
Write a parameterized counter module:
Parameters: WIDTH, DOWN (0 = up, 1 = down), SATURATE (0 = wrap, 1 = saturating)
Ports: clk, rst_n, en, load, load_val[WIDTH-1:0], count[WIDTH-1:0]
Behavior:
    On load=1, load load_val
    Else if en=1, increment/decrement depending on DOWN
    If SATURATE=1, stay at max/min instead of wrapping

Constraints:
    Single always_ff block (if using SV)
    No latches, no multiple drivers
    Reset is async or sync – you choose, but be consistent

Deep dive:
    Sketch what synthesis will generate for:
    SATURATE=0 vs SATURATE=1
    DOWN=0 vs DOWN=1
*/

module param_counter #(
    parameter int WIDTH     = 4,
    parameter int DOWN      = 0,
    parameter int SATURATE  = 0
) (
    input  logic                 clk,
    input  logic                 rst_n,
    input  logic                 en,
    input  logic                 load,
    input  logic [WIDTH-1:0]     load_value,
    output logic [WIDTH-1:0]     count
);

    localparam logic [WIDTH-1:0] MAX_VAL = {WIDTH{1'b1}};
    localparam logic [WIDTH-1:0] MIN_VAL = '0;

    always_ff @(posedge clk or negedge rst_n) begin : counter_logic
        if (!rst_n) begin
            count <= '0;                            // ASYNC RESET
        end else begin
            if (load) begin
                count <= load_value;
            end
            else if (en) begin
                if (!DOWN) begin
                    if (SATURATE && count == MAX_VAL) begin
                        count <= MAX_VAL;          // stay at max
                    end
                    else begin
                        count <= count + 1'b1;     // natural wrap if SATURATE==0
                    end
                end
                else begin
                    if (SATURATE && count == MIN_VAL) begin
                        count <= MIN_VAL;          // stay at 0
                    end
                    else begin
                        count <= count - 1'b1;     // natural wrap if SATURATE==0
                    end
                end
            end
        end
    end

endmodule

