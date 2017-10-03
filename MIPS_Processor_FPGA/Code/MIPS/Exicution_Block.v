`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:03:42 09/07/2015 
// Design Name: 
// Module Name:    Exicution_Block 
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
module Exicution_Block(A , B , data_in , Clk3 , Op_ex , Mem_en_dec , Mem_rw_dec , Mem_mux_sel_dec, Rw_dec,	// Input
				ans_ex, Flag, Data_out, B_bypass, Mem_en_ex, Mem_rw_ex, Mem_mux_sel_ex, Rw_ex);	//Output

input [7:0]A;
input [7:0]B;
input [7:0]data_in;		//Declaration
input Mem_en_dec;
input Mem_rw_dec;
input Mem_mux_sel_dec;
input Clk3;
input [4:0]Rw_dec;
input [4:0]Op_ex;

output reg [7:0]ans_ex;
output reg [7:0]Data_out;
output reg [7:0]B_bypass;
output reg Mem_en_ex,Mem_rw_ex,Mem_mux_sel_ex;
output reg [4:0]Rw_ex;
output reg [3:0]Flag;

reg signed [7:0]signedA,signedB;
reg [7:0]X,ALU_out;
reg Cin,V,C,Se_Lastbit;
reg [7:0]Register;

initial Register=0;
initial Data_out=8'h00;

always@(posedge Clk3)
begin
	
	if(Op_ex==5'b00000 || Op_ex==5'b01000)		//Addition and Instant Addition
	begin	
		X = B;
		{Cin,ALU_out[6:0]}=A[6:0]+X[6:0];
		Se_Lastbit=Cin;
		{C,ALU_out[7]}=A[7]+X[7]+Cin;
		V=Se_Lastbit^C;
	end
	else if(Op_ex==5'b00111 || Op_ex==5'b01111)	//NOT and NOT Instant 
	begin
		ALU_out=~B;
		C=0;
		V=0;
	end
	else if(Op_ex == 5'b00001 || Op_ex == 5'b01001)	//Substraction
	begin
		X = ~B;
		{Cin,ALU_out[6:0]}=A[6:0]+X[6:0]+1'b1;
		Se_Lastbit=Cin;
		{C,ALU_out[7]}=Cin+A[7]+X[7];
		V=Se_Lastbit^C;
	end
	else if(Op_ex==5'b00010 || Op_ex==5'b01010) ///Opcode 
	begin
		ALU_out = B;
		C=0;
		V=0;
	end
	else if(Op_ex==5'b00100 || Op_ex==5'b01100)	//AND Operation
	begin
		ALU_out = A&B;
		C=0;
		V=0;
	end
	else if(Op_ex==5'b00101 || Op_ex==5'b01101)		//OR Operation
	begin
		ALU_out = A|B;
		C=0;
		V=0;
	end
	else if(Op_ex==5'b00110 || Op_ex==5'b01110)	//XOR Operation
	begin
		ALU_out=A^B;
		C=0;
		V=0;
	end
	else if(Op_ex==5'b11001)	//Left Shift
	begin
		ALU_out=A<<B[2:0];
		C=0;
		V=0;
	end
	else if(Op_ex==5'b11010)	//Right Shift
	begin
		ALU_out=A>>B[2:0];
		C=0;
		V=0;
	end
	else if(Op_ex==5'b11011)	//Right Arithmetic Shift
	begin
		signedA = A;
		signedB = B;
		ALU_out=signedA>>>signedB[2:0];
		C=0;
		V=0;
	end
	else if(Op_ex==5'b10100 || Op_ex==5'b10101 || Op_ex==5'b10110 || Op_ex==5'b10111 || Op_ex==5'b11000)
	begin
		ALU_out=A;
		C=0;
		V=0;
	end
	else
	begin	
		ALU_out=Register;
		C=Flag[0];
		V=Flag[2];
	end	
//--------------------------------------
	
	if(Op_ex==5'b10110)		//input for ans_ex
	begin
		ans_ex=data_in;
	end
	else
	begin
		ans_ex=ALU_out;
	end

//////////////////////////////////////////////////////
////Assigning values to Flag
////////////////////////////////////////////////////////	
 	Flag[0]=C;		
	if(ALU_out==8'b00000000)
	begin
		Flag[1]=1;
	end
	else
	begin
		Flag[1]=0;
	end
	Flag[2]=V;
	Flag[3]=ALU_out[0]^ALU_out[1]^ALU_out[2]^ALU_out[3]^ALU_out[4]^ALU_out[5]^ALU_out[6]^ALU_out[7];

//Data_out Selection	
	if(Op_ex==5'b10111)		
	begin
		Data_out=A;
	end	
	else 
	begin 
		Data_out=Data_out;
	end
	
	Register = ans_ex;

	Mem_en_ex = Mem_en_dec ;
	Mem_rw_ex = Mem_rw_dec ;
	Mem_mux_sel_ex = Mem_mux_sel_dec;
	B_bypass = B ;
	Rw_ex = Rw_dec ;

end		

endmodule		//End
