`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:28:15 09/07/2015 
// Design Name: 
// Module Name:    Jump_Control_Block 
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
module Jump_Control_Block(ins, flag_ex, current_address, interrupt,jmp_loc, pc_mux_sel);

input [19:0] ins;//Instruction
input [7:0] current_address;//current address from which ins is fetched
input [3:0] flag_ex;//flag from execution
input interrupt;//interrupt signal
output reg [7:0]jmp_loc;
output reg pc_mux_sel;


initial jmp_loc = 8'h00;
initial pc_mux_sel=0;
//reg [7:0]addr;// temparary address
//reg [3:0]f;//temporary flag

//initial addr = 8'b00000000;
//initial f = 4'b0000;

/*
always@(interrupt)
begin
	if(interrupt==1'b1)
		begin
				addr = current_address;//store current address in temporary address and flag
				f = flag_ex;
				jmp_loc = 8'hF0;//assign jump location
				pc_mux_sel = 1'b1;
		end
	else
	begin
			//jmp_loc = jmp_loc;
			pc_mux_sel = 1'b0;
	end
end
*/

always @(ins,flag_ex)
begin
	/*if(interrupt==1'b1)
	begin
			addr = current_address;//store current address in temporary address and flag
			f = flag_ex;
			jmp_loc = 8'hF0;//assign jump location
			pc_mux_sel = 1'b1;
	end*/
	if(ins[19:15]== 5'b 11000)///Unconditinal Jump :- give pc_mux_sel = 1 and first 8 bit of ins to as address
		begin
				jmp_loc=ins[7:0];
				pc_mux_sel=1'b1;
		end
	else if(ins[19:15]== 5'b 11110 && flag_ex[1]==1'b1)//Conditional jump zero give pc_mux_sel = 1 and first 8 bit of ins as address
		begin
				jmp_loc = ins [7:0];
				pc_mux_sel = 1'b1;
		end
	else if(ins[19:15]== 5'b 11111 && flag_ex[1]==1'b0)//Conditional jump not zero give pc_mux_sel = 1 and first 8 bit of ins as address
		begin
			jmp_loc = ins [7:0];
			pc_mux_sel = 1'b1;
		end
	else if(ins[19:15]== 5'b 11100 && flag_ex[0]==1'b1)//Conditional jump carry give pc_mux_sel = 1 and first 8 bit of ins as address
		begin
			jmp_loc = ins [7:0];
			pc_mux_sel = 1'b1;
		end
	else if(ins[19:15]== 5'b 11101 && flag_ex[0]==1'b0)//Conditional jump not carry give pc_mux_sel = 1 and first 8 bit of ins as address
		begin
			jmp_loc = ins [7:0];
			pc_mux_sel = 1'b1;
		end
	/*else if(ins[19:15]== 5'b10000)//interrupt
		begin
			jmp_loc = addr;
			pc_mux_sel = 1'b1;
		end*/
	else
		begin
			jmp_loc = 8'b00000000;
			pc_mux_sel = 1'b0;
		end	
end

endmodule

