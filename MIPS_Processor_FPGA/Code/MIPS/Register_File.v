`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:58:42 09/07/2015 
// Design Name: 
// Module Name:    Register_File 
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
module Register_File(Ins, RW_dm, ans_ex, mux_ans_dm, ans_wb, Imm, mux_sel_a, mux_sel_b, Imm_sel, clk2, clk5, A, B);

input [19:0]Ins; // Instruction from program memory
input [4:0]RW_dm; //Address for read or write
input [7:0]ans_ex; //Output from exicution block
input [7:0]mux_ans_dm; //Data to be written at address given by RW
input [7:0]ans_wb; // Data (answer) for write back
input [7:0]Imm; // Immediate number
input [1:0]mux_sel_a; // Mux for selection of A
input [1:0]mux_sel_b; // Mux for selection of B
input Imm_sel; // Immediate number select
input clk2; // Clock for read
input clk5; // Clock for write

output [7:0]A; //Data to be read from the address RA
output [7:0]B; // Data to be read from the address RB

reg [7:0]Reg_A; //Output of register bank for A
reg [7:0]Reg_B; //Output of register bank for B
wire [7:0]Temp_B; //Output for MUX B which is used in immediate block

reg [7:0] Register_Bank[31:0]; // 8*32 Register Bank

initial
begin 
Register_Bank[0]=0;
Register_Bank[1]=1;
Register_Bank[2]=2;
Register_Bank[3]=3;
Register_Bank[4]=4;
Register_Bank[5]=5;
Register_Bank[6]=6;
Register_Bank[7]=7;
Register_Bank[8]=8;
Register_Bank[9]=9;
Register_Bank[10]=10;
Register_Bank[11]=11;
Register_Bank[12]=12;
Register_Bank[13]=13;
Register_Bank[14]=14;
Register_Bank[15]=15;
Register_Bank[16]=16;
Register_Bank[17]=17;
Register_Bank[18]=18;
Register_Bank[19]=19;
Register_Bank[20]=20;
Register_Bank[21]=21;
Register_Bank[22]=22;
Register_Bank[23]=23;
Register_Bank[24]=24;
Register_Bank[25]=25;
Register_Bank[26]=26;
Register_Bank[27]=27;
Register_Bank[28]=28;
Register_Bank[29]=29;
Register_Bank[30]=30;
Register_Bank[31]=31;
end

//buf ccc(Clkk1,clk2);
//buf ffff(Clkk2,clk5);
//clk2 for read data from register bank according given address
////////////// MUX A, MUX B AND Immediate MUX
assign A = (mux_sel_a==2'b00) ? (Reg_A) : ((mux_sel_a==2'b01) ? (ans_ex) : ((mux_sel_a==2'b10) ? (mux_ans_dm) : (ans_wb)));

assign Temp_B = (mux_sel_b==2'b00) ? (Reg_B) : ((mux_sel_b==2'b01) ? (ans_ex) : ((mux_sel_b==2'b10) ? (mux_ans_dm) : (ans_wb)));

assign B = (Imm_sel==1'b1) ? Imm : Temp_B;

always@(posedge clk2)
begin	
	Reg_A <= Register_Bank[Ins[9:5]];
	Reg_B <= Register_Bank[Ins[4:0]];		
end

//clk5 for write data in register bank
always@(posedge clk5)
begin
	Register_Bank[RW_dm] <= mux_ans_dm;
end


endmodule
