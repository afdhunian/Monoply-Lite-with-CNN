
`timescale 1ns/1ps

module tb_controller;

    reg clk;
    reg reset;
    reg start;
    reg datapath_done;

    wire busy;
    wire done;

    controller dut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .datapath_done(datapath_done),
        .busy(busy),
        .done(done)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        start = 0;
        datapath_done = 0;

        $display("================================");
        $display("     CONTROLLER TEST START");
        $display("================================");

        // Reset
        #10;
        reset = 0;

        // Start proses
        @(negedge clk);
        start = 1;

        @(negedge clk);
        start = 0;

        // Tunggu datapath selesai
        repeat (3) @(negedge clk);
        datapath_done = 1;

        @(negedge clk);
        datapath_done = 0;

        // Periksa hasil
        #1;
        if (done === 1'b1)
            $display("CONTROLLER TEST PASSED");
        else
            $display("CONTROLLER TEST CHECK: done is not high");

        $display("================================");
        $finish;
    end

endmodule
