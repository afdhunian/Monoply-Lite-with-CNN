
`timescale 1ns/1ps

module tb_dense_layer;

    // Input signals
    reg clk;
    reg rst_n;
    reg clear;
    reg en;
    reg [7:0] feature;
    reg signed [7:0] weight;
    reg signed [31:0] bias;

    // Output signals
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

    // Task to check output
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

            $display("TEST PASSED");
        end
    endtask

    initial begin
        // Initialization
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

        // TEST 1: Reset
        @(posedge clk);
        check_result(0, 0);

        // Release reset
        @(negedge clk);
        rst_n = 1;

        // TEST 2: Load bias = 10
        bias = 10;
        clear = 1;

        @(posedge clk);
        check_result(10, 0);

        // TEST 3: MAC positive
        // 10 + (3 x 2) = 16
        @(negedge clk);
        clear = 0;
        feature = 3;
        weight = 2;
        en = 1;

        @(posedge clk);
        check_result(16, 1);

        // TEST 4: MAC negative
        // 16 + (4 x -2) = 8
        @(negedge clk);
        feature = 4;
        weight = -2;

        @(posedge clk);
        check_result(8, 1);

        // TEST 5: Clear and load new bias = 20
        @(negedge clk);
        en = 0;
        bias = 20;
        clear = 1;

        @(posedge clk);
        check_result(20, 0);

        // TEST 6: MAC after loading new bias
        // 20 + (5 x 3) = 35
        @(negedge clk);
        clear = 0;
        feature = 5;
        weight = 3;
        en = 1;

        @(posedge clk);
        check_result(35, 1);

        // TEST 7: Idle condition
        @(negedge clk);
        en = 0;

        @(posedge clk);
        check_result(35, 0);

        $display("================================");
        $display("  DENSE LAYER TEST PASSED");
        $display("  ALL TESTS SUCCESSFUL");
        $display("================================");

        $finish;
    end

endmodule
