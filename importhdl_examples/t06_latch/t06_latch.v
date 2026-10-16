module t06_latch(input en, input [7:0] a, output reg [7:0] q);
  always @(*) if (en) q = a;
endmodule