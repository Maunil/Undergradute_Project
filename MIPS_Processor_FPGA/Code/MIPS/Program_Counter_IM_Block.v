`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:35:17 09/07/2015 
// Design Name: 
// Module Name:    Program_Counter_IM_Block 
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
module Program_Counter_IM_Block(Clk1,jmp_loc,pc_mux_sel,Ins,current_address);	

input Clk1,pc_mux_sel;//Clock1 and pc_mux_sel signals
input [7:0]jmp_loc;//for jump location

output [19:0]Ins;//20 bit instruction output
output [7:0]current_address;//current_address

wire [7:0]Temp,PC;

assign Temp = (pc_mux_sel==1) ? jmp_loc : PC;

D_FlipFlopp D1(current_address,Temp,Clk1);

Adder C1(PC,current_address);

Instruction_Memory ysda(
  .clka(Clk1), // input clka
  .ena(1'b1), // input ena
  .addra(Temp), // input [7 : 0] addra
  .douta(Ins) // output [19 : 0] douta
);

endmodule


////D flipflop's
module D_FlipFlopp(Q,D,Clk);

input [7:0]D;
input Clk;
output reg [7:0]Q;

initial Q=8'b11111111;//initla value

always@(posedge Clk)
begin
	Q=D;
end

endmodule

/// adder for increment program counter
module Adder(out,in);

input [7:0]in;
output reg [7:0]out;

always@(in)
begin
	out=in+1;
end

endmodule
