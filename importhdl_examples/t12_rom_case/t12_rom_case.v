module t12_rom_case(input clk, input [1:0] addr, output reg [7:0] q);
  always @(posedge clk) case (addr) 2'd0: q <= 8'd1; 2'd1: q <= 8'd2; 2'd2: q <= 8'd4; default: q <= 8'd8; endcase
endmodule