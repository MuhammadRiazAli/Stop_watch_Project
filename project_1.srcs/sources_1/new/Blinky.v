`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2021 04:18:55 AM
// Design Name: 
// Module Name: Blinky
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
//////////////////////////////////////////////////////////////////////////////////

module Blinky_1Hz(clock_in, clock_out);
 input clock_in; // System clock
 output clock_out; // Low-frequency clock
 reg [31:0] counter_out; // register for storing values
 reg clock_out; // register buffer for output port

 initial begin
    counter_out<=32'h00000000; // 0 in Hexadecimal format
    clock_out<=0;
 end
 
 //this always block runs on the fast 100MHz clock
 always @(posedge clock_in)
 begin
    counter_out<=counter_out + 32'h0000001; // Adding one at every clock pulse
    if (counter_out>32'h2FAF080) // If count value reaches to 50000000 
    begin
    
        counter_out<=32'h00000000; // reset the counter
        clock_out <= ~clock_out; // and invert the clock pulse level
    end
 end
 
 endmodule
