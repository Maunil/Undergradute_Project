`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:48:14 10/19/2015
// Design Name:   MIPS
// Module Name:   E:/ICT/ICT SEM 3/Computer Organization/Practical Lab/AdderMIPS/MIPS/MIPS_Test_Bench.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MIPS
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MIPS_Test_Bench;

	// Inputs
	reg Input_Clk;
	reg Interrupt;
	reg [7:0] Data_in;

	// Outputs
	wire [7:0] Data_out;
	wire [1:0] mux_sel_a;
	wire [1:0] mux_sel_b;
	wire [7:0] A;
	wire [7:0] B;
	wire [7:0] ans_ex;
	wire Clk_sim;
	wire Clk1_sim;
	wire Clk2_sim;
	wire Clk3_sim;
	wire Clk4_sim;
	wire Clk5_sim;
	
	parameter PERIOD = 20;

   always begin
      Input_Clk = 1'b1;
      #(PERIOD/2) Input_Clk = 1'b0;
      #(PERIOD/2);
   end

	// Instantiate the Unit Under Test (UUT)
	MIPS uut (
		.Input_Clk(Input_Clk), 
		.Interrupt(Interrupt), 
		.Data_out(Data_out), 
		.Data_in(Data_in), 
		.mux_sel_a(mux_sel_a), 
		.mux_sel_b(mux_sel_b), 
		.A(A), 
		.B(B), 
		.ans_ex(ans_ex), 
		.Clk_sim(Clk_sim), 
		.Clk1_sim(Clk1_sim), 
		.Clk2_sim(Clk2_sim), 
		.Clk3_sim(Clk3_sim), 
		.Clk4_sim(Clk4_sim), 
		.Clk5_sim(Clk5_sim)
	);

	initial begin
		// Initialize Inputs
		Input_Clk = 0;
		Interrupt = 0;
		Data_in = 0;

		// Wait 100 ns for global reset to finish
		#1000;
        
		// Add stimulus here

	end
      
endmodule

