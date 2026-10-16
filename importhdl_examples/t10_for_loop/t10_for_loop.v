module t10_for_loop(input clk, input [7:0] x, output [7:0] y);
  reg [7:0] d [0:3]; integer i;
  always @(posedge clk) begin d[0] <= x; for (i = 1; i < 4; i = i + 1) d[i] <= d[i-1]; end
  assign y = d[3];
endmodule