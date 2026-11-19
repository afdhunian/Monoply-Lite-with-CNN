
`timescale 1ns/1ps

module tb_dense_layer;

    reg clk;
    reg rst_n;
    reg clear;
    reg en;
    reg [7:0] feature;
    reg signed [7:0] weight;
    reg signed [31:0] bias;

    wire signed [63:0] acc;
    wire valid;

    // Unit Under Test
    dense_layer dut (
        .clk(clk),
        .rst_n(rst_n),
        .clear(clear),
        .en(en),
        .feature(feature),
        .weight(weight),
        .bias(bias),
        .acc(acc),
        .valid(valid)
    );

    // Clock period = 10 ns
    always #5 clk = ~clk;

    task check_result;
        input signed [63:0] expected_acc;
        input expected_valid;
        begin
            #1;

            $display(
                "ACC = %0d | VALID = %b | EXPECTED ACC = %0d",
                acc, valid, expected_acc
            );

            if (acc !== expected_acc || valid !== expected_valid)
                $fatal(1, "DENSE LAYER TEST FAILED!");
        end
    endtask

    initial begin
        clk = 0;
        rst_n = 0;
        clear = 0;
        en = 0;
        feature = 0;
        weight = 0;
        bias = 0;

        $display("================================");
        $display("   DENSE LAYER TEST START");
        $display("================================");

        // Test 1: Reset
        @(posedge clk);
        check_result(0, 0);

        // Lepaskan reset
        @(negedge clk);
        rst_n = 1;

        // Test 2: Load bias = 10
        bias = 10;
        clear = 1;

        @(posedge clk);
        check_result(10, 0);

        // Test 3: MAC = 10 + (3 x 2) = 16
        @(negedge clk);
        clear = 0;
        feature = 3;
        weight = 2;
        en = 1;

        @(posedge clk);
        check_result(16, 1);

        // Test 4: MAC = 16 + (4 x -2) = 8
        @(negedge clk);
        feature = 4;
        weight = -2;

        @(posedge clk);
        check_result(8, 1);

        // Test 5: Clear dan load bias baru = 20
        @(negedge clk);
        en = 0;
        bias = 20;
        clear = 1;

        @(posedge clk);
        check_result(20, 0);

        $display("================================");
        $display("  DENSE LAYER TEST PASSED");
        $display("================================");

        $finish;
    end

endmodule
