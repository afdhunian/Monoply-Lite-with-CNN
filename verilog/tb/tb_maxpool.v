
`timescale 1ns/1ps

module tb_maxpool;

    reg [7:0] p00, p01, p10, p11;
    wire [7:0] pooled;

    // Unit Under Test
    maxpool dut (
        .p00(p00),
        .p01(p01),
        .p10(p10),
        .p11(p11),
        .pooled(pooled)
    );

    task check_case;
        input [7:0] a, b, c, d;
        input [7:0] expected;
        begin
            p00 = a;
            p01 = b;
            p10 = c;
            p11 = d;

            #10;

            $display(
                "Input: %0d, %0d, %0d, %0d | Output: %0d | Expected: %0d",
                p00, p01, p10, p11, pooled, expected
            );

            if (pooled !== expected)
                $fatal(1, "MAXPOOL TEST FAILED!");

        end
    endtask

    initial begin
        $display("================================");
        $display("      MAXPOOL TEST START");
        $display("================================");

        // Nilai terbesar berada di p00
        check_case(100, 50, 30, 20, 100);

        // Nilai terbesar berada di p01
        check_case(10, 200, 30, 40, 200);

        // Nilai terbesar berada di p10
        check_case(10, 20, 250, 40, 250);

        // Nilai terbesar berada di p11
        check_case(10, 20, 30, 255, 255);

        // Semua input bernilai sama
        check_case(50, 50, 50, 50, 50);

        // Semua input bernilai nol
        check_case(0, 0, 0, 0, 0);

        $display("================================");
        $display("    MAXPOOL TEST PASSED");
        $display("================================");

        $finish;
    end

endmodule
