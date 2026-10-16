module t04_two_clocks(input clk_a, input clk_b, input [7:0] a, output reg [7:0] qa, output reg [7:0] qb);
  always @(posedge clk_a) qa <= a;
  always @(posedge clk_b) qb <= qa;
endmodule