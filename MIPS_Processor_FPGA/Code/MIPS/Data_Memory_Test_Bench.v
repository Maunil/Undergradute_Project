`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:15:54 09/14/2015
// Design Name:   Data_Memory_Block
// Module Name:   E:/ICT/ICT SEM 3/Computer Organization/Practical Lab/MIPS/MIPS/Data_Memory_Test_Bench.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Data_Memory_Block
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Data_Memory_Test_Bench;

	// Inputs
	reg [7:0] ans_ex;
	reg [7:0] B_bypass;
	reg mem_en_ex;
	reg mem_rw_ex;
	reg clk4;
	reg [4:0] RW_ex;
	reg mem_mux_sel_ex;

	// Outputs
	wire [7:0] mux_ans_dm;
	wire [4:0] RW_dm;

	
		parameter PERIOD = 1000;

   always begin
      clk4 = 1'b0;
      #(PERIOD/2) clk4 = 1'b1;
      #(PERIOD/2);
   end  

	// Instantiate the Unit Under Test (UUT)
	Data_Memory_Block uut (
		.ans_ex(ans_ex), 
		.B_bypass(B_bypass), 
		.mem_en_ex(mem_en_ex), 
		.mem_rw_ex(mem_rw_ex), 
		.clk4(clk4), 
		.RW_ex(RW_ex), 
		.mem_mux_sel_ex(mem_mux_sel_ex), 
		.mux_ans_dm(mux_ans_dm), 
		.RW_dm(RW_dm)
	);

	initial begin
		// Initialize Inputs
		ans_ex = 8'h05;
		B_bypass = 0;
		mem_en_ex = 0;
		mem_rw_ex = 0;
		clk4 = 0;
		RW_ex = 5'h08;
		mem_mux_sel_ex = 0;

		// Wait 100 ns for global reset to finish
		//#100
		B_bypass=8'h0a; mem_en_ex=8'h0; mem_rw_ex=8'h0; mem_mux_sel_ex=8'h01;
		#1000 B_bypass=8'h0a; mem_en_ex=8'h1; mem_rw_ex=8'h0; mem_mux_sel_ex=8'h01;
		#1000 B_bypass=8'h0a; mem_en_ex=8'h1; mem_rw_ex=8'h1; mem_mux_sel_ex=8'h01;
		#1000 B_bypass=8'h14; mem_en_ex=8'h1; mem_rw_ex=8'h0; mem_mux_sel_ex=8'h01;
		#1000 B_bypass=8'h14; mem_en_ex=8'h1; mem_rw_ex=8'h0; mem_mux_sel_ex=8'h00;
		#1000 B_bypass=8'h14; mem_en_ex=8'h1; mem_rw_ex=8'h0; mem_mux_sel_ex=8'h00;
		#1000 B_bypass=8'h14; mem_en_ex=8'h1; mem_rw_ex=8'h0; mem_mux_sel_ex=8'h00;
		#1000 B_bypass=8'h14; mem_en_ex=8'h1; mem_rw_ex=8'h0; mem_mux_sel_ex=8'h00;
		#1000 B_bypass=8'h14; mem_en_ex=8'h1; mem_rw_ex=8'h0; mem_mux_sel_ex=8'h00;
		#1000 B_bypass=8'h14; mem_en_ex=8'h1; mem_rw_ex=8'h0; mem_mux_sel_ex=8'h00;
		#1000 B_bypass=8'h14; mem_en_ex=8'h1; mem_rw_ex=8'h0; mem_mux_sel_ex=8'h00;


	end
      
endmodule

