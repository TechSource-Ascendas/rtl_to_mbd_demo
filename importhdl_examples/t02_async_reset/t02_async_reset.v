module t02_async_reset(input clk, input rst, input [7:0] a, output reg [7:0] q);
  always @(posedge clk or posedge rst) if (rst) q <= 0; else q <= q + a;
endmodule