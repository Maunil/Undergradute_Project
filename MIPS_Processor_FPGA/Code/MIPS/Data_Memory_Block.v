`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:08:32 09/07/2015 
// Design Name: 
// Module Name:    Data_Memory_Block 
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
module Data_Memory_Block(ans_ex, B_bypass, mem_en_ex, mem_rw_ex, clk4, RW_ex, mem_mux_sel_ex, mux_ans_dm, RW_dm);

input [7:0] ans_ex;///ans_ex which comes from execution block
input [7:0] B_bypass;//B_bypass which comes from execution for store data
input mem_en_ex;//memory enable signal from execution block
input mem_mux_sel_ex;//mux sel
input mem_rw_ex;///read-write signa;
input clk4;//clock
input [4:0]RW_ex;///destination register
output [7:0] mux_ans_dm;///data from data memory stage
output reg [4:0]RW_dm;///destination register

wire [7:0]ans_dm;
reg  [7:0]ans_reg;

Data_Memory DM1 (
  .clka(clk4), // input clka
  .ena(mem_en_ex), // input ena
  .wea(mem_rw_ex), // input [0 : 0] wea
  .addra(ans_ex), // input [7 : 0] addra
  .dina(B_bypass), // input [7 : 0] dina
  .douta(ans_dm) // output [7 : 0] douta
);


always@(posedge clk4)
begin
		//One Register
		RW_dm <= RW_ex;
		ans_reg <= ans_ex;
		//Mux
end

assign mux_ans_dm = (mem_mux_sel_ex == 1'b1) ? ans_dm : ans_reg;

endmodule
