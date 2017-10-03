`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:18:21 09/14/2015
// Design Name:   Dependancy_Check_Block
// Module Name:   E:/ICT/ICT SEM 3/Computer Organization/Practical Lab/MIPS/MIPS/Dependancy_Check_Block_Test_Bench.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Dependancy_Check_Block
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Dependancy_Check_Block_Test_Bench;

	// Inputs
	reg [19:0] Ins;
	reg Clkk;

	// Outputs
	wire [1:0] mux_sel_a;
	wire [1:0] mux_sel_b;
	wire imm_sel;
	wire [7:0] imm;
	wire mem_en_dec;
	wire [4:0] RW_dec;
	wire [4:0] Op_ex;
	wire mem_mux_sel_dec;
	wire mem_rw_dec;
	
		parameter PERIOD = 1000;

   always begin
      Clkk = 1'b0;
      #(PERIOD/2) Clkk = 1'b1;
      #(PERIOD/2);
   end  


	// Instantiate the Unit Under Test (UUT)
	Dependancy_Check_Block uut (
		.Ins(Ins), 
		.Clkk(Clkk), 
		.mux_sel_a(mux_sel_a), 
		.mux_sel_b(mux_sel_b), 
		.imm_sel(imm_sel), 
		.imm(imm), 
		.mem_en_dec(mem_en_dec), 
		.RW_dec(RW_dec), 
		.Op_ex(Op_ex), 
		.mem_mux_sel_dec(mem_mux_sel_dec), 
		.mem_rw_dec(mem_rw_dec)
	);

	initial begin
		Ins=20'b00000000010001000011;
		Clkk=0;

		#1000 Ins=20'b10100001000000100000;
		#2000 Ins=20'b00100001010000100100;
		#1000 Ins=20'b01101001100000100101;
		// Add stimulus here

	end
      
endmodule

