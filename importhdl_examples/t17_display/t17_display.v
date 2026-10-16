module t17_display(input clk, input [7:0] a, output reg [7:0] q);
  always @(posedge clk) begin q <= a; $display("q=%d", q); end
endmodule