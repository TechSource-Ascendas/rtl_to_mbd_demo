`include "t21_defs.vh"
module t21_include(input clk, input [`W-1:0] a, output reg [`W-1:0] q);
  always @(posedge clk) q <= a;
endmodule