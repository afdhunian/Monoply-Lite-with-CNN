`timescale 1ns/1ps
// One dense neuron MAC primitive. Supply 512 feature/weight pairs in order.
// Add the corresponding INT32 bias before accumulation using the caller.
module dense_layer (
    input clk, input rst_n, input clear, input en,
    input [7:0] feature,
    input signed [7:0] weight,
    input signed [31:0] bias,
    output reg signed [63:0] acc,
    output reg valid
);
    wire signed [8:0] feature_ext = {1'b0,feature};
    wire signed [17:0] product = feature_ext * weight;
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin acc<=0; valid<=0; end
        else begin
            valid<=0;
            if(clear) acc <= {{32{bias[31]}},bias};
            else if(en) begin
                acc <= acc + {{46{product[17]}},product};
                valid<=1;
            end
        end
    end
endmodule
