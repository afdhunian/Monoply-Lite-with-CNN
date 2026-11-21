
`timescale 1ns/1ps

module tb_image_buffer;

    reg clk;
    reg rst_n;

    reg wr_en;
    reg [9:0] wr_addr;
    reg [7:0] wr_data;

    reg [9:0] rd_addr;
    wire [7:0] rd_data;

    // Unit Under Test
    image_buffer dut (
        .clk(clk),
        .rst_n(rst_n),
        .wr_en(wr_en),
        .wr_addr(wr_addr),
        .wr_data(wr_data),
        .rd_addr(rd_addr),
        .rd_data(rd_data)
    );

    // Clock period = 10 ns
    always #5 clk = ~clk;

    task write_pixel;
        input [9:0] address;
        input [7:0] data;
        begin
            @(negedge clk);
            wr_en = 1;
            wr_addr = address;
            wr_data = data;

            @(posedge clk);
            #1;
        end
    endtask

    task read_pixel;
        input [9:0] address;
        input [7:0] expected;
        begin
            @(negedge clk);
            wr_en = 0;
            rd_addr = address;

            @(posedge clk);
            #1;

            $display(
                "Address: %0d | Data: %h | Expected: %h",
                address, rd_data, expected
            );

            if (rd_data !== expected)
                $fatal(1, "IMAGE BUFFER TEST FAILED!");
        end
    endtask

    initial begin
        clk = 0;
        rst_n = 0;
        wr_en = 0;
        wr_addr = 0;
        wr_data = 0;
        rd_addr = 0;

        $display("================================");
        $display("  IMAGE BUFFER TEST START");
        $display("================================");

        // Reset
        repeat (2) @(posedge clk);
        @(negedge clk);
        rst_n = 1;

        // Write test pixels
        write_pixel(0,    8'h12);
        write_pixel(1,    8'hA5);
        write_pixel(100,  8'h7F);
        write_pixel(1023, 8'hFF);

        // Read and verify pixels
        read_pixel(0,    8'h12);
        read_pixel(1,    8'hA5);
        read_pixel(100,  8'h7F);
        read_pixel(1023, 8'hFF);

        $display("================================");
        $display(" IMAGE BUFFER TEST PASSED");
        $display("================================");

        $finish;
    end

endmodule
