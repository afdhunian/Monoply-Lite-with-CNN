
`timescale 1ns/1ps

module tb_argmax;

    reg signed [31:0] s0, s1, s2;
    reg signed [31:0] s3, s4, s5;

    wire [2:0] class_index;

    // Unit Under Test
    argmax dut (
        .s0(s0),
        .s1(s1),
        .s2(s2),
        .s3(s3),
        .s4(s4),
        .s5(s5),
        .class_index(class_index)
    );

    task check_case;
        input signed [31:0] a, b, c;
        input signed [31:0] d, e, f;
        input [2:0] expected;

        begin
            s0 = a;
            s1 = b;
            s2 = c;
            s3 = d;
            s4 = e;
            s5 = f;

            #10;

            $display(
                "Scores: %0d %0d %0d %0d %0d %0d | Class: %0d | Expected: %0d",
                s0, s1, s2, s3, s4, s5,
                class_index, expected
            );

            if (class_index !== expected)
                $fatal(1, "ARGMAX TEST FAILED!");
        end
    endtask

    initial begin
        $display("================================");
        $display("       ARGMAX TEST START");
        $display("================================");

        // Test 1: Kelas 1 memiliki skor terbesar
        check_case(100, 20, 30, 40, 50, 60, 0);

        // Test 2: Kelas 3 memiliki skor terbesar
        check_case(10, 20, 200, 40, 50, 60, 2);

        // Test 3: Kelas 6 memiliki skor terbesar
        check_case(10, 20, 30, 40, 50, 250, 5);

        // Test 4: Semua skor negatif
        check_case(-10, -20, -30, -40, -50, -60, 0);

        // Test 5: Skor sama, pilih indeks terkecil
        check_case(100, 100, 50, 40, 30, 20, 0);

        // Test 6: Semua skor sama
        check_case(50, 50, 50, 50, 50, 50, 0);

        $display("================================");
        $display("      ARGMAX TEST PASSED");
        $display("================================");

        $finish;
    end

endmodule
