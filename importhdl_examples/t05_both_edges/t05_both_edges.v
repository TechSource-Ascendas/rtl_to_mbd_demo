module t05_both_edges(input clk, input [7:0] a, output reg [7:0] q1, output reg [7:0] q2);
  always @(posedge clk) q1 <= a;
  always @(negedge clk) q2 <= q1;
endmodule