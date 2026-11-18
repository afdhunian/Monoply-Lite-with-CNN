`timescale 1ns/1ps
// Top-level integration placeholder for DE10-Standard project.
// This exposes a start/done shell; full image-buffer, convolution scheduling,
// pooling, flatten and six-logit datapath still need integration.
module cnn_top (
    input clk, input rst_n, input start,
    output busy, output done
);
    wire clear_acc;
    wire datapath_done = 1'b0; // Replace when CNN datapath controller is integrated.
    controller u_controller (
        .clk(clk), .rst_n(rst_n), .start(start),
        .datapath_done(datapath_done),
        .busy(busy), .done(done), .clear_acc(clear_acc)
    );
endmodule
