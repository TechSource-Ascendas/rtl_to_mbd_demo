module t13_ram(input clk, input we, input [3:0] wa, input [3:0] ra, input [15:0] din, output reg [15:0] dout);
  reg [15:0] mem [0:15];
  always @(posedge clk) begin if (we) mem[wa] <= din; dout <= mem[ra]; end
endmodule