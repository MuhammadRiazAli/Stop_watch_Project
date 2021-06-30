# Stop_watch_Project

#Project Overview
In this project we are designing a Stopwatch In Verilog Hardware description Language (VHDL) on Xilinx Nexys 4 DDR Board. The challenge for us in this project was to access six BCD 7-Segments display simultaneously in order to showcase our results. We accomplish by this using the concept of time multiplexing for displaying our results on the six BCD 7-segment displays all at the time. Moreover, we have design three counters in our project for counting Seconds, minutes and hours and have designed three decoders for each to display on to two BCD 7segment. Like the Seconds will be displayed on first two BCD 7segements, minutes on next two and same for hours. 

#Introduction
A digital stopwatch displays the actual time in milliseconds, seconds, minutes and hours. These numbers are controlled by the clock pulse of the controller. A stopwatch can be differentiated from other watches in sense of the functionality. The normal watches the time keeps moving while the stop watch can paused or resets. 

#Design Methodology

#Time Multiplexing:  The Seven segment display of Xilinx nexys DDR4 board works on active low logic. Another difference is that the cathode of every seven segment are connected together with active low while the anode of these seven segment display can be connected individually. So to accommodate 6 segments we need time multiplexing that will activate only one segment at one time. But this process should be as fast as humane eye can’t see and appear as that all are activated on same time and this time should be in between 1ms to 16ms.

#Blinky: Blinky is used here as Clock divider which is the very important component of our design because we want to calculate real time precision to count second, minutes and hours. As, Xilinx Nexys DDR4 board produces 100 MHz clock per second. But on positive edge clock it counts two cycles so we need 50 MHz clock to count one second.
Second, Minutes, Hours Counter: After the blinky or clock divider we have created three counters, a separate for seconds, minutes and hours. This counter is using blinky module to count 0 to 59 for seconds, and then shifts to the minutes counter and count 0 to 59 for minutes and similarly for hours. To count one minute, as there are 60 seconds so we have used 6 bits, each bit counts ten seconds. This will make the enable bit as 1 and will turn zero as it reaches 59. The same process is applied to the minute’s counter and that enables the hours bit. To count one hour, we need 24 bits so we have used 2 registers each of 12 bits. This will count 3600 seconds.

#Seven Segments Decoder:  to display the output values of the seconds, minutes and hours we have used seven segment decoders. For this purpose we have used decimal to binary decoders for each segment. We have use 6 segments. The 1st two for seconds, the other two for minutes and 3rd and 4th ones for hours. The remaining two segments are kept deactivated. These termed are used for active low logic.

#Hierarchy of the modules:
![image](https://user-images.githubusercontent.com/73823822/123975778-75283300-d972-11eb-8425-9d587e23fc0e.png)
![image](https://user-images.githubusercontent.com/73823822/123975807-7c4f4100-d972-11eb-8913-ed51c8d40e8b.png)


#YouTube Link

https://youtu.be/6xJu99kJ68E




















 
