
`timescale 1ns/1ps

module tb_conv_layer;

    // Input
    reg clk;
    reg rst_n;
    reg clear;
    reg en;
    reg [7:0] activation;
    reg signed [7:0] weight;
    reg signed [31:0] bias_q;
    reg bias_load;

    // Output
    wire signed [63:0] acc;
    wire valid;

    // DUT: Device Under Test
    conv_layer uut (
        .clk(clk),
        .rst_n(rst_n),
        .clear(clear),
        .en(en),
        .activation(activation),
        .weight(weight),
        .bias_q(bias_q),
        .bias_load(bias_load),
        .acc(acc),
        .valid(valid)
    );

    // Clock: periode 10 ns
    always #5 clk = ~clk;

    initial begin
        // Inisialisasi
        clk = 0;
        rst_n = 0;
        clear = 0;
        en = 0;
        activation = 0;
        weight = 0;
        bias_q = 0;
        bias_load = 0;

        $display("==================================");
        $display(" TESTBENCH CONV_LAYER");
        $display("==================================");

        // TEST 1: Reset
        #12;
        rst_n = 1;
        #2;

        if (acc == 0)
            $display("TEST 1 PASS: Reset berhasil");
        else
            $display("TEST 1 FAIL: Reset tidak berhasil");

        // TEST 2: Load bias
        @(negedge clk);
        bias_q = 100;
        bias_load = 1;

        @(negedge clk);
        bias_load = 0;
        #1;

        if (acc == 100)
            $display("TEST 2 PASS: Bias berhasil dimuat");
        else
            $display("TEST 2 FAIL: acc = %0d, expected = 100", acc);

        // TEST 3: MAC positif
        // 100 + (10 * 2) = 120
        @(negedge clk);
        activation = 10;
        weight = 2;
        en = 1;

        @(negedge clk);
        en = 0;
        #1;

        if (acc == 120)
            $display("TEST 3 PASS: MAC positif berhasil");
        else
            $display("TEST 3 FAIL: acc = %0d, expected = 120", acc);

        // TEST 4: MAC negatif
        // 120 + (5 * -3) = 105
        @(negedge clk);
        activation = 5;
        weight = -3;
        en = 1;

        @(negedge clk);
        en = 0;
        #1;

        if (acc == 105)
            $display("TEST 4 PASS: MAC negatif berhasil");
        else
            $display("TEST 4 FAIL: acc = %0d, expected = 105", acc);

        // TEST 5: Clear accumulator
        @(negedge clk);
        clear = 1;

        @(negedge clk);
        clear = 0;
        #1;

        if (acc == 0)
            $display("TEST 5 PASS: Clear accumulator berhasil");
        else
            $display("TEST 5 FAIL: acc = %0d, expected = 0", acc);

        // TEST 6: Load bias negatif
        @(negedge clk);
        bias_q = -50;
        bias_load = 1;

        @(negedge clk);
        bias_load = 0;
        #1;

        if (acc == -50)
            $display("TEST 6 PASS: Bias negatif berhasil");
        else
            $display("TEST 6 FAIL: acc = %0d, expected = -50", acc);

        // TEST 7: Valid signal
        @(negedge clk);
        activation = 4;
        weight = 5;
        en = 1;

        @(posedge clk);
        #1;

        if (valid == 1)
            $display("TEST 7 PASS: Valid aktif saat MAC");
        else
            $display("TEST 7 FAIL: Valid tidak aktif");

        @(negedge clk);
        en = 0;

        @(posedge clk);
        #1;

        if (valid == 0)
            $display("TEST 8 PASS: Valid kembali nonaktif");
        else
            $display("TEST 8 FAIL: Valid tidak kembali nonaktif");

        // Hasil akhir
        $display("----------------------------------");
        $display("Final accumulator = %0d", acc);
        $display("Simulation selesai");
        $display("==================================");

        #10;
        $finish;
    end

endmodule
