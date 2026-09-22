`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2026 12:28:13 PM
// Design Name: 
// Module Name: tb_room_light
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
`timescale 1ns/1ps

module tb_room_light();

    reg occupancy;
    reg is_dark;
    reg manual_on;
    wire light_on;
    wire light_latch;

    room_light uut (
        .occupancy(occupancy),
        .is_dark(is_dark),
        .manual_on(manual_on),
        .light_on(light_on),
        .light_latch(light_latch)
    );

    initial begin
   
        occupancy = 0; is_dark = 0; manual_on = 0;
        #10;

        manual_on = 1;
        #10;

        occupancy = 1; is_dark = 1;
        #10;

        manual_on = 0;
        #10;

        is_dark = 0;
        #10;

        occupancy = 1; is_dark = 1;
        #10;
        occupancy = 0;
        #10;

        $finish;
    end

endmodule