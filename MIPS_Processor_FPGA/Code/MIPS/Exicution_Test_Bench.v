`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:14:39 09/14/2015
// Design Name:   Exicution_Block
// Module Name:   E:/ICT/ICT SEM 3/Computer Organization/Practical Lab/MIPS/MIPS/Exicution_Test_Bench.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Exicution_Block
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Exicution_Test_Bench;

	// Inputs
	reg [7:0] A;
	reg [7:0] B;
	reg [7:0] data_in;
	reg Clk3;
	reg [4:0] Op_ex;
	reg Mem_en_dec;
	reg Mem_rw_dec;
	reg Mem_mux_sel_dec;
	reg [4:0] Rw_dec;

	// Outputs
	wire [7:0] ans_ex;
	wire [3:0] Flag;
	wire [7:0] Data_out;
	wire [7:0] B_bypass;
	wire Mem_en_ex;
	wire Mem_rw_ex;
	wire Mem_mux_sel_ex;
	wire [4:0] Rw_ex;


	parameter PERIOD = 1000;

   always begin
      Clk3 = 1'b0;
      #(PERIOD/2) Clk3 = 1'b1;
      #(PERIOD/2);
   end  
	

	// Instantiate the Unit Under Test (UUT)
	Exicution_Block uut (
		.A(A), 
		.B(B), 
		.data_in(data_in), 
		.Clk3(Clk3), 
		.Op_ex(Op_ex), 
		.Mem_en_dec(Mem_en_dec), 
		.Mem_rw_dec(Mem_rw_dec), 
		.Mem_mux_sel_dec(Mem_mux_sel_dec), 
		.Rw_dec(Rw_dec), 
		.ans_ex(ans_ex), 
		.Flag(Flag), 
		.Data_out(Data_out), 
		.B_bypass(B_bypass), 
		.Mem_en_ex(Mem_en_ex), 
		.Mem_rw_ex(Mem_rw_ex), 
		.Mem_mux_sel_ex(Mem_mux_sel_ex), 
		.Rw_ex(Rw_ex)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		data_in = 0;
		Clk3 = 0;
		Op_ex = 0;
		Mem_en_dec = 0;
		Mem_rw_dec = 0;
		Mem_mux_sel_dec = 0;
		Rw_dec = 0;
		
		Op_ex=5'b00000 ; A=5'b00000 ; B=5'b00000 ; Rw_dec=5'b00000 ; 
		#1000 Op_ex=5'b01010 ; A=5'b00001 ; B=5'b00000 ; Rw_dec=5'b01000 ; 
		#1000 Op_ex=5'b01010 ; A=5'b00010 ; B=5'b00000 ; Rw_dec=5'b00110 ; 
		#1000 Op_ex=5'b01010 ; A=5'b00011 ; B=5'b00000 ; Rw_dec=5'b00000 ; 
		#1000 Op_ex=5'b01010 ; A=5'b00100 ; B=5'b00000 ; Rw_dec=5'b00100 ; 
		#1000 Op_ex=5'b00000 ; A=5'b00011 ; B=5'b00011 ; Rw_dec=5'b00001 ; 
		#1000 Op_ex=5'b01001 ; A=5'b00010 ; B=5'b00010 ; Rw_dec=5'b00001 ; 
		#1000 Op_ex=5'b11111 ; A=5'b00000 ; B=5'b00000 ; Rw_dec=5'b00101 ; 
		#1000 Op_ex=5'b10101 ; A=5'b00000 ; B=5'b00100 ; Rw_dec=5'b00011 ; 
		#1000 Op_ex=5'b10001 ; A=5'b00000 ; B=5'b00000 ; Rw_dec=5'b00000 ; 
/*
		// Wait 100 ns for global reset to finish
		#1000 Op_ex=5'b01010 ; A=8'h40 ; B=8'hC0 ; data_in=8'h08 ; Mem_en_dec=1'b0 ; Mem_rw_dec=1'b0 ; Mem_mux_sel_dec=1'b0 ; Rw_dec=5'b00101;

		#1000 Op_ex=5'b00000;  A=8'h40 ; B=8'hC0 ; data_in=8'h08 ; Mem_en_dec=1'b0 ; Mem_rw_dec=1'b0 ; Mem_mux_sel_dec=1'b0 ; Rw_dec=5'b00101;

		#1000 Op_ex=5'b00001;  A=8'h40 ; B=8'hC0 ; data_in=8'h08 ; Mem_en_dec=1'b0 ; Mem_rw_dec=1'b0 ; Mem_mux_sel_dec=1'b0 ; Rw_dec=5'b00101;		
		
		#1000 Op_ex=5'b00010 ; A=8'h40 ; B=8'hC0 ; data_in=8'h08 ; Mem_en_dec=1'b0 ; Mem_rw_dec=1'b0 ; Mem_mux_sel_dec=1'b0 ; Rw_dec=5'b00101;
		
		#1000 Op_ex=5'b00100 ; A=8'h40 ; B=8'hC0 ; data_in=8'h08 ; Mem_en_dec=1'b0 ; Mem_rw_dec=1'b0 ; Mem_mux_sel_dec=1'b0 ; Rw_dec=5'b00101; 
		
		#1000 Op_ex=5'b00101 ; A=8'h40 ; B=8'hC0 ; data_in=8'h08 ; Mem_en_dec=1'b0 ; Mem_rw_dec=1'b0 ; Mem_mux_sel_dec=1'b0 ; Rw_dec=5'b00101; 
		
		#1000 Op_ex=5'b00110 ; A=8'h40 ; B=8'hC0 ; data_in=8'h08 ; Mem_en_dec=1'b0 ; Mem_rw_dec=1'b0 ; Mem_mux_sel_dec=1'b0 ; Rw_dec=5'b00101;
		
		#1000 Op_ex=5'b00111 ; A=8'h40 ; B=8'hC0 ; data_in=8'h08 ; Mem_en_dec=1'b0 ; Mem_rw_dec=1'b0 ; Mem_mux_sel_dec=1'b0 ; Rw_dec=5'b00101;
	
		#1000 Op_ex=5'b01000 ; A=8'h40 ; B=8'hC0 ; data_in=8'h08 ; Mem_en_dec=1'b0 ; Mem_rw_dec=1'b0 ; Mem_mux_sel_dec=1'b0 ; Rw_dec=5'b00101;
		
		#1000 Op_ex=5'b01001 ; A=8'h40 ; B=8'hC0 ; data_in=8'h08 ; Mem_en_dec=1'b0 ; Mem_rw_dec=1'b0 ; Mem_mux_sel_dec=1'b0 ; Rw_dec=5'b00101;
		
//		#1000 Op_ex=5'b01010 ; A=8'h40 ; B=8'hC0 ; data_in=8'h08 ; Mem_en_dec=1'b0 ; Mem_rw_dec=1'b0 ; Mem_mux_sel_dec=1'b0 ; Rw_dec=5'b00101;
		
		#1000 Op_ex=5'b01100 ; A=8'h40 ; B=8'hC0 ; data_in=8'h08 ; Mem_en_dec=1'b0 ; Mem_rw_dec=1'b0 ; Mem_mux_sel_dec=1'b0 ; Rw_dec=5'b00101;
		
		#1000 Op_ex=5'b01101 ; A=8'h40 ; B=8'hC0 ; data_in=8'h08 ; Mem_en_dec=1'b0 ; Mem_rw_dec=1'b0 ; Mem_mux_sel_dec=1'b0 ; Rw_dec=5'b00101;
		
		#1000 Op_ex=5'b01110 ; A=8'h40 ; B=8'hC0 ; data_in=8'h08 ; Mem_en_dec=1'b0 ; Mem_rw_dec=1'b0 ; Mem_mux_sel_dec=1'b0 ; Rw_dec=5'b00101;
		
		#1000 Op_ex=5'b01111 ; A=8'h40 ; B=8'hC0 ; data_in=8'h08 ; Mem_en_dec=1'b0 ; Mem_rw_dec=1'b0 ; Mem_mux_sel_dec=1'b0 ; Rw_dec=5'b00101;
		
		#1000 Op_ex=5'b10100; A = 8'h40; B=8'hC0; data_in  = 8'h08; Mem_en_dec = 1'b0; Mem_rw_dec=1'b0; Mem_mux_sel_dec=1'b0; Rw_dec=5'b00101;   
      
		#1000 Op_ex=5'b10101; A = 8'h40; B=8'hC0; data_in  = 8'h08; Mem_en_dec = 1'b0; Mem_rw_dec=1'b0; Mem_mux_sel_dec=1'b0; Rw_dec=5'b00101;
	
		#1000 Op_ex=5'b10000; A = 8'h40; B=8'hC0; data_in  = 8'h08; Mem_en_dec = 1'b0; Mem_rw_dec=1'b0; Mem_mux_sel_dec=1'b0; Rw_dec=5'b00101;
		
		#1000 Op_ex=5'b10001; A = 8'h40; B=8'hC0; data_in  = 8'h08; Mem_en_dec = 1'b0; Mem_rw_dec=1'b0; Mem_mux_sel_dec=1'b0; Rw_dec=5'b00101;
		
		#1000 Op_ex=5'b10110; A = 8'h40; B=8'hC0; data_in  = 8'h08; Mem_en_dec = 1'b0; Mem_rw_dec=1'b0; Mem_mux_sel_dec=1'b0; Rw_dec=5'b00101;
		
		#1000 Op_ex=5'b10111; A = 8'h40; B=8'hC0; data_in  = 8'h08; Mem_en_dec = 1'b0; Mem_rw_dec=1'b0; Mem_mux_sel_dec=1'b0; Rw_dec=5'b00101;
		
		#1000 Op_ex=5'b11000; A = 8'h40; B=8'hC0; data_in  = 8'h08; Mem_en_dec = 1'b0; Mem_rw_dec=1'b0; Mem_mux_sel_dec=1'b0; Rw_dec=5'b00101;
		
		#1000 Op_ex=5'b11001; A = 8'hC0; B=8'h01; data_in  = 8'h08; Mem_en_dec = 1'b1; Mem_rw_dec=1'b1; Mem_mux_sel_dec=1'b1; Rw_dec=5'b01010;		
		
		#1000 Op_ex=5'b11010; A = 8'hC0; B=8'h01; data_in  = 8'h08; Mem_en_dec = 1'b1; Mem_rw_dec=1'b1; Mem_mux_sel_dec=1'b1; Rw_dec=5'b01010;	
		
		#1000 Op_ex=5'b11011; A = 8'hC0; B=8'h04; data_in  = 8'h08; Mem_en_dec = 1'b1; Mem_rw_dec=1'b1; Mem_mux_sel_dec=1'b1; Rw_dec=5'b01010;
		
		#1000 Op_ex=5'b11100; A = 8'hC0; B=8'h01; data_in  = 8'h08; Mem_en_dec = 1'b1; Mem_rw_dec=1'b1; Mem_mux_sel_dec=1'b1; Rw_dec=5'b01010;
		
		#1000 Op_ex=5'b11101; A = 8'hC0; B=8'h01; data_in  = 8'h08; Mem_en_dec = 1'b1; Mem_rw_dec=1'b1; Mem_mux_sel_dec=1'b1; Rw_dec=5'b01010;  
		
		#1000 Op_ex=5'b11110; A = 8'hC0; B=8'h01; data_in  = 8'h08; Mem_en_dec = 1'b1; Mem_rw_dec=1'b1; Mem_mux_sel_dec=1'b1; Rw_dec=5'b01010;
		
		#1000 Op_ex=5'b11111; A = 8'hC0; B=8'h01; data_in  = 8'h08; Mem_en_dec = 1'b1; Mem_rw_dec=1'b1; Mem_mux_sel_dec=1'b1; Rw_dec=5'b01010; 
*/
	end
      
endmodule

