
`timescale 1ns/1ps

module tb_bias_rom;

    reg clk;
    reg [2:0] address;
    wire signed [31:0] data;

    // ROM untuk membaca Conv1 Bias
    bias_rom #(
        .ADDR_WIDTH(3),
        .DEPTH(8),
        .MEM_FILE("../weights/conv1_b.mem")
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
        $display("       BIAS ROM TEST START");
        $display("================================");

        // Test address 0
        @(posedge clk);
        #1;
        $display("Address 0: %h", data);
        if (data === 32'hxxxxxxxx)
            $fatal(1, "Address 0 FAILED");

        // Test address 1
        @(negedge clk);
        address = 1;
        @(posedge clk);
        #1;
        $display("Address 1: %h", data);
        if (data === 32'hxxxxxxxx)
            $fatal(1, "Address 1 FAILED");

        // Test address 2
        @(negedge clk);
        address = 2;
        @(posedge clk);
        #1;
        $display("Address 2: %h", data);
        if (data === 32'hxxxxxxxx)
            $fatal(1, "Address 2 FAILED");

        $display("================================");
        $display("BIAS ROM TEST PASSED");
        $display("================================");

        $finish;
    end

endmodule
