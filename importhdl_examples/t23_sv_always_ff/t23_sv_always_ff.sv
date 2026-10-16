module t23_sv_always_ff(input logic clk, input logic rst, input logic [7:0] a, output logic [7:0] q);
  always_ff @(posedge clk) if (rst) q <= '0; else q <= q + a;
endmodule
