`timescale 1ns/1ps
// Unsigned UINT8 activation multiplied by signed INT8 weight.
module mac_unit (
    input clk, input rst_n, input clear, input en,
    input [7:0] activation,
    input signed [7:0] weight,
    output reg signed [63:0] accumulator,
    output reg valid
);
    wire signed [8:0] activation_ext = {1'b0, activation};
    wire signed [17:0] product = activation_ext * weight;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin accumulator <= 0; valid <= 0; end
        else begin
            valid <= 0;
            if (clear) accumulator <= 0;
            else if (en) begin
                accumulator <= accumulator + {{46{product[17]}},product};
                valid <= 1;
            end
        end
    end
endmodule
