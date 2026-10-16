module t07_task(input clk, input [7:0] a, output reg [7:0] q);
  task add1; input [7:0] x; output [7:0] y; begin y = x + 1; end endtask
  always @(posedge clk) add1(a, q);
endmodule