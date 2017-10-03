`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:34:10 09/07/2015 
// Design Name: 
// Module Name:    Dependancy_Check_Block 
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
module Dependancy_Check_Block(Ins,Clkk,mux_sel_a,mux_sel_b,imm_sel,imm,mem_en_dec,mem_rw_dec,mem_mux_sel_dec,RW_dec,Op_ex);
				
input [19:0]Ins;//Instruction for Program Memory
input Clkk;//System clock of Processor

output reg [1:0]mux_sel_a;//selection bit for mux a
output reg [1:0]mux_sel_b;// selection bit for mux b
output reg imm_sel;// imm selection
output reg [7:0]imm;//imm number
output reg mem_en_dec;// memory enable signal
output reg mem_mux_sel_dec;//data memory mux selection line
output reg mem_rw_dec;//memory read,write signal
output reg [4:0]Op_ex;//opcode
output reg [4:0]RW_dec;//rw

reg [4:0]RegA,RegB,Register1,Register2,Register3,Register4;
reg [14:0]Rw;
reg UCJump,CJump,Load,Load1,Store,AND1,AND2,AND3,NOR;
reg Q1,Q2,Q;
wire clkbuf1,clkbuf2,clkbuf3,clkbuf4;
//buf(output,input)
assign clkbuf1 = (~(~Clkk));
assign clkbuf2 = (~(~clkbuf1));
assign clkbuf3 = (~(~clkbuf2));
assign clkbuf4 = (~(~clkbuf3));

initial
begin
	Register1 = 0;///initial value for registers
	Register2 = 0;
	Register3 = 0;
	Register4 = 0;
	Q = 0;
	Q1 = 0;
	Q2 = 0;
	NOR=1;
	UCJump=0;
	CJump=0;
	Load=0;
	Load1=0;
	Store=0;
	AND1=0;
	AND2=0;
	AND3=0;
end

//Clock independant
always@(NOR,Ins,RegA,RegB,Register4,Register3,Register2,Q,Q1,Q2)
begin
	UCJump = Ins[19] & Ins[18] & ~Ins[17] & ~Ins[16] & ~Ins[15];//un conditional jump
	CJump = Ins[19] & Ins[18] & Ins[17] ;//conditional jump
	Load = Ins[19] & ~Ins[18] & Ins[17] & ~Ins[16] & ~Ins[15] & ~Q;//load instruction
	Load1 = Ins[19] & ~Ins[18] & Ins[17] & ~Ins[16] & ~Ins[15] ;//load in
	Store = Ins[19] & ~Ins[18] & Ins[17] & ~Ins[16] & Ins[15] ;////store instruction

	AND1 = Ins[15] & ~Q1;//for memory enable signals
	AND2 = Load1 & ~Q2;//for meory enable signal 
	AND3 = ~Ins[19] & Ins[18];///for imm_sel
	
	NOR = ~(UCJump | CJump | Q);	///nor 
	
	////same as bit extander
	if(NOR==1)
	begin
		Rw = Ins[14:0];
	end
	else
	begin
		Rw = 15'b000000000000000;
	end

///////////////////////////////////////////
//MUX A
//////////////////////////////////////////	
	if(Register2==RegA)///from exicution
	begin
		mux_sel_a = 2'b01;
	end
	else if(Register3==RegA)//from mem 
	begin
		mux_sel_a = 2'b10;
	end
	else if(Register4==RegA)//from wb
	begin
		mux_sel_a = 2'b11;
	end
	else
	begin
		mux_sel_a = 2'b00;
	end
////////////////////////////////////////////
//MUX B
////////////////////////////////////////////
	if(Register2==RegB)//from exicution
	begin
		mux_sel_b = 2'b01;
	end
	else if(Register3==RegB)//from mem
	begin
		mux_sel_b = 2'b10;
	end
	else if(Register4==RegB)//from wb
	begin
		mux_sel_b = 2'b11;
	end
	else
	begin
		mux_sel_b = 2'b00;
	end

///////////////////////////////////
/////memory signals 
////////////////////////////////////	
	mem_rw_dec = Q1 | Store;//memory read/write signal
	mem_mux_sel_dec = ~Q1 & Q2;//mux selection for data which come from execution and  from data memory
	mem_en_dec = Q2 | Store;	//memory enable signal
	
end

//clock dependant
always@(posedge clkbuf4)
begin
	Q <= Load;
	Q1 <= AND1;
	Q2 <= AND2;		
		
	RegB[4:0] <= Rw[4:0];/////rw assign to RegA,RegB,And output RW_Dec
	RegA[4:0] <= Rw[9:5];
	RW_dec[4:0] <= Rw[14:10];
	Op_ex[4:0] <= Ins[19:15];
	
	Register1<=Rw[14:10];
	Register2<=Register1;
	Register3<=Register2;
	Register4<=Register3;///change register value at posedge of clock
	
	imm_sel <= AND3;///imm_sel output 
	imm[4:0]<=Ins[4:0];///imm address
	imm[7:5]<=3'b000;	
end
endmodule
