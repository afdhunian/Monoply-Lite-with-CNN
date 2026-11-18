`timescale 1ns/1ps
// Combinational 2x2 max-pool primitive. Feed four neighboring UINT8 values.
module maxpool (
    input [7:0] p00, input [7:0] p01,
    input [7:0] p10, input [7:0] p11,
    output [7:0] pooled
);
    wire [7:0] m0 = (p00 > p01) ? p00 : p01;
    wire [7:0] m1 = (p10 > p11) ? p10 : p11;
    assign pooled = (m0 > m1) ? m0 : m1;
endmodule
