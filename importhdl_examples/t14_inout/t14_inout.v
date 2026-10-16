module t14_inout(input oe, input [7:0] a, inout [7:0] pad);
  assign pad = oe ? a : 8'bz;
endmodule