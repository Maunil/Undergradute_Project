`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:41:19 10/16/2015 
// Design Name: 
// Module Name:    ClockGeneration 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ClockGeneration(Input_Clk,Output_Clk);
input Input_Clk;//Input 50 MHz Clock
output reg Output_Clk;//Output 1 MHz Clock

reg [4:0]Counter;//Counter for counting 25 clock interval

//initialization for output clock 1 MHz
initial Counter = -1;
initial Output_Clk = 1'b0;

always@(posedge Input_Clk)
begin
	if(Counter == 24)
		begin
			Output_Clk = ~Output_Clk;
			Counter = 0;
		end
	else
		begin
			Counter = Counter + 1;
		end
end


endmodule
