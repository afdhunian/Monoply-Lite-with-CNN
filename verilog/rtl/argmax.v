`timescale 1ns/1ps
// Argmax for six signed logits. Class index 0..5 corresponds to die 1..6.
module argmax (
    input signed [31:0] s0, input signed [31:0] s1,
    input signed [31:0] s2, input signed [31:0] s3,
    input signed [31:0] s4, input signed [31:0] s5,
    output reg [2:0] class_index
);
    reg signed [31:0] best;
    always @* begin
        best = s0; class_index = 0;
        if (s1 > best) begin best=s1; class_index=1; end
        if (s2 > best) begin best=s2; class_index=2; end
        if (s3 > best) begin best=s3; class_index=3; end
        if (s4 > best) begin best=s4; class_index=4; end
        if (s5 > best) begin best=s5; class_index=5; end
    end
endmodule
