// -----------------------------------------------------------------------------
// fir4_legacy.v
// "Legacy" hand-written RTL used in Part 2 (HDL import) and Part 4 (cosimulation)
//
// 4-tap low-pass FIR:  y[n] = ( x[n] + 3*x[n-1] + 3*x[n-2] + x[n-3] ) / 8
//
//   x_in  : signed 16-bit, Q1.15  (Simulink: fixdt(1,16,15))
//   y_out : signed 19-bit, Q4.18  (Simulink: fixdt(1,19,18))  -- full precision, no rounding
//   Latency: 1 clock (registered output)
// -----------------------------------------------------------------------------
module fir4_legacy (
    input  wire               clk,
    input  wire               rst,      // synchronous, active-high
    input  wire               clk_en,
    input  wire signed [15:0] x_in,
    output reg  signed [18:0] y_out
);

    // tapped delay line
    reg signed [15:0] x_d1;
    reg signed [15:0] x_d2;
    reg signed [15:0] x_d3;

    // coefficients 1,3,3,1 (the /8 is a binary-point shift: Q1.15 -> Q4.18)
    wire signed [18:0] tap0 = x_in;
    wire signed [18:0] tap1 = (x_d1 <<< 1) + x_d1;   // 3*x[n-1]
    wire signed [18:0] tap2 = (x_d2 <<< 1) + x_d2;   // 3*x[n-2]
    wire signed [18:0] tap3 = x_d3;
    wire signed [18:0] acc  = tap0 + tap1 + tap2 + tap3;

    always @(posedge clk) begin
        if (rst) begin
            x_d1  <= 16'sd0;
            x_d2  <= 16'sd0;
            x_d3  <= 16'sd0;
            y_out <= 19'sd0;
        end else if (clk_en) begin
            x_d1  <= x_in;
            x_d2  <= x_d1;
            x_d3  <= x_d2;
            y_out <= acc;
        end
    end

endmodule
