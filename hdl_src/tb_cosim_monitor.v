// -----------------------------------------------------------------------------
// tb_cosim_monitor.v
// Thin wrapper that lets Simulink watch the UNCHANGED Verilog testbench.
// The Vivado Simulator cosimulation block connects to top-level ports only,
// so we expose the signals we want to check through hierarchical references.
// -----------------------------------------------------------------------------
`timescale 1ns/1ps
module tb_cosim_monitor (
    output signed [15:0] x_mon,    // stimulus the testbench applied (Q1.15)
    output signed [18:0] y_mon     // response of the DUT             (Q4.18)
);
    tb_fir4_legacy tb ();          // your testbench, instantiated as-is

    assign x_mon = tb.x_in;
    assign y_mon = tb.y_out;
endmodule
