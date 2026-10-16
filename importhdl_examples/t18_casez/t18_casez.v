module t18_casez(input [3:0] req, output reg [1:0] gnt);
  always @(*) casez (req) 4'b1???: gnt = 2'd3; 4'b01??: gnt = 2'd2; 4'b001?: gnt = 2'd1; default: gnt = 2'd0; endcase
endmodule