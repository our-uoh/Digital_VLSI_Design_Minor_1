
module seatbelt_timer (
    input  wire clk,
    input  wire rst_n,
    input  wire ignition,
    input  wire seatbelt_unbuckled,
    output reg  warning_buzzer
);

    parameter TARGET_COUNT = 5; 

    reg [3:0] timer_count;
    wire active_condition = ignition && seatbelt_unbuckled;

   
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            timer_count <= 4'd0;
        end else if (active_condition) begin
            if (timer_count < TARGET_COUNT)
                timer_count <= timer_count + 1'b1; 
        end else begin
            timer_count <= 4'd0; 
        end
    end

    always @(*) begin
        if (timer_count >= TARGET_COUNT)
            warning_buzzer = 1'b1;
        else
            warning_buzzer = 1'b0;
    end

endmodule
