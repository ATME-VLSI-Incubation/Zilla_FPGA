// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Mon Jan 17 14:08:32 2022
// Host        : LAPTOP-M63G1K35 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/FPGA_Projects/arty_uart_calculator/arty_uart_calculator.srcs/sources_1/bd/arty_uart_calculator/ip/arty_uart_calculator_clk_wiz_1_0/arty_uart_calculator_clk_wiz_1_0_stub.v
// Design      : arty_uart_calculator_clk_wiz_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module arty_uart_calculator_clk_wiz_1_0(clk_out1, reset, locked, clk_in1_p, clk_in1_n)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,reset,locked,clk_in1_p,clk_in1_n" */;
  output clk_out1;
  input reset;
  output locked;
  input clk_in1_p;
  input clk_in1_n;
endmodule
