`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:26:13 09/07/2015 
// Design Name: 
// Module Name:    Clock_Control_Block 
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
module Clock_Control_Block(Ins,Clk,Clk1,Clk2,Clk3,Clk4,Clk5);

input [19:0]Ins;//// Input Ins from Instruction memory block
input Clk; // clock
output Clk1,Clk2,Clk3,Clk4,Clk5;////output clocks

wire Jump,Ld,Hlt;
wire AND1,q1,q2,q3,q4,q5,q6,q7,q8,q9,Clkbuf1,Clkbuf2,Clkbuf3,Clkbuf4,Clkbuf;

assign Hlt = Ins[19]&(~Ins[18])&(~Ins[17])&(~Ins[16])&Ins[15]; /// Hold instruction
assign Jump = Ins[19]&Ins[18]&Ins[17]&(~q4);//Jump instruction
assign Ld = Ins[19]&(~Ins[18])&Ins[17]&(~Ins[16])&(~Ins[15])&(~q2);//load instruction

assign AND1 = Clk & (~q1);

assign NOR = (~(Ld|Jump));
assign AND2 = NOR & AND1;
assign Clkbuf1 = (~(~Clk));

D_FlipFlop D1(q1, Hlt,AND1);
D_FlipFlop D2(q2, Ld,Clk);
D_FlipFlop D3(q3, Jump,Clk);
D_FlipFlop D4(q4, q3,Clk);

assign Clkbuf2 = (~(~Clkbuf1));
assign Clkbuf3 = (~(~Clkbuf2));
assign Clkbuf4 = (~(~Clkbuf3));


D_FlipFlop D5(q5, AND2,Clkbuf1);
D_FlipFlop D6(q6, q5,Clkbuf1);
D_FlipFlop D7(q7, q6,Clkbuf1);
D_FlipFlop D8(q8, q7,Clkbuf1);
D_FlipFlop D9(q9, q8,Clkbuf1);


assign Clk5 = q9 & Clkbuf4;
assign Clk4 = q8 & Clkbuf4;
assign Clk3 = q7 & Clkbuf4;
assign Clk2 = q6 & Clkbuf4;
assign Clk1 = q5 & Clkbuf4;

endmodule


//////////////////////////////////////////////////////////////////////////////
////////// D flip flop
///////////////////////////////////////////////////////////////////////////


module D_FlipFlop(q, d, clk);
	
	output reg q; //Output of D flipflop 
	input d, clk; //Input of D flipflop

//// Initializing initial value of q and qbar
	initial q=0;
	
	always@(posedge clk)
	begin
		q=d;
	end

endmodule
