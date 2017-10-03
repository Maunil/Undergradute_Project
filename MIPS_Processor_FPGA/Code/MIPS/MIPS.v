`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:33:05 09/07/2015 
// Design Name: 
// Module Name:    MIPS 
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
module MIPS(Input_Clk, Interrupt, Data_out,Data_in,mux_sel_a,mux_sel_b,A,B,ans_ex,Clk_sim,Clk1_sim,Clk2_sim,Clk3_sim,Clk4_sim,Clk5_sim);

input Input_Clk;//input clock
input Interrupt;//interrupt signal where instruction has more priority than running instruction
input [7:0]Data_in;//Data in

output [7:0]Data_out;//Data out
output [1:0]mux_sel_a;
output [1:0]mux_sel_b;
output [7:0]A;
output [7:0]B;
output [7:0]ans_ex;
output Clk_sim,Clk1_sim,Clk2_sim,Clk3_sim,Clk4_sim,Clk5_sim;

//Ins :- Instruction
//Clk :- Which controls under clocks and Data Dependancy Block
//Clk1 :- Which controls Program counter and instruction memory block
//Clk2 :- Which controls Register file for decode block
//Clk3 :- Which controls Exicution Block
//Clk4 :- Which controls Data Memory Block
//Clk5 :- Which controls Write Back to Register File

//current_address :- which has address from which instruction is excessed
//jmp_loc :- Jump location for conditional or unconditional jump
//Interrupt :- which has more priority than any other instruction
//pc_mux_sel :- which select whether pc has jump address or continues pc address

//RW_dm :- Address where we want to write data during write back stage
//ans_ex :- output of exicution block
//mux_ans_dm :- Data to be written at address given by RW
//ans_wb :- Data (answer) for write back
//Imm :- Constant part in Immediate instruction type
//Imm_sel :- Where given instrution is immediate or not
//mux_sel_a :- MUX selection for A
//mux_sel_b :- MUX selection for B
//A :- Value of A for Exicution input A
//B :- Value of A for Exicution input B

//Data_in :- Data in MIPS
//Op_ex :- Option code for performing instruction
//Mem_en_dec :- Memory enable signal for Data Memory which we want to bypass during exicution block
//Mem_rw_dec :- Memory Read-write signal for Data Memory which we want to bypass during exicution block
//Mem_mux_sel_dec :- Memory mux selection whether you want data load from memory or want to bypass exicution output 
//										which we want to bypass during exicution block
//Rw_dec :- Read-write destination address which we want to bypass during exicution block
//Flag :- Flag is combination of Carry bit,Priority bit,Zero bit,Overflowm bit
//Data_out :- Data out from exicution block
//B_bypass :- which has which we want to store during SW(store instruction)
//Mem_en_ex :- Memory enable signal for Data Memory
//Mem_rw_ex :-  Memory Read-write signal for Data Memory
//Mem_mux_sel_ex :-  Memory mux selection whether you want data load from memory or want to bypass exicution output
//Rw_ex :- Read-write destination address


wire [19:0]Ins;
wire Clk,Clk1,Clk2,Clk3,Clk4,Clk5, pc_mux_sel, Imm_sel;
wire [7:0]B_bypass,current_address, jmp_loc, ans_ex, ans_wb, Imm,A, B, mux_ans_dm; 
wire [3:0]Flag ;
wire [4:0]Rw_dm,Op_ex, Rw_dec, Rw_ex; 
wire [1:0]mux_sel_a, mux_sel_b;
wire Mem_en_dec , Mem_rw_dec , Mem_mux_sel_dec;
wire	 Mem_en_ex, Mem_rw_ex, Mem_mux_sel_ex;


///////////////////////////////////////////////////////
// Clock Generation
ClockGeneration CG(Input_Clk,Clk);

assign Clk_sim = Clk;
//////////////////////////////////////////////////////
// Clock control Block
Clock_Control_Block ClockBlock(Ins,Clk,Clk1,Clk2,Clk3,Clk4,Clk5);

assign Clk1_sim=Clk1;
assign Clk2_sim=Clk2;
assign Clk3_sim=Clk3;
assign Clk4_sim=Clk4;
assign Clk5_sim=Clk5;
/////////////////////////////////////////////////////
/// Jump control Block
Jump_Control_Block JumpBlock(Ins, Flag,current_address , Interrupt, jmp_loc, pc_mux_sel);

////////////////////////////////////////////////////
/// Data Dependancy Check Block
Dependancy_Check_Block DepCheckBlock(Ins,Clk,mux_sel_a,mux_sel_b,Imm_sel,Imm,Mem_en_dec,
Mem_rw_dec,Mem_mux_sel_dec,Rw_dec,Op_ex);

///////////////////////////////////////////////////
/// Program counter and Instruction Memory Block
Program_Counter_IM_Block PCIM(Clk1,jmp_loc,pc_mux_sel,Ins,current_address);	


////////////////////////////////////////////////////
//// Register Bank OR DECODE STAGE
Register_File RF(Ins, Rw_dm, ans_ex, mux_ans_dm, ans_wb, Imm, mux_sel_a, mux_sel_b, Imm_sel, Clk2, Clk5, A, B);

//////////////////////////////////////////////////
//// Execution Block
Exicution_Block Execution(A , B , Data_in , Clk3 , Op_ex , Mem_en_dec , Mem_rw_dec , Mem_mux_sel_dec, Rw_dec,	// Input
				ans_ex, Flag, Data_out, B_bypass, Mem_en_ex, Mem_rw_ex, Mem_mux_sel_ex, Rw_ex);	//Output

//////////////////////////////////////////////////////
/////////// Data Memory Block
Data_Memory_Block DM(ans_ex, B_bypass, Mem_en_ex, Mem_rw_ex, Clk4, Rw_ex, Mem_mux_sel_ex, mux_ans_dm, Rw_dm);

////////////////////////////////////////////////////
/// Write Back Stage
Write_Back WB(mux_ans_dm,Clk5,ans_wb);
				
endmodule
