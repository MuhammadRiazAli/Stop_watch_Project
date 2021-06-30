`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2021 04:17:39 AM
// Design Name: 
// Module Name: Time_multiplexing
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


module Time_multiplexing( clock_100Mhz,reset,Anode_Activate,LED_out,Start );
input clock_100Mhz; // 100 Mhz clock source FPGA
input reset; // reset
input Start;
output reg [7:0] Anode_Activate; // anode signals of the 7-segment LED display
output reg [6:0] LED_out;
wire [2:0] LED_activating_counter;
reg [19:0] refresh_counter;
wire clock_out;
wire [13:0] seg1;
wire [13:0] seg2;
wire [13:0] seg3;
wire [5:0] counter;
wire [5:0] min_counter;
wire [3:0] hours_counter;

Blinky_1Hz inst0(.clock_in(clock_100Mhz), .clock_out(clock_out));

Seconds_counter inst1(.clk(clock_out),.reset(reset),.counter(counter),.Start(Start));

Segment_Seconds inst2(.bcd(counter),.seg1(seg1));

Minuts_counter inst3(.clk(clock_out),.reset(reset),.min_counter(min_counter),.Start(Start));

Segments_Minuts inst4(.minuts_bcd(min_counter),.seg2(seg2));

Hour_Counter inst5(.clk(clock_out), .reset(reset),.hours_counter(hours_counter),.Start(Start));

Hours_segment inst6(.hours_bcd(hours_counter),.seg3(seg3));


always @(posedge clock_100Mhz or posedge reset)
    begin 
        if(reset==1)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end 
    assign LED_activating_counter = refresh_counter[19:17];
    // anode activating signals for 4 LEDs, digit period of 2.6ms
    // decoder to generate anode signals 
    always @(*)
    begin
        case(LED_activating_counter)
        3'b000: begin
            Anode_Activate = 8'b0111_1111; 
            LED_out=seg1 [6:0];
            // activate LED1 and Deactivate LED2, LED3, LED4
          
              end
        3'b001: begin
            Anode_Activate = 8'b1011_1111;
            LED_out=seg1 [13:7]; 
            // activate LED2 and Deactivate LED1, LED3, LED4
           
              end
        3'b010: begin
            Anode_Activate = 8'b1101_1111;
            LED_out=seg2 [6:0]; 
            // activate LED3 and Deactivate LED2, LED1, LED4
            end
        3'b011: begin
            Anode_Activate = 8'b1110_1111;
            LED_out=seg2 [13:7]; 
            // activate LED4 and Deactivate LED2, LED3, LED1
                
               end
        3'b100: begin
                           Anode_Activate = 8'b1111_0111;
                          LED_out=seg3 [6:0];
                                        // activate LED4 and Deactivate LED2, LED3, LED1
                              
                              end
         3'b101: begin
                         Anode_Activate = 8'b1111_1011;
                                          LED_out=seg3 [13:7]; 
                                          // activate LED4 and Deactivate LED2, LED3, LED1
                                          
                                    end
          3'b110: begin
                           Anode_Activate = 8'b1111_1111;
                                             //            LED_out=seg2 [13:7]; 
                                                         // activate LED4 and Deactivate LED2, LED3, LED1
                                                           
                                     end
            3'b111: begin
                             Anode_Activate = 8'b1111_1111;
                                                            //            LED_out=seg2 [13:7]; 
                                                                        // activate LED4 and Deactivate LED2, LED3, LED1
                                                                        //LED_BCD = ((displayed_number % 1000)%100)%10;
                                                                        // the fourth digit of the 16-bit number    
                                       end
        endcase
    end



endmodule

