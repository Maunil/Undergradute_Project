`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:02:16 09/14/2015
// Design Name:   Clock_Control_Block
// Module Name:   E:/ICT/ICT SEM 3/Computer Organization/Practical Lab/MIPS/MIPS/Clock_Control_Test_Bench.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Clock_Control_Block
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Clock_Control_Test_Bench;

	// Inputs
	reg [19:0] Ins;
	reg Clk;

	// Outputs
	wire Clk1;
	wire Clk2;
	wire Clk3;
	wire Clk4;
	wire Clk5;

	// Instantiate the Unit Under Test (UUT)
	Clock_Control_Block uut (
		.Ins(Ins), 
		.Clk(Clk), 
		.Clk1(Clk1), 
		.Clk2(Clk2), 
		.Clk3(Clk3), 
		.Clk4(Clk4), 
		.Clk5(Clk5)
	);

	initial begin
		// Initialize Inputs
		Ins = 0;
		Clk = 0;

		// Wait 100 ns for global reset to finis
		
		#4000;
		Ins = 20'he8_000;
		#2500;		
		Ins = 20'h00000;
		#1500;		
		Ins = 20'hA0_000;
		#1500;		
		Ins = 20'h00_000;
		#2500;		
		Ins = 20'h88_000;

        
		// Add stimulus here

	end
	
	always
      #500 Clk = ~Clk; // 1MHz Clock
      
endmodule

