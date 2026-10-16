module t11_rom_initial(input clk, input [1:0] addr, output reg [7:0] q);
  reg [7:0] rom [0:3];
  initial begin rom[0] = 8'd1; rom[1] = 8'd2; rom[2] = 8'd4; rom[3] = 8'd8; end
  always @(posedge clk) q <= rom[addr];
endmodule