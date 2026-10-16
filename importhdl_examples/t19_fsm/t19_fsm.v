module t19_fsm(input clk, input rst, input go, output reg busy);
  localparam IDLE = 2'd0, RUN = 2'd1, DONE = 2'd2;
  reg [1:0] st;
  always @(posedge clk) if (rst) st <= IDLE; else case (st) IDLE: st <= go ? RUN : IDLE; RUN: st <= DONE; default: st <= IDLE; endcase
  always @(*) busy = (st == RUN);
endmodule