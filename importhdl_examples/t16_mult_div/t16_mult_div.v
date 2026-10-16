module t16_mult_div(input clk, input signed [15:0] a, input signed [15:0] b, output reg signed [31:0] p, output reg [7:0] d);
  always @(posedge clk) begin p <= a * b; d <= a[7:0] / 8'd3; end
endmodule