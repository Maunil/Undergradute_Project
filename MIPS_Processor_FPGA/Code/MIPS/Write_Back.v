`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:41:40 09/19/2015 
// Design Name: 
// Module Name:    Write_Back 
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
module Write_Back(mux_ans_dm,Clk5,ans_wb);

input [7:0]mux_ans_dm;//data from data memory block
input Clk5;//clock5
output reg [7:0]ans_wb;//data which we want to write in register file

always@(posedge Clk5)
begin
	ans_wb<=mux_ans_dm;
end

endmodule
