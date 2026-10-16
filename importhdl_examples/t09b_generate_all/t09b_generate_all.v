module t09b_generate_all #(parameter N = 4) (input clk, input [7:0] x, output [7:0] y);
  wire [7:0] chain [0:N];
  assign chain[0] = x;
  genvar i;
  generate for (i = 0; i < N; i = i + 1) begin : g
    reg [7:0] r;
    always @(posedge clk) r <= chain[i];
    assign chain[i+1] = r;
  end endgenerate
  assign y = chain[N];
endmodule