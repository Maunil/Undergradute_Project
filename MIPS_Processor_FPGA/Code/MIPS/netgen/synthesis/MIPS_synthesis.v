////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.28xd
//  \   \         Application: netgen
//  /   /         Filename: MIPS_synthesis.v
// /___/   /\     Timestamp: Mon Nov 02 15:21:16 2015
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim MIPS.ngc MIPS_synthesis.v 
// Device	: xc3s500e-4-fg320
// Input file	: MIPS.ngc
// Output file	: E:\ICT\ICT SEM 3\Computer Organization\Practical Lab\AdderMIPS\MIPS\netgen\synthesis\MIPS_synthesis.v
// # of Modules	: 1
// Design Name	: MIPS
// Xilinx        : C:\Xilinx\14.2\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module MIPS (
  Clk3_sim, Interrupt, Clk_sim, Clk4_sim, Clk5_sim, Clk1_sim, Input_Clk, Clk2_sim, Data_out, mux_sel_a, mux_sel_b, A, B, ans_ex, Data_in
)/* synthesis syn_black_box syn_noprune=1 */;
  output Clk3_sim;
  input Interrupt;
  output Clk_sim;
  output Clk4_sim;
  output Clk5_sim;
  output Clk1_sim;
  input Input_Clk;
  output Clk2_sim;
  output [7 : 0] Data_out;
  output [1 : 0] mux_sel_a;
  output [1 : 0] mux_sel_b;
  output [7 : 0] A;
  output [7 : 0] B;
  output [7 : 0] ans_ex;
  input [7 : 0] Data_in;
  
  // synthesis translate_off
  
  wire A_0_OBUF_8;
  wire A_1_OBUF_9;
  wire A_2_OBUF_10;
  wire A_3_OBUF_11;
  wire A_4_OBUF_12;
  wire A_5_OBUF_13;
  wire A_6_OBUF_14;
  wire A_7_OBUF_15;
  wire B_0_OBUF_24;
  wire B_1_OBUF_25;
  wire B_2_OBUF_26;
  wire B_3_OBUF_27;
  wire B_4_OBUF_28;
  wire B_5_OBUF_29;
  wire B_6_OBUF_30;
  wire B_7_OBUF_31;
  wire \CG/Mcount_Counter_xor<4>11 ;
  wire \CG/Mcount_Counter_xor<4>111_38 ;
  wire \CG/Output_Clk_39 ;
  wire \CG/Output_Clk1 ;
  wire \CG/Output_Clk_cmp_eq0000 ;
  wire \CG/Output_Clk_cmp_eq00001_42 ;
  wire \CG/Output_Clk_not0001 ;
  wire Clk1_sim_OBUF_45;
  wire Clk2_sim_OBUF_47;
  wire Clk3_sim_OBUF_49;
  wire Clk3_sim_OBUF1;
  wire Clk4_sim_OBUF_52;
  wire Clk5_sim_OBUF_54;
  wire Clk5_sim_OBUF1;
  wire \ClockBlock/AND1 ;
  wire \ClockBlock/AND2 ;
  wire \ClockBlock/AND216_59 ;
  wire \ClockBlock/AND28_60 ;
  wire \ClockBlock/D1/q_61 ;
  wire \ClockBlock/D2/q_62 ;
  wire \ClockBlock/D3/q_63 ;
  wire \ClockBlock/D4/q_64 ;
  wire \ClockBlock/D5/q_65 ;
  wire \ClockBlock/D6/q_66 ;
  wire \ClockBlock/D7/q_67 ;
  wire \ClockBlock/D8/q_68 ;
  wire \ClockBlock/D9/q_69 ;
  wire \ClockBlock/Hlt1 ;
  wire \ClockBlock/Jump1 ;
  wire \ClockBlock/Ld1 ;
  wire \ClockBlock/Ld12 ;
  wire Data_in_0_IBUF_103;
  wire Data_in_1_IBUF_104;
  wire Data_in_2_IBUF_105;
  wire Data_in_3_IBUF_106;
  wire Data_in_4_IBUF_107;
  wire Data_in_5_IBUF_108;
  wire Data_in_6_IBUF_109;
  wire Data_in_7_IBUF_110;
  wire \DepCheckBlock/AND21 ;
  wire \DepCheckBlock/N0 ;
  wire \DepCheckBlock/Q_126 ;
  wire \DepCheckBlock/Q1_127 ;
  wire \DepCheckBlock/Q2_128 ;
  wire \DepCheckBlock/imm_sel_164 ;
  wire \DepCheckBlock/mem_en_dec1 ;
  wire \DepCheckBlock/mux_sel_a_cmp_eq0000 ;
  wire \DepCheckBlock/mux_sel_a_cmp_eq0000562_167 ;
  wire \DepCheckBlock/mux_sel_a_cmp_eq0001 ;
  wire \DepCheckBlock/mux_sel_a_cmp_eq0001562_169 ;
  wire \DepCheckBlock/mux_sel_a_cmp_eq0002 ;
  wire \DepCheckBlock/mux_sel_a_cmp_eq0002562_171 ;
  wire \DepCheckBlock/mux_sel_b_cmp_eq0000 ;
  wire \DepCheckBlock/mux_sel_b_cmp_eq0000562_173 ;
  wire \DepCheckBlock/mux_sel_b_cmp_eq0001 ;
  wire \DepCheckBlock/mux_sel_b_cmp_eq0001562_175 ;
  wire \DepCheckBlock/mux_sel_b_cmp_eq0002 ;
  wire \DepCheckBlock/mux_sel_b_cmp_eq0002562_177 ;
  wire \DepCheckBlock/old_NOR_4_or0000_178 ;
  wire \Execution/Data_out_cmp_eq0000 ;
  wire \Execution/Flag_0_mux00000_211 ;
  wire \Execution/Flag_0_mux000054_212 ;
  wire \Execution/Flag_0_mux000073 ;
  wire \Execution/Flag_1_not0001 ;
  wire \Execution/Flag_1_not00012_216 ;
  wire \Execution/Madd_AUX_11_index0000 ;
  wire \Execution/Madd_AUX_8_index0000 ;
  wire \Execution/Mem_en_ex_245 ;
  wire \Execution/Mem_mux_sel_ex_246 ;
  wire \Execution/Mem_rw_ex_247 ;
  wire \Execution/N01 ;
  wire \Execution/N11 ;
  wire \Execution/N14 ;
  wire \Execution/N25 ;
  wire \Execution/N28 ;
  wire \Execution/N39 ;
  wire \Execution/N40 ;
  wire \Execution/N42 ;
  wire \Execution/N43 ;
  wire \Execution/N45 ;
  wire \Execution/N48 ;
  wire \Execution/N49 ;
  wire \Execution/N50 ;
  wire \Execution/N51 ;
  wire \Execution/N52 ;
  wire \Execution/N83 ;
  wire \Execution/N85 ;
  wire \Execution/N87 ;
  wire \Execution/_old_ans_ex_15<0>1 ;
  wire \Execution/ans_ex_mux0000 ;
  wire \Execution/ans_ex_mux00001 ;
  wire \Execution/ans_ex_mux000011_290 ;
  wire \Execution/ans_ex_mux0000122_291 ;
  wire \Execution/ans_ex_mux000013 ;
  wire \Execution/ans_ex_mux0000163_293 ;
  wire \Execution/ans_ex_mux0000193_294 ;
  wire \Execution/ans_ex_mux000025_295 ;
  wire \Execution/ans_ex_mux000037_296 ;
  wire \Execution/ans_ex_mux000038_297 ;
  wire \Execution/ans_ex_mux00004_298 ;
  wire \Execution/ans_ex_mux000048_299 ;
  wire \Execution/ans_ex_mux000060_300 ;
  wire \Execution/ans_ex_mux000092_301 ;
  wire \Execution/ans_ex_mux0001107_302 ;
  wire \Execution/ans_ex_mux0001125_303 ;
  wire \Execution/ans_ex_mux0001137_304 ;
  wire \Execution/ans_ex_mux000114_305 ;
  wire \Execution/ans_ex_mux0001152 ;
  wire \Execution/ans_ex_mux000128_307 ;
  wire \Execution/ans_ex_mux00014_308 ;
  wire \Execution/ans_ex_mux000144_309 ;
  wire \Execution/ans_ex_mux000172_310 ;
  wire \Execution/ans_ex_mux000199_311 ;
  wire \Execution/ans_ex_mux0002 ;
  wire \Execution/ans_ex_mux000210_313 ;
  wire \Execution/ans_ex_mux0002127 ;
  wire \Execution/ans_ex_mux000213_315 ;
  wire \Execution/ans_ex_mux0002133_316 ;
  wire \Execution/ans_ex_mux0002317_317 ;
  wire \Execution/ans_ex_mux0002343_318 ;
  wire \Execution/ans_ex_mux0002350 ;
  wire \Execution/ans_ex_mux0002361_320 ;
  wire \Execution/ans_ex_mux00024_321 ;
  wire \Execution/ans_ex_mux000255_322 ;
  wire \Execution/ans_ex_mux000284_323 ;
  wire \Execution/ans_ex_mux000298_324 ;
  wire \Execution/ans_ex_mux0003 ;
  wire \Execution/ans_ex_mux0003115_326 ;
  wire \Execution/ans_ex_mux0003116_327 ;
  wire \Execution/ans_ex_mux0003129_328 ;
  wire \Execution/ans_ex_mux0003145_329 ;
  wire \Execution/ans_ex_mux000317_330 ;
  wire \Execution/ans_ex_mux000323_331 ;
  wire \Execution/ans_ex_mux00034_332 ;
  wire \Execution/ans_ex_mux000361 ;
  wire \Execution/ans_ex_mux000364_334 ;
  wire \Execution/ans_ex_mux000374_335 ;
  wire \Execution/ans_ex_mux0004 ;
  wire \Execution/ans_ex_mux0004109_337 ;
  wire \Execution/ans_ex_mux0004110_338 ;
  wire \Execution/ans_ex_mux0004123_339 ;
  wire \Execution/ans_ex_mux0004139_340 ;
  wire \Execution/ans_ex_mux000414_341 ;
  wire \Execution/ans_ex_mux000428_342 ;
  wire \Execution/ans_ex_mux000438_343 ;
  wire \Execution/ans_ex_mux00044_344 ;
  wire \Execution/ans_ex_mux000461_345 ;
  wire \Execution/ans_ex_mux000468_346 ;
  wire \Execution/ans_ex_mux0005125_347 ;
  wire \Execution/ans_ex_mux000514_348 ;
  wire \Execution/ans_ex_mux0005143_349 ;
  wire \Execution/ans_ex_mux000515_350 ;
  wire \Execution/ans_ex_mux000528_351 ;
  wire \Execution/ans_ex_mux00054_352 ;
  wire \Execution/ans_ex_mux000544_353 ;
  wire \Execution/ans_ex_mux000572_354 ;
  wire \Execution/ans_ex_mux000594_355 ;
  wire \Execution/ans_ex_mux000599_356 ;
  wire \Execution/ans_ex_mux0006 ;
  wire \Execution/ans_ex_mux0006106_358 ;
  wire \Execution/ans_ex_mux0006116_359 ;
  wire \Execution/ans_ex_mux0006130_360 ;
  wire \Execution/ans_ex_mux000614_361 ;
  wire \Execution/ans_ex_mux0006144_362 ;
  wire \Execution/ans_ex_mux000615_363 ;
  wire \Execution/ans_ex_mux0006169_364 ;
  wire \Execution/ans_ex_mux000628_365 ;
  wire \Execution/ans_ex_mux00064_366 ;
  wire \Execution/ans_ex_mux000644_367 ;
  wire \Execution/ans_ex_mux000672_368 ;
  wire \Execution/ans_ex_mux0007 ;
  wire \Execution/ans_ex_mux00070_370 ;
  wire \Execution/ans_ex_mux0007110_371 ;
  wire \Execution/ans_ex_mux0007146_372 ;
  wire \Execution/ans_ex_mux0007159_373 ;
  wire \Execution/ans_ex_mux0007194_374 ;
  wire \Execution/ans_ex_mux0007206_375 ;
  wire \Execution/ans_ex_mux0007223_376 ;
  wire \Execution/ans_ex_mux000749_377 ;
  wire \Execution/ans_ex_mux000759_378 ;
  wire \Execution/ans_ex_mux000766_379 ;
  wire Input_Clk_BUFGP_381;
  wire N0;
  wire N1;
  wire N103;
  wire N105;
  wire N107;
  wire N112;
  wire N113;
  wire N115;
  wire N117;
  wire N12;
  wire N122;
  wire N123;
  wire N125;
  wire N127;
  wire N131;
  wire N140;
  wire N142;
  wire N143;
  wire N145;
  wire N146;
  wire N148;
  wire N150;
  wire N155;
  wire N159;
  wire N16;
  wire N161;
  wire N162;
  wire N163;
  wire N164;
  wire N165;
  wire N166;
  wire N167;
  wire N168;
  wire N169;
  wire N170;
  wire N171;
  wire N173;
  wire N174;
  wire N175;
  wire N176;
  wire N177;
  wire N179;
  wire N18;
  wire N180;
  wire N181;
  wire N182;
  wire N183;
  wire N184;
  wire N185;
  wire N186;
  wire N189;
  wire N191;
  wire N193;
  wire N195;
  wire N197;
  wire N199;
  wire N20;
  wire N203;
  wire N207;
  wire N209;
  wire N210;
  wire N211;
  wire N212;
  wire N213;
  wire N215;
  wire N216;
  wire N217;
  wire N218;
  wire N219;
  wire N22;
  wire N220;
  wire N221;
  wire N222;
  wire N223;
  wire N224;
  wire N225;
  wire N226;
  wire N227;
  wire N228;
  wire N229;
  wire N230;
  wire N231;
  wire N232;
  wire N233;
  wire N234;
  wire N235;
  wire N236;
  wire N237;
  wire N238;
  wire N239;
  wire N24;
  wire N240;
  wire N241;
  wire N242;
  wire N243;
  wire N25;
  wire N29;
  wire N31;
  wire N32;
  wire N34;
  wire N35;
  wire N37;
  wire N38;
  wire N40;
  wire N41;
  wire N43;
  wire N44;
  wire N46;
  wire N47;
  wire N49;
  wire N50;
  wire N52;
  wire N53;
  wire N55;
  wire N56;
  wire N60;
  wire N61;
  wire N67;
  wire N69;
  wire N70;
  wire N72;
  wire N73;
  wire N75;
  wire N76;
  wire N78;
  wire N79;
  wire N81;
  wire N82;
  wire N84;
  wire N85;
  wire N87;
  wire N88;
  wire N90;
  wire N94;
  wire N96;
  wire N97;
  wire N99;
  wire \PCIM/Temp<3>_bdd0 ;
  wire \PCIM/Temp<7>1119 ;
  wire \PCIM/Temp<7>11191_557 ;
  wire \PCIM/Temp<7>11192_558 ;
  wire \PCIM/Temp<7>139_559 ;
  wire \RF/Mmux_A_3_560 ;
  wire \RF/Mmux_A_31_561 ;
  wire \RF/Mmux_A_32_562 ;
  wire \RF/Mmux_A_33_563 ;
  wire \RF/Mmux_A_34_564 ;
  wire \RF/Mmux_A_35_565 ;
  wire \RF/Mmux_A_36_566 ;
  wire \RF/Mmux_A_37_567 ;
  wire \RF/Mmux_A_4_568 ;
  wire \RF/Mmux_A_41_569 ;
  wire \RF/Mmux_A_42_570 ;
  wire \RF/Mmux_A_43_571 ;
  wire \RF/Mmux_A_44_572 ;
  wire \RF/Mmux_A_45_573 ;
  wire \RF/Mmux_A_46_574 ;
  wire \RF/Mmux_A_47_575 ;
  wire \RF/Mmux_Temp_B_3_576 ;
  wire \RF/Mmux_Temp_B_31_577 ;
  wire \RF/Mmux_Temp_B_32_578 ;
  wire \RF/Mmux_Temp_B_33_579 ;
  wire \RF/Mmux_Temp_B_34_580 ;
  wire \RF/Mmux_Temp_B_4_581 ;
  wire \RF/Mmux_Temp_B_41_582 ;
  wire \RF/Mmux_Temp_B_42_583 ;
  wire \RF/Mmux_Temp_B_43_584 ;
  wire \RF/Mmux_Temp_B_44_585 ;
  wire \RF/N11 ;
  wire \RF/N13 ;
  wire \RF/N15 ;
  wire \RF/N17 ;
  wire \RF/N19 ;
  wire \RF/N21 ;
  wire \RF/N23 ;
  wire \RF/N25 ;
  wire \RF/N27 ;
  wire \RF/N29 ;
  wire \RF/N31 ;
  wire \RF/N33 ;
  wire \RF/N35 ;
  wire \RF/N39 ;
  wire \RF/N41 ;
  wire \RF/N43 ;
  wire \RF/N45 ;
  wire \RF/N47 ;
  wire \RF/N49 ;
  wire \RF/N5 ;
  wire \RF/N51 ;
  wire \RF/N53 ;
  wire \RF/N55 ;
  wire \RF/N57 ;
  wire \RF/N59 ;
  wire \RF/N61 ;
  wire \RF/N63 ;
  wire \RF/N65 ;
  wire \RF/N67 ;
  wire \RF/N69 ;
  wire \RF/N7 ;
  wire \RF/N9 ;
  wire \RF/write_ctrl ;
  wire mux_sel_a_0_OBUF_687;
  wire mux_sel_a_1_OBUF_688;
  wire mux_sel_b_0_OBUF_691;
  wire mux_sel_b_1_OBUF_692;
  wire pc_mux_sel;
  wire \NLW_RF/Mram_Register_Bank_ren16_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank_ren15_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank_ren14_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank_ren13_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank_ren12_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank_ren10_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank_ren9_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank_ren11_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank_ren7_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank_ren6_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank_ren8_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank_ren4_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank_ren3_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank_ren5_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank_ren2_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank_ren1_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank16_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank15_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank14_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank13_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank12_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank11_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank9_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank8_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank10_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank6_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank5_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank7_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank3_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank2_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank4_SPO_UNCONNECTED ;
  wire \NLW_RF/Mram_Register_Bank1_SPO_UNCONNECTED ;
  wire [4 : 0] \CG/Counter ;
  wire [4 : 0] \DM/RW_dm ;
  wire [7 : 0] \DM/ans_dm ;
  wire [7 : 0] \DM/ans_reg ;
  wire [4 : 0] \DepCheckBlock/Op_ex ;
  wire [4 : 0] \DepCheckBlock/RegA ;
  wire [4 : 0] \DepCheckBlock/RegB ;
  wire [4 : 0] \DepCheckBlock/Register1 ;
  wire [4 : 0] \DepCheckBlock/Register2 ;
  wire [4 : 0] \DepCheckBlock/Register3 ;
  wire [4 : 0] \DepCheckBlock/Register4 ;
  wire [4 : 0] \DepCheckBlock/imm ;
  wire [6 : 0] \Execution/AUX_11_addsub0000 ;
  wire [6 : 0] \Execution/AUX_8_addsub0000 ;
  wire [7 : 0] \Execution/B_bypass ;
  wire [7 : 0] \Execution/Data_out ;
  wire [1 : 0] \Execution/Flag ;
  wire [5 : 0] \Execution/Madd_AUX_11_addsub0000_cy ;
  wire [6 : 0] \Execution/Madd_AUX_11_addsub0000_lut ;
  wire [5 : 0] \Execution/Madd_AUX_8_addsub0000_cy ;
  wire [6 : 0] \Execution/Madd_AUX_8_addsub0000_lut ;
  wire [7 : 0] \Execution/Register ;
  wire [4 : 0] \Execution/Rw_ex ;
  wire [7 : 0] \Execution/_old_ans_ex_15 ;
  wire [19 : 0] Ins;
  wire [7 : 0] \PCIM/D1/Q ;
  wire [7 : 0] \PCIM/Temp ;
  wire [7 : 0] \RF/Reg_A ;
  wire [7 : 0] \RF/Reg_B ;
  wire [4 : 0] \RF/Temp_B ;
  wire [7 : 0] \RF/_varindex0000 ;
  wire [7 : 0] \RF/_varindex0001 ;
  wire [4 : 0] Result;
  wire [7 : 0] \WB/ans_wb ;
  wire [7 : 0] mux_ans_dm;
  GND   XST_GND (
    .G(N0)
  );
  VCC   XST_VCC (
    .P(N1)
  );
  FDE #(
    .INIT ( 1'b0 ))
  \CG/Output_Clk  (
    .C(Input_Clk_BUFGP_381),
    .CE(\CG/Output_Clk_cmp_eq0000 ),
    .D(\CG/Output_Clk_not0001 ),
    .Q(\CG/Output_Clk1 )
  );
  FDR #(
    .INIT ( 1'b1 ))
  \CG/Counter_0  (
    .C(Input_Clk_BUFGP_381),
    .D(Result[0]),
    .R(\CG/Output_Clk_cmp_eq0000 ),
    .Q(\CG/Counter [0])
  );
  FDR #(
    .INIT ( 1'b1 ))
  \CG/Counter_1  (
    .C(Input_Clk_BUFGP_381),
    .D(Result[1]),
    .R(\CG/Output_Clk_cmp_eq0000 ),
    .Q(\CG/Counter [1])
  );
  FDR #(
    .INIT ( 1'b1 ))
  \CG/Counter_2  (
    .C(Input_Clk_BUFGP_381),
    .D(Result[2]),
    .R(\CG/Output_Clk_cmp_eq0000 ),
    .Q(\CG/Counter [2])
  );
  FDR #(
    .INIT ( 1'b1 ))
  \CG/Counter_3  (
    .C(Input_Clk_BUFGP_381),
    .D(Result[3]),
    .R(\CG/Output_Clk_cmp_eq0000 ),
    .Q(\CG/Counter [3])
  );
  FDR #(
    .INIT ( 1'b1 ))
  \CG/Counter_4  (
    .C(Input_Clk_BUFGP_381),
    .D(Result[4]),
    .R(\CG/Output_Clk_cmp_eq0000 ),
    .Q(\CG/Counter [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \DepCheckBlock/Register4_4  (
    .C(\CG/Output_Clk_39 ),
    .D(\DepCheckBlock/Register3 [4]),
    .Q(\DepCheckBlock/Register4 [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \DepCheckBlock/Register4_3  (
    .C(\CG/Output_Clk_39 ),
    .D(\DepCheckBlock/Register3 [3]),
    .Q(\DepCheckBlock/Register4 [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \DepCheckBlock/Register4_2  (
    .C(\CG/Output_Clk_39 ),
    .D(\DepCheckBlock/Register3 [2]),
    .Q(\DepCheckBlock/Register4 [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \DepCheckBlock/Register4_1  (
    .C(\CG/Output_Clk_39 ),
    .D(\DepCheckBlock/Register3 [1]),
    .Q(\DepCheckBlock/Register4 [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \DepCheckBlock/Register4_0  (
    .C(\CG/Output_Clk_39 ),
    .D(\DepCheckBlock/Register3 [0]),
    .Q(\DepCheckBlock/Register4 [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  \DepCheckBlock/Register3_4  (
    .C(\CG/Output_Clk_39 ),
    .D(\DepCheckBlock/Register2 [4]),
    .Q(\DepCheckBlock/Register3 [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \DepCheckBlock/Register3_3  (
    .C(\CG/Output_Clk_39 ),
    .D(\DepCheckBlock/Register2 [3]),
    .Q(\DepCheckBlock/Register3 [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \DepCheckBlock/Register3_2  (
    .C(\CG/Output_Clk_39 ),
    .D(\DepCheckBlock/Register2 [2]),
    .Q(\DepCheckBlock/Register3 [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \DepCheckBlock/Register3_1  (
    .C(\CG/Output_Clk_39 ),
    .D(\DepCheckBlock/Register2 [1]),
    .Q(\DepCheckBlock/Register3 [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \DepCheckBlock/Register3_0  (
    .C(\CG/Output_Clk_39 ),
    .D(\DepCheckBlock/Register2 [0]),
    .Q(\DepCheckBlock/Register3 [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  \DepCheckBlock/Register2_4  (
    .C(\CG/Output_Clk_39 ),
    .D(\DepCheckBlock/Register1 [4]),
    .Q(\DepCheckBlock/Register2 [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \DepCheckBlock/Register2_3  (
    .C(\CG/Output_Clk_39 ),
    .D(\DepCheckBlock/Register1 [3]),
    .Q(\DepCheckBlock/Register2 [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \DepCheckBlock/Register2_2  (
    .C(\CG/Output_Clk_39 ),
    .D(\DepCheckBlock/Register1 [2]),
    .Q(\DepCheckBlock/Register2 [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \DepCheckBlock/Register2_1  (
    .C(\CG/Output_Clk_39 ),
    .D(\DepCheckBlock/Register1 [1]),
    .Q(\DepCheckBlock/Register2 [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \DepCheckBlock/Register2_0  (
    .C(\CG/Output_Clk_39 ),
    .D(\DepCheckBlock/Register1 [0]),
    .Q(\DepCheckBlock/Register2 [0])
  );
  FDR   \DepCheckBlock/imm_sel  (
    .C(\CG/Output_Clk_39 ),
    .D(Ins[18]),
    .R(Ins[19]),
    .Q(\DepCheckBlock/imm_sel_164 )
  );
  FDR   \DepCheckBlock/RegA_4  (
    .C(\CG/Output_Clk_39 ),
    .D(Ins[9]),
    .R(\DepCheckBlock/old_NOR_4_or0000_178 ),
    .Q(\DepCheckBlock/RegA [4])
  );
  FDR   \DepCheckBlock/RegA_3  (
    .C(\CG/Output_Clk_39 ),
    .D(Ins[8]),
    .R(\DepCheckBlock/old_NOR_4_or0000_178 ),
    .Q(\DepCheckBlock/RegA [3])
  );
  FDR   \DepCheckBlock/RegA_2  (
    .C(\CG/Output_Clk_39 ),
    .D(Ins[7]),
    .R(\DepCheckBlock/old_NOR_4_or0000_178 ),
    .Q(\DepCheckBlock/RegA [2])
  );
  FDR   \DepCheckBlock/RegA_1  (
    .C(\CG/Output_Clk_39 ),
    .D(Ins[6]),
    .R(\DepCheckBlock/old_NOR_4_or0000_178 ),
    .Q(\DepCheckBlock/RegA [1])
  );
  FDR   \DepCheckBlock/RegA_0  (
    .C(\CG/Output_Clk_39 ),
    .D(Ins[5]),
    .R(\DepCheckBlock/old_NOR_4_or0000_178 ),
    .Q(\DepCheckBlock/RegA [0])
  );
  FDR   \DepCheckBlock/RegB_4  (
    .C(\CG/Output_Clk_39 ),
    .D(Ins[4]),
    .R(\DepCheckBlock/old_NOR_4_or0000_178 ),
    .Q(\DepCheckBlock/RegB [4])
  );
  FDR   \DepCheckBlock/RegB_3  (
    .C(\CG/Output_Clk_39 ),
    .D(Ins[3]),
    .R(\DepCheckBlock/old_NOR_4_or0000_178 ),
    .Q(\DepCheckBlock/RegB [3])
  );
  FDR   \DepCheckBlock/RegB_2  (
    .C(\CG/Output_Clk_39 ),
    .D(Ins[2]),
    .R(\DepCheckBlock/old_NOR_4_or0000_178 ),
    .Q(\DepCheckBlock/RegB [2])
  );
  FDR   \DepCheckBlock/RegB_1  (
    .C(\CG/Output_Clk_39 ),
    .D(Ins[1]),
    .R(\DepCheckBlock/old_NOR_4_or0000_178 ),
    .Q(\DepCheckBlock/RegB [1])
  );
  FDR   \DepCheckBlock/RegB_0  (
    .C(\CG/Output_Clk_39 ),
    .D(Ins[0]),
    .R(\DepCheckBlock/old_NOR_4_or0000_178 ),
    .Q(\DepCheckBlock/RegB [0])
  );
  FD   \DepCheckBlock/imm_0  (
    .C(\CG/Output_Clk_39 ),
    .D(Ins[0]),
    .Q(\DepCheckBlock/imm [0])
  );
  FD   \DepCheckBlock/imm_2  (
    .C(\CG/Output_Clk_39 ),
    .D(Ins[2]),
    .Q(\DepCheckBlock/imm [2])
  );
  FD   \DepCheckBlock/imm_3  (
    .C(\CG/Output_Clk_39 ),
    .D(Ins[3]),
    .Q(\DepCheckBlock/imm [3])
  );
  FD   \DepCheckBlock/imm_1  (
    .C(\CG/Output_Clk_39 ),
    .D(Ins[1]),
    .Q(\DepCheckBlock/imm [1])
  );
  FD   \DepCheckBlock/imm_4  (
    .C(\CG/Output_Clk_39 ),
    .D(Ins[4]),
    .Q(\DepCheckBlock/imm [4])
  );
  FD   \DepCheckBlock/Op_ex_4  (
    .C(\CG/Output_Clk_39 ),
    .D(Ins[19]),
    .Q(\DepCheckBlock/Op_ex [4])
  );
  FD   \DepCheckBlock/Op_ex_3  (
    .C(\CG/Output_Clk_39 ),
    .D(Ins[18]),
    .Q(\DepCheckBlock/Op_ex [3])
  );
  FD   \DepCheckBlock/Op_ex_2  (
    .C(\CG/Output_Clk_39 ),
    .D(Ins[17]),
    .Q(\DepCheckBlock/Op_ex [2])
  );
  FD   \DepCheckBlock/Op_ex_1  (
    .C(\CG/Output_Clk_39 ),
    .D(Ins[16]),
    .Q(\DepCheckBlock/Op_ex [1])
  );
  FD   \DepCheckBlock/Op_ex_0  (
    .C(\CG/Output_Clk_39 ),
    .D(Ins[15]),
    .Q(\DepCheckBlock/Op_ex [0])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/Mmux_Temp_B_4  (
    .I0(mux_sel_b_0_OBUF_691),
    .I1(\RF/Reg_B [0]),
    .I2(\Execution/Register [0]),
    .O(\RF/Mmux_Temp_B_4_581 )
  );
  MUXF5   \RF/Mmux_Temp_B_2_f5  (
    .I0(\RF/Mmux_Temp_B_4_581 ),
    .I1(\RF/Mmux_Temp_B_3_576 ),
    .S(mux_sel_b_1_OBUF_692),
    .O(\RF/Temp_B [0])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/Mmux_Temp_B_41  (
    .I0(mux_sel_b_0_OBUF_691),
    .I1(\RF/Reg_B [1]),
    .I2(\Execution/Register [1]),
    .O(\RF/Mmux_Temp_B_41_582 )
  );
  MUXF5   \RF/Mmux_Temp_B_2_f5_0  (
    .I0(\RF/Mmux_Temp_B_41_582 ),
    .I1(\RF/Mmux_Temp_B_31_577 ),
    .S(mux_sel_b_1_OBUF_692),
    .O(\RF/Temp_B [1])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/Mmux_Temp_B_42  (
    .I0(mux_sel_b_0_OBUF_691),
    .I1(\RF/Reg_B [2]),
    .I2(\Execution/Register [2]),
    .O(\RF/Mmux_Temp_B_42_583 )
  );
  MUXF5   \RF/Mmux_Temp_B_2_f5_1  (
    .I0(\RF/Mmux_Temp_B_42_583 ),
    .I1(\RF/Mmux_Temp_B_32_578 ),
    .S(mux_sel_b_1_OBUF_692),
    .O(\RF/Temp_B [2])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/Mmux_Temp_B_43  (
    .I0(mux_sel_b_0_OBUF_691),
    .I1(\RF/Reg_B [3]),
    .I2(\Execution/Register [3]),
    .O(\RF/Mmux_Temp_B_43_584 )
  );
  MUXF5   \RF/Mmux_Temp_B_2_f5_2  (
    .I0(\RF/Mmux_Temp_B_43_584 ),
    .I1(\RF/Mmux_Temp_B_33_579 ),
    .S(mux_sel_b_1_OBUF_692),
    .O(\RF/Temp_B [3])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/Mmux_Temp_B_44  (
    .I0(mux_sel_b_0_OBUF_691),
    .I1(\RF/Reg_B [4]),
    .I2(\Execution/Register [4]),
    .O(\RF/Mmux_Temp_B_44_585 )
  );
  MUXF5   \RF/Mmux_Temp_B_2_f5_3  (
    .I0(\RF/Mmux_Temp_B_44_585 ),
    .I1(\RF/Mmux_Temp_B_34_580 ),
    .S(mux_sel_b_1_OBUF_692),
    .O(\RF/Temp_B [4])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/Mmux_A_4  (
    .I0(mux_sel_a_0_OBUF_687),
    .I1(\RF/Reg_A [0]),
    .I2(\Execution/Register [0]),
    .O(\RF/Mmux_A_4_568 )
  );
  MUXF5   \RF/Mmux_A_2_f5  (
    .I0(\RF/Mmux_A_4_568 ),
    .I1(\RF/Mmux_A_3_560 ),
    .S(mux_sel_a_1_OBUF_688),
    .O(A_0_OBUF_8)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/Mmux_A_41  (
    .I0(mux_sel_a_0_OBUF_687),
    .I1(\RF/Reg_A [1]),
    .I2(\Execution/Register [1]),
    .O(\RF/Mmux_A_41_569 )
  );
  MUXF5   \RF/Mmux_A_2_f5_0  (
    .I0(\RF/Mmux_A_41_569 ),
    .I1(\RF/Mmux_A_31_561 ),
    .S(mux_sel_a_1_OBUF_688),
    .O(A_1_OBUF_9)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/Mmux_A_42  (
    .I0(mux_sel_a_0_OBUF_687),
    .I1(\RF/Reg_A [2]),
    .I2(\Execution/Register [2]),
    .O(\RF/Mmux_A_42_570 )
  );
  MUXF5   \RF/Mmux_A_2_f5_1  (
    .I0(\RF/Mmux_A_42_570 ),
    .I1(\RF/Mmux_A_32_562 ),
    .S(mux_sel_a_1_OBUF_688),
    .O(A_2_OBUF_10)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/Mmux_A_43  (
    .I0(mux_sel_a_0_OBUF_687),
    .I1(\RF/Reg_A [3]),
    .I2(\Execution/Register [3]),
    .O(\RF/Mmux_A_43_571 )
  );
  MUXF5   \RF/Mmux_A_2_f5_2  (
    .I0(\RF/Mmux_A_43_571 ),
    .I1(\RF/Mmux_A_33_563 ),
    .S(mux_sel_a_1_OBUF_688),
    .O(A_3_OBUF_11)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/Mmux_A_44  (
    .I0(mux_sel_a_0_OBUF_687),
    .I1(\RF/Reg_A [4]),
    .I2(\Execution/Register [4]),
    .O(\RF/Mmux_A_44_572 )
  );
  MUXF5   \RF/Mmux_A_2_f5_3  (
    .I0(\RF/Mmux_A_44_572 ),
    .I1(\RF/Mmux_A_34_564 ),
    .S(mux_sel_a_1_OBUF_688),
    .O(A_4_OBUF_12)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/Mmux_A_45  (
    .I0(mux_sel_a_0_OBUF_687),
    .I1(\RF/Reg_A [5]),
    .I2(\Execution/Register [5]),
    .O(\RF/Mmux_A_45_573 )
  );
  MUXF5   \RF/Mmux_A_2_f5_4  (
    .I0(\RF/Mmux_A_45_573 ),
    .I1(\RF/Mmux_A_35_565 ),
    .S(mux_sel_a_1_OBUF_688),
    .O(A_5_OBUF_13)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/Mmux_A_46  (
    .I0(mux_sel_a_0_OBUF_687),
    .I1(\RF/Reg_A [6]),
    .I2(\Execution/Register [6]),
    .O(\RF/Mmux_A_46_574 )
  );
  MUXF5   \RF/Mmux_A_2_f5_5  (
    .I0(\RF/Mmux_A_46_574 ),
    .I1(\RF/Mmux_A_36_566 ),
    .S(mux_sel_a_1_OBUF_688),
    .O(A_6_OBUF_14)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/Mmux_A_47  (
    .I0(mux_sel_a_0_OBUF_687),
    .I1(\RF/Reg_A [7]),
    .I2(\Execution/Register [7]),
    .O(\RF/Mmux_A_47_575 )
  );
  MUXF5   \RF/Mmux_A_2_f5_6  (
    .I0(\RF/Mmux_A_47_575 ),
    .I1(\RF/Mmux_A_37_567 ),
    .S(mux_sel_a_1_OBUF_688),
    .O(A_7_OBUF_15)
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \RF/Mram_Register_Bank_ren16  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[7]),
    .DPRA0(Ins[0]),
    .DPRA1(Ins[1]),
    .DPRA2(Ins[2]),
    .DPRA3(Ins[3]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\DM/RW_dm [4]),
    .SPO(\NLW_RF/Mram_Register_Bank_ren16_SPO_UNCONNECTED ),
    .DPO(\RF/N69 )
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \RF/Mram_Register_Bank_ren15  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[7]),
    .DPRA0(Ins[0]),
    .DPRA1(Ins[1]),
    .DPRA2(Ins[2]),
    .DPRA3(Ins[3]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\RF/write_ctrl ),
    .SPO(\NLW_RF/Mram_Register_Bank_ren15_SPO_UNCONNECTED ),
    .DPO(\RF/N67 )
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \RF/Mram_Register_Bank_ren14  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[6]),
    .DPRA0(Ins[0]),
    .DPRA1(Ins[1]),
    .DPRA2(Ins[2]),
    .DPRA3(Ins[3]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\DM/RW_dm [4]),
    .SPO(\NLW_RF/Mram_Register_Bank_ren14_SPO_UNCONNECTED ),
    .DPO(\RF/N65 )
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \RF/Mram_Register_Bank_ren13  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[6]),
    .DPRA0(Ins[0]),
    .DPRA1(Ins[1]),
    .DPRA2(Ins[2]),
    .DPRA3(Ins[3]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\RF/write_ctrl ),
    .SPO(\NLW_RF/Mram_Register_Bank_ren13_SPO_UNCONNECTED ),
    .DPO(\RF/N63 )
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \RF/Mram_Register_Bank_ren12  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[5]),
    .DPRA0(Ins[0]),
    .DPRA1(Ins[1]),
    .DPRA2(Ins[2]),
    .DPRA3(Ins[3]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\DM/RW_dm [4]),
    .SPO(\NLW_RF/Mram_Register_Bank_ren12_SPO_UNCONNECTED ),
    .DPO(\RF/N61 )
  );
  RAM16X1D #(
    .INIT ( 16'hFFFF ))
  \RF/Mram_Register_Bank_ren10  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[4]),
    .DPRA0(Ins[0]),
    .DPRA1(Ins[1]),
    .DPRA2(Ins[2]),
    .DPRA3(Ins[3]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\DM/RW_dm [4]),
    .SPO(\NLW_RF/Mram_Register_Bank_ren10_SPO_UNCONNECTED ),
    .DPO(\RF/N57 )
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \RF/Mram_Register_Bank_ren9  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[4]),
    .DPRA0(Ins[0]),
    .DPRA1(Ins[1]),
    .DPRA2(Ins[2]),
    .DPRA3(Ins[3]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\RF/write_ctrl ),
    .SPO(\NLW_RF/Mram_Register_Bank_ren9_SPO_UNCONNECTED ),
    .DPO(\RF/N55 )
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \RF/Mram_Register_Bank_ren11  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[5]),
    .DPRA0(Ins[0]),
    .DPRA1(Ins[1]),
    .DPRA2(Ins[2]),
    .DPRA3(Ins[3]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\RF/write_ctrl ),
    .SPO(\NLW_RF/Mram_Register_Bank_ren11_SPO_UNCONNECTED ),
    .DPO(\RF/N59 )
  );
  RAM16X1D #(
    .INIT ( 16'hFF00 ))
  \RF/Mram_Register_Bank_ren7  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[3]),
    .DPRA0(Ins[0]),
    .DPRA1(Ins[1]),
    .DPRA2(Ins[2]),
    .DPRA3(Ins[3]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\RF/write_ctrl ),
    .SPO(\NLW_RF/Mram_Register_Bank_ren7_SPO_UNCONNECTED ),
    .DPO(\RF/N51 )
  );
  RAM16X1D #(
    .INIT ( 16'hF0F0 ))
  \RF/Mram_Register_Bank_ren6  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[2]),
    .DPRA0(Ins[0]),
    .DPRA1(Ins[1]),
    .DPRA2(Ins[2]),
    .DPRA3(Ins[3]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\DM/RW_dm [4]),
    .SPO(\NLW_RF/Mram_Register_Bank_ren6_SPO_UNCONNECTED ),
    .DPO(\RF/N49 )
  );
  RAM16X1D #(
    .INIT ( 16'hFF00 ))
  \RF/Mram_Register_Bank_ren8  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[3]),
    .DPRA0(Ins[0]),
    .DPRA1(Ins[1]),
    .DPRA2(Ins[2]),
    .DPRA3(Ins[3]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\DM/RW_dm [4]),
    .SPO(\NLW_RF/Mram_Register_Bank_ren8_SPO_UNCONNECTED ),
    .DPO(\RF/N53 )
  );
  RAM16X1D #(
    .INIT ( 16'hCCCC ))
  \RF/Mram_Register_Bank_ren4  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[1]),
    .DPRA0(Ins[0]),
    .DPRA1(Ins[1]),
    .DPRA2(Ins[2]),
    .DPRA3(Ins[3]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\DM/RW_dm [4]),
    .SPO(\NLW_RF/Mram_Register_Bank_ren4_SPO_UNCONNECTED ),
    .DPO(\RF/N45 )
  );
  RAM16X1D #(
    .INIT ( 16'hCCCC ))
  \RF/Mram_Register_Bank_ren3  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[1]),
    .DPRA0(Ins[0]),
    .DPRA1(Ins[1]),
    .DPRA2(Ins[2]),
    .DPRA3(Ins[3]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\RF/write_ctrl ),
    .SPO(\NLW_RF/Mram_Register_Bank_ren3_SPO_UNCONNECTED ),
    .DPO(\RF/N43 )
  );
  RAM16X1D #(
    .INIT ( 16'hF0F0 ))
  \RF/Mram_Register_Bank_ren5  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[2]),
    .DPRA0(Ins[0]),
    .DPRA1(Ins[1]),
    .DPRA2(Ins[2]),
    .DPRA3(Ins[3]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\RF/write_ctrl ),
    .SPO(\NLW_RF/Mram_Register_Bank_ren5_SPO_UNCONNECTED ),
    .DPO(\RF/N47 )
  );
  RAM16X1D #(
    .INIT ( 16'hAAAA ))
  \RF/Mram_Register_Bank_ren2  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[0]),
    .DPRA0(Ins[0]),
    .DPRA1(Ins[1]),
    .DPRA2(Ins[2]),
    .DPRA3(Ins[3]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\DM/RW_dm [4]),
    .SPO(\NLW_RF/Mram_Register_Bank_ren2_SPO_UNCONNECTED ),
    .DPO(\RF/N41 )
  );
  RAM16X1D #(
    .INIT ( 16'hAAAA ))
  \RF/Mram_Register_Bank_ren1  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[0]),
    .DPRA0(Ins[0]),
    .DPRA1(Ins[1]),
    .DPRA2(Ins[2]),
    .DPRA3(Ins[3]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\RF/write_ctrl ),
    .SPO(\NLW_RF/Mram_Register_Bank_ren1_SPO_UNCONNECTED ),
    .DPO(\RF/N39 )
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \RF/Mram_Register_Bank16  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[7]),
    .DPRA0(Ins[5]),
    .DPRA1(Ins[6]),
    .DPRA2(Ins[7]),
    .DPRA3(Ins[8]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\DM/RW_dm [4]),
    .SPO(\NLW_RF/Mram_Register_Bank16_SPO_UNCONNECTED ),
    .DPO(\RF/N35 )
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \RF/Mram_Register_Bank15  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[7]),
    .DPRA0(Ins[5]),
    .DPRA1(Ins[6]),
    .DPRA2(Ins[7]),
    .DPRA3(Ins[8]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\RF/write_ctrl ),
    .SPO(\NLW_RF/Mram_Register_Bank15_SPO_UNCONNECTED ),
    .DPO(\RF/N33 )
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \RF/Mram_Register_Bank14  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[6]),
    .DPRA0(Ins[5]),
    .DPRA1(Ins[6]),
    .DPRA2(Ins[7]),
    .DPRA3(Ins[8]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\DM/RW_dm [4]),
    .SPO(\NLW_RF/Mram_Register_Bank14_SPO_UNCONNECTED ),
    .DPO(\RF/N31 )
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \RF/Mram_Register_Bank13  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[6]),
    .DPRA0(Ins[5]),
    .DPRA1(Ins[6]),
    .DPRA2(Ins[7]),
    .DPRA3(Ins[8]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\RF/write_ctrl ),
    .SPO(\NLW_RF/Mram_Register_Bank13_SPO_UNCONNECTED ),
    .DPO(\RF/N29 )
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \RF/Mram_Register_Bank12  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[5]),
    .DPRA0(Ins[5]),
    .DPRA1(Ins[6]),
    .DPRA2(Ins[7]),
    .DPRA3(Ins[8]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\DM/RW_dm [4]),
    .SPO(\NLW_RF/Mram_Register_Bank12_SPO_UNCONNECTED ),
    .DPO(\RF/N27 )
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \RF/Mram_Register_Bank11  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[5]),
    .DPRA0(Ins[5]),
    .DPRA1(Ins[6]),
    .DPRA2(Ins[7]),
    .DPRA3(Ins[8]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\RF/write_ctrl ),
    .SPO(\NLW_RF/Mram_Register_Bank11_SPO_UNCONNECTED ),
    .DPO(\RF/N25 )
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \RF/Mram_Register_Bank9  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[4]),
    .DPRA0(Ins[5]),
    .DPRA1(Ins[6]),
    .DPRA2(Ins[7]),
    .DPRA3(Ins[8]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\RF/write_ctrl ),
    .SPO(\NLW_RF/Mram_Register_Bank9_SPO_UNCONNECTED ),
    .DPO(\RF/N21 )
  );
  RAM16X1D #(
    .INIT ( 16'hFF00 ))
  \RF/Mram_Register_Bank8  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[3]),
    .DPRA0(Ins[5]),
    .DPRA1(Ins[6]),
    .DPRA2(Ins[7]),
    .DPRA3(Ins[8]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\DM/RW_dm [4]),
    .SPO(\NLW_RF/Mram_Register_Bank8_SPO_UNCONNECTED ),
    .DPO(\RF/N19 )
  );
  RAM16X1D #(
    .INIT ( 16'hFFFF ))
  \RF/Mram_Register_Bank10  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[4]),
    .DPRA0(Ins[5]),
    .DPRA1(Ins[6]),
    .DPRA2(Ins[7]),
    .DPRA3(Ins[8]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\DM/RW_dm [4]),
    .SPO(\NLW_RF/Mram_Register_Bank10_SPO_UNCONNECTED ),
    .DPO(\RF/N23 )
  );
  RAM16X1D #(
    .INIT ( 16'hF0F0 ))
  \RF/Mram_Register_Bank6  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[2]),
    .DPRA0(Ins[5]),
    .DPRA1(Ins[6]),
    .DPRA2(Ins[7]),
    .DPRA3(Ins[8]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\DM/RW_dm [4]),
    .SPO(\NLW_RF/Mram_Register_Bank6_SPO_UNCONNECTED ),
    .DPO(\RF/N15 )
  );
  RAM16X1D #(
    .INIT ( 16'hF0F0 ))
  \RF/Mram_Register_Bank5  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[2]),
    .DPRA0(Ins[5]),
    .DPRA1(Ins[6]),
    .DPRA2(Ins[7]),
    .DPRA3(Ins[8]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\RF/write_ctrl ),
    .SPO(\NLW_RF/Mram_Register_Bank5_SPO_UNCONNECTED ),
    .DPO(\RF/N13 )
  );
  RAM16X1D #(
    .INIT ( 16'hFF00 ))
  \RF/Mram_Register_Bank7  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[3]),
    .DPRA0(Ins[5]),
    .DPRA1(Ins[6]),
    .DPRA2(Ins[7]),
    .DPRA3(Ins[8]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\RF/write_ctrl ),
    .SPO(\NLW_RF/Mram_Register_Bank7_SPO_UNCONNECTED ),
    .DPO(\RF/N17 )
  );
  RAM16X1D #(
    .INIT ( 16'hCCCC ))
  \RF/Mram_Register_Bank3  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[1]),
    .DPRA0(Ins[5]),
    .DPRA1(Ins[6]),
    .DPRA2(Ins[7]),
    .DPRA3(Ins[8]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\RF/write_ctrl ),
    .SPO(\NLW_RF/Mram_Register_Bank3_SPO_UNCONNECTED ),
    .DPO(\RF/N9 )
  );
  RAM16X1D #(
    .INIT ( 16'hAAAA ))
  \RF/Mram_Register_Bank2  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[0]),
    .DPRA0(Ins[5]),
    .DPRA1(Ins[6]),
    .DPRA2(Ins[7]),
    .DPRA3(Ins[8]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\DM/RW_dm [4]),
    .SPO(\NLW_RF/Mram_Register_Bank2_SPO_UNCONNECTED ),
    .DPO(\RF/N7 )
  );
  RAM16X1D #(
    .INIT ( 16'hCCCC ))
  \RF/Mram_Register_Bank4  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[1]),
    .DPRA0(Ins[5]),
    .DPRA1(Ins[6]),
    .DPRA2(Ins[7]),
    .DPRA3(Ins[8]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\DM/RW_dm [4]),
    .SPO(\NLW_RF/Mram_Register_Bank4_SPO_UNCONNECTED ),
    .DPO(\RF/N11 )
  );
  RAM16X1D #(
    .INIT ( 16'hAAAA ))
  \RF/Mram_Register_Bank1  (
    .A0(\DM/RW_dm [0]),
    .A1(\DM/RW_dm [1]),
    .A2(\DM/RW_dm [2]),
    .A3(\DM/RW_dm [3]),
    .D(mux_ans_dm[0]),
    .DPRA0(Ins[5]),
    .DPRA1(Ins[6]),
    .DPRA2(Ins[7]),
    .DPRA3(Ins[8]),
    .WCLK(Clk5_sim_OBUF_54),
    .WE(\RF/write_ctrl ),
    .SPO(\NLW_RF/Mram_Register_Bank1_SPO_UNCONNECTED ),
    .DPO(\RF/N5 )
  );
  FD   \RF/Reg_B_7  (
    .C(Clk2_sim_OBUF_47),
    .D(\RF/_varindex0001 [7]),
    .Q(\RF/Reg_B [7])
  );
  FD   \RF/Reg_B_6  (
    .C(Clk2_sim_OBUF_47),
    .D(\RF/_varindex0001 [6]),
    .Q(\RF/Reg_B [6])
  );
  FD   \RF/Reg_B_5  (
    .C(Clk2_sim_OBUF_47),
    .D(\RF/_varindex0001 [5]),
    .Q(\RF/Reg_B [5])
  );
  FD   \RF/Reg_B_4  (
    .C(Clk2_sim_OBUF_47),
    .D(\RF/_varindex0001 [4]),
    .Q(\RF/Reg_B [4])
  );
  FD   \RF/Reg_B_3  (
    .C(Clk2_sim_OBUF_47),
    .D(\RF/_varindex0001 [3]),
    .Q(\RF/Reg_B [3])
  );
  FD   \RF/Reg_B_2  (
    .C(Clk2_sim_OBUF_47),
    .D(\RF/_varindex0001 [2]),
    .Q(\RF/Reg_B [2])
  );
  FD   \RF/Reg_B_1  (
    .C(Clk2_sim_OBUF_47),
    .D(\RF/_varindex0001 [1]),
    .Q(\RF/Reg_B [1])
  );
  FD   \RF/Reg_B_0  (
    .C(Clk2_sim_OBUF_47),
    .D(\RF/_varindex0001 [0]),
    .Q(\RF/Reg_B [0])
  );
  FD   \RF/Reg_A_7  (
    .C(Clk2_sim_OBUF_47),
    .D(\RF/_varindex0000 [7]),
    .Q(\RF/Reg_A [7])
  );
  FD   \RF/Reg_A_6  (
    .C(Clk2_sim_OBUF_47),
    .D(\RF/_varindex0000 [6]),
    .Q(\RF/Reg_A [6])
  );
  FD   \RF/Reg_A_5  (
    .C(Clk2_sim_OBUF_47),
    .D(\RF/_varindex0000 [5]),
    .Q(\RF/Reg_A [5])
  );
  FD   \RF/Reg_A_4  (
    .C(Clk2_sim_OBUF_47),
    .D(\RF/_varindex0000 [4]),
    .Q(\RF/Reg_A [4])
  );
  FD   \RF/Reg_A_3  (
    .C(Clk2_sim_OBUF_47),
    .D(\RF/_varindex0000 [3]),
    .Q(\RF/Reg_A [3])
  );
  FD   \RF/Reg_A_2  (
    .C(Clk2_sim_OBUF_47),
    .D(\RF/_varindex0000 [2]),
    .Q(\RF/Reg_A [2])
  );
  FD   \RF/Reg_A_1  (
    .C(Clk2_sim_OBUF_47),
    .D(\RF/_varindex0000 [1]),
    .Q(\RF/Reg_A [1])
  );
  FD   \RF/Reg_A_0  (
    .C(Clk2_sim_OBUF_47),
    .D(\RF/_varindex0000 [0]),
    .Q(\RF/Reg_A [0])
  );
  XORCY   \Execution/Madd_AUX_11_addsub0000_xor<6>  (
    .CI(\Execution/Madd_AUX_11_addsub0000_cy [5]),
    .LI(\Execution/Madd_AUX_11_addsub0000_lut [6]),
    .O(\Execution/AUX_11_addsub0000 [6])
  );
  MUXCY   \Execution/Madd_AUX_11_addsub0000_cy<6>  (
    .CI(\Execution/Madd_AUX_11_addsub0000_cy [5]),
    .DI(A_6_OBUF_14),
    .S(\Execution/Madd_AUX_11_addsub0000_lut [6]),
    .O(\Execution/Madd_AUX_11_index0000 )
  );
  XORCY   \Execution/Madd_AUX_11_addsub0000_xor<5>  (
    .CI(\Execution/Madd_AUX_11_addsub0000_cy [4]),
    .LI(\Execution/Madd_AUX_11_addsub0000_lut [5]),
    .O(\Execution/AUX_11_addsub0000 [5])
  );
  MUXCY   \Execution/Madd_AUX_11_addsub0000_cy<5>  (
    .CI(\Execution/Madd_AUX_11_addsub0000_cy [4]),
    .DI(A_5_OBUF_13),
    .S(\Execution/Madd_AUX_11_addsub0000_lut [5]),
    .O(\Execution/Madd_AUX_11_addsub0000_cy [5])
  );
  XORCY   \Execution/Madd_AUX_11_addsub0000_xor<4>  (
    .CI(\Execution/Madd_AUX_11_addsub0000_cy [3]),
    .LI(\Execution/Madd_AUX_11_addsub0000_lut [4]),
    .O(\Execution/AUX_11_addsub0000 [4])
  );
  MUXCY   \Execution/Madd_AUX_11_addsub0000_cy<4>  (
    .CI(\Execution/Madd_AUX_11_addsub0000_cy [3]),
    .DI(A_4_OBUF_12),
    .S(\Execution/Madd_AUX_11_addsub0000_lut [4]),
    .O(\Execution/Madd_AUX_11_addsub0000_cy [4])
  );
  XORCY   \Execution/Madd_AUX_11_addsub0000_xor<3>  (
    .CI(\Execution/Madd_AUX_11_addsub0000_cy [2]),
    .LI(\Execution/Madd_AUX_11_addsub0000_lut [3]),
    .O(\Execution/AUX_11_addsub0000 [3])
  );
  MUXCY   \Execution/Madd_AUX_11_addsub0000_cy<3>  (
    .CI(\Execution/Madd_AUX_11_addsub0000_cy [2]),
    .DI(A_3_OBUF_11),
    .S(\Execution/Madd_AUX_11_addsub0000_lut [3]),
    .O(\Execution/Madd_AUX_11_addsub0000_cy [3])
  );
  XORCY   \Execution/Madd_AUX_11_addsub0000_xor<2>  (
    .CI(\Execution/Madd_AUX_11_addsub0000_cy [1]),
    .LI(\Execution/Madd_AUX_11_addsub0000_lut [2]),
    .O(\Execution/AUX_11_addsub0000 [2])
  );
  MUXCY   \Execution/Madd_AUX_11_addsub0000_cy<2>  (
    .CI(\Execution/Madd_AUX_11_addsub0000_cy [1]),
    .DI(A_2_OBUF_10),
    .S(\Execution/Madd_AUX_11_addsub0000_lut [2]),
    .O(\Execution/Madd_AUX_11_addsub0000_cy [2])
  );
  XORCY   \Execution/Madd_AUX_11_addsub0000_xor<1>  (
    .CI(\Execution/Madd_AUX_11_addsub0000_cy [0]),
    .LI(\Execution/Madd_AUX_11_addsub0000_lut [1]),
    .O(\Execution/AUX_11_addsub0000 [1])
  );
  MUXCY   \Execution/Madd_AUX_11_addsub0000_cy<1>  (
    .CI(\Execution/Madd_AUX_11_addsub0000_cy [0]),
    .DI(A_1_OBUF_9),
    .S(\Execution/Madd_AUX_11_addsub0000_lut [1]),
    .O(\Execution/Madd_AUX_11_addsub0000_cy [1])
  );
  XORCY   \Execution/Madd_AUX_11_addsub0000_xor<0>  (
    .CI(N1),
    .LI(\Execution/Madd_AUX_11_addsub0000_lut [0]),
    .O(\Execution/AUX_11_addsub0000 [0])
  );
  MUXCY   \Execution/Madd_AUX_11_addsub0000_cy<0>  (
    .CI(N1),
    .DI(A_0_OBUF_8),
    .S(\Execution/Madd_AUX_11_addsub0000_lut [0]),
    .O(\Execution/Madd_AUX_11_addsub0000_cy [0])
  );
  XORCY   \Execution/Madd_AUX_8_addsub0000_xor<6>  (
    .CI(\Execution/Madd_AUX_8_addsub0000_cy [5]),
    .LI(\Execution/Madd_AUX_8_addsub0000_lut [6]),
    .O(\Execution/AUX_8_addsub0000 [6])
  );
  MUXCY   \Execution/Madd_AUX_8_addsub0000_cy<6>  (
    .CI(\Execution/Madd_AUX_8_addsub0000_cy [5]),
    .DI(A_6_OBUF_14),
    .S(\Execution/Madd_AUX_8_addsub0000_lut [6]),
    .O(\Execution/Madd_AUX_8_index0000 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Execution/Madd_AUX_8_addsub0000_lut<6>  (
    .I0(B_6_OBUF_30),
    .I1(A_6_OBUF_14),
    .O(\Execution/Madd_AUX_8_addsub0000_lut [6])
  );
  XORCY   \Execution/Madd_AUX_8_addsub0000_xor<5>  (
    .CI(\Execution/Madd_AUX_8_addsub0000_cy [4]),
    .LI(\Execution/Madd_AUX_8_addsub0000_lut [5]),
    .O(\Execution/AUX_8_addsub0000 [5])
  );
  MUXCY   \Execution/Madd_AUX_8_addsub0000_cy<5>  (
    .CI(\Execution/Madd_AUX_8_addsub0000_cy [4]),
    .DI(A_5_OBUF_13),
    .S(\Execution/Madd_AUX_8_addsub0000_lut [5]),
    .O(\Execution/Madd_AUX_8_addsub0000_cy [5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Execution/Madd_AUX_8_addsub0000_lut<5>  (
    .I0(B_5_OBUF_29),
    .I1(A_5_OBUF_13),
    .O(\Execution/Madd_AUX_8_addsub0000_lut [5])
  );
  XORCY   \Execution/Madd_AUX_8_addsub0000_xor<4>  (
    .CI(\Execution/Madd_AUX_8_addsub0000_cy [3]),
    .LI(\Execution/Madd_AUX_8_addsub0000_lut [4]),
    .O(\Execution/AUX_8_addsub0000 [4])
  );
  MUXCY   \Execution/Madd_AUX_8_addsub0000_cy<4>  (
    .CI(\Execution/Madd_AUX_8_addsub0000_cy [3]),
    .DI(A_4_OBUF_12),
    .S(\Execution/Madd_AUX_8_addsub0000_lut [4]),
    .O(\Execution/Madd_AUX_8_addsub0000_cy [4])
  );
  XORCY   \Execution/Madd_AUX_8_addsub0000_xor<3>  (
    .CI(\Execution/Madd_AUX_8_addsub0000_cy [2]),
    .LI(\Execution/Madd_AUX_8_addsub0000_lut [3]),
    .O(\Execution/AUX_8_addsub0000 [3])
  );
  MUXCY   \Execution/Madd_AUX_8_addsub0000_cy<3>  (
    .CI(\Execution/Madd_AUX_8_addsub0000_cy [2]),
    .DI(A_3_OBUF_11),
    .S(\Execution/Madd_AUX_8_addsub0000_lut [3]),
    .O(\Execution/Madd_AUX_8_addsub0000_cy [3])
  );
  XORCY   \Execution/Madd_AUX_8_addsub0000_xor<2>  (
    .CI(\Execution/Madd_AUX_8_addsub0000_cy [1]),
    .LI(\Execution/Madd_AUX_8_addsub0000_lut [2]),
    .O(\Execution/AUX_8_addsub0000 [2])
  );
  MUXCY   \Execution/Madd_AUX_8_addsub0000_cy<2>  (
    .CI(\Execution/Madd_AUX_8_addsub0000_cy [1]),
    .DI(A_2_OBUF_10),
    .S(\Execution/Madd_AUX_8_addsub0000_lut [2]),
    .O(\Execution/Madd_AUX_8_addsub0000_cy [2])
  );
  XORCY   \Execution/Madd_AUX_8_addsub0000_xor<1>  (
    .CI(\Execution/Madd_AUX_8_addsub0000_cy [0]),
    .LI(\Execution/Madd_AUX_8_addsub0000_lut [1]),
    .O(\Execution/AUX_8_addsub0000 [1])
  );
  MUXCY   \Execution/Madd_AUX_8_addsub0000_cy<1>  (
    .CI(\Execution/Madd_AUX_8_addsub0000_cy [0]),
    .DI(A_1_OBUF_9),
    .S(\Execution/Madd_AUX_8_addsub0000_lut [1]),
    .O(\Execution/Madd_AUX_8_addsub0000_cy [1])
  );
  XORCY   \Execution/Madd_AUX_8_addsub0000_xor<0>  (
    .CI(N0),
    .LI(\Execution/Madd_AUX_8_addsub0000_lut [0]),
    .O(\Execution/AUX_8_addsub0000 [0])
  );
  MUXCY   \Execution/Madd_AUX_8_addsub0000_cy<0>  (
    .CI(N0),
    .DI(A_0_OBUF_8),
    .S(\Execution/Madd_AUX_8_addsub0000_lut [0]),
    .O(\Execution/Madd_AUX_8_addsub0000_cy [0])
  );
  FD   \Execution/Rw_ex_4  (
    .C(Clk3_sim_OBUF_49),
    .D(\DepCheckBlock/Register1 [4]),
    .Q(\Execution/Rw_ex [4])
  );
  FD   \Execution/Rw_ex_3  (
    .C(Clk3_sim_OBUF_49),
    .D(\DepCheckBlock/Register1 [3]),
    .Q(\Execution/Rw_ex [3])
  );
  FD   \Execution/Rw_ex_2  (
    .C(Clk3_sim_OBUF_49),
    .D(\DepCheckBlock/Register1 [2]),
    .Q(\Execution/Rw_ex [2])
  );
  FD   \Execution/Rw_ex_1  (
    .C(Clk3_sim_OBUF_49),
    .D(\DepCheckBlock/Register1 [1]),
    .Q(\Execution/Rw_ex [1])
  );
  FD   \Execution/Rw_ex_0  (
    .C(Clk3_sim_OBUF_49),
    .D(\DepCheckBlock/Register1 [0]),
    .Q(\Execution/Rw_ex [0])
  );
  FD   \Execution/B_bypass_7  (
    .C(Clk3_sim_OBUF_49),
    .D(B_7_OBUF_31),
    .Q(\Execution/B_bypass [7])
  );
  FD   \Execution/B_bypass_6  (
    .C(Clk3_sim_OBUF_49),
    .D(B_6_OBUF_30),
    .Q(\Execution/B_bypass [6])
  );
  FD   \Execution/B_bypass_5  (
    .C(Clk3_sim_OBUF_49),
    .D(B_5_OBUF_29),
    .Q(\Execution/B_bypass [5])
  );
  FD   \Execution/B_bypass_4  (
    .C(Clk3_sim_OBUF_49),
    .D(B_4_OBUF_28),
    .Q(\Execution/B_bypass [4])
  );
  FD   \Execution/B_bypass_3  (
    .C(Clk3_sim_OBUF_49),
    .D(B_3_OBUF_27),
    .Q(\Execution/B_bypass [3])
  );
  FD   \Execution/B_bypass_2  (
    .C(Clk3_sim_OBUF_49),
    .D(B_2_OBUF_26),
    .Q(\Execution/B_bypass [2])
  );
  FD   \Execution/B_bypass_1  (
    .C(Clk3_sim_OBUF_49),
    .D(B_1_OBUF_25),
    .Q(\Execution/B_bypass [1])
  );
  FD   \Execution/B_bypass_0  (
    .C(Clk3_sim_OBUF_49),
    .D(B_0_OBUF_24),
    .Q(\Execution/B_bypass [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  \Execution/Register_7  (
    .C(Clk3_sim_OBUF_49),
    .D(\Execution/_old_ans_ex_15 [7]),
    .Q(\Execution/Register [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  \Execution/Register_6  (
    .C(Clk3_sim_OBUF_49),
    .D(\Execution/_old_ans_ex_15 [6]),
    .Q(\Execution/Register [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  \Execution/Register_5  (
    .C(Clk3_sim_OBUF_49),
    .D(\Execution/_old_ans_ex_15 [5]),
    .Q(\Execution/Register [5])
  );
  FD #(
    .INIT ( 1'b0 ))
  \Execution/Register_4  (
    .C(Clk3_sim_OBUF_49),
    .D(\Execution/_old_ans_ex_15 [4]),
    .Q(\Execution/Register [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \Execution/Register_3  (
    .C(Clk3_sim_OBUF_49),
    .D(\Execution/_old_ans_ex_15 [3]),
    .Q(\Execution/Register [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \Execution/Register_2  (
    .C(Clk3_sim_OBUF_49),
    .D(\Execution/_old_ans_ex_15 [2]),
    .Q(\Execution/Register [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \Execution/Register_1  (
    .C(Clk3_sim_OBUF_49),
    .D(\Execution/_old_ans_ex_15 [1]),
    .Q(\Execution/Register [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \Execution/Register_0  (
    .C(Clk3_sim_OBUF_49),
    .D(\Execution/_old_ans_ex_15 [0]),
    .Q(\Execution/Register [0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \Execution/Data_out_7  (
    .C(Clk3_sim_OBUF_49),
    .CE(\Execution/Data_out_cmp_eq0000 ),
    .D(A_7_OBUF_15),
    .Q(\Execution/Data_out [7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \Execution/Data_out_6  (
    .C(Clk3_sim_OBUF_49),
    .CE(\Execution/Data_out_cmp_eq0000 ),
    .D(A_6_OBUF_14),
    .Q(\Execution/Data_out [6])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \Execution/Data_out_5  (
    .C(Clk3_sim_OBUF_49),
    .CE(\Execution/Data_out_cmp_eq0000 ),
    .D(A_5_OBUF_13),
    .Q(\Execution/Data_out [5])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \Execution/Data_out_4  (
    .C(Clk3_sim_OBUF_49),
    .CE(\Execution/Data_out_cmp_eq0000 ),
    .D(A_4_OBUF_12),
    .Q(\Execution/Data_out [4])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \Execution/Data_out_3  (
    .C(Clk3_sim_OBUF_49),
    .CE(\Execution/Data_out_cmp_eq0000 ),
    .D(A_3_OBUF_11),
    .Q(\Execution/Data_out [3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \Execution/Data_out_2  (
    .C(Clk3_sim_OBUF_49),
    .CE(\Execution/Data_out_cmp_eq0000 ),
    .D(A_2_OBUF_10),
    .Q(\Execution/Data_out [2])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \Execution/Data_out_1  (
    .C(Clk3_sim_OBUF_49),
    .CE(\Execution/Data_out_cmp_eq0000 ),
    .D(A_1_OBUF_9),
    .Q(\Execution/Data_out [1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \Execution/Data_out_0  (
    .C(Clk3_sim_OBUF_49),
    .CE(\Execution/Data_out_cmp_eq0000 ),
    .D(A_0_OBUF_8),
    .Q(\Execution/Data_out [0])
  );
  FDR   \Execution/Flag_1  (
    .C(Clk3_sim_OBUF_49),
    .D(N1),
    .R(\Execution/Flag_1_not0001 ),
    .Q(\Execution/Flag [1])
  );
  FD   \WB/ans_wb_7  (
    .C(Clk5_sim_OBUF_54),
    .D(mux_ans_dm[7]),
    .Q(\WB/ans_wb [7])
  );
  FD   \WB/ans_wb_6  (
    .C(Clk5_sim_OBUF_54),
    .D(mux_ans_dm[6]),
    .Q(\WB/ans_wb [6])
  );
  FD   \WB/ans_wb_5  (
    .C(Clk5_sim_OBUF_54),
    .D(mux_ans_dm[5]),
    .Q(\WB/ans_wb [5])
  );
  FD   \WB/ans_wb_4  (
    .C(Clk5_sim_OBUF_54),
    .D(mux_ans_dm[4]),
    .Q(\WB/ans_wb [4])
  );
  FD   \WB/ans_wb_3  (
    .C(Clk5_sim_OBUF_54),
    .D(mux_ans_dm[3]),
    .Q(\WB/ans_wb [3])
  );
  FD   \WB/ans_wb_2  (
    .C(Clk5_sim_OBUF_54),
    .D(mux_ans_dm[2]),
    .Q(\WB/ans_wb [2])
  );
  FD   \WB/ans_wb_1  (
    .C(Clk5_sim_OBUF_54),
    .D(mux_ans_dm[1]),
    .Q(\WB/ans_wb [1])
  );
  FD   \WB/ans_wb_0  (
    .C(Clk5_sim_OBUF_54),
    .D(mux_ans_dm[0]),
    .Q(\WB/ans_wb [0])
  );
  FD   \DM/ans_reg_7  (
    .C(Clk4_sim_OBUF_52),
    .D(\Execution/Register [7]),
    .Q(\DM/ans_reg [7])
  );
  FD   \DM/ans_reg_6  (
    .C(Clk4_sim_OBUF_52),
    .D(\Execution/Register [6]),
    .Q(\DM/ans_reg [6])
  );
  FD   \DM/ans_reg_5  (
    .C(Clk4_sim_OBUF_52),
    .D(\Execution/Register [5]),
    .Q(\DM/ans_reg [5])
  );
  FD   \DM/ans_reg_4  (
    .C(Clk4_sim_OBUF_52),
    .D(\Execution/Register [4]),
    .Q(\DM/ans_reg [4])
  );
  FD   \DM/ans_reg_3  (
    .C(Clk4_sim_OBUF_52),
    .D(\Execution/Register [3]),
    .Q(\DM/ans_reg [3])
  );
  FD   \DM/ans_reg_2  (
    .C(Clk4_sim_OBUF_52),
    .D(\Execution/Register [2]),
    .Q(\DM/ans_reg [2])
  );
  FD   \DM/ans_reg_1  (
    .C(Clk4_sim_OBUF_52),
    .D(\Execution/Register [1]),
    .Q(\DM/ans_reg [1])
  );
  FD   \DM/ans_reg_0  (
    .C(Clk4_sim_OBUF_52),
    .D(\Execution/Register [0]),
    .Q(\DM/ans_reg [0])
  );
  FD   \DM/RW_dm_4  (
    .C(Clk4_sim_OBUF_52),
    .D(\Execution/Rw_ex [4]),
    .Q(\DM/RW_dm [4])
  );
  FD   \DM/RW_dm_3  (
    .C(Clk4_sim_OBUF_52),
    .D(\Execution/Rw_ex [3]),
    .Q(\DM/RW_dm [3])
  );
  FD   \DM/RW_dm_2  (
    .C(Clk4_sim_OBUF_52),
    .D(\Execution/Rw_ex [2]),
    .Q(\DM/RW_dm [2])
  );
  FD   \DM/RW_dm_1  (
    .C(Clk4_sim_OBUF_52),
    .D(\Execution/Rw_ex [1]),
    .Q(\DM/RW_dm [1])
  );
  FD   \DM/RW_dm_0  (
    .C(Clk4_sim_OBUF_52),
    .D(\Execution/Rw_ex [0]),
    .Q(\DM/RW_dm [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  \ClockBlock/D4/q  (
    .C(\CG/Output_Clk_39 ),
    .D(\ClockBlock/D3/q_63 ),
    .Q(\ClockBlock/D4/q_64 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \ClockBlock/D5/q  (
    .C(\CG/Output_Clk_39 ),
    .D(\ClockBlock/AND2 ),
    .Q(\ClockBlock/D5/q_65 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \ClockBlock/D6/q  (
    .C(\CG/Output_Clk_39 ),
    .D(\ClockBlock/D5/q_65 ),
    .Q(\ClockBlock/D6/q_66 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \ClockBlock/D7/q  (
    .C(\CG/Output_Clk_39 ),
    .D(\ClockBlock/D6/q_66 ),
    .Q(\ClockBlock/D7/q_67 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \ClockBlock/D8/q  (
    .C(\CG/Output_Clk_39 ),
    .D(\ClockBlock/D7/q_67 ),
    .Q(\ClockBlock/D8/q_68 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \ClockBlock/D9/q  (
    .C(\CG/Output_Clk_39 ),
    .D(\ClockBlock/D8/q_68 ),
    .Q(\ClockBlock/D9/q_69 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \PCIM/D1/Q_0  (
    .C(Clk1_sim_OBUF_45),
    .D(\PCIM/Temp [0]),
    .Q(\PCIM/D1/Q [0])
  );
  FD #(
    .INIT ( 1'b1 ))
  \PCIM/D1/Q_1  (
    .C(Clk1_sim_OBUF_45),
    .D(\PCIM/Temp [1]),
    .Q(\PCIM/D1/Q [1])
  );
  FD #(
    .INIT ( 1'b1 ))
  \PCIM/D1/Q_2  (
    .C(Clk1_sim_OBUF_45),
    .D(\PCIM/Temp [2]),
    .Q(\PCIM/D1/Q [2])
  );
  FD #(
    .INIT ( 1'b1 ))
  \PCIM/D1/Q_3  (
    .C(Clk1_sim_OBUF_45),
    .D(\PCIM/Temp [3]),
    .Q(\PCIM/D1/Q [3])
  );
  FD #(
    .INIT ( 1'b1 ))
  \PCIM/D1/Q_4  (
    .C(Clk1_sim_OBUF_45),
    .D(\PCIM/Temp [4]),
    .Q(\PCIM/D1/Q [4])
  );
  FD #(
    .INIT ( 1'b1 ))
  \PCIM/D1/Q_5  (
    .C(Clk1_sim_OBUF_45),
    .D(\PCIM/Temp [5]),
    .Q(\PCIM/D1/Q [5])
  );
  FD #(
    .INIT ( 1'b1 ))
  \PCIM/D1/Q_6  (
    .C(Clk1_sim_OBUF_45),
    .D(\PCIM/Temp [6]),
    .Q(\PCIM/D1/Q [6])
  );
  FD #(
    .INIT ( 1'b1 ))
  \PCIM/D1/Q_7  (
    .C(Clk1_sim_OBUF_45),
    .D(\PCIM/Temp [7]),
    .Q(\PCIM/D1/Q [7])
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \Execution/ans_ex_mux0003141  (
    .I0(\DepCheckBlock/Op_ex [1]),
    .I1(\DepCheckBlock/Op_ex [0]),
    .O(\Execution/ans_ex_mux0001152 )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \Execution/ans_ex_mux0001421  (
    .I0(\DepCheckBlock/Op_ex [1]),
    .I1(\DepCheckBlock/Op_ex [2]),
    .O(\Execution/N52 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Execution/ans_ex_mux000091  (
    .I0(\DepCheckBlock/Op_ex [2]),
    .I1(\DepCheckBlock/Op_ex [1]),
    .O(\Execution/N51 )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \Execution/ans_ex_mux000081  (
    .I0(\DepCheckBlock/Op_ex [0]),
    .I1(\DepCheckBlock/Op_ex [1]),
    .O(\Execution/N48 )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \ClockBlock/AND11  (
    .I0(\ClockBlock/D1/q_61 ),
    .I1(\CG/Output_Clk1 ),
    .O(\ClockBlock/AND1 )
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  \Execution/ans_ex_mux0001411  (
    .I0(\DepCheckBlock/Op_ex [2]),
    .I1(\DepCheckBlock/Op_ex [1]),
    .I2(\DepCheckBlock/Op_ex [0]),
    .O(\Execution/N42 )
  );
  LUT3 #(
    .INIT ( 8'h40 ))
  \Execution/ans_ex_mux000071  (
    .I0(\DepCheckBlock/Op_ex [2]),
    .I1(\DepCheckBlock/Op_ex [4]),
    .I2(\DepCheckBlock/Op_ex [3]),
    .O(\Execution/ans_ex_mux0002350 )
  );
  LUT3 #(
    .INIT ( 8'h40 ))
  \Execution/ans_ex_mux0000121  (
    .I0(\DepCheckBlock/Op_ex [3]),
    .I1(\DepCheckBlock/Op_ex [4]),
    .I2(\DepCheckBlock/Op_ex [2]),
    .O(\Execution/N85 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \Execution/Data_out_cmp_eq00001  (
    .I0(\Execution/N85 ),
    .I1(\DepCheckBlock/Op_ex [1]),
    .I2(\DepCheckBlock/Op_ex [0]),
    .O(\Execution/Data_out_cmp_eq0000 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/inst_LPM_MUX911  (
    .I0(Ins[4]),
    .I1(\RF/N43 ),
    .I2(\RF/N45 ),
    .O(\RF/_varindex0001 [1])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/inst_LPM_MUX811  (
    .I0(Ins[4]),
    .I1(\RF/N39 ),
    .I2(\RF/N41 ),
    .O(\RF/_varindex0001 [0])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/inst_LPM_MUX711  (
    .I0(Ins[9]),
    .I1(\RF/N33 ),
    .I2(\RF/N35 ),
    .O(\RF/_varindex0000 [7])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/inst_LPM_MUX611  (
    .I0(Ins[9]),
    .I1(\RF/N29 ),
    .I2(\RF/N31 ),
    .O(\RF/_varindex0000 [6])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/inst_LPM_MUX511  (
    .I0(Ins[9]),
    .I1(\RF/N25 ),
    .I2(\RF/N27 ),
    .O(\RF/_varindex0000 [5])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/inst_LPM_MUX411  (
    .I0(Ins[9]),
    .I1(\RF/N21 ),
    .I2(\RF/N23 ),
    .O(\RF/_varindex0000 [4])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/inst_LPM_MUX311  (
    .I0(Ins[9]),
    .I1(\RF/N17 ),
    .I2(\RF/N19 ),
    .O(\RF/_varindex0000 [3])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/inst_LPM_MUX211  (
    .I0(Ins[9]),
    .I1(\RF/N13 ),
    .I2(\RF/N15 ),
    .O(\RF/_varindex0000 [2])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/inst_LPM_MUX161  (
    .I0(Ins[9]),
    .I1(\RF/N5 ),
    .I2(\RF/N7 ),
    .O(\RF/_varindex0000 [0])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/inst_LPM_MUX1511  (
    .I0(Ins[4]),
    .I1(\RF/N67 ),
    .I2(\RF/N69 ),
    .O(\RF/_varindex0001 [7])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/inst_LPM_MUX1411  (
    .I0(Ins[4]),
    .I1(\RF/N63 ),
    .I2(\RF/N65 ),
    .O(\RF/_varindex0001 [6])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/inst_LPM_MUX1311  (
    .I0(Ins[4]),
    .I1(\RF/N59 ),
    .I2(\RF/N61 ),
    .O(\RF/_varindex0001 [5])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/inst_LPM_MUX1211  (
    .I0(Ins[4]),
    .I1(\RF/N55 ),
    .I2(\RF/N57 ),
    .O(\RF/_varindex0001 [4])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/inst_LPM_MUX11111  (
    .I0(Ins[4]),
    .I1(\RF/N51 ),
    .I2(\RF/N53 ),
    .O(\RF/_varindex0001 [3])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/inst_LPM_MUX1111  (
    .I0(Ins[9]),
    .I1(\RF/N9 ),
    .I2(\RF/N11 ),
    .O(\RF/_varindex0000 [1])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \RF/inst_LPM_MUX1011  (
    .I0(Ins[4]),
    .I1(\RF/N47 ),
    .I2(\RF/N49 ),
    .O(\RF/_varindex0001 [2])
  );
  LUT4 #(
    .INIT ( 16'h0400 ))
  \DepCheckBlock/AND211  (
    .I0(Ins[18]),
    .I1(Ins[19]),
    .I2(Ins[16]),
    .I3(Ins[17]),
    .O(\DepCheckBlock/N0 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \ClockBlock/Clk51  (
    .I0(\ClockBlock/D9/q_69 ),
    .I1(\CG/Output_Clk1 ),
    .O(Clk5_sim_OBUF1)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \ClockBlock/Clk41  (
    .I0(\ClockBlock/D8/q_68 ),
    .I1(\CG/Output_Clk1 ),
    .O(Clk4_sim_OBUF_52)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \ClockBlock/Clk31  (
    .I0(\ClockBlock/D7/q_67 ),
    .I1(\CG/Output_Clk1 ),
    .O(Clk3_sim_OBUF1)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \ClockBlock/Clk21  (
    .I0(\ClockBlock/D6/q_66 ),
    .I1(\CG/Output_Clk1 ),
    .O(Clk2_sim_OBUF_47)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \ClockBlock/Clk11  (
    .I0(\ClockBlock/D5/q_65 ),
    .I1(\CG/Output_Clk1 ),
    .O(Clk1_sim_OBUF_45)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \CG/Mcount_Counter_xor<1>11  (
    .I0(\CG/Counter [1]),
    .I1(\CG/Counter [0]),
    .O(Result[1])
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  \CG/Mcount_Counter_xor<2>11  (
    .I0(\CG/Counter [2]),
    .I1(\CG/Counter [1]),
    .I2(\CG/Counter [0]),
    .O(Result[2])
  );
  LUT3 #(
    .INIT ( 8'hF1 ))
  \DepCheckBlock/old_NOR_4_or0000_SW0  (
    .I0(Ins[16]),
    .I1(Ins[15]),
    .I2(Ins[17]),
    .O(N12)
  );
  LUT4 #(
    .INIT ( 16'hFF80 ))
  \DepCheckBlock/old_NOR_4_or0000  (
    .I0(Ins[19]),
    .I1(Ins[18]),
    .I2(N12),
    .I3(\DepCheckBlock/Q_126 ),
    .O(\DepCheckBlock/old_NOR_4_or0000_178 )
  );
  LUT4 #(
    .INIT ( 16'hD5FF ))
  \ClockBlock/AND28  (
    .I0(Ins[19]),
    .I1(\ClockBlock/D4/q_64 ),
    .I2(Ins[18]),
    .I3(Ins[17]),
    .O(\ClockBlock/AND28_60 )
  );
  LUT4 #(
    .INIT ( 16'h3332 ))
  \ClockBlock/AND216  (
    .I0(Ins[16]),
    .I1(Ins[18]),
    .I2(Ins[15]),
    .I3(\ClockBlock/D2/q_62 ),
    .O(\ClockBlock/AND216_59 )
  );
  LUT3 #(
    .INIT ( 8'h54 ))
  \DepCheckBlock/mux_sel_a<1>1  (
    .I0(\DepCheckBlock/mux_sel_a_cmp_eq0000 ),
    .I1(\DepCheckBlock/mux_sel_a_cmp_eq0001 ),
    .I2(\DepCheckBlock/mux_sel_a_cmp_eq0002 ),
    .O(mux_sel_a_1_OBUF_688)
  );
  LUT3 #(
    .INIT ( 8'hF4 ))
  \DepCheckBlock/mux_sel_a<0>1  (
    .I0(\DepCheckBlock/mux_sel_a_cmp_eq0001 ),
    .I1(\DepCheckBlock/mux_sel_a_cmp_eq0002 ),
    .I2(\DepCheckBlock/mux_sel_a_cmp_eq0000 ),
    .O(mux_sel_a_0_OBUF_687)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \DepCheckBlock/mux_sel_a_cmp_eq0002562  (
    .I0(\DepCheckBlock/Register4 [1]),
    .I1(\DepCheckBlock/RegA [1]),
    .I2(\DepCheckBlock/Register4 [0]),
    .I3(\DepCheckBlock/RegA [0]),
    .O(\DepCheckBlock/mux_sel_a_cmp_eq0002562_171 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \DepCheckBlock/mux_sel_a_cmp_eq0001562  (
    .I0(\DepCheckBlock/Register3 [1]),
    .I1(\DepCheckBlock/RegA [1]),
    .I2(\DepCheckBlock/Register3 [0]),
    .I3(\DepCheckBlock/RegA [0]),
    .O(\DepCheckBlock/mux_sel_a_cmp_eq0001562_169 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \DepCheckBlock/mux_sel_a_cmp_eq0000562  (
    .I0(\DepCheckBlock/Register2 [1]),
    .I1(\DepCheckBlock/RegA [1]),
    .I2(\DepCheckBlock/Register2 [0]),
    .I3(\DepCheckBlock/RegA [0]),
    .O(\DepCheckBlock/mux_sel_a_cmp_eq0000562_167 )
  );
  LUT3 #(
    .INIT ( 8'h54 ))
  \DepCheckBlock/mux_sel_b<1>1  (
    .I0(\DepCheckBlock/mux_sel_b_cmp_eq0000 ),
    .I1(\DepCheckBlock/mux_sel_b_cmp_eq0001 ),
    .I2(\DepCheckBlock/mux_sel_b_cmp_eq0002 ),
    .O(mux_sel_b_1_OBUF_692)
  );
  LUT3 #(
    .INIT ( 8'hF4 ))
  \DepCheckBlock/mux_sel_b<0>1  (
    .I0(\DepCheckBlock/mux_sel_b_cmp_eq0001 ),
    .I1(\DepCheckBlock/mux_sel_b_cmp_eq0002 ),
    .I2(\DepCheckBlock/mux_sel_b_cmp_eq0000 ),
    .O(mux_sel_b_0_OBUF_691)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \DepCheckBlock/mux_sel_b_cmp_eq0000562  (
    .I0(\DepCheckBlock/Register2 [2]),
    .I1(\DepCheckBlock/RegB [2]),
    .I2(\DepCheckBlock/Register2 [3]),
    .I3(\DepCheckBlock/RegB [3]),
    .O(\DepCheckBlock/mux_sel_b_cmp_eq0000562_173 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \DepCheckBlock/mux_sel_b_cmp_eq0002562  (
    .I0(\DepCheckBlock/Register4 [2]),
    .I1(\DepCheckBlock/RegB [2]),
    .I2(\DepCheckBlock/Register4 [3]),
    .I3(\DepCheckBlock/RegB [3]),
    .O(\DepCheckBlock/mux_sel_b_cmp_eq0002562_177 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \DepCheckBlock/mux_sel_b_cmp_eq0001562  (
    .I0(\DepCheckBlock/Register3 [2]),
    .I1(\DepCheckBlock/RegB [2]),
    .I2(\DepCheckBlock/Register3 [3]),
    .I3(\DepCheckBlock/RegB [3]),
    .O(\DepCheckBlock/mux_sel_b_cmp_eq0001562_175 )
  );
  LUT3 #(
    .INIT ( 8'h7F ))
  \PCIM/Temp<3>31  (
    .I0(\PCIM/D1/Q [0]),
    .I1(\PCIM/D1/Q [1]),
    .I2(\PCIM/D1/Q [2]),
    .O(\PCIM/Temp<3>_bdd0 )
  );
  LUT3 #(
    .INIT ( 8'hB1 ))
  \PCIM/Temp<0>1  (
    .I0(pc_mux_sel),
    .I1(\PCIM/D1/Q [0]),
    .I2(Ins[0]),
    .O(\PCIM/Temp [0])
  );
  LUT4 #(
    .INIT ( 16'hEB41 ))
  \PCIM/Temp<3>21  (
    .I0(pc_mux_sel),
    .I1(\PCIM/D1/Q [3]),
    .I2(\PCIM/Temp<3>_bdd0 ),
    .I3(Ins[3]),
    .O(\PCIM/Temp [3])
  );
  LUT4 #(
    .INIT ( 16'hBE14 ))
  \PCIM/Temp<1>1  (
    .I0(pc_mux_sel),
    .I1(\PCIM/D1/Q [0]),
    .I2(\PCIM/D1/Q [1]),
    .I3(Ins[1]),
    .O(\PCIM/Temp [1])
  );
  LUT4 #(
    .INIT ( 16'hBE14 ))
  \PCIM/Temp<4>2  (
    .I0(pc_mux_sel),
    .I1(\PCIM/D1/Q [4]),
    .I2(N16),
    .I3(Ins[4]),
    .O(\PCIM/Temp [4])
  );
  LUT2 #(
    .INIT ( 4'h7 ))
  \PCIM/Temp<2>_SW0  (
    .I0(\PCIM/D1/Q [1]),
    .I1(\PCIM/D1/Q [0]),
    .O(N18)
  );
  LUT4 #(
    .INIT ( 16'hEB41 ))
  \PCIM/Temp<2>  (
    .I0(pc_mux_sel),
    .I1(\PCIM/D1/Q [2]),
    .I2(N18),
    .I3(Ins[2]),
    .O(\PCIM/Temp [2])
  );
  LUT3 #(
    .INIT ( 8'h40 ))
  \PCIM/Temp<5>1_SW0  (
    .I0(\PCIM/Temp<3>_bdd0 ),
    .I1(\PCIM/D1/Q [3]),
    .I2(\PCIM/D1/Q [4]),
    .O(N20)
  );
  LUT4 #(
    .INIT ( 16'hBE14 ))
  \PCIM/Temp<5>1  (
    .I0(pc_mux_sel),
    .I1(\PCIM/D1/Q [5]),
    .I2(N20),
    .I3(Ins[5]),
    .O(\PCIM/Temp [5])
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  \PCIM/Temp<6>1_SW0  (
    .I0(\PCIM/D1/Q [4]),
    .I1(\PCIM/D1/Q [5]),
    .I2(\PCIM/D1/Q [3]),
    .I3(\PCIM/Temp<3>_bdd0 ),
    .O(N22)
  );
  LUT4 #(
    .INIT ( 16'hBE14 ))
  \PCIM/Temp<6>1  (
    .I0(pc_mux_sel),
    .I1(\PCIM/D1/Q [6]),
    .I2(N22),
    .I3(Ins[6]),
    .O(\PCIM/Temp [6])
  );
  LUT4 #(
    .INIT ( 16'hC6FF ))
  \JumpBlock/jmp_loc<0>2_SW0  (
    .I0(Ins[17]),
    .I1(Ins[15]),
    .I2(\Execution/Flag [0]),
    .I3(Ins[18]),
    .O(N24)
  );
  LUT4 #(
    .INIT ( 16'hD7FF ))
  \JumpBlock/jmp_loc<0>2_SW1  (
    .I0(Ins[18]),
    .I1(\Execution/Flag [1]),
    .I2(Ins[15]),
    .I3(Ins[17]),
    .O(N25)
  );
  LUT4 #(
    .INIT ( 16'h082A ))
  \JumpBlock/jmp_loc<0>2  (
    .I0(Ins[19]),
    .I1(Ins[16]),
    .I2(N25),
    .I3(N24),
    .O(pc_mux_sel)
  );
  LUT4 #(
    .INIT ( 16'h6AAA ))
  \PCIM/Temp<7>139  (
    .I0(\PCIM/D1/Q [7]),
    .I1(\PCIM/D1/Q [0]),
    .I2(\PCIM/D1/Q [2]),
    .I3(\PCIM/D1/Q [1]),
    .O(\PCIM/Temp<7>139_559 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Execution/_old_ans_ex_15<3>1  (
    .I0(\Execution/N11 ),
    .I1(Data_in_3_IBUF_106),
    .I2(\Execution/ans_ex_mux0004 ),
    .O(\Execution/_old_ans_ex_15 [3])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Execution/_old_ans_ex_15<4>1  (
    .I0(\Execution/N11 ),
    .I1(Data_in_4_IBUF_107),
    .I2(\Execution/ans_ex_mux0003 ),
    .O(\Execution/_old_ans_ex_15 [4])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Execution/_old_ans_ex_15<5>1  (
    .I0(\Execution/N11 ),
    .I1(Data_in_5_IBUF_108),
    .I2(N234),
    .O(\Execution/_old_ans_ex_15 [5])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Execution/Flag_0_mux00000  (
    .I0(\Execution/Flag [0]),
    .I1(\Execution/N01 ),
    .O(\Execution/Flag_0_mux00000_211 )
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  \Execution/Flag_0_mux000054  (
    .I0(\DepCheckBlock/Op_ex [2]),
    .I1(\DepCheckBlock/Op_ex [4]),
    .I2(\DepCheckBlock/Op_ex [1]),
    .O(\Execution/Flag_0_mux000054_212 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Execution/_old_ans_ex_15<1>1  (
    .I0(\Execution/N11 ),
    .I1(Data_in_1_IBUF_104),
    .I2(\Execution/ans_ex_mux0006 ),
    .O(\Execution/_old_ans_ex_15 [1])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Execution/_old_ans_ex_15<0>2  (
    .I0(\Execution/N11 ),
    .I1(Data_in_0_IBUF_103),
    .I2(\Execution/ans_ex_mux0007 ),
    .O(\Execution/_old_ans_ex_15 [0])
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \DM/mux_ans_dm<7>1  (
    .I0(\DM/ans_dm [7]),
    .I1(\DM/ans_reg [7]),
    .I2(\Execution/Mem_mux_sel_ex_246 ),
    .O(mux_ans_dm[7])
  );
  LUT4 #(
    .INIT ( 16'h04AE ))
  \Execution/ans_ex_mux0002317  (
    .I0(\DepCheckBlock/Op_ex [4]),
    .I1(\DepCheckBlock/Op_ex [0]),
    .I2(\DepCheckBlock/Op_ex [1]),
    .I3(\DepCheckBlock/Op_ex [3]),
    .O(\Execution/ans_ex_mux0002317_317 )
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  \Execution/ans_ex_mux0002338  (
    .I0(\DepCheckBlock/Op_ex [0]),
    .I1(\DepCheckBlock/Op_ex [1]),
    .O(\Execution/ans_ex_mux000013 )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \Execution/ans_ex_mux0004111  (
    .I0(A_1_OBUF_9),
    .I1(A_0_OBUF_8),
    .I2(B_0_OBUF_24),
    .O(\Execution/N14 )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \Execution/ans_ex_mux0002111  (
    .I0(A_3_OBUF_11),
    .I1(A_2_OBUF_10),
    .I2(B_0_OBUF_24),
    .O(\Execution/N28 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \Execution/ans_ex_mux00044  (
    .I0(\Execution/N01 ),
    .I1(\Execution/Register [3]),
    .I2(A_3_OBUF_11),
    .I3(\Execution/N25 ),
    .O(\Execution/ans_ex_mux00044_344 )
  );
  LUT4 #(
    .INIT ( 16'hFF08 ))
  \Execution/ans_ex_mux000414  (
    .I0(\Execution/N50 ),
    .I1(\Execution/N49 ),
    .I2(B_0_OBUF_24),
    .I3(N240),
    .O(\Execution/ans_ex_mux000414_341 )
  );
  LUT4 #(
    .INIT ( 16'h88A0 ))
  \Execution/ans_ex_mux000428  (
    .I0(\DepCheckBlock/Op_ex [1]),
    .I1(A_6_OBUF_14),
    .I2(A_5_OBUF_13),
    .I3(B_0_OBUF_24),
    .O(\Execution/ans_ex_mux000428_342 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \Execution/ans_ex_mux000468  (
    .I0(\Execution/ans_ex_mux000414_341 ),
    .I1(\Execution/N39 ),
    .I2(\Execution/ans_ex_mux000461_345 ),
    .I3(\Execution/ans_ex_mux000438_343 ),
    .O(\Execution/ans_ex_mux000468_346 )
  );
  LUT4 #(
    .INIT ( 16'hCE00 ))
  \Execution/ans_ex_mux0004109  (
    .I0(\Execution/N48 ),
    .I1(\Execution/N40 ),
    .I2(A_3_OBUF_11),
    .I3(B_3_OBUF_27),
    .O(\Execution/ans_ex_mux0004109_337 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \Execution/ans_ex_mux0004110  (
    .I0(\DepCheckBlock/Op_ex [0]),
    .I1(A_3_OBUF_11),
    .O(\Execution/ans_ex_mux0004110_338 )
  );
  LUT4 #(
    .INIT ( 16'hFEFC ))
  \Execution/ans_ex_mux0004139  (
    .I0(\Execution/N42 ),
    .I1(\Execution/ans_ex_mux0004109_337 ),
    .I2(\Execution/ans_ex_mux0004123_339 ),
    .I3(\Execution/AUX_8_addsub0000 [3]),
    .O(\Execution/ans_ex_mux0004139_340 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \Execution/ans_ex_mux00034  (
    .I0(\Execution/N01 ),
    .I1(\Execution/Register [4]),
    .I2(A_4_OBUF_12),
    .I3(\Execution/N25 ),
    .O(\Execution/ans_ex_mux00034_332 )
  );
  LUT4 #(
    .INIT ( 16'hFFF8 ))
  \Execution/ans_ex_mux000374  (
    .I0(\Execution/ans_ex_mux000323_331 ),
    .I1(\Execution/N39 ),
    .I2(\Execution/ans_ex_mux000364_334 ),
    .I3(\Execution/ans_ex_mux000317_330 ),
    .O(\Execution/ans_ex_mux000374_335 )
  );
  LUT4 #(
    .INIT ( 16'hCE00 ))
  \Execution/ans_ex_mux0003115  (
    .I0(\Execution/N48 ),
    .I1(\Execution/N40 ),
    .I2(A_4_OBUF_12),
    .I3(B_4_OBUF_28),
    .O(\Execution/ans_ex_mux0003115_326 )
  );
  LUT4 #(
    .INIT ( 16'hCA00 ))
  \Execution/ans_ex_mux0003129  (
    .I0(\Execution/N51 ),
    .I1(\Execution/N52 ),
    .I2(B_4_OBUF_28),
    .I3(\Execution/ans_ex_mux0003116_327 ),
    .O(\Execution/ans_ex_mux0003129_328 )
  );
  LUT4 #(
    .INIT ( 16'hFEFC ))
  \Execution/ans_ex_mux0003145  (
    .I0(\Execution/N42 ),
    .I1(\Execution/ans_ex_mux0003115_326 ),
    .I2(\Execution/ans_ex_mux0003129_328 ),
    .I3(\Execution/AUX_8_addsub0000 [4]),
    .O(\Execution/ans_ex_mux0003145_329 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \Execution/ans_ex_mux00024  (
    .I0(\Execution/N01 ),
    .I1(\Execution/Register [5]),
    .I2(A_5_OBUF_13),
    .I3(\Execution/N25 ),
    .O(\Execution/ans_ex_mux00024_321 )
  );
  LUT4 #(
    .INIT ( 16'hCC80 ))
  \Execution/ans_ex_mux000210  (
    .I0(\DepCheckBlock/Op_ex [0]),
    .I1(\Execution/N49 ),
    .I2(\Execution/N45 ),
    .I3(\Execution/N43 ),
    .O(\Execution/ans_ex_mux000210_313 )
  );
  LUT4 #(
    .INIT ( 16'hAAA8 ))
  \Execution/ans_ex_mux000255  (
    .I0(\Execution/ans_ex_mux0002350 ),
    .I1(\Execution/ans_ex_mux000210_313 ),
    .I2(\Execution/ans_ex_mux000213_315 ),
    .I3(\Execution/ans_ex_mux0002361_320 ),
    .O(\Execution/ans_ex_mux000255_322 )
  );
  LUT4 #(
    .INIT ( 16'h3320 ))
  \Execution/ans_ex_mux000172  (
    .I0(\Execution/ans_ex_mux0002127 ),
    .I1(\DepCheckBlock/Op_ex [4]),
    .I2(\Execution/AUX_11_addsub0000 [6]),
    .I3(\Execution/ans_ex_mux000144_309 ),
    .O(\Execution/ans_ex_mux000172_310 )
  );
  LUT4 #(
    .INIT ( 16'hCC80 ))
  \Execution/ans_ex_mux000199  (
    .I0(\DepCheckBlock/Op_ex [0]),
    .I1(\Execution/N49 ),
    .I2(\Execution/N45 ),
    .I3(\Execution/N39 ),
    .O(\Execution/ans_ex_mux000199_311 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \Execution/ans_ex_mux00064  (
    .I0(\Execution/N01 ),
    .I1(\Execution/Register [1]),
    .I2(A_1_OBUF_9),
    .I3(N238),
    .O(\Execution/ans_ex_mux00064_366 )
  );
  LUT4 #(
    .INIT ( 16'hCE00 ))
  \Execution/ans_ex_mux000614  (
    .I0(\Execution/N48 ),
    .I1(\Execution/N40 ),
    .I2(A_1_OBUF_9),
    .I3(B_1_OBUF_25),
    .O(\Execution/ans_ex_mux000614_361 )
  );
  LUT4 #(
    .INIT ( 16'hC0A0 ))
  \Execution/ans_ex_mux000628  (
    .I0(\Execution/N51 ),
    .I1(\Execution/N52 ),
    .I2(\Execution/ans_ex_mux000615_363 ),
    .I3(B_1_OBUF_25),
    .O(\Execution/ans_ex_mux000628_365 )
  );
  LUT4 #(
    .INIT ( 16'h3320 ))
  \Execution/ans_ex_mux000672  (
    .I0(\Execution/ans_ex_mux0002127 ),
    .I1(\DepCheckBlock/Op_ex [4]),
    .I2(\Execution/AUX_11_addsub0000 [1]),
    .I3(\Execution/ans_ex_mux000644_367 ),
    .O(\Execution/ans_ex_mux000672_368 )
  );
  LUT4 #(
    .INIT ( 16'hA0C0 ))
  \Execution/ans_ex_mux0006106  (
    .I0(A_6_OBUF_14),
    .I1(A_5_OBUF_13),
    .I2(N239),
    .I3(B_0_OBUF_24),
    .O(\Execution/ans_ex_mux0006106_358 )
  );
  LUT4 #(
    .INIT ( 16'hFFF8 ))
  \Execution/ans_ex_mux0006130  (
    .I0(A_2_OBUF_10),
    .I1(\Execution/N39 ),
    .I2(\Execution/ans_ex_mux0006116_359 ),
    .I3(\Execution/ans_ex_mux0006106_358 ),
    .O(\Execution/ans_ex_mux0006130_360 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \Execution/ans_ex_mux00054  (
    .I0(\Execution/N01 ),
    .I1(\Execution/Register [2]),
    .I2(A_2_OBUF_10),
    .I3(\Execution/N25 ),
    .O(\Execution/ans_ex_mux00054_352 )
  );
  LUT4 #(
    .INIT ( 16'hCE00 ))
  \Execution/ans_ex_mux000514  (
    .I0(\Execution/N48 ),
    .I1(\Execution/N40 ),
    .I2(A_2_OBUF_10),
    .I3(B_2_OBUF_26),
    .O(\Execution/ans_ex_mux000514_348 )
  );
  LUT4 #(
    .INIT ( 16'hC0A0 ))
  \Execution/ans_ex_mux000528  (
    .I0(\Execution/N51 ),
    .I1(\Execution/N52 ),
    .I2(\Execution/ans_ex_mux000515_350 ),
    .I3(B_2_OBUF_26),
    .O(\Execution/ans_ex_mux000528_351 )
  );
  LUT4 #(
    .INIT ( 16'h3320 ))
  \Execution/ans_ex_mux000572  (
    .I0(\Execution/ans_ex_mux0002127 ),
    .I1(\DepCheckBlock/Op_ex [4]),
    .I2(\Execution/AUX_11_addsub0000 [2]),
    .I3(\Execution/ans_ex_mux000544_353 ),
    .O(\Execution/ans_ex_mux000572_354 )
  );
  LUT4 #(
    .INIT ( 16'hAA80 ))
  \Execution/ans_ex_mux0005143  (
    .I0(\DepCheckBlock/Op_ex [1]),
    .I1(A_3_OBUF_11),
    .I2(\Execution/N39 ),
    .I3(\Execution/ans_ex_mux0005125_347 ),
    .O(\Execution/ans_ex_mux0005143_349 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \Execution/ans_ex_mux000759  (
    .I0(\Execution/Register [0]),
    .I1(\DepCheckBlock/Op_ex [0]),
    .I2(\DepCheckBlock/Op_ex [1]),
    .O(\Execution/ans_ex_mux000759_378 )
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  \Execution/ans_ex_mux000766  (
    .I0(\DepCheckBlock/Op_ex [1]),
    .I1(\DepCheckBlock/Op_ex [0]),
    .I2(\Execution/AUX_8_addsub0000 [0]),
    .O(\Execution/ans_ex_mux000766_379 )
  );
  LUT3 #(
    .INIT ( 8'h82 ))
  \Execution/ans_ex_mux0007146  (
    .I0(\Execution/Register [0]),
    .I1(\DepCheckBlock/Op_ex [2]),
    .I2(\DepCheckBlock/Op_ex [3]),
    .O(\Execution/ans_ex_mux0007146_372 )
  );
  LUT4 #(
    .INIT ( 16'hA0C0 ))
  \Execution/ans_ex_mux0007159  (
    .I0(A_3_OBUF_11),
    .I1(A_2_OBUF_10),
    .I2(N236),
    .I3(B_0_OBUF_24),
    .O(\Execution/ans_ex_mux0007159_373 )
  );
  LUT3 #(
    .INIT ( 8'h40 ))
  \Execution/ans_ex_mux0007223  (
    .I0(\DepCheckBlock/Op_ex [2]),
    .I1(\DepCheckBlock/Op_ex [3]),
    .I2(\DepCheckBlock/Op_ex [1]),
    .O(\Execution/ans_ex_mux0007223_376 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<6>1  (
    .I0(\Execution/Mem_mux_sel_ex_246 ),
    .I1(\DM/ans_reg [6]),
    .I2(\DM/ans_dm [6]),
    .O(mux_ans_dm[6])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<5>1  (
    .I0(\Execution/Mem_mux_sel_ex_246 ),
    .I1(\DM/ans_reg [5]),
    .I2(\DM/ans_dm [5]),
    .O(mux_ans_dm[5])
  );
  LUT3 #(
    .INIT ( 8'hB8 ))
  \RF/B<4>1  (
    .I0(\DepCheckBlock/imm [4]),
    .I1(\DepCheckBlock/imm_sel_164 ),
    .I2(\RF/Temp_B [4]),
    .O(B_4_OBUF_28)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<4>1  (
    .I0(\Execution/Mem_mux_sel_ex_246 ),
    .I1(\DM/ans_reg [4]),
    .I2(\DM/ans_dm [4]),
    .O(mux_ans_dm[4])
  );
  LUT3 #(
    .INIT ( 8'hB8 ))
  \RF/B<3>1  (
    .I0(\DepCheckBlock/imm [3]),
    .I1(\DepCheckBlock/imm_sel_164 ),
    .I2(\RF/Temp_B [3]),
    .O(B_3_OBUF_27)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<3>1  (
    .I0(\Execution/Mem_mux_sel_ex_246 ),
    .I1(\DM/ans_reg [3]),
    .I2(\DM/ans_dm [3]),
    .O(mux_ans_dm[3])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Execution/_old_ans_ex_15<7>1  (
    .I0(\Execution/N11 ),
    .I1(Data_in_7_IBUF_110),
    .I2(N237),
    .O(\Execution/_old_ans_ex_15 [7])
  );
  LUT3 #(
    .INIT ( 8'hB8 ))
  \RF/B<2>1  (
    .I0(\DepCheckBlock/imm [2]),
    .I1(\DepCheckBlock/imm_sel_164 ),
    .I2(\RF/Temp_B [2]),
    .O(B_2_OBUF_26)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<2>1  (
    .I0(\Execution/Mem_mux_sel_ex_246 ),
    .I1(\DM/ans_reg [2]),
    .I2(\DM/ans_dm [2]),
    .O(mux_ans_dm[2])
  );
  LUT3 #(
    .INIT ( 8'hB8 ))
  \RF/B<1>1  (
    .I0(\DepCheckBlock/imm [1]),
    .I1(\DepCheckBlock/imm_sel_164 ),
    .I2(\RF/Temp_B [1]),
    .O(B_1_OBUF_25)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<1>1  (
    .I0(\Execution/Mem_mux_sel_ex_246 ),
    .I1(\DM/ans_reg [1]),
    .I2(\DM/ans_dm [1]),
    .O(mux_ans_dm[1])
  );
  LUT3 #(
    .INIT ( 8'hB8 ))
  \RF/B<0>1  (
    .I0(\DepCheckBlock/imm [0]),
    .I1(\DepCheckBlock/imm_sel_164 ),
    .I2(\RF/Temp_B [0]),
    .O(B_0_OBUF_24)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<0>1  (
    .I0(\Execution/Mem_mux_sel_ex_246 ),
    .I1(\DM/ans_reg [0]),
    .I2(\DM/ans_dm [0]),
    .O(mux_ans_dm[0])
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \Execution/ans_ex_mux00004  (
    .I0(A_7_OBUF_15),
    .I1(\Execution/N85 ),
    .I2(\Execution/Register [7]),
    .I3(\Execution/N01 ),
    .O(\Execution/ans_ex_mux00004_298 )
  );
  LUT4 #(
    .INIT ( 16'hEEEC ))
  \Execution/ans_ex_mux000092  (
    .I0(\Execution/ans_ex_mux0002350 ),
    .I1(\Execution/ans_ex_mux00004_298 ),
    .I2(\Execution/ans_ex_mux000025_295 ),
    .I3(\Execution/ans_ex_mux000060_300 ),
    .O(\Execution/ans_ex_mux000092_301 )
  );
  IBUF   Data_in_7_IBUF (
    .I(Data_in[7]),
    .O(Data_in_7_IBUF_110)
  );
  IBUF   Data_in_6_IBUF (
    .I(Data_in[6]),
    .O(Data_in_6_IBUF_109)
  );
  IBUF   Data_in_5_IBUF (
    .I(Data_in[5]),
    .O(Data_in_5_IBUF_108)
  );
  IBUF   Data_in_4_IBUF (
    .I(Data_in[4]),
    .O(Data_in_4_IBUF_107)
  );
  IBUF   Data_in_3_IBUF (
    .I(Data_in[3]),
    .O(Data_in_3_IBUF_106)
  );
  IBUF   Data_in_2_IBUF (
    .I(Data_in[2]),
    .O(Data_in_2_IBUF_105)
  );
  IBUF   Data_in_1_IBUF (
    .I(Data_in[1]),
    .O(Data_in_1_IBUF_104)
  );
  IBUF   Data_in_0_IBUF (
    .I(Data_in[0]),
    .O(Data_in_0_IBUF_103)
  );
  OBUF   Clk3_sim_OBUF (
    .I(Clk3_sim_OBUF1),
    .O(Clk3_sim)
  );
  OBUF   Clk_sim_OBUF (
    .I(\CG/Output_Clk1 ),
    .O(Clk_sim)
  );
  OBUF   Clk4_sim_OBUF (
    .I(Clk4_sim_OBUF_52),
    .O(Clk4_sim)
  );
  OBUF   Clk5_sim_OBUF (
    .I(Clk5_sim_OBUF1),
    .O(Clk5_sim)
  );
  OBUF   Clk1_sim_OBUF (
    .I(Clk1_sim_OBUF_45),
    .O(Clk1_sim)
  );
  OBUF   Clk2_sim_OBUF (
    .I(Clk2_sim_OBUF_47),
    .O(Clk2_sim)
  );
  OBUF   Data_out_7_OBUF (
    .I(\Execution/Data_out [7]),
    .O(Data_out[7])
  );
  OBUF   Data_out_6_OBUF (
    .I(\Execution/Data_out [6]),
    .O(Data_out[6])
  );
  OBUF   Data_out_5_OBUF (
    .I(\Execution/Data_out [5]),
    .O(Data_out[5])
  );
  OBUF   Data_out_4_OBUF (
    .I(\Execution/Data_out [4]),
    .O(Data_out[4])
  );
  OBUF   Data_out_3_OBUF (
    .I(\Execution/Data_out [3]),
    .O(Data_out[3])
  );
  OBUF   Data_out_2_OBUF (
    .I(\Execution/Data_out [2]),
    .O(Data_out[2])
  );
  OBUF   Data_out_1_OBUF (
    .I(\Execution/Data_out [1]),
    .O(Data_out[1])
  );
  OBUF   Data_out_0_OBUF (
    .I(\Execution/Data_out [0]),
    .O(Data_out[0])
  );
  OBUF   mux_sel_a_1_OBUF (
    .I(mux_sel_a_1_OBUF_688),
    .O(mux_sel_a[1])
  );
  OBUF   mux_sel_a_0_OBUF (
    .I(mux_sel_a_0_OBUF_687),
    .O(mux_sel_a[0])
  );
  OBUF   mux_sel_b_1_OBUF (
    .I(mux_sel_b_1_OBUF_692),
    .O(mux_sel_b[1])
  );
  OBUF   mux_sel_b_0_OBUF (
    .I(mux_sel_b_0_OBUF_691),
    .O(mux_sel_b[0])
  );
  OBUF   A_7_OBUF (
    .I(A_7_OBUF_15),
    .O(A[7])
  );
  OBUF   A_6_OBUF (
    .I(A_6_OBUF_14),
    .O(A[6])
  );
  OBUF   A_5_OBUF (
    .I(A_5_OBUF_13),
    .O(A[5])
  );
  OBUF   A_4_OBUF (
    .I(A_4_OBUF_12),
    .O(A[4])
  );
  OBUF   A_3_OBUF (
    .I(A_3_OBUF_11),
    .O(A[3])
  );
  OBUF   A_2_OBUF (
    .I(A_2_OBUF_10),
    .O(A[2])
  );
  OBUF   A_1_OBUF (
    .I(A_1_OBUF_9),
    .O(A[1])
  );
  OBUF   A_0_OBUF (
    .I(A_0_OBUF_8),
    .O(A[0])
  );
  OBUF   B_7_OBUF (
    .I(B_7_OBUF_31),
    .O(B[7])
  );
  OBUF   B_6_OBUF (
    .I(B_6_OBUF_30),
    .O(B[6])
  );
  OBUF   B_5_OBUF (
    .I(B_5_OBUF_29),
    .O(B[5])
  );
  OBUF   B_4_OBUF (
    .I(B_4_OBUF_28),
    .O(B[4])
  );
  OBUF   B_3_OBUF (
    .I(B_3_OBUF_27),
    .O(B[3])
  );
  OBUF   B_2_OBUF (
    .I(B_2_OBUF_26),
    .O(B[2])
  );
  OBUF   B_1_OBUF (
    .I(B_1_OBUF_25),
    .O(B[1])
  );
  OBUF   B_0_OBUF (
    .I(B_0_OBUF_24),
    .O(B[0])
  );
  OBUF   ans_ex_7_OBUF (
    .I(\Execution/Register [7]),
    .O(ans_ex[7])
  );
  OBUF   ans_ex_6_OBUF (
    .I(\Execution/Register [6]),
    .O(ans_ex[6])
  );
  OBUF   ans_ex_5_OBUF (
    .I(\Execution/Register [5]),
    .O(ans_ex[5])
  );
  OBUF   ans_ex_4_OBUF (
    .I(\Execution/Register [4]),
    .O(ans_ex[4])
  );
  OBUF   ans_ex_3_OBUF (
    .I(\Execution/Register [3]),
    .O(ans_ex[3])
  );
  OBUF   ans_ex_2_OBUF (
    .I(\Execution/Register [2]),
    .O(ans_ex[2])
  );
  OBUF   ans_ex_1_OBUF (
    .I(\Execution/Register [1]),
    .O(ans_ex[1])
  );
  OBUF   ans_ex_0_OBUF (
    .I(\Execution/Register [0]),
    .O(ans_ex[0])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \DepCheckBlock/Register1_4  (
    .C(\CG/Output_Clk_39 ),
    .D(Ins[14]),
    .R(\DepCheckBlock/old_NOR_4_or0000_178 ),
    .Q(\DepCheckBlock/Register1 [4])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \DepCheckBlock/Register1_3  (
    .C(\CG/Output_Clk_39 ),
    .D(Ins[13]),
    .R(\DepCheckBlock/old_NOR_4_or0000_178 ),
    .Q(\DepCheckBlock/Register1 [3])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \DepCheckBlock/Register1_2  (
    .C(\CG/Output_Clk_39 ),
    .D(Ins[12]),
    .R(\DepCheckBlock/old_NOR_4_or0000_178 ),
    .Q(\DepCheckBlock/Register1 [2])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \DepCheckBlock/Register1_1  (
    .C(\CG/Output_Clk_39 ),
    .D(Ins[11]),
    .R(\DepCheckBlock/old_NOR_4_or0000_178 ),
    .Q(\DepCheckBlock/Register1 [1])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \DepCheckBlock/Register1_0  (
    .C(\CG/Output_Clk_39 ),
    .D(Ins[10]),
    .R(\DepCheckBlock/old_NOR_4_or0000_178 ),
    .Q(\DepCheckBlock/Register1 [0])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \DepCheckBlock/Q1  (
    .C(\CG/Output_Clk_39 ),
    .D(Ins[15]),
    .R(\DepCheckBlock/Q1_127 ),
    .Q(\DepCheckBlock/Q1_127 )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \DepCheckBlock/Q  (
    .C(\CG/Output_Clk_39 ),
    .D(\DepCheckBlock/AND21 ),
    .R(\DepCheckBlock/Q_126 ),
    .Q(\DepCheckBlock/Q_126 )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \DepCheckBlock/Load11  (
    .I0(Ins[15]),
    .I1(\DepCheckBlock/N0 ),
    .O(\DepCheckBlock/AND21 )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \DepCheckBlock/Q2  (
    .C(\CG/Output_Clk_39 ),
    .D(\DepCheckBlock/AND21 ),
    .R(\DepCheckBlock/Q2_128 ),
    .Q(\DepCheckBlock/Q2_128 )
  );
  FDR   \Execution/Mem_mux_sel_ex  (
    .C(Clk3_sim_OBUF_49),
    .D(\DepCheckBlock/Q2_128 ),
    .R(\DepCheckBlock/Q1_127 ),
    .Q(\Execution/Mem_mux_sel_ex_246 )
  );
  FDS   \Execution/Mem_rw_ex  (
    .C(Clk3_sim_OBUF_49),
    .D(\DepCheckBlock/mem_en_dec1 ),
    .S(\DepCheckBlock/Q1_127 ),
    .Q(\Execution/Mem_rw_ex_247 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \DepCheckBlock/mem_rw_dec11  (
    .I0(Ins[15]),
    .I1(\DepCheckBlock/N0 ),
    .O(\DepCheckBlock/mem_en_dec1 )
  );
  FDS   \Execution/Mem_en_ex  (
    .C(Clk3_sim_OBUF_49),
    .D(\DepCheckBlock/mem_en_dec1 ),
    .S(\DepCheckBlock/Q2_128 ),
    .Q(\Execution/Mem_en_ex_245 )
  );
  FDS   \Execution/Flag_0  (
    .C(Clk3_sim_OBUF_49),
    .D(\Execution/Flag_0_mux000073 ),
    .S(\Execution/Flag_0_mux00000_211 ),
    .Q(\Execution/Flag [0])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ClockBlock/D1/q  (
    .C(\ClockBlock/AND1 ),
    .D(\ClockBlock/Hlt1 ),
    .R(Ins[17]),
    .Q(\ClockBlock/D1/q_61 )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ClockBlock/D2/q  (
    .C(\CG/Output_Clk_39 ),
    .D(\ClockBlock/Ld1 ),
    .R(Ins[15]),
    .Q(\ClockBlock/D2/q_62 )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ClockBlock/D3/q  (
    .C(\CG/Output_Clk_39 ),
    .D(\ClockBlock/Jump1 ),
    .R(\ClockBlock/D4/q_64 ),
    .Q(\ClockBlock/D3/q_63 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \ClockBlock/Jump11  (
    .I0(Ins[17]),
    .I1(Ins[19]),
    .I2(Ins[18]),
    .O(\ClockBlock/Jump1 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Execution/Madd_AUX_11_addsub0000_lut<5>  (
    .I0(A_5_OBUF_13),
    .I1(B_5_OBUF_29),
    .O(\Execution/Madd_AUX_11_addsub0000_lut [5])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Execution/Madd_AUX_11_addsub0000_lut<6>  (
    .I0(A_6_OBUF_14),
    .I1(B_6_OBUF_30),
    .O(\Execution/Madd_AUX_11_addsub0000_lut [6])
  );
  LUT4 #(
    .INIT ( 16'hF869 ))
  \Execution/ans_ex_mux0000193  (
    .I0(\Execution/Madd_AUX_11_index0000 ),
    .I1(B_7_OBUF_31),
    .I2(A_7_OBUF_15),
    .I3(\DepCheckBlock/Op_ex [2]),
    .O(\Execution/ans_ex_mux0000193_294 )
  );
  LUT4 #(
    .INIT ( 16'h47B8 ))
  \Execution/Madd_AUX_8_addsub0000_lut<0>  (
    .I0(\DepCheckBlock/imm [0]),
    .I1(\DepCheckBlock/imm_sel_164 ),
    .I2(\RF/Temp_B [0]),
    .I3(A_0_OBUF_8),
    .O(\Execution/Madd_AUX_8_addsub0000_lut [0])
  );
  LUT4 #(
    .INIT ( 16'h47B8 ))
  \Execution/Madd_AUX_8_addsub0000_lut<1>  (
    .I0(\DepCheckBlock/imm [1]),
    .I1(\DepCheckBlock/imm_sel_164 ),
    .I2(\RF/Temp_B [1]),
    .I3(A_1_OBUF_9),
    .O(\Execution/Madd_AUX_8_addsub0000_lut [1])
  );
  LUT4 #(
    .INIT ( 16'h47B8 ))
  \Execution/Madd_AUX_8_addsub0000_lut<2>  (
    .I0(\DepCheckBlock/imm [2]),
    .I1(\DepCheckBlock/imm_sel_164 ),
    .I2(\RF/Temp_B [2]),
    .I3(A_2_OBUF_10),
    .O(\Execution/Madd_AUX_8_addsub0000_lut [2])
  );
  LUT4 #(
    .INIT ( 16'h47B8 ))
  \Execution/Madd_AUX_8_addsub0000_lut<3>  (
    .I0(\DepCheckBlock/imm [3]),
    .I1(\DepCheckBlock/imm_sel_164 ),
    .I2(\RF/Temp_B [3]),
    .I3(A_3_OBUF_11),
    .O(\Execution/Madd_AUX_8_addsub0000_lut [3])
  );
  LUT4 #(
    .INIT ( 16'h47B8 ))
  \Execution/Madd_AUX_8_addsub0000_lut<4>  (
    .I0(\DepCheckBlock/imm [4]),
    .I1(\DepCheckBlock/imm_sel_164 ),
    .I2(\RF/Temp_B [4]),
    .I3(A_4_OBUF_12),
    .O(\Execution/Madd_AUX_8_addsub0000_lut [4])
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \Execution/ans_ex_mux00031101_SW0  (
    .I0(\DepCheckBlock/imm [2]),
    .I1(\DepCheckBlock/imm [1]),
    .O(N29)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<0>1_SW0  (
    .I0(mux_sel_b_0_OBUF_691),
    .I1(\DM/ans_reg [0]),
    .I2(\WB/ans_wb [0]),
    .O(N31)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<0>1_SW1  (
    .I0(mux_sel_b_0_OBUF_691),
    .I1(\DM/ans_dm [0]),
    .I2(\WB/ans_wb [0]),
    .O(N32)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \RF/Mmux_Temp_B_3  (
    .I0(N32),
    .I1(N31),
    .I2(\Execution/Mem_mux_sel_ex_246 ),
    .O(\RF/Mmux_Temp_B_3_576 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<1>1_SW0  (
    .I0(mux_sel_b_0_OBUF_691),
    .I1(\DM/ans_reg [1]),
    .I2(\WB/ans_wb [1]),
    .O(N34)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<1>1_SW1  (
    .I0(mux_sel_b_0_OBUF_691),
    .I1(\DM/ans_dm [1]),
    .I2(\WB/ans_wb [1]),
    .O(N35)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \RF/Mmux_Temp_B_31  (
    .I0(N35),
    .I1(N34),
    .I2(\Execution/Mem_mux_sel_ex_246 ),
    .O(\RF/Mmux_Temp_B_31_577 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<2>1_SW0  (
    .I0(mux_sel_b_0_OBUF_691),
    .I1(\DM/ans_reg [2]),
    .I2(\WB/ans_wb [2]),
    .O(N37)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<2>1_SW1  (
    .I0(mux_sel_b_0_OBUF_691),
    .I1(\DM/ans_dm [2]),
    .I2(\WB/ans_wb [2]),
    .O(N38)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \RF/Mmux_Temp_B_32  (
    .I0(N38),
    .I1(N37),
    .I2(\Execution/Mem_mux_sel_ex_246 ),
    .O(\RF/Mmux_Temp_B_32_578 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<3>1_SW0  (
    .I0(mux_sel_b_0_OBUF_691),
    .I1(\DM/ans_reg [3]),
    .I2(\WB/ans_wb [3]),
    .O(N40)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<3>1_SW1  (
    .I0(mux_sel_b_0_OBUF_691),
    .I1(\DM/ans_dm [3]),
    .I2(\WB/ans_wb [3]),
    .O(N41)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \RF/Mmux_Temp_B_33  (
    .I0(N41),
    .I1(N40),
    .I2(\Execution/Mem_mux_sel_ex_246 ),
    .O(\RF/Mmux_Temp_B_33_579 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<4>1_SW0  (
    .I0(mux_sel_b_0_OBUF_691),
    .I1(\DM/ans_reg [4]),
    .I2(\WB/ans_wb [4]),
    .O(N43)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<4>1_SW1  (
    .I0(mux_sel_b_0_OBUF_691),
    .I1(\DM/ans_dm [4]),
    .I2(\WB/ans_wb [4]),
    .O(N44)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \RF/Mmux_Temp_B_34  (
    .I0(N44),
    .I1(N43),
    .I2(\Execution/Mem_mux_sel_ex_246 ),
    .O(\RF/Mmux_Temp_B_34_580 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<5>1_SW0  (
    .I0(mux_sel_b_0_OBUF_691),
    .I1(\DM/ans_reg [5]),
    .I2(\WB/ans_wb [5]),
    .O(N46)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<5>1_SW1  (
    .I0(mux_sel_b_0_OBUF_691),
    .I1(\DM/ans_dm [5]),
    .I2(\WB/ans_wb [5]),
    .O(N47)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<6>1_SW0  (
    .I0(mux_sel_b_0_OBUF_691),
    .I1(\DM/ans_reg [6]),
    .I2(\WB/ans_wb [6]),
    .O(N49)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<6>1_SW1  (
    .I0(mux_sel_b_0_OBUF_691),
    .I1(\DM/ans_dm [6]),
    .I2(\WB/ans_wb [6]),
    .O(N50)
  );
  LUT4 #(
    .INIT ( 16'hAEAF ))
  \Execution/ans_ex_mux0000221_SW0  (
    .I0(\DepCheckBlock/Op_ex [4]),
    .I1(\DepCheckBlock/Op_ex [1]),
    .I2(\Execution/ans_ex_mux0000122_291 ),
    .I3(\Execution/ans_ex_mux0000163_293 ),
    .O(N52)
  );
  LUT4 #(
    .INIT ( 16'h0800 ))
  \Execution/ans_ex_mux000213  (
    .I0(\DepCheckBlock/Op_ex [1]),
    .I1(A_6_OBUF_14),
    .I2(\Execution/N45 ),
    .I3(B_0_OBUF_24),
    .O(\Execution/ans_ex_mux000213_315 )
  );
  LUT4 #(
    .INIT ( 16'h0800 ))
  \Execution/ans_ex_mux0006169  (
    .I0(\Execution/ans_ex_mux0001152 ),
    .I1(A_0_OBUF_8),
    .I2(\Execution/N45 ),
    .I3(B_0_OBUF_24),
    .O(\Execution/ans_ex_mux0006169_364 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \Execution/ans_ex_mux000594  (
    .I0(\DepCheckBlock/Op_ex [0]),
    .I1(B_1_OBUF_25),
    .I2(B_2_OBUF_26),
    .I3(N233),
    .O(\Execution/ans_ex_mux000594_355 )
  );
  LUT3 #(
    .INIT ( 8'h40 ))
  \Execution/ans_ex_mux0007206  (
    .I0(\Execution/N45 ),
    .I1(A_1_OBUF_9),
    .I2(B_0_OBUF_24),
    .O(\Execution/ans_ex_mux0007206_375 )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \Execution/ans_ex_mux0003161_SW0  (
    .I0(\DepCheckBlock/imm [1]),
    .I1(\DepCheckBlock/imm [2]),
    .O(N67)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<0>1_SW2  (
    .I0(mux_sel_a_0_OBUF_687),
    .I1(\DM/ans_reg [0]),
    .I2(\WB/ans_wb [0]),
    .O(N69)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<0>1_SW3  (
    .I0(mux_sel_a_0_OBUF_687),
    .I1(\DM/ans_dm [0]),
    .I2(\WB/ans_wb [0]),
    .O(N70)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \RF/Mmux_A_3  (
    .I0(N70),
    .I1(N69),
    .I2(\Execution/Mem_mux_sel_ex_246 ),
    .O(\RF/Mmux_A_3_560 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<1>1_SW2  (
    .I0(mux_sel_a_0_OBUF_687),
    .I1(\DM/ans_reg [1]),
    .I2(\WB/ans_wb [1]),
    .O(N72)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<1>1_SW3  (
    .I0(mux_sel_a_0_OBUF_687),
    .I1(\DM/ans_dm [1]),
    .I2(\WB/ans_wb [1]),
    .O(N73)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \RF/Mmux_A_31  (
    .I0(N73),
    .I1(N72),
    .I2(\Execution/Mem_mux_sel_ex_246 ),
    .O(\RF/Mmux_A_31_561 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<2>1_SW2  (
    .I0(mux_sel_a_0_OBUF_687),
    .I1(\DM/ans_reg [2]),
    .I2(\WB/ans_wb [2]),
    .O(N75)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<2>1_SW3  (
    .I0(mux_sel_a_0_OBUF_687),
    .I1(\DM/ans_dm [2]),
    .I2(\WB/ans_wb [2]),
    .O(N76)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \RF/Mmux_A_32  (
    .I0(N76),
    .I1(N75),
    .I2(\Execution/Mem_mux_sel_ex_246 ),
    .O(\RF/Mmux_A_32_562 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<3>1_SW2  (
    .I0(mux_sel_a_0_OBUF_687),
    .I1(\DM/ans_reg [3]),
    .I2(\WB/ans_wb [3]),
    .O(N78)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<3>1_SW3  (
    .I0(mux_sel_a_0_OBUF_687),
    .I1(\DM/ans_dm [3]),
    .I2(\WB/ans_wb [3]),
    .O(N79)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \RF/Mmux_A_33  (
    .I0(N79),
    .I1(N78),
    .I2(\Execution/Mem_mux_sel_ex_246 ),
    .O(\RF/Mmux_A_33_563 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<4>1_SW2  (
    .I0(mux_sel_a_0_OBUF_687),
    .I1(\DM/ans_reg [4]),
    .I2(\WB/ans_wb [4]),
    .O(N81)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<4>1_SW3  (
    .I0(mux_sel_a_0_OBUF_687),
    .I1(\DM/ans_dm [4]),
    .I2(\WB/ans_wb [4]),
    .O(N82)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \RF/Mmux_A_34  (
    .I0(N82),
    .I1(N81),
    .I2(\Execution/Mem_mux_sel_ex_246 ),
    .O(\RF/Mmux_A_34_564 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<5>1_SW2  (
    .I0(mux_sel_a_0_OBUF_687),
    .I1(\DM/ans_reg [5]),
    .I2(\WB/ans_wb [5]),
    .O(N84)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<5>1_SW3  (
    .I0(mux_sel_a_0_OBUF_687),
    .I1(\DM/ans_dm [5]),
    .I2(\WB/ans_wb [5]),
    .O(N85)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \RF/Mmux_A_35  (
    .I0(N85),
    .I1(N84),
    .I2(\Execution/Mem_mux_sel_ex_246 ),
    .O(\RF/Mmux_A_35_565 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<7>1_SW0  (
    .I0(mux_sel_a_0_OBUF_687),
    .I1(\DM/ans_reg [7]),
    .I2(\WB/ans_wb [7]),
    .O(N87)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<7>1_SW1  (
    .I0(mux_sel_a_0_OBUF_687),
    .I1(\DM/ans_dm [7]),
    .I2(\WB/ans_wb [7]),
    .O(N88)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \RF/Mmux_A_37  (
    .I0(N88),
    .I1(N87),
    .I2(\Execution/Mem_mux_sel_ex_246 ),
    .O(\RF/Mmux_A_37_567 )
  );
  LUT3 #(
    .INIT ( 8'hC8 ))
  \Execution/ans_ex_mux000298  (
    .I0(A_5_OBUF_13),
    .I1(N90),
    .I2(\DepCheckBlock/Op_ex [0]),
    .O(\Execution/ans_ex_mux000298_324 )
  );
  LUT4 #(
    .INIT ( 16'hB800 ))
  \Execution/ans_ex_mux00012111  (
    .I0(\DepCheckBlock/imm [1]),
    .I1(\DepCheckBlock/imm_sel_164 ),
    .I2(\RF/Temp_B [1]),
    .I3(B_2_OBUF_26),
    .O(\Execution/N87 )
  );
  LUT4 #(
    .INIT ( 16'hB847 ))
  \Execution/Madd_AUX_11_addsub0000_lut<1>  (
    .I0(\DepCheckBlock/imm [1]),
    .I1(\DepCheckBlock/imm_sel_164 ),
    .I2(\RF/Temp_B [1]),
    .I3(A_1_OBUF_9),
    .O(\Execution/Madd_AUX_11_addsub0000_lut [1])
  );
  LUT4 #(
    .INIT ( 16'hB847 ))
  \Execution/Madd_AUX_11_addsub0000_lut<2>  (
    .I0(\DepCheckBlock/imm [2]),
    .I1(\DepCheckBlock/imm_sel_164 ),
    .I2(\RF/Temp_B [2]),
    .I3(A_2_OBUF_10),
    .O(\Execution/Madd_AUX_11_addsub0000_lut [2])
  );
  LUT3 #(
    .INIT ( 8'hAE ))
  \Execution/ans_ex_mux000776_SW1  (
    .I0(\DepCheckBlock/Op_ex [4]),
    .I1(\DepCheckBlock/Op_ex [2]),
    .I2(\Execution/ans_ex_mux000749_377 ),
    .O(N97)
  );
  LUT4 #(
    .INIT ( 16'h01EF ))
  \Execution/ans_ex_mux0007110  (
    .I0(\Execution/ans_ex_mux000759_378 ),
    .I1(\Execution/ans_ex_mux000766_379 ),
    .I2(N96),
    .I3(N97),
    .O(\Execution/ans_ex_mux0007110_371 )
  );
  LUT4 #(
    .INIT ( 16'hB847 ))
  \Execution/Madd_AUX_11_addsub0000_lut<0>  (
    .I0(\DepCheckBlock/imm [0]),
    .I1(\DepCheckBlock/imm_sel_164 ),
    .I2(\RF/Temp_B [0]),
    .I3(A_0_OBUF_8),
    .O(\Execution/Madd_AUX_11_addsub0000_lut [0])
  );
  LUT4 #(
    .INIT ( 16'hB847 ))
  \Execution/Madd_AUX_11_addsub0000_lut<3>  (
    .I0(\DepCheckBlock/imm [3]),
    .I1(\DepCheckBlock/imm_sel_164 ),
    .I2(\RF/Temp_B [3]),
    .I3(A_3_OBUF_11),
    .O(\Execution/Madd_AUX_11_addsub0000_lut [3])
  );
  LUT4 #(
    .INIT ( 16'hA965 ))
  \Execution/Madd_AUX_11_addsub0000_lut<4>  (
    .I0(A_4_OBUF_12),
    .I1(\DepCheckBlock/imm_sel_164 ),
    .I2(\RF/Temp_B [4]),
    .I3(\DepCheckBlock/imm [4]),
    .O(\Execution/Madd_AUX_11_addsub0000_lut [4])
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \Execution/ans_ex_mux0002133  (
    .I0(\Execution/ans_ex_mux000298_324 ),
    .I1(\Execution/AUX_11_addsub0000 [5]),
    .I2(\Execution/ans_ex_mux0002127 ),
    .I3(N99),
    .O(\Execution/ans_ex_mux0002133_316 )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \Execution/Flag_1_not000115  (
    .I0(\Execution/ans_ex_mux0000 ),
    .I1(N103),
    .I2(\Execution/ans_ex_mux0002 ),
    .I3(\Execution/Flag_1_not00012_216 ),
    .O(\Execution/Flag_1_not0001 )
  );
  LUT4 #(
    .INIT ( 16'h00B8 ))
  \Execution/ans_ex_mux0003131  (
    .I0(\DepCheckBlock/imm [0]),
    .I1(\DepCheckBlock/imm_sel_164 ),
    .I2(\RF/Temp_B [0]),
    .I3(N242),
    .O(\Execution/N39 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \Execution/ans_ex_mux000038  (
    .I0(A_4_OBUF_12),
    .I1(\Execution/ans_ex_mux000361 ),
    .I2(B_0_OBUF_24),
    .O(\Execution/ans_ex_mux000038_297 )
  );
  LUT4 #(
    .INIT ( 16'hC0A0 ))
  \Execution/ans_ex_mux0006144  (
    .I0(A_3_OBUF_11),
    .I1(A_4_OBUF_12),
    .I2(\Execution/ans_ex_mux000361 ),
    .I3(B_0_OBUF_24),
    .O(\Execution/ans_ex_mux0006144_362 )
  );
  LUT4 #(
    .INIT ( 16'hD080 ))
  \Execution/ans_ex_mux0003131_SW0  (
    .I0(\DepCheckBlock/imm_sel_164 ),
    .I1(\DepCheckBlock/imm [0]),
    .I2(A_1_OBUF_9),
    .I3(\RF/Temp_B [0]),
    .O(N105)
  );
  LUT4 #(
    .INIT ( 16'hF222 ))
  \Execution/ans_ex_mux000599  (
    .I0(N105),
    .I1(\Execution/N45 ),
    .I2(A_0_OBUF_8),
    .I3(\Execution/N43 ),
    .O(\Execution/ans_ex_mux000599_356 )
  );
  LUT4 #(
    .INIT ( 16'hB800 ))
  \Execution/ans_ex_mux00012111_SW0  (
    .I0(\DepCheckBlock/imm [1]),
    .I1(\DepCheckBlock/imm_sel_164 ),
    .I2(\RF/Temp_B [1]),
    .I3(A_7_OBUF_15),
    .O(N107)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<6>1_SW2  (
    .I0(mux_sel_a_0_OBUF_687),
    .I1(\DM/ans_reg [6]),
    .I2(\WB/ans_wb [6]),
    .O(N112)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \DM/mux_ans_dm<6>1_SW3  (
    .I0(mux_sel_a_0_OBUF_687),
    .I1(\DM/ans_dm [6]),
    .I2(\WB/ans_wb [6]),
    .O(N113)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \RF/Mmux_A_36  (
    .I0(N113),
    .I1(N112),
    .I2(\Execution/Mem_mux_sel_ex_246 ),
    .O(\RF/Mmux_A_36_566 )
  );
  LUT4 #(
    .INIT ( 16'hB800 ))
  \Execution/ans_ex_mux0003131_SW1  (
    .I0(\DepCheckBlock/imm [0]),
    .I1(\DepCheckBlock/imm_sel_164 ),
    .I2(\RF/Temp_B [0]),
    .I3(A_5_OBUF_13),
    .O(N115)
  );
  LUT4 #(
    .INIT ( 16'hD080 ))
  \Execution/ans_ex_mux0003131_SW2  (
    .I0(\DepCheckBlock/imm_sel_164 ),
    .I1(\DepCheckBlock/imm [0]),
    .I2(A_6_OBUF_14),
    .I3(\RF/Temp_B [0]),
    .O(N117)
  );
  LUT4 #(
    .INIT ( 16'hF222 ))
  \Execution/ans_ex_mux000048  (
    .I0(N117),
    .I1(\Execution/N45 ),
    .I2(A_5_OBUF_13),
    .I3(N243),
    .O(\Execution/ans_ex_mux000048_299 )
  );
  LUT4 #(
    .INIT ( 16'hFDEC ))
  \Execution/ans_ex_mux0006194  (
    .I0(\Execution/ans_ex_mux0006130_360 ),
    .I1(\Execution/ans_ex_mux000672_368 ),
    .I2(N123),
    .I3(N122),
    .O(\Execution/ans_ex_mux0006 )
  );
  LUT4 #(
    .INIT ( 16'hFAF8 ))
  \Execution/ans_ex_mux0001189_SW0  (
    .I0(\Execution/ans_ex_mux0002350 ),
    .I1(\Execution/ans_ex_mux000199_311 ),
    .I2(\Execution/ans_ex_mux00014_308 ),
    .I3(N125),
    .O(N94)
  );
  LUT4 #(
    .INIT ( 16'hEEEC ))
  \Execution/ans_ex_mux0007262_SW0  (
    .I0(\Execution/ans_ex_mux0007223_376 ),
    .I1(\Execution/ans_ex_mux0007146_372 ),
    .I2(\Execution/ans_ex_mux0007206_375 ),
    .I3(\Execution/ans_ex_mux0007194_374 ),
    .O(N127)
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \RF/B<2>1_SW0  (
    .I0(\DepCheckBlock/imm [2]),
    .I1(\DepCheckBlock/imm [1]),
    .O(N131)
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \Execution/Flag_1_not00017_SW0  (
    .I0(\Execution/ans_ex_mux000572_354 ),
    .I1(N140),
    .I2(\Execution/ans_ex_mux0006 ),
    .I3(N241),
    .O(N103)
  );
  LUT4 #(
    .INIT ( 16'hC0A0 ))
  \Execution/ans_ex_mux0007194_SW1  (
    .I0(A_6_OBUF_14),
    .I1(A_7_OBUF_15),
    .I2(B_2_OBUF_26),
    .I3(B_0_OBUF_24),
    .O(N143)
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \Execution/ans_ex_mux000364_SW0  (
    .I0(\DepCheckBlock/Op_ex [1]),
    .I1(\Execution/ans_ex_mux0001152 ),
    .I2(A_6_OBUF_14),
    .I3(A_2_OBUF_10),
    .O(N145)
  );
  LUT4 #(
    .INIT ( 16'hA0C0 ))
  \Execution/ans_ex_mux000364  (
    .I0(N146),
    .I1(N145),
    .I2(\Execution/ans_ex_mux000361 ),
    .I3(B_0_OBUF_24),
    .O(\Execution/ans_ex_mux000364_334 )
  );
  LUT4 #(
    .INIT ( 16'hAE0C ))
  \Execution/ans_ex_mux0001137  (
    .I0(N148),
    .I1(N115),
    .I2(\Execution/N45 ),
    .I3(\Execution/ans_ex_mux000361 ),
    .O(\Execution/ans_ex_mux0001137_304 )
  );
  LUT4 #(
    .INIT ( 16'h575F ))
  \Execution/ans_ex_mux0005153_SW0_SW0  (
    .I0(\Execution/ans_ex_mux0002350 ),
    .I1(\Execution/ans_ex_mux0001152 ),
    .I2(\Execution/ans_ex_mux000594_355 ),
    .I3(\Execution/ans_ex_mux000599_356 ),
    .O(N150)
  );
  LUT4 #(
    .INIT ( 16'hACAF ))
  \Execution/ans_ex_mux0005175_SW0  (
    .I0(N56),
    .I1(\Execution/ans_ex_mux00054_352 ),
    .I2(\Execution/ans_ex_mux0005143_349 ),
    .I3(N150),
    .O(N140)
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \Execution/ans_ex_mux000224_SW0  (
    .I0(A_4_OBUF_12),
    .I1(\Execution/N50 ),
    .I2(\Execution/N39 ),
    .I3(\Execution/N14 ),
    .O(N155)
  );
  LUT4 #(
    .INIT ( 16'hDFD5 ))
  \Execution/ans_ex_mux000317_SW0  (
    .I0(\Execution/ans_ex_mux0001152 ),
    .I1(\DepCheckBlock/imm [0]),
    .I2(\DepCheckBlock/imm_sel_164 ),
    .I3(\RF/Temp_B [0]),
    .O(N159)
  );
  MUXF5   \Execution/ans_ex_mux0000221_SW1  (
    .I0(N161),
    .I1(N162),
    .S(\Execution/ans_ex_mux0000163_293 ),
    .O(N53)
  );
  LUT4 #(
    .INIT ( 16'hAAFB ))
  \Execution/ans_ex_mux0000221_SW1_F  (
    .I0(\DepCheckBlock/Op_ex [4]),
    .I1(\DepCheckBlock/Op_ex [0]),
    .I2(\DepCheckBlock/Op_ex [1]),
    .I3(\Execution/ans_ex_mux0000122_291 ),
    .O(N161)
  );
  LUT3 #(
    .INIT ( 8'hAE ))
  \Execution/ans_ex_mux0000221_SW1_G  (
    .I0(\DepCheckBlock/Op_ex [4]),
    .I1(\DepCheckBlock/Op_ex [1]),
    .I2(\Execution/ans_ex_mux0000122_291 ),
    .O(N162)
  );
  MUXF5   \Execution/ans_ex_mux0005153_SW0  (
    .I0(N163),
    .I1(N164),
    .S(\Execution/ans_ex_mux000599_356 ),
    .O(N55)
  );
  LUT3 #(
    .INIT ( 8'hF8 ))
  \Execution/ans_ex_mux0005153_SW0_F  (
    .I0(\Execution/ans_ex_mux000594_355 ),
    .I1(\Execution/ans_ex_mux0002350 ),
    .I2(\Execution/ans_ex_mux00054_352 ),
    .O(N163)
  );
  LUT4 #(
    .INIT ( 16'hFFC8 ))
  \Execution/ans_ex_mux0005153_SW0_G  (
    .I0(\Execution/ans_ex_mux000594_355 ),
    .I1(\Execution/ans_ex_mux0002350 ),
    .I2(\Execution/ans_ex_mux0001152 ),
    .I3(\Execution/ans_ex_mux00054_352 ),
    .O(N164)
  );
  MUXF5   \Execution/ans_ex_mux0001167_SW0  (
    .I0(N165),
    .I1(N166),
    .S(\Execution/ans_ex_mux0001137_304 ),
    .O(N60)
  );
  LUT4 #(
    .INIT ( 16'hFF80 ))
  \Execution/ans_ex_mux0001167_SW0_F  (
    .I0(\Execution/ans_ex_mux0001125_303 ),
    .I1(\Execution/ans_ex_mux0002350 ),
    .I2(\Execution/ans_ex_mux0001152 ),
    .I3(\Execution/ans_ex_mux00014_308 ),
    .O(N165)
  );
  MUXF5   \RF/B<5>1  (
    .I0(N167),
    .I1(N168),
    .S(mux_sel_b_1_OBUF_692),
    .O(B_5_OBUF_29)
  );
  LUT4 #(
    .INIT ( 16'h0E04 ))
  \RF/B<5>1_F  (
    .I0(mux_sel_b_0_OBUF_691),
    .I1(\RF/Reg_B [5]),
    .I2(\DepCheckBlock/imm_sel_164 ),
    .I3(\Execution/Register [5]),
    .O(N167)
  );
  LUT4 #(
    .INIT ( 16'h2230 ))
  \RF/B<5>1_G  (
    .I0(N47),
    .I1(\DepCheckBlock/imm_sel_164 ),
    .I2(N46),
    .I3(\Execution/Mem_mux_sel_ex_246 ),
    .O(N168)
  );
  MUXF5   \Execution/ans_ex_mux0002343  (
    .I0(N169),
    .I1(N170),
    .S(\DepCheckBlock/imm_sel_164 ),
    .O(\Execution/ans_ex_mux0002343_318 )
  );
  LUT4 #(
    .INIT ( 16'hAAAB ))
  \Execution/ans_ex_mux0002343_F  (
    .I0(\Execution/ans_ex_mux000013 ),
    .I1(\RF/Temp_B [1]),
    .I2(\RF/Temp_B [2]),
    .I3(\RF/Temp_B [0]),
    .O(N169)
  );
  LUT4 #(
    .INIT ( 16'hAAAB ))
  \Execution/ans_ex_mux0002343_G  (
    .I0(\Execution/ans_ex_mux000013 ),
    .I1(\DepCheckBlock/imm [1]),
    .I2(\DepCheckBlock/imm [2]),
    .I3(\DepCheckBlock/imm [0]),
    .O(N170)
  );
  LUT4 #(
    .INIT ( 16'hFDFF ))
  \Execution/ans_ex_mux000776_SW0_F  (
    .I0(\Execution/ans_ex_mux0001152 ),
    .I1(\DepCheckBlock/Op_ex [4]),
    .I2(\DepCheckBlock/Op_ex [2]),
    .I3(\Execution/AUX_11_addsub0000 [0]),
    .O(N171)
  );
  MUXF5   \Execution/ans_ex_mux0001107  (
    .I0(N173),
    .I1(N174),
    .S(\DepCheckBlock/imm_sel_164 ),
    .O(\Execution/ans_ex_mux0001107_302 )
  );
  LUT4 #(
    .INIT ( 16'hA280 ))
  \Execution/ans_ex_mux0001107_F  (
    .I0(\RF/Temp_B [2]),
    .I1(\RF/Temp_B [1]),
    .I2(A_0_OBUF_8),
    .I3(A_2_OBUF_10),
    .O(N173)
  );
  LUT4 #(
    .INIT ( 16'hA280 ))
  \Execution/ans_ex_mux0001107_G  (
    .I0(\DepCheckBlock/imm [2]),
    .I1(\DepCheckBlock/imm [1]),
    .I2(A_0_OBUF_8),
    .I3(A_2_OBUF_10),
    .O(N174)
  );
  MUXF5   \Execution/ans_ex_mux0005125  (
    .I0(N175),
    .I1(N176),
    .S(B_0_OBUF_24),
    .O(\Execution/ans_ex_mux0005125_347 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \Execution/ans_ex_mux0005125_F  (
    .I0(A_6_OBUF_14),
    .I1(\Execution/N50 ),
    .I2(A_4_OBUF_12),
    .I3(\Execution/ans_ex_mux000361 ),
    .O(N175)
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \Execution/ans_ex_mux0005125_G  (
    .I0(A_7_OBUF_15),
    .I1(\Execution/N50 ),
    .I2(A_5_OBUF_13),
    .I3(\Execution/ans_ex_mux000361 ),
    .O(N176)
  );
  MUXF5   \Execution/ans_ex_mux0006172_SW0  (
    .I0(N177),
    .I1(N1),
    .S(\Execution/ans_ex_mux00064_366 ),
    .O(N122)
  );
  LUT4 #(
    .INIT ( 16'hCC80 ))
  \Execution/ans_ex_mux0006172_SW0_F  (
    .I0(\DepCheckBlock/Op_ex [1]),
    .I1(\Execution/ans_ex_mux0002350 ),
    .I2(\Execution/ans_ex_mux0006144_362 ),
    .I3(\Execution/ans_ex_mux0006169_364 ),
    .O(N177)
  );
  MUXF5   \RF/B<6>1  (
    .I0(N179),
    .I1(N180),
    .S(mux_sel_b_1_OBUF_692),
    .O(B_6_OBUF_30)
  );
  LUT4 #(
    .INIT ( 16'h0E04 ))
  \RF/B<6>1_F  (
    .I0(mux_sel_b_0_OBUF_691),
    .I1(\RF/Reg_B [6]),
    .I2(\DepCheckBlock/imm_sel_164 ),
    .I3(\Execution/Register [6]),
    .O(N179)
  );
  LUT4 #(
    .INIT ( 16'h2230 ))
  \RF/B<6>1_G  (
    .I0(N50),
    .I1(\DepCheckBlock/imm_sel_164 ),
    .I2(N49),
    .I3(\Execution/Mem_mux_sel_ex_246 ),
    .O(N180)
  );
  MUXF5   \Execution/_old_ans_ex_15<6>1  (
    .I0(N181),
    .I1(N182),
    .S(\Execution/ans_ex_mux000199_311 ),
    .O(\Execution/_old_ans_ex_15 [6])
  );
  LUT4 #(
    .INIT ( 16'hFAD8 ))
  \Execution/_old_ans_ex_15<6>1_F  (
    .I0(\Execution/N11 ),
    .I1(N60),
    .I2(Data_in_6_IBUF_109),
    .I3(\Execution/ans_ex_mux000172_310 ),
    .O(N181)
  );
  LUT4 #(
    .INIT ( 16'hFAD8 ))
  \Execution/_old_ans_ex_15<6>1_G  (
    .I0(\Execution/N11 ),
    .I1(N61),
    .I2(Data_in_6_IBUF_109),
    .I3(\Execution/ans_ex_mux000172_310 ),
    .O(N182)
  );
  MUXF5   \Execution/_old_ans_ex_15<2>1  (
    .I0(N183),
    .I1(N184),
    .S(\Execution/ans_ex_mux0005143_349 ),
    .O(\Execution/_old_ans_ex_15 [2])
  );
  LUT4 #(
    .INIT ( 16'hFAD8 ))
  \Execution/_old_ans_ex_15<2>1_F  (
    .I0(\Execution/N11 ),
    .I1(N55),
    .I2(Data_in_2_IBUF_105),
    .I3(\Execution/ans_ex_mux000572_354 ),
    .O(N183)
  );
  LUT4 #(
    .INIT ( 16'hFAD8 ))
  \Execution/_old_ans_ex_15<2>1_G  (
    .I0(\Execution/N11 ),
    .I1(N56),
    .I2(Data_in_2_IBUF_105),
    .I3(\Execution/ans_ex_mux000572_354 ),
    .O(N184)
  );
  MUXF5   \RF/B<7>1  (
    .I0(N185),
    .I1(N186),
    .S(mux_sel_b_1_OBUF_692),
    .O(B_7_OBUF_31)
  );
  LUT4 #(
    .INIT ( 16'h0E04 ))
  \RF/B<7>1_F  (
    .I0(mux_sel_b_0_OBUF_691),
    .I1(\RF/Reg_B [7]),
    .I2(\DepCheckBlock/imm_sel_164 ),
    .I3(\Execution/Register [7]),
    .O(N185)
  );
  LUT4 #(
    .INIT ( 16'h2320 ))
  \RF/B<7>1_G  (
    .I0(\WB/ans_wb [7]),
    .I1(\DepCheckBlock/imm_sel_164 ),
    .I2(mux_sel_b_0_OBUF_691),
    .I3(mux_ans_dm[7]),
    .O(N186)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \DepCheckBlock/mux_sel_a_cmp_eq0002578_SW0  (
    .I0(\DepCheckBlock/RegA [3]),
    .I1(\DepCheckBlock/Register4 [3]),
    .I2(\DepCheckBlock/RegA [4]),
    .I3(\DepCheckBlock/Register4 [4]),
    .O(N189)
  );
  LUT4 #(
    .INIT ( 16'h9000 ))
  \DepCheckBlock/mux_sel_a_cmp_eq0002578  (
    .I0(\DepCheckBlock/RegA [2]),
    .I1(\DepCheckBlock/Register4 [2]),
    .I2(\DepCheckBlock/mux_sel_a_cmp_eq0002562_171 ),
    .I3(N189),
    .O(\DepCheckBlock/mux_sel_a_cmp_eq0002 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \DepCheckBlock/mux_sel_a_cmp_eq0001578_SW0  (
    .I0(\DepCheckBlock/RegA [3]),
    .I1(\DepCheckBlock/Register3 [3]),
    .I2(\DepCheckBlock/RegA [4]),
    .I3(\DepCheckBlock/Register3 [4]),
    .O(N191)
  );
  LUT4 #(
    .INIT ( 16'h9000 ))
  \DepCheckBlock/mux_sel_a_cmp_eq0001578  (
    .I0(\DepCheckBlock/RegA [2]),
    .I1(\DepCheckBlock/Register3 [2]),
    .I2(\DepCheckBlock/mux_sel_a_cmp_eq0001562_169 ),
    .I3(N191),
    .O(\DepCheckBlock/mux_sel_a_cmp_eq0001 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \DepCheckBlock/mux_sel_a_cmp_eq0000578_SW0  (
    .I0(\DepCheckBlock/RegA [3]),
    .I1(\DepCheckBlock/Register2 [3]),
    .I2(\DepCheckBlock/RegA [4]),
    .I3(\DepCheckBlock/Register2 [4]),
    .O(N193)
  );
  LUT4 #(
    .INIT ( 16'h9000 ))
  \DepCheckBlock/mux_sel_a_cmp_eq0000578  (
    .I0(\DepCheckBlock/RegA [2]),
    .I1(\DepCheckBlock/Register2 [2]),
    .I2(\DepCheckBlock/mux_sel_a_cmp_eq0000562_167 ),
    .I3(N193),
    .O(\DepCheckBlock/mux_sel_a_cmp_eq0000 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \DepCheckBlock/mux_sel_b_cmp_eq0000578_SW0  (
    .I0(\DepCheckBlock/RegB [4]),
    .I1(\DepCheckBlock/Register2 [4]),
    .I2(\DepCheckBlock/RegB [0]),
    .I3(\DepCheckBlock/Register2 [0]),
    .O(N195)
  );
  LUT4 #(
    .INIT ( 16'h9000 ))
  \DepCheckBlock/mux_sel_b_cmp_eq0000578  (
    .I0(\DepCheckBlock/RegB [1]),
    .I1(\DepCheckBlock/Register2 [1]),
    .I2(\DepCheckBlock/mux_sel_b_cmp_eq0000562_173 ),
    .I3(N195),
    .O(\DepCheckBlock/mux_sel_b_cmp_eq0000 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \DepCheckBlock/mux_sel_b_cmp_eq0002578_SW0  (
    .I0(\DepCheckBlock/RegB [4]),
    .I1(\DepCheckBlock/Register4 [4]),
    .I2(\DepCheckBlock/RegB [0]),
    .I3(\DepCheckBlock/Register4 [0]),
    .O(N197)
  );
  LUT4 #(
    .INIT ( 16'h9000 ))
  \DepCheckBlock/mux_sel_b_cmp_eq0002578  (
    .I0(\DepCheckBlock/RegB [1]),
    .I1(\DepCheckBlock/Register4 [1]),
    .I2(\DepCheckBlock/mux_sel_b_cmp_eq0002562_177 ),
    .I3(N197),
    .O(\DepCheckBlock/mux_sel_b_cmp_eq0002 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \DepCheckBlock/mux_sel_b_cmp_eq0001578_SW0  (
    .I0(\DepCheckBlock/RegB [4]),
    .I1(\DepCheckBlock/Register3 [4]),
    .I2(\DepCheckBlock/RegB [0]),
    .I3(\DepCheckBlock/Register3 [0]),
    .O(N199)
  );
  LUT4 #(
    .INIT ( 16'h9000 ))
  \DepCheckBlock/mux_sel_b_cmp_eq0001578  (
    .I0(\DepCheckBlock/RegB [1]),
    .I1(\DepCheckBlock/Register3 [1]),
    .I2(\DepCheckBlock/mux_sel_b_cmp_eq0001562_175 ),
    .I3(N199),
    .O(\DepCheckBlock/mux_sel_b_cmp_eq0001 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \PCIM/Temp<4>2_SW0  (
    .I0(\PCIM/D1/Q [0]),
    .I1(\PCIM/D1/Q [1]),
    .I2(\PCIM/D1/Q [2]),
    .I3(\PCIM/D1/Q [3]),
    .O(N16)
  );
  LUT4 #(
    .INIT ( 16'h6AAA ))
  \CG/Mcount_Counter_xor<3>12  (
    .I0(\CG/Counter [3]),
    .I1(\CG/Counter [2]),
    .I2(\CG/Counter [1]),
    .I3(\CG/Counter [0]),
    .O(Result[3])
  );
  LUT4 #(
    .INIT ( 16'hD888 ))
  \Execution/ans_ex_mux000461  (
    .I0(\DepCheckBlock/Op_ex [1]),
    .I1(A_4_OBUF_12),
    .I2(\DepCheckBlock/Op_ex [0]),
    .I3(A_2_OBUF_10),
    .O(\Execution/ans_ex_mux000461_345 )
  );
  LUT4 #(
    .INIT ( 16'hD888 ))
  \Execution/ans_ex_mux000323  (
    .I0(\DepCheckBlock/Op_ex [1]),
    .I1(A_5_OBUF_13),
    .I2(\DepCheckBlock/Op_ex [0]),
    .I3(A_3_OBUF_11),
    .O(\Execution/ans_ex_mux000323_331 )
  );
  LUT4 #(
    .INIT ( 16'h0A08 ))
  \ClockBlock/AND230  (
    .I0(\CG/Output_Clk1 ),
    .I1(\ClockBlock/AND28_60 ),
    .I2(\ClockBlock/D1/q_61 ),
    .I3(\ClockBlock/AND216_59 ),
    .O(\ClockBlock/AND2 )
  );
  LUT4 #(
    .INIT ( 16'h00C8 ))
  \Execution/ans_ex_mux000128  (
    .I0(\DepCheckBlock/Op_ex [0]),
    .I1(\DepCheckBlock/Op_ex [2]),
    .I2(A_6_OBUF_14),
    .I3(N203),
    .O(\Execution/ans_ex_mux000128_307 )
  );
  LUT4 #(
    .INIT ( 16'hAAEA ))
  \Execution/ans_ex_mux0001167_SW0_G  (
    .I0(\Execution/ans_ex_mux00014_308 ),
    .I1(\DepCheckBlock/Op_ex [0]),
    .I2(\Execution/ans_ex_mux0002350 ),
    .I3(\DepCheckBlock/Op_ex [1]),
    .O(N166)
  );
  LUT4 #(
    .INIT ( 16'hAAEA ))
  \Execution/ans_ex_mux0001167_SW1  (
    .I0(N235),
    .I1(\DepCheckBlock/Op_ex [3]),
    .I2(\DepCheckBlock/Op_ex [4]),
    .I3(\DepCheckBlock/Op_ex [2]),
    .O(N61)
  );
  LUT4 #(
    .INIT ( 16'h0888 ))
  \Execution/ans_ex_mux000284  (
    .I0(B_5_OBUF_29),
    .I1(\Execution/N48 ),
    .I2(\DepCheckBlock/Op_ex [2]),
    .I3(A_5_OBUF_13),
    .O(\Execution/ans_ex_mux000284_323 )
  );
  LUT4 #(
    .INIT ( 16'h0888 ))
  \Execution/ans_ex_mux000114  (
    .I0(B_6_OBUF_30),
    .I1(\Execution/N48 ),
    .I2(\DepCheckBlock/Op_ex [2]),
    .I3(A_6_OBUF_14),
    .O(\Execution/ans_ex_mux000114_305 )
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \Execution/ans_ex_mux0001431  (
    .I0(\DepCheckBlock/Op_ex [0]),
    .I1(\DepCheckBlock/Op_ex [2]),
    .I2(\DepCheckBlock/Op_ex [1]),
    .O(\Execution/ans_ex_mux0002127 )
  );
  LUT4 #(
    .INIT ( 16'h0400 ))
  \ClockBlock/Hlt11  (
    .I0(Ins[16]),
    .I1(Ins[19]),
    .I2(Ins[18]),
    .I3(Ins[15]),
    .O(\ClockBlock/Hlt1 )
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \Execution/ans_ex_mux000061  (
    .I0(\DepCheckBlock/Op_ex [1]),
    .I1(\DepCheckBlock/Op_ex [2]),
    .I2(\DepCheckBlock/Op_ex [0]),
    .O(\Execution/N40 )
  );
  LUT4 #(
    .INIT ( 16'h90F0 ))
  \Execution/ans_ex_mux000025  (
    .I0(\DepCheckBlock/Op_ex [0]),
    .I1(\DepCheckBlock/Op_ex [1]),
    .I2(A_7_OBUF_15),
    .I3(N207),
    .O(\Execution/ans_ex_mux000025_295 )
  );
  BUFG   \CG/Output_Clk_BUFG  (
    .I(\CG/Output_Clk1 ),
    .O(\CG/Output_Clk_39 )
  );
  BUFG   Clk5_sim_OBUF_BUFG (
    .I(Clk5_sim_OBUF1),
    .O(Clk5_sim_OBUF_54)
  );
  BUFG   Clk3_sim_OBUF_BUFG (
    .I(Clk3_sim_OBUF1),
    .O(Clk3_sim_OBUF_49)
  );
  BUFGP   Input_Clk_BUFGP (
    .I(Input_Clk),
    .O(Input_Clk_BUFGP_381)
  );
  INV   \RF/N21_INV_0  (
    .I(\DM/RW_dm [4]),
    .O(\RF/write_ctrl )
  );
  INV   \CG/Output_Clk_not00011_INV_0  (
    .I(\CG/Output_Clk1 ),
    .O(\CG/Output_Clk_not0001 )
  );
  INV   \CG/Mcount_Counter_xor<0>11_INV_0  (
    .I(\CG/Counter [0]),
    .O(Result[0])
  );
  MUXF5   \Execution/ans_ex_mux0001125  (
    .I0(N209),
    .I1(N210),
    .S(B_0_OBUF_24),
    .O(\Execution/ans_ex_mux0001125_303 )
  );
  LUT3 #(
    .INIT ( 8'hF8 ))
  \Execution/ans_ex_mux0001125_F  (
    .I0(\Execution/ans_ex_mux000361 ),
    .I1(A_4_OBUF_12),
    .I2(\Execution/ans_ex_mux0001107_302 ),
    .O(N209)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Execution/ans_ex_mux0001125_G  (
    .I0(\Execution/N50 ),
    .I1(A_1_OBUF_9),
    .O(N210)
  );
  MUXF5   \Execution/ans_ex_mux0000163  (
    .I0(N211),
    .I1(N212),
    .S(\Execution/Madd_AUX_8_index0000 ),
    .O(\Execution/ans_ex_mux0000163_293 )
  );
  LUT4 #(
    .INIT ( 16'hC806 ))
  \Execution/ans_ex_mux0000163_F  (
    .I0(A_7_OBUF_15),
    .I1(B_7_OBUF_31),
    .I2(\DepCheckBlock/Op_ex [0]),
    .I3(\DepCheckBlock/Op_ex [2]),
    .O(N211)
  );
  LUT4 #(
    .INIT ( 16'hC809 ))
  \Execution/ans_ex_mux0000163_G  (
    .I0(A_7_OBUF_15),
    .I1(B_7_OBUF_31),
    .I2(\DepCheckBlock/Op_ex [0]),
    .I3(\DepCheckBlock/Op_ex [2]),
    .O(N212)
  );
  MUXF5   \PCIM/Temp<7>1176  (
    .I0(N213),
    .I1(Ins[7]),
    .S(pc_mux_sel),
    .O(\PCIM/Temp [7])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \PCIM/Temp<7>1176_F  (
    .I0(\PCIM/D1/Q [3]),
    .I1(\PCIM/D1/Q [7]),
    .I2(\PCIM/Temp<7>1119 ),
    .O(N213)
  );
  MUXF5   \Execution/ans_ex_mux0003183  (
    .I0(N215),
    .I1(N216),
    .S(\DepCheckBlock/Op_ex [4]),
    .O(\Execution/ans_ex_mux0003 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \Execution/ans_ex_mux0003183_F  (
    .I0(\Execution/ans_ex_mux00034_332 ),
    .I1(\Execution/ans_ex_mux0002127 ),
    .I2(\Execution/AUX_11_addsub0000 [4]),
    .I3(\Execution/ans_ex_mux0003145_329 ),
    .O(N215)
  );
  LUT4 #(
    .INIT ( 16'hAAEA ))
  \Execution/ans_ex_mux0003183_G  (
    .I0(\Execution/ans_ex_mux00034_332 ),
    .I1(\Execution/ans_ex_mux000374_335 ),
    .I2(\DepCheckBlock/Op_ex [3]),
    .I3(\DepCheckBlock/Op_ex [2]),
    .O(N216)
  );
  MUXF5   \Execution/ans_ex_mux0004177  (
    .I0(N217),
    .I1(N218),
    .S(\DepCheckBlock/Op_ex [4]),
    .O(\Execution/ans_ex_mux0004 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \Execution/ans_ex_mux0004177_F  (
    .I0(\Execution/ans_ex_mux00044_344 ),
    .I1(\Execution/ans_ex_mux0002127 ),
    .I2(\Execution/AUX_11_addsub0000 [3]),
    .I3(\Execution/ans_ex_mux0004139_340 ),
    .O(N217)
  );
  LUT4 #(
    .INIT ( 16'hAAEA ))
  \Execution/ans_ex_mux0004177_G  (
    .I0(\Execution/ans_ex_mux00044_344 ),
    .I1(\Execution/ans_ex_mux000468_346 ),
    .I2(\DepCheckBlock/Op_ex [3]),
    .I3(\DepCheckBlock/Op_ex [2]),
    .O(N218)
  );
  MUXF5   \Execution/Flag_0_mux0000731  (
    .I0(N219),
    .I1(N220),
    .S(\DepCheckBlock/Op_ex [0]),
    .O(\Execution/Flag_0_mux000073 )
  );
  LUT4 #(
    .INIT ( 16'hE080 ))
  \Execution/Flag_0_mux0000731_F  (
    .I0(B_7_OBUF_31),
    .I1(A_7_OBUF_15),
    .I2(\Execution/Flag_0_mux000054_212 ),
    .I3(\Execution/Madd_AUX_8_index0000 ),
    .O(N219)
  );
  LUT4 #(
    .INIT ( 16'h8A08 ))
  \Execution/Flag_0_mux0000731_G  (
    .I0(\Execution/Flag_0_mux000054_212 ),
    .I1(A_7_OBUF_15),
    .I2(B_7_OBUF_31),
    .I3(\Execution/Madd_AUX_11_index0000 ),
    .O(N220)
  );
  MUXF5   \Execution/ans_ex_mux00070  (
    .I0(N221),
    .I1(N222),
    .S(\DepCheckBlock/Op_ex [4]),
    .O(\Execution/ans_ex_mux00070_370 )
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  \Execution/ans_ex_mux00070_F  (
    .I0(A_0_OBUF_8),
    .I1(\DepCheckBlock/Op_ex [0]),
    .I2(\DepCheckBlock/Op_ex [2]),
    .I3(\DepCheckBlock/Op_ex [1]),
    .O(N221)
  );
  LUT4 #(
    .INIT ( 16'h6020 ))
  \Execution/ans_ex_mux00070_G  (
    .I0(\DepCheckBlock/Op_ex [2]),
    .I1(\DepCheckBlock/Op_ex [3]),
    .I2(A_0_OBUF_8),
    .I3(\Execution/ans_ex_mux0002343_318 ),
    .O(N222)
  );
  MUXF5   \Execution/ans_ex_mux0005153_SW1  (
    .I0(N223),
    .I1(N224),
    .S(\DepCheckBlock/Op_ex [2]),
    .O(N56)
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \Execution/ans_ex_mux0005153_SW1_F  (
    .I0(\DepCheckBlock/Op_ex [4]),
    .I1(\DepCheckBlock/Op_ex [3]),
    .I2(\Execution/N01 ),
    .I3(\Execution/Register [2]),
    .O(N223)
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \Execution/ans_ex_mux0005153_SW1_G  (
    .I0(\Execution/N01 ),
    .I1(\Execution/Register [2]),
    .I2(A_2_OBUF_10),
    .I3(\Execution/ans_ex_mux0002317_317 ),
    .O(N224)
  );
  MUXF5   \Execution/ans_ex_mux0000122  (
    .I0(N225),
    .I1(N226),
    .S(B_7_OBUF_31),
    .O(\Execution/ans_ex_mux0000122_291 )
  );
  LUT4 #(
    .INIT ( 16'hC080 ))
  \Execution/ans_ex_mux0000122_F  (
    .I0(A_7_OBUF_15),
    .I1(\DepCheckBlock/Op_ex [2]),
    .I2(\DepCheckBlock/Op_ex [1]),
    .I3(\DepCheckBlock/Op_ex [0]),
    .O(N225)
  );
  LUT4 #(
    .INIT ( 16'hFF02 ))
  \Execution/ans_ex_mux0000122_G  (
    .I0(\DepCheckBlock/Op_ex [1]),
    .I1(A_7_OBUF_15),
    .I2(\DepCheckBlock/Op_ex [0]),
    .I3(\Execution/N40 ),
    .O(N226)
  );
  MUXF5   \Execution/ans_ex_mux000749  (
    .I0(N227),
    .I1(N228),
    .S(B_0_OBUF_24),
    .O(\Execution/ans_ex_mux000749_377 )
  );
  LUT4 #(
    .INIT ( 16'hC080 ))
  \Execution/ans_ex_mux000749_F  (
    .I0(A_0_OBUF_8),
    .I1(\DepCheckBlock/Op_ex [1]),
    .I2(\DepCheckBlock/Op_ex [2]),
    .I3(\DepCheckBlock/Op_ex [0]),
    .O(N227)
  );
  LUT4 #(
    .INIT ( 16'h464A ))
  \Execution/ans_ex_mux000749_G  (
    .I0(\DepCheckBlock/Op_ex [1]),
    .I1(\DepCheckBlock/Op_ex [2]),
    .I2(\DepCheckBlock/Op_ex [0]),
    .I3(A_0_OBUF_8),
    .O(N228)
  );
  MUXF5   \Execution/ans_ex_mux0007194_SW0  (
    .I0(N229),
    .I1(N230),
    .S(\DepCheckBlock/imm_sel_164 ),
    .O(N142)
  );
  LUT4 #(
    .INIT ( 16'hD080 ))
  \Execution/ans_ex_mux0007194_SW0_F  (
    .I0(\RF/Temp_B [0]),
    .I1(A_5_OBUF_13),
    .I2(\RF/Temp_B [2]),
    .I3(A_4_OBUF_12),
    .O(N229)
  );
  LUT4 #(
    .INIT ( 16'hD080 ))
  \Execution/ans_ex_mux0007194_SW0_G  (
    .I0(\DepCheckBlock/imm [0]),
    .I1(A_5_OBUF_13),
    .I2(\DepCheckBlock/imm [2]),
    .I3(A_4_OBUF_12),
    .O(N230)
  );
  MUXF5   \Execution/ans_ex_mux000037  (
    .I0(N231),
    .I1(N232),
    .S(B_0_OBUF_24),
    .O(\Execution/ans_ex_mux000037_296 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \Execution/ans_ex_mux000037_F  (
    .I0(A_3_OBUF_11),
    .I1(\Execution/N50 ),
    .I2(A_1_OBUF_9),
    .I3(\Execution/N87 ),
    .O(N231)
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \Execution/ans_ex_mux000037_G  (
    .I0(A_2_OBUF_10),
    .I1(\Execution/N50 ),
    .I2(A_0_OBUF_8),
    .I3(\Execution/N87 ),
    .O(N232)
  );
  LUT4 #(
    .INIT ( 16'hFBFF ))
  \Execution/_old_ans_ex_15<0>11  (
    .I0(\DepCheckBlock/Op_ex [0]),
    .I1(\DepCheckBlock/Op_ex [1]),
    .I2(\DepCheckBlock/Op_ex [3]),
    .I3(\DepCheckBlock/Op_ex [2]),
    .O(\Execution/_old_ans_ex_15<0>1 )
  );
  MUXF5   \Execution/_old_ans_ex_15<0>1_f5  (
    .I0(N1),
    .I1(\Execution/_old_ans_ex_15<0>1 ),
    .S(\DepCheckBlock/Op_ex [4]),
    .O(\Execution/N11 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Execution/ans_ex_mux000011  (
    .I0(\DepCheckBlock/Op_ex [3]),
    .I1(\DepCheckBlock/Op_ex [2]),
    .O(\Execution/ans_ex_mux00001 )
  );
  LUT3 #(
    .INIT ( 8'h40 ))
  \Execution/ans_ex_mux000012  (
    .I0(\DepCheckBlock/Op_ex [2]),
    .I1(\DepCheckBlock/Op_ex [1]),
    .I2(\DepCheckBlock/Op_ex [0]),
    .O(\Execution/ans_ex_mux000011_290 )
  );
  MUXF5   \Execution/ans_ex_mux00001_f5  (
    .I0(\Execution/ans_ex_mux000011_290 ),
    .I1(\Execution/ans_ex_mux00001 ),
    .S(\DepCheckBlock/Op_ex [4]),
    .O(\Execution/N01 )
  );
  LUT4 #(
    .INIT ( 16'h7FFF ))
  \CG/Mcount_Counter_xor<4>111  (
    .I0(\CG/Counter [3]),
    .I1(\CG/Counter [2]),
    .I2(\CG/Counter [1]),
    .I3(\CG/Counter [0]),
    .O(\CG/Mcount_Counter_xor<4>11 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \CG/Mcount_Counter_xor<4>112  (
    .I0(\CG/Counter [2]),
    .I1(\CG/Counter [1]),
    .I2(\CG/Counter [0]),
    .I3(\CG/Counter [3]),
    .O(\CG/Mcount_Counter_xor<4>111_38 )
  );
  MUXF5   \CG/Mcount_Counter_xor<4>11_f5  (
    .I0(\CG/Mcount_Counter_xor<4>111_38 ),
    .I1(\CG/Mcount_Counter_xor<4>11 ),
    .S(\CG/Counter [4]),
    .O(Result[4])
  );
  LUT4 #(
    .INIT ( 16'h0002 ))
  \CG/Output_Clk_cmp_eq00001  (
    .I0(\CG/Counter [3]),
    .I1(\CG/Counter [1]),
    .I2(\CG/Counter [0]),
    .I3(\CG/Counter [2]),
    .O(\CG/Output_Clk_cmp_eq00001_42 )
  );
  MUXF5   \CG/Output_Clk_cmp_eq0000_f5  (
    .I0(N0),
    .I1(\CG/Output_Clk_cmp_eq00001_42 ),
    .S(\CG/Counter [4]),
    .O(\CG/Output_Clk_cmp_eq0000 )
  );
  LUT4 #(
    .INIT ( 16'h0002 ))
  \ClockBlock/Ld121  (
    .I0(Ins[17]),
    .I1(\ClockBlock/D2/q_62 ),
    .I2(Ins[16]),
    .I3(Ins[18]),
    .O(\ClockBlock/Ld12 )
  );
  MUXF5   \ClockBlock/Ld12_f5  (
    .I0(N0),
    .I1(\ClockBlock/Ld12 ),
    .S(Ins[19]),
    .O(\ClockBlock/Ld1 )
  );
  LUT4 #(
    .INIT ( 16'hFF80 ))
  \PCIM/Temp<7>11191  (
    .I0(\PCIM/D1/Q [5]),
    .I1(\PCIM/D1/Q [4]),
    .I2(\PCIM/D1/Q [6]),
    .I3(\PCIM/D1/Q [7]),
    .O(\PCIM/Temp<7>11191_557 )
  );
  LUT4 #(
    .INIT ( 16'h4CCC ))
  \PCIM/Temp<7>11192  (
    .I0(\PCIM/D1/Q [5]),
    .I1(\PCIM/D1/Q [7]),
    .I2(\PCIM/D1/Q [4]),
    .I3(\PCIM/D1/Q [6]),
    .O(\PCIM/Temp<7>11192_558 )
  );
  MUXF5   \PCIM/Temp<7>1119_f5  (
    .I0(\PCIM/Temp<7>11192_558 ),
    .I1(\PCIM/Temp<7>11191_557 ),
    .S(\PCIM/Temp<7>139_559 ),
    .O(\PCIM/Temp<7>1119 )
  );
  LUT2_D #(
    .INIT ( 4'h8 ))
  \Execution/ans_ex_mux0003151  (
    .I0(\DepCheckBlock/Op_ex [1]),
    .I1(A_7_OBUF_15),
    .LO(N233),
    .O(\Execution/N49 )
  );
  LUT4_L #(
    .INIT ( 16'hC8C0 ))
  \Execution/ans_ex_mux000438  (
    .I0(\Execution/ans_ex_mux0001152 ),
    .I1(\Execution/ans_ex_mux000361 ),
    .I2(\Execution/ans_ex_mux000428_342 ),
    .I3(\Execution/N14 ),
    .LO(\Execution/ans_ex_mux000438_343 )
  );
  LUT4_L #(
    .INIT ( 16'hCA00 ))
  \Execution/ans_ex_mux0004123  (
    .I0(\Execution/N51 ),
    .I1(\Execution/N52 ),
    .I2(B_3_OBUF_27),
    .I3(\Execution/ans_ex_mux0004110_338 ),
    .LO(\Execution/ans_ex_mux0004123_339 )
  );
  LUT2_L #(
    .INIT ( 4'hE ))
  \Execution/ans_ex_mux0003116  (
    .I0(\DepCheckBlock/Op_ex [0]),
    .I1(A_4_OBUF_12),
    .LO(\Execution/ans_ex_mux0003116_327 )
  );
  LUT4_D #(
    .INIT ( 16'hFFAE ))
  \Execution/ans_ex_mux0002160  (
    .I0(\Execution/ans_ex_mux00024_321 ),
    .I1(\Execution/ans_ex_mux0002133_316 ),
    .I2(\DepCheckBlock/Op_ex [4]),
    .I3(\Execution/ans_ex_mux000255_322 ),
    .LO(N234),
    .O(\Execution/ans_ex_mux0002 )
  );
  LUT4_D #(
    .INIT ( 16'hF888 ))
  \Execution/ans_ex_mux00014  (
    .I0(\Execution/N01 ),
    .I1(\Execution/Register [6]),
    .I2(A_6_OBUF_14),
    .I3(\Execution/N25 ),
    .LO(N235),
    .O(\Execution/ans_ex_mux00014_308 )
  );
  LUT4_L #(
    .INIT ( 16'hFEFC ))
  \Execution/ans_ex_mux000144  (
    .I0(\Execution/N42 ),
    .I1(\Execution/ans_ex_mux000114_305 ),
    .I2(\Execution/ans_ex_mux000128_307 ),
    .I3(\Execution/AUX_8_addsub0000 [6]),
    .LO(\Execution/ans_ex_mux000144_309 )
  );
  LUT2_L #(
    .INIT ( 4'hE ))
  \Execution/ans_ex_mux000615  (
    .I0(\DepCheckBlock/Op_ex [0]),
    .I1(A_1_OBUF_9),
    .LO(\Execution/ans_ex_mux000615_363 )
  );
  LUT4_L #(
    .INIT ( 16'hFFEC ))
  \Execution/ans_ex_mux000644  (
    .I0(\Execution/N42 ),
    .I1(\Execution/ans_ex_mux000614_361 ),
    .I2(\Execution/AUX_8_addsub0000 [1]),
    .I3(\Execution/ans_ex_mux000628_365 ),
    .LO(\Execution/ans_ex_mux000644_367 )
  );
  LUT2_L #(
    .INIT ( 4'hE ))
  \Execution/ans_ex_mux000515  (
    .I0(\DepCheckBlock/Op_ex [0]),
    .I1(A_2_OBUF_10),
    .LO(\Execution/ans_ex_mux000515_350 )
  );
  LUT4_L #(
    .INIT ( 16'hFFF8 ))
  \Execution/ans_ex_mux000544  (
    .I0(\Execution/N42 ),
    .I1(\Execution/AUX_8_addsub0000 [2]),
    .I2(\Execution/ans_ex_mux000514_348 ),
    .I3(\Execution/ans_ex_mux000528_351 ),
    .LO(\Execution/ans_ex_mux000544_353 )
  );
  LUT4_L #(
    .INIT ( 16'hAAA8 ))
  \Execution/ans_ex_mux000060  (
    .I0(\Execution/ans_ex_mux0001152 ),
    .I1(\Execution/ans_ex_mux000038_297 ),
    .I2(\Execution/ans_ex_mux000048_299 ),
    .I3(\Execution/ans_ex_mux000037_296 ),
    .LO(\Execution/ans_ex_mux000060_300 )
  );
  LUT4_D #(
    .INIT ( 16'h4744 ))
  \Execution/ans_ex_mux00031101  (
    .I0(N29),
    .I1(\DepCheckBlock/imm_sel_164 ),
    .I2(\RF/Temp_B [2]),
    .I3(\RF/Temp_B [1]),
    .LO(N236),
    .O(\Execution/ans_ex_mux000361 )
  );
  LUT4_D #(
    .INIT ( 16'hFF1B ))
  \Execution/ans_ex_mux0000263  (
    .I0(\Execution/ans_ex_mux0000193_294 ),
    .I1(N52),
    .I2(N53),
    .I3(\Execution/ans_ex_mux000092_301 ),
    .LO(N237),
    .O(\Execution/ans_ex_mux0000 )
  );
  LUT4_D #(
    .INIT ( 16'hF888 ))
  \Execution/ans_ex_mux0002363  (
    .I0(\Execution/ans_ex_mux0002317_317 ),
    .I1(\DepCheckBlock/Op_ex [2]),
    .I2(\Execution/ans_ex_mux0002350 ),
    .I3(\Execution/ans_ex_mux0002343_318 ),
    .LO(N238),
    .O(\Execution/N25 )
  );
  LUT4_D #(
    .INIT ( 16'h4474 ))
  \Execution/ans_ex_mux0003161  (
    .I0(N67),
    .I1(\DepCheckBlock/imm_sel_164 ),
    .I2(\RF/Temp_B [2]),
    .I3(\RF/Temp_B [1]),
    .LO(N239),
    .O(\Execution/N50 )
  );
  LUT4_L #(
    .INIT ( 16'hFFFE ))
  \Execution/Flag_1_not00012  (
    .I0(\Execution/ans_ex_mux000172_310 ),
    .I1(N94),
    .I2(\Execution/ans_ex_mux0003 ),
    .I3(\Execution/ans_ex_mux0004 ),
    .LO(\Execution/Flag_1_not00012_216 )
  );
  LUT3_L #(
    .INIT ( 8'hEC ))
  \Execution/ans_ex_mux0002133_SW0_SW0  (
    .I0(\Execution/N42 ),
    .I1(\Execution/ans_ex_mux000284_323 ),
    .I2(\Execution/AUX_8_addsub0000 [5]),
    .LO(N99)
  );
  LUT4_L #(
    .INIT ( 16'h80C0 ))
  \Execution/ans_ex_mux0006116  (
    .I0(\DepCheckBlock/Op_ex [0]),
    .I1(N107),
    .I2(B_2_OBUF_26),
    .I3(B_0_OBUF_24),
    .LO(\Execution/ans_ex_mux0006116_359 )
  );
  LUT4_L #(
    .INIT ( 16'hFFC8 ))
  \Execution/ans_ex_mux0006172_SW1  (
    .I0(\Execution/ans_ex_mux0006169_364 ),
    .I1(\Execution/ans_ex_mux0002350 ),
    .I2(\DepCheckBlock/Op_ex [1]),
    .I3(\Execution/ans_ex_mux00064_366 ),
    .LO(N123)
  );
  LUT4_D #(
    .INIT ( 16'h8000 ))
  \Execution/ans_ex_mux0005151  (
    .I0(\DepCheckBlock/Op_ex [0]),
    .I1(\DepCheckBlock/Op_ex [1]),
    .I2(A_7_OBUF_15),
    .I3(B_2_OBUF_26),
    .LO(N240),
    .O(\Execution/N83 )
  );
  LUT4_D #(
    .INIT ( 16'hFFEC ))
  \Execution/ans_ex_mux0007262  (
    .I0(\DepCheckBlock/Op_ex [4]),
    .I1(\Execution/ans_ex_mux00070_370 ),
    .I2(N127),
    .I3(\Execution/ans_ex_mux0007110_371 ),
    .LO(N241),
    .O(\Execution/ans_ex_mux0007 )
  );
  LUT4_D #(
    .INIT ( 16'hBBB8 ))
  \Execution/ans_ex_mux0002121  (
    .I0(N131),
    .I1(\DepCheckBlock/imm_sel_164 ),
    .I2(\RF/Temp_B [2]),
    .I3(\RF/Temp_B [1]),
    .LO(N242),
    .O(\Execution/N45 )
  );
  LUT4_L #(
    .INIT ( 16'hFFE2 ))
  \Execution/ans_ex_mux0007194  (
    .I0(N142),
    .I1(B_1_OBUF_25),
    .I2(N143),
    .I3(\Execution/ans_ex_mux0007159_373 ),
    .LO(\Execution/ans_ex_mux0007194_374 )
  );
  LUT4_L #(
    .INIT ( 16'hEAC0 ))
  \Execution/ans_ex_mux000364_SW1  (
    .I0(\DepCheckBlock/Op_ex [1]),
    .I1(\Execution/ans_ex_mux0001152 ),
    .I2(A_1_OBUF_9),
    .I3(A_7_OBUF_15),
    .LO(N146)
  );
  LUT4_L #(
    .INIT ( 16'hD080 ))
  \Execution/ans_ex_mux0006111_SW0  (
    .I0(\DepCheckBlock/imm_sel_164 ),
    .I1(\DepCheckBlock/imm [0]),
    .I2(A_3_OBUF_11),
    .I3(\RF/Temp_B [0]),
    .LO(N148)
  );
  LUT4_D #(
    .INIT ( 16'h4700 ))
  \Execution/ans_ex_mux0005121  (
    .I0(\DepCheckBlock/imm [0]),
    .I1(\DepCheckBlock/imm_sel_164 ),
    .I2(\RF/Temp_B [0]),
    .I3(\Execution/ans_ex_mux000361 ),
    .LO(N243),
    .O(\Execution/N43 )
  );
  LUT4_L #(
    .INIT ( 16'hAA80 ))
  \Execution/ans_ex_mux0002361  (
    .I0(\Execution/ans_ex_mux0001152 ),
    .I1(\Execution/ans_ex_mux000361 ),
    .I2(\Execution/N28 ),
    .I3(N155),
    .LO(\Execution/ans_ex_mux0002361_320 )
  );
  LUT4_L #(
    .INIT ( 16'hFF20 ))
  \Execution/ans_ex_mux000317  (
    .I0(A_0_OBUF_8),
    .I1(N159),
    .I2(\Execution/N50 ),
    .I3(\Execution/N83 ),
    .LO(\Execution/ans_ex_mux000317_330 )
  );
  LUT2_L #(
    .INIT ( 4'h9 ))
  \Execution/ans_ex_mux000128_SW0  (
    .I0(\DepCheckBlock/Op_ex [1]),
    .I1(B_6_OBUF_30),
    .LO(N203)
  );
  LUT3_L #(
    .INIT ( 8'h60 ))
  \Execution/ans_ex_mux000285_SW0  (
    .I0(B_5_OBUF_29),
    .I1(\DepCheckBlock/Op_ex [1]),
    .I2(\DepCheckBlock/Op_ex [2]),
    .LO(N90)
  );
  LUT4_L #(
    .INIT ( 16'h4440 ))
  \Execution/ans_ex_mux0001189_SW0_SW0  (
    .I0(\DepCheckBlock/Op_ex [1]),
    .I1(\DepCheckBlock/Op_ex [0]),
    .I2(\Execution/ans_ex_mux0001137_304 ),
    .I3(\Execution/ans_ex_mux0001125_303 ),
    .LO(N125)
  );
  LUT4_L #(
    .INIT ( 16'hFFE2 ))
  \Execution/ans_ex_mux000025_SW0  (
    .I0(\RF/Temp_B [0]),
    .I1(\DepCheckBlock/imm_sel_164 ),
    .I2(\DepCheckBlock/imm [0]),
    .I3(\Execution/N45 ),
    .LO(N207)
  );
  LUT3_L #(
    .INIT ( 8'hAC ))
  \Execution/ans_ex_mux000776_SW01  (
    .I0(\DepCheckBlock/Op_ex [4]),
    .I1(N171),
    .I2(\Execution/ans_ex_mux000749_377 ),
    .LO(N96)
  );
  Data_Memory   \DM/DM1  (
    .clka(Clk4_sim_OBUF_52),
    .ena(\Execution/Mem_en_ex_245 ),
    .wea({\Execution/Mem_rw_ex_247 }),
    .addra({\Execution/Register [7], \Execution/Register [6], \Execution/Register [5], \Execution/Register [4], \Execution/Register [3], 
\Execution/Register [2], \Execution/Register [1], \Execution/Register [0]}),
    .dina({\Execution/B_bypass [7], \Execution/B_bypass [6], \Execution/B_bypass [5], \Execution/B_bypass [4], \Execution/B_bypass [3], 
\Execution/B_bypass [2], \Execution/B_bypass [1], \Execution/B_bypass [0]}),
    .douta({\DM/ans_dm [7], \DM/ans_dm [6], \DM/ans_dm [5], \DM/ans_dm [4], \DM/ans_dm [3], \DM/ans_dm [2], \DM/ans_dm [1], \DM/ans_dm [0]})
  );
  Instruction_Memory   \PCIM/ysda  (
    .clka(Clk1_sim_OBUF_45),
    .ena(N1),
    .addra({\PCIM/Temp [7], \PCIM/Temp [6], \PCIM/Temp [5], \PCIM/Temp [4], \PCIM/Temp [3], \PCIM/Temp [2], \PCIM/Temp [1], \PCIM/Temp [0]}),
    .douta({Ins[19], Ins[18], Ins[17], Ins[16], Ins[15], Ins[14], Ins[13], Ins[12], Ins[11], Ins[10], Ins[9], Ins[8], Ins[7], Ins[6], Ins[5], Ins[4], 
Ins[3], Ins[2], Ins[1], Ins[0]})
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
