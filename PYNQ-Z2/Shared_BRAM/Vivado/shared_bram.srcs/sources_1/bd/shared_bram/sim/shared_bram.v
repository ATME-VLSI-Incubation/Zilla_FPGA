//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
//Date        : Mon Oct 25 20:07:57 2021
//Host        : compute-srv3.eda.atme.in running 64-bit CentOS Linux release 7.9.2009 (Core)
//Command     : generate_target shared_bram.bd
//Design      : shared_bram
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module m00_couplers_imp_12W1KYX
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]m00_couplers_to_m00_couplers_ARADDR;
  wire m00_couplers_to_m00_couplers_ARREADY;
  wire m00_couplers_to_m00_couplers_ARVALID;
  wire [31:0]m00_couplers_to_m00_couplers_AWADDR;
  wire m00_couplers_to_m00_couplers_AWREADY;
  wire m00_couplers_to_m00_couplers_AWVALID;
  wire m00_couplers_to_m00_couplers_BREADY;
  wire [1:0]m00_couplers_to_m00_couplers_BRESP;
  wire m00_couplers_to_m00_couplers_BVALID;
  wire [31:0]m00_couplers_to_m00_couplers_RDATA;
  wire m00_couplers_to_m00_couplers_RREADY;
  wire [1:0]m00_couplers_to_m00_couplers_RRESP;
  wire m00_couplers_to_m00_couplers_RVALID;
  wire [31:0]m00_couplers_to_m00_couplers_WDATA;
  wire m00_couplers_to_m00_couplers_WREADY;
  wire [3:0]m00_couplers_to_m00_couplers_WSTRB;
  wire m00_couplers_to_m00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m00_couplers_to_m00_couplers_ARADDR;
  assign M_AXI_arvalid = m00_couplers_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m00_couplers_to_m00_couplers_AWADDR;
  assign M_AXI_awvalid = m00_couplers_to_m00_couplers_AWVALID;
  assign M_AXI_bready = m00_couplers_to_m00_couplers_BREADY;
  assign M_AXI_rready = m00_couplers_to_m00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m00_couplers_to_m00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m00_couplers_to_m00_couplers_WSTRB;
  assign M_AXI_wvalid = m00_couplers_to_m00_couplers_WVALID;
  assign S_AXI_arready = m00_couplers_to_m00_couplers_ARREADY;
  assign S_AXI_awready = m00_couplers_to_m00_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m00_couplers_to_m00_couplers_BRESP;
  assign S_AXI_bvalid = m00_couplers_to_m00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m00_couplers_to_m00_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m00_couplers_to_m00_couplers_RRESP;
  assign S_AXI_rvalid = m00_couplers_to_m00_couplers_RVALID;
  assign S_AXI_wready = m00_couplers_to_m00_couplers_WREADY;
  assign m00_couplers_to_m00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m00_couplers_to_m00_couplers_ARREADY = M_AXI_arready;
  assign m00_couplers_to_m00_couplers_ARVALID = S_AXI_arvalid;
  assign m00_couplers_to_m00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m00_couplers_to_m00_couplers_AWREADY = M_AXI_awready;
  assign m00_couplers_to_m00_couplers_AWVALID = S_AXI_awvalid;
  assign m00_couplers_to_m00_couplers_BREADY = S_AXI_bready;
  assign m00_couplers_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign m00_couplers_to_m00_couplers_BVALID = M_AXI_bvalid;
  assign m00_couplers_to_m00_couplers_RDATA = M_AXI_rdata[31:0];
  assign m00_couplers_to_m00_couplers_RREADY = S_AXI_rready;
  assign m00_couplers_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign m00_couplers_to_m00_couplers_RVALID = M_AXI_rvalid;
  assign m00_couplers_to_m00_couplers_WDATA = S_AXI_wdata[31:0];
  assign m00_couplers_to_m00_couplers_WREADY = M_AXI_wready;
  assign m00_couplers_to_m00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m00_couplers_to_m00_couplers_WVALID = S_AXI_wvalid;
endmodule

module m00_couplers_imp_TRJDIH
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [12:0]M_AXI_arid;
  output [7:0]M_AXI_arlen;
  output [0:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  input [0:0]M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [12:0]M_AXI_awid;
  output [7:0]M_AXI_awlen;
  output [0:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  input [0:0]M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output [0:0]M_AXI_awvalid;
  input [12:0]M_AXI_bid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  input [12:0]M_AXI_rid;
  input [0:0]M_AXI_rlast;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  output [0:0]M_AXI_wlast;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [12:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  output [0:0]S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [12:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  output [0:0]S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input [0:0]S_AXI_awvalid;
  output [12:0]S_AXI_bid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [12:0]S_AXI_rid;
  output [0:0]S_AXI_rlast;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input [0:0]S_AXI_wlast;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m00_couplers_to_m00_couplers_ARADDR;
  wire [1:0]m00_couplers_to_m00_couplers_ARBURST;
  wire [3:0]m00_couplers_to_m00_couplers_ARCACHE;
  wire [12:0]m00_couplers_to_m00_couplers_ARID;
  wire [7:0]m00_couplers_to_m00_couplers_ARLEN;
  wire [0:0]m00_couplers_to_m00_couplers_ARLOCK;
  wire [2:0]m00_couplers_to_m00_couplers_ARPROT;
  wire [0:0]m00_couplers_to_m00_couplers_ARREADY;
  wire [2:0]m00_couplers_to_m00_couplers_ARSIZE;
  wire [0:0]m00_couplers_to_m00_couplers_ARVALID;
  wire [31:0]m00_couplers_to_m00_couplers_AWADDR;
  wire [1:0]m00_couplers_to_m00_couplers_AWBURST;
  wire [3:0]m00_couplers_to_m00_couplers_AWCACHE;
  wire [12:0]m00_couplers_to_m00_couplers_AWID;
  wire [7:0]m00_couplers_to_m00_couplers_AWLEN;
  wire [0:0]m00_couplers_to_m00_couplers_AWLOCK;
  wire [2:0]m00_couplers_to_m00_couplers_AWPROT;
  wire [0:0]m00_couplers_to_m00_couplers_AWREADY;
  wire [2:0]m00_couplers_to_m00_couplers_AWSIZE;
  wire [0:0]m00_couplers_to_m00_couplers_AWVALID;
  wire [12:0]m00_couplers_to_m00_couplers_BID;
  wire [0:0]m00_couplers_to_m00_couplers_BREADY;
  wire [1:0]m00_couplers_to_m00_couplers_BRESP;
  wire [0:0]m00_couplers_to_m00_couplers_BVALID;
  wire [31:0]m00_couplers_to_m00_couplers_RDATA;
  wire [12:0]m00_couplers_to_m00_couplers_RID;
  wire [0:0]m00_couplers_to_m00_couplers_RLAST;
  wire [0:0]m00_couplers_to_m00_couplers_RREADY;
  wire [1:0]m00_couplers_to_m00_couplers_RRESP;
  wire [0:0]m00_couplers_to_m00_couplers_RVALID;
  wire [31:0]m00_couplers_to_m00_couplers_WDATA;
  wire [0:0]m00_couplers_to_m00_couplers_WLAST;
  wire [0:0]m00_couplers_to_m00_couplers_WREADY;
  wire [3:0]m00_couplers_to_m00_couplers_WSTRB;
  wire [0:0]m00_couplers_to_m00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m00_couplers_to_m00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = m00_couplers_to_m00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = m00_couplers_to_m00_couplers_ARCACHE;
  assign M_AXI_arid[12:0] = m00_couplers_to_m00_couplers_ARID;
  assign M_AXI_arlen[7:0] = m00_couplers_to_m00_couplers_ARLEN;
  assign M_AXI_arlock[0] = m00_couplers_to_m00_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = m00_couplers_to_m00_couplers_ARPROT;
  assign M_AXI_arsize[2:0] = m00_couplers_to_m00_couplers_ARSIZE;
  assign M_AXI_arvalid[0] = m00_couplers_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m00_couplers_to_m00_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = m00_couplers_to_m00_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = m00_couplers_to_m00_couplers_AWCACHE;
  assign M_AXI_awid[12:0] = m00_couplers_to_m00_couplers_AWID;
  assign M_AXI_awlen[7:0] = m00_couplers_to_m00_couplers_AWLEN;
  assign M_AXI_awlock[0] = m00_couplers_to_m00_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = m00_couplers_to_m00_couplers_AWPROT;
  assign M_AXI_awsize[2:0] = m00_couplers_to_m00_couplers_AWSIZE;
  assign M_AXI_awvalid[0] = m00_couplers_to_m00_couplers_AWVALID;
  assign M_AXI_bready[0] = m00_couplers_to_m00_couplers_BREADY;
  assign M_AXI_rready[0] = m00_couplers_to_m00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m00_couplers_to_m00_couplers_WDATA;
  assign M_AXI_wlast[0] = m00_couplers_to_m00_couplers_WLAST;
  assign M_AXI_wstrb[3:0] = m00_couplers_to_m00_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m00_couplers_to_m00_couplers_WVALID;
  assign S_AXI_arready[0] = m00_couplers_to_m00_couplers_ARREADY;
  assign S_AXI_awready[0] = m00_couplers_to_m00_couplers_AWREADY;
  assign S_AXI_bid[12:0] = m00_couplers_to_m00_couplers_BID;
  assign S_AXI_bresp[1:0] = m00_couplers_to_m00_couplers_BRESP;
  assign S_AXI_bvalid[0] = m00_couplers_to_m00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m00_couplers_to_m00_couplers_RDATA;
  assign S_AXI_rid[12:0] = m00_couplers_to_m00_couplers_RID;
  assign S_AXI_rlast[0] = m00_couplers_to_m00_couplers_RLAST;
  assign S_AXI_rresp[1:0] = m00_couplers_to_m00_couplers_RRESP;
  assign S_AXI_rvalid[0] = m00_couplers_to_m00_couplers_RVALID;
  assign S_AXI_wready[0] = m00_couplers_to_m00_couplers_WREADY;
  assign m00_couplers_to_m00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m00_couplers_to_m00_couplers_ARBURST = S_AXI_arburst[1:0];
  assign m00_couplers_to_m00_couplers_ARCACHE = S_AXI_arcache[3:0];
  assign m00_couplers_to_m00_couplers_ARID = S_AXI_arid[12:0];
  assign m00_couplers_to_m00_couplers_ARLEN = S_AXI_arlen[7:0];
  assign m00_couplers_to_m00_couplers_ARLOCK = S_AXI_arlock[0];
  assign m00_couplers_to_m00_couplers_ARPROT = S_AXI_arprot[2:0];
  assign m00_couplers_to_m00_couplers_ARREADY = M_AXI_arready[0];
  assign m00_couplers_to_m00_couplers_ARSIZE = S_AXI_arsize[2:0];
  assign m00_couplers_to_m00_couplers_ARVALID = S_AXI_arvalid[0];
  assign m00_couplers_to_m00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m00_couplers_to_m00_couplers_AWBURST = S_AXI_awburst[1:0];
  assign m00_couplers_to_m00_couplers_AWCACHE = S_AXI_awcache[3:0];
  assign m00_couplers_to_m00_couplers_AWID = S_AXI_awid[12:0];
  assign m00_couplers_to_m00_couplers_AWLEN = S_AXI_awlen[7:0];
  assign m00_couplers_to_m00_couplers_AWLOCK = S_AXI_awlock[0];
  assign m00_couplers_to_m00_couplers_AWPROT = S_AXI_awprot[2:0];
  assign m00_couplers_to_m00_couplers_AWREADY = M_AXI_awready[0];
  assign m00_couplers_to_m00_couplers_AWSIZE = S_AXI_awsize[2:0];
  assign m00_couplers_to_m00_couplers_AWVALID = S_AXI_awvalid[0];
  assign m00_couplers_to_m00_couplers_BID = M_AXI_bid[12:0];
  assign m00_couplers_to_m00_couplers_BREADY = S_AXI_bready[0];
  assign m00_couplers_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign m00_couplers_to_m00_couplers_BVALID = M_AXI_bvalid[0];
  assign m00_couplers_to_m00_couplers_RDATA = M_AXI_rdata[31:0];
  assign m00_couplers_to_m00_couplers_RID = M_AXI_rid[12:0];
  assign m00_couplers_to_m00_couplers_RLAST = M_AXI_rlast[0];
  assign m00_couplers_to_m00_couplers_RREADY = S_AXI_rready[0];
  assign m00_couplers_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign m00_couplers_to_m00_couplers_RVALID = M_AXI_rvalid[0];
  assign m00_couplers_to_m00_couplers_WDATA = S_AXI_wdata[31:0];
  assign m00_couplers_to_m00_couplers_WLAST = S_AXI_wlast[0];
  assign m00_couplers_to_m00_couplers_WREADY = M_AXI_wready[0];
  assign m00_couplers_to_m00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m00_couplers_to_m00_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m01_couplers_imp_5J9RSN
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m01_couplers_to_m01_couplers_ARADDR;
  wire [2:0]m01_couplers_to_m01_couplers_ARPROT;
  wire [0:0]m01_couplers_to_m01_couplers_ARREADY;
  wire [0:0]m01_couplers_to_m01_couplers_ARVALID;
  wire [31:0]m01_couplers_to_m01_couplers_AWADDR;
  wire [2:0]m01_couplers_to_m01_couplers_AWPROT;
  wire [0:0]m01_couplers_to_m01_couplers_AWREADY;
  wire [0:0]m01_couplers_to_m01_couplers_AWVALID;
  wire [0:0]m01_couplers_to_m01_couplers_BREADY;
  wire [1:0]m01_couplers_to_m01_couplers_BRESP;
  wire [0:0]m01_couplers_to_m01_couplers_BVALID;
  wire [31:0]m01_couplers_to_m01_couplers_RDATA;
  wire [0:0]m01_couplers_to_m01_couplers_RREADY;
  wire [1:0]m01_couplers_to_m01_couplers_RRESP;
  wire [0:0]m01_couplers_to_m01_couplers_RVALID;
  wire [31:0]m01_couplers_to_m01_couplers_WDATA;
  wire [0:0]m01_couplers_to_m01_couplers_WREADY;
  wire [3:0]m01_couplers_to_m01_couplers_WSTRB;
  wire [0:0]m01_couplers_to_m01_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m01_couplers_to_m01_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = m01_couplers_to_m01_couplers_ARPROT;
  assign M_AXI_arvalid[0] = m01_couplers_to_m01_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m01_couplers_to_m01_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = m01_couplers_to_m01_couplers_AWPROT;
  assign M_AXI_awvalid[0] = m01_couplers_to_m01_couplers_AWVALID;
  assign M_AXI_bready[0] = m01_couplers_to_m01_couplers_BREADY;
  assign M_AXI_rready[0] = m01_couplers_to_m01_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m01_couplers_to_m01_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m01_couplers_to_m01_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m01_couplers_to_m01_couplers_WVALID;
  assign S_AXI_arready[0] = m01_couplers_to_m01_couplers_ARREADY;
  assign S_AXI_awready[0] = m01_couplers_to_m01_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m01_couplers_to_m01_couplers_BRESP;
  assign S_AXI_bvalid[0] = m01_couplers_to_m01_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m01_couplers_to_m01_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m01_couplers_to_m01_couplers_RRESP;
  assign S_AXI_rvalid[0] = m01_couplers_to_m01_couplers_RVALID;
  assign S_AXI_wready[0] = m01_couplers_to_m01_couplers_WREADY;
  assign m01_couplers_to_m01_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m01_couplers_to_m01_couplers_ARPROT = S_AXI_arprot[2:0];
  assign m01_couplers_to_m01_couplers_ARREADY = M_AXI_arready[0];
  assign m01_couplers_to_m01_couplers_ARVALID = S_AXI_arvalid[0];
  assign m01_couplers_to_m01_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m01_couplers_to_m01_couplers_AWPROT = S_AXI_awprot[2:0];
  assign m01_couplers_to_m01_couplers_AWREADY = M_AXI_awready[0];
  assign m01_couplers_to_m01_couplers_AWVALID = S_AXI_awvalid[0];
  assign m01_couplers_to_m01_couplers_BREADY = S_AXI_bready[0];
  assign m01_couplers_to_m01_couplers_BRESP = M_AXI_bresp[1:0];
  assign m01_couplers_to_m01_couplers_BVALID = M_AXI_bvalid[0];
  assign m01_couplers_to_m01_couplers_RDATA = M_AXI_rdata[31:0];
  assign m01_couplers_to_m01_couplers_RREADY = S_AXI_rready[0];
  assign m01_couplers_to_m01_couplers_RRESP = M_AXI_rresp[1:0];
  assign m01_couplers_to_m01_couplers_RVALID = M_AXI_rvalid[0];
  assign m01_couplers_to_m01_couplers_WDATA = S_AXI_wdata[31:0];
  assign m01_couplers_to_m01_couplers_WREADY = M_AXI_wready[0];
  assign m01_couplers_to_m01_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m01_couplers_to_m01_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module microblaze_0_local_memory_imp_Q82XC5
   (DLMB_abus,
    DLMB_addrstrobe,
    DLMB_be,
    DLMB_ce,
    DLMB_readdbus,
    DLMB_readstrobe,
    DLMB_ready,
    DLMB_ue,
    DLMB_wait,
    DLMB_writedbus,
    DLMB_writestrobe,
    ILMB_abus,
    ILMB_addrstrobe,
    ILMB_ce,
    ILMB_readdbus,
    ILMB_readstrobe,
    ILMB_ready,
    ILMB_ue,
    ILMB_wait,
    LMB_Clk,
    SYS_Rst);
  input [0:31]DLMB_abus;
  input DLMB_addrstrobe;
  input [0:3]DLMB_be;
  output DLMB_ce;
  output [0:31]DLMB_readdbus;
  input DLMB_readstrobe;
  output DLMB_ready;
  output DLMB_ue;
  output DLMB_wait;
  input [0:31]DLMB_writedbus;
  input DLMB_writestrobe;
  input [0:31]ILMB_abus;
  input ILMB_addrstrobe;
  output ILMB_ce;
  output [0:31]ILMB_readdbus;
  input ILMB_readstrobe;
  output ILMB_ready;
  output ILMB_ue;
  output ILMB_wait;
  input LMB_Clk;
  input SYS_Rst;

  wire SYS_Rst_1;
  wire microblaze_0_Clk;
  wire [0:31]microblaze_0_dlmb_ABUS;
  wire microblaze_0_dlmb_ADDRSTROBE;
  wire [0:3]microblaze_0_dlmb_BE;
  wire microblaze_0_dlmb_CE;
  wire [0:31]microblaze_0_dlmb_READDBUS;
  wire microblaze_0_dlmb_READSTROBE;
  wire microblaze_0_dlmb_READY;
  wire microblaze_0_dlmb_UE;
  wire microblaze_0_dlmb_WAIT;
  wire [0:31]microblaze_0_dlmb_WRITEDBUS;
  wire microblaze_0_dlmb_WRITESTROBE;
  wire [0:31]microblaze_0_dlmb_bus_ABUS;
  wire microblaze_0_dlmb_bus_ADDRSTROBE;
  wire [0:3]microblaze_0_dlmb_bus_BE;
  wire microblaze_0_dlmb_bus_CE;
  wire [0:31]microblaze_0_dlmb_bus_READDBUS;
  wire microblaze_0_dlmb_bus_READSTROBE;
  wire microblaze_0_dlmb_bus_READY;
  wire microblaze_0_dlmb_bus_UE;
  wire microblaze_0_dlmb_bus_WAIT;
  wire [0:31]microblaze_0_dlmb_bus_WRITEDBUS;
  wire microblaze_0_dlmb_bus_WRITESTROBE;
  wire [0:31]microblaze_0_dlmb_cntlr_ADDR;
  wire microblaze_0_dlmb_cntlr_CLK;
  wire [0:31]microblaze_0_dlmb_cntlr_DIN;
  wire [31:0]microblaze_0_dlmb_cntlr_DOUT;
  wire microblaze_0_dlmb_cntlr_EN;
  wire microblaze_0_dlmb_cntlr_RST;
  wire [0:3]microblaze_0_dlmb_cntlr_WE;
  wire [0:31]microblaze_0_ilmb_ABUS;
  wire microblaze_0_ilmb_ADDRSTROBE;
  wire microblaze_0_ilmb_CE;
  wire [0:31]microblaze_0_ilmb_READDBUS;
  wire microblaze_0_ilmb_READSTROBE;
  wire microblaze_0_ilmb_READY;
  wire microblaze_0_ilmb_UE;
  wire microblaze_0_ilmb_WAIT;
  wire [0:31]microblaze_0_ilmb_bus_ABUS;
  wire microblaze_0_ilmb_bus_ADDRSTROBE;
  wire [0:3]microblaze_0_ilmb_bus_BE;
  wire microblaze_0_ilmb_bus_CE;
  wire [0:31]microblaze_0_ilmb_bus_READDBUS;
  wire microblaze_0_ilmb_bus_READSTROBE;
  wire microblaze_0_ilmb_bus_READY;
  wire microblaze_0_ilmb_bus_UE;
  wire microblaze_0_ilmb_bus_WAIT;
  wire [0:31]microblaze_0_ilmb_bus_WRITEDBUS;
  wire microblaze_0_ilmb_bus_WRITESTROBE;
  wire [0:31]microblaze_0_ilmb_cntlr_ADDR;
  wire microblaze_0_ilmb_cntlr_CLK;
  wire [0:31]microblaze_0_ilmb_cntlr_DIN;
  wire [31:0]microblaze_0_ilmb_cntlr_DOUT;
  wire microblaze_0_ilmb_cntlr_EN;
  wire microblaze_0_ilmb_cntlr_RST;
  wire [0:3]microblaze_0_ilmb_cntlr_WE;

  assign DLMB_ce = microblaze_0_dlmb_CE;
  assign DLMB_readdbus[0:31] = microblaze_0_dlmb_READDBUS;
  assign DLMB_ready = microblaze_0_dlmb_READY;
  assign DLMB_ue = microblaze_0_dlmb_UE;
  assign DLMB_wait = microblaze_0_dlmb_WAIT;
  assign ILMB_ce = microblaze_0_ilmb_CE;
  assign ILMB_readdbus[0:31] = microblaze_0_ilmb_READDBUS;
  assign ILMB_ready = microblaze_0_ilmb_READY;
  assign ILMB_ue = microblaze_0_ilmb_UE;
  assign ILMB_wait = microblaze_0_ilmb_WAIT;
  assign SYS_Rst_1 = SYS_Rst;
  assign microblaze_0_Clk = LMB_Clk;
  assign microblaze_0_dlmb_ABUS = DLMB_abus[0:31];
  assign microblaze_0_dlmb_ADDRSTROBE = DLMB_addrstrobe;
  assign microblaze_0_dlmb_BE = DLMB_be[0:3];
  assign microblaze_0_dlmb_READSTROBE = DLMB_readstrobe;
  assign microblaze_0_dlmb_WRITEDBUS = DLMB_writedbus[0:31];
  assign microblaze_0_dlmb_WRITESTROBE = DLMB_writestrobe;
  assign microblaze_0_ilmb_ABUS = ILMB_abus[0:31];
  assign microblaze_0_ilmb_ADDRSTROBE = ILMB_addrstrobe;
  assign microblaze_0_ilmb_READSTROBE = ILMB_readstrobe;
  (* BMM_INFO_ADDRESS_SPACE = "byte  0x00000000 32 > shared_bram microblaze_0_local_memory/lmb_bram" *) 
  (* KEEP_HIERARCHY = "yes" *) 
  shared_bram_dlmb_bram_if_cntlr_0 dlmb_bram_if_cntlr
       (.BRAM_Addr_A(microblaze_0_dlmb_cntlr_ADDR),
        .BRAM_Clk_A(microblaze_0_dlmb_cntlr_CLK),
        .BRAM_Din_A({microblaze_0_dlmb_cntlr_DOUT[31],microblaze_0_dlmb_cntlr_DOUT[30],microblaze_0_dlmb_cntlr_DOUT[29],microblaze_0_dlmb_cntlr_DOUT[28],microblaze_0_dlmb_cntlr_DOUT[27],microblaze_0_dlmb_cntlr_DOUT[26],microblaze_0_dlmb_cntlr_DOUT[25],microblaze_0_dlmb_cntlr_DOUT[24],microblaze_0_dlmb_cntlr_DOUT[23],microblaze_0_dlmb_cntlr_DOUT[22],microblaze_0_dlmb_cntlr_DOUT[21],microblaze_0_dlmb_cntlr_DOUT[20],microblaze_0_dlmb_cntlr_DOUT[19],microblaze_0_dlmb_cntlr_DOUT[18],microblaze_0_dlmb_cntlr_DOUT[17],microblaze_0_dlmb_cntlr_DOUT[16],microblaze_0_dlmb_cntlr_DOUT[15],microblaze_0_dlmb_cntlr_DOUT[14],microblaze_0_dlmb_cntlr_DOUT[13],microblaze_0_dlmb_cntlr_DOUT[12],microblaze_0_dlmb_cntlr_DOUT[11],microblaze_0_dlmb_cntlr_DOUT[10],microblaze_0_dlmb_cntlr_DOUT[9],microblaze_0_dlmb_cntlr_DOUT[8],microblaze_0_dlmb_cntlr_DOUT[7],microblaze_0_dlmb_cntlr_DOUT[6],microblaze_0_dlmb_cntlr_DOUT[5],microblaze_0_dlmb_cntlr_DOUT[4],microblaze_0_dlmb_cntlr_DOUT[3],microblaze_0_dlmb_cntlr_DOUT[2],microblaze_0_dlmb_cntlr_DOUT[1],microblaze_0_dlmb_cntlr_DOUT[0]}),
        .BRAM_Dout_A(microblaze_0_dlmb_cntlr_DIN),
        .BRAM_EN_A(microblaze_0_dlmb_cntlr_EN),
        .BRAM_Rst_A(microblaze_0_dlmb_cntlr_RST),
        .BRAM_WEN_A(microblaze_0_dlmb_cntlr_WE),
        .LMB_ABus(microblaze_0_dlmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_0_dlmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_0_dlmb_bus_BE),
        .LMB_Clk(microblaze_0_Clk),
        .LMB_ReadStrobe(microblaze_0_dlmb_bus_READSTROBE),
        .LMB_Rst(SYS_Rst_1),
        .LMB_WriteDBus(microblaze_0_dlmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_0_dlmb_bus_WRITESTROBE),
        .Sl_CE(microblaze_0_dlmb_bus_CE),
        .Sl_DBus(microblaze_0_dlmb_bus_READDBUS),
        .Sl_Ready(microblaze_0_dlmb_bus_READY),
        .Sl_UE(microblaze_0_dlmb_bus_UE),
        .Sl_Wait(microblaze_0_dlmb_bus_WAIT));
  shared_bram_dlmb_v10_0 dlmb_v10
       (.LMB_ABus(microblaze_0_dlmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_0_dlmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_0_dlmb_bus_BE),
        .LMB_CE(microblaze_0_dlmb_CE),
        .LMB_Clk(microblaze_0_Clk),
        .LMB_ReadDBus(microblaze_0_dlmb_READDBUS),
        .LMB_ReadStrobe(microblaze_0_dlmb_bus_READSTROBE),
        .LMB_Ready(microblaze_0_dlmb_READY),
        .LMB_UE(microblaze_0_dlmb_UE),
        .LMB_Wait(microblaze_0_dlmb_WAIT),
        .LMB_WriteDBus(microblaze_0_dlmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_0_dlmb_bus_WRITESTROBE),
        .M_ABus(microblaze_0_dlmb_ABUS),
        .M_AddrStrobe(microblaze_0_dlmb_ADDRSTROBE),
        .M_BE(microblaze_0_dlmb_BE),
        .M_DBus(microblaze_0_dlmb_WRITEDBUS),
        .M_ReadStrobe(microblaze_0_dlmb_READSTROBE),
        .M_WriteStrobe(microblaze_0_dlmb_WRITESTROBE),
        .SYS_Rst(SYS_Rst_1),
        .Sl_CE(microblaze_0_dlmb_bus_CE),
        .Sl_DBus(microblaze_0_dlmb_bus_READDBUS),
        .Sl_Ready(microblaze_0_dlmb_bus_READY),
        .Sl_UE(microblaze_0_dlmb_bus_UE),
        .Sl_Wait(microblaze_0_dlmb_bus_WAIT));
  shared_bram_ilmb_bram_if_cntlr_0 ilmb_bram_if_cntlr
       (.BRAM_Addr_A(microblaze_0_ilmb_cntlr_ADDR),
        .BRAM_Clk_A(microblaze_0_ilmb_cntlr_CLK),
        .BRAM_Din_A({microblaze_0_ilmb_cntlr_DOUT[31],microblaze_0_ilmb_cntlr_DOUT[30],microblaze_0_ilmb_cntlr_DOUT[29],microblaze_0_ilmb_cntlr_DOUT[28],microblaze_0_ilmb_cntlr_DOUT[27],microblaze_0_ilmb_cntlr_DOUT[26],microblaze_0_ilmb_cntlr_DOUT[25],microblaze_0_ilmb_cntlr_DOUT[24],microblaze_0_ilmb_cntlr_DOUT[23],microblaze_0_ilmb_cntlr_DOUT[22],microblaze_0_ilmb_cntlr_DOUT[21],microblaze_0_ilmb_cntlr_DOUT[20],microblaze_0_ilmb_cntlr_DOUT[19],microblaze_0_ilmb_cntlr_DOUT[18],microblaze_0_ilmb_cntlr_DOUT[17],microblaze_0_ilmb_cntlr_DOUT[16],microblaze_0_ilmb_cntlr_DOUT[15],microblaze_0_ilmb_cntlr_DOUT[14],microblaze_0_ilmb_cntlr_DOUT[13],microblaze_0_ilmb_cntlr_DOUT[12],microblaze_0_ilmb_cntlr_DOUT[11],microblaze_0_ilmb_cntlr_DOUT[10],microblaze_0_ilmb_cntlr_DOUT[9],microblaze_0_ilmb_cntlr_DOUT[8],microblaze_0_ilmb_cntlr_DOUT[7],microblaze_0_ilmb_cntlr_DOUT[6],microblaze_0_ilmb_cntlr_DOUT[5],microblaze_0_ilmb_cntlr_DOUT[4],microblaze_0_ilmb_cntlr_DOUT[3],microblaze_0_ilmb_cntlr_DOUT[2],microblaze_0_ilmb_cntlr_DOUT[1],microblaze_0_ilmb_cntlr_DOUT[0]}),
        .BRAM_Dout_A(microblaze_0_ilmb_cntlr_DIN),
        .BRAM_EN_A(microblaze_0_ilmb_cntlr_EN),
        .BRAM_Rst_A(microblaze_0_ilmb_cntlr_RST),
        .BRAM_WEN_A(microblaze_0_ilmb_cntlr_WE),
        .LMB_ABus(microblaze_0_ilmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_0_ilmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_0_ilmb_bus_BE),
        .LMB_Clk(microblaze_0_Clk),
        .LMB_ReadStrobe(microblaze_0_ilmb_bus_READSTROBE),
        .LMB_Rst(SYS_Rst_1),
        .LMB_WriteDBus(microblaze_0_ilmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_0_ilmb_bus_WRITESTROBE),
        .Sl_CE(microblaze_0_ilmb_bus_CE),
        .Sl_DBus(microblaze_0_ilmb_bus_READDBUS),
        .Sl_Ready(microblaze_0_ilmb_bus_READY),
        .Sl_UE(microblaze_0_ilmb_bus_UE),
        .Sl_Wait(microblaze_0_ilmb_bus_WAIT));
  shared_bram_ilmb_v10_0 ilmb_v10
       (.LMB_ABus(microblaze_0_ilmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_0_ilmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_0_ilmb_bus_BE),
        .LMB_CE(microblaze_0_ilmb_CE),
        .LMB_Clk(microblaze_0_Clk),
        .LMB_ReadDBus(microblaze_0_ilmb_READDBUS),
        .LMB_ReadStrobe(microblaze_0_ilmb_bus_READSTROBE),
        .LMB_Ready(microblaze_0_ilmb_READY),
        .LMB_UE(microblaze_0_ilmb_UE),
        .LMB_Wait(microblaze_0_ilmb_WAIT),
        .LMB_WriteDBus(microblaze_0_ilmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_0_ilmb_bus_WRITESTROBE),
        .M_ABus(microblaze_0_ilmb_ABUS),
        .M_AddrStrobe(microblaze_0_ilmb_ADDRSTROBE),
        .M_BE({1'b0,1'b0,1'b0,1'b0}),
        .M_DBus({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_ReadStrobe(microblaze_0_ilmb_READSTROBE),
        .M_WriteStrobe(1'b0),
        .SYS_Rst(SYS_Rst_1),
        .Sl_CE(microblaze_0_ilmb_bus_CE),
        .Sl_DBus(microblaze_0_ilmb_bus_READDBUS),
        .Sl_Ready(microblaze_0_ilmb_bus_READY),
        .Sl_UE(microblaze_0_ilmb_bus_UE),
        .Sl_Wait(microblaze_0_ilmb_bus_WAIT));
  shared_bram_lmb_bram_0 lmb_bram
       (.addra({microblaze_0_dlmb_cntlr_ADDR[0],microblaze_0_dlmb_cntlr_ADDR[1],microblaze_0_dlmb_cntlr_ADDR[2],microblaze_0_dlmb_cntlr_ADDR[3],microblaze_0_dlmb_cntlr_ADDR[4],microblaze_0_dlmb_cntlr_ADDR[5],microblaze_0_dlmb_cntlr_ADDR[6],microblaze_0_dlmb_cntlr_ADDR[7],microblaze_0_dlmb_cntlr_ADDR[8],microblaze_0_dlmb_cntlr_ADDR[9],microblaze_0_dlmb_cntlr_ADDR[10],microblaze_0_dlmb_cntlr_ADDR[11],microblaze_0_dlmb_cntlr_ADDR[12],microblaze_0_dlmb_cntlr_ADDR[13],microblaze_0_dlmb_cntlr_ADDR[14],microblaze_0_dlmb_cntlr_ADDR[15],microblaze_0_dlmb_cntlr_ADDR[16],microblaze_0_dlmb_cntlr_ADDR[17],microblaze_0_dlmb_cntlr_ADDR[18],microblaze_0_dlmb_cntlr_ADDR[19],microblaze_0_dlmb_cntlr_ADDR[20],microblaze_0_dlmb_cntlr_ADDR[21],microblaze_0_dlmb_cntlr_ADDR[22],microblaze_0_dlmb_cntlr_ADDR[23],microblaze_0_dlmb_cntlr_ADDR[24],microblaze_0_dlmb_cntlr_ADDR[25],microblaze_0_dlmb_cntlr_ADDR[26],microblaze_0_dlmb_cntlr_ADDR[27],microblaze_0_dlmb_cntlr_ADDR[28],microblaze_0_dlmb_cntlr_ADDR[29],microblaze_0_dlmb_cntlr_ADDR[30],microblaze_0_dlmb_cntlr_ADDR[31]}),
        .addrb({microblaze_0_ilmb_cntlr_ADDR[0],microblaze_0_ilmb_cntlr_ADDR[1],microblaze_0_ilmb_cntlr_ADDR[2],microblaze_0_ilmb_cntlr_ADDR[3],microblaze_0_ilmb_cntlr_ADDR[4],microblaze_0_ilmb_cntlr_ADDR[5],microblaze_0_ilmb_cntlr_ADDR[6],microblaze_0_ilmb_cntlr_ADDR[7],microblaze_0_ilmb_cntlr_ADDR[8],microblaze_0_ilmb_cntlr_ADDR[9],microblaze_0_ilmb_cntlr_ADDR[10],microblaze_0_ilmb_cntlr_ADDR[11],microblaze_0_ilmb_cntlr_ADDR[12],microblaze_0_ilmb_cntlr_ADDR[13],microblaze_0_ilmb_cntlr_ADDR[14],microblaze_0_ilmb_cntlr_ADDR[15],microblaze_0_ilmb_cntlr_ADDR[16],microblaze_0_ilmb_cntlr_ADDR[17],microblaze_0_ilmb_cntlr_ADDR[18],microblaze_0_ilmb_cntlr_ADDR[19],microblaze_0_ilmb_cntlr_ADDR[20],microblaze_0_ilmb_cntlr_ADDR[21],microblaze_0_ilmb_cntlr_ADDR[22],microblaze_0_ilmb_cntlr_ADDR[23],microblaze_0_ilmb_cntlr_ADDR[24],microblaze_0_ilmb_cntlr_ADDR[25],microblaze_0_ilmb_cntlr_ADDR[26],microblaze_0_ilmb_cntlr_ADDR[27],microblaze_0_ilmb_cntlr_ADDR[28],microblaze_0_ilmb_cntlr_ADDR[29],microblaze_0_ilmb_cntlr_ADDR[30],microblaze_0_ilmb_cntlr_ADDR[31]}),
        .clka(microblaze_0_dlmb_cntlr_CLK),
        .clkb(microblaze_0_ilmb_cntlr_CLK),
        .dina({microblaze_0_dlmb_cntlr_DIN[0],microblaze_0_dlmb_cntlr_DIN[1],microblaze_0_dlmb_cntlr_DIN[2],microblaze_0_dlmb_cntlr_DIN[3],microblaze_0_dlmb_cntlr_DIN[4],microblaze_0_dlmb_cntlr_DIN[5],microblaze_0_dlmb_cntlr_DIN[6],microblaze_0_dlmb_cntlr_DIN[7],microblaze_0_dlmb_cntlr_DIN[8],microblaze_0_dlmb_cntlr_DIN[9],microblaze_0_dlmb_cntlr_DIN[10],microblaze_0_dlmb_cntlr_DIN[11],microblaze_0_dlmb_cntlr_DIN[12],microblaze_0_dlmb_cntlr_DIN[13],microblaze_0_dlmb_cntlr_DIN[14],microblaze_0_dlmb_cntlr_DIN[15],microblaze_0_dlmb_cntlr_DIN[16],microblaze_0_dlmb_cntlr_DIN[17],microblaze_0_dlmb_cntlr_DIN[18],microblaze_0_dlmb_cntlr_DIN[19],microblaze_0_dlmb_cntlr_DIN[20],microblaze_0_dlmb_cntlr_DIN[21],microblaze_0_dlmb_cntlr_DIN[22],microblaze_0_dlmb_cntlr_DIN[23],microblaze_0_dlmb_cntlr_DIN[24],microblaze_0_dlmb_cntlr_DIN[25],microblaze_0_dlmb_cntlr_DIN[26],microblaze_0_dlmb_cntlr_DIN[27],microblaze_0_dlmb_cntlr_DIN[28],microblaze_0_dlmb_cntlr_DIN[29],microblaze_0_dlmb_cntlr_DIN[30],microblaze_0_dlmb_cntlr_DIN[31]}),
        .dinb({microblaze_0_ilmb_cntlr_DIN[0],microblaze_0_ilmb_cntlr_DIN[1],microblaze_0_ilmb_cntlr_DIN[2],microblaze_0_ilmb_cntlr_DIN[3],microblaze_0_ilmb_cntlr_DIN[4],microblaze_0_ilmb_cntlr_DIN[5],microblaze_0_ilmb_cntlr_DIN[6],microblaze_0_ilmb_cntlr_DIN[7],microblaze_0_ilmb_cntlr_DIN[8],microblaze_0_ilmb_cntlr_DIN[9],microblaze_0_ilmb_cntlr_DIN[10],microblaze_0_ilmb_cntlr_DIN[11],microblaze_0_ilmb_cntlr_DIN[12],microblaze_0_ilmb_cntlr_DIN[13],microblaze_0_ilmb_cntlr_DIN[14],microblaze_0_ilmb_cntlr_DIN[15],microblaze_0_ilmb_cntlr_DIN[16],microblaze_0_ilmb_cntlr_DIN[17],microblaze_0_ilmb_cntlr_DIN[18],microblaze_0_ilmb_cntlr_DIN[19],microblaze_0_ilmb_cntlr_DIN[20],microblaze_0_ilmb_cntlr_DIN[21],microblaze_0_ilmb_cntlr_DIN[22],microblaze_0_ilmb_cntlr_DIN[23],microblaze_0_ilmb_cntlr_DIN[24],microblaze_0_ilmb_cntlr_DIN[25],microblaze_0_ilmb_cntlr_DIN[26],microblaze_0_ilmb_cntlr_DIN[27],microblaze_0_ilmb_cntlr_DIN[28],microblaze_0_ilmb_cntlr_DIN[29],microblaze_0_ilmb_cntlr_DIN[30],microblaze_0_ilmb_cntlr_DIN[31]}),
        .douta(microblaze_0_dlmb_cntlr_DOUT),
        .doutb(microblaze_0_ilmb_cntlr_DOUT),
        .ena(microblaze_0_dlmb_cntlr_EN),
        .enb(microblaze_0_ilmb_cntlr_EN),
        .rsta(microblaze_0_dlmb_cntlr_RST),
        .rstb(microblaze_0_ilmb_cntlr_RST),
        .wea({microblaze_0_dlmb_cntlr_WE[0],microblaze_0_dlmb_cntlr_WE[1],microblaze_0_dlmb_cntlr_WE[2],microblaze_0_dlmb_cntlr_WE[3]}),
        .web({microblaze_0_ilmb_cntlr_WE[0],microblaze_0_ilmb_cntlr_WE[1],microblaze_0_ilmb_cntlr_WE[2],microblaze_0_ilmb_cntlr_WE[3]}));
endmodule

module s00_couplers_imp_11JA7UH
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [7:0]M_AXI_arlen;
  output [0:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [7:0]M_AXI_awlen;
  output [0:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_pc_to_s00_couplers_ARADDR;
  wire [1:0]auto_pc_to_s00_couplers_ARBURST;
  wire [3:0]auto_pc_to_s00_couplers_ARCACHE;
  wire [7:0]auto_pc_to_s00_couplers_ARLEN;
  wire [0:0]auto_pc_to_s00_couplers_ARLOCK;
  wire [2:0]auto_pc_to_s00_couplers_ARPROT;
  wire [3:0]auto_pc_to_s00_couplers_ARQOS;
  wire auto_pc_to_s00_couplers_ARREADY;
  wire [2:0]auto_pc_to_s00_couplers_ARSIZE;
  wire auto_pc_to_s00_couplers_ARVALID;
  wire [31:0]auto_pc_to_s00_couplers_AWADDR;
  wire [1:0]auto_pc_to_s00_couplers_AWBURST;
  wire [3:0]auto_pc_to_s00_couplers_AWCACHE;
  wire [7:0]auto_pc_to_s00_couplers_AWLEN;
  wire [0:0]auto_pc_to_s00_couplers_AWLOCK;
  wire [2:0]auto_pc_to_s00_couplers_AWPROT;
  wire [3:0]auto_pc_to_s00_couplers_AWQOS;
  wire auto_pc_to_s00_couplers_AWREADY;
  wire [2:0]auto_pc_to_s00_couplers_AWSIZE;
  wire auto_pc_to_s00_couplers_AWVALID;
  wire auto_pc_to_s00_couplers_BREADY;
  wire [1:0]auto_pc_to_s00_couplers_BRESP;
  wire auto_pc_to_s00_couplers_BVALID;
  wire [31:0]auto_pc_to_s00_couplers_RDATA;
  wire auto_pc_to_s00_couplers_RLAST;
  wire auto_pc_to_s00_couplers_RREADY;
  wire [1:0]auto_pc_to_s00_couplers_RRESP;
  wire auto_pc_to_s00_couplers_RVALID;
  wire [31:0]auto_pc_to_s00_couplers_WDATA;
  wire auto_pc_to_s00_couplers_WLAST;
  wire auto_pc_to_s00_couplers_WREADY;
  wire [3:0]auto_pc_to_s00_couplers_WSTRB;
  wire auto_pc_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_auto_pc_ARADDR;
  wire [2:0]s00_couplers_to_auto_pc_ARPROT;
  wire s00_couplers_to_auto_pc_ARREADY;
  wire [0:0]s00_couplers_to_auto_pc_ARVALID;
  wire [31:0]s00_couplers_to_auto_pc_AWADDR;
  wire [2:0]s00_couplers_to_auto_pc_AWPROT;
  wire s00_couplers_to_auto_pc_AWREADY;
  wire [0:0]s00_couplers_to_auto_pc_AWVALID;
  wire [0:0]s00_couplers_to_auto_pc_BREADY;
  wire [1:0]s00_couplers_to_auto_pc_BRESP;
  wire s00_couplers_to_auto_pc_BVALID;
  wire [31:0]s00_couplers_to_auto_pc_RDATA;
  wire [0:0]s00_couplers_to_auto_pc_RREADY;
  wire [1:0]s00_couplers_to_auto_pc_RRESP;
  wire s00_couplers_to_auto_pc_RVALID;
  wire [31:0]s00_couplers_to_auto_pc_WDATA;
  wire s00_couplers_to_auto_pc_WREADY;
  wire [3:0]s00_couplers_to_auto_pc_WSTRB;
  wire [0:0]s00_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[31:0] = auto_pc_to_s00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = auto_pc_to_s00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = auto_pc_to_s00_couplers_ARCACHE;
  assign M_AXI_arlen[7:0] = auto_pc_to_s00_couplers_ARLEN;
  assign M_AXI_arlock[0] = auto_pc_to_s00_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = auto_pc_to_s00_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = auto_pc_to_s00_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = auto_pc_to_s00_couplers_ARSIZE;
  assign M_AXI_arvalid = auto_pc_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = auto_pc_to_s00_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = auto_pc_to_s00_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = auto_pc_to_s00_couplers_AWCACHE;
  assign M_AXI_awlen[7:0] = auto_pc_to_s00_couplers_AWLEN;
  assign M_AXI_awlock[0] = auto_pc_to_s00_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = auto_pc_to_s00_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = auto_pc_to_s00_couplers_AWQOS;
  assign M_AXI_awsize[2:0] = auto_pc_to_s00_couplers_AWSIZE;
  assign M_AXI_awvalid = auto_pc_to_s00_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_s00_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_s00_couplers_WDATA;
  assign M_AXI_wlast = auto_pc_to_s00_couplers_WLAST;
  assign M_AXI_wstrb[3:0] = auto_pc_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_s00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready[0] = s00_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready[0] = s00_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bresp[1:0] = s00_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid[0] = s00_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_auto_pc_RDATA;
  assign S_AXI_rresp[1:0] = s00_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid[0] = s00_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready[0] = s00_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_s00_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_s00_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_s00_couplers_RLAST = M_AXI_rlast;
  assign auto_pc_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_auto_pc_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_auto_pc_ARVALID = S_AXI_arvalid[0];
  assign s00_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_auto_pc_AWVALID = S_AXI_awvalid[0];
  assign s00_couplers_to_auto_pc_BREADY = S_AXI_bready[0];
  assign s00_couplers_to_auto_pc_RREADY = S_AXI_rready[0];
  assign s00_couplers_to_auto_pc_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_auto_pc_WVALID = S_AXI_wvalid[0];
  shared_bram_auto_pc_0 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_s00_couplers_ARADDR),
        .m_axi_arburst(auto_pc_to_s00_couplers_ARBURST),
        .m_axi_arcache(auto_pc_to_s00_couplers_ARCACHE),
        .m_axi_arlen(auto_pc_to_s00_couplers_ARLEN),
        .m_axi_arlock(auto_pc_to_s00_couplers_ARLOCK),
        .m_axi_arprot(auto_pc_to_s00_couplers_ARPROT),
        .m_axi_arqos(auto_pc_to_s00_couplers_ARQOS),
        .m_axi_arready(auto_pc_to_s00_couplers_ARREADY),
        .m_axi_arsize(auto_pc_to_s00_couplers_ARSIZE),
        .m_axi_arvalid(auto_pc_to_s00_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_s00_couplers_AWADDR),
        .m_axi_awburst(auto_pc_to_s00_couplers_AWBURST),
        .m_axi_awcache(auto_pc_to_s00_couplers_AWCACHE),
        .m_axi_awlen(auto_pc_to_s00_couplers_AWLEN),
        .m_axi_awlock(auto_pc_to_s00_couplers_AWLOCK),
        .m_axi_awprot(auto_pc_to_s00_couplers_AWPROT),
        .m_axi_awqos(auto_pc_to_s00_couplers_AWQOS),
        .m_axi_awready(auto_pc_to_s00_couplers_AWREADY),
        .m_axi_awsize(auto_pc_to_s00_couplers_AWSIZE),
        .m_axi_awvalid(auto_pc_to_s00_couplers_AWVALID),
        .m_axi_bready(auto_pc_to_s00_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_s00_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_s00_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_s00_couplers_RDATA),
        .m_axi_rlast(auto_pc_to_s00_couplers_RLAST),
        .m_axi_rready(auto_pc_to_s00_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_s00_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_s00_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_s00_couplers_WDATA),
        .m_axi_wlast(auto_pc_to_s00_couplers_WLAST),
        .m_axi_wready(auto_pc_to_s00_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_s00_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_s00_couplers_WVALID),
        .s_axi_araddr(s00_couplers_to_auto_pc_ARADDR),
        .s_axi_arprot(s00_couplers_to_auto_pc_ARPROT),
        .s_axi_arready(s00_couplers_to_auto_pc_ARREADY),
        .s_axi_arvalid(s00_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(s00_couplers_to_auto_pc_AWADDR),
        .s_axi_awprot(s00_couplers_to_auto_pc_AWPROT),
        .s_axi_awready(s00_couplers_to_auto_pc_AWREADY),
        .s_axi_awvalid(s00_couplers_to_auto_pc_AWVALID),
        .s_axi_bready(s00_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(s00_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(s00_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(s00_couplers_to_auto_pc_RDATA),
        .s_axi_rready(s00_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(s00_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(s00_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(s00_couplers_to_auto_pc_WDATA),
        .s_axi_wready(s00_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(s00_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(s00_couplers_to_auto_pc_WVALID));
endmodule

module s00_couplers_imp_1OE3URC
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wid,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [11:0]S_AXI_arid;
  input [3:0]S_AXI_arlen;
  input [1:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [11:0]S_AXI_awid;
  input [3:0]S_AXI_awlen;
  input [1:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [11:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [11:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input [11:0]S_AXI_wid;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_pc_to_s00_couplers_ARADDR;
  wire auto_pc_to_s00_couplers_ARREADY;
  wire auto_pc_to_s00_couplers_ARVALID;
  wire [31:0]auto_pc_to_s00_couplers_AWADDR;
  wire auto_pc_to_s00_couplers_AWREADY;
  wire auto_pc_to_s00_couplers_AWVALID;
  wire auto_pc_to_s00_couplers_BREADY;
  wire [1:0]auto_pc_to_s00_couplers_BRESP;
  wire auto_pc_to_s00_couplers_BVALID;
  wire [31:0]auto_pc_to_s00_couplers_RDATA;
  wire auto_pc_to_s00_couplers_RREADY;
  wire [1:0]auto_pc_to_s00_couplers_RRESP;
  wire auto_pc_to_s00_couplers_RVALID;
  wire [31:0]auto_pc_to_s00_couplers_WDATA;
  wire auto_pc_to_s00_couplers_WREADY;
  wire [3:0]auto_pc_to_s00_couplers_WSTRB;
  wire auto_pc_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_auto_pc_ARADDR;
  wire [1:0]s00_couplers_to_auto_pc_ARBURST;
  wire [3:0]s00_couplers_to_auto_pc_ARCACHE;
  wire [11:0]s00_couplers_to_auto_pc_ARID;
  wire [3:0]s00_couplers_to_auto_pc_ARLEN;
  wire [1:0]s00_couplers_to_auto_pc_ARLOCK;
  wire [2:0]s00_couplers_to_auto_pc_ARPROT;
  wire [3:0]s00_couplers_to_auto_pc_ARQOS;
  wire s00_couplers_to_auto_pc_ARREADY;
  wire [2:0]s00_couplers_to_auto_pc_ARSIZE;
  wire s00_couplers_to_auto_pc_ARVALID;
  wire [31:0]s00_couplers_to_auto_pc_AWADDR;
  wire [1:0]s00_couplers_to_auto_pc_AWBURST;
  wire [3:0]s00_couplers_to_auto_pc_AWCACHE;
  wire [11:0]s00_couplers_to_auto_pc_AWID;
  wire [3:0]s00_couplers_to_auto_pc_AWLEN;
  wire [1:0]s00_couplers_to_auto_pc_AWLOCK;
  wire [2:0]s00_couplers_to_auto_pc_AWPROT;
  wire [3:0]s00_couplers_to_auto_pc_AWQOS;
  wire s00_couplers_to_auto_pc_AWREADY;
  wire [2:0]s00_couplers_to_auto_pc_AWSIZE;
  wire s00_couplers_to_auto_pc_AWVALID;
  wire [11:0]s00_couplers_to_auto_pc_BID;
  wire s00_couplers_to_auto_pc_BREADY;
  wire [1:0]s00_couplers_to_auto_pc_BRESP;
  wire s00_couplers_to_auto_pc_BVALID;
  wire [31:0]s00_couplers_to_auto_pc_RDATA;
  wire [11:0]s00_couplers_to_auto_pc_RID;
  wire s00_couplers_to_auto_pc_RLAST;
  wire s00_couplers_to_auto_pc_RREADY;
  wire [1:0]s00_couplers_to_auto_pc_RRESP;
  wire s00_couplers_to_auto_pc_RVALID;
  wire [31:0]s00_couplers_to_auto_pc_WDATA;
  wire [11:0]s00_couplers_to_auto_pc_WID;
  wire s00_couplers_to_auto_pc_WLAST;
  wire s00_couplers_to_auto_pc_WREADY;
  wire [3:0]s00_couplers_to_auto_pc_WSTRB;
  wire s00_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[31:0] = auto_pc_to_s00_couplers_ARADDR;
  assign M_AXI_arvalid = auto_pc_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = auto_pc_to_s00_couplers_AWADDR;
  assign M_AXI_awvalid = auto_pc_to_s00_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_s00_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_s00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = auto_pc_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_s00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = s00_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = s00_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bid[11:0] = s00_couplers_to_auto_pc_BID;
  assign S_AXI_bresp[1:0] = s00_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_auto_pc_RDATA;
  assign S_AXI_rid[11:0] = s00_couplers_to_auto_pc_RID;
  assign S_AXI_rlast = s00_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = s00_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_s00_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_s00_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_auto_pc_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_auto_pc_ARID = S_AXI_arid[11:0];
  assign s00_couplers_to_auto_pc_ARLEN = S_AXI_arlen[3:0];
  assign s00_couplers_to_auto_pc_ARLOCK = S_AXI_arlock[1:0];
  assign s00_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_auto_pc_ARQOS = S_AXI_arqos[3:0];
  assign s00_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_auto_pc_AWID = S_AXI_awid[11:0];
  assign s00_couplers_to_auto_pc_AWLEN = S_AXI_awlen[3:0];
  assign s00_couplers_to_auto_pc_AWLOCK = S_AXI_awlock[1:0];
  assign s00_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_auto_pc_AWQOS = S_AXI_awqos[3:0];
  assign s00_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign s00_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign s00_couplers_to_auto_pc_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_auto_pc_WID = S_AXI_wid[11:0];
  assign s00_couplers_to_auto_pc_WLAST = S_AXI_wlast;
  assign s00_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
  shared_bram_auto_pc_2 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_s00_couplers_ARADDR),
        .m_axi_arready(auto_pc_to_s00_couplers_ARREADY),
        .m_axi_arvalid(auto_pc_to_s00_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_s00_couplers_AWADDR),
        .m_axi_awready(auto_pc_to_s00_couplers_AWREADY),
        .m_axi_awvalid(auto_pc_to_s00_couplers_AWVALID),
        .m_axi_bready(auto_pc_to_s00_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_s00_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_s00_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_s00_couplers_RDATA),
        .m_axi_rready(auto_pc_to_s00_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_s00_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_s00_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_s00_couplers_WDATA),
        .m_axi_wready(auto_pc_to_s00_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_s00_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_s00_couplers_WVALID),
        .s_axi_araddr(s00_couplers_to_auto_pc_ARADDR),
        .s_axi_arburst(s00_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(s00_couplers_to_auto_pc_ARCACHE),
        .s_axi_arid(s00_couplers_to_auto_pc_ARID),
        .s_axi_arlen(s00_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(s00_couplers_to_auto_pc_ARLOCK),
        .s_axi_arprot(s00_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos(s00_couplers_to_auto_pc_ARQOS),
        .s_axi_arready(s00_couplers_to_auto_pc_ARREADY),
        .s_axi_arsize(s00_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(s00_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(s00_couplers_to_auto_pc_AWADDR),
        .s_axi_awburst(s00_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(s00_couplers_to_auto_pc_AWCACHE),
        .s_axi_awid(s00_couplers_to_auto_pc_AWID),
        .s_axi_awlen(s00_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(s00_couplers_to_auto_pc_AWLOCK),
        .s_axi_awprot(s00_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos(s00_couplers_to_auto_pc_AWQOS),
        .s_axi_awready(s00_couplers_to_auto_pc_AWREADY),
        .s_axi_awsize(s00_couplers_to_auto_pc_AWSIZE),
        .s_axi_awvalid(s00_couplers_to_auto_pc_AWVALID),
        .s_axi_bid(s00_couplers_to_auto_pc_BID),
        .s_axi_bready(s00_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(s00_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(s00_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(s00_couplers_to_auto_pc_RDATA),
        .s_axi_rid(s00_couplers_to_auto_pc_RID),
        .s_axi_rlast(s00_couplers_to_auto_pc_RLAST),
        .s_axi_rready(s00_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(s00_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(s00_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(s00_couplers_to_auto_pc_WDATA),
        .s_axi_wid(s00_couplers_to_auto_pc_WID),
        .s_axi_wlast(s00_couplers_to_auto_pc_WLAST),
        .s_axi_wready(s00_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(s00_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(s00_couplers_to_auto_pc_WVALID));
endmodule

module s00_couplers_imp_QOHGU1
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]s00_couplers_to_s00_couplers_ARADDR;
  wire [2:0]s00_couplers_to_s00_couplers_ARPROT;
  wire [0:0]s00_couplers_to_s00_couplers_ARREADY;
  wire [0:0]s00_couplers_to_s00_couplers_ARVALID;
  wire [31:0]s00_couplers_to_s00_couplers_AWADDR;
  wire [2:0]s00_couplers_to_s00_couplers_AWPROT;
  wire [0:0]s00_couplers_to_s00_couplers_AWREADY;
  wire [0:0]s00_couplers_to_s00_couplers_AWVALID;
  wire [0:0]s00_couplers_to_s00_couplers_BREADY;
  wire [1:0]s00_couplers_to_s00_couplers_BRESP;
  wire [0:0]s00_couplers_to_s00_couplers_BVALID;
  wire [31:0]s00_couplers_to_s00_couplers_RDATA;
  wire [0:0]s00_couplers_to_s00_couplers_RREADY;
  wire [1:0]s00_couplers_to_s00_couplers_RRESP;
  wire [0:0]s00_couplers_to_s00_couplers_RVALID;
  wire [31:0]s00_couplers_to_s00_couplers_WDATA;
  wire [0:0]s00_couplers_to_s00_couplers_WREADY;
  wire [3:0]s00_couplers_to_s00_couplers_WSTRB;
  wire [0:0]s00_couplers_to_s00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = s00_couplers_to_s00_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = s00_couplers_to_s00_couplers_ARPROT;
  assign M_AXI_arvalid[0] = s00_couplers_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = s00_couplers_to_s00_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = s00_couplers_to_s00_couplers_AWPROT;
  assign M_AXI_awvalid[0] = s00_couplers_to_s00_couplers_AWVALID;
  assign M_AXI_bready[0] = s00_couplers_to_s00_couplers_BREADY;
  assign M_AXI_rready[0] = s00_couplers_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = s00_couplers_to_s00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = s00_couplers_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid[0] = s00_couplers_to_s00_couplers_WVALID;
  assign S_AXI_arready[0] = s00_couplers_to_s00_couplers_ARREADY;
  assign S_AXI_awready[0] = s00_couplers_to_s00_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = s00_couplers_to_s00_couplers_BRESP;
  assign S_AXI_bvalid[0] = s00_couplers_to_s00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_s00_couplers_RDATA;
  assign S_AXI_rresp[1:0] = s00_couplers_to_s00_couplers_RRESP;
  assign S_AXI_rvalid[0] = s00_couplers_to_s00_couplers_RVALID;
  assign S_AXI_wready[0] = s00_couplers_to_s00_couplers_WREADY;
  assign s00_couplers_to_s00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_s00_couplers_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_s00_couplers_ARREADY = M_AXI_arready[0];
  assign s00_couplers_to_s00_couplers_ARVALID = S_AXI_arvalid[0];
  assign s00_couplers_to_s00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_s00_couplers_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_s00_couplers_AWREADY = M_AXI_awready[0];
  assign s00_couplers_to_s00_couplers_AWVALID = S_AXI_awvalid[0];
  assign s00_couplers_to_s00_couplers_BREADY = S_AXI_bready[0];
  assign s00_couplers_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign s00_couplers_to_s00_couplers_BVALID = M_AXI_bvalid[0];
  assign s00_couplers_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign s00_couplers_to_s00_couplers_RREADY = S_AXI_rready[0];
  assign s00_couplers_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign s00_couplers_to_s00_couplers_RVALID = M_AXI_rvalid[0];
  assign s00_couplers_to_s00_couplers_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_s00_couplers_WREADY = M_AXI_wready[0];
  assign s00_couplers_to_s00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_s00_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module s01_couplers_imp_6TVE7B
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wid,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [11:0]M_AXI_arid;
  output [7:0]M_AXI_arlen;
  output [0:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [11:0]M_AXI_awid;
  output [7:0]M_AXI_awlen;
  output [0:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  input [12:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  input [12:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [11:0]S_AXI_arid;
  input [3:0]S_AXI_arlen;
  input [1:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [11:0]S_AXI_awid;
  input [3:0]S_AXI_awlen;
  input [1:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [11:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [11:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input [11:0]S_AXI_wid;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_pc_to_s01_couplers_ARADDR;
  wire [1:0]auto_pc_to_s01_couplers_ARBURST;
  wire [3:0]auto_pc_to_s01_couplers_ARCACHE;
  wire [11:0]auto_pc_to_s01_couplers_ARID;
  wire [7:0]auto_pc_to_s01_couplers_ARLEN;
  wire [0:0]auto_pc_to_s01_couplers_ARLOCK;
  wire [2:0]auto_pc_to_s01_couplers_ARPROT;
  wire [3:0]auto_pc_to_s01_couplers_ARQOS;
  wire auto_pc_to_s01_couplers_ARREADY;
  wire [2:0]auto_pc_to_s01_couplers_ARSIZE;
  wire auto_pc_to_s01_couplers_ARVALID;
  wire [31:0]auto_pc_to_s01_couplers_AWADDR;
  wire [1:0]auto_pc_to_s01_couplers_AWBURST;
  wire [3:0]auto_pc_to_s01_couplers_AWCACHE;
  wire [11:0]auto_pc_to_s01_couplers_AWID;
  wire [7:0]auto_pc_to_s01_couplers_AWLEN;
  wire [0:0]auto_pc_to_s01_couplers_AWLOCK;
  wire [2:0]auto_pc_to_s01_couplers_AWPROT;
  wire [3:0]auto_pc_to_s01_couplers_AWQOS;
  wire auto_pc_to_s01_couplers_AWREADY;
  wire [2:0]auto_pc_to_s01_couplers_AWSIZE;
  wire auto_pc_to_s01_couplers_AWVALID;
  wire [12:0]auto_pc_to_s01_couplers_BID;
  wire auto_pc_to_s01_couplers_BREADY;
  wire [1:0]auto_pc_to_s01_couplers_BRESP;
  wire auto_pc_to_s01_couplers_BVALID;
  wire [31:0]auto_pc_to_s01_couplers_RDATA;
  wire [12:0]auto_pc_to_s01_couplers_RID;
  wire auto_pc_to_s01_couplers_RLAST;
  wire auto_pc_to_s01_couplers_RREADY;
  wire [1:0]auto_pc_to_s01_couplers_RRESP;
  wire auto_pc_to_s01_couplers_RVALID;
  wire [31:0]auto_pc_to_s01_couplers_WDATA;
  wire auto_pc_to_s01_couplers_WLAST;
  wire auto_pc_to_s01_couplers_WREADY;
  wire [3:0]auto_pc_to_s01_couplers_WSTRB;
  wire auto_pc_to_s01_couplers_WVALID;
  wire [31:0]s01_couplers_to_auto_pc_ARADDR;
  wire [1:0]s01_couplers_to_auto_pc_ARBURST;
  wire [3:0]s01_couplers_to_auto_pc_ARCACHE;
  wire [11:0]s01_couplers_to_auto_pc_ARID;
  wire [3:0]s01_couplers_to_auto_pc_ARLEN;
  wire [1:0]s01_couplers_to_auto_pc_ARLOCK;
  wire [2:0]s01_couplers_to_auto_pc_ARPROT;
  wire [3:0]s01_couplers_to_auto_pc_ARQOS;
  wire s01_couplers_to_auto_pc_ARREADY;
  wire [2:0]s01_couplers_to_auto_pc_ARSIZE;
  wire s01_couplers_to_auto_pc_ARVALID;
  wire [31:0]s01_couplers_to_auto_pc_AWADDR;
  wire [1:0]s01_couplers_to_auto_pc_AWBURST;
  wire [3:0]s01_couplers_to_auto_pc_AWCACHE;
  wire [11:0]s01_couplers_to_auto_pc_AWID;
  wire [3:0]s01_couplers_to_auto_pc_AWLEN;
  wire [1:0]s01_couplers_to_auto_pc_AWLOCK;
  wire [2:0]s01_couplers_to_auto_pc_AWPROT;
  wire [3:0]s01_couplers_to_auto_pc_AWQOS;
  wire s01_couplers_to_auto_pc_AWREADY;
  wire [2:0]s01_couplers_to_auto_pc_AWSIZE;
  wire s01_couplers_to_auto_pc_AWVALID;
  wire [11:0]s01_couplers_to_auto_pc_BID;
  wire s01_couplers_to_auto_pc_BREADY;
  wire [1:0]s01_couplers_to_auto_pc_BRESP;
  wire s01_couplers_to_auto_pc_BVALID;
  wire [31:0]s01_couplers_to_auto_pc_RDATA;
  wire [11:0]s01_couplers_to_auto_pc_RID;
  wire s01_couplers_to_auto_pc_RLAST;
  wire s01_couplers_to_auto_pc_RREADY;
  wire [1:0]s01_couplers_to_auto_pc_RRESP;
  wire s01_couplers_to_auto_pc_RVALID;
  wire [31:0]s01_couplers_to_auto_pc_WDATA;
  wire [11:0]s01_couplers_to_auto_pc_WID;
  wire s01_couplers_to_auto_pc_WLAST;
  wire s01_couplers_to_auto_pc_WREADY;
  wire [3:0]s01_couplers_to_auto_pc_WSTRB;
  wire s01_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[31:0] = auto_pc_to_s01_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = auto_pc_to_s01_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = auto_pc_to_s01_couplers_ARCACHE;
  assign M_AXI_arid[11:0] = auto_pc_to_s01_couplers_ARID;
  assign M_AXI_arlen[7:0] = auto_pc_to_s01_couplers_ARLEN;
  assign M_AXI_arlock[0] = auto_pc_to_s01_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = auto_pc_to_s01_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = auto_pc_to_s01_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = auto_pc_to_s01_couplers_ARSIZE;
  assign M_AXI_arvalid = auto_pc_to_s01_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = auto_pc_to_s01_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = auto_pc_to_s01_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = auto_pc_to_s01_couplers_AWCACHE;
  assign M_AXI_awid[11:0] = auto_pc_to_s01_couplers_AWID;
  assign M_AXI_awlen[7:0] = auto_pc_to_s01_couplers_AWLEN;
  assign M_AXI_awlock[0] = auto_pc_to_s01_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = auto_pc_to_s01_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = auto_pc_to_s01_couplers_AWQOS;
  assign M_AXI_awsize[2:0] = auto_pc_to_s01_couplers_AWSIZE;
  assign M_AXI_awvalid = auto_pc_to_s01_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_s01_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_s01_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_s01_couplers_WDATA;
  assign M_AXI_wlast = auto_pc_to_s01_couplers_WLAST;
  assign M_AXI_wstrb[3:0] = auto_pc_to_s01_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_s01_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = s01_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = s01_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bid[11:0] = s01_couplers_to_auto_pc_BID;
  assign S_AXI_bresp[1:0] = s01_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = s01_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[31:0] = s01_couplers_to_auto_pc_RDATA;
  assign S_AXI_rid[11:0] = s01_couplers_to_auto_pc_RID;
  assign S_AXI_rlast = s01_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = s01_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = s01_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = s01_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_s01_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_s01_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_s01_couplers_BID = M_AXI_bid[12:0];
  assign auto_pc_to_s01_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_s01_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_s01_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_s01_couplers_RID = M_AXI_rid[12:0];
  assign auto_pc_to_s01_couplers_RLAST = M_AXI_rlast;
  assign auto_pc_to_s01_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_s01_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_s01_couplers_WREADY = M_AXI_wready;
  assign s01_couplers_to_auto_pc_ARADDR = S_AXI_araddr[31:0];
  assign s01_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign s01_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign s01_couplers_to_auto_pc_ARID = S_AXI_arid[11:0];
  assign s01_couplers_to_auto_pc_ARLEN = S_AXI_arlen[3:0];
  assign s01_couplers_to_auto_pc_ARLOCK = S_AXI_arlock[1:0];
  assign s01_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign s01_couplers_to_auto_pc_ARQOS = S_AXI_arqos[3:0];
  assign s01_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign s01_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign s01_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[31:0];
  assign s01_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign s01_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign s01_couplers_to_auto_pc_AWID = S_AXI_awid[11:0];
  assign s01_couplers_to_auto_pc_AWLEN = S_AXI_awlen[3:0];
  assign s01_couplers_to_auto_pc_AWLOCK = S_AXI_awlock[1:0];
  assign s01_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign s01_couplers_to_auto_pc_AWQOS = S_AXI_awqos[3:0];
  assign s01_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign s01_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign s01_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign s01_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign s01_couplers_to_auto_pc_WDATA = S_AXI_wdata[31:0];
  assign s01_couplers_to_auto_pc_WID = S_AXI_wid[11:0];
  assign s01_couplers_to_auto_pc_WLAST = S_AXI_wlast;
  assign s01_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[3:0];
  assign s01_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
  shared_bram_auto_pc_1 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_s01_couplers_ARADDR),
        .m_axi_arburst(auto_pc_to_s01_couplers_ARBURST),
        .m_axi_arcache(auto_pc_to_s01_couplers_ARCACHE),
        .m_axi_arid(auto_pc_to_s01_couplers_ARID),
        .m_axi_arlen(auto_pc_to_s01_couplers_ARLEN),
        .m_axi_arlock(auto_pc_to_s01_couplers_ARLOCK),
        .m_axi_arprot(auto_pc_to_s01_couplers_ARPROT),
        .m_axi_arqos(auto_pc_to_s01_couplers_ARQOS),
        .m_axi_arready(auto_pc_to_s01_couplers_ARREADY),
        .m_axi_arsize(auto_pc_to_s01_couplers_ARSIZE),
        .m_axi_arvalid(auto_pc_to_s01_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_s01_couplers_AWADDR),
        .m_axi_awburst(auto_pc_to_s01_couplers_AWBURST),
        .m_axi_awcache(auto_pc_to_s01_couplers_AWCACHE),
        .m_axi_awid(auto_pc_to_s01_couplers_AWID),
        .m_axi_awlen(auto_pc_to_s01_couplers_AWLEN),
        .m_axi_awlock(auto_pc_to_s01_couplers_AWLOCK),
        .m_axi_awprot(auto_pc_to_s01_couplers_AWPROT),
        .m_axi_awqos(auto_pc_to_s01_couplers_AWQOS),
        .m_axi_awready(auto_pc_to_s01_couplers_AWREADY),
        .m_axi_awsize(auto_pc_to_s01_couplers_AWSIZE),
        .m_axi_awvalid(auto_pc_to_s01_couplers_AWVALID),
        .m_axi_bid(auto_pc_to_s01_couplers_BID[11:0]),
        .m_axi_bready(auto_pc_to_s01_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_s01_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_s01_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_s01_couplers_RDATA),
        .m_axi_rid(auto_pc_to_s01_couplers_RID[11:0]),
        .m_axi_rlast(auto_pc_to_s01_couplers_RLAST),
        .m_axi_rready(auto_pc_to_s01_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_s01_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_s01_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_s01_couplers_WDATA),
        .m_axi_wlast(auto_pc_to_s01_couplers_WLAST),
        .m_axi_wready(auto_pc_to_s01_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_s01_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_s01_couplers_WVALID),
        .s_axi_araddr(s01_couplers_to_auto_pc_ARADDR),
        .s_axi_arburst(s01_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(s01_couplers_to_auto_pc_ARCACHE),
        .s_axi_arid(s01_couplers_to_auto_pc_ARID),
        .s_axi_arlen(s01_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(s01_couplers_to_auto_pc_ARLOCK),
        .s_axi_arprot(s01_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos(s01_couplers_to_auto_pc_ARQOS),
        .s_axi_arready(s01_couplers_to_auto_pc_ARREADY),
        .s_axi_arsize(s01_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(s01_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(s01_couplers_to_auto_pc_AWADDR),
        .s_axi_awburst(s01_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(s01_couplers_to_auto_pc_AWCACHE),
        .s_axi_awid(s01_couplers_to_auto_pc_AWID),
        .s_axi_awlen(s01_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(s01_couplers_to_auto_pc_AWLOCK),
        .s_axi_awprot(s01_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos(s01_couplers_to_auto_pc_AWQOS),
        .s_axi_awready(s01_couplers_to_auto_pc_AWREADY),
        .s_axi_awsize(s01_couplers_to_auto_pc_AWSIZE),
        .s_axi_awvalid(s01_couplers_to_auto_pc_AWVALID),
        .s_axi_bid(s01_couplers_to_auto_pc_BID),
        .s_axi_bready(s01_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(s01_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(s01_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(s01_couplers_to_auto_pc_RDATA),
        .s_axi_rid(s01_couplers_to_auto_pc_RID),
        .s_axi_rlast(s01_couplers_to_auto_pc_RLAST),
        .s_axi_rready(s01_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(s01_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(s01_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(s01_couplers_to_auto_pc_WDATA),
        .s_axi_wid(s01_couplers_to_auto_pc_WID),
        .s_axi_wlast(s01_couplers_to_auto_pc_WLAST),
        .s_axi_wready(s01_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(s01_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(s01_couplers_to_auto_pc_WVALID));
endmodule

(* CORE_GENERATION_INFO = "shared_bram,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=shared_bram,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=29,numReposBlks=18,numNonXlnxBlks=0,numHierBlks=11,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_board_cnt=8,da_clkrst_cnt=2,da_mb_cnt=1,da_ps7_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "shared_bram.hwdef" *) 
module shared_bram
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    leds_4bits_tri_i,
    leds_4bits_tri_o,
    leds_4bits_tri_t,
    sws_2bits_tri_i);
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DDR, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250" *) inout [14:0]DDR_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR BA" *) inout [2:0]DDR_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CAS_N" *) inout DDR_cas_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_N" *) inout DDR_ck_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_P" *) inout DDR_ck_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CKE" *) inout DDR_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CS_N" *) inout DDR_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DM" *) inout [3:0]DDR_dm;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQ" *) inout [31:0]DDR_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_N" *) inout [3:0]DDR_dqs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_P" *) inout [3:0]DDR_dqs_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ODT" *) inout DDR_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RAS_N" *) inout DDR_ras_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RESET_N" *) inout DDR_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR WE_N" *) inout DDR_we_n;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRN" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME FIXED_IO, CAN_DEBUG false" *) inout FIXED_IO_ddr_vrn;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRP" *) inout FIXED_IO_ddr_vrp;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO MIO" *) inout [53:0]FIXED_IO_mio;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_CLK" *) inout FIXED_IO_ps_clk;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_PORB" *) inout FIXED_IO_ps_porb;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_SRSTB" *) inout FIXED_IO_ps_srstb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 leds_4bits TRI_I" *) input [3:0]leds_4bits_tri_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 leds_4bits TRI_O" *) output [3:0]leds_4bits_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 leds_4bits TRI_T" *) output [3:0]leds_4bits_tri_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 sws_2bits TRI_I" *) input [1:0]sws_2bits_tri_i;

  wire [3:0]LEDs_GPIO_TRI_I;
  wire [3:0]LEDs_GPIO_TRI_O;
  wire [3:0]LEDs_GPIO_TRI_T;
  wire [31:0]MB_Pheripheral_Interconnect_M00_AXI_ARADDR;
  wire MB_Pheripheral_Interconnect_M00_AXI_ARREADY;
  wire [0:0]MB_Pheripheral_Interconnect_M00_AXI_ARVALID;
  wire [31:0]MB_Pheripheral_Interconnect_M00_AXI_AWADDR;
  wire MB_Pheripheral_Interconnect_M00_AXI_AWREADY;
  wire [0:0]MB_Pheripheral_Interconnect_M00_AXI_AWVALID;
  wire [0:0]MB_Pheripheral_Interconnect_M00_AXI_BREADY;
  wire [1:0]MB_Pheripheral_Interconnect_M00_AXI_BRESP;
  wire MB_Pheripheral_Interconnect_M00_AXI_BVALID;
  wire [31:0]MB_Pheripheral_Interconnect_M00_AXI_RDATA;
  wire [0:0]MB_Pheripheral_Interconnect_M00_AXI_RREADY;
  wire [1:0]MB_Pheripheral_Interconnect_M00_AXI_RRESP;
  wire MB_Pheripheral_Interconnect_M00_AXI_RVALID;
  wire [31:0]MB_Pheripheral_Interconnect_M00_AXI_WDATA;
  wire MB_Pheripheral_Interconnect_M00_AXI_WREADY;
  wire [3:0]MB_Pheripheral_Interconnect_M00_AXI_WSTRB;
  wire [0:0]MB_Pheripheral_Interconnect_M00_AXI_WVALID;
  wire [31:0]MB_Pheripheral_Interconnect_M01_AXI_ARADDR;
  wire [2:0]MB_Pheripheral_Interconnect_M01_AXI_ARPROT;
  wire [0:0]MB_Pheripheral_Interconnect_M01_AXI_ARREADY;
  wire [0:0]MB_Pheripheral_Interconnect_M01_AXI_ARVALID;
  wire [31:0]MB_Pheripheral_Interconnect_M01_AXI_AWADDR;
  wire [2:0]MB_Pheripheral_Interconnect_M01_AXI_AWPROT;
  wire [0:0]MB_Pheripheral_Interconnect_M01_AXI_AWREADY;
  wire [0:0]MB_Pheripheral_Interconnect_M01_AXI_AWVALID;
  wire [0:0]MB_Pheripheral_Interconnect_M01_AXI_BREADY;
  wire [1:0]MB_Pheripheral_Interconnect_M01_AXI_BRESP;
  wire [0:0]MB_Pheripheral_Interconnect_M01_AXI_BVALID;
  wire [31:0]MB_Pheripheral_Interconnect_M01_AXI_RDATA;
  wire [0:0]MB_Pheripheral_Interconnect_M01_AXI_RREADY;
  wire [1:0]MB_Pheripheral_Interconnect_M01_AXI_RRESP;
  wire [0:0]MB_Pheripheral_Interconnect_M01_AXI_RVALID;
  wire [31:0]MB_Pheripheral_Interconnect_M01_AXI_WDATA;
  wire [0:0]MB_Pheripheral_Interconnect_M01_AXI_WREADY;
  wire [3:0]MB_Pheripheral_Interconnect_M01_AXI_WSTRB;
  wire [0:0]MB_Pheripheral_Interconnect_M01_AXI_WVALID;
  wire [1:0]SWITCHES_GPIO_TRI_I;
  wire [31:0]Shared_BRAM_Interconnect_M00_AXI_ARADDR;
  wire [1:0]Shared_BRAM_Interconnect_M00_AXI_ARBURST;
  wire [3:0]Shared_BRAM_Interconnect_M00_AXI_ARCACHE;
  wire [12:0]Shared_BRAM_Interconnect_M00_AXI_ARID;
  wire [7:0]Shared_BRAM_Interconnect_M00_AXI_ARLEN;
  wire [0:0]Shared_BRAM_Interconnect_M00_AXI_ARLOCK;
  wire [2:0]Shared_BRAM_Interconnect_M00_AXI_ARPROT;
  wire Shared_BRAM_Interconnect_M00_AXI_ARREADY;
  wire [2:0]Shared_BRAM_Interconnect_M00_AXI_ARSIZE;
  wire [0:0]Shared_BRAM_Interconnect_M00_AXI_ARVALID;
  wire [31:0]Shared_BRAM_Interconnect_M00_AXI_AWADDR;
  wire [1:0]Shared_BRAM_Interconnect_M00_AXI_AWBURST;
  wire [3:0]Shared_BRAM_Interconnect_M00_AXI_AWCACHE;
  wire [12:0]Shared_BRAM_Interconnect_M00_AXI_AWID;
  wire [7:0]Shared_BRAM_Interconnect_M00_AXI_AWLEN;
  wire [0:0]Shared_BRAM_Interconnect_M00_AXI_AWLOCK;
  wire [2:0]Shared_BRAM_Interconnect_M00_AXI_AWPROT;
  wire Shared_BRAM_Interconnect_M00_AXI_AWREADY;
  wire [2:0]Shared_BRAM_Interconnect_M00_AXI_AWSIZE;
  wire [0:0]Shared_BRAM_Interconnect_M00_AXI_AWVALID;
  wire [12:0]Shared_BRAM_Interconnect_M00_AXI_BID;
  wire [0:0]Shared_BRAM_Interconnect_M00_AXI_BREADY;
  wire [1:0]Shared_BRAM_Interconnect_M00_AXI_BRESP;
  wire Shared_BRAM_Interconnect_M00_AXI_BVALID;
  wire [31:0]Shared_BRAM_Interconnect_M00_AXI_RDATA;
  wire [12:0]Shared_BRAM_Interconnect_M00_AXI_RID;
  wire Shared_BRAM_Interconnect_M00_AXI_RLAST;
  wire [0:0]Shared_BRAM_Interconnect_M00_AXI_RREADY;
  wire [1:0]Shared_BRAM_Interconnect_M00_AXI_RRESP;
  wire Shared_BRAM_Interconnect_M00_AXI_RVALID;
  wire [31:0]Shared_BRAM_Interconnect_M00_AXI_WDATA;
  wire [0:0]Shared_BRAM_Interconnect_M00_AXI_WLAST;
  wire Shared_BRAM_Interconnect_M00_AXI_WREADY;
  wire [3:0]Shared_BRAM_Interconnect_M00_AXI_WSTRB;
  wire [0:0]Shared_BRAM_Interconnect_M00_AXI_WVALID;
  wire [31:0]Zync_Pheriperal_interconnect_M00_AXI_ARADDR;
  wire Zync_Pheriperal_interconnect_M00_AXI_ARREADY;
  wire Zync_Pheriperal_interconnect_M00_AXI_ARVALID;
  wire [31:0]Zync_Pheriperal_interconnect_M00_AXI_AWADDR;
  wire Zync_Pheriperal_interconnect_M00_AXI_AWREADY;
  wire Zync_Pheriperal_interconnect_M00_AXI_AWVALID;
  wire Zync_Pheriperal_interconnect_M00_AXI_BREADY;
  wire [1:0]Zync_Pheriperal_interconnect_M00_AXI_BRESP;
  wire Zync_Pheriperal_interconnect_M00_AXI_BVALID;
  wire [31:0]Zync_Pheriperal_interconnect_M00_AXI_RDATA;
  wire Zync_Pheriperal_interconnect_M00_AXI_RREADY;
  wire [1:0]Zync_Pheriperal_interconnect_M00_AXI_RRESP;
  wire Zync_Pheriperal_interconnect_M00_AXI_RVALID;
  wire [31:0]Zync_Pheriperal_interconnect_M00_AXI_WDATA;
  wire Zync_Pheriperal_interconnect_M00_AXI_WREADY;
  wire [3:0]Zync_Pheriperal_interconnect_M00_AXI_WSTRB;
  wire Zync_Pheriperal_interconnect_M00_AXI_WVALID;
  wire [12:0]axi_bram_ctrl_0_BRAM_PORTA_ADDR;
  wire axi_bram_ctrl_0_BRAM_PORTA_CLK;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DIN;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DOUT;
  wire axi_bram_ctrl_0_BRAM_PORTA_EN;
  wire axi_bram_ctrl_0_BRAM_PORTA_RST;
  wire [3:0]axi_bram_ctrl_0_BRAM_PORTA_WE;
  wire mdm_1_debug_sys_rst;
  wire microblaze_0_Clk;
  wire [31:0]microblaze_0_M_AXI_DP_ARADDR;
  wire [2:0]microblaze_0_M_AXI_DP_ARPROT;
  wire [0:0]microblaze_0_M_AXI_DP_ARREADY;
  wire microblaze_0_M_AXI_DP_ARVALID;
  wire [31:0]microblaze_0_M_AXI_DP_AWADDR;
  wire [2:0]microblaze_0_M_AXI_DP_AWPROT;
  wire [0:0]microblaze_0_M_AXI_DP_AWREADY;
  wire microblaze_0_M_AXI_DP_AWVALID;
  wire microblaze_0_M_AXI_DP_BREADY;
  wire [1:0]microblaze_0_M_AXI_DP_BRESP;
  wire [0:0]microblaze_0_M_AXI_DP_BVALID;
  wire [31:0]microblaze_0_M_AXI_DP_RDATA;
  wire microblaze_0_M_AXI_DP_RREADY;
  wire [1:0]microblaze_0_M_AXI_DP_RRESP;
  wire [0:0]microblaze_0_M_AXI_DP_RVALID;
  wire [31:0]microblaze_0_M_AXI_DP_WDATA;
  wire [0:0]microblaze_0_M_AXI_DP_WREADY;
  wire [3:0]microblaze_0_M_AXI_DP_WSTRB;
  wire microblaze_0_M_AXI_DP_WVALID;
  wire microblaze_0_debug_CAPTURE;
  wire microblaze_0_debug_CLK;
  wire microblaze_0_debug_DISABLE;
  wire [0:7]microblaze_0_debug_REG_EN;
  wire microblaze_0_debug_RST;
  wire microblaze_0_debug_SHIFT;
  wire microblaze_0_debug_TDI;
  wire microblaze_0_debug_TDO;
  wire microblaze_0_debug_UPDATE;
  wire [0:31]microblaze_0_dlmb_1_ABUS;
  wire microblaze_0_dlmb_1_ADDRSTROBE;
  wire [0:3]microblaze_0_dlmb_1_BE;
  wire microblaze_0_dlmb_1_CE;
  wire [0:31]microblaze_0_dlmb_1_READDBUS;
  wire microblaze_0_dlmb_1_READSTROBE;
  wire microblaze_0_dlmb_1_READY;
  wire microblaze_0_dlmb_1_UE;
  wire microblaze_0_dlmb_1_WAIT;
  wire [0:31]microblaze_0_dlmb_1_WRITEDBUS;
  wire microblaze_0_dlmb_1_WRITESTROBE;
  wire [0:31]microblaze_0_ilmb_1_ABUS;
  wire microblaze_0_ilmb_1_ADDRSTROBE;
  wire microblaze_0_ilmb_1_CE;
  wire [0:31]microblaze_0_ilmb_1_READDBUS;
  wire microblaze_0_ilmb_1_READSTROBE;
  wire microblaze_0_ilmb_1_READY;
  wire microblaze_0_ilmb_1_UE;
  wire microblaze_0_ilmb_1_WAIT;
  wire [14:0]processing_system7_0_DDR_ADDR;
  wire [2:0]processing_system7_0_DDR_BA;
  wire processing_system7_0_DDR_CAS_N;
  wire processing_system7_0_DDR_CKE;
  wire processing_system7_0_DDR_CK_N;
  wire processing_system7_0_DDR_CK_P;
  wire processing_system7_0_DDR_CS_N;
  wire [3:0]processing_system7_0_DDR_DM;
  wire [31:0]processing_system7_0_DDR_DQ;
  wire [3:0]processing_system7_0_DDR_DQS_N;
  wire [3:0]processing_system7_0_DDR_DQS_P;
  wire processing_system7_0_DDR_ODT;
  wire processing_system7_0_DDR_RAS_N;
  wire processing_system7_0_DDR_RESET_N;
  wire processing_system7_0_DDR_WE_N;
  wire processing_system7_0_FCLK_RESET0_N;
  wire processing_system7_0_FIXED_IO_DDR_VRN;
  wire processing_system7_0_FIXED_IO_DDR_VRP;
  wire [53:0]processing_system7_0_FIXED_IO_MIO;
  wire processing_system7_0_FIXED_IO_PS_CLK;
  wire processing_system7_0_FIXED_IO_PS_PORB;
  wire processing_system7_0_FIXED_IO_PS_SRSTB;
  wire [31:0]processing_system7_0_M_AXI_GP0_ARADDR;
  wire [1:0]processing_system7_0_M_AXI_GP0_ARBURST;
  wire [3:0]processing_system7_0_M_AXI_GP0_ARCACHE;
  wire [11:0]processing_system7_0_M_AXI_GP0_ARID;
  wire [3:0]processing_system7_0_M_AXI_GP0_ARLEN;
  wire [1:0]processing_system7_0_M_AXI_GP0_ARLOCK;
  wire [2:0]processing_system7_0_M_AXI_GP0_ARPROT;
  wire [3:0]processing_system7_0_M_AXI_GP0_ARQOS;
  wire processing_system7_0_M_AXI_GP0_ARREADY;
  wire [2:0]processing_system7_0_M_AXI_GP0_ARSIZE;
  wire processing_system7_0_M_AXI_GP0_ARVALID;
  wire [31:0]processing_system7_0_M_AXI_GP0_AWADDR;
  wire [1:0]processing_system7_0_M_AXI_GP0_AWBURST;
  wire [3:0]processing_system7_0_M_AXI_GP0_AWCACHE;
  wire [11:0]processing_system7_0_M_AXI_GP0_AWID;
  wire [3:0]processing_system7_0_M_AXI_GP0_AWLEN;
  wire [1:0]processing_system7_0_M_AXI_GP0_AWLOCK;
  wire [2:0]processing_system7_0_M_AXI_GP0_AWPROT;
  wire [3:0]processing_system7_0_M_AXI_GP0_AWQOS;
  wire processing_system7_0_M_AXI_GP0_AWREADY;
  wire [2:0]processing_system7_0_M_AXI_GP0_AWSIZE;
  wire processing_system7_0_M_AXI_GP0_AWVALID;
  wire [11:0]processing_system7_0_M_AXI_GP0_BID;
  wire processing_system7_0_M_AXI_GP0_BREADY;
  wire [1:0]processing_system7_0_M_AXI_GP0_BRESP;
  wire processing_system7_0_M_AXI_GP0_BVALID;
  wire [31:0]processing_system7_0_M_AXI_GP0_RDATA;
  wire [11:0]processing_system7_0_M_AXI_GP0_RID;
  wire processing_system7_0_M_AXI_GP0_RLAST;
  wire processing_system7_0_M_AXI_GP0_RREADY;
  wire [1:0]processing_system7_0_M_AXI_GP0_RRESP;
  wire processing_system7_0_M_AXI_GP0_RVALID;
  wire [31:0]processing_system7_0_M_AXI_GP0_WDATA;
  wire [11:0]processing_system7_0_M_AXI_GP0_WID;
  wire processing_system7_0_M_AXI_GP0_WLAST;
  wire processing_system7_0_M_AXI_GP0_WREADY;
  wire [3:0]processing_system7_0_M_AXI_GP0_WSTRB;
  wire processing_system7_0_M_AXI_GP0_WVALID;
  wire [31:0]processing_system7_0_M_AXI_GP1_ARADDR;
  wire [1:0]processing_system7_0_M_AXI_GP1_ARBURST;
  wire [3:0]processing_system7_0_M_AXI_GP1_ARCACHE;
  wire [11:0]processing_system7_0_M_AXI_GP1_ARID;
  wire [3:0]processing_system7_0_M_AXI_GP1_ARLEN;
  wire [1:0]processing_system7_0_M_AXI_GP1_ARLOCK;
  wire [2:0]processing_system7_0_M_AXI_GP1_ARPROT;
  wire [3:0]processing_system7_0_M_AXI_GP1_ARQOS;
  wire processing_system7_0_M_AXI_GP1_ARREADY;
  wire [2:0]processing_system7_0_M_AXI_GP1_ARSIZE;
  wire processing_system7_0_M_AXI_GP1_ARVALID;
  wire [31:0]processing_system7_0_M_AXI_GP1_AWADDR;
  wire [1:0]processing_system7_0_M_AXI_GP1_AWBURST;
  wire [3:0]processing_system7_0_M_AXI_GP1_AWCACHE;
  wire [11:0]processing_system7_0_M_AXI_GP1_AWID;
  wire [3:0]processing_system7_0_M_AXI_GP1_AWLEN;
  wire [1:0]processing_system7_0_M_AXI_GP1_AWLOCK;
  wire [2:0]processing_system7_0_M_AXI_GP1_AWPROT;
  wire [3:0]processing_system7_0_M_AXI_GP1_AWQOS;
  wire processing_system7_0_M_AXI_GP1_AWREADY;
  wire [2:0]processing_system7_0_M_AXI_GP1_AWSIZE;
  wire processing_system7_0_M_AXI_GP1_AWVALID;
  wire [11:0]processing_system7_0_M_AXI_GP1_BID;
  wire processing_system7_0_M_AXI_GP1_BREADY;
  wire [1:0]processing_system7_0_M_AXI_GP1_BRESP;
  wire processing_system7_0_M_AXI_GP1_BVALID;
  wire [31:0]processing_system7_0_M_AXI_GP1_RDATA;
  wire [11:0]processing_system7_0_M_AXI_GP1_RID;
  wire processing_system7_0_M_AXI_GP1_RLAST;
  wire processing_system7_0_M_AXI_GP1_RREADY;
  wire [1:0]processing_system7_0_M_AXI_GP1_RRESP;
  wire processing_system7_0_M_AXI_GP1_RVALID;
  wire [31:0]processing_system7_0_M_AXI_GP1_WDATA;
  wire [11:0]processing_system7_0_M_AXI_GP1_WID;
  wire processing_system7_0_M_AXI_GP1_WLAST;
  wire processing_system7_0_M_AXI_GP1_WREADY;
  wire [3:0]processing_system7_0_M_AXI_GP1_WSTRB;
  wire processing_system7_0_M_AXI_GP1_WVALID;
  wire [0:0]rst_ps7_0_100M_bus_struct_reset;
  wire [0:0]rst_ps7_0_100M_interconnect_aresetn;
  wire rst_ps7_0_100M_mb_reset;
  wire [0:0]rst_ps7_0_100M_peripheral_aresetn;

  assign LEDs_GPIO_TRI_I = leds_4bits_tri_i[3:0];
  assign SWITCHES_GPIO_TRI_I = sws_2bits_tri_i[1:0];
  assign leds_4bits_tri_o[3:0] = LEDs_GPIO_TRI_O;
  assign leds_4bits_tri_t[3:0] = LEDs_GPIO_TRI_T;
  shared_bram_axi_gpio_0_3 LEDs
       (.gpio_io_i(LEDs_GPIO_TRI_I),
        .gpio_io_o(LEDs_GPIO_TRI_O),
        .gpio_io_t(LEDs_GPIO_TRI_T),
        .s_axi_aclk(microblaze_0_Clk),
        .s_axi_araddr(Zync_Pheriperal_interconnect_M00_AXI_ARADDR[8:0]),
        .s_axi_aresetn(rst_ps7_0_100M_peripheral_aresetn),
        .s_axi_arready(Zync_Pheriperal_interconnect_M00_AXI_ARREADY),
        .s_axi_arvalid(Zync_Pheriperal_interconnect_M00_AXI_ARVALID),
        .s_axi_awaddr(Zync_Pheriperal_interconnect_M00_AXI_AWADDR[8:0]),
        .s_axi_awready(Zync_Pheriperal_interconnect_M00_AXI_AWREADY),
        .s_axi_awvalid(Zync_Pheriperal_interconnect_M00_AXI_AWVALID),
        .s_axi_bready(Zync_Pheriperal_interconnect_M00_AXI_BREADY),
        .s_axi_bresp(Zync_Pheriperal_interconnect_M00_AXI_BRESP),
        .s_axi_bvalid(Zync_Pheriperal_interconnect_M00_AXI_BVALID),
        .s_axi_rdata(Zync_Pheriperal_interconnect_M00_AXI_RDATA),
        .s_axi_rready(Zync_Pheriperal_interconnect_M00_AXI_RREADY),
        .s_axi_rresp(Zync_Pheriperal_interconnect_M00_AXI_RRESP),
        .s_axi_rvalid(Zync_Pheriperal_interconnect_M00_AXI_RVALID),
        .s_axi_wdata(Zync_Pheriperal_interconnect_M00_AXI_WDATA),
        .s_axi_wready(Zync_Pheriperal_interconnect_M00_AXI_WREADY),
        .s_axi_wstrb(Zync_Pheriperal_interconnect_M00_AXI_WSTRB),
        .s_axi_wvalid(Zync_Pheriperal_interconnect_M00_AXI_WVALID));
  shared_bram_axi_interconnect_0_1 MB_Pheripheral_Interconnect
       (.ACLK(microblaze_0_Clk),
        .ARESETN(rst_ps7_0_100M_interconnect_aresetn),
        .M00_ACLK(microblaze_0_Clk),
        .M00_ARESETN(rst_ps7_0_100M_peripheral_aresetn),
        .M00_AXI_araddr(MB_Pheripheral_Interconnect_M00_AXI_ARADDR),
        .M00_AXI_arready(MB_Pheripheral_Interconnect_M00_AXI_ARREADY),
        .M00_AXI_arvalid(MB_Pheripheral_Interconnect_M00_AXI_ARVALID),
        .M00_AXI_awaddr(MB_Pheripheral_Interconnect_M00_AXI_AWADDR),
        .M00_AXI_awready(MB_Pheripheral_Interconnect_M00_AXI_AWREADY),
        .M00_AXI_awvalid(MB_Pheripheral_Interconnect_M00_AXI_AWVALID),
        .M00_AXI_bready(MB_Pheripheral_Interconnect_M00_AXI_BREADY),
        .M00_AXI_bresp(MB_Pheripheral_Interconnect_M00_AXI_BRESP),
        .M00_AXI_bvalid(MB_Pheripheral_Interconnect_M00_AXI_BVALID),
        .M00_AXI_rdata(MB_Pheripheral_Interconnect_M00_AXI_RDATA),
        .M00_AXI_rready(MB_Pheripheral_Interconnect_M00_AXI_RREADY),
        .M00_AXI_rresp(MB_Pheripheral_Interconnect_M00_AXI_RRESP),
        .M00_AXI_rvalid(MB_Pheripheral_Interconnect_M00_AXI_RVALID),
        .M00_AXI_wdata(MB_Pheripheral_Interconnect_M00_AXI_WDATA),
        .M00_AXI_wready(MB_Pheripheral_Interconnect_M00_AXI_WREADY),
        .M00_AXI_wstrb(MB_Pheripheral_Interconnect_M00_AXI_WSTRB),
        .M00_AXI_wvalid(MB_Pheripheral_Interconnect_M00_AXI_WVALID),
        .M01_ACLK(microblaze_0_Clk),
        .M01_ARESETN(rst_ps7_0_100M_peripheral_aresetn),
        .M01_AXI_araddr(MB_Pheripheral_Interconnect_M01_AXI_ARADDR),
        .M01_AXI_arprot(MB_Pheripheral_Interconnect_M01_AXI_ARPROT),
        .M01_AXI_arready(MB_Pheripheral_Interconnect_M01_AXI_ARREADY),
        .M01_AXI_arvalid(MB_Pheripheral_Interconnect_M01_AXI_ARVALID),
        .M01_AXI_awaddr(MB_Pheripheral_Interconnect_M01_AXI_AWADDR),
        .M01_AXI_awprot(MB_Pheripheral_Interconnect_M01_AXI_AWPROT),
        .M01_AXI_awready(MB_Pheripheral_Interconnect_M01_AXI_AWREADY),
        .M01_AXI_awvalid(MB_Pheripheral_Interconnect_M01_AXI_AWVALID),
        .M01_AXI_bready(MB_Pheripheral_Interconnect_M01_AXI_BREADY),
        .M01_AXI_bresp(MB_Pheripheral_Interconnect_M01_AXI_BRESP),
        .M01_AXI_bvalid(MB_Pheripheral_Interconnect_M01_AXI_BVALID),
        .M01_AXI_rdata(MB_Pheripheral_Interconnect_M01_AXI_RDATA),
        .M01_AXI_rready(MB_Pheripheral_Interconnect_M01_AXI_RREADY),
        .M01_AXI_rresp(MB_Pheripheral_Interconnect_M01_AXI_RRESP),
        .M01_AXI_rvalid(MB_Pheripheral_Interconnect_M01_AXI_RVALID),
        .M01_AXI_wdata(MB_Pheripheral_Interconnect_M01_AXI_WDATA),
        .M01_AXI_wready(MB_Pheripheral_Interconnect_M01_AXI_WREADY),
        .M01_AXI_wstrb(MB_Pheripheral_Interconnect_M01_AXI_WSTRB),
        .M01_AXI_wvalid(MB_Pheripheral_Interconnect_M01_AXI_WVALID),
        .S00_ACLK(microblaze_0_Clk),
        .S00_ARESETN(rst_ps7_0_100M_peripheral_aresetn),
        .S00_AXI_araddr(microblaze_0_M_AXI_DP_ARADDR),
        .S00_AXI_arprot(microblaze_0_M_AXI_DP_ARPROT),
        .S00_AXI_arready(microblaze_0_M_AXI_DP_ARREADY),
        .S00_AXI_arvalid(microblaze_0_M_AXI_DP_ARVALID),
        .S00_AXI_awaddr(microblaze_0_M_AXI_DP_AWADDR),
        .S00_AXI_awprot(microblaze_0_M_AXI_DP_AWPROT),
        .S00_AXI_awready(microblaze_0_M_AXI_DP_AWREADY),
        .S00_AXI_awvalid(microblaze_0_M_AXI_DP_AWVALID),
        .S00_AXI_bready(microblaze_0_M_AXI_DP_BREADY),
        .S00_AXI_bresp(microblaze_0_M_AXI_DP_BRESP),
        .S00_AXI_bvalid(microblaze_0_M_AXI_DP_BVALID),
        .S00_AXI_rdata(microblaze_0_M_AXI_DP_RDATA),
        .S00_AXI_rready(microblaze_0_M_AXI_DP_RREADY),
        .S00_AXI_rresp(microblaze_0_M_AXI_DP_RRESP),
        .S00_AXI_rvalid(microblaze_0_M_AXI_DP_RVALID),
        .S00_AXI_wdata(microblaze_0_M_AXI_DP_WDATA),
        .S00_AXI_wready(microblaze_0_M_AXI_DP_WREADY),
        .S00_AXI_wstrb(microblaze_0_M_AXI_DP_WSTRB),
        .S00_AXI_wvalid(microblaze_0_M_AXI_DP_WVALID));
  shared_bram_axi_gpio_0_2 SWITCHES
       (.gpio_io_i(SWITCHES_GPIO_TRI_I),
        .s_axi_aclk(microblaze_0_Clk),
        .s_axi_araddr(MB_Pheripheral_Interconnect_M00_AXI_ARADDR[8:0]),
        .s_axi_aresetn(rst_ps7_0_100M_peripheral_aresetn),
        .s_axi_arready(MB_Pheripheral_Interconnect_M00_AXI_ARREADY),
        .s_axi_arvalid(MB_Pheripheral_Interconnect_M00_AXI_ARVALID),
        .s_axi_awaddr(MB_Pheripheral_Interconnect_M00_AXI_AWADDR[8:0]),
        .s_axi_awready(MB_Pheripheral_Interconnect_M00_AXI_AWREADY),
        .s_axi_awvalid(MB_Pheripheral_Interconnect_M00_AXI_AWVALID),
        .s_axi_bready(MB_Pheripheral_Interconnect_M00_AXI_BREADY),
        .s_axi_bresp(MB_Pheripheral_Interconnect_M00_AXI_BRESP),
        .s_axi_bvalid(MB_Pheripheral_Interconnect_M00_AXI_BVALID),
        .s_axi_rdata(MB_Pheripheral_Interconnect_M00_AXI_RDATA),
        .s_axi_rready(MB_Pheripheral_Interconnect_M00_AXI_RREADY),
        .s_axi_rresp(MB_Pheripheral_Interconnect_M00_AXI_RRESP),
        .s_axi_rvalid(MB_Pheripheral_Interconnect_M00_AXI_RVALID),
        .s_axi_wdata(MB_Pheripheral_Interconnect_M00_AXI_WDATA),
        .s_axi_wready(MB_Pheripheral_Interconnect_M00_AXI_WREADY),
        .s_axi_wstrb(MB_Pheripheral_Interconnect_M00_AXI_WSTRB),
        .s_axi_wvalid(MB_Pheripheral_Interconnect_M00_AXI_WVALID));
  (* BMM_INFO_ADDRESS_SPACE = "byte  0x40000000 32 > shared_bram SharedBlockMemory" *) 
  (* KEEP_HIERARCHY = "yes" *) 
  shared_bram_axi_bram_ctrl_0_0 SharedBRAM_Controller
       (.bram_addr_a(axi_bram_ctrl_0_BRAM_PORTA_ADDR),
        .bram_clk_a(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .bram_en_a(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .bram_rddata_a(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .bram_rst_a(axi_bram_ctrl_0_BRAM_PORTA_RST),
        .bram_we_a(axi_bram_ctrl_0_BRAM_PORTA_WE),
        .bram_wrdata_a(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .s_axi_aclk(microblaze_0_Clk),
        .s_axi_araddr(Shared_BRAM_Interconnect_M00_AXI_ARADDR[12:0]),
        .s_axi_arburst(Shared_BRAM_Interconnect_M00_AXI_ARBURST),
        .s_axi_arcache(Shared_BRAM_Interconnect_M00_AXI_ARCACHE),
        .s_axi_aresetn(rst_ps7_0_100M_peripheral_aresetn),
        .s_axi_arid(Shared_BRAM_Interconnect_M00_AXI_ARID),
        .s_axi_arlen(Shared_BRAM_Interconnect_M00_AXI_ARLEN),
        .s_axi_arlock(Shared_BRAM_Interconnect_M00_AXI_ARLOCK),
        .s_axi_arprot(Shared_BRAM_Interconnect_M00_AXI_ARPROT),
        .s_axi_arready(Shared_BRAM_Interconnect_M00_AXI_ARREADY),
        .s_axi_arsize(Shared_BRAM_Interconnect_M00_AXI_ARSIZE),
        .s_axi_arvalid(Shared_BRAM_Interconnect_M00_AXI_ARVALID),
        .s_axi_awaddr(Shared_BRAM_Interconnect_M00_AXI_AWADDR[12:0]),
        .s_axi_awburst(Shared_BRAM_Interconnect_M00_AXI_AWBURST),
        .s_axi_awcache(Shared_BRAM_Interconnect_M00_AXI_AWCACHE),
        .s_axi_awid(Shared_BRAM_Interconnect_M00_AXI_AWID),
        .s_axi_awlen(Shared_BRAM_Interconnect_M00_AXI_AWLEN),
        .s_axi_awlock(Shared_BRAM_Interconnect_M00_AXI_AWLOCK),
        .s_axi_awprot(Shared_BRAM_Interconnect_M00_AXI_AWPROT),
        .s_axi_awready(Shared_BRAM_Interconnect_M00_AXI_AWREADY),
        .s_axi_awsize(Shared_BRAM_Interconnect_M00_AXI_AWSIZE),
        .s_axi_awvalid(Shared_BRAM_Interconnect_M00_AXI_AWVALID),
        .s_axi_bid(Shared_BRAM_Interconnect_M00_AXI_BID),
        .s_axi_bready(Shared_BRAM_Interconnect_M00_AXI_BREADY),
        .s_axi_bresp(Shared_BRAM_Interconnect_M00_AXI_BRESP),
        .s_axi_bvalid(Shared_BRAM_Interconnect_M00_AXI_BVALID),
        .s_axi_rdata(Shared_BRAM_Interconnect_M00_AXI_RDATA),
        .s_axi_rid(Shared_BRAM_Interconnect_M00_AXI_RID),
        .s_axi_rlast(Shared_BRAM_Interconnect_M00_AXI_RLAST),
        .s_axi_rready(Shared_BRAM_Interconnect_M00_AXI_RREADY),
        .s_axi_rresp(Shared_BRAM_Interconnect_M00_AXI_RRESP),
        .s_axi_rvalid(Shared_BRAM_Interconnect_M00_AXI_RVALID),
        .s_axi_wdata(Shared_BRAM_Interconnect_M00_AXI_WDATA),
        .s_axi_wlast(Shared_BRAM_Interconnect_M00_AXI_WLAST),
        .s_axi_wready(Shared_BRAM_Interconnect_M00_AXI_WREADY),
        .s_axi_wstrb(Shared_BRAM_Interconnect_M00_AXI_WSTRB),
        .s_axi_wvalid(Shared_BRAM_Interconnect_M00_AXI_WVALID));
  shared_bram_blk_mem_gen_0_0 SharedBlockMemory
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,axi_bram_ctrl_0_BRAM_PORTA_ADDR}),
        .clka(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .dina(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .douta(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .ena(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .rsta(axi_bram_ctrl_0_BRAM_PORTA_RST),
        .wea(axi_bram_ctrl_0_BRAM_PORTA_WE));
  shared_bram_axi_interconnect_0_0 Shared_BRAM_Interconnect
       (.ACLK(microblaze_0_Clk),
        .ARESETN(rst_ps7_0_100M_interconnect_aresetn),
        .M00_ACLK(microblaze_0_Clk),
        .M00_ARESETN(rst_ps7_0_100M_peripheral_aresetn),
        .M00_AXI_araddr(Shared_BRAM_Interconnect_M00_AXI_ARADDR),
        .M00_AXI_arburst(Shared_BRAM_Interconnect_M00_AXI_ARBURST),
        .M00_AXI_arcache(Shared_BRAM_Interconnect_M00_AXI_ARCACHE),
        .M00_AXI_arid(Shared_BRAM_Interconnect_M00_AXI_ARID),
        .M00_AXI_arlen(Shared_BRAM_Interconnect_M00_AXI_ARLEN),
        .M00_AXI_arlock(Shared_BRAM_Interconnect_M00_AXI_ARLOCK),
        .M00_AXI_arprot(Shared_BRAM_Interconnect_M00_AXI_ARPROT),
        .M00_AXI_arready(Shared_BRAM_Interconnect_M00_AXI_ARREADY),
        .M00_AXI_arsize(Shared_BRAM_Interconnect_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(Shared_BRAM_Interconnect_M00_AXI_ARVALID),
        .M00_AXI_awaddr(Shared_BRAM_Interconnect_M00_AXI_AWADDR),
        .M00_AXI_awburst(Shared_BRAM_Interconnect_M00_AXI_AWBURST),
        .M00_AXI_awcache(Shared_BRAM_Interconnect_M00_AXI_AWCACHE),
        .M00_AXI_awid(Shared_BRAM_Interconnect_M00_AXI_AWID),
        .M00_AXI_awlen(Shared_BRAM_Interconnect_M00_AXI_AWLEN),
        .M00_AXI_awlock(Shared_BRAM_Interconnect_M00_AXI_AWLOCK),
        .M00_AXI_awprot(Shared_BRAM_Interconnect_M00_AXI_AWPROT),
        .M00_AXI_awready(Shared_BRAM_Interconnect_M00_AXI_AWREADY),
        .M00_AXI_awsize(Shared_BRAM_Interconnect_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(Shared_BRAM_Interconnect_M00_AXI_AWVALID),
        .M00_AXI_bid(Shared_BRAM_Interconnect_M00_AXI_BID),
        .M00_AXI_bready(Shared_BRAM_Interconnect_M00_AXI_BREADY),
        .M00_AXI_bresp(Shared_BRAM_Interconnect_M00_AXI_BRESP),
        .M00_AXI_bvalid(Shared_BRAM_Interconnect_M00_AXI_BVALID),
        .M00_AXI_rdata(Shared_BRAM_Interconnect_M00_AXI_RDATA),
        .M00_AXI_rid(Shared_BRAM_Interconnect_M00_AXI_RID),
        .M00_AXI_rlast(Shared_BRAM_Interconnect_M00_AXI_RLAST),
        .M00_AXI_rready(Shared_BRAM_Interconnect_M00_AXI_RREADY),
        .M00_AXI_rresp(Shared_BRAM_Interconnect_M00_AXI_RRESP),
        .M00_AXI_rvalid(Shared_BRAM_Interconnect_M00_AXI_RVALID),
        .M00_AXI_wdata(Shared_BRAM_Interconnect_M00_AXI_WDATA),
        .M00_AXI_wlast(Shared_BRAM_Interconnect_M00_AXI_WLAST),
        .M00_AXI_wready(Shared_BRAM_Interconnect_M00_AXI_WREADY),
        .M00_AXI_wstrb(Shared_BRAM_Interconnect_M00_AXI_WSTRB),
        .M00_AXI_wvalid(Shared_BRAM_Interconnect_M00_AXI_WVALID),
        .S00_ACLK(microblaze_0_Clk),
        .S00_ARESETN(rst_ps7_0_100M_peripheral_aresetn),
        .S00_AXI_araddr(MB_Pheripheral_Interconnect_M01_AXI_ARADDR),
        .S00_AXI_arprot(MB_Pheripheral_Interconnect_M01_AXI_ARPROT),
        .S00_AXI_arready(MB_Pheripheral_Interconnect_M01_AXI_ARREADY),
        .S00_AXI_arvalid(MB_Pheripheral_Interconnect_M01_AXI_ARVALID),
        .S00_AXI_awaddr(MB_Pheripheral_Interconnect_M01_AXI_AWADDR),
        .S00_AXI_awprot(MB_Pheripheral_Interconnect_M01_AXI_AWPROT),
        .S00_AXI_awready(MB_Pheripheral_Interconnect_M01_AXI_AWREADY),
        .S00_AXI_awvalid(MB_Pheripheral_Interconnect_M01_AXI_AWVALID),
        .S00_AXI_bready(MB_Pheripheral_Interconnect_M01_AXI_BREADY),
        .S00_AXI_bresp(MB_Pheripheral_Interconnect_M01_AXI_BRESP),
        .S00_AXI_bvalid(MB_Pheripheral_Interconnect_M01_AXI_BVALID),
        .S00_AXI_rdata(MB_Pheripheral_Interconnect_M01_AXI_RDATA),
        .S00_AXI_rready(MB_Pheripheral_Interconnect_M01_AXI_RREADY),
        .S00_AXI_rresp(MB_Pheripheral_Interconnect_M01_AXI_RRESP),
        .S00_AXI_rvalid(MB_Pheripheral_Interconnect_M01_AXI_RVALID),
        .S00_AXI_wdata(MB_Pheripheral_Interconnect_M01_AXI_WDATA),
        .S00_AXI_wready(MB_Pheripheral_Interconnect_M01_AXI_WREADY),
        .S00_AXI_wstrb(MB_Pheripheral_Interconnect_M01_AXI_WSTRB),
        .S00_AXI_wvalid(MB_Pheripheral_Interconnect_M01_AXI_WVALID),
        .S01_ACLK(microblaze_0_Clk),
        .S01_ARESETN(rst_ps7_0_100M_peripheral_aresetn),
        .S01_AXI_araddr(processing_system7_0_M_AXI_GP0_ARADDR),
        .S01_AXI_arburst(processing_system7_0_M_AXI_GP0_ARBURST),
        .S01_AXI_arcache(processing_system7_0_M_AXI_GP0_ARCACHE),
        .S01_AXI_arid(processing_system7_0_M_AXI_GP0_ARID),
        .S01_AXI_arlen(processing_system7_0_M_AXI_GP0_ARLEN),
        .S01_AXI_arlock(processing_system7_0_M_AXI_GP0_ARLOCK),
        .S01_AXI_arprot(processing_system7_0_M_AXI_GP0_ARPROT),
        .S01_AXI_arqos(processing_system7_0_M_AXI_GP0_ARQOS),
        .S01_AXI_arready(processing_system7_0_M_AXI_GP0_ARREADY),
        .S01_AXI_arsize(processing_system7_0_M_AXI_GP0_ARSIZE),
        .S01_AXI_arvalid(processing_system7_0_M_AXI_GP0_ARVALID),
        .S01_AXI_awaddr(processing_system7_0_M_AXI_GP0_AWADDR),
        .S01_AXI_awburst(processing_system7_0_M_AXI_GP0_AWBURST),
        .S01_AXI_awcache(processing_system7_0_M_AXI_GP0_AWCACHE),
        .S01_AXI_awid(processing_system7_0_M_AXI_GP0_AWID),
        .S01_AXI_awlen(processing_system7_0_M_AXI_GP0_AWLEN),
        .S01_AXI_awlock(processing_system7_0_M_AXI_GP0_AWLOCK),
        .S01_AXI_awprot(processing_system7_0_M_AXI_GP0_AWPROT),
        .S01_AXI_awqos(processing_system7_0_M_AXI_GP0_AWQOS),
        .S01_AXI_awready(processing_system7_0_M_AXI_GP0_AWREADY),
        .S01_AXI_awsize(processing_system7_0_M_AXI_GP0_AWSIZE),
        .S01_AXI_awvalid(processing_system7_0_M_AXI_GP0_AWVALID),
        .S01_AXI_bid(processing_system7_0_M_AXI_GP0_BID),
        .S01_AXI_bready(processing_system7_0_M_AXI_GP0_BREADY),
        .S01_AXI_bresp(processing_system7_0_M_AXI_GP0_BRESP),
        .S01_AXI_bvalid(processing_system7_0_M_AXI_GP0_BVALID),
        .S01_AXI_rdata(processing_system7_0_M_AXI_GP0_RDATA),
        .S01_AXI_rid(processing_system7_0_M_AXI_GP0_RID),
        .S01_AXI_rlast(processing_system7_0_M_AXI_GP0_RLAST),
        .S01_AXI_rready(processing_system7_0_M_AXI_GP0_RREADY),
        .S01_AXI_rresp(processing_system7_0_M_AXI_GP0_RRESP),
        .S01_AXI_rvalid(processing_system7_0_M_AXI_GP0_RVALID),
        .S01_AXI_wdata(processing_system7_0_M_AXI_GP0_WDATA),
        .S01_AXI_wid(processing_system7_0_M_AXI_GP0_WID),
        .S01_AXI_wlast(processing_system7_0_M_AXI_GP0_WLAST),
        .S01_AXI_wready(processing_system7_0_M_AXI_GP0_WREADY),
        .S01_AXI_wstrb(processing_system7_0_M_AXI_GP0_WSTRB),
        .S01_AXI_wvalid(processing_system7_0_M_AXI_GP0_WVALID));
  shared_bram_axi_interconnect_0_2 Zync_Pheriperal_interconnect
       (.ACLK(microblaze_0_Clk),
        .ARESETN(rst_ps7_0_100M_interconnect_aresetn),
        .M00_ACLK(microblaze_0_Clk),
        .M00_ARESETN(rst_ps7_0_100M_peripheral_aresetn),
        .M00_AXI_araddr(Zync_Pheriperal_interconnect_M00_AXI_ARADDR),
        .M00_AXI_arready(Zync_Pheriperal_interconnect_M00_AXI_ARREADY),
        .M00_AXI_arvalid(Zync_Pheriperal_interconnect_M00_AXI_ARVALID),
        .M00_AXI_awaddr(Zync_Pheriperal_interconnect_M00_AXI_AWADDR),
        .M00_AXI_awready(Zync_Pheriperal_interconnect_M00_AXI_AWREADY),
        .M00_AXI_awvalid(Zync_Pheriperal_interconnect_M00_AXI_AWVALID),
        .M00_AXI_bready(Zync_Pheriperal_interconnect_M00_AXI_BREADY),
        .M00_AXI_bresp(Zync_Pheriperal_interconnect_M00_AXI_BRESP),
        .M00_AXI_bvalid(Zync_Pheriperal_interconnect_M00_AXI_BVALID),
        .M00_AXI_rdata(Zync_Pheriperal_interconnect_M00_AXI_RDATA),
        .M00_AXI_rready(Zync_Pheriperal_interconnect_M00_AXI_RREADY),
        .M00_AXI_rresp(Zync_Pheriperal_interconnect_M00_AXI_RRESP),
        .M00_AXI_rvalid(Zync_Pheriperal_interconnect_M00_AXI_RVALID),
        .M00_AXI_wdata(Zync_Pheriperal_interconnect_M00_AXI_WDATA),
        .M00_AXI_wready(Zync_Pheriperal_interconnect_M00_AXI_WREADY),
        .M00_AXI_wstrb(Zync_Pheriperal_interconnect_M00_AXI_WSTRB),
        .M00_AXI_wvalid(Zync_Pheriperal_interconnect_M00_AXI_WVALID),
        .S00_ACLK(microblaze_0_Clk),
        .S00_ARESETN(rst_ps7_0_100M_peripheral_aresetn),
        .S00_AXI_araddr(processing_system7_0_M_AXI_GP1_ARADDR),
        .S00_AXI_arburst(processing_system7_0_M_AXI_GP1_ARBURST),
        .S00_AXI_arcache(processing_system7_0_M_AXI_GP1_ARCACHE),
        .S00_AXI_arid(processing_system7_0_M_AXI_GP1_ARID),
        .S00_AXI_arlen(processing_system7_0_M_AXI_GP1_ARLEN),
        .S00_AXI_arlock(processing_system7_0_M_AXI_GP1_ARLOCK),
        .S00_AXI_arprot(processing_system7_0_M_AXI_GP1_ARPROT),
        .S00_AXI_arqos(processing_system7_0_M_AXI_GP1_ARQOS),
        .S00_AXI_arready(processing_system7_0_M_AXI_GP1_ARREADY),
        .S00_AXI_arsize(processing_system7_0_M_AXI_GP1_ARSIZE),
        .S00_AXI_arvalid(processing_system7_0_M_AXI_GP1_ARVALID),
        .S00_AXI_awaddr(processing_system7_0_M_AXI_GP1_AWADDR),
        .S00_AXI_awburst(processing_system7_0_M_AXI_GP1_AWBURST),
        .S00_AXI_awcache(processing_system7_0_M_AXI_GP1_AWCACHE),
        .S00_AXI_awid(processing_system7_0_M_AXI_GP1_AWID),
        .S00_AXI_awlen(processing_system7_0_M_AXI_GP1_AWLEN),
        .S00_AXI_awlock(processing_system7_0_M_AXI_GP1_AWLOCK),
        .S00_AXI_awprot(processing_system7_0_M_AXI_GP1_AWPROT),
        .S00_AXI_awqos(processing_system7_0_M_AXI_GP1_AWQOS),
        .S00_AXI_awready(processing_system7_0_M_AXI_GP1_AWREADY),
        .S00_AXI_awsize(processing_system7_0_M_AXI_GP1_AWSIZE),
        .S00_AXI_awvalid(processing_system7_0_M_AXI_GP1_AWVALID),
        .S00_AXI_bid(processing_system7_0_M_AXI_GP1_BID),
        .S00_AXI_bready(processing_system7_0_M_AXI_GP1_BREADY),
        .S00_AXI_bresp(processing_system7_0_M_AXI_GP1_BRESP),
        .S00_AXI_bvalid(processing_system7_0_M_AXI_GP1_BVALID),
        .S00_AXI_rdata(processing_system7_0_M_AXI_GP1_RDATA),
        .S00_AXI_rid(processing_system7_0_M_AXI_GP1_RID),
        .S00_AXI_rlast(processing_system7_0_M_AXI_GP1_RLAST),
        .S00_AXI_rready(processing_system7_0_M_AXI_GP1_RREADY),
        .S00_AXI_rresp(processing_system7_0_M_AXI_GP1_RRESP),
        .S00_AXI_rvalid(processing_system7_0_M_AXI_GP1_RVALID),
        .S00_AXI_wdata(processing_system7_0_M_AXI_GP1_WDATA),
        .S00_AXI_wid(processing_system7_0_M_AXI_GP1_WID),
        .S00_AXI_wlast(processing_system7_0_M_AXI_GP1_WLAST),
        .S00_AXI_wready(processing_system7_0_M_AXI_GP1_WREADY),
        .S00_AXI_wstrb(processing_system7_0_M_AXI_GP1_WSTRB),
        .S00_AXI_wvalid(processing_system7_0_M_AXI_GP1_WVALID));
  shared_bram_mdm_1_0 mdm_1
       (.Dbg_Capture_0(microblaze_0_debug_CAPTURE),
        .Dbg_Clk_0(microblaze_0_debug_CLK),
        .Dbg_Disable_0(microblaze_0_debug_DISABLE),
        .Dbg_Reg_En_0(microblaze_0_debug_REG_EN),
        .Dbg_Rst_0(microblaze_0_debug_RST),
        .Dbg_Shift_0(microblaze_0_debug_SHIFT),
        .Dbg_TDI_0(microblaze_0_debug_TDI),
        .Dbg_TDO_0(microblaze_0_debug_TDO),
        .Dbg_Update_0(microblaze_0_debug_UPDATE),
        .Debug_SYS_Rst(mdm_1_debug_sys_rst));
  (* BMM_INFO_PROCESSOR = "microblaze-le > shared_bram microblaze_0_local_memory/dlmb_bram_if_cntlr shared_bram SharedBRAM_Controller" *) 
  (* KEEP_HIERARCHY = "yes" *) 
  shared_bram_microblaze_0_0 microblaze_0
       (.Byte_Enable(microblaze_0_dlmb_1_BE),
        .Clk(microblaze_0_Clk),
        .DCE(microblaze_0_dlmb_1_CE),
        .DReady(microblaze_0_dlmb_1_READY),
        .DUE(microblaze_0_dlmb_1_UE),
        .DWait(microblaze_0_dlmb_1_WAIT),
        .D_AS(microblaze_0_dlmb_1_ADDRSTROBE),
        .Data_Addr(microblaze_0_dlmb_1_ABUS),
        .Data_Read(microblaze_0_dlmb_1_READDBUS),
        .Data_Write(microblaze_0_dlmb_1_WRITEDBUS),
        .Dbg_Capture(microblaze_0_debug_CAPTURE),
        .Dbg_Clk(microblaze_0_debug_CLK),
        .Dbg_Disable(microblaze_0_debug_DISABLE),
        .Dbg_Reg_En(microblaze_0_debug_REG_EN),
        .Dbg_Shift(microblaze_0_debug_SHIFT),
        .Dbg_TDI(microblaze_0_debug_TDI),
        .Dbg_TDO(microblaze_0_debug_TDO),
        .Dbg_Update(microblaze_0_debug_UPDATE),
        .Debug_Rst(microblaze_0_debug_RST),
        .ICE(microblaze_0_ilmb_1_CE),
        .IFetch(microblaze_0_ilmb_1_READSTROBE),
        .IReady(microblaze_0_ilmb_1_READY),
        .IUE(microblaze_0_ilmb_1_UE),
        .IWAIT(microblaze_0_ilmb_1_WAIT),
        .I_AS(microblaze_0_ilmb_1_ADDRSTROBE),
        .Instr(microblaze_0_ilmb_1_READDBUS),
        .Instr_Addr(microblaze_0_ilmb_1_ABUS),
        .Interrupt(1'b0),
        .Interrupt_Address({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_AXI_DP_ARADDR(microblaze_0_M_AXI_DP_ARADDR),
        .M_AXI_DP_ARPROT(microblaze_0_M_AXI_DP_ARPROT),
        .M_AXI_DP_ARREADY(microblaze_0_M_AXI_DP_ARREADY),
        .M_AXI_DP_ARVALID(microblaze_0_M_AXI_DP_ARVALID),
        .M_AXI_DP_AWADDR(microblaze_0_M_AXI_DP_AWADDR),
        .M_AXI_DP_AWPROT(microblaze_0_M_AXI_DP_AWPROT),
        .M_AXI_DP_AWREADY(microblaze_0_M_AXI_DP_AWREADY),
        .M_AXI_DP_AWVALID(microblaze_0_M_AXI_DP_AWVALID),
        .M_AXI_DP_BREADY(microblaze_0_M_AXI_DP_BREADY),
        .M_AXI_DP_BRESP(microblaze_0_M_AXI_DP_BRESP),
        .M_AXI_DP_BVALID(microblaze_0_M_AXI_DP_BVALID),
        .M_AXI_DP_RDATA(microblaze_0_M_AXI_DP_RDATA),
        .M_AXI_DP_RREADY(microblaze_0_M_AXI_DP_RREADY),
        .M_AXI_DP_RRESP(microblaze_0_M_AXI_DP_RRESP),
        .M_AXI_DP_RVALID(microblaze_0_M_AXI_DP_RVALID),
        .M_AXI_DP_WDATA(microblaze_0_M_AXI_DP_WDATA),
        .M_AXI_DP_WREADY(microblaze_0_M_AXI_DP_WREADY),
        .M_AXI_DP_WSTRB(microblaze_0_M_AXI_DP_WSTRB),
        .M_AXI_DP_WVALID(microblaze_0_M_AXI_DP_WVALID),
        .Read_Strobe(microblaze_0_dlmb_1_READSTROBE),
        .Reset(rst_ps7_0_100M_mb_reset),
        .Write_Strobe(microblaze_0_dlmb_1_WRITESTROBE));
  microblaze_0_local_memory_imp_Q82XC5 microblaze_0_local_memory
       (.DLMB_abus(microblaze_0_dlmb_1_ABUS),
        .DLMB_addrstrobe(microblaze_0_dlmb_1_ADDRSTROBE),
        .DLMB_be(microblaze_0_dlmb_1_BE),
        .DLMB_ce(microblaze_0_dlmb_1_CE),
        .DLMB_readdbus(microblaze_0_dlmb_1_READDBUS),
        .DLMB_readstrobe(microblaze_0_dlmb_1_READSTROBE),
        .DLMB_ready(microblaze_0_dlmb_1_READY),
        .DLMB_ue(microblaze_0_dlmb_1_UE),
        .DLMB_wait(microblaze_0_dlmb_1_WAIT),
        .DLMB_writedbus(microblaze_0_dlmb_1_WRITEDBUS),
        .DLMB_writestrobe(microblaze_0_dlmb_1_WRITESTROBE),
        .ILMB_abus(microblaze_0_ilmb_1_ABUS),
        .ILMB_addrstrobe(microblaze_0_ilmb_1_ADDRSTROBE),
        .ILMB_ce(microblaze_0_ilmb_1_CE),
        .ILMB_readdbus(microblaze_0_ilmb_1_READDBUS),
        .ILMB_readstrobe(microblaze_0_ilmb_1_READSTROBE),
        .ILMB_ready(microblaze_0_ilmb_1_READY),
        .ILMB_ue(microblaze_0_ilmb_1_UE),
        .ILMB_wait(microblaze_0_ilmb_1_WAIT),
        .LMB_Clk(microblaze_0_Clk),
        .SYS_Rst(rst_ps7_0_100M_bus_struct_reset));
  shared_bram_processing_system7_0_0 processing_system7_0
       (.DDR_Addr(DDR_addr[14:0]),
        .DDR_BankAddr(DDR_ba[2:0]),
        .DDR_CAS_n(DDR_cas_n),
        .DDR_CKE(DDR_cke),
        .DDR_CS_n(DDR_cs_n),
        .DDR_Clk(DDR_ck_p),
        .DDR_Clk_n(DDR_ck_n),
        .DDR_DM(DDR_dm[3:0]),
        .DDR_DQ(DDR_dq[31:0]),
        .DDR_DQS(DDR_dqs_p[3:0]),
        .DDR_DQS_n(DDR_dqs_n[3:0]),
        .DDR_DRSTB(DDR_reset_n),
        .DDR_ODT(DDR_odt),
        .DDR_RAS_n(DDR_ras_n),
        .DDR_VRN(FIXED_IO_ddr_vrn),
        .DDR_VRP(FIXED_IO_ddr_vrp),
        .DDR_WEB(DDR_we_n),
        .FCLK_CLK0(microblaze_0_Clk),
        .FCLK_RESET0_N(processing_system7_0_FCLK_RESET0_N),
        .MIO(FIXED_IO_mio[53:0]),
        .M_AXI_GP0_ACLK(microblaze_0_Clk),
        .M_AXI_GP0_ARADDR(processing_system7_0_M_AXI_GP0_ARADDR),
        .M_AXI_GP0_ARBURST(processing_system7_0_M_AXI_GP0_ARBURST),
        .M_AXI_GP0_ARCACHE(processing_system7_0_M_AXI_GP0_ARCACHE),
        .M_AXI_GP0_ARID(processing_system7_0_M_AXI_GP0_ARID),
        .M_AXI_GP0_ARLEN(processing_system7_0_M_AXI_GP0_ARLEN),
        .M_AXI_GP0_ARLOCK(processing_system7_0_M_AXI_GP0_ARLOCK),
        .M_AXI_GP0_ARPROT(processing_system7_0_M_AXI_GP0_ARPROT),
        .M_AXI_GP0_ARQOS(processing_system7_0_M_AXI_GP0_ARQOS),
        .M_AXI_GP0_ARREADY(processing_system7_0_M_AXI_GP0_ARREADY),
        .M_AXI_GP0_ARSIZE(processing_system7_0_M_AXI_GP0_ARSIZE),
        .M_AXI_GP0_ARVALID(processing_system7_0_M_AXI_GP0_ARVALID),
        .M_AXI_GP0_AWADDR(processing_system7_0_M_AXI_GP0_AWADDR),
        .M_AXI_GP0_AWBURST(processing_system7_0_M_AXI_GP0_AWBURST),
        .M_AXI_GP0_AWCACHE(processing_system7_0_M_AXI_GP0_AWCACHE),
        .M_AXI_GP0_AWID(processing_system7_0_M_AXI_GP0_AWID),
        .M_AXI_GP0_AWLEN(processing_system7_0_M_AXI_GP0_AWLEN),
        .M_AXI_GP0_AWLOCK(processing_system7_0_M_AXI_GP0_AWLOCK),
        .M_AXI_GP0_AWPROT(processing_system7_0_M_AXI_GP0_AWPROT),
        .M_AXI_GP0_AWQOS(processing_system7_0_M_AXI_GP0_AWQOS),
        .M_AXI_GP0_AWREADY(processing_system7_0_M_AXI_GP0_AWREADY),
        .M_AXI_GP0_AWSIZE(processing_system7_0_M_AXI_GP0_AWSIZE),
        .M_AXI_GP0_AWVALID(processing_system7_0_M_AXI_GP0_AWVALID),
        .M_AXI_GP0_BID(processing_system7_0_M_AXI_GP0_BID),
        .M_AXI_GP0_BREADY(processing_system7_0_M_AXI_GP0_BREADY),
        .M_AXI_GP0_BRESP(processing_system7_0_M_AXI_GP0_BRESP),
        .M_AXI_GP0_BVALID(processing_system7_0_M_AXI_GP0_BVALID),
        .M_AXI_GP0_RDATA(processing_system7_0_M_AXI_GP0_RDATA),
        .M_AXI_GP0_RID(processing_system7_0_M_AXI_GP0_RID),
        .M_AXI_GP0_RLAST(processing_system7_0_M_AXI_GP0_RLAST),
        .M_AXI_GP0_RREADY(processing_system7_0_M_AXI_GP0_RREADY),
        .M_AXI_GP0_RRESP(processing_system7_0_M_AXI_GP0_RRESP),
        .M_AXI_GP0_RVALID(processing_system7_0_M_AXI_GP0_RVALID),
        .M_AXI_GP0_WDATA(processing_system7_0_M_AXI_GP0_WDATA),
        .M_AXI_GP0_WID(processing_system7_0_M_AXI_GP0_WID),
        .M_AXI_GP0_WLAST(processing_system7_0_M_AXI_GP0_WLAST),
        .M_AXI_GP0_WREADY(processing_system7_0_M_AXI_GP0_WREADY),
        .M_AXI_GP0_WSTRB(processing_system7_0_M_AXI_GP0_WSTRB),
        .M_AXI_GP0_WVALID(processing_system7_0_M_AXI_GP0_WVALID),
        .M_AXI_GP1_ACLK(microblaze_0_Clk),
        .M_AXI_GP1_ARADDR(processing_system7_0_M_AXI_GP1_ARADDR),
        .M_AXI_GP1_ARBURST(processing_system7_0_M_AXI_GP1_ARBURST),
        .M_AXI_GP1_ARCACHE(processing_system7_0_M_AXI_GP1_ARCACHE),
        .M_AXI_GP1_ARID(processing_system7_0_M_AXI_GP1_ARID),
        .M_AXI_GP1_ARLEN(processing_system7_0_M_AXI_GP1_ARLEN),
        .M_AXI_GP1_ARLOCK(processing_system7_0_M_AXI_GP1_ARLOCK),
        .M_AXI_GP1_ARPROT(processing_system7_0_M_AXI_GP1_ARPROT),
        .M_AXI_GP1_ARQOS(processing_system7_0_M_AXI_GP1_ARQOS),
        .M_AXI_GP1_ARREADY(processing_system7_0_M_AXI_GP1_ARREADY),
        .M_AXI_GP1_ARSIZE(processing_system7_0_M_AXI_GP1_ARSIZE),
        .M_AXI_GP1_ARVALID(processing_system7_0_M_AXI_GP1_ARVALID),
        .M_AXI_GP1_AWADDR(processing_system7_0_M_AXI_GP1_AWADDR),
        .M_AXI_GP1_AWBURST(processing_system7_0_M_AXI_GP1_AWBURST),
        .M_AXI_GP1_AWCACHE(processing_system7_0_M_AXI_GP1_AWCACHE),
        .M_AXI_GP1_AWID(processing_system7_0_M_AXI_GP1_AWID),
        .M_AXI_GP1_AWLEN(processing_system7_0_M_AXI_GP1_AWLEN),
        .M_AXI_GP1_AWLOCK(processing_system7_0_M_AXI_GP1_AWLOCK),
        .M_AXI_GP1_AWPROT(processing_system7_0_M_AXI_GP1_AWPROT),
        .M_AXI_GP1_AWQOS(processing_system7_0_M_AXI_GP1_AWQOS),
        .M_AXI_GP1_AWREADY(processing_system7_0_M_AXI_GP1_AWREADY),
        .M_AXI_GP1_AWSIZE(processing_system7_0_M_AXI_GP1_AWSIZE),
        .M_AXI_GP1_AWVALID(processing_system7_0_M_AXI_GP1_AWVALID),
        .M_AXI_GP1_BID(processing_system7_0_M_AXI_GP1_BID),
        .M_AXI_GP1_BREADY(processing_system7_0_M_AXI_GP1_BREADY),
        .M_AXI_GP1_BRESP(processing_system7_0_M_AXI_GP1_BRESP),
        .M_AXI_GP1_BVALID(processing_system7_0_M_AXI_GP1_BVALID),
        .M_AXI_GP1_RDATA(processing_system7_0_M_AXI_GP1_RDATA),
        .M_AXI_GP1_RID(processing_system7_0_M_AXI_GP1_RID),
        .M_AXI_GP1_RLAST(processing_system7_0_M_AXI_GP1_RLAST),
        .M_AXI_GP1_RREADY(processing_system7_0_M_AXI_GP1_RREADY),
        .M_AXI_GP1_RRESP(processing_system7_0_M_AXI_GP1_RRESP),
        .M_AXI_GP1_RVALID(processing_system7_0_M_AXI_GP1_RVALID),
        .M_AXI_GP1_WDATA(processing_system7_0_M_AXI_GP1_WDATA),
        .M_AXI_GP1_WID(processing_system7_0_M_AXI_GP1_WID),
        .M_AXI_GP1_WLAST(processing_system7_0_M_AXI_GP1_WLAST),
        .M_AXI_GP1_WREADY(processing_system7_0_M_AXI_GP1_WREADY),
        .M_AXI_GP1_WSTRB(processing_system7_0_M_AXI_GP1_WSTRB),
        .M_AXI_GP1_WVALID(processing_system7_0_M_AXI_GP1_WVALID),
        .PS_CLK(FIXED_IO_ps_clk),
        .PS_PORB(FIXED_IO_ps_porb),
        .PS_SRSTB(FIXED_IO_ps_srstb),
        .USB0_VBUS_PWRFAULT(1'b0));
  shared_bram_rst_ps7_0_100M_0 rst_ps7_0_100M
       (.aux_reset_in(1'b1),
        .bus_struct_reset(rst_ps7_0_100M_bus_struct_reset),
        .dcm_locked(1'b1),
        .ext_reset_in(processing_system7_0_FCLK_RESET0_N),
        .interconnect_aresetn(rst_ps7_0_100M_interconnect_aresetn),
        .mb_debug_sys_rst(mdm_1_debug_sys_rst),
        .mb_reset(rst_ps7_0_100M_mb_reset),
        .peripheral_aresetn(rst_ps7_0_100M_peripheral_aresetn),
        .slowest_sync_clk(microblaze_0_Clk));
endmodule

module shared_bram_axi_interconnect_0_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arid,
    M00_AXI_arlen,
    M00_AXI_arlock,
    M00_AXI_arprot,
    M00_AXI_arready,
    M00_AXI_arsize,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awburst,
    M00_AXI_awcache,
    M00_AXI_awid,
    M00_AXI_awlen,
    M00_AXI_awlock,
    M00_AXI_awprot,
    M00_AXI_awready,
    M00_AXI_awsize,
    M00_AXI_awvalid,
    M00_AXI_bid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rid,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wlast,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arprot,
    S00_AXI_arready,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awprot,
    S00_AXI_awready,
    S00_AXI_awvalid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid,
    S01_ACLK,
    S01_ARESETN,
    S01_AXI_araddr,
    S01_AXI_arburst,
    S01_AXI_arcache,
    S01_AXI_arid,
    S01_AXI_arlen,
    S01_AXI_arlock,
    S01_AXI_arprot,
    S01_AXI_arqos,
    S01_AXI_arready,
    S01_AXI_arsize,
    S01_AXI_arvalid,
    S01_AXI_awaddr,
    S01_AXI_awburst,
    S01_AXI_awcache,
    S01_AXI_awid,
    S01_AXI_awlen,
    S01_AXI_awlock,
    S01_AXI_awprot,
    S01_AXI_awqos,
    S01_AXI_awready,
    S01_AXI_awsize,
    S01_AXI_awvalid,
    S01_AXI_bid,
    S01_AXI_bready,
    S01_AXI_bresp,
    S01_AXI_bvalid,
    S01_AXI_rdata,
    S01_AXI_rid,
    S01_AXI_rlast,
    S01_AXI_rready,
    S01_AXI_rresp,
    S01_AXI_rvalid,
    S01_AXI_wdata,
    S01_AXI_wid,
    S01_AXI_wlast,
    S01_AXI_wready,
    S01_AXI_wstrb,
    S01_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  output [1:0]M00_AXI_arburst;
  output [3:0]M00_AXI_arcache;
  output [12:0]M00_AXI_arid;
  output [7:0]M00_AXI_arlen;
  output [0:0]M00_AXI_arlock;
  output [2:0]M00_AXI_arprot;
  input [0:0]M00_AXI_arready;
  output [2:0]M00_AXI_arsize;
  output [0:0]M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  output [1:0]M00_AXI_awburst;
  output [3:0]M00_AXI_awcache;
  output [12:0]M00_AXI_awid;
  output [7:0]M00_AXI_awlen;
  output [0:0]M00_AXI_awlock;
  output [2:0]M00_AXI_awprot;
  input [0:0]M00_AXI_awready;
  output [2:0]M00_AXI_awsize;
  output [0:0]M00_AXI_awvalid;
  input [12:0]M00_AXI_bid;
  output [0:0]M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input [0:0]M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  input [12:0]M00_AXI_rid;
  input [0:0]M00_AXI_rlast;
  output [0:0]M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input [0:0]M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  output [0:0]M00_AXI_wlast;
  input [0:0]M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output [0:0]M00_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [2:0]S00_AXI_arprot;
  output [0:0]S00_AXI_arready;
  input [0:0]S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [2:0]S00_AXI_awprot;
  output [0:0]S00_AXI_awready;
  input [0:0]S00_AXI_awvalid;
  input [0:0]S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output [0:0]S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  input [0:0]S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output [0:0]S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  output [0:0]S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input [0:0]S00_AXI_wvalid;
  input S01_ACLK;
  input S01_ARESETN;
  input [31:0]S01_AXI_araddr;
  input [1:0]S01_AXI_arburst;
  input [3:0]S01_AXI_arcache;
  input [11:0]S01_AXI_arid;
  input [3:0]S01_AXI_arlen;
  input [1:0]S01_AXI_arlock;
  input [2:0]S01_AXI_arprot;
  input [3:0]S01_AXI_arqos;
  output S01_AXI_arready;
  input [2:0]S01_AXI_arsize;
  input S01_AXI_arvalid;
  input [31:0]S01_AXI_awaddr;
  input [1:0]S01_AXI_awburst;
  input [3:0]S01_AXI_awcache;
  input [11:0]S01_AXI_awid;
  input [3:0]S01_AXI_awlen;
  input [1:0]S01_AXI_awlock;
  input [2:0]S01_AXI_awprot;
  input [3:0]S01_AXI_awqos;
  output S01_AXI_awready;
  input [2:0]S01_AXI_awsize;
  input S01_AXI_awvalid;
  output [11:0]S01_AXI_bid;
  input S01_AXI_bready;
  output [1:0]S01_AXI_bresp;
  output S01_AXI_bvalid;
  output [31:0]S01_AXI_rdata;
  output [11:0]S01_AXI_rid;
  output S01_AXI_rlast;
  input S01_AXI_rready;
  output [1:0]S01_AXI_rresp;
  output S01_AXI_rvalid;
  input [31:0]S01_AXI_wdata;
  input [11:0]S01_AXI_wid;
  input S01_AXI_wlast;
  output S01_AXI_wready;
  input [3:0]S01_AXI_wstrb;
  input S01_AXI_wvalid;

  wire M00_ACLK_1;
  wire M00_ARESETN_1;
  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire S01_ACLK_1;
  wire S01_ARESETN_1;
  wire Shared_BRAM_Interconnect_ACLK_net;
  wire Shared_BRAM_Interconnect_ARESETN_net;
  wire [31:0]Shared_BRAM_Interconnect_to_s00_couplers_ARADDR;
  wire [2:0]Shared_BRAM_Interconnect_to_s00_couplers_ARPROT;
  wire [0:0]Shared_BRAM_Interconnect_to_s00_couplers_ARREADY;
  wire [0:0]Shared_BRAM_Interconnect_to_s00_couplers_ARVALID;
  wire [31:0]Shared_BRAM_Interconnect_to_s00_couplers_AWADDR;
  wire [2:0]Shared_BRAM_Interconnect_to_s00_couplers_AWPROT;
  wire [0:0]Shared_BRAM_Interconnect_to_s00_couplers_AWREADY;
  wire [0:0]Shared_BRAM_Interconnect_to_s00_couplers_AWVALID;
  wire [0:0]Shared_BRAM_Interconnect_to_s00_couplers_BREADY;
  wire [1:0]Shared_BRAM_Interconnect_to_s00_couplers_BRESP;
  wire [0:0]Shared_BRAM_Interconnect_to_s00_couplers_BVALID;
  wire [31:0]Shared_BRAM_Interconnect_to_s00_couplers_RDATA;
  wire [0:0]Shared_BRAM_Interconnect_to_s00_couplers_RREADY;
  wire [1:0]Shared_BRAM_Interconnect_to_s00_couplers_RRESP;
  wire [0:0]Shared_BRAM_Interconnect_to_s00_couplers_RVALID;
  wire [31:0]Shared_BRAM_Interconnect_to_s00_couplers_WDATA;
  wire [0:0]Shared_BRAM_Interconnect_to_s00_couplers_WREADY;
  wire [3:0]Shared_BRAM_Interconnect_to_s00_couplers_WSTRB;
  wire [0:0]Shared_BRAM_Interconnect_to_s00_couplers_WVALID;
  wire [31:0]Shared_BRAM_Interconnect_to_s01_couplers_ARADDR;
  wire [1:0]Shared_BRAM_Interconnect_to_s01_couplers_ARBURST;
  wire [3:0]Shared_BRAM_Interconnect_to_s01_couplers_ARCACHE;
  wire [11:0]Shared_BRAM_Interconnect_to_s01_couplers_ARID;
  wire [3:0]Shared_BRAM_Interconnect_to_s01_couplers_ARLEN;
  wire [1:0]Shared_BRAM_Interconnect_to_s01_couplers_ARLOCK;
  wire [2:0]Shared_BRAM_Interconnect_to_s01_couplers_ARPROT;
  wire [3:0]Shared_BRAM_Interconnect_to_s01_couplers_ARQOS;
  wire Shared_BRAM_Interconnect_to_s01_couplers_ARREADY;
  wire [2:0]Shared_BRAM_Interconnect_to_s01_couplers_ARSIZE;
  wire Shared_BRAM_Interconnect_to_s01_couplers_ARVALID;
  wire [31:0]Shared_BRAM_Interconnect_to_s01_couplers_AWADDR;
  wire [1:0]Shared_BRAM_Interconnect_to_s01_couplers_AWBURST;
  wire [3:0]Shared_BRAM_Interconnect_to_s01_couplers_AWCACHE;
  wire [11:0]Shared_BRAM_Interconnect_to_s01_couplers_AWID;
  wire [3:0]Shared_BRAM_Interconnect_to_s01_couplers_AWLEN;
  wire [1:0]Shared_BRAM_Interconnect_to_s01_couplers_AWLOCK;
  wire [2:0]Shared_BRAM_Interconnect_to_s01_couplers_AWPROT;
  wire [3:0]Shared_BRAM_Interconnect_to_s01_couplers_AWQOS;
  wire Shared_BRAM_Interconnect_to_s01_couplers_AWREADY;
  wire [2:0]Shared_BRAM_Interconnect_to_s01_couplers_AWSIZE;
  wire Shared_BRAM_Interconnect_to_s01_couplers_AWVALID;
  wire [11:0]Shared_BRAM_Interconnect_to_s01_couplers_BID;
  wire Shared_BRAM_Interconnect_to_s01_couplers_BREADY;
  wire [1:0]Shared_BRAM_Interconnect_to_s01_couplers_BRESP;
  wire Shared_BRAM_Interconnect_to_s01_couplers_BVALID;
  wire [31:0]Shared_BRAM_Interconnect_to_s01_couplers_RDATA;
  wire [11:0]Shared_BRAM_Interconnect_to_s01_couplers_RID;
  wire Shared_BRAM_Interconnect_to_s01_couplers_RLAST;
  wire Shared_BRAM_Interconnect_to_s01_couplers_RREADY;
  wire [1:0]Shared_BRAM_Interconnect_to_s01_couplers_RRESP;
  wire Shared_BRAM_Interconnect_to_s01_couplers_RVALID;
  wire [31:0]Shared_BRAM_Interconnect_to_s01_couplers_WDATA;
  wire [11:0]Shared_BRAM_Interconnect_to_s01_couplers_WID;
  wire Shared_BRAM_Interconnect_to_s01_couplers_WLAST;
  wire Shared_BRAM_Interconnect_to_s01_couplers_WREADY;
  wire [3:0]Shared_BRAM_Interconnect_to_s01_couplers_WSTRB;
  wire Shared_BRAM_Interconnect_to_s01_couplers_WVALID;
  wire [31:0]m00_couplers_to_Shared_BRAM_Interconnect_ARADDR;
  wire [1:0]m00_couplers_to_Shared_BRAM_Interconnect_ARBURST;
  wire [3:0]m00_couplers_to_Shared_BRAM_Interconnect_ARCACHE;
  wire [12:0]m00_couplers_to_Shared_BRAM_Interconnect_ARID;
  wire [7:0]m00_couplers_to_Shared_BRAM_Interconnect_ARLEN;
  wire [0:0]m00_couplers_to_Shared_BRAM_Interconnect_ARLOCK;
  wire [2:0]m00_couplers_to_Shared_BRAM_Interconnect_ARPROT;
  wire [0:0]m00_couplers_to_Shared_BRAM_Interconnect_ARREADY;
  wire [2:0]m00_couplers_to_Shared_BRAM_Interconnect_ARSIZE;
  wire [0:0]m00_couplers_to_Shared_BRAM_Interconnect_ARVALID;
  wire [31:0]m00_couplers_to_Shared_BRAM_Interconnect_AWADDR;
  wire [1:0]m00_couplers_to_Shared_BRAM_Interconnect_AWBURST;
  wire [3:0]m00_couplers_to_Shared_BRAM_Interconnect_AWCACHE;
  wire [12:0]m00_couplers_to_Shared_BRAM_Interconnect_AWID;
  wire [7:0]m00_couplers_to_Shared_BRAM_Interconnect_AWLEN;
  wire [0:0]m00_couplers_to_Shared_BRAM_Interconnect_AWLOCK;
  wire [2:0]m00_couplers_to_Shared_BRAM_Interconnect_AWPROT;
  wire [0:0]m00_couplers_to_Shared_BRAM_Interconnect_AWREADY;
  wire [2:0]m00_couplers_to_Shared_BRAM_Interconnect_AWSIZE;
  wire [0:0]m00_couplers_to_Shared_BRAM_Interconnect_AWVALID;
  wire [12:0]m00_couplers_to_Shared_BRAM_Interconnect_BID;
  wire [0:0]m00_couplers_to_Shared_BRAM_Interconnect_BREADY;
  wire [1:0]m00_couplers_to_Shared_BRAM_Interconnect_BRESP;
  wire [0:0]m00_couplers_to_Shared_BRAM_Interconnect_BVALID;
  wire [31:0]m00_couplers_to_Shared_BRAM_Interconnect_RDATA;
  wire [12:0]m00_couplers_to_Shared_BRAM_Interconnect_RID;
  wire [0:0]m00_couplers_to_Shared_BRAM_Interconnect_RLAST;
  wire [0:0]m00_couplers_to_Shared_BRAM_Interconnect_RREADY;
  wire [1:0]m00_couplers_to_Shared_BRAM_Interconnect_RRESP;
  wire [0:0]m00_couplers_to_Shared_BRAM_Interconnect_RVALID;
  wire [31:0]m00_couplers_to_Shared_BRAM_Interconnect_WDATA;
  wire [0:0]m00_couplers_to_Shared_BRAM_Interconnect_WLAST;
  wire [0:0]m00_couplers_to_Shared_BRAM_Interconnect_WREADY;
  wire [3:0]m00_couplers_to_Shared_BRAM_Interconnect_WSTRB;
  wire [0:0]m00_couplers_to_Shared_BRAM_Interconnect_WVALID;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [1:0]s00_couplers_to_xbar_ARBURST;
  wire [3:0]s00_couplers_to_xbar_ARCACHE;
  wire [7:0]s00_couplers_to_xbar_ARLEN;
  wire [0:0]s00_couplers_to_xbar_ARLOCK;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [3:0]s00_couplers_to_xbar_ARQOS;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire [2:0]s00_couplers_to_xbar_ARSIZE;
  wire s00_couplers_to_xbar_ARVALID;
  wire [31:0]s00_couplers_to_xbar_AWADDR;
  wire [1:0]s00_couplers_to_xbar_AWBURST;
  wire [3:0]s00_couplers_to_xbar_AWCACHE;
  wire [7:0]s00_couplers_to_xbar_AWLEN;
  wire [0:0]s00_couplers_to_xbar_AWLOCK;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [3:0]s00_couplers_to_xbar_AWQOS;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire [2:0]s00_couplers_to_xbar_AWSIZE;
  wire s00_couplers_to_xbar_AWVALID;
  wire s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire [0:0]s00_couplers_to_xbar_RLAST;
  wire s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire s00_couplers_to_xbar_WLAST;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire s00_couplers_to_xbar_WVALID;
  wire [31:0]s01_couplers_to_xbar_ARADDR;
  wire [1:0]s01_couplers_to_xbar_ARBURST;
  wire [3:0]s01_couplers_to_xbar_ARCACHE;
  wire [11:0]s01_couplers_to_xbar_ARID;
  wire [7:0]s01_couplers_to_xbar_ARLEN;
  wire [0:0]s01_couplers_to_xbar_ARLOCK;
  wire [2:0]s01_couplers_to_xbar_ARPROT;
  wire [3:0]s01_couplers_to_xbar_ARQOS;
  wire [1:1]s01_couplers_to_xbar_ARREADY;
  wire [2:0]s01_couplers_to_xbar_ARSIZE;
  wire s01_couplers_to_xbar_ARVALID;
  wire [31:0]s01_couplers_to_xbar_AWADDR;
  wire [1:0]s01_couplers_to_xbar_AWBURST;
  wire [3:0]s01_couplers_to_xbar_AWCACHE;
  wire [11:0]s01_couplers_to_xbar_AWID;
  wire [7:0]s01_couplers_to_xbar_AWLEN;
  wire [0:0]s01_couplers_to_xbar_AWLOCK;
  wire [2:0]s01_couplers_to_xbar_AWPROT;
  wire [3:0]s01_couplers_to_xbar_AWQOS;
  wire [1:1]s01_couplers_to_xbar_AWREADY;
  wire [2:0]s01_couplers_to_xbar_AWSIZE;
  wire s01_couplers_to_xbar_AWVALID;
  wire [25:13]s01_couplers_to_xbar_BID;
  wire s01_couplers_to_xbar_BREADY;
  wire [3:2]s01_couplers_to_xbar_BRESP;
  wire [1:1]s01_couplers_to_xbar_BVALID;
  wire [63:32]s01_couplers_to_xbar_RDATA;
  wire [25:13]s01_couplers_to_xbar_RID;
  wire [1:1]s01_couplers_to_xbar_RLAST;
  wire s01_couplers_to_xbar_RREADY;
  wire [3:2]s01_couplers_to_xbar_RRESP;
  wire [1:1]s01_couplers_to_xbar_RVALID;
  wire [31:0]s01_couplers_to_xbar_WDATA;
  wire s01_couplers_to_xbar_WLAST;
  wire [1:1]s01_couplers_to_xbar_WREADY;
  wire [3:0]s01_couplers_to_xbar_WSTRB;
  wire s01_couplers_to_xbar_WVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire [1:0]xbar_to_m00_couplers_ARBURST;
  wire [3:0]xbar_to_m00_couplers_ARCACHE;
  wire [12:0]xbar_to_m00_couplers_ARID;
  wire [7:0]xbar_to_m00_couplers_ARLEN;
  wire [0:0]xbar_to_m00_couplers_ARLOCK;
  wire [2:0]xbar_to_m00_couplers_ARPROT;
  wire [0:0]xbar_to_m00_couplers_ARREADY;
  wire [2:0]xbar_to_m00_couplers_ARSIZE;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire [1:0]xbar_to_m00_couplers_AWBURST;
  wire [3:0]xbar_to_m00_couplers_AWCACHE;
  wire [12:0]xbar_to_m00_couplers_AWID;
  wire [7:0]xbar_to_m00_couplers_AWLEN;
  wire [0:0]xbar_to_m00_couplers_AWLOCK;
  wire [2:0]xbar_to_m00_couplers_AWPROT;
  wire [0:0]xbar_to_m00_couplers_AWREADY;
  wire [2:0]xbar_to_m00_couplers_AWSIZE;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [12:0]xbar_to_m00_couplers_BID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire [0:0]xbar_to_m00_couplers_BVALID;
  wire [31:0]xbar_to_m00_couplers_RDATA;
  wire [12:0]xbar_to_m00_couplers_RID;
  wire [0:0]xbar_to_m00_couplers_RLAST;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire [0:0]xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire [0:0]xbar_to_m00_couplers_WLAST;
  wire [0:0]xbar_to_m00_couplers_WREADY;
  wire [3:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [25:0]NLW_xbar_s_axi_bid_UNCONNECTED;
  wire [25:0]NLW_xbar_s_axi_rid_UNCONNECTED;

  assign M00_ACLK_1 = M00_ACLK;
  assign M00_ARESETN_1 = M00_ARESETN;
  assign M00_AXI_araddr[31:0] = m00_couplers_to_Shared_BRAM_Interconnect_ARADDR;
  assign M00_AXI_arburst[1:0] = m00_couplers_to_Shared_BRAM_Interconnect_ARBURST;
  assign M00_AXI_arcache[3:0] = m00_couplers_to_Shared_BRAM_Interconnect_ARCACHE;
  assign M00_AXI_arid[12:0] = m00_couplers_to_Shared_BRAM_Interconnect_ARID;
  assign M00_AXI_arlen[7:0] = m00_couplers_to_Shared_BRAM_Interconnect_ARLEN;
  assign M00_AXI_arlock[0] = m00_couplers_to_Shared_BRAM_Interconnect_ARLOCK;
  assign M00_AXI_arprot[2:0] = m00_couplers_to_Shared_BRAM_Interconnect_ARPROT;
  assign M00_AXI_arsize[2:0] = m00_couplers_to_Shared_BRAM_Interconnect_ARSIZE;
  assign M00_AXI_arvalid[0] = m00_couplers_to_Shared_BRAM_Interconnect_ARVALID;
  assign M00_AXI_awaddr[31:0] = m00_couplers_to_Shared_BRAM_Interconnect_AWADDR;
  assign M00_AXI_awburst[1:0] = m00_couplers_to_Shared_BRAM_Interconnect_AWBURST;
  assign M00_AXI_awcache[3:0] = m00_couplers_to_Shared_BRAM_Interconnect_AWCACHE;
  assign M00_AXI_awid[12:0] = m00_couplers_to_Shared_BRAM_Interconnect_AWID;
  assign M00_AXI_awlen[7:0] = m00_couplers_to_Shared_BRAM_Interconnect_AWLEN;
  assign M00_AXI_awlock[0] = m00_couplers_to_Shared_BRAM_Interconnect_AWLOCK;
  assign M00_AXI_awprot[2:0] = m00_couplers_to_Shared_BRAM_Interconnect_AWPROT;
  assign M00_AXI_awsize[2:0] = m00_couplers_to_Shared_BRAM_Interconnect_AWSIZE;
  assign M00_AXI_awvalid[0] = m00_couplers_to_Shared_BRAM_Interconnect_AWVALID;
  assign M00_AXI_bready[0] = m00_couplers_to_Shared_BRAM_Interconnect_BREADY;
  assign M00_AXI_rready[0] = m00_couplers_to_Shared_BRAM_Interconnect_RREADY;
  assign M00_AXI_wdata[31:0] = m00_couplers_to_Shared_BRAM_Interconnect_WDATA;
  assign M00_AXI_wlast[0] = m00_couplers_to_Shared_BRAM_Interconnect_WLAST;
  assign M00_AXI_wstrb[3:0] = m00_couplers_to_Shared_BRAM_Interconnect_WSTRB;
  assign M00_AXI_wvalid[0] = m00_couplers_to_Shared_BRAM_Interconnect_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready[0] = Shared_BRAM_Interconnect_to_s00_couplers_ARREADY;
  assign S00_AXI_awready[0] = Shared_BRAM_Interconnect_to_s00_couplers_AWREADY;
  assign S00_AXI_bresp[1:0] = Shared_BRAM_Interconnect_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid[0] = Shared_BRAM_Interconnect_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = Shared_BRAM_Interconnect_to_s00_couplers_RDATA;
  assign S00_AXI_rresp[1:0] = Shared_BRAM_Interconnect_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid[0] = Shared_BRAM_Interconnect_to_s00_couplers_RVALID;
  assign S00_AXI_wready[0] = Shared_BRAM_Interconnect_to_s00_couplers_WREADY;
  assign S01_ACLK_1 = S01_ACLK;
  assign S01_ARESETN_1 = S01_ARESETN;
  assign S01_AXI_arready = Shared_BRAM_Interconnect_to_s01_couplers_ARREADY;
  assign S01_AXI_awready = Shared_BRAM_Interconnect_to_s01_couplers_AWREADY;
  assign S01_AXI_bid[11:0] = Shared_BRAM_Interconnect_to_s01_couplers_BID;
  assign S01_AXI_bresp[1:0] = Shared_BRAM_Interconnect_to_s01_couplers_BRESP;
  assign S01_AXI_bvalid = Shared_BRAM_Interconnect_to_s01_couplers_BVALID;
  assign S01_AXI_rdata[31:0] = Shared_BRAM_Interconnect_to_s01_couplers_RDATA;
  assign S01_AXI_rid[11:0] = Shared_BRAM_Interconnect_to_s01_couplers_RID;
  assign S01_AXI_rlast = Shared_BRAM_Interconnect_to_s01_couplers_RLAST;
  assign S01_AXI_rresp[1:0] = Shared_BRAM_Interconnect_to_s01_couplers_RRESP;
  assign S01_AXI_rvalid = Shared_BRAM_Interconnect_to_s01_couplers_RVALID;
  assign S01_AXI_wready = Shared_BRAM_Interconnect_to_s01_couplers_WREADY;
  assign Shared_BRAM_Interconnect_ACLK_net = ACLK;
  assign Shared_BRAM_Interconnect_ARESETN_net = ARESETN;
  assign Shared_BRAM_Interconnect_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign Shared_BRAM_Interconnect_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign Shared_BRAM_Interconnect_to_s00_couplers_ARVALID = S00_AXI_arvalid[0];
  assign Shared_BRAM_Interconnect_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign Shared_BRAM_Interconnect_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign Shared_BRAM_Interconnect_to_s00_couplers_AWVALID = S00_AXI_awvalid[0];
  assign Shared_BRAM_Interconnect_to_s00_couplers_BREADY = S00_AXI_bready[0];
  assign Shared_BRAM_Interconnect_to_s00_couplers_RREADY = S00_AXI_rready[0];
  assign Shared_BRAM_Interconnect_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign Shared_BRAM_Interconnect_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign Shared_BRAM_Interconnect_to_s00_couplers_WVALID = S00_AXI_wvalid[0];
  assign Shared_BRAM_Interconnect_to_s01_couplers_ARADDR = S01_AXI_araddr[31:0];
  assign Shared_BRAM_Interconnect_to_s01_couplers_ARBURST = S01_AXI_arburst[1:0];
  assign Shared_BRAM_Interconnect_to_s01_couplers_ARCACHE = S01_AXI_arcache[3:0];
  assign Shared_BRAM_Interconnect_to_s01_couplers_ARID = S01_AXI_arid[11:0];
  assign Shared_BRAM_Interconnect_to_s01_couplers_ARLEN = S01_AXI_arlen[3:0];
  assign Shared_BRAM_Interconnect_to_s01_couplers_ARLOCK = S01_AXI_arlock[1:0];
  assign Shared_BRAM_Interconnect_to_s01_couplers_ARPROT = S01_AXI_arprot[2:0];
  assign Shared_BRAM_Interconnect_to_s01_couplers_ARQOS = S01_AXI_arqos[3:0];
  assign Shared_BRAM_Interconnect_to_s01_couplers_ARSIZE = S01_AXI_arsize[2:0];
  assign Shared_BRAM_Interconnect_to_s01_couplers_ARVALID = S01_AXI_arvalid;
  assign Shared_BRAM_Interconnect_to_s01_couplers_AWADDR = S01_AXI_awaddr[31:0];
  assign Shared_BRAM_Interconnect_to_s01_couplers_AWBURST = S01_AXI_awburst[1:0];
  assign Shared_BRAM_Interconnect_to_s01_couplers_AWCACHE = S01_AXI_awcache[3:0];
  assign Shared_BRAM_Interconnect_to_s01_couplers_AWID = S01_AXI_awid[11:0];
  assign Shared_BRAM_Interconnect_to_s01_couplers_AWLEN = S01_AXI_awlen[3:0];
  assign Shared_BRAM_Interconnect_to_s01_couplers_AWLOCK = S01_AXI_awlock[1:0];
  assign Shared_BRAM_Interconnect_to_s01_couplers_AWPROT = S01_AXI_awprot[2:0];
  assign Shared_BRAM_Interconnect_to_s01_couplers_AWQOS = S01_AXI_awqos[3:0];
  assign Shared_BRAM_Interconnect_to_s01_couplers_AWSIZE = S01_AXI_awsize[2:0];
  assign Shared_BRAM_Interconnect_to_s01_couplers_AWVALID = S01_AXI_awvalid;
  assign Shared_BRAM_Interconnect_to_s01_couplers_BREADY = S01_AXI_bready;
  assign Shared_BRAM_Interconnect_to_s01_couplers_RREADY = S01_AXI_rready;
  assign Shared_BRAM_Interconnect_to_s01_couplers_WDATA = S01_AXI_wdata[31:0];
  assign Shared_BRAM_Interconnect_to_s01_couplers_WID = S01_AXI_wid[11:0];
  assign Shared_BRAM_Interconnect_to_s01_couplers_WLAST = S01_AXI_wlast;
  assign Shared_BRAM_Interconnect_to_s01_couplers_WSTRB = S01_AXI_wstrb[3:0];
  assign Shared_BRAM_Interconnect_to_s01_couplers_WVALID = S01_AXI_wvalid;
  assign m00_couplers_to_Shared_BRAM_Interconnect_ARREADY = M00_AXI_arready[0];
  assign m00_couplers_to_Shared_BRAM_Interconnect_AWREADY = M00_AXI_awready[0];
  assign m00_couplers_to_Shared_BRAM_Interconnect_BID = M00_AXI_bid[12:0];
  assign m00_couplers_to_Shared_BRAM_Interconnect_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_Shared_BRAM_Interconnect_BVALID = M00_AXI_bvalid[0];
  assign m00_couplers_to_Shared_BRAM_Interconnect_RDATA = M00_AXI_rdata[31:0];
  assign m00_couplers_to_Shared_BRAM_Interconnect_RID = M00_AXI_rid[12:0];
  assign m00_couplers_to_Shared_BRAM_Interconnect_RLAST = M00_AXI_rlast[0];
  assign m00_couplers_to_Shared_BRAM_Interconnect_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_Shared_BRAM_Interconnect_RVALID = M00_AXI_rvalid[0];
  assign m00_couplers_to_Shared_BRAM_Interconnect_WREADY = M00_AXI_wready[0];
  m00_couplers_imp_TRJDIH m00_couplers
       (.M_ACLK(M00_ACLK_1),
        .M_ARESETN(M00_ARESETN_1),
        .M_AXI_araddr(m00_couplers_to_Shared_BRAM_Interconnect_ARADDR),
        .M_AXI_arburst(m00_couplers_to_Shared_BRAM_Interconnect_ARBURST),
        .M_AXI_arcache(m00_couplers_to_Shared_BRAM_Interconnect_ARCACHE),
        .M_AXI_arid(m00_couplers_to_Shared_BRAM_Interconnect_ARID),
        .M_AXI_arlen(m00_couplers_to_Shared_BRAM_Interconnect_ARLEN),
        .M_AXI_arlock(m00_couplers_to_Shared_BRAM_Interconnect_ARLOCK),
        .M_AXI_arprot(m00_couplers_to_Shared_BRAM_Interconnect_ARPROT),
        .M_AXI_arready(m00_couplers_to_Shared_BRAM_Interconnect_ARREADY),
        .M_AXI_arsize(m00_couplers_to_Shared_BRAM_Interconnect_ARSIZE),
        .M_AXI_arvalid(m00_couplers_to_Shared_BRAM_Interconnect_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_Shared_BRAM_Interconnect_AWADDR),
        .M_AXI_awburst(m00_couplers_to_Shared_BRAM_Interconnect_AWBURST),
        .M_AXI_awcache(m00_couplers_to_Shared_BRAM_Interconnect_AWCACHE),
        .M_AXI_awid(m00_couplers_to_Shared_BRAM_Interconnect_AWID),
        .M_AXI_awlen(m00_couplers_to_Shared_BRAM_Interconnect_AWLEN),
        .M_AXI_awlock(m00_couplers_to_Shared_BRAM_Interconnect_AWLOCK),
        .M_AXI_awprot(m00_couplers_to_Shared_BRAM_Interconnect_AWPROT),
        .M_AXI_awready(m00_couplers_to_Shared_BRAM_Interconnect_AWREADY),
        .M_AXI_awsize(m00_couplers_to_Shared_BRAM_Interconnect_AWSIZE),
        .M_AXI_awvalid(m00_couplers_to_Shared_BRAM_Interconnect_AWVALID),
        .M_AXI_bid(m00_couplers_to_Shared_BRAM_Interconnect_BID),
        .M_AXI_bready(m00_couplers_to_Shared_BRAM_Interconnect_BREADY),
        .M_AXI_bresp(m00_couplers_to_Shared_BRAM_Interconnect_BRESP),
        .M_AXI_bvalid(m00_couplers_to_Shared_BRAM_Interconnect_BVALID),
        .M_AXI_rdata(m00_couplers_to_Shared_BRAM_Interconnect_RDATA),
        .M_AXI_rid(m00_couplers_to_Shared_BRAM_Interconnect_RID),
        .M_AXI_rlast(m00_couplers_to_Shared_BRAM_Interconnect_RLAST),
        .M_AXI_rready(m00_couplers_to_Shared_BRAM_Interconnect_RREADY),
        .M_AXI_rresp(m00_couplers_to_Shared_BRAM_Interconnect_RRESP),
        .M_AXI_rvalid(m00_couplers_to_Shared_BRAM_Interconnect_RVALID),
        .M_AXI_wdata(m00_couplers_to_Shared_BRAM_Interconnect_WDATA),
        .M_AXI_wlast(m00_couplers_to_Shared_BRAM_Interconnect_WLAST),
        .M_AXI_wready(m00_couplers_to_Shared_BRAM_Interconnect_WREADY),
        .M_AXI_wstrb(m00_couplers_to_Shared_BRAM_Interconnect_WSTRB),
        .M_AXI_wvalid(m00_couplers_to_Shared_BRAM_Interconnect_WVALID),
        .S_ACLK(Shared_BRAM_Interconnect_ACLK_net),
        .S_ARESETN(Shared_BRAM_Interconnect_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arburst(xbar_to_m00_couplers_ARBURST),
        .S_AXI_arcache(xbar_to_m00_couplers_ARCACHE),
        .S_AXI_arid(xbar_to_m00_couplers_ARID),
        .S_AXI_arlen(xbar_to_m00_couplers_ARLEN),
        .S_AXI_arlock(xbar_to_m00_couplers_ARLOCK),
        .S_AXI_arprot(xbar_to_m00_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arsize(xbar_to_m00_couplers_ARSIZE),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awburst(xbar_to_m00_couplers_AWBURST),
        .S_AXI_awcache(xbar_to_m00_couplers_AWCACHE),
        .S_AXI_awid(xbar_to_m00_couplers_AWID),
        .S_AXI_awlen(xbar_to_m00_couplers_AWLEN),
        .S_AXI_awlock(xbar_to_m00_couplers_AWLOCK),
        .S_AXI_awprot(xbar_to_m00_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awsize(xbar_to_m00_couplers_AWSIZE),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bid(xbar_to_m00_couplers_BID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rid(xbar_to_m00_couplers_RID),
        .S_AXI_rlast(xbar_to_m00_couplers_RLAST),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wlast(xbar_to_m00_couplers_WLAST),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  s00_couplers_imp_11JA7UH s00_couplers
       (.M_ACLK(Shared_BRAM_Interconnect_ACLK_net),
        .M_ARESETN(Shared_BRAM_Interconnect_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arburst(s00_couplers_to_xbar_ARBURST),
        .M_AXI_arcache(s00_couplers_to_xbar_ARCACHE),
        .M_AXI_arlen(s00_couplers_to_xbar_ARLEN),
        .M_AXI_arlock(s00_couplers_to_xbar_ARLOCK),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arqos(s00_couplers_to_xbar_ARQOS),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arsize(s00_couplers_to_xbar_ARSIZE),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awburst(s00_couplers_to_xbar_AWBURST),
        .M_AXI_awcache(s00_couplers_to_xbar_AWCACHE),
        .M_AXI_awlen(s00_couplers_to_xbar_AWLEN),
        .M_AXI_awlock(s00_couplers_to_xbar_AWLOCK),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awqos(s00_couplers_to_xbar_AWQOS),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awsize(s00_couplers_to_xbar_AWSIZE),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rlast(s00_couplers_to_xbar_RLAST),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wlast(s00_couplers_to_xbar_WLAST),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(Shared_BRAM_Interconnect_to_s00_couplers_ARADDR),
        .S_AXI_arprot(Shared_BRAM_Interconnect_to_s00_couplers_ARPROT),
        .S_AXI_arready(Shared_BRAM_Interconnect_to_s00_couplers_ARREADY),
        .S_AXI_arvalid(Shared_BRAM_Interconnect_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(Shared_BRAM_Interconnect_to_s00_couplers_AWADDR),
        .S_AXI_awprot(Shared_BRAM_Interconnect_to_s00_couplers_AWPROT),
        .S_AXI_awready(Shared_BRAM_Interconnect_to_s00_couplers_AWREADY),
        .S_AXI_awvalid(Shared_BRAM_Interconnect_to_s00_couplers_AWVALID),
        .S_AXI_bready(Shared_BRAM_Interconnect_to_s00_couplers_BREADY),
        .S_AXI_bresp(Shared_BRAM_Interconnect_to_s00_couplers_BRESP),
        .S_AXI_bvalid(Shared_BRAM_Interconnect_to_s00_couplers_BVALID),
        .S_AXI_rdata(Shared_BRAM_Interconnect_to_s00_couplers_RDATA),
        .S_AXI_rready(Shared_BRAM_Interconnect_to_s00_couplers_RREADY),
        .S_AXI_rresp(Shared_BRAM_Interconnect_to_s00_couplers_RRESP),
        .S_AXI_rvalid(Shared_BRAM_Interconnect_to_s00_couplers_RVALID),
        .S_AXI_wdata(Shared_BRAM_Interconnect_to_s00_couplers_WDATA),
        .S_AXI_wready(Shared_BRAM_Interconnect_to_s00_couplers_WREADY),
        .S_AXI_wstrb(Shared_BRAM_Interconnect_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(Shared_BRAM_Interconnect_to_s00_couplers_WVALID));
  s01_couplers_imp_6TVE7B s01_couplers
       (.M_ACLK(Shared_BRAM_Interconnect_ACLK_net),
        .M_ARESETN(Shared_BRAM_Interconnect_ARESETN_net),
        .M_AXI_araddr(s01_couplers_to_xbar_ARADDR),
        .M_AXI_arburst(s01_couplers_to_xbar_ARBURST),
        .M_AXI_arcache(s01_couplers_to_xbar_ARCACHE),
        .M_AXI_arid(s01_couplers_to_xbar_ARID),
        .M_AXI_arlen(s01_couplers_to_xbar_ARLEN),
        .M_AXI_arlock(s01_couplers_to_xbar_ARLOCK),
        .M_AXI_arprot(s01_couplers_to_xbar_ARPROT),
        .M_AXI_arqos(s01_couplers_to_xbar_ARQOS),
        .M_AXI_arready(s01_couplers_to_xbar_ARREADY),
        .M_AXI_arsize(s01_couplers_to_xbar_ARSIZE),
        .M_AXI_arvalid(s01_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s01_couplers_to_xbar_AWADDR),
        .M_AXI_awburst(s01_couplers_to_xbar_AWBURST),
        .M_AXI_awcache(s01_couplers_to_xbar_AWCACHE),
        .M_AXI_awid(s01_couplers_to_xbar_AWID),
        .M_AXI_awlen(s01_couplers_to_xbar_AWLEN),
        .M_AXI_awlock(s01_couplers_to_xbar_AWLOCK),
        .M_AXI_awprot(s01_couplers_to_xbar_AWPROT),
        .M_AXI_awqos(s01_couplers_to_xbar_AWQOS),
        .M_AXI_awready(s01_couplers_to_xbar_AWREADY),
        .M_AXI_awsize(s01_couplers_to_xbar_AWSIZE),
        .M_AXI_awvalid(s01_couplers_to_xbar_AWVALID),
        .M_AXI_bid(s01_couplers_to_xbar_BID),
        .M_AXI_bready(s01_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s01_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s01_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s01_couplers_to_xbar_RDATA),
        .M_AXI_rid(s01_couplers_to_xbar_RID),
        .M_AXI_rlast(s01_couplers_to_xbar_RLAST),
        .M_AXI_rready(s01_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s01_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s01_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s01_couplers_to_xbar_WDATA),
        .M_AXI_wlast(s01_couplers_to_xbar_WLAST),
        .M_AXI_wready(s01_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s01_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s01_couplers_to_xbar_WVALID),
        .S_ACLK(S01_ACLK_1),
        .S_ARESETN(S01_ARESETN_1),
        .S_AXI_araddr(Shared_BRAM_Interconnect_to_s01_couplers_ARADDR),
        .S_AXI_arburst(Shared_BRAM_Interconnect_to_s01_couplers_ARBURST),
        .S_AXI_arcache(Shared_BRAM_Interconnect_to_s01_couplers_ARCACHE),
        .S_AXI_arid(Shared_BRAM_Interconnect_to_s01_couplers_ARID),
        .S_AXI_arlen(Shared_BRAM_Interconnect_to_s01_couplers_ARLEN),
        .S_AXI_arlock(Shared_BRAM_Interconnect_to_s01_couplers_ARLOCK),
        .S_AXI_arprot(Shared_BRAM_Interconnect_to_s01_couplers_ARPROT),
        .S_AXI_arqos(Shared_BRAM_Interconnect_to_s01_couplers_ARQOS),
        .S_AXI_arready(Shared_BRAM_Interconnect_to_s01_couplers_ARREADY),
        .S_AXI_arsize(Shared_BRAM_Interconnect_to_s01_couplers_ARSIZE),
        .S_AXI_arvalid(Shared_BRAM_Interconnect_to_s01_couplers_ARVALID),
        .S_AXI_awaddr(Shared_BRAM_Interconnect_to_s01_couplers_AWADDR),
        .S_AXI_awburst(Shared_BRAM_Interconnect_to_s01_couplers_AWBURST),
        .S_AXI_awcache(Shared_BRAM_Interconnect_to_s01_couplers_AWCACHE),
        .S_AXI_awid(Shared_BRAM_Interconnect_to_s01_couplers_AWID),
        .S_AXI_awlen(Shared_BRAM_Interconnect_to_s01_couplers_AWLEN),
        .S_AXI_awlock(Shared_BRAM_Interconnect_to_s01_couplers_AWLOCK),
        .S_AXI_awprot(Shared_BRAM_Interconnect_to_s01_couplers_AWPROT),
        .S_AXI_awqos(Shared_BRAM_Interconnect_to_s01_couplers_AWQOS),
        .S_AXI_awready(Shared_BRAM_Interconnect_to_s01_couplers_AWREADY),
        .S_AXI_awsize(Shared_BRAM_Interconnect_to_s01_couplers_AWSIZE),
        .S_AXI_awvalid(Shared_BRAM_Interconnect_to_s01_couplers_AWVALID),
        .S_AXI_bid(Shared_BRAM_Interconnect_to_s01_couplers_BID),
        .S_AXI_bready(Shared_BRAM_Interconnect_to_s01_couplers_BREADY),
        .S_AXI_bresp(Shared_BRAM_Interconnect_to_s01_couplers_BRESP),
        .S_AXI_bvalid(Shared_BRAM_Interconnect_to_s01_couplers_BVALID),
        .S_AXI_rdata(Shared_BRAM_Interconnect_to_s01_couplers_RDATA),
        .S_AXI_rid(Shared_BRAM_Interconnect_to_s01_couplers_RID),
        .S_AXI_rlast(Shared_BRAM_Interconnect_to_s01_couplers_RLAST),
        .S_AXI_rready(Shared_BRAM_Interconnect_to_s01_couplers_RREADY),
        .S_AXI_rresp(Shared_BRAM_Interconnect_to_s01_couplers_RRESP),
        .S_AXI_rvalid(Shared_BRAM_Interconnect_to_s01_couplers_RVALID),
        .S_AXI_wdata(Shared_BRAM_Interconnect_to_s01_couplers_WDATA),
        .S_AXI_wid(Shared_BRAM_Interconnect_to_s01_couplers_WID),
        .S_AXI_wlast(Shared_BRAM_Interconnect_to_s01_couplers_WLAST),
        .S_AXI_wready(Shared_BRAM_Interconnect_to_s01_couplers_WREADY),
        .S_AXI_wstrb(Shared_BRAM_Interconnect_to_s01_couplers_WSTRB),
        .S_AXI_wvalid(Shared_BRAM_Interconnect_to_s01_couplers_WVALID));
  shared_bram_xbar_0 xbar
       (.aclk(Shared_BRAM_Interconnect_ACLK_net),
        .aresetn(Shared_BRAM_Interconnect_ARESETN_net),
        .m_axi_araddr(xbar_to_m00_couplers_ARADDR),
        .m_axi_arburst(xbar_to_m00_couplers_ARBURST),
        .m_axi_arcache(xbar_to_m00_couplers_ARCACHE),
        .m_axi_arid(xbar_to_m00_couplers_ARID),
        .m_axi_arlen(xbar_to_m00_couplers_ARLEN),
        .m_axi_arlock(xbar_to_m00_couplers_ARLOCK),
        .m_axi_arprot(xbar_to_m00_couplers_ARPROT),
        .m_axi_arready(xbar_to_m00_couplers_ARREADY),
        .m_axi_arsize(xbar_to_m00_couplers_ARSIZE),
        .m_axi_arvalid(xbar_to_m00_couplers_ARVALID),
        .m_axi_awaddr(xbar_to_m00_couplers_AWADDR),
        .m_axi_awburst(xbar_to_m00_couplers_AWBURST),
        .m_axi_awcache(xbar_to_m00_couplers_AWCACHE),
        .m_axi_awid(xbar_to_m00_couplers_AWID),
        .m_axi_awlen(xbar_to_m00_couplers_AWLEN),
        .m_axi_awlock(xbar_to_m00_couplers_AWLOCK),
        .m_axi_awprot(xbar_to_m00_couplers_AWPROT),
        .m_axi_awready(xbar_to_m00_couplers_AWREADY),
        .m_axi_awsize(xbar_to_m00_couplers_AWSIZE),
        .m_axi_awvalid(xbar_to_m00_couplers_AWVALID),
        .m_axi_bid(xbar_to_m00_couplers_BID),
        .m_axi_bready(xbar_to_m00_couplers_BREADY),
        .m_axi_bresp(xbar_to_m00_couplers_BRESP),
        .m_axi_bvalid(xbar_to_m00_couplers_BVALID),
        .m_axi_rdata(xbar_to_m00_couplers_RDATA),
        .m_axi_rid(xbar_to_m00_couplers_RID),
        .m_axi_rlast(xbar_to_m00_couplers_RLAST),
        .m_axi_rready(xbar_to_m00_couplers_RREADY),
        .m_axi_rresp(xbar_to_m00_couplers_RRESP),
        .m_axi_rvalid(xbar_to_m00_couplers_RVALID),
        .m_axi_wdata(xbar_to_m00_couplers_WDATA),
        .m_axi_wlast(xbar_to_m00_couplers_WLAST),
        .m_axi_wready(xbar_to_m00_couplers_WREADY),
        .m_axi_wstrb(xbar_to_m00_couplers_WSTRB),
        .m_axi_wvalid(xbar_to_m00_couplers_WVALID),
        .s_axi_araddr({s01_couplers_to_xbar_ARADDR,s00_couplers_to_xbar_ARADDR}),
        .s_axi_arburst({s01_couplers_to_xbar_ARBURST,s00_couplers_to_xbar_ARBURST}),
        .s_axi_arcache({s01_couplers_to_xbar_ARCACHE,s00_couplers_to_xbar_ARCACHE}),
        .s_axi_arid({1'b0,s01_couplers_to_xbar_ARID,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({s01_couplers_to_xbar_ARLEN,s00_couplers_to_xbar_ARLEN}),
        .s_axi_arlock({s01_couplers_to_xbar_ARLOCK,s00_couplers_to_xbar_ARLOCK}),
        .s_axi_arprot({s01_couplers_to_xbar_ARPROT,s00_couplers_to_xbar_ARPROT}),
        .s_axi_arqos({s01_couplers_to_xbar_ARQOS,s00_couplers_to_xbar_ARQOS}),
        .s_axi_arready({s01_couplers_to_xbar_ARREADY,s00_couplers_to_xbar_ARREADY}),
        .s_axi_arsize({s01_couplers_to_xbar_ARSIZE,s00_couplers_to_xbar_ARSIZE}),
        .s_axi_arvalid({s01_couplers_to_xbar_ARVALID,s00_couplers_to_xbar_ARVALID}),
        .s_axi_awaddr({s01_couplers_to_xbar_AWADDR,s00_couplers_to_xbar_AWADDR}),
        .s_axi_awburst({s01_couplers_to_xbar_AWBURST,s00_couplers_to_xbar_AWBURST}),
        .s_axi_awcache({s01_couplers_to_xbar_AWCACHE,s00_couplers_to_xbar_AWCACHE}),
        .s_axi_awid({1'b0,s01_couplers_to_xbar_AWID,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({s01_couplers_to_xbar_AWLEN,s00_couplers_to_xbar_AWLEN}),
        .s_axi_awlock({s01_couplers_to_xbar_AWLOCK,s00_couplers_to_xbar_AWLOCK}),
        .s_axi_awprot({s01_couplers_to_xbar_AWPROT,s00_couplers_to_xbar_AWPROT}),
        .s_axi_awqos({s01_couplers_to_xbar_AWQOS,s00_couplers_to_xbar_AWQOS}),
        .s_axi_awready({s01_couplers_to_xbar_AWREADY,s00_couplers_to_xbar_AWREADY}),
        .s_axi_awsize({s01_couplers_to_xbar_AWSIZE,s00_couplers_to_xbar_AWSIZE}),
        .s_axi_awvalid({s01_couplers_to_xbar_AWVALID,s00_couplers_to_xbar_AWVALID}),
        .s_axi_bid({s01_couplers_to_xbar_BID,NLW_xbar_s_axi_bid_UNCONNECTED[12:0]}),
        .s_axi_bready({s01_couplers_to_xbar_BREADY,s00_couplers_to_xbar_BREADY}),
        .s_axi_bresp({s01_couplers_to_xbar_BRESP,s00_couplers_to_xbar_BRESP}),
        .s_axi_bvalid({s01_couplers_to_xbar_BVALID,s00_couplers_to_xbar_BVALID}),
        .s_axi_rdata({s01_couplers_to_xbar_RDATA,s00_couplers_to_xbar_RDATA}),
        .s_axi_rid({s01_couplers_to_xbar_RID,NLW_xbar_s_axi_rid_UNCONNECTED[12:0]}),
        .s_axi_rlast({s01_couplers_to_xbar_RLAST,s00_couplers_to_xbar_RLAST}),
        .s_axi_rready({s01_couplers_to_xbar_RREADY,s00_couplers_to_xbar_RREADY}),
        .s_axi_rresp({s01_couplers_to_xbar_RRESP,s00_couplers_to_xbar_RRESP}),
        .s_axi_rvalid({s01_couplers_to_xbar_RVALID,s00_couplers_to_xbar_RVALID}),
        .s_axi_wdata({s01_couplers_to_xbar_WDATA,s00_couplers_to_xbar_WDATA}),
        .s_axi_wlast({s01_couplers_to_xbar_WLAST,s00_couplers_to_xbar_WLAST}),
        .s_axi_wready({s01_couplers_to_xbar_WREADY,s00_couplers_to_xbar_WREADY}),
        .s_axi_wstrb({s01_couplers_to_xbar_WSTRB,s00_couplers_to_xbar_WSTRB}),
        .s_axi_wvalid({s01_couplers_to_xbar_WVALID,s00_couplers_to_xbar_WVALID}));
endmodule

module shared_bram_axi_interconnect_0_1
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M01_ACLK,
    M01_ARESETN,
    M01_AXI_araddr,
    M01_AXI_arprot,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awprot,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wstrb,
    M01_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arprot,
    S00_AXI_arready,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awprot,
    S00_AXI_awready,
    S00_AXI_awvalid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  input [0:0]M00_AXI_arready;
  output [0:0]M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  input [0:0]M00_AXI_awready;
  output [0:0]M00_AXI_awvalid;
  output [0:0]M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input [0:0]M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output [0:0]M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input [0:0]M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input [0:0]M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output [0:0]M00_AXI_wvalid;
  input M01_ACLK;
  input M01_ARESETN;
  output [31:0]M01_AXI_araddr;
  output [2:0]M01_AXI_arprot;
  input [0:0]M01_AXI_arready;
  output [0:0]M01_AXI_arvalid;
  output [31:0]M01_AXI_awaddr;
  output [2:0]M01_AXI_awprot;
  input [0:0]M01_AXI_awready;
  output [0:0]M01_AXI_awvalid;
  output [0:0]M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input [0:0]M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output [0:0]M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input [0:0]M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input [0:0]M01_AXI_wready;
  output [3:0]M01_AXI_wstrb;
  output [0:0]M01_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [2:0]S00_AXI_arprot;
  output [0:0]S00_AXI_arready;
  input [0:0]S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [2:0]S00_AXI_awprot;
  output [0:0]S00_AXI_awready;
  input [0:0]S00_AXI_awvalid;
  input [0:0]S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output [0:0]S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  input [0:0]S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output [0:0]S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  output [0:0]S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input [0:0]S00_AXI_wvalid;

  wire M00_ACLK_1;
  wire M00_ARESETN_1;
  wire M01_ACLK_1;
  wire M01_ARESETN_1;
  wire MB_Pheripheral_Interconnect_ACLK_net;
  wire MB_Pheripheral_Interconnect_ARESETN_net;
  wire [31:0]MB_Pheripheral_Interconnect_to_s00_couplers_ARADDR;
  wire [2:0]MB_Pheripheral_Interconnect_to_s00_couplers_ARPROT;
  wire [0:0]MB_Pheripheral_Interconnect_to_s00_couplers_ARREADY;
  wire [0:0]MB_Pheripheral_Interconnect_to_s00_couplers_ARVALID;
  wire [31:0]MB_Pheripheral_Interconnect_to_s00_couplers_AWADDR;
  wire [2:0]MB_Pheripheral_Interconnect_to_s00_couplers_AWPROT;
  wire [0:0]MB_Pheripheral_Interconnect_to_s00_couplers_AWREADY;
  wire [0:0]MB_Pheripheral_Interconnect_to_s00_couplers_AWVALID;
  wire [0:0]MB_Pheripheral_Interconnect_to_s00_couplers_BREADY;
  wire [1:0]MB_Pheripheral_Interconnect_to_s00_couplers_BRESP;
  wire [0:0]MB_Pheripheral_Interconnect_to_s00_couplers_BVALID;
  wire [31:0]MB_Pheripheral_Interconnect_to_s00_couplers_RDATA;
  wire [0:0]MB_Pheripheral_Interconnect_to_s00_couplers_RREADY;
  wire [1:0]MB_Pheripheral_Interconnect_to_s00_couplers_RRESP;
  wire [0:0]MB_Pheripheral_Interconnect_to_s00_couplers_RVALID;
  wire [31:0]MB_Pheripheral_Interconnect_to_s00_couplers_WDATA;
  wire [0:0]MB_Pheripheral_Interconnect_to_s00_couplers_WREADY;
  wire [3:0]MB_Pheripheral_Interconnect_to_s00_couplers_WSTRB;
  wire [0:0]MB_Pheripheral_Interconnect_to_s00_couplers_WVALID;
  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire [31:0]m00_couplers_to_MB_Pheripheral_Interconnect_ARADDR;
  wire [0:0]m00_couplers_to_MB_Pheripheral_Interconnect_ARREADY;
  wire m00_couplers_to_MB_Pheripheral_Interconnect_ARVALID;
  wire [31:0]m00_couplers_to_MB_Pheripheral_Interconnect_AWADDR;
  wire [0:0]m00_couplers_to_MB_Pheripheral_Interconnect_AWREADY;
  wire m00_couplers_to_MB_Pheripheral_Interconnect_AWVALID;
  wire m00_couplers_to_MB_Pheripheral_Interconnect_BREADY;
  wire [1:0]m00_couplers_to_MB_Pheripheral_Interconnect_BRESP;
  wire [0:0]m00_couplers_to_MB_Pheripheral_Interconnect_BVALID;
  wire [31:0]m00_couplers_to_MB_Pheripheral_Interconnect_RDATA;
  wire m00_couplers_to_MB_Pheripheral_Interconnect_RREADY;
  wire [1:0]m00_couplers_to_MB_Pheripheral_Interconnect_RRESP;
  wire [0:0]m00_couplers_to_MB_Pheripheral_Interconnect_RVALID;
  wire [31:0]m00_couplers_to_MB_Pheripheral_Interconnect_WDATA;
  wire [0:0]m00_couplers_to_MB_Pheripheral_Interconnect_WREADY;
  wire [3:0]m00_couplers_to_MB_Pheripheral_Interconnect_WSTRB;
  wire m00_couplers_to_MB_Pheripheral_Interconnect_WVALID;
  wire [31:0]m01_couplers_to_MB_Pheripheral_Interconnect_ARADDR;
  wire [2:0]m01_couplers_to_MB_Pheripheral_Interconnect_ARPROT;
  wire [0:0]m01_couplers_to_MB_Pheripheral_Interconnect_ARREADY;
  wire [0:0]m01_couplers_to_MB_Pheripheral_Interconnect_ARVALID;
  wire [31:0]m01_couplers_to_MB_Pheripheral_Interconnect_AWADDR;
  wire [2:0]m01_couplers_to_MB_Pheripheral_Interconnect_AWPROT;
  wire [0:0]m01_couplers_to_MB_Pheripheral_Interconnect_AWREADY;
  wire [0:0]m01_couplers_to_MB_Pheripheral_Interconnect_AWVALID;
  wire [0:0]m01_couplers_to_MB_Pheripheral_Interconnect_BREADY;
  wire [1:0]m01_couplers_to_MB_Pheripheral_Interconnect_BRESP;
  wire [0:0]m01_couplers_to_MB_Pheripheral_Interconnect_BVALID;
  wire [31:0]m01_couplers_to_MB_Pheripheral_Interconnect_RDATA;
  wire [0:0]m01_couplers_to_MB_Pheripheral_Interconnect_RREADY;
  wire [1:0]m01_couplers_to_MB_Pheripheral_Interconnect_RRESP;
  wire [0:0]m01_couplers_to_MB_Pheripheral_Interconnect_RVALID;
  wire [31:0]m01_couplers_to_MB_Pheripheral_Interconnect_WDATA;
  wire [0:0]m01_couplers_to_MB_Pheripheral_Interconnect_WREADY;
  wire [3:0]m01_couplers_to_MB_Pheripheral_Interconnect_WSTRB;
  wire [0:0]m01_couplers_to_MB_Pheripheral_Interconnect_WVALID;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire [0:0]s00_couplers_to_xbar_ARVALID;
  wire [31:0]s00_couplers_to_xbar_AWADDR;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire [0:0]s00_couplers_to_xbar_AWVALID;
  wire [0:0]s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire [0:0]s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire [0:0]s00_couplers_to_xbar_WVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire xbar_to_m00_couplers_ARREADY;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire xbar_to_m00_couplers_AWREADY;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire xbar_to_m00_couplers_BVALID;
  wire [31:0]xbar_to_m00_couplers_RDATA;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire xbar_to_m00_couplers_WREADY;
  wire [3:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [63:32]xbar_to_m01_couplers_ARADDR;
  wire [5:3]xbar_to_m01_couplers_ARPROT;
  wire [0:0]xbar_to_m01_couplers_ARREADY;
  wire [1:1]xbar_to_m01_couplers_ARVALID;
  wire [63:32]xbar_to_m01_couplers_AWADDR;
  wire [5:3]xbar_to_m01_couplers_AWPROT;
  wire [0:0]xbar_to_m01_couplers_AWREADY;
  wire [1:1]xbar_to_m01_couplers_AWVALID;
  wire [1:1]xbar_to_m01_couplers_BREADY;
  wire [1:0]xbar_to_m01_couplers_BRESP;
  wire [0:0]xbar_to_m01_couplers_BVALID;
  wire [31:0]xbar_to_m01_couplers_RDATA;
  wire [1:1]xbar_to_m01_couplers_RREADY;
  wire [1:0]xbar_to_m01_couplers_RRESP;
  wire [0:0]xbar_to_m01_couplers_RVALID;
  wire [63:32]xbar_to_m01_couplers_WDATA;
  wire [0:0]xbar_to_m01_couplers_WREADY;
  wire [7:4]xbar_to_m01_couplers_WSTRB;
  wire [1:1]xbar_to_m01_couplers_WVALID;
  wire [5:0]NLW_xbar_m_axi_arprot_UNCONNECTED;
  wire [5:0]NLW_xbar_m_axi_awprot_UNCONNECTED;

  assign M00_ACLK_1 = M00_ACLK;
  assign M00_ARESETN_1 = M00_ARESETN;
  assign M00_AXI_araddr[31:0] = m00_couplers_to_MB_Pheripheral_Interconnect_ARADDR;
  assign M00_AXI_arvalid[0] = m00_couplers_to_MB_Pheripheral_Interconnect_ARVALID;
  assign M00_AXI_awaddr[31:0] = m00_couplers_to_MB_Pheripheral_Interconnect_AWADDR;
  assign M00_AXI_awvalid[0] = m00_couplers_to_MB_Pheripheral_Interconnect_AWVALID;
  assign M00_AXI_bready[0] = m00_couplers_to_MB_Pheripheral_Interconnect_BREADY;
  assign M00_AXI_rready[0] = m00_couplers_to_MB_Pheripheral_Interconnect_RREADY;
  assign M00_AXI_wdata[31:0] = m00_couplers_to_MB_Pheripheral_Interconnect_WDATA;
  assign M00_AXI_wstrb[3:0] = m00_couplers_to_MB_Pheripheral_Interconnect_WSTRB;
  assign M00_AXI_wvalid[0] = m00_couplers_to_MB_Pheripheral_Interconnect_WVALID;
  assign M01_ACLK_1 = M01_ACLK;
  assign M01_ARESETN_1 = M01_ARESETN;
  assign M01_AXI_araddr[31:0] = m01_couplers_to_MB_Pheripheral_Interconnect_ARADDR;
  assign M01_AXI_arprot[2:0] = m01_couplers_to_MB_Pheripheral_Interconnect_ARPROT;
  assign M01_AXI_arvalid[0] = m01_couplers_to_MB_Pheripheral_Interconnect_ARVALID;
  assign M01_AXI_awaddr[31:0] = m01_couplers_to_MB_Pheripheral_Interconnect_AWADDR;
  assign M01_AXI_awprot[2:0] = m01_couplers_to_MB_Pheripheral_Interconnect_AWPROT;
  assign M01_AXI_awvalid[0] = m01_couplers_to_MB_Pheripheral_Interconnect_AWVALID;
  assign M01_AXI_bready[0] = m01_couplers_to_MB_Pheripheral_Interconnect_BREADY;
  assign M01_AXI_rready[0] = m01_couplers_to_MB_Pheripheral_Interconnect_RREADY;
  assign M01_AXI_wdata[31:0] = m01_couplers_to_MB_Pheripheral_Interconnect_WDATA;
  assign M01_AXI_wstrb[3:0] = m01_couplers_to_MB_Pheripheral_Interconnect_WSTRB;
  assign M01_AXI_wvalid[0] = m01_couplers_to_MB_Pheripheral_Interconnect_WVALID;
  assign MB_Pheripheral_Interconnect_ACLK_net = ACLK;
  assign MB_Pheripheral_Interconnect_ARESETN_net = ARESETN;
  assign MB_Pheripheral_Interconnect_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign MB_Pheripheral_Interconnect_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign MB_Pheripheral_Interconnect_to_s00_couplers_ARVALID = S00_AXI_arvalid[0];
  assign MB_Pheripheral_Interconnect_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign MB_Pheripheral_Interconnect_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign MB_Pheripheral_Interconnect_to_s00_couplers_AWVALID = S00_AXI_awvalid[0];
  assign MB_Pheripheral_Interconnect_to_s00_couplers_BREADY = S00_AXI_bready[0];
  assign MB_Pheripheral_Interconnect_to_s00_couplers_RREADY = S00_AXI_rready[0];
  assign MB_Pheripheral_Interconnect_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign MB_Pheripheral_Interconnect_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign MB_Pheripheral_Interconnect_to_s00_couplers_WVALID = S00_AXI_wvalid[0];
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready[0] = MB_Pheripheral_Interconnect_to_s00_couplers_ARREADY;
  assign S00_AXI_awready[0] = MB_Pheripheral_Interconnect_to_s00_couplers_AWREADY;
  assign S00_AXI_bresp[1:0] = MB_Pheripheral_Interconnect_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid[0] = MB_Pheripheral_Interconnect_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = MB_Pheripheral_Interconnect_to_s00_couplers_RDATA;
  assign S00_AXI_rresp[1:0] = MB_Pheripheral_Interconnect_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid[0] = MB_Pheripheral_Interconnect_to_s00_couplers_RVALID;
  assign S00_AXI_wready[0] = MB_Pheripheral_Interconnect_to_s00_couplers_WREADY;
  assign m00_couplers_to_MB_Pheripheral_Interconnect_ARREADY = M00_AXI_arready[0];
  assign m00_couplers_to_MB_Pheripheral_Interconnect_AWREADY = M00_AXI_awready[0];
  assign m00_couplers_to_MB_Pheripheral_Interconnect_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_MB_Pheripheral_Interconnect_BVALID = M00_AXI_bvalid[0];
  assign m00_couplers_to_MB_Pheripheral_Interconnect_RDATA = M00_AXI_rdata[31:0];
  assign m00_couplers_to_MB_Pheripheral_Interconnect_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_MB_Pheripheral_Interconnect_RVALID = M00_AXI_rvalid[0];
  assign m00_couplers_to_MB_Pheripheral_Interconnect_WREADY = M00_AXI_wready[0];
  assign m01_couplers_to_MB_Pheripheral_Interconnect_ARREADY = M01_AXI_arready[0];
  assign m01_couplers_to_MB_Pheripheral_Interconnect_AWREADY = M01_AXI_awready[0];
  assign m01_couplers_to_MB_Pheripheral_Interconnect_BRESP = M01_AXI_bresp[1:0];
  assign m01_couplers_to_MB_Pheripheral_Interconnect_BVALID = M01_AXI_bvalid[0];
  assign m01_couplers_to_MB_Pheripheral_Interconnect_RDATA = M01_AXI_rdata[31:0];
  assign m01_couplers_to_MB_Pheripheral_Interconnect_RRESP = M01_AXI_rresp[1:0];
  assign m01_couplers_to_MB_Pheripheral_Interconnect_RVALID = M01_AXI_rvalid[0];
  assign m01_couplers_to_MB_Pheripheral_Interconnect_WREADY = M01_AXI_wready[0];
  m00_couplers_imp_12W1KYX m00_couplers
       (.M_ACLK(M00_ACLK_1),
        .M_ARESETN(M00_ARESETN_1),
        .M_AXI_araddr(m00_couplers_to_MB_Pheripheral_Interconnect_ARADDR),
        .M_AXI_arready(m00_couplers_to_MB_Pheripheral_Interconnect_ARREADY),
        .M_AXI_arvalid(m00_couplers_to_MB_Pheripheral_Interconnect_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_MB_Pheripheral_Interconnect_AWADDR),
        .M_AXI_awready(m00_couplers_to_MB_Pheripheral_Interconnect_AWREADY),
        .M_AXI_awvalid(m00_couplers_to_MB_Pheripheral_Interconnect_AWVALID),
        .M_AXI_bready(m00_couplers_to_MB_Pheripheral_Interconnect_BREADY),
        .M_AXI_bresp(m00_couplers_to_MB_Pheripheral_Interconnect_BRESP),
        .M_AXI_bvalid(m00_couplers_to_MB_Pheripheral_Interconnect_BVALID),
        .M_AXI_rdata(m00_couplers_to_MB_Pheripheral_Interconnect_RDATA),
        .M_AXI_rready(m00_couplers_to_MB_Pheripheral_Interconnect_RREADY),
        .M_AXI_rresp(m00_couplers_to_MB_Pheripheral_Interconnect_RRESP),
        .M_AXI_rvalid(m00_couplers_to_MB_Pheripheral_Interconnect_RVALID),
        .M_AXI_wdata(m00_couplers_to_MB_Pheripheral_Interconnect_WDATA),
        .M_AXI_wready(m00_couplers_to_MB_Pheripheral_Interconnect_WREADY),
        .M_AXI_wstrb(m00_couplers_to_MB_Pheripheral_Interconnect_WSTRB),
        .M_AXI_wvalid(m00_couplers_to_MB_Pheripheral_Interconnect_WVALID),
        .S_ACLK(MB_Pheripheral_Interconnect_ACLK_net),
        .S_ARESETN(MB_Pheripheral_Interconnect_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  m01_couplers_imp_5J9RSN m01_couplers
       (.M_ACLK(M01_ACLK_1),
        .M_ARESETN(M01_ARESETN_1),
        .M_AXI_araddr(m01_couplers_to_MB_Pheripheral_Interconnect_ARADDR),
        .M_AXI_arprot(m01_couplers_to_MB_Pheripheral_Interconnect_ARPROT),
        .M_AXI_arready(m01_couplers_to_MB_Pheripheral_Interconnect_ARREADY),
        .M_AXI_arvalid(m01_couplers_to_MB_Pheripheral_Interconnect_ARVALID),
        .M_AXI_awaddr(m01_couplers_to_MB_Pheripheral_Interconnect_AWADDR),
        .M_AXI_awprot(m01_couplers_to_MB_Pheripheral_Interconnect_AWPROT),
        .M_AXI_awready(m01_couplers_to_MB_Pheripheral_Interconnect_AWREADY),
        .M_AXI_awvalid(m01_couplers_to_MB_Pheripheral_Interconnect_AWVALID),
        .M_AXI_bready(m01_couplers_to_MB_Pheripheral_Interconnect_BREADY),
        .M_AXI_bresp(m01_couplers_to_MB_Pheripheral_Interconnect_BRESP),
        .M_AXI_bvalid(m01_couplers_to_MB_Pheripheral_Interconnect_BVALID),
        .M_AXI_rdata(m01_couplers_to_MB_Pheripheral_Interconnect_RDATA),
        .M_AXI_rready(m01_couplers_to_MB_Pheripheral_Interconnect_RREADY),
        .M_AXI_rresp(m01_couplers_to_MB_Pheripheral_Interconnect_RRESP),
        .M_AXI_rvalid(m01_couplers_to_MB_Pheripheral_Interconnect_RVALID),
        .M_AXI_wdata(m01_couplers_to_MB_Pheripheral_Interconnect_WDATA),
        .M_AXI_wready(m01_couplers_to_MB_Pheripheral_Interconnect_WREADY),
        .M_AXI_wstrb(m01_couplers_to_MB_Pheripheral_Interconnect_WSTRB),
        .M_AXI_wvalid(m01_couplers_to_MB_Pheripheral_Interconnect_WVALID),
        .S_ACLK(MB_Pheripheral_Interconnect_ACLK_net),
        .S_ARESETN(MB_Pheripheral_Interconnect_ARESETN_net),
        .S_AXI_araddr(xbar_to_m01_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m01_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m01_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m01_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m01_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m01_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m01_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m01_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m01_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m01_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m01_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m01_couplers_RDATA),
        .S_AXI_rready(xbar_to_m01_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m01_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m01_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m01_couplers_WDATA),
        .S_AXI_wready(xbar_to_m01_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m01_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m01_couplers_WVALID));
  s00_couplers_imp_QOHGU1 s00_couplers
       (.M_ACLK(MB_Pheripheral_Interconnect_ACLK_net),
        .M_ARESETN(MB_Pheripheral_Interconnect_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(MB_Pheripheral_Interconnect_to_s00_couplers_ARADDR),
        .S_AXI_arprot(MB_Pheripheral_Interconnect_to_s00_couplers_ARPROT),
        .S_AXI_arready(MB_Pheripheral_Interconnect_to_s00_couplers_ARREADY),
        .S_AXI_arvalid(MB_Pheripheral_Interconnect_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(MB_Pheripheral_Interconnect_to_s00_couplers_AWADDR),
        .S_AXI_awprot(MB_Pheripheral_Interconnect_to_s00_couplers_AWPROT),
        .S_AXI_awready(MB_Pheripheral_Interconnect_to_s00_couplers_AWREADY),
        .S_AXI_awvalid(MB_Pheripheral_Interconnect_to_s00_couplers_AWVALID),
        .S_AXI_bready(MB_Pheripheral_Interconnect_to_s00_couplers_BREADY),
        .S_AXI_bresp(MB_Pheripheral_Interconnect_to_s00_couplers_BRESP),
        .S_AXI_bvalid(MB_Pheripheral_Interconnect_to_s00_couplers_BVALID),
        .S_AXI_rdata(MB_Pheripheral_Interconnect_to_s00_couplers_RDATA),
        .S_AXI_rready(MB_Pheripheral_Interconnect_to_s00_couplers_RREADY),
        .S_AXI_rresp(MB_Pheripheral_Interconnect_to_s00_couplers_RRESP),
        .S_AXI_rvalid(MB_Pheripheral_Interconnect_to_s00_couplers_RVALID),
        .S_AXI_wdata(MB_Pheripheral_Interconnect_to_s00_couplers_WDATA),
        .S_AXI_wready(MB_Pheripheral_Interconnect_to_s00_couplers_WREADY),
        .S_AXI_wstrb(MB_Pheripheral_Interconnect_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(MB_Pheripheral_Interconnect_to_s00_couplers_WVALID));
  shared_bram_xbar_1 xbar
       (.aclk(MB_Pheripheral_Interconnect_ACLK_net),
        .aresetn(MB_Pheripheral_Interconnect_ARESETN_net),
        .m_axi_araddr({xbar_to_m01_couplers_ARADDR,xbar_to_m00_couplers_ARADDR}),
        .m_axi_arprot({xbar_to_m01_couplers_ARPROT,NLW_xbar_m_axi_arprot_UNCONNECTED[2:0]}),
        .m_axi_arready({xbar_to_m01_couplers_ARREADY,xbar_to_m00_couplers_ARREADY}),
        .m_axi_arvalid({xbar_to_m01_couplers_ARVALID,xbar_to_m00_couplers_ARVALID}),
        .m_axi_awaddr({xbar_to_m01_couplers_AWADDR,xbar_to_m00_couplers_AWADDR}),
        .m_axi_awprot({xbar_to_m01_couplers_AWPROT,NLW_xbar_m_axi_awprot_UNCONNECTED[2:0]}),
        .m_axi_awready({xbar_to_m01_couplers_AWREADY,xbar_to_m00_couplers_AWREADY}),
        .m_axi_awvalid({xbar_to_m01_couplers_AWVALID,xbar_to_m00_couplers_AWVALID}),
        .m_axi_bready({xbar_to_m01_couplers_BREADY,xbar_to_m00_couplers_BREADY}),
        .m_axi_bresp({xbar_to_m01_couplers_BRESP,xbar_to_m00_couplers_BRESP}),
        .m_axi_bvalid({xbar_to_m01_couplers_BVALID,xbar_to_m00_couplers_BVALID}),
        .m_axi_rdata({xbar_to_m01_couplers_RDATA,xbar_to_m00_couplers_RDATA}),
        .m_axi_rready({xbar_to_m01_couplers_RREADY,xbar_to_m00_couplers_RREADY}),
        .m_axi_rresp({xbar_to_m01_couplers_RRESP,xbar_to_m00_couplers_RRESP}),
        .m_axi_rvalid({xbar_to_m01_couplers_RVALID,xbar_to_m00_couplers_RVALID}),
        .m_axi_wdata({xbar_to_m01_couplers_WDATA,xbar_to_m00_couplers_WDATA}),
        .m_axi_wready({xbar_to_m01_couplers_WREADY,xbar_to_m00_couplers_WREADY}),
        .m_axi_wstrb({xbar_to_m01_couplers_WSTRB,xbar_to_m00_couplers_WSTRB}),
        .m_axi_wvalid({xbar_to_m01_couplers_WVALID,xbar_to_m00_couplers_WVALID}),
        .s_axi_araddr(s00_couplers_to_xbar_ARADDR),
        .s_axi_arprot(s00_couplers_to_xbar_ARPROT),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arvalid(s00_couplers_to_xbar_ARVALID),
        .s_axi_awaddr(s00_couplers_to_xbar_AWADDR),
        .s_axi_awprot(s00_couplers_to_xbar_AWPROT),
        .s_axi_awready(s00_couplers_to_xbar_AWREADY),
        .s_axi_awvalid(s00_couplers_to_xbar_AWVALID),
        .s_axi_bready(s00_couplers_to_xbar_BREADY),
        .s_axi_bresp(s00_couplers_to_xbar_BRESP),
        .s_axi_bvalid(s00_couplers_to_xbar_BVALID),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rready(s00_couplers_to_xbar_RREADY),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata(s00_couplers_to_xbar_WDATA),
        .s_axi_wready(s00_couplers_to_xbar_WREADY),
        .s_axi_wstrb(s00_couplers_to_xbar_WSTRB),
        .s_axi_wvalid(s00_couplers_to_xbar_WVALID));
endmodule

module shared_bram_axi_interconnect_0_2
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wid,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  input M00_AXI_arready;
  output M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  input M00_AXI_awready;
  output M00_AXI_awvalid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [11:0]S00_AXI_arid;
  input [3:0]S00_AXI_arlen;
  input [1:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [11:0]S00_AXI_awid;
  input [3:0]S00_AXI_awlen;
  input [1:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [11:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  output [11:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  input [11:0]S00_AXI_wid;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire Zync_Pheriperal_interconnect_ACLK_net;
  wire Zync_Pheriperal_interconnect_ARESETN_net;
  wire [31:0]Zync_Pheriperal_interconnect_to_s00_couplers_ARADDR;
  wire [1:0]Zync_Pheriperal_interconnect_to_s00_couplers_ARBURST;
  wire [3:0]Zync_Pheriperal_interconnect_to_s00_couplers_ARCACHE;
  wire [11:0]Zync_Pheriperal_interconnect_to_s00_couplers_ARID;
  wire [3:0]Zync_Pheriperal_interconnect_to_s00_couplers_ARLEN;
  wire [1:0]Zync_Pheriperal_interconnect_to_s00_couplers_ARLOCK;
  wire [2:0]Zync_Pheriperal_interconnect_to_s00_couplers_ARPROT;
  wire [3:0]Zync_Pheriperal_interconnect_to_s00_couplers_ARQOS;
  wire Zync_Pheriperal_interconnect_to_s00_couplers_ARREADY;
  wire [2:0]Zync_Pheriperal_interconnect_to_s00_couplers_ARSIZE;
  wire Zync_Pheriperal_interconnect_to_s00_couplers_ARVALID;
  wire [31:0]Zync_Pheriperal_interconnect_to_s00_couplers_AWADDR;
  wire [1:0]Zync_Pheriperal_interconnect_to_s00_couplers_AWBURST;
  wire [3:0]Zync_Pheriperal_interconnect_to_s00_couplers_AWCACHE;
  wire [11:0]Zync_Pheriperal_interconnect_to_s00_couplers_AWID;
  wire [3:0]Zync_Pheriperal_interconnect_to_s00_couplers_AWLEN;
  wire [1:0]Zync_Pheriperal_interconnect_to_s00_couplers_AWLOCK;
  wire [2:0]Zync_Pheriperal_interconnect_to_s00_couplers_AWPROT;
  wire [3:0]Zync_Pheriperal_interconnect_to_s00_couplers_AWQOS;
  wire Zync_Pheriperal_interconnect_to_s00_couplers_AWREADY;
  wire [2:0]Zync_Pheriperal_interconnect_to_s00_couplers_AWSIZE;
  wire Zync_Pheriperal_interconnect_to_s00_couplers_AWVALID;
  wire [11:0]Zync_Pheriperal_interconnect_to_s00_couplers_BID;
  wire Zync_Pheriperal_interconnect_to_s00_couplers_BREADY;
  wire [1:0]Zync_Pheriperal_interconnect_to_s00_couplers_BRESP;
  wire Zync_Pheriperal_interconnect_to_s00_couplers_BVALID;
  wire [31:0]Zync_Pheriperal_interconnect_to_s00_couplers_RDATA;
  wire [11:0]Zync_Pheriperal_interconnect_to_s00_couplers_RID;
  wire Zync_Pheriperal_interconnect_to_s00_couplers_RLAST;
  wire Zync_Pheriperal_interconnect_to_s00_couplers_RREADY;
  wire [1:0]Zync_Pheriperal_interconnect_to_s00_couplers_RRESP;
  wire Zync_Pheriperal_interconnect_to_s00_couplers_RVALID;
  wire [31:0]Zync_Pheriperal_interconnect_to_s00_couplers_WDATA;
  wire [11:0]Zync_Pheriperal_interconnect_to_s00_couplers_WID;
  wire Zync_Pheriperal_interconnect_to_s00_couplers_WLAST;
  wire Zync_Pheriperal_interconnect_to_s00_couplers_WREADY;
  wire [3:0]Zync_Pheriperal_interconnect_to_s00_couplers_WSTRB;
  wire Zync_Pheriperal_interconnect_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_Zync_Pheriperal_interconnect_ARADDR;
  wire s00_couplers_to_Zync_Pheriperal_interconnect_ARREADY;
  wire s00_couplers_to_Zync_Pheriperal_interconnect_ARVALID;
  wire [31:0]s00_couplers_to_Zync_Pheriperal_interconnect_AWADDR;
  wire s00_couplers_to_Zync_Pheriperal_interconnect_AWREADY;
  wire s00_couplers_to_Zync_Pheriperal_interconnect_AWVALID;
  wire s00_couplers_to_Zync_Pheriperal_interconnect_BREADY;
  wire [1:0]s00_couplers_to_Zync_Pheriperal_interconnect_BRESP;
  wire s00_couplers_to_Zync_Pheriperal_interconnect_BVALID;
  wire [31:0]s00_couplers_to_Zync_Pheriperal_interconnect_RDATA;
  wire s00_couplers_to_Zync_Pheriperal_interconnect_RREADY;
  wire [1:0]s00_couplers_to_Zync_Pheriperal_interconnect_RRESP;
  wire s00_couplers_to_Zync_Pheriperal_interconnect_RVALID;
  wire [31:0]s00_couplers_to_Zync_Pheriperal_interconnect_WDATA;
  wire s00_couplers_to_Zync_Pheriperal_interconnect_WREADY;
  wire [3:0]s00_couplers_to_Zync_Pheriperal_interconnect_WSTRB;
  wire s00_couplers_to_Zync_Pheriperal_interconnect_WVALID;

  assign M00_AXI_araddr[31:0] = s00_couplers_to_Zync_Pheriperal_interconnect_ARADDR;
  assign M00_AXI_arvalid = s00_couplers_to_Zync_Pheriperal_interconnect_ARVALID;
  assign M00_AXI_awaddr[31:0] = s00_couplers_to_Zync_Pheriperal_interconnect_AWADDR;
  assign M00_AXI_awvalid = s00_couplers_to_Zync_Pheriperal_interconnect_AWVALID;
  assign M00_AXI_bready = s00_couplers_to_Zync_Pheriperal_interconnect_BREADY;
  assign M00_AXI_rready = s00_couplers_to_Zync_Pheriperal_interconnect_RREADY;
  assign M00_AXI_wdata[31:0] = s00_couplers_to_Zync_Pheriperal_interconnect_WDATA;
  assign M00_AXI_wstrb[3:0] = s00_couplers_to_Zync_Pheriperal_interconnect_WSTRB;
  assign M00_AXI_wvalid = s00_couplers_to_Zync_Pheriperal_interconnect_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready = Zync_Pheriperal_interconnect_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = Zync_Pheriperal_interconnect_to_s00_couplers_AWREADY;
  assign S00_AXI_bid[11:0] = Zync_Pheriperal_interconnect_to_s00_couplers_BID;
  assign S00_AXI_bresp[1:0] = Zync_Pheriperal_interconnect_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = Zync_Pheriperal_interconnect_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = Zync_Pheriperal_interconnect_to_s00_couplers_RDATA;
  assign S00_AXI_rid[11:0] = Zync_Pheriperal_interconnect_to_s00_couplers_RID;
  assign S00_AXI_rlast = Zync_Pheriperal_interconnect_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = Zync_Pheriperal_interconnect_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = Zync_Pheriperal_interconnect_to_s00_couplers_RVALID;
  assign S00_AXI_wready = Zync_Pheriperal_interconnect_to_s00_couplers_WREADY;
  assign Zync_Pheriperal_interconnect_ACLK_net = M00_ACLK;
  assign Zync_Pheriperal_interconnect_ARESETN_net = M00_ARESETN;
  assign Zync_Pheriperal_interconnect_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign Zync_Pheriperal_interconnect_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign Zync_Pheriperal_interconnect_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign Zync_Pheriperal_interconnect_to_s00_couplers_ARID = S00_AXI_arid[11:0];
  assign Zync_Pheriperal_interconnect_to_s00_couplers_ARLEN = S00_AXI_arlen[3:0];
  assign Zync_Pheriperal_interconnect_to_s00_couplers_ARLOCK = S00_AXI_arlock[1:0];
  assign Zync_Pheriperal_interconnect_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign Zync_Pheriperal_interconnect_to_s00_couplers_ARQOS = S00_AXI_arqos[3:0];
  assign Zync_Pheriperal_interconnect_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign Zync_Pheriperal_interconnect_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign Zync_Pheriperal_interconnect_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign Zync_Pheriperal_interconnect_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign Zync_Pheriperal_interconnect_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign Zync_Pheriperal_interconnect_to_s00_couplers_AWID = S00_AXI_awid[11:0];
  assign Zync_Pheriperal_interconnect_to_s00_couplers_AWLEN = S00_AXI_awlen[3:0];
  assign Zync_Pheriperal_interconnect_to_s00_couplers_AWLOCK = S00_AXI_awlock[1:0];
  assign Zync_Pheriperal_interconnect_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign Zync_Pheriperal_interconnect_to_s00_couplers_AWQOS = S00_AXI_awqos[3:0];
  assign Zync_Pheriperal_interconnect_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign Zync_Pheriperal_interconnect_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign Zync_Pheriperal_interconnect_to_s00_couplers_BREADY = S00_AXI_bready;
  assign Zync_Pheriperal_interconnect_to_s00_couplers_RREADY = S00_AXI_rready;
  assign Zync_Pheriperal_interconnect_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign Zync_Pheriperal_interconnect_to_s00_couplers_WID = S00_AXI_wid[11:0];
  assign Zync_Pheriperal_interconnect_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign Zync_Pheriperal_interconnect_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign Zync_Pheriperal_interconnect_to_s00_couplers_WVALID = S00_AXI_wvalid;
  assign s00_couplers_to_Zync_Pheriperal_interconnect_ARREADY = M00_AXI_arready;
  assign s00_couplers_to_Zync_Pheriperal_interconnect_AWREADY = M00_AXI_awready;
  assign s00_couplers_to_Zync_Pheriperal_interconnect_BRESP = M00_AXI_bresp[1:0];
  assign s00_couplers_to_Zync_Pheriperal_interconnect_BVALID = M00_AXI_bvalid;
  assign s00_couplers_to_Zync_Pheriperal_interconnect_RDATA = M00_AXI_rdata[31:0];
  assign s00_couplers_to_Zync_Pheriperal_interconnect_RRESP = M00_AXI_rresp[1:0];
  assign s00_couplers_to_Zync_Pheriperal_interconnect_RVALID = M00_AXI_rvalid;
  assign s00_couplers_to_Zync_Pheriperal_interconnect_WREADY = M00_AXI_wready;
  s00_couplers_imp_1OE3URC s00_couplers
       (.M_ACLK(Zync_Pheriperal_interconnect_ACLK_net),
        .M_ARESETN(Zync_Pheriperal_interconnect_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_Zync_Pheriperal_interconnect_ARADDR),
        .M_AXI_arready(s00_couplers_to_Zync_Pheriperal_interconnect_ARREADY),
        .M_AXI_arvalid(s00_couplers_to_Zync_Pheriperal_interconnect_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_Zync_Pheriperal_interconnect_AWADDR),
        .M_AXI_awready(s00_couplers_to_Zync_Pheriperal_interconnect_AWREADY),
        .M_AXI_awvalid(s00_couplers_to_Zync_Pheriperal_interconnect_AWVALID),
        .M_AXI_bready(s00_couplers_to_Zync_Pheriperal_interconnect_BREADY),
        .M_AXI_bresp(s00_couplers_to_Zync_Pheriperal_interconnect_BRESP),
        .M_AXI_bvalid(s00_couplers_to_Zync_Pheriperal_interconnect_BVALID),
        .M_AXI_rdata(s00_couplers_to_Zync_Pheriperal_interconnect_RDATA),
        .M_AXI_rready(s00_couplers_to_Zync_Pheriperal_interconnect_RREADY),
        .M_AXI_rresp(s00_couplers_to_Zync_Pheriperal_interconnect_RRESP),
        .M_AXI_rvalid(s00_couplers_to_Zync_Pheriperal_interconnect_RVALID),
        .M_AXI_wdata(s00_couplers_to_Zync_Pheriperal_interconnect_WDATA),
        .M_AXI_wready(s00_couplers_to_Zync_Pheriperal_interconnect_WREADY),
        .M_AXI_wstrb(s00_couplers_to_Zync_Pheriperal_interconnect_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_Zync_Pheriperal_interconnect_WVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(Zync_Pheriperal_interconnect_to_s00_couplers_ARADDR),
        .S_AXI_arburst(Zync_Pheriperal_interconnect_to_s00_couplers_ARBURST),
        .S_AXI_arcache(Zync_Pheriperal_interconnect_to_s00_couplers_ARCACHE),
        .S_AXI_arid(Zync_Pheriperal_interconnect_to_s00_couplers_ARID),
        .S_AXI_arlen(Zync_Pheriperal_interconnect_to_s00_couplers_ARLEN),
        .S_AXI_arlock(Zync_Pheriperal_interconnect_to_s00_couplers_ARLOCK),
        .S_AXI_arprot(Zync_Pheriperal_interconnect_to_s00_couplers_ARPROT),
        .S_AXI_arqos(Zync_Pheriperal_interconnect_to_s00_couplers_ARQOS),
        .S_AXI_arready(Zync_Pheriperal_interconnect_to_s00_couplers_ARREADY),
        .S_AXI_arsize(Zync_Pheriperal_interconnect_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(Zync_Pheriperal_interconnect_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(Zync_Pheriperal_interconnect_to_s00_couplers_AWADDR),
        .S_AXI_awburst(Zync_Pheriperal_interconnect_to_s00_couplers_AWBURST),
        .S_AXI_awcache(Zync_Pheriperal_interconnect_to_s00_couplers_AWCACHE),
        .S_AXI_awid(Zync_Pheriperal_interconnect_to_s00_couplers_AWID),
        .S_AXI_awlen(Zync_Pheriperal_interconnect_to_s00_couplers_AWLEN),
        .S_AXI_awlock(Zync_Pheriperal_interconnect_to_s00_couplers_AWLOCK),
        .S_AXI_awprot(Zync_Pheriperal_interconnect_to_s00_couplers_AWPROT),
        .S_AXI_awqos(Zync_Pheriperal_interconnect_to_s00_couplers_AWQOS),
        .S_AXI_awready(Zync_Pheriperal_interconnect_to_s00_couplers_AWREADY),
        .S_AXI_awsize(Zync_Pheriperal_interconnect_to_s00_couplers_AWSIZE),
        .S_AXI_awvalid(Zync_Pheriperal_interconnect_to_s00_couplers_AWVALID),
        .S_AXI_bid(Zync_Pheriperal_interconnect_to_s00_couplers_BID),
        .S_AXI_bready(Zync_Pheriperal_interconnect_to_s00_couplers_BREADY),
        .S_AXI_bresp(Zync_Pheriperal_interconnect_to_s00_couplers_BRESP),
        .S_AXI_bvalid(Zync_Pheriperal_interconnect_to_s00_couplers_BVALID),
        .S_AXI_rdata(Zync_Pheriperal_interconnect_to_s00_couplers_RDATA),
        .S_AXI_rid(Zync_Pheriperal_interconnect_to_s00_couplers_RID),
        .S_AXI_rlast(Zync_Pheriperal_interconnect_to_s00_couplers_RLAST),
        .S_AXI_rready(Zync_Pheriperal_interconnect_to_s00_couplers_RREADY),
        .S_AXI_rresp(Zync_Pheriperal_interconnect_to_s00_couplers_RRESP),
        .S_AXI_rvalid(Zync_Pheriperal_interconnect_to_s00_couplers_RVALID),
        .S_AXI_wdata(Zync_Pheriperal_interconnect_to_s00_couplers_WDATA),
        .S_AXI_wid(Zync_Pheriperal_interconnect_to_s00_couplers_WID),
        .S_AXI_wlast(Zync_Pheriperal_interconnect_to_s00_couplers_WLAST),
        .S_AXI_wready(Zync_Pheriperal_interconnect_to_s00_couplers_WREADY),
        .S_AXI_wstrb(Zync_Pheriperal_interconnect_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(Zync_Pheriperal_interconnect_to_s00_couplers_WVALID));
endmodule
