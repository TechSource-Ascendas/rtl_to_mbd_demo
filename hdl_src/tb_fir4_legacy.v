// -----------------------------------------------------------------------------
// tb_fir4_legacy.v
// A typical hand-written, self-contained Verilog testbench (no ports):
// clock/reset generation, random stimulus, $display, $finish.
// Used unchanged in Part 4, section 9 (Verilog testbench + Simulink checker).
// -----------------------------------------------------------------------------
`timescale 1ns/1ps
module tb_fir4_legacy;

    reg                clk    = 1'b0;
    reg                rst    = 1'b1;
    reg                clk_en = 1'b1;
    reg  signed [15:0] x_in   = 16'sd0;
    wire signed [18:0] y_out;

    integer n    = 0;
    integer seed = 7;

    fir4_legacy dut (
        .clk   (clk),
        .rst   (rst),
        .clk_en(clk_en),
        .x_in  (x_in),
        .y_out (y_out)
    );

    // 100 MHz clock
    always #5 clk = ~clk;

    // reset for 3 clocks
    initial begin
        repeat (3) @(posedge clk);
        rst <= 1'b0;
    end

    // stimulus: +/-12000 square wave (period 64 clocks) plus random noise
    always @(posedge clk) begin
        if (!rst) begin
            n    <= n + 1;
            x_in <= (((n % 64) < 32) ? 16'sd12000 : -16'sd12000) + ($random(seed) % 4000);
        end
    end

    // simple monitor
    always @(posedge clk)
        if (!rst && (n % 50 == 0))
            $display("%t  n=%0d  x_in=%0d  y_out=%0d", $time, n, x_in, y_out);

`ifndef COSIM
    // stand-alone run length; under cosimulation Simulink decides when to stop
    initial #5000 $finish;
`endif

endmodule
