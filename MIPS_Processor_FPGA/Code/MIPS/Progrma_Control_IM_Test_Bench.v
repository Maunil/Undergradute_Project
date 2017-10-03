`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:10:55 09/14/2015
// Design Name:   Program_Counter_IM_Block
// Module Name:   E:/ICT/ICT SEM 3/Computer Organization/Practical Lab/MIPS/MIPS/Progrma_Control_IM_Test_Bench.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Program_Counter_IM_Block
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Progrma_Control_IM_Test_Bench;

	// Inputs
	reg Clk1;
	reg [7:0] jmp_loc;
	reg pc_mux_sel;

	// Outputs
	wire [19:0] Ins;
	wire [7:0] current_address;
	
	
	parameter PERIOD = 1000;

   always begin
      Clk1 = 1'b0;
      #(PERIOD/2) Clk1 = 1'b1;
      #(PERIOD/2);
   end  


	// Instantiate the Unit Under Test (UUT)
	Program_Counter_IM_Block uut (
		.Clk1(Clk1), 
		.jmp_loc(jmp_loc), 
		.pc_mux_sel(pc_mux_sel), 
		.Ins(Ins), 
		.current_address(current_address)
	);

	initial begin
		// Initialize Inputs
		jmp_loc = 8'b00000110;
		pc_mux_sel = 0;

		// Wait 100 ns for global reset to finish
      #1000 pc_mux_sel=0;  
      #1000 pc_mux_sel=0;  
      #1000 pc_mux_sel=0;  
      #1000 pc_mux_sel=0;  
      #1000 pc_mux_sel=0;  
      #1000 pc_mux_sel=1;  
      #1000 pc_mux_sel=0;  
      #1000 pc_mux_sel=0;  

		// Add stimulus here

	end
      
endmodule

