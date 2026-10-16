module t22_reset_name(input clock, input sclr, input [7:0] a, output reg [7:0] q);
  always @(posedge clock) if (sclr) q <= 0; else q <= a;
endmodule