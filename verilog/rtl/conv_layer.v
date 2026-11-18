`timescale 1ns/1ps
// Convolution MAC primitive for one output channel and one output pixel.
// Caller supplies each input-channel/kernel activation and matching weight
// in exported order; initialize accumulator with bias_q via clear+bias_load.
module conv_layer (
    input clk, input rst_n, input clear, input en,
    input [7:0] activation,
    input signed [7:0] weight,
    input signed [31:0] bias_q,
    input bias_load,
    output reg signed [63:0] acc,
    output reg valid
);
    wire signed [8:0] activation_ext = {1'b0,activation};
    wire signed [17:0] product = activation_ext * weight;
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin acc<=0; valid<=0; end
        else begin
            valid<=0;
            if(clear) acc<=0;
            else if(bias_load) acc<={{32{bias_q[31]}},bias_q};
            else if(en) begin
                acc<=acc+{{46{product[17]}},product};
                valid<=1;
            end
        end
    end
endmodule
