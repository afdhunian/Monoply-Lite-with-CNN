
`timescale 1ns/1ps

module tb_mac_unit;

    reg clk;
    reg rst_n;
    reg clear;
    reg en;
    reg [7:0] activation;
    reg signed [7:0] weight;

    wire signed [63:0] accumulator;
    wire valid;

    mac_unit dut (
        .clk(clk),
        .rst_n(rst_n),
        .clear(clear),
        .en(en),
        .activation(activation),
        .weight(weight),
        .accumulator(accumulator),
        .valid(valid)
    );

    always #5 clk = ~clk;

    task check_result;
        input signed [63:0] expected_acc;
        input expected_valid;
        begin
            #1;

            $display(
                "ACC = %0d | VALID = %b | EXPECTED = %0d",
                accumulator, valid, expected_acc
            );

            if (accumulator !== expected_acc ||
                valid !== expected_valid)
                $fatal(1, "MAC UNIT TEST FAILED!");
        end
    endtask

    initial begin
        clk = 0;
        rst_n = 0;
        clear = 0;
        en = 0;
        activation = 0;
        weight = 0;

        $display("================================");
        $display("      MAC UNIT TEST START");
        $display("================================");

        // Test 1: Reset
        @(posedge clk);
        check_result(0, 0);

        // Release reset
        @(negedge clk);
        rst_n = 1;

        // Test 2: 200 x (-3) = -600
        activation = 200;
        weight = -3;
        en = 1;

        @(posedge clk);
        check_result(-600, 1);

        // Test 3: -600 + (100 x 2) = -400
        @(negedge clk);
        activation = 100;
        weight = 2;

        @(posedge clk);
        check_result(-400, 1);

        // Test 4: Disable, accumulator harus tetap
        @(negedge clk);
        en = 0;

        @(posedge clk);
        check_result(-400, 0);

        // Test 5: Clear accumulator
        @(negedge clk);
        clear = 1;

        @(posedge clk);
        check_result(0, 0);

        $display("================================");
        $display("     MAC UNIT TEST PASSED");
        $display("================================");

        $finish;
    end

endmodule
