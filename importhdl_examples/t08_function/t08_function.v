module t08_function(input clk, input [7:0] a, output reg [7:0] q);
  function [7:0] sat_add; input [7:0] x, y; reg [8:0] s; begin s = x + y; sat_add = s[8] ? 8'hFF : s[7:0]; end endfunction
  always @(posedge clk) q <= sat_add(a, q);
endmodule