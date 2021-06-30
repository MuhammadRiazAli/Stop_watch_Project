`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2021 04:24:07 AM
// Design Name: 
// Module Name: Hours_counter
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


module Hour_Counter(clk, reset,hours_counter,Start);
    
    input clk, reset,Start;
    
    output [3:0] hours_counter;
reg [11:0] counter_up;
reg [3:0] counter_up1;
reg enable;

initial
begin
counter_up1<=4'd0;
end
initial
begin
counter_up<=12'd0;
end

always @(posedge clk or posedge reset)
begin
if(reset)
begin
 counter_up1 <= 4'd0;
 counter_up<=12'd0;
end 
else if(Start)
 begin 
 counter_up <= counter_up + 12'd1; 
if(counter_up>=3599)
begin
counter_up<=0;
enable<=1;
end

if(enable==1 && counter_up==0)
begin
counter_up1<=counter_up1+4'd1;
end
if(counter_up1>=12)
begin
counter_up1<=0;
end
end
else
begin
counter_up1 <= counter_up1;
counter_up <=counter_up;
end
end
assign hours_counter = counter_up1;

endmodule