`timescale 1ns/1ps
// Generic synchronous-read ROM. Instantiate separately for each .mem file.
module weight_rom #(
    parameter integer ADDR_WIDTH = 12,
    parameter integer DEPTH = 3072,
    parameter MEM_FILE = "dense_w.mem",
    parameter integer DATA_WIDTH = 8
)(
    input clk,
    input [ADDR_WIDTH-1:0] address,
    output reg [DATA_WIDTH-1:0] data
);
    reg [DATA_WIDTH-1:0] memory [0:DEPTH-1];
    initial $readmemh(MEM_FILE, memory);
    always @(posedge clk) data <= memory[address];
endmodule
