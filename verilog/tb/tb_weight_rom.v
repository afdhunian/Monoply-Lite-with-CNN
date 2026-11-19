
`timescale 1ns/1ps

module tb_weight_rom;

    reg clk;
    reg [11:0] address;
    wire [7:0] data;

    // ROM untuk membaca dense weights
    weight_rom #(
        .ADDR_WIDTH(12),
        .DEPTH(3072),
        .MEM_FILE("../weights/dense_w.mem"),
        .DATA_WIDTH(8)
    ) dut (
        .clk(clk),
        .address(address),
        .data(data)
    );

    // Clock period = 10 ns
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        address = 0;

        $display("================================");
        $display("     WEIGHT ROM TEST START");
        $display("================================");

        // Address 0: expected 0x27
        @(posedge clk);
        #1;
        if (data !== 8'h27)
            $fatal(1, "Address 0 FAILED: %h", data);
        else
            $display("Address 0 PASS: %h", data);

        // Address 1: expected 0x25
        @(negedge clk);
        address = 1;
        @(posedge clk);
        #1;
        if (data !== 8'h25)
            $fatal(1, "Address 1 FAILED: %h", data);
        else
            $display("Address 1 PASS: %h", data);

        // Address 2: expected 0x29
        @(negedge clk);
        address = 2;
        @(posedge clk);
        #1;
        if (data !== 8'h29)
            $fatal(1, "Address 2 FAILED: %h", data);
        else
            $display("Address 2 PASS: %h", data);

        $display("================================");
        $display("WEIGHT ROM TEST PASSED");
        $display("================================");

        $finish;
    end

endmodule
