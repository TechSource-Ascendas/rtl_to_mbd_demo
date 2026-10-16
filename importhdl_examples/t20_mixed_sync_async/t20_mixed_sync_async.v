module t20_mixed_sync_async(input clk, input rst, input [7:0] a, output reg [7:0] q1, output reg [7:0] q2);
  always @(posedge clk or posedge rst) if (rst) q1 <= 0; else q1 <= a;
  always @(posedge clk) q2 <= q1;
endmodule