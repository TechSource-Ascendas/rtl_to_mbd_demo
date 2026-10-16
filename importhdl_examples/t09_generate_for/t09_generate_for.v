module t09_generate_for #(parameter N = 4) (input clk, input [7:0] x, output [7:0] y);
  reg [7:0] d [0:N-1];
  genvar i;
  generate for (i = 1; i < N; i = i + 1) begin : g
    always @(posedge clk) d[i] <= d[i-1];
  end endgenerate
  always @(posedge clk) d[0] <= x;
  assign y = d[N-1];
endmodule