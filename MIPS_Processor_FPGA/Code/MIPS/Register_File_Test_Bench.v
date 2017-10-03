`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:13:18 09/14/2015
// Design Name:   Register_File
// Module Name:   E:/ICT/ICT SEM 3/Computer Organization/Practical Lab/MIPS/MIPS/Register_File_Test_Bench.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Register_File
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Register_File_Test_Bench;

	// Inputs
	reg [19:0] Ins;
	reg [4:0] RW_dm;
	reg [7:0] ans_ex;
	reg [7:0] mux_ans_dm;
	reg [7:0] ans_wb;
	reg [7:0] Imm;
	reg [1:0] mux_sel_a;
	reg [1:0] mux_sel_b;
	reg Imm_sel;
	reg clk2;
	reg clk5;

	// Outputs
	wire [7:0] A;
	wire [7:0] B;

	// Instantiate the Unit Under Test (UUT)
	Register_File uut (
		.Ins(Ins), 
		.RW_dm(RW_dm), 
		.ans_ex(ans_ex), 
		.mux_ans_dm(mux_ans_dm), 
		.ans_wb(ans_wb), 
		.Imm(Imm), 
		.mux_sel_a(mux_sel_a), 
		.mux_sel_b(mux_sel_b), 
		.Imm_sel(Imm_sel), 
		.clk2(clk2), 
		.clk5(clk5), 
		.A(A), 
		.B(B)
	);

	initial begin
		Ins = 20'h00043;
		RW_dm = 5'h02;
		ans_ex = 8'h30;
		mux_ans_dm = 8'h10;
		ans_wb = 8'h50;
		Imm = 8'h60;
		mux_sel_a = 0;
		mux_sel_b = 0;
		Imm_sel = 0;
		clk2=0;
		clk5=0;
		
		#500  clk2=1; 	clk5=0; Imm_sel=0; mux_sel_a=2'b00; mux_sel_b=2'b00; mux_ans_dm=8'h10; 
		#500  clk2=0; 	clk5=0; Imm_sel=0; mux_sel_a=2'b00; mux_sel_b=2'b00; mux_ans_dm=8'h10; 
		#500  clk2=0 ;  clk5=1; Imm_sel=0; mux_sel_a=2'b00; mux_sel_b=2'b00; mux_ans_dm=8'h10; 
		#500  clk2=0 ; clk5=0; Imm_sel=1; mux_sel_a=2'b00; mux_sel_b=2'b00; mux_ans_dm=8'h10; 
		#500 	clk2=1; 	clk5=0; Imm_sel=1; mux_sel_a=2'b00; mux_sel_b=2'b00; mux_ans_dm=8'h10; 
		#500  clk2=0; clk5=0; Imm_sel=0; mux_sel_a=2'b01; mux_sel_b=2'b00; mux_ans_dm=8'h40; 
		
		#500 clk2=0 ; clk5=0; Imm_sel=0; mux_sel_a=2'b01; mux_sel_b=2'b00; mux_ans_dm=8'h40; 
		#500  clk2=0 ; clk5=0; Imm_sel=0; mux_sel_a=2'b10; mux_sel_b=2'b11; mux_ans_dm=8'h40;
		#500  clk2=1 ; clk5=1; Imm_sel=0; mux_sel_a=2'b10; mux_sel_b=2'b11; mux_ans_dm=8'h40; 
		#4500  clk2=1 ; clk5=1; Imm_sel=0; mux_sel_a=2'b10; mux_sel_b=2'b11; mux_ans_dm=8'h40; 
		

	end
      
endmodule

