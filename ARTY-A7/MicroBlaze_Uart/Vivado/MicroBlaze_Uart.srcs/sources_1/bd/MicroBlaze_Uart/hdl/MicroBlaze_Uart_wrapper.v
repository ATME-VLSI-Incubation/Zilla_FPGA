//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Tue Jan 18 17:24:58 2022
//Host        : LAPTOP-M63G1K35 running 64-bit major release  (build 9200)
//Command     : generate_target MicroBlaze_Uart_wrapper.bd
//Design      : MicroBlaze_Uart_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module MicroBlaze_Uart_wrapper
   (diff_clock_rtl_clk_n,
    diff_clock_rtl_clk_p,
    reset,
    usb_uart_rxd,
    usb_uart_txd);
  input diff_clock_rtl_clk_n;
  input diff_clock_rtl_clk_p;
  input reset;
  input usb_uart_rxd;
  output usb_uart_txd;

  wire diff_clock_rtl_clk_n;
  wire diff_clock_rtl_clk_p;
  wire reset;
  wire usb_uart_rxd;
  wire usb_uart_txd;

  MicroBlaze_Uart MicroBlaze_Uart_i
       (.diff_clock_rtl_clk_n(diff_clock_rtl_clk_n),
        .diff_clock_rtl_clk_p(diff_clock_rtl_clk_p),
        .reset(reset),
        .usb_uart_rxd(usb_uart_rxd),
        .usb_uart_txd(usb_uart_txd));
endmodule
