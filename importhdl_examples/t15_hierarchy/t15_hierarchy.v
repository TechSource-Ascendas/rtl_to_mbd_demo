module t15_leaf #(parameter W = 8) (input clk, input [W-1:0] a, output reg [W-1:0] q);
  always @(posedge clk) q <= a;
endmodule
module t15_hierarchy(input clk, input [15:0] a, output [15:0] q);
  wire [15:0] m;
  t15_leaf #(.W(16)) u0 (.clk(clk), .a(a), .q(m));
  t15_leaf #(.W(16)) u1 (.clk(clk), .a(m), .q(q));
endmodule