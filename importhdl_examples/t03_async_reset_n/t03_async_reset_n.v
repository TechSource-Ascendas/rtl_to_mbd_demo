module t03_async_reset_n(input clk, input rst_n, input [7:0] a, output reg [7:0] q);
  always @(posedge clk or negedge rst_n) if (!rst_n) q <= 0; else q <= q + a;
endmodule