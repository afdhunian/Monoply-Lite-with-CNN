`timescale 1ns/1ps
// Requantize accumulator to UINT8 using multiplier/shift from params.vh.
// Implements: (acc*MULT + 2^(SHIFT-1)) >>> SHIFT, clipped to 0..255.
module relu_quant #(
    parameter integer MULT = 40577,
    parameter integer SHIFT = 24
)(
    input signed [63:0] acc,
    output reg [7:0] result
);
    reg signed [127:0] scaled;
    reg signed [127:0] rounded;
    always @* begin
        scaled = acc * MULT;
        rounded = (scaled + (128'sd1 <<< (SHIFT-1))) >>> SHIFT;
        if (rounded < 0) result = 8'd0;
        else if (rounded > 255) result = 8'd255;
        else result = rounded[7:0];
    end
endmodule
