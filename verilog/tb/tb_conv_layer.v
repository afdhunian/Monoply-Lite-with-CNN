
`timescale 1ns/1ps

module tb_conv_layer;

    reg clk;
    reg rst_n;
    reg clear;
    reg en;
    reg [7:0] activation;
    reg signed [7:0] weight;
    reg signed [31:0] bias_d;
    reg bias_load;

    wire signed [63:0] acc;
    wire valid;

    // Unit Under Test
    conv_layer dut (
        .clk(clk),
        .rst_n(rst_n),
        .clear(clear),
        .en(en),
        .activation(activation),
        .weight(weight),
        .bias_d(bias_d),
        .bias_load(bias_load),
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
                $fatal(1, "CONV LAYER TEST FAILED!");
        end
    endtask

    initial begin
        clk = 0;
        rst_n = 0;
        clear = 0;
        en = 0;
        activation = 0;
        weight = 0;
        bias_d = 0;
        bias_load = 0;

        $display("================================");
        $display("    CONV LAYER TEST START");
        $display("================================");

        // Test 1: Reset
        @(posedge clk);
        #1;
        check_result(0, 0);

        // Lepaskan reset
        @(negedge clk);
        rst_n = 1;

        // Test 2: Load bias = 10
        bias_d = 10;
        bias_load = 1;

        @(posedge clk);
        check_result(10, 0);

        // Test 3: MAC = 10 + (3 x 2) = 16
        @(negedge clk);
        bias_load = 0;
        activation = 3;
        weight = 2;
        en = 1;

        @(posedge clk);
        check_result(16, 1);

        // Test 4: MAC = 16 + (4 x -2) = 8
        @(negedge clk);
        activation = 4;
        weight = -2;

        @(posedge clk);
        check_result(8, 1);

        // Test 5: Clear accumulator
        @(negedge clk);
        en = 0;
        clear = 1;

        @(posedge clk);
        check_result(0, 0);

        $display("================================");
        $display("  CONV LAYER TEST PASSED");
        $display("================================");

        $finish;
    end

endmodule
