`timescale 1ns/1ps
// Generic 32-bit bias ROM. Bias files are two's-complement hexadecimal.
module bias_rom #(
    parameter integer ADDR_WIDTH = 6,
    parameter integer DEPTH = 32,
    parameter MEM_FILE = "conv3_b.mem"
)(
    input clk,
    input [ADDR_WIDTH-1:0] address,
    output reg signed [31:0] data
);
    reg [31:0] memory [0:DEPTH-1];
    initial $readmemh(MEM_FILE, memory);
    always @(posedge clk) data <= memory[address];
endmodule
