
`timescale 1ns/1ps

module tb_relu_quant;

    reg signed [63:0] acc;
    wire [7:0] result;

    // Menggunakan parameter sederhana untuk mempermudah pengujian
    relu_quant #(
        .MULT(1),
        .SHIFT(1)
    ) dut (
        .acc(acc),
        .result(result)
    );

    task check_case;
        input signed [63:0] test_acc;
        input [7:0] expected;
        begin
            acc = test_acc;
            #10;

            $display("Input: %0d | Output: %0d | Expected: %0d",
                     acc, result, expected);

            if (result !== expected)
                $fatal(1, "TEST FAILED!");

        end
    endtask

    initial begin
        $display("================================");
        $display("    RELU QUANT TEST START");
        $display("================================");

        // Test nilai nol
        check_case(0, 8'd0);

        // Test nilai positif
        check_case(100, 8'd50);

        // Test pembulatan
        check_case(3, 8'd2);

        // Test nilai negatif (ReLU)
        check_case(-4, 8'd0);

        // Test clipping maksimum 255
        check_case(600, 8'd255);

        $display("================================");
        $display("RELU QUANT TEST PASSED");
        $display("================================");

        $finish;
    end

endmodule
