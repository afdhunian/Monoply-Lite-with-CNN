`timescale 1ns/1ps
// Basic transaction controller skeleton for a future integrated CNN datapath.
// It sequences IDLE -> RUN -> DONE; datapath-specific counters connect later.
module controller (
    input clk, input rst_n, input start,
    input datapath_done,
    output reg busy, output reg done,
    output reg clear_acc
);
    localparam IDLE=2'd0, RUN=2'd1, FINISH=2'd2;
    reg [1:0] state;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin state<=IDLE; busy<=0; done<=0; clear_acc<=0; end
        else begin
            done<=0; clear_acc<=0;
            case(state)
                IDLE: if(start) begin state<=RUN; busy<=1; clear_acc<=1; end
                RUN: if(datapath_done) begin state<=FINISH; busy<=0; end
                FINISH: begin done<=1; state<=IDLE; end
                default: begin state<=IDLE; busy<=0; end
            endcase
        end
    end
endmodule
