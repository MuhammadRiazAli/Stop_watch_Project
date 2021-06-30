`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2021 04:24:54 AM
// Design Name: 
// Module Name: Segments_hours
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


module Hours_segment(hours_bcd,seg3);

input [3:0] hours_bcd;
output reg [13:0] seg3;


always @ (hours_bcd)
begin
   case(hours_bcd)
           0: seg3 = 14'b0000001_0000001; // "0"     
           1: seg3 = 14'b0000001_1001111; // "1" 
           2: seg3 = 14'b0000001_0010010; // "2" 
           3: seg3 = 14'b0000001_0000110; // "3" 
           4: seg3 = 14'b0000001_1001100; // "4" 
           5: seg3 = 14'b0000001_0100100; // "5" 
           6: seg3 = 14'b0000001_0100000; // "6" 
           7: seg3 = 14'b0000001_0001111; // "7" 
           8: seg3 = 14'b0000001_0000000; // "8"     
           9: seg3 = 14'b0000001_0000100; // "9"
           
           10: seg3 = 14'b1001111_0000001; // "10"     
           11: seg3 = 14'b1001111_1001111; // "11" 
           12: seg3 = 14'b1001111_0010010; // "12" 
 
   
           default: seg3 = 14'b0000001_0000001;
    endcase
   
end    

endmodule