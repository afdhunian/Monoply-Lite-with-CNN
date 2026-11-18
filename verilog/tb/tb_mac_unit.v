`timescale 1ns/1ps
module tb_mac_unit;
    reg clk=0, rst_n=0, clear=0, en=0;
    reg [7:0] activation=0;
    reg signed [7:0] weight=0;
    wire signed [63:0] accumulator;
    wire valid;
    mac_unit dut(clk,rst_n,clear,en,activation,weight,accumulator,valid);
    always #5 clk=~clk;
    initial begin
        $display("MAC UINT8 x INT8 test started");
        repeat(2) @(posedge clk); #1 rst_n=1;
        @(negedge clk); clear=1;
        @(negedge clk); clear=0; en=1; activation=200; weight=-3;
        @(posedge clk); #1;
        if(accumulator !== -64'sd600) $fatal(1,"First product failed: %0d",accumulator);
        @(negedge clk); activation=100; weight=2;
        @(posedge clk); #1; en=0;
        $display("accumulator=%0d expected=-400",accumulator);
        if(accumulator !== -64'sd400) $fatal(1,"MAC failed");
        $display("MAC UNIT TEST PASS");
        #10 $finish;
    end
endmodule
