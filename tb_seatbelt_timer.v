`timescale 1ns/1ps

module tb_seatbelt_timer;

    reg clk = 0, rst_n = 0, ignition = 0, seatbelt_unbuckled = 0;
    wire warning_buzzer;

    seatbelt_timer #(.TARGET_COUNT(5)) uut (clk, rst_n, ignition, seatbelt_unbuckled, warning_buzzer);

    always #5 clk = ~clk;

    initial begin
        #15 rst_n = 1;
        #10 ignition = 1; seatbelt_unbuckled = 1;
        #60; 

        #10 seatbelt_unbuckled = 0;
        #20 $finish;
    end

endmodule