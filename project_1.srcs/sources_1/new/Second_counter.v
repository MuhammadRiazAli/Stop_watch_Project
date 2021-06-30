`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2021 04:20:01 AM
// Design Name: 
// Module Name: Second_counter
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


module Seconds_counter(clk,reset,counter,Start);
    
input clk,reset,Start; //start stop buttton "Start"
output [5:0] counter;

reg [5:0] counter_up;


always @(posedge clk or posedge reset)
begin
if(reset)
counter_up<=6'd0;
else if(Start)
begin
counter_up<=counter_up+6'd1;
if(counter_up>=59)
begin
counter_up<=6'd0;
end
end
else
begin
counter_up<=counter_up;
end
end

assign counter = counter_up;



endmodule
