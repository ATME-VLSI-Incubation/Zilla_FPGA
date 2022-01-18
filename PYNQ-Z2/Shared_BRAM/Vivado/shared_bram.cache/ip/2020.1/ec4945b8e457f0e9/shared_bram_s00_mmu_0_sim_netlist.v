// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Mon Oct 25 12:33:06 2021
// Host        : compute-srv3.eda.atme.in running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ shared_bram_s00_mmu_0_sim_netlist.v
// Design      : shared_bram_s00_mmu_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_mmu_v2_1_19_decerr_slave
   (err_rvalid,
    err_arready,
    \FSM_onehot_gen_write.w_state_reg[1] ,
    \gen_axilite.gen_write.s_axi_bvalid_i_reg_0 ,
    \gen_axilite.gen_read.s_axi_rvalid_i_reg_0 ,
    s_axi_wready,
    \gen_axilite.gen_write.s_axi_awready_i_reg_0 ,
    \FSM_sequential_gen_read.r_state_reg[0] ,
    s_axi_bvalid,
    s_axi_rvalid,
    \FSM_sequential_gen_read.r_state_reg[1] ,
    \gen_axilite.gen_read.s_axi_rvalid_i_reg_1 ,
    aclk,
    \gen_axilite.gen_read.s_axi_arready_i_reg_0 ,
    \FSM_onehot_gen_write.w_state_reg[2] ,
    \FSM_onehot_gen_write.w_state_reg[2]_0 ,
    s_axi_rready,
    \FSM_sequential_gen_read.r_state_reg[1]_0 ,
    r_state,
    ar_pop0,
    s_axi_bready,
    \gen_axilite.gen_write.s_axi_bvalid_i_reg_1 ,
    \FSM_onehot_gen_write.w_state_reg[2]_1 ,
    m_axi_wready,
    sr_axi_wvalid122_in,
    m_axi_awready,
    Q,
    \gen_axilite.gen_read.s_axi_rvalid_i_reg_2 ,
    m_axi_arready,
    m_axi_bvalid,
    m_axi_rvalid,
    s_axi_wvalid,
    E,
    \gen_axilite.gen_write.s_axi_awready_i_reg_1 );
  output err_rvalid;
  output err_arready;
  output \FSM_onehot_gen_write.w_state_reg[1] ;
  output \gen_axilite.gen_write.s_axi_bvalid_i_reg_0 ;
  output \gen_axilite.gen_read.s_axi_rvalid_i_reg_0 ;
  output s_axi_wready;
  output \gen_axilite.gen_write.s_axi_awready_i_reg_0 ;
  output \FSM_sequential_gen_read.r_state_reg[0] ;
  output s_axi_bvalid;
  output s_axi_rvalid;
  output \FSM_sequential_gen_read.r_state_reg[1] ;
  input \gen_axilite.gen_read.s_axi_rvalid_i_reg_1 ;
  input aclk;
  input \gen_axilite.gen_read.s_axi_arready_i_reg_0 ;
  input \FSM_onehot_gen_write.w_state_reg[2] ;
  input \FSM_onehot_gen_write.w_state_reg[2]_0 ;
  input s_axi_rready;
  input \FSM_sequential_gen_read.r_state_reg[1]_0 ;
  input [1:0]r_state;
  input ar_pop0;
  input s_axi_bready;
  input \gen_axilite.gen_write.s_axi_bvalid_i_reg_1 ;
  input \FSM_onehot_gen_write.w_state_reg[2]_1 ;
  input m_axi_wready;
  input sr_axi_wvalid122_in;
  input m_axi_awready;
  input [0:0]Q;
  input [0:0]\gen_axilite.gen_read.s_axi_rvalid_i_reg_2 ;
  input m_axi_arready;
  input m_axi_bvalid;
  input m_axi_rvalid;
  input s_axi_wvalid;
  input [0:0]E;
  input [0:0]\gen_axilite.gen_write.s_axi_awready_i_reg_1 ;

  wire [0:0]E;
  wire \FSM_onehot_gen_write.w_state_reg[1] ;
  wire \FSM_onehot_gen_write.w_state_reg[2] ;
  wire \FSM_onehot_gen_write.w_state_reg[2]_0 ;
  wire \FSM_onehot_gen_write.w_state_reg[2]_1 ;
  wire \FSM_sequential_gen_read.r_state_reg[0] ;
  wire \FSM_sequential_gen_read.r_state_reg[1] ;
  wire \FSM_sequential_gen_read.r_state_reg[1]_0 ;
  wire [0:0]Q;
  wire aclk;
  wire ar_pop0;
  wire err_arready;
  wire err_bvalid;
  wire err_rvalid;
  wire err_wready;
  wire \gen_axilite.gen_read.s_axi_arready_i_reg_0 ;
  wire \gen_axilite.gen_read.s_axi_rvalid_i_i_1_n_0 ;
  wire \gen_axilite.gen_read.s_axi_rvalid_i_reg_0 ;
  wire \gen_axilite.gen_read.s_axi_rvalid_i_reg_1 ;
  wire [0:0]\gen_axilite.gen_read.s_axi_rvalid_i_reg_2 ;
  wire \gen_axilite.gen_write.s_axi_awready_i_i_1_n_0 ;
  wire \gen_axilite.gen_write.s_axi_awready_i_reg_0 ;
  wire [0:0]\gen_axilite.gen_write.s_axi_awready_i_reg_1 ;
  wire \gen_axilite.gen_write.s_axi_bvalid_i_i_1_n_0 ;
  wire \gen_axilite.gen_write.s_axi_bvalid_i_reg_0 ;
  wire \gen_axilite.gen_write.s_axi_bvalid_i_reg_1 ;
  wire m_axi_arready;
  wire m_axi_awready;
  wire m_axi_bvalid;
  wire m_axi_rvalid;
  wire m_axi_wready;
  wire [1:0]r_state;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire s_axi_wready;
  wire s_axi_wvalid;
  wire sr_axi_wvalid122_in;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_onehot_gen_write.w_state[2]_i_2 
       (.I0(\FSM_onehot_gen_write.w_state_reg[2] ),
        .I1(\gen_axilite.gen_write.s_axi_bvalid_i_reg_0 ),
        .I2(\FSM_onehot_gen_write.w_state_reg[2]_0 ),
        .O(\FSM_onehot_gen_write.w_state_reg[1] ));
  LUT6 #(
    .INIT(64'hFFFFFFFF888800F0)) 
    \FSM_onehot_gen_write.w_state[2]_i_3 
       (.I0(err_bvalid),
        .I1(s_axi_bready),
        .I2(\gen_axilite.gen_write.s_axi_bvalid_i_reg_1 ),
        .I3(\FSM_onehot_gen_write.w_state_reg[2] ),
        .I4(\FSM_onehot_gen_write.w_state_reg[2]_0 ),
        .I5(\FSM_onehot_gen_write.w_state_reg[2]_1 ),
        .O(\gen_axilite.gen_write.s_axi_bvalid_i_reg_0 ));
  LUT6 #(
    .INIT(64'h0FF700000FF7FF00)) 
    \FSM_sequential_gen_read.r_state[1]_i_1 
       (.I0(err_rvalid),
        .I1(s_axi_rready),
        .I2(\FSM_sequential_gen_read.r_state_reg[1]_0 ),
        .I3(r_state[0]),
        .I4(r_state[1]),
        .I5(ar_pop0),
        .O(\gen_axilite.gen_read.s_axi_rvalid_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gen_axilite.gen_read.s_axi_arready_i_reg 
       (.C(aclk),
        .CE(1'b1),
        .D(\gen_axilite.gen_read.s_axi_arready_i_reg_0 ),
        .Q(err_arready),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h4444447444444444)) 
    \gen_axilite.gen_read.s_axi_rvalid_i_i_1 
       (.I0(s_axi_rready),
        .I1(err_rvalid),
        .I2(\FSM_sequential_gen_read.r_state_reg[1] ),
        .I3(E),
        .I4(\gen_axilite.gen_read.s_axi_rvalid_i_reg_2 ),
        .I5(err_arready),
        .O(\gen_axilite.gen_read.s_axi_rvalid_i_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \gen_axilite.gen_read.s_axi_rvalid_i_i_2 
       (.I0(r_state[1]),
        .I1(r_state[0]),
        .O(\FSM_sequential_gen_read.r_state_reg[1] ));
  FDRE #(
    .INIT(1'b0)) 
    \gen_axilite.gen_read.s_axi_rvalid_i_reg 
       (.C(aclk),
        .CE(1'b1),
        .D(\gen_axilite.gen_read.s_axi_rvalid_i_i_1_n_0 ),
        .Q(err_rvalid),
        .R(\gen_axilite.gen_read.s_axi_rvalid_i_reg_1 ));
  LUT6 #(
    .INIT(64'hFEFFFFFF01000000)) 
    \gen_axilite.gen_write.s_axi_awready_i_i_1 
       (.I0(err_bvalid),
        .I1(\gen_axilite.gen_write.s_axi_awready_i_reg_1 ),
        .I2(Q),
        .I3(\FSM_onehot_gen_write.w_state_reg[2]_0 ),
        .I4(s_axi_wvalid),
        .I5(err_wready),
        .O(\gen_axilite.gen_write.s_axi_awready_i_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gen_axilite.gen_write.s_axi_awready_i_reg 
       (.C(aclk),
        .CE(1'b1),
        .D(\gen_axilite.gen_write.s_axi_awready_i_i_1_n_0 ),
        .Q(err_wready),
        .R(\gen_axilite.gen_read.s_axi_rvalid_i_reg_1 ));
  LUT6 #(
    .INIT(64'h7444444444444444)) 
    \gen_axilite.gen_write.s_axi_bvalid_i_i_1 
       (.I0(s_axi_bready),
        .I1(err_bvalid),
        .I2(s_axi_wvalid),
        .I3(\FSM_onehot_gen_write.w_state_reg[2]_0 ),
        .I4(\gen_axilite.gen_write.s_axi_bvalid_i_reg_1 ),
        .I5(err_wready),
        .O(\gen_axilite.gen_write.s_axi_bvalid_i_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gen_axilite.gen_write.s_axi_bvalid_i_reg 
       (.C(aclk),
        .CE(1'b1),
        .D(\gen_axilite.gen_write.s_axi_bvalid_i_i_1_n_0 ),
        .Q(err_bvalid),
        .R(\gen_axilite.gen_read.s_axi_rvalid_i_reg_1 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    s_axi_bvalid_INST_0
       (.I0(err_bvalid),
        .I1(\FSM_onehot_gen_write.w_state_reg[2]_0 ),
        .I2(m_axi_bvalid),
        .O(s_axi_bvalid));
  LUT4 #(
    .INIT(16'hFB08)) 
    s_axi_rvalid_INST_0
       (.I0(err_rvalid),
        .I1(r_state[1]),
        .I2(r_state[0]),
        .I3(m_axi_rvalid),
        .O(s_axi_rvalid));
  LUT4 #(
    .INIT(16'hB888)) 
    s_axi_wready_INST_0
       (.I0(err_wready),
        .I1(\FSM_onehot_gen_write.w_state_reg[2]_0 ),
        .I2(m_axi_wready),
        .I3(sr_axi_wvalid122_in),
        .O(s_axi_wready));
  LUT5 #(
    .INIT(32'h00883088)) 
    s_ready_i_i_2
       (.I0(err_wready),
        .I1(\FSM_onehot_gen_write.w_state_reg[2]_0 ),
        .I2(m_axi_awready),
        .I3(Q),
        .I4(\FSM_onehot_gen_write.w_state_reg[2] ),
        .O(\gen_axilite.gen_write.s_axi_awready_i_reg_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hA5400040)) 
    s_ready_i_i_2__0
       (.I0(r_state[0]),
        .I1(err_arready),
        .I2(r_state[1]),
        .I3(\gen_axilite.gen_read.s_axi_rvalid_i_reg_2 ),
        .I4(m_axi_arready),
        .O(\FSM_sequential_gen_read.r_state_reg[0] ));
endmodule

(* C_AXI_ARUSER_WIDTH = "1" *) (* C_AXI_AWUSER_WIDTH = "1" *) (* C_AXI_BUSER_WIDTH = "1" *) 
(* C_AXI_DATA_WIDTH = "32" *) (* C_AXI_ID_WIDTH = "1" *) (* C_AXI_PROTOCOL = "2" *) 
(* C_AXI_RUSER_WIDTH = "1" *) (* C_AXI_SUPPORTS_USER_SIGNALS = "0" *) (* C_AXI_WUSER_WIDTH = "1" *) 
(* C_BASE_ADDR = "64'b0000000000000000000000000000000001000000000000000000000000000000" *) (* C_DEST = "1'b0" *) (* C_DEST_WIDTH = "1" *) 
(* C_FAMILY = "zynq" *) (* C_M_AXI_ADDR_WIDTH = "32" *) (* C_M_AXI_SUPPORTS_READ = "1'b1" *) 
(* C_M_AXI_SUPPORTS_WRITE = "1'b1" *) (* C_NUM_RANGES = "1" *) (* C_PREFIX = "1'b0" *) 
(* C_PREFIX_WIDTH = "1" *) (* C_RANGE_SIZE = "13" *) (* C_S_AXI_ADDR_WIDTH = "32" *) 
(* C_S_AXI_SUPPORTS_READ = "1" *) (* C_S_AXI_SUPPORTS_WRITE = "1" *) (* C_USES_DEST = "0" *) 
(* DowngradeIPIdentifiedWarnings = "yes" *) (* P_AXI3 = "1" *) (* P_AXI4 = "0" *) 
(* P_AXILITE = "2" *) (* P_DECERR = "2'b11" *) (* P_NUM_RANGES_LOG = "1" *) 
(* R_DECERR = "2'b11" *) (* R_IDLE = "2'b00" *) (* R_PENDING = "2'b01" *) 
(* W_DECERR = "2'b11" *) (* W_IDLE = "2'b00" *) (* W_PENDING = "2'b01" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_mmu_v2_1_19_top
   (aclk,
    aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wid,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wuser,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_buser,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_ruser,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_awid,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awuser,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wid,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wuser,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bid,
    m_axi_bresp,
    m_axi_buser,
    m_axi_bvalid,
    m_axi_bready,
    m_axi_arid,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_aruser,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rid,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_ruser,
    m_axi_rvalid,
    m_axi_rready);
  input aclk;
  input aresetn;
  input [0:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [0:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input [0:0]s_axi_awuser;
  input s_axi_awvalid;
  output s_axi_awready;
  input [0:0]s_axi_wid;
  input [31:0]s_axi_wdata;
  input [3:0]s_axi_wstrb;
  input s_axi_wlast;
  input [0:0]s_axi_wuser;
  input s_axi_wvalid;
  output s_axi_wready;
  output [0:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output [0:0]s_axi_buser;
  output s_axi_bvalid;
  input s_axi_bready;
  input [0:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input [0:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input [0:0]s_axi_aruser;
  input s_axi_arvalid;
  output s_axi_arready;
  output [0:0]s_axi_rid;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output [0:0]s_axi_ruser;
  output s_axi_rvalid;
  input s_axi_rready;
  output [0:0]m_axi_awid;
  output [31:0]m_axi_awaddr;
  output [7:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [0:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output [0:0]m_axi_awuser;
  output m_axi_awvalid;
  input m_axi_awready;
  output [0:0]m_axi_wid;
  output [31:0]m_axi_wdata;
  output [3:0]m_axi_wstrb;
  output m_axi_wlast;
  output [0:0]m_axi_wuser;
  output m_axi_wvalid;
  input m_axi_wready;
  input [0:0]m_axi_bid;
  input [1:0]m_axi_bresp;
  input [0:0]m_axi_buser;
  input m_axi_bvalid;
  output m_axi_bready;
  output [0:0]m_axi_arid;
  output [31:0]m_axi_araddr;
  output [7:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [0:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output [0:0]m_axi_aruser;
  output m_axi_arvalid;
  input m_axi_arready;
  input [0:0]m_axi_rid;
  input [31:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input [0:0]m_axi_ruser;
  input m_axi_rvalid;
  output m_axi_rready;

  wire \<const0> ;
  wire \<const1> ;
  wire \FSM_onehot_gen_write.w_state_reg_n_0_[1] ;
  wire \FSM_onehot_gen_write.w_state_reg_n_0_[2] ;
  wire aclk;
  wire ar_pop;
  wire ar_pop0;
  wire aresetn;
  wire aw_pop;
  wire aw_pop0;
  wire decerr_slave_inst_n_10;
  wire decerr_slave_inst_n_2;
  wire decerr_slave_inst_n_3;
  wire decerr_slave_inst_n_4;
  wire decerr_slave_inst_n_6;
  wire decerr_slave_inst_n_7;
  wire err_arready;
  wire err_rvalid;
  wire \gen_read.ar_cnt[0]_i_1_n_0 ;
  wire [5:0]\gen_read.ar_cnt_reg ;
  wire \gen_write.aw_cnt[0]_i_1_n_0 ;
  wire [5:0]\gen_write.aw_cnt_reg ;
  wire \gen_write.w_cnt[0]_i_1_n_0 ;
  wire \gen_write.w_cnt[1]_i_1_n_0 ;
  wire \gen_write.w_cnt[2]_i_1_n_0 ;
  wire \gen_write.w_cnt[3]_i_1_n_0 ;
  wire \gen_write.w_cnt[4]_i_1_n_0 ;
  wire \gen_write.w_cnt[5]_i_1_n_0 ;
  wire \gen_write.w_cnt[5]_i_2_n_0 ;
  wire \gen_write.w_cnt[5]_i_4_n_0 ;
  wire [5:0]\gen_write.w_cnt_reg ;
  wire \gen_write.w_mask_i_2_n_0 ;
  wire \gen_write.w_mask_i_3_n_0 ;
  wire [31:0]m_axi_araddr;
  wire [2:0]m_axi_arprot;
  wire m_axi_arready;
  wire m_axi_arvalid;
  wire [31:0]m_axi_awaddr;
  wire [2:0]m_axi_awprot;
  wire m_axi_awready;
  wire m_axi_awvalid;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire [31:0]m_axi_rdata;
  wire [1:0]m_axi_rresp;
  wire m_axi_rvalid;
  wire m_axi_wready;
  wire m_axi_wvalid;
  wire [32:32]mr_axi_araddr;
  wire mr_axi_arvalid;
  wire [32:32]mr_axi_awaddr;
  wire mr_axi_awvalid;
  wire p_14_in;
  wire [1:0]r_state;
  wire register_slice_inst_n_1;
  wire register_slice_inst_n_3;
  wire register_slice_inst_n_40;
  wire register_slice_inst_n_41;
  wire register_slice_inst_n_42;
  wire register_slice_inst_n_79;
  wire register_slice_inst_n_80;
  wire register_slice_inst_n_81;
  wire register_slice_inst_n_82;
  wire register_slice_inst_n_83;
  wire register_slice_inst_n_85;
  wire register_slice_inst_n_86;
  wire register_slice_inst_n_87;
  wire register_slice_inst_n_88;
  wire register_slice_inst_n_89;
  wire register_slice_inst_n_90;
  wire register_slice_inst_n_91;
  wire register_slice_inst_n_92;
  wire register_slice_inst_n_97;
  wire [31:0]s_axi_araddr;
  wire [2:0]s_axi_arprot;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire [2:0]s_axi_awprot;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [1:0]s_axi_bresp;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire [1:0]s_axi_rresp;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire sr_axi_wvalid122_in;
  wire w_cnt115_out;
  wire w_mask;
  wire w_match;
  wire w_pop;
  wire w_state16_in;

  assign m_axi_arburst[1] = \<const0> ;
  assign m_axi_arburst[0] = \<const0> ;
  assign m_axi_arcache[3] = \<const0> ;
  assign m_axi_arcache[2] = \<const0> ;
  assign m_axi_arcache[1] = \<const0> ;
  assign m_axi_arcache[0] = \<const0> ;
  assign m_axi_arid[0] = \<const0> ;
  assign m_axi_arlen[7] = \<const0> ;
  assign m_axi_arlen[6] = \<const0> ;
  assign m_axi_arlen[5] = \<const0> ;
  assign m_axi_arlen[4] = \<const0> ;
  assign m_axi_arlen[3] = \<const0> ;
  assign m_axi_arlen[2] = \<const0> ;
  assign m_axi_arlen[1] = \<const0> ;
  assign m_axi_arlen[0] = \<const0> ;
  assign m_axi_arlock[0] = \<const0> ;
  assign m_axi_arqos[3] = \<const0> ;
  assign m_axi_arqos[2] = \<const0> ;
  assign m_axi_arqos[1] = \<const0> ;
  assign m_axi_arqos[0] = \<const0> ;
  assign m_axi_arsize[2] = \<const0> ;
  assign m_axi_arsize[1] = \<const1> ;
  assign m_axi_arsize[0] = \<const0> ;
  assign m_axi_aruser[0] = \<const0> ;
  assign m_axi_awburst[1] = \<const0> ;
  assign m_axi_awburst[0] = \<const0> ;
  assign m_axi_awcache[3] = \<const0> ;
  assign m_axi_awcache[2] = \<const0> ;
  assign m_axi_awcache[1] = \<const0> ;
  assign m_axi_awcache[0] = \<const0> ;
  assign m_axi_awid[0] = \<const0> ;
  assign m_axi_awlen[7] = \<const0> ;
  assign m_axi_awlen[6] = \<const0> ;
  assign m_axi_awlen[5] = \<const0> ;
  assign m_axi_awlen[4] = \<const0> ;
  assign m_axi_awlen[3] = \<const0> ;
  assign m_axi_awlen[2] = \<const0> ;
  assign m_axi_awlen[1] = \<const0> ;
  assign m_axi_awlen[0] = \<const0> ;
  assign m_axi_awlock[0] = \<const0> ;
  assign m_axi_awqos[3] = \<const0> ;
  assign m_axi_awqos[2] = \<const0> ;
  assign m_axi_awqos[1] = \<const0> ;
  assign m_axi_awqos[0] = \<const0> ;
  assign m_axi_awsize[2] = \<const0> ;
  assign m_axi_awsize[1] = \<const1> ;
  assign m_axi_awsize[0] = \<const0> ;
  assign m_axi_awuser[0] = \<const0> ;
  assign m_axi_bready = s_axi_bready;
  assign m_axi_rready = s_axi_rready;
  assign m_axi_wdata[31:0] = s_axi_wdata;
  assign m_axi_wid[0] = \<const0> ;
  assign m_axi_wlast = \<const1> ;
  assign m_axi_wstrb[3:0] = s_axi_wstrb;
  assign m_axi_wuser[0] = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_buser[0] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const1> ;
  assign s_axi_ruser[0] = \<const0> ;
  (* FSM_ENCODED_STATES = "W_DECERR:100,iSTATE:001,W_PENDING:010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_gen_write.w_state_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(register_slice_inst_n_3),
        .Q(\FSM_onehot_gen_write.w_state_reg_n_0_[1] ),
        .R(register_slice_inst_n_1));
  (* FSM_ENCODED_STATES = "W_DECERR:100,iSTATE:001,W_PENDING:010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_gen_write.w_state_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(decerr_slave_inst_n_2),
        .Q(\FSM_onehot_gen_write.w_state_reg_n_0_[2] ),
        .R(register_slice_inst_n_1));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \FSM_sequential_gen_read.r_state[1]_i_3 
       (.I0(\gen_read.ar_cnt_reg [5]),
        .I1(\gen_read.ar_cnt_reg [4]),
        .I2(\gen_read.ar_cnt_reg [1]),
        .I3(\gen_read.ar_cnt_reg [0]),
        .I4(\gen_read.ar_cnt_reg [3]),
        .I5(\gen_read.ar_cnt_reg [2]),
        .O(ar_pop0));
  (* FSM_ENCODED_STATES = "R_PENDING:01,iSTATE:00,R_DECERR:10" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_gen_read.r_state_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(register_slice_inst_n_40),
        .Q(r_state[0]),
        .R(register_slice_inst_n_1));
  (* FSM_ENCODED_STATES = "R_PENDING:01,iSTATE:00,R_DECERR:10" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_gen_read.r_state_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(decerr_slave_inst_n_4),
        .Q(r_state[1]),
        .R(register_slice_inst_n_1));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_mmu_v2_1_19_decerr_slave decerr_slave_inst
       (.E(mr_axi_arvalid),
        .\FSM_onehot_gen_write.w_state_reg[1] (decerr_slave_inst_n_2),
        .\FSM_onehot_gen_write.w_state_reg[2] (\FSM_onehot_gen_write.w_state_reg_n_0_[1] ),
        .\FSM_onehot_gen_write.w_state_reg[2]_0 (\FSM_onehot_gen_write.w_state_reg_n_0_[2] ),
        .\FSM_onehot_gen_write.w_state_reg[2]_1 (\gen_write.w_mask_i_3_n_0 ),
        .\FSM_sequential_gen_read.r_state_reg[0] (decerr_slave_inst_n_7),
        .\FSM_sequential_gen_read.r_state_reg[1] (decerr_slave_inst_n_10),
        .\FSM_sequential_gen_read.r_state_reg[1]_0 (register_slice_inst_n_41),
        .Q(mr_axi_awaddr),
        .aclk(aclk),
        .ar_pop0(ar_pop0),
        .err_arready(err_arready),
        .err_rvalid(err_rvalid),
        .\gen_axilite.gen_read.s_axi_arready_i_reg_0 (register_slice_inst_n_42),
        .\gen_axilite.gen_read.s_axi_rvalid_i_reg_0 (decerr_slave_inst_n_4),
        .\gen_axilite.gen_read.s_axi_rvalid_i_reg_1 (register_slice_inst_n_1),
        .\gen_axilite.gen_read.s_axi_rvalid_i_reg_2 (mr_axi_araddr),
        .\gen_axilite.gen_write.s_axi_awready_i_reg_0 (decerr_slave_inst_n_6),
        .\gen_axilite.gen_write.s_axi_awready_i_reg_1 (mr_axi_awvalid),
        .\gen_axilite.gen_write.s_axi_bvalid_i_reg_0 (decerr_slave_inst_n_3),
        .\gen_axilite.gen_write.s_axi_bvalid_i_reg_1 (register_slice_inst_n_97),
        .m_axi_arready(m_axi_arready),
        .m_axi_awready(m_axi_awready),
        .m_axi_bvalid(m_axi_bvalid),
        .m_axi_rvalid(m_axi_rvalid),
        .m_axi_wready(m_axi_wready),
        .r_state(r_state),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wready(s_axi_wready),
        .s_axi_wvalid(s_axi_wvalid),
        .sr_axi_wvalid122_in(sr_axi_wvalid122_in));
  LUT1 #(
    .INIT(2'h1)) 
    \gen_read.ar_cnt[0]_i_1 
       (.I0(\gen_read.ar_cnt_reg [0]),
        .O(\gen_read.ar_cnt[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \gen_read.ar_cnt[5]_i_3 
       (.I0(ar_pop0),
        .I1(s_axi_rready),
        .I2(m_axi_rvalid),
        .O(ar_pop));
  FDRE \gen_read.ar_cnt_reg[0] 
       (.C(aclk),
        .CE(register_slice_inst_n_91),
        .D(\gen_read.ar_cnt[0]_i_1_n_0 ),
        .Q(\gen_read.ar_cnt_reg [0]),
        .R(register_slice_inst_n_1));
  FDRE \gen_read.ar_cnt_reg[1] 
       (.C(aclk),
        .CE(register_slice_inst_n_91),
        .D(register_slice_inst_n_90),
        .Q(\gen_read.ar_cnt_reg [1]),
        .R(register_slice_inst_n_1));
  FDRE \gen_read.ar_cnt_reg[2] 
       (.C(aclk),
        .CE(register_slice_inst_n_91),
        .D(register_slice_inst_n_89),
        .Q(\gen_read.ar_cnt_reg [2]),
        .R(register_slice_inst_n_1));
  FDRE \gen_read.ar_cnt_reg[3] 
       (.C(aclk),
        .CE(register_slice_inst_n_91),
        .D(register_slice_inst_n_88),
        .Q(\gen_read.ar_cnt_reg [3]),
        .R(register_slice_inst_n_1));
  FDRE \gen_read.ar_cnt_reg[4] 
       (.C(aclk),
        .CE(register_slice_inst_n_91),
        .D(register_slice_inst_n_87),
        .Q(\gen_read.ar_cnt_reg [4]),
        .R(register_slice_inst_n_1));
  FDRE \gen_read.ar_cnt_reg[5] 
       (.C(aclk),
        .CE(register_slice_inst_n_91),
        .D(register_slice_inst_n_86),
        .Q(\gen_read.ar_cnt_reg [5]),
        .R(register_slice_inst_n_1));
  LUT1 #(
    .INIT(2'h1)) 
    \gen_write.aw_cnt[0]_i_1 
       (.I0(\gen_write.aw_cnt_reg [0]),
        .O(\gen_write.aw_cnt[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \gen_write.aw_cnt[5]_i_4 
       (.I0(\gen_write.aw_cnt_reg [5]),
        .I1(\gen_write.aw_cnt_reg [4]),
        .I2(\gen_write.aw_cnt_reg [1]),
        .I3(\gen_write.aw_cnt_reg [0]),
        .I4(\gen_write.aw_cnt_reg [3]),
        .I5(\gen_write.aw_cnt_reg [2]),
        .O(aw_pop0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \gen_write.aw_cnt[5]_i_6 
       (.I0(aw_pop0),
        .I1(m_axi_bvalid),
        .I2(s_axi_bready),
        .O(aw_pop));
  FDRE \gen_write.aw_cnt_reg[0] 
       (.C(aclk),
        .CE(register_slice_inst_n_85),
        .D(\gen_write.aw_cnt[0]_i_1_n_0 ),
        .Q(\gen_write.aw_cnt_reg [0]),
        .R(register_slice_inst_n_1));
  FDRE \gen_write.aw_cnt_reg[1] 
       (.C(aclk),
        .CE(register_slice_inst_n_85),
        .D(register_slice_inst_n_83),
        .Q(\gen_write.aw_cnt_reg [1]),
        .R(register_slice_inst_n_1));
  FDRE \gen_write.aw_cnt_reg[2] 
       (.C(aclk),
        .CE(register_slice_inst_n_85),
        .D(register_slice_inst_n_82),
        .Q(\gen_write.aw_cnt_reg [2]),
        .R(register_slice_inst_n_1));
  FDRE \gen_write.aw_cnt_reg[3] 
       (.C(aclk),
        .CE(register_slice_inst_n_85),
        .D(register_slice_inst_n_81),
        .Q(\gen_write.aw_cnt_reg [3]),
        .R(register_slice_inst_n_1));
  FDRE \gen_write.aw_cnt_reg[4] 
       (.C(aclk),
        .CE(register_slice_inst_n_85),
        .D(register_slice_inst_n_80),
        .Q(\gen_write.aw_cnt_reg [4]),
        .R(register_slice_inst_n_1));
  FDRE \gen_write.aw_cnt_reg[5] 
       (.C(aclk),
        .CE(register_slice_inst_n_85),
        .D(register_slice_inst_n_79),
        .Q(\gen_write.aw_cnt_reg [5]),
        .R(register_slice_inst_n_1));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \gen_write.w_cnt[0]_i_1 
       (.I0(\gen_write.w_cnt_reg [0]),
        .O(\gen_write.w_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \gen_write.w_cnt[1]_i_1 
       (.I0(\gen_write.w_cnt_reg [0]),
        .I1(w_cnt115_out),
        .I2(\gen_write.w_cnt_reg [1]),
        .O(\gen_write.w_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h78E1)) 
    \gen_write.w_cnt[2]_i_1 
       (.I0(\gen_write.w_cnt_reg [0]),
        .I1(w_cnt115_out),
        .I2(\gen_write.w_cnt_reg [2]),
        .I3(\gen_write.w_cnt_reg [1]),
        .O(\gen_write.w_cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h7F80FE01)) 
    \gen_write.w_cnt[3]_i_1 
       (.I0(w_cnt115_out),
        .I1(\gen_write.w_cnt_reg [0]),
        .I2(\gen_write.w_cnt_reg [1]),
        .I3(\gen_write.w_cnt_reg [3]),
        .I4(\gen_write.w_cnt_reg [2]),
        .O(\gen_write.w_cnt[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF8000FFFE0001)) 
    \gen_write.w_cnt[4]_i_1 
       (.I0(\gen_write.w_cnt_reg [1]),
        .I1(\gen_write.w_cnt_reg [0]),
        .I2(w_cnt115_out),
        .I3(\gen_write.w_cnt_reg [2]),
        .I4(\gen_write.w_cnt_reg [4]),
        .I5(\gen_write.w_cnt_reg [3]),
        .O(\gen_write.w_cnt[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h00001000)) 
    \gen_write.w_cnt[4]_i_2 
       (.I0(w_mask),
        .I1(\gen_write.aw_cnt_reg [5]),
        .I2(s_axi_awvalid),
        .I3(w_match),
        .I4(w_pop),
        .O(w_cnt115_out));
  LUT5 #(
    .INIT(32'hAA6AAAAA)) 
    \gen_write.w_cnt[5]_i_1 
       (.I0(p_14_in),
        .I1(m_axi_wready),
        .I2(s_axi_wvalid),
        .I3(\FSM_onehot_gen_write.w_state_reg_n_0_[2] ),
        .I4(sr_axi_wvalid122_in),
        .O(\gen_write.w_cnt[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF8000FFFE0001)) 
    \gen_write.w_cnt[5]_i_2 
       (.I0(\gen_write.w_cnt_reg [2]),
        .I1(\gen_write.w_cnt[5]_i_4_n_0 ),
        .I2(\gen_write.w_cnt_reg [1]),
        .I3(\gen_write.w_cnt_reg [3]),
        .I4(\gen_write.w_cnt_reg [5]),
        .I5(\gen_write.w_cnt_reg [4]),
        .O(\gen_write.w_cnt[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \gen_write.w_cnt[5]_i_3 
       (.I0(w_match),
        .I1(s_axi_awvalid),
        .I2(\gen_write.aw_cnt_reg [5]),
        .I3(w_mask),
        .O(p_14_in));
  LUT6 #(
    .INIT(64'h5555755500001000)) 
    \gen_write.w_cnt[5]_i_4 
       (.I0(\gen_write.w_cnt_reg [1]),
        .I1(w_pop),
        .I2(w_match),
        .I3(\gen_write.w_mask_i_2_n_0 ),
        .I4(w_mask),
        .I5(\gen_write.w_cnt_reg [0]),
        .O(\gen_write.w_cnt[5]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    \gen_write.w_cnt[5]_i_5 
       (.I0(m_axi_wready),
        .I1(s_axi_wvalid),
        .I2(\FSM_onehot_gen_write.w_state_reg_n_0_[2] ),
        .I3(sr_axi_wvalid122_in),
        .O(w_pop));
  FDRE \gen_write.w_cnt_reg[0] 
       (.C(aclk),
        .CE(\gen_write.w_cnt[5]_i_1_n_0 ),
        .D(\gen_write.w_cnt[0]_i_1_n_0 ),
        .Q(\gen_write.w_cnt_reg [0]),
        .R(register_slice_inst_n_1));
  FDRE \gen_write.w_cnt_reg[1] 
       (.C(aclk),
        .CE(\gen_write.w_cnt[5]_i_1_n_0 ),
        .D(\gen_write.w_cnt[1]_i_1_n_0 ),
        .Q(\gen_write.w_cnt_reg [1]),
        .R(register_slice_inst_n_1));
  FDRE \gen_write.w_cnt_reg[2] 
       (.C(aclk),
        .CE(\gen_write.w_cnt[5]_i_1_n_0 ),
        .D(\gen_write.w_cnt[2]_i_1_n_0 ),
        .Q(\gen_write.w_cnt_reg [2]),
        .R(register_slice_inst_n_1));
  FDRE \gen_write.w_cnt_reg[3] 
       (.C(aclk),
        .CE(\gen_write.w_cnt[5]_i_1_n_0 ),
        .D(\gen_write.w_cnt[3]_i_1_n_0 ),
        .Q(\gen_write.w_cnt_reg [3]),
        .R(register_slice_inst_n_1));
  FDRE \gen_write.w_cnt_reg[4] 
       (.C(aclk),
        .CE(\gen_write.w_cnt[5]_i_1_n_0 ),
        .D(\gen_write.w_cnt[4]_i_1_n_0 ),
        .Q(\gen_write.w_cnt_reg [4]),
        .R(register_slice_inst_n_1));
  FDRE \gen_write.w_cnt_reg[5] 
       (.C(aclk),
        .CE(\gen_write.w_cnt[5]_i_1_n_0 ),
        .D(\gen_write.w_cnt[5]_i_2_n_0 ),
        .Q(\gen_write.w_cnt_reg [5]),
        .R(register_slice_inst_n_1));
  LUT2 #(
    .INIT(4'h2)) 
    \gen_write.w_mask_i_2 
       (.I0(s_axi_awvalid),
        .I1(\gen_write.aw_cnt_reg [5]),
        .O(\gen_write.w_mask_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \gen_write.w_mask_i_3 
       (.I0(aw_pop0),
        .I1(w_state16_in),
        .I2(\FSM_onehot_gen_write.w_state_reg_n_0_[1] ),
        .O(\gen_write.w_mask_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \gen_write.w_mask_i_4 
       (.I0(\gen_write.w_cnt_reg [5]),
        .I1(\gen_write.w_cnt_reg [4]),
        .I2(\gen_write.w_cnt_reg [0]),
        .I3(\gen_write.w_cnt_reg [1]),
        .I4(\gen_write.w_cnt_reg [3]),
        .I5(\gen_write.w_cnt_reg [2]),
        .O(w_state16_in));
  FDRE \gen_write.w_mask_reg 
       (.C(aclk),
        .CE(1'b1),
        .D(register_slice_inst_n_92),
        .Q(w_mask),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h20)) 
    m_axi_wvalid_INST_0
       (.I0(sr_axi_wvalid122_in),
        .I1(\FSM_onehot_gen_write.w_state_reg_n_0_[2] ),
        .I2(s_axi_wvalid),
        .O(m_axi_wvalid));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_register_slice_v2_1_21_axi_register_slice register_slice_inst
       (.D({register_slice_inst_n_79,register_slice_inst_n_80,register_slice_inst_n_81,register_slice_inst_n_82,register_slice_inst_n_83}),
        .E(mr_axi_awvalid),
        .\FSM_onehot_gen_write.w_state_reg[1] (decerr_slave_inst_n_3),
        .\FSM_sequential_gen_read.r_state_reg[0] (register_slice_inst_n_40),
        .Q({m_axi_awprot,mr_axi_awaddr,m_axi_awaddr}),
        .aclk(aclk),
        .ar_pop(ar_pop),
        .ar_pop0(ar_pop0),
        .aresetn(aresetn),
        .\aresetn_d_reg[1] (register_slice_inst_n_1),
        .\aresetn_d_reg[1]_0 (register_slice_inst_n_42),
        .aw_pop(aw_pop),
        .aw_pop0(aw_pop0),
        .err_arready(err_arready),
        .err_rvalid(err_rvalid),
        .\gen_axilite.gen_read.s_axi_arready_i_reg (decerr_slave_inst_n_10),
        .\gen_read.ar_cnt_reg[2] ({register_slice_inst_n_86,register_slice_inst_n_87,register_slice_inst_n_88,register_slice_inst_n_89,register_slice_inst_n_90}),
        .\gen_write.w_mask_reg (register_slice_inst_n_92),
        .\gen_write.w_mask_reg_0 (\gen_write.w_mask_i_2_n_0 ),
        .\gen_write.w_mask_reg_1 (\gen_write.w_mask_i_3_n_0 ),
        .m_axi_arvalid(m_axi_arvalid),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_awvalid_0(\FSM_onehot_gen_write.w_state_reg_n_0_[2] ),
        .m_axi_awvalid_1(\FSM_onehot_gen_write.w_state_reg_n_0_[1] ),
        .m_axi_bvalid(m_axi_bvalid),
        .m_axi_bvalid_0(register_slice_inst_n_85),
        .m_axi_rvalid(m_axi_rvalid),
        .\m_payload_i_reg[35] ({m_axi_arprot,mr_axi_araddr,m_axi_araddr}),
        .\m_payload_i_reg[35]_0 ({s_axi_awprot,s_axi_awaddr}),
        .\m_payload_i_reg[35]_1 ({s_axi_arprot,s_axi_araddr}),
        .m_valid_i_reg_inv(mr_axi_arvalid),
        .m_valid_i_reg_inv_0(register_slice_inst_n_3),
        .m_valid_i_reg_inv_1(register_slice_inst_n_41),
        .m_valid_i_reg_inv_2(register_slice_inst_n_97),
        .m_valid_i_reg_inv_3(decerr_slave_inst_n_6),
        .m_valid_i_reg_inv_4(decerr_slave_inst_n_7),
        .r_state(r_state),
        .s_axi_arready(s_axi_arready),
        .s_axi_arready_0(\gen_read.ar_cnt_reg ),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awready(s_axi_awready),
        .s_axi_awready_0(\gen_write.aw_cnt_reg ),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_rready(s_axi_rready),
        .s_ready_i_reg(register_slice_inst_n_91),
        .w_mask(w_mask),
        .w_match(w_match));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \s_axi_bresp[0]_INST_0 
       (.I0(\FSM_onehot_gen_write.w_state_reg_n_0_[2] ),
        .I1(m_axi_bresp[0]),
        .O(s_axi_bresp[0]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \s_axi_bresp[1]_INST_0 
       (.I0(\FSM_onehot_gen_write.w_state_reg_n_0_[2] ),
        .I1(m_axi_bresp[1]),
        .O(s_axi_bresp[1]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[0]_INST_0 
       (.I0(m_axi_rdata[0]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[0]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[10]_INST_0 
       (.I0(m_axi_rdata[10]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[10]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[11]_INST_0 
       (.I0(m_axi_rdata[11]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[11]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[12]_INST_0 
       (.I0(m_axi_rdata[12]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[12]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[13]_INST_0 
       (.I0(m_axi_rdata[13]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[13]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[14]_INST_0 
       (.I0(m_axi_rdata[14]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[14]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[15]_INST_0 
       (.I0(m_axi_rdata[15]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[15]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[16]_INST_0 
       (.I0(m_axi_rdata[16]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[16]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[17]_INST_0 
       (.I0(m_axi_rdata[17]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[17]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[18]_INST_0 
       (.I0(m_axi_rdata[18]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[18]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[19]_INST_0 
       (.I0(m_axi_rdata[19]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[19]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[1]_INST_0 
       (.I0(m_axi_rdata[1]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[1]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[20]_INST_0 
       (.I0(m_axi_rdata[20]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[20]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[21]_INST_0 
       (.I0(m_axi_rdata[21]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[21]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[22]_INST_0 
       (.I0(m_axi_rdata[22]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[22]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[23]_INST_0 
       (.I0(m_axi_rdata[23]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[23]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[24]_INST_0 
       (.I0(m_axi_rdata[24]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[24]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[25]_INST_0 
       (.I0(m_axi_rdata[25]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[25]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[26]_INST_0 
       (.I0(m_axi_rdata[26]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[26]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[27]_INST_0 
       (.I0(m_axi_rdata[27]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[27]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[28]_INST_0 
       (.I0(m_axi_rdata[28]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[28]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[29]_INST_0 
       (.I0(m_axi_rdata[29]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[29]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[2]_INST_0 
       (.I0(m_axi_rdata[2]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[2]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[30]_INST_0 
       (.I0(m_axi_rdata[30]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[30]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[31]_INST_0 
       (.I0(m_axi_rdata[31]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[31]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[3]_INST_0 
       (.I0(m_axi_rdata[3]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[3]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[4]_INST_0 
       (.I0(m_axi_rdata[4]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[4]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[5]_INST_0 
       (.I0(m_axi_rdata[5]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[5]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[6]_INST_0 
       (.I0(m_axi_rdata[6]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[6]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[7]_INST_0 
       (.I0(m_axi_rdata[7]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[7]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[8]_INST_0 
       (.I0(m_axi_rdata[8]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[8]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \s_axi_rdata[9]_INST_0 
       (.I0(m_axi_rdata[9]),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .O(s_axi_rdata[9]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hF2)) 
    \s_axi_rresp[0]_INST_0 
       (.I0(r_state[1]),
        .I1(r_state[0]),
        .I2(m_axi_rresp[0]),
        .O(s_axi_rresp[0]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hF2)) 
    \s_axi_rresp[1]_INST_0 
       (.I0(r_state[1]),
        .I1(r_state[0]),
        .I2(m_axi_rresp[1]),
        .O(s_axi_rresp[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    s_axi_wready_INST_0_i_1
       (.I0(\gen_write.w_cnt_reg [2]),
        .I1(\gen_write.w_cnt_reg [0]),
        .I2(\gen_write.w_cnt_reg [1]),
        .I3(\gen_write.w_cnt_reg [4]),
        .I4(\gen_write.w_cnt_reg [3]),
        .I5(\gen_write.w_cnt_reg [5]),
        .O(sr_axi_wvalid122_in));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_register_slice_v2_1_21_axi_register_slice
   (E,
    \aresetn_d_reg[1] ,
    m_valid_i_reg_inv,
    m_valid_i_reg_inv_0,
    Q,
    \FSM_sequential_gen_read.r_state_reg[0] ,
    m_valid_i_reg_inv_1,
    \aresetn_d_reg[1]_0 ,
    \m_payload_i_reg[35] ,
    D,
    w_match,
    m_axi_bvalid_0,
    \gen_read.ar_cnt_reg[2] ,
    s_ready_i_reg,
    \gen_write.w_mask_reg ,
    s_axi_awready,
    m_axi_awvalid,
    m_axi_arvalid,
    s_axi_arready,
    m_valid_i_reg_inv_2,
    aresetn,
    aclk,
    m_axi_awvalid_0,
    \FSM_onehot_gen_write.w_state_reg[1] ,
    m_axi_awvalid_1,
    r_state,
    ar_pop0,
    err_arready,
    \gen_axilite.gen_read.s_axi_arready_i_reg ,
    err_rvalid,
    s_axi_awvalid,
    s_axi_awready_0,
    m_valid_i_reg_inv_3,
    s_axi_arvalid,
    s_axi_arready_0,
    m_valid_i_reg_inv_4,
    aw_pop,
    \gen_write.w_mask_reg_0 ,
    aw_pop0,
    m_axi_bvalid,
    s_axi_bready,
    s_axi_rready,
    m_axi_rvalid,
    ar_pop,
    w_mask,
    \gen_write.w_mask_reg_1 ,
    \m_payload_i_reg[35]_0 ,
    \m_payload_i_reg[35]_1 );
  output [0:0]E;
  output \aresetn_d_reg[1] ;
  output [0:0]m_valid_i_reg_inv;
  output m_valid_i_reg_inv_0;
  output [35:0]Q;
  output \FSM_sequential_gen_read.r_state_reg[0] ;
  output m_valid_i_reg_inv_1;
  output \aresetn_d_reg[1]_0 ;
  output [35:0]\m_payload_i_reg[35] ;
  output [4:0]D;
  output w_match;
  output [0:0]m_axi_bvalid_0;
  output [4:0]\gen_read.ar_cnt_reg[2] ;
  output [0:0]s_ready_i_reg;
  output \gen_write.w_mask_reg ;
  output s_axi_awready;
  output m_axi_awvalid;
  output m_axi_arvalid;
  output s_axi_arready;
  output m_valid_i_reg_inv_2;
  input aresetn;
  input aclk;
  input m_axi_awvalid_0;
  input \FSM_onehot_gen_write.w_state_reg[1] ;
  input m_axi_awvalid_1;
  input [1:0]r_state;
  input ar_pop0;
  input err_arready;
  input \gen_axilite.gen_read.s_axi_arready_i_reg ;
  input err_rvalid;
  input s_axi_awvalid;
  input [5:0]s_axi_awready_0;
  input m_valid_i_reg_inv_3;
  input s_axi_arvalid;
  input [5:0]s_axi_arready_0;
  input m_valid_i_reg_inv_4;
  input aw_pop;
  input \gen_write.w_mask_reg_0 ;
  input aw_pop0;
  input m_axi_bvalid;
  input s_axi_bready;
  input s_axi_rready;
  input m_axi_rvalid;
  input ar_pop;
  input w_mask;
  input \gen_write.w_mask_reg_1 ;
  input [34:0]\m_payload_i_reg[35]_0 ;
  input [34:0]\m_payload_i_reg[35]_1 ;

  wire [4:0]D;
  wire [0:0]E;
  wire \FSM_onehot_gen_write.w_state_reg[1] ;
  wire \FSM_sequential_gen_read.r_state_reg[0] ;
  wire [35:0]Q;
  wire aclk;
  wire ar_pop;
  wire ar_pop0;
  wire aresetn;
  wire \aresetn_d_reg[1] ;
  wire \aresetn_d_reg[1]_0 ;
  wire \aw.aw_pipe_n_0 ;
  wire \aw.aw_pipe_n_1 ;
  wire aw_pop;
  wire aw_pop0;
  wire err_arready;
  wire err_rvalid;
  wire \gen_axilite.gen_read.s_axi_arready_i_reg ;
  wire [4:0]\gen_read.ar_cnt_reg[2] ;
  wire \gen_write.w_mask_reg ;
  wire \gen_write.w_mask_reg_0 ;
  wire \gen_write.w_mask_reg_1 ;
  wire m_axi_arvalid;
  wire m_axi_awvalid;
  wire m_axi_awvalid_0;
  wire m_axi_awvalid_1;
  wire m_axi_bvalid;
  wire [0:0]m_axi_bvalid_0;
  wire m_axi_rvalid;
  wire [35:0]\m_payload_i_reg[35] ;
  wire [34:0]\m_payload_i_reg[35]_0 ;
  wire [34:0]\m_payload_i_reg[35]_1 ;
  wire [0:0]m_valid_i_reg_inv;
  wire m_valid_i_reg_inv_0;
  wire m_valid_i_reg_inv_1;
  wire m_valid_i_reg_inv_2;
  wire m_valid_i_reg_inv_3;
  wire m_valid_i_reg_inv_4;
  wire [1:0]r_state;
  wire s_axi_arready;
  wire [5:0]s_axi_arready_0;
  wire s_axi_arvalid;
  wire s_axi_awready;
  wire [5:0]s_axi_awready_0;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_rready;
  wire [0:0]s_ready_i_reg;
  wire w_mask;
  wire w_match;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_register_slice_v2_1_21_axic_register_slice \ar.ar_pipe 
       (.\FSM_sequential_gen_read.r_state_reg[0] (\FSM_sequential_gen_read.r_state_reg[0] ),
        .Q(\m_payload_i_reg[35] ),
        .aclk(aclk),
        .ar_pop(ar_pop),
        .ar_pop0(ar_pop0),
        .\aresetn_d_reg[1] (\aresetn_d_reg[1]_0 ),
        .err_arready(err_arready),
        .err_rvalid(err_rvalid),
        .\gen_axilite.gen_read.s_axi_arready_i_reg (\gen_axilite.gen_read.s_axi_arready_i_reg ),
        .\gen_read.ar_cnt_reg[2] (\gen_read.ar_cnt_reg[2] ),
        .m_axi_arvalid(m_axi_arvalid),
        .m_axi_rvalid(m_axi_rvalid),
        .\m_payload_i_reg[35]_0 (\m_payload_i_reg[35]_1 ),
        .m_valid_i_reg_inv_0(m_valid_i_reg_inv),
        .m_valid_i_reg_inv_1(m_valid_i_reg_inv_1),
        .m_valid_i_reg_inv_2(\aresetn_d_reg[1] ),
        .m_valid_i_reg_inv_3(m_valid_i_reg_inv_4),
        .r_state(r_state),
        .s_axi_arready(s_axi_arready),
        .s_axi_arready_0(s_axi_arready_0),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_rready(s_axi_rready),
        .s_ready_i_reg_0(s_ready_i_reg),
        .s_ready_i_reg_1(\aw.aw_pipe_n_1 ),
        .s_ready_i_reg_2(\aw.aw_pipe_n_0 ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_register_slice_v2_1_21_axic_register_slice_0 \aw.aw_pipe 
       (.D(D),
        .\FSM_onehot_gen_write.w_state_reg[1] (\FSM_onehot_gen_write.w_state_reg[1] ),
        .Q(Q),
        .aclk(aclk),
        .aresetn(aresetn),
        .\aresetn_d_reg[0]_0 (\aw.aw_pipe_n_0 ),
        .\aresetn_d_reg[1]_0 (\aw.aw_pipe_n_1 ),
        .\aresetn_d_reg[1]_1 (\aresetn_d_reg[1] ),
        .aw_pop(aw_pop),
        .aw_pop0(aw_pop0),
        .\gen_write.w_mask_reg (\gen_write.w_mask_reg ),
        .\gen_write.w_mask_reg_0 (\gen_write.w_mask_reg_0 ),
        .\gen_write.w_mask_reg_1 (\gen_write.w_mask_reg_1 ),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_awvalid_0(m_axi_awvalid_0),
        .m_axi_awvalid_1(m_axi_awvalid_1),
        .m_axi_bvalid(m_axi_bvalid),
        .m_axi_bvalid_0(m_axi_bvalid_0),
        .\m_payload_i_reg[35]_0 (\m_payload_i_reg[35]_0 ),
        .m_valid_i_reg_inv_0(E),
        .m_valid_i_reg_inv_1(m_valid_i_reg_inv_0),
        .m_valid_i_reg_inv_2(m_valid_i_reg_inv_2),
        .m_valid_i_reg_inv_3(m_valid_i_reg_inv_3),
        .\s_axi_awaddr[13] (w_match),
        .s_axi_awready(s_axi_awready),
        .s_axi_awready_0(s_axi_awready_0),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .w_mask(w_mask));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_register_slice_v2_1_21_axic_register_slice
   (m_valid_i_reg_inv_0,
    \FSM_sequential_gen_read.r_state_reg[0] ,
    m_valid_i_reg_inv_1,
    \aresetn_d_reg[1] ,
    Q,
    \gen_read.ar_cnt_reg[2] ,
    s_ready_i_reg_0,
    m_axi_arvalid,
    s_axi_arready,
    m_valid_i_reg_inv_2,
    aclk,
    r_state,
    ar_pop0,
    s_ready_i_reg_1,
    err_arready,
    \gen_axilite.gen_read.s_axi_arready_i_reg ,
    err_rvalid,
    s_axi_arvalid,
    s_axi_arready_0,
    m_valid_i_reg_inv_3,
    s_axi_rready,
    m_axi_rvalid,
    ar_pop,
    \m_payload_i_reg[35]_0 ,
    s_ready_i_reg_2);
  output m_valid_i_reg_inv_0;
  output \FSM_sequential_gen_read.r_state_reg[0] ;
  output m_valid_i_reg_inv_1;
  output \aresetn_d_reg[1] ;
  output [35:0]Q;
  output [4:0]\gen_read.ar_cnt_reg[2] ;
  output [0:0]s_ready_i_reg_0;
  output m_axi_arvalid;
  output s_axi_arready;
  input m_valid_i_reg_inv_2;
  input aclk;
  input [1:0]r_state;
  input ar_pop0;
  input s_ready_i_reg_1;
  input err_arready;
  input \gen_axilite.gen_read.s_axi_arready_i_reg ;
  input err_rvalid;
  input s_axi_arvalid;
  input [5:0]s_axi_arready_0;
  input m_valid_i_reg_inv_3;
  input s_axi_rready;
  input m_axi_rvalid;
  input ar_pop;
  input [34:0]\m_payload_i_reg[35]_0 ;
  input s_ready_i_reg_2;

  wire \FSM_sequential_gen_read.r_state_reg[0] ;
  wire [35:0]Q;
  wire aclk;
  wire ar_cnt13_out;
  wire ar_pop;
  wire ar_pop0;
  wire \aresetn_d_reg[1] ;
  wire err_arready;
  wire err_rvalid;
  wire \gen_axilite.gen_read.s_axi_arready_i_reg ;
  wire \gen_read.ar_cnt[5]_i_4_n_0 ;
  wire \gen_read.ar_cnt[5]_i_6_n_0 ;
  wire [4:0]\gen_read.ar_cnt_reg[2] ;
  wire m_axi_arvalid;
  wire m_axi_rvalid;
  wire \m_payload_i[32]_i_2__0_n_0 ;
  wire \m_payload_i[32]_i_3__0_n_0 ;
  wire \m_payload_i[32]_i_4__0_n_0 ;
  wire \m_payload_i[32]_i_5__0_n_0 ;
  wire \m_payload_i[32]_i_6__0_n_0 ;
  wire [34:0]\m_payload_i_reg[35]_0 ;
  wire m_valid_i_inv_i_1__0_n_0;
  wire m_valid_i_reg_inv_0;
  wire m_valid_i_reg_inv_1;
  wire m_valid_i_reg_inv_2;
  wire m_valid_i_reg_inv_3;
  wire p_2_in;
  wire r_match;
  wire [1:0]r_state;
  wire s_axi_arready;
  wire [5:0]s_axi_arready_0;
  wire s_axi_arvalid;
  wire s_axi_rready;
  wire s_ready_i_i_1_n_0;
  wire [0:0]s_ready_i_reg_0;
  wire s_ready_i_reg_1;
  wire s_ready_i_reg_2;
  wire sr_axi_arready;

  LUT4 #(
    .INIT(16'hCEC2)) 
    \FSM_sequential_gen_read.r_state[0]_i_1 
       (.I0(m_valid_i_reg_inv_1),
        .I1(r_state[0]),
        .I2(r_state[1]),
        .I3(ar_pop0),
        .O(\FSM_sequential_gen_read.r_state_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \FSM_sequential_gen_read.r_state[1]_i_2 
       (.I0(m_valid_i_reg_inv_0),
        .I1(Q[32]),
        .O(m_valid_i_reg_inv_1));
  LUT6 #(
    .INIT(64'h88888888AAA2AAAA)) 
    \gen_axilite.gen_read.s_axi_arready_i_i_1 
       (.I0(s_ready_i_reg_1),
        .I1(err_arready),
        .I2(Q[32]),
        .I3(m_valid_i_reg_inv_0),
        .I4(\gen_axilite.gen_read.s_axi_arready_i_reg ),
        .I5(err_rvalid),
        .O(\aresetn_d_reg[1] ));
  LUT3 #(
    .INIT(8'h69)) 
    \gen_read.ar_cnt[1]_i_1 
       (.I0(s_axi_arready_0[0]),
        .I1(ar_cnt13_out),
        .I2(s_axi_arready_0[1]),
        .O(\gen_read.ar_cnt_reg[2] [0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h78E1)) 
    \gen_read.ar_cnt[2]_i_1 
       (.I0(s_axi_arready_0[0]),
        .I1(ar_cnt13_out),
        .I2(s_axi_arready_0[2]),
        .I3(s_axi_arready_0[1]),
        .O(\gen_read.ar_cnt_reg[2] [1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h7F80FE01)) 
    \gen_read.ar_cnt[3]_i_1 
       (.I0(ar_cnt13_out),
        .I1(s_axi_arready_0[0]),
        .I2(s_axi_arready_0[1]),
        .I3(s_axi_arready_0[3]),
        .I4(s_axi_arready_0[2]),
        .O(\gen_read.ar_cnt_reg[2] [2]));
  LUT6 #(
    .INIT(64'h7FFF8000FFFE0001)) 
    \gen_read.ar_cnt[4]_i_1 
       (.I0(s_axi_arready_0[1]),
        .I1(s_axi_arready_0[0]),
        .I2(ar_cnt13_out),
        .I3(s_axi_arready_0[2]),
        .I4(s_axi_arready_0[4]),
        .I5(s_axi_arready_0[3]),
        .O(\gen_read.ar_cnt_reg[2] [3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00004000)) 
    \gen_read.ar_cnt[4]_i_2 
       (.I0(s_axi_arready_0[5]),
        .I1(s_axi_arvalid),
        .I2(sr_axi_arready),
        .I3(r_match),
        .I4(ar_pop),
        .O(ar_cnt13_out));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFF7F0080)) 
    \gen_read.ar_cnt[5]_i_1 
       (.I0(r_match),
        .I1(sr_axi_arready),
        .I2(s_axi_arvalid),
        .I3(s_axi_arready_0[5]),
        .I4(ar_pop),
        .O(s_ready_i_reg_0));
  LUT6 #(
    .INIT(64'h7FFF8000FFFE0001)) 
    \gen_read.ar_cnt[5]_i_2 
       (.I0(s_axi_arready_0[2]),
        .I1(\gen_read.ar_cnt[5]_i_4_n_0 ),
        .I2(s_axi_arready_0[1]),
        .I3(s_axi_arready_0[3]),
        .I4(s_axi_arready_0[5]),
        .I5(s_axi_arready_0[4]),
        .O(\gen_read.ar_cnt_reg[2] [4]));
  LUT6 #(
    .INIT(64'h7FFF555515550000)) 
    \gen_read.ar_cnt[5]_i_4 
       (.I0(s_axi_arready_0[1]),
        .I1(ar_pop0),
        .I2(s_axi_rready),
        .I3(m_axi_rvalid),
        .I4(p_2_in),
        .I5(s_axi_arready_0[0]),
        .O(\gen_read.ar_cnt[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    \gen_read.ar_cnt[5]_i_5 
       (.I0(\m_payload_i[32]_i_6__0_n_0 ),
        .I1(\m_payload_i[32]_i_5__0_n_0 ),
        .I2(\m_payload_i[32]_i_4__0_n_0 ),
        .I3(\m_payload_i[32]_i_3__0_n_0 ),
        .I4(\m_payload_i[32]_i_2__0_n_0 ),
        .I5(\gen_read.ar_cnt[5]_i_6_n_0 ),
        .O(p_2_in));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \gen_read.ar_cnt[5]_i_6 
       (.I0(s_axi_arready_0[5]),
        .I1(s_axi_arvalid),
        .I2(sr_axi_arready),
        .O(\gen_read.ar_cnt[5]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0900)) 
    m_axi_arvalid_INST_0
       (.I0(r_state[1]),
        .I1(r_state[0]),
        .I2(m_valid_i_reg_inv_0),
        .I3(Q[32]),
        .O(m_axi_arvalid));
  LUT5 #(
    .INIT(32'h00000001)) 
    \m_payload_i[32]_i_1__0 
       (.I0(\m_payload_i[32]_i_2__0_n_0 ),
        .I1(\m_payload_i[32]_i_3__0_n_0 ),
        .I2(\m_payload_i[32]_i_4__0_n_0 ),
        .I3(\m_payload_i[32]_i_5__0_n_0 ),
        .I4(\m_payload_i[32]_i_6__0_n_0 ),
        .O(r_match));
  LUT3 #(
    .INIT(8'hEF)) 
    \m_payload_i[32]_i_2__0 
       (.I0(\m_payload_i_reg[35]_0 [13]),
        .I1(\m_payload_i_reg[35]_0 [31]),
        .I2(\m_payload_i_reg[35]_0 [30]),
        .O(\m_payload_i[32]_i_2__0_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \m_payload_i[32]_i_3__0 
       (.I0(\m_payload_i_reg[35]_0 [20]),
        .I1(\m_payload_i_reg[35]_0 [21]),
        .I2(\m_payload_i_reg[35]_0 [18]),
        .I3(\m_payload_i_reg[35]_0 [19]),
        .O(\m_payload_i[32]_i_3__0_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \m_payload_i[32]_i_4__0 
       (.I0(\m_payload_i_reg[35]_0 [16]),
        .I1(\m_payload_i_reg[35]_0 [17]),
        .I2(\m_payload_i_reg[35]_0 [14]),
        .I3(\m_payload_i_reg[35]_0 [15]),
        .O(\m_payload_i[32]_i_4__0_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \m_payload_i[32]_i_5__0 
       (.I0(\m_payload_i_reg[35]_0 [28]),
        .I1(\m_payload_i_reg[35]_0 [29]),
        .I2(\m_payload_i_reg[35]_0 [26]),
        .I3(\m_payload_i_reg[35]_0 [27]),
        .O(\m_payload_i[32]_i_5__0_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \m_payload_i[32]_i_6__0 
       (.I0(\m_payload_i_reg[35]_0 [24]),
        .I1(\m_payload_i_reg[35]_0 [25]),
        .I2(\m_payload_i_reg[35]_0 [22]),
        .I3(\m_payload_i_reg[35]_0 [23]),
        .O(\m_payload_i[32]_i_6__0_n_0 ));
  FDRE \m_payload_i_reg[0] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [0]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE \m_payload_i_reg[10] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [10]),
        .Q(Q[10]),
        .R(1'b0));
  FDRE \m_payload_i_reg[11] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [11]),
        .Q(Q[11]),
        .R(1'b0));
  FDRE \m_payload_i_reg[12] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [12]),
        .Q(Q[12]),
        .R(1'b0));
  FDRE \m_payload_i_reg[13] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [13]),
        .Q(Q[13]),
        .R(1'b0));
  FDRE \m_payload_i_reg[14] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [14]),
        .Q(Q[14]),
        .R(1'b0));
  FDRE \m_payload_i_reg[15] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [15]),
        .Q(Q[15]),
        .R(1'b0));
  FDRE \m_payload_i_reg[16] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [16]),
        .Q(Q[16]),
        .R(1'b0));
  FDRE \m_payload_i_reg[17] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [17]),
        .Q(Q[17]),
        .R(1'b0));
  FDRE \m_payload_i_reg[18] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [18]),
        .Q(Q[18]),
        .R(1'b0));
  FDRE \m_payload_i_reg[19] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [19]),
        .Q(Q[19]),
        .R(1'b0));
  FDRE \m_payload_i_reg[1] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [1]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE \m_payload_i_reg[20] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [20]),
        .Q(Q[20]),
        .R(1'b0));
  FDRE \m_payload_i_reg[21] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [21]),
        .Q(Q[21]),
        .R(1'b0));
  FDRE \m_payload_i_reg[22] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [22]),
        .Q(Q[22]),
        .R(1'b0));
  FDRE \m_payload_i_reg[23] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [23]),
        .Q(Q[23]),
        .R(1'b0));
  FDRE \m_payload_i_reg[24] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [24]),
        .Q(Q[24]),
        .R(1'b0));
  FDRE \m_payload_i_reg[25] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [25]),
        .Q(Q[25]),
        .R(1'b0));
  FDRE \m_payload_i_reg[26] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [26]),
        .Q(Q[26]),
        .R(1'b0));
  FDRE \m_payload_i_reg[27] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [27]),
        .Q(Q[27]),
        .R(1'b0));
  FDRE \m_payload_i_reg[28] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [28]),
        .Q(Q[28]),
        .R(1'b0));
  FDRE \m_payload_i_reg[29] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [29]),
        .Q(Q[29]),
        .R(1'b0));
  FDRE \m_payload_i_reg[2] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [2]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE \m_payload_i_reg[30] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [30]),
        .Q(Q[30]),
        .R(1'b0));
  FDRE \m_payload_i_reg[31] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [31]),
        .Q(Q[31]),
        .R(1'b0));
  FDRE \m_payload_i_reg[32] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(r_match),
        .Q(Q[32]),
        .R(1'b0));
  FDRE \m_payload_i_reg[33] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [32]),
        .Q(Q[33]),
        .R(1'b0));
  FDRE \m_payload_i_reg[34] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [33]),
        .Q(Q[34]),
        .R(1'b0));
  FDRE \m_payload_i_reg[35] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [34]),
        .Q(Q[35]),
        .R(1'b0));
  FDRE \m_payload_i_reg[3] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [3]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE \m_payload_i_reg[4] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [4]),
        .Q(Q[4]),
        .R(1'b0));
  FDRE \m_payload_i_reg[5] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [5]),
        .Q(Q[5]),
        .R(1'b0));
  FDRE \m_payload_i_reg[6] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [6]),
        .Q(Q[6]),
        .R(1'b0));
  FDRE \m_payload_i_reg[7] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [7]),
        .Q(Q[7]),
        .R(1'b0));
  FDRE \m_payload_i_reg[8] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [8]),
        .Q(Q[8]),
        .R(1'b0));
  FDRE \m_payload_i_reg[9] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [9]),
        .Q(Q[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hDFD0)) 
    m_valid_i_inv_i_1__0
       (.I0(s_axi_arvalid),
        .I1(s_axi_arready_0[5]),
        .I2(sr_axi_arready),
        .I3(m_valid_i_reg_inv_3),
        .O(m_valid_i_inv_i_1__0_n_0));
  FDSE #(
    .INIT(1'b1)) 
    m_valid_i_reg_inv
       (.C(aclk),
        .CE(1'b1),
        .D(m_valid_i_inv_i_1__0_n_0),
        .Q(m_valid_i_reg_inv_0),
        .S(m_valid_i_reg_inv_2));
  LUT2 #(
    .INIT(4'h2)) 
    s_axi_arready_INST_0
       (.I0(sr_axi_arready),
        .I1(s_axi_arready_0[5]),
        .O(s_axi_arready));
  LUT6 #(
    .INIT(64'hFD5DFDFD00000000)) 
    s_ready_i_i_1
       (.I0(s_ready_i_reg_1),
        .I1(m_valid_i_reg_inv_3),
        .I2(m_valid_i_reg_inv_0),
        .I3(s_axi_arready_0[5]),
        .I4(s_axi_arvalid),
        .I5(s_ready_i_reg_2),
        .O(s_ready_i_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    s_ready_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(s_ready_i_i_1_n_0),
        .Q(sr_axi_arready),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_register_slice_v2_1_21_axic_register_slice" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_register_slice_v2_1_21_axic_register_slice_0
   (\aresetn_d_reg[0]_0 ,
    \aresetn_d_reg[1]_0 ,
    m_valid_i_reg_inv_0,
    \aresetn_d_reg[1]_1 ,
    m_valid_i_reg_inv_1,
    Q,
    D,
    \s_axi_awaddr[13] ,
    m_axi_bvalid_0,
    \gen_write.w_mask_reg ,
    s_axi_awready,
    m_axi_awvalid,
    m_valid_i_reg_inv_2,
    aresetn,
    aclk,
    m_axi_awvalid_0,
    \FSM_onehot_gen_write.w_state_reg[1] ,
    m_axi_awvalid_1,
    s_axi_awvalid,
    s_axi_awready_0,
    m_valid_i_reg_inv_3,
    aw_pop,
    \gen_write.w_mask_reg_0 ,
    aw_pop0,
    m_axi_bvalid,
    s_axi_bready,
    w_mask,
    \gen_write.w_mask_reg_1 ,
    \m_payload_i_reg[35]_0 );
  output \aresetn_d_reg[0]_0 ;
  output \aresetn_d_reg[1]_0 ;
  output m_valid_i_reg_inv_0;
  output \aresetn_d_reg[1]_1 ;
  output m_valid_i_reg_inv_1;
  output [35:0]Q;
  output [4:0]D;
  output [0:0]\s_axi_awaddr[13] ;
  output [0:0]m_axi_bvalid_0;
  output \gen_write.w_mask_reg ;
  output s_axi_awready;
  output m_axi_awvalid;
  output m_valid_i_reg_inv_2;
  input aresetn;
  input aclk;
  input m_axi_awvalid_0;
  input \FSM_onehot_gen_write.w_state_reg[1] ;
  input m_axi_awvalid_1;
  input s_axi_awvalid;
  input [5:0]s_axi_awready_0;
  input m_valid_i_reg_inv_3;
  input aw_pop;
  input \gen_write.w_mask_reg_0 ;
  input aw_pop0;
  input m_axi_bvalid;
  input s_axi_bready;
  input w_mask;
  input \gen_write.w_mask_reg_1 ;
  input [34:0]\m_payload_i_reg[35]_0 ;

  wire [4:0]D;
  wire \FSM_onehot_gen_write.w_state_reg[1] ;
  wire [35:0]Q;
  wire aclk;
  wire aresetn;
  wire \aresetn_d[1]_i_1_n_0 ;
  wire \aresetn_d_reg[0]_0 ;
  wire \aresetn_d_reg[1]_0 ;
  wire \aresetn_d_reg[1]_1 ;
  wire aw_cnt119_out;
  wire aw_pop;
  wire aw_pop0;
  wire \gen_write.aw_cnt[5]_i_5_n_0 ;
  wire \gen_write.w_mask_reg ;
  wire \gen_write.w_mask_reg_0 ;
  wire \gen_write.w_mask_reg_1 ;
  wire m_axi_awvalid;
  wire m_axi_awvalid_0;
  wire m_axi_awvalid_1;
  wire m_axi_bvalid;
  wire [0:0]m_axi_bvalid_0;
  wire \m_payload_i[32]_i_2_n_0 ;
  wire \m_payload_i[32]_i_3_n_0 ;
  wire \m_payload_i[32]_i_4_n_0 ;
  wire \m_payload_i[32]_i_5_n_0 ;
  wire \m_payload_i[32]_i_6_n_0 ;
  wire [34:0]\m_payload_i_reg[35]_0 ;
  wire m_valid_i_inv_i_1_n_0;
  wire m_valid_i_reg_inv_0;
  wire m_valid_i_reg_inv_1;
  wire m_valid_i_reg_inv_2;
  wire m_valid_i_reg_inv_3;
  wire p_18_in;
  wire [0:0]\s_axi_awaddr[13] ;
  wire s_axi_awready;
  wire [5:0]s_axi_awready_0;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_ready_i_i_1_n_0;
  wire sr_axi_awready;
  wire w_mask;

  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h10FF1F00)) 
    \FSM_onehot_gen_write.w_state[1]_i_1 
       (.I0(m_valid_i_reg_inv_0),
        .I1(Q[32]),
        .I2(m_axi_awvalid_0),
        .I3(\FSM_onehot_gen_write.w_state_reg[1] ),
        .I4(m_axi_awvalid_1),
        .O(m_valid_i_reg_inv_1));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_gen_write.w_state[2]_i_1 
       (.I0(\aresetn_d_reg[1]_0 ),
        .O(\aresetn_d_reg[1]_1 ));
  LUT2 #(
    .INIT(4'h8)) 
    \aresetn_d[1]_i_1 
       (.I0(\aresetn_d_reg[0]_0 ),
        .I1(aresetn),
        .O(\aresetn_d[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \aresetn_d_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(aresetn),
        .Q(\aresetn_d_reg[0]_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \aresetn_d_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\aresetn_d[1]_i_1_n_0 ),
        .Q(\aresetn_d_reg[1]_0 ),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h1)) 
    \gen_axilite.gen_write.s_axi_bvalid_i_i_2 
       (.I0(m_valid_i_reg_inv_0),
        .I1(Q[32]),
        .O(m_valid_i_reg_inv_2));
  LUT3 #(
    .INIT(8'h69)) 
    \gen_write.aw_cnt[1]_i_1 
       (.I0(s_axi_awready_0[0]),
        .I1(aw_cnt119_out),
        .I2(s_axi_awready_0[1]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h78E1)) 
    \gen_write.aw_cnt[2]_i_1 
       (.I0(s_axi_awready_0[0]),
        .I1(aw_cnt119_out),
        .I2(s_axi_awready_0[2]),
        .I3(s_axi_awready_0[1]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h7F80FE01)) 
    \gen_write.aw_cnt[3]_i_1 
       (.I0(aw_cnt119_out),
        .I1(s_axi_awready_0[0]),
        .I2(s_axi_awready_0[1]),
        .I3(s_axi_awready_0[3]),
        .I4(s_axi_awready_0[2]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'h7FFF8000FFFE0001)) 
    \gen_write.aw_cnt[4]_i_1 
       (.I0(s_axi_awready_0[1]),
        .I1(s_axi_awready_0[0]),
        .I2(aw_cnt119_out),
        .I3(s_axi_awready_0[2]),
        .I4(s_axi_awready_0[4]),
        .I5(s_axi_awready_0[3]),
        .O(D[3]));
  LUT6 #(
    .INIT(64'h0080808080808080)) 
    \gen_write.aw_cnt[4]_i_2 
       (.I0(\s_axi_awaddr[13] ),
        .I1(sr_axi_awready),
        .I2(\gen_write.w_mask_reg_0 ),
        .I3(s_axi_bready),
        .I4(m_axi_bvalid),
        .I5(aw_pop0),
        .O(aw_cnt119_out));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \gen_write.aw_cnt[5]_i_1 
       (.I0(p_18_in),
        .I1(aw_pop0),
        .I2(m_axi_bvalid),
        .I3(s_axi_bready),
        .O(m_axi_bvalid_0));
  LUT6 #(
    .INIT(64'h7FFF8000FFFE0001)) 
    \gen_write.aw_cnt[5]_i_2 
       (.I0(s_axi_awready_0[2]),
        .I1(\gen_write.aw_cnt[5]_i_5_n_0 ),
        .I2(s_axi_awready_0[1]),
        .I3(s_axi_awready_0[3]),
        .I4(s_axi_awready_0[5]),
        .I5(s_axi_awready_0[4]),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \gen_write.aw_cnt[5]_i_3 
       (.I0(s_axi_awready_0[5]),
        .I1(s_axi_awvalid),
        .I2(sr_axi_awready),
        .I3(\s_axi_awaddr[13] ),
        .O(p_18_in));
  LUT6 #(
    .INIT(64'h7555555510000000)) 
    \gen_write.aw_cnt[5]_i_5 
       (.I0(s_axi_awready_0[1]),
        .I1(aw_pop),
        .I2(\gen_write.w_mask_reg_0 ),
        .I3(sr_axi_awready),
        .I4(\s_axi_awaddr[13] ),
        .I5(s_axi_awready_0[0]),
        .O(\gen_write.aw_cnt[5]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000E0E0E0)) 
    \gen_write.w_mask_i_1 
       (.I0(w_mask),
        .I1(\gen_write.w_mask_reg_0 ),
        .I2(\aresetn_d_reg[1]_0 ),
        .I3(\s_axi_awaddr[13] ),
        .I4(s_axi_awready),
        .I5(\gen_write.w_mask_reg_1 ),
        .O(\gen_write.w_mask_reg ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    m_axi_awvalid_INST_0
       (.I0(Q[32]),
        .I1(m_axi_awvalid_1),
        .I2(m_valid_i_reg_inv_0),
        .I3(m_axi_awvalid_0),
        .O(m_axi_awvalid));
  LUT5 #(
    .INIT(32'h00000001)) 
    \m_payload_i[32]_i_1 
       (.I0(\m_payload_i[32]_i_2_n_0 ),
        .I1(\m_payload_i[32]_i_3_n_0 ),
        .I2(\m_payload_i[32]_i_4_n_0 ),
        .I3(\m_payload_i[32]_i_5_n_0 ),
        .I4(\m_payload_i[32]_i_6_n_0 ),
        .O(\s_axi_awaddr[13] ));
  LUT3 #(
    .INIT(8'hEF)) 
    \m_payload_i[32]_i_2 
       (.I0(\m_payload_i_reg[35]_0 [13]),
        .I1(\m_payload_i_reg[35]_0 [31]),
        .I2(\m_payload_i_reg[35]_0 [30]),
        .O(\m_payload_i[32]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \m_payload_i[32]_i_3 
       (.I0(\m_payload_i_reg[35]_0 [20]),
        .I1(\m_payload_i_reg[35]_0 [21]),
        .I2(\m_payload_i_reg[35]_0 [18]),
        .I3(\m_payload_i_reg[35]_0 [19]),
        .O(\m_payload_i[32]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \m_payload_i[32]_i_4 
       (.I0(\m_payload_i_reg[35]_0 [16]),
        .I1(\m_payload_i_reg[35]_0 [17]),
        .I2(\m_payload_i_reg[35]_0 [14]),
        .I3(\m_payload_i_reg[35]_0 [15]),
        .O(\m_payload_i[32]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \m_payload_i[32]_i_5 
       (.I0(\m_payload_i_reg[35]_0 [28]),
        .I1(\m_payload_i_reg[35]_0 [29]),
        .I2(\m_payload_i_reg[35]_0 [26]),
        .I3(\m_payload_i_reg[35]_0 [27]),
        .O(\m_payload_i[32]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \m_payload_i[32]_i_6 
       (.I0(\m_payload_i_reg[35]_0 [24]),
        .I1(\m_payload_i_reg[35]_0 [25]),
        .I2(\m_payload_i_reg[35]_0 [22]),
        .I3(\m_payload_i_reg[35]_0 [23]),
        .O(\m_payload_i[32]_i_6_n_0 ));
  FDRE \m_payload_i_reg[0] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [0]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE \m_payload_i_reg[10] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [10]),
        .Q(Q[10]),
        .R(1'b0));
  FDRE \m_payload_i_reg[11] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [11]),
        .Q(Q[11]),
        .R(1'b0));
  FDRE \m_payload_i_reg[12] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [12]),
        .Q(Q[12]),
        .R(1'b0));
  FDRE \m_payload_i_reg[13] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [13]),
        .Q(Q[13]),
        .R(1'b0));
  FDRE \m_payload_i_reg[14] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [14]),
        .Q(Q[14]),
        .R(1'b0));
  FDRE \m_payload_i_reg[15] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [15]),
        .Q(Q[15]),
        .R(1'b0));
  FDRE \m_payload_i_reg[16] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [16]),
        .Q(Q[16]),
        .R(1'b0));
  FDRE \m_payload_i_reg[17] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [17]),
        .Q(Q[17]),
        .R(1'b0));
  FDRE \m_payload_i_reg[18] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [18]),
        .Q(Q[18]),
        .R(1'b0));
  FDRE \m_payload_i_reg[19] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [19]),
        .Q(Q[19]),
        .R(1'b0));
  FDRE \m_payload_i_reg[1] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [1]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE \m_payload_i_reg[20] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [20]),
        .Q(Q[20]),
        .R(1'b0));
  FDRE \m_payload_i_reg[21] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [21]),
        .Q(Q[21]),
        .R(1'b0));
  FDRE \m_payload_i_reg[22] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [22]),
        .Q(Q[22]),
        .R(1'b0));
  FDRE \m_payload_i_reg[23] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [23]),
        .Q(Q[23]),
        .R(1'b0));
  FDRE \m_payload_i_reg[24] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [24]),
        .Q(Q[24]),
        .R(1'b0));
  FDRE \m_payload_i_reg[25] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [25]),
        .Q(Q[25]),
        .R(1'b0));
  FDRE \m_payload_i_reg[26] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [26]),
        .Q(Q[26]),
        .R(1'b0));
  FDRE \m_payload_i_reg[27] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [27]),
        .Q(Q[27]),
        .R(1'b0));
  FDRE \m_payload_i_reg[28] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [28]),
        .Q(Q[28]),
        .R(1'b0));
  FDRE \m_payload_i_reg[29] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [29]),
        .Q(Q[29]),
        .R(1'b0));
  FDRE \m_payload_i_reg[2] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [2]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE \m_payload_i_reg[30] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [30]),
        .Q(Q[30]),
        .R(1'b0));
  FDRE \m_payload_i_reg[31] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [31]),
        .Q(Q[31]),
        .R(1'b0));
  FDRE \m_payload_i_reg[32] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\s_axi_awaddr[13] ),
        .Q(Q[32]),
        .R(1'b0));
  FDRE \m_payload_i_reg[33] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [32]),
        .Q(Q[33]),
        .R(1'b0));
  FDRE \m_payload_i_reg[34] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [33]),
        .Q(Q[34]),
        .R(1'b0));
  FDRE \m_payload_i_reg[35] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [34]),
        .Q(Q[35]),
        .R(1'b0));
  FDRE \m_payload_i_reg[3] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [3]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE \m_payload_i_reg[4] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [4]),
        .Q(Q[4]),
        .R(1'b0));
  FDRE \m_payload_i_reg[5] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [5]),
        .Q(Q[5]),
        .R(1'b0));
  FDRE \m_payload_i_reg[6] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [6]),
        .Q(Q[6]),
        .R(1'b0));
  FDRE \m_payload_i_reg[7] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [7]),
        .Q(Q[7]),
        .R(1'b0));
  FDRE \m_payload_i_reg[8] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [8]),
        .Q(Q[8]),
        .R(1'b0));
  FDRE \m_payload_i_reg[9] 
       (.C(aclk),
        .CE(m_valid_i_reg_inv_0),
        .D(\m_payload_i_reg[35]_0 [9]),
        .Q(Q[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hDFD0)) 
    m_valid_i_inv_i_1
       (.I0(s_axi_awvalid),
        .I1(s_axi_awready_0[5]),
        .I2(sr_axi_awready),
        .I3(m_valid_i_reg_inv_3),
        .O(m_valid_i_inv_i_1_n_0));
  FDSE #(
    .INIT(1'b1)) 
    m_valid_i_reg_inv
       (.C(aclk),
        .CE(1'b1),
        .D(m_valid_i_inv_i_1_n_0),
        .Q(m_valid_i_reg_inv_0),
        .S(\aresetn_d_reg[1]_1 ));
  LUT2 #(
    .INIT(4'h2)) 
    s_axi_awready_INST_0
       (.I0(sr_axi_awready),
        .I1(s_axi_awready_0[5]),
        .O(s_axi_awready));
  LUT6 #(
    .INIT(64'hFD5DFDFD00000000)) 
    s_ready_i_i_1
       (.I0(\aresetn_d_reg[1]_0 ),
        .I1(m_valid_i_reg_inv_3),
        .I2(m_valid_i_reg_inv_0),
        .I3(s_axi_awready_0[5]),
        .I4(s_axi_awvalid),
        .I5(\aresetn_d_reg[0]_0 ),
        .O(s_ready_i_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    s_ready_i_reg
       (.C(aclk),
        .CE(1'b1),
        .D(s_ready_i_i_1_n_0),
        .Q(sr_axi_awready),
        .R(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "shared_bram_s00_mmu_0,axi_mmu_v2_1_19_top,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "axi_mmu_v2_1_19_top,Vivado 2020.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (aclk,
    aresetn,
    s_axi_awaddr,
    s_axi_awprot,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arprot,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_awaddr,
    m_axi_awprot,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_bready,
    m_axi_araddr,
    m_axi_arprot,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rvalid,
    m_axi_rready);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN shared_bram_processing_system7_0_0_FCLK_CLK0, ASSOCIATED_BUSIF S_AXI:M_AXI, ASSOCIATED_RESET ARESETN, INSERT_VIP 0" *) input aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST, POLARITY ACTIVE_LOW, INSERT_VIP 0, TYPE INTERCONNECT" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *) input [31:0]s_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWPROT" *) input [2:0]s_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *) input s_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) output s_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *) input [31:0]s_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *) input [3:0]s_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *) input s_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *) output s_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) output [1:0]s_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) output s_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *) input s_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *) input [31:0]s_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARPROT" *) input [2:0]s_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *) input s_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *) output s_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) output [31:0]s_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) output [1:0]s_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) output s_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN shared_bram_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWADDR" *) output [31:0]m_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWPROT" *) output [2:0]m_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWVALID" *) output m_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWREADY" *) input m_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WDATA" *) output [31:0]m_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WSTRB" *) output [3:0]m_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WVALID" *) output m_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WREADY" *) input m_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BRESP" *) input [1:0]m_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BVALID" *) input m_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BREADY" *) output m_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARADDR" *) output [31:0]m_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARPROT" *) output [2:0]m_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARVALID" *) output m_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARREADY" *) input m_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RDATA" *) input [31:0]m_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RRESP" *) input [1:0]m_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RVALID" *) input m_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXI, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN shared_bram_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output m_axi_rready;

  wire aclk;
  wire aresetn;
  wire [31:0]m_axi_araddr;
  wire [2:0]m_axi_arprot;
  wire m_axi_arready;
  wire m_axi_arvalid;
  wire [31:0]m_axi_awaddr;
  wire [2:0]m_axi_awprot;
  wire m_axi_awready;
  wire m_axi_awvalid;
  wire m_axi_bready;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire [31:0]m_axi_rdata;
  wire m_axi_rready;
  wire [1:0]m_axi_rresp;
  wire m_axi_rvalid;
  wire [31:0]m_axi_wdata;
  wire m_axi_wready;
  wire [3:0]m_axi_wstrb;
  wire m_axi_wvalid;
  wire [31:0]s_axi_araddr;
  wire [2:0]s_axi_arprot;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire [2:0]s_axi_awprot;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [1:0]s_axi_bresp;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire [1:0]s_axi_rresp;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire NLW_inst_m_axi_wlast_UNCONNECTED;
  wire NLW_inst_s_axi_rlast_UNCONNECTED;
  wire [1:0]NLW_inst_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_inst_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_arlock_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_arqos_UNCONNECTED;
  wire [2:0]NLW_inst_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_aruser_UNCONNECTED;
  wire [1:0]NLW_inst_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_inst_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_awlock_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_awqos_UNCONNECTED;
  wire [2:0]NLW_inst_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_awuser_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_wid_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_wuser_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_bid_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_buser_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_rid_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_ruser_UNCONNECTED;

  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "32" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_PROTOCOL = "2" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_SUPPORTS_USER_SIGNALS = "0" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_BASE_ADDR = "64'b0000000000000000000000000000000001000000000000000000000000000000" *) 
  (* C_DEST = "1'b0" *) 
  (* C_DEST_WIDTH = "1" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_M_AXI_ADDR_WIDTH = "32" *) 
  (* C_M_AXI_SUPPORTS_READ = "1'b1" *) 
  (* C_M_AXI_SUPPORTS_WRITE = "1'b1" *) 
  (* C_NUM_RANGES = "1" *) 
  (* C_PREFIX = "1'b0" *) 
  (* C_PREFIX_WIDTH = "1" *) 
  (* C_RANGE_SIZE = "13" *) 
  (* C_S_AXI_ADDR_WIDTH = "32" *) 
  (* C_S_AXI_SUPPORTS_READ = "1" *) 
  (* C_S_AXI_SUPPORTS_WRITE = "1" *) 
  (* C_USES_DEST = "0" *) 
  (* DowngradeIPIdentifiedWarnings = "yes" *) 
  (* P_AXI3 = "1" *) 
  (* P_AXI4 = "0" *) 
  (* P_AXILITE = "2" *) 
  (* P_DECERR = "2'b11" *) 
  (* P_NUM_RANGES_LOG = "1" *) 
  (* R_DECERR = "2'b11" *) 
  (* R_IDLE = "2'b00" *) 
  (* R_PENDING = "2'b01" *) 
  (* W_DECERR = "2'b11" *) 
  (* W_IDLE = "2'b00" *) 
  (* W_PENDING = "2'b01" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_mmu_v2_1_19_top inst
       (.aclk(aclk),
        .aresetn(aresetn),
        .m_axi_araddr(m_axi_araddr),
        .m_axi_arburst(NLW_inst_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_inst_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_inst_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_inst_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_inst_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(m_axi_arprot),
        .m_axi_arqos(NLW_inst_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(m_axi_arready),
        .m_axi_arsize(NLW_inst_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_inst_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(m_axi_arvalid),
        .m_axi_awaddr(m_axi_awaddr),
        .m_axi_awburst(NLW_inst_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_inst_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_inst_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_inst_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_inst_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(m_axi_awprot),
        .m_axi_awqos(NLW_inst_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(m_axi_awready),
        .m_axi_awsize(NLW_inst_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_inst_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_bid(1'b0),
        .m_axi_bready(m_axi_bready),
        .m_axi_bresp(m_axi_bresp),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(m_axi_bvalid),
        .m_axi_rdata(m_axi_rdata),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b1),
        .m_axi_rready(m_axi_rready),
        .m_axi_rresp(m_axi_rresp),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(m_axi_rvalid),
        .m_axi_wdata(m_axi_wdata),
        .m_axi_wid(NLW_inst_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_inst_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(m_axi_wready),
        .m_axi_wstrb(m_axi_wstrb),
        .m_axi_wuser(NLW_inst_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(m_axi_wvalid),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst({1'b0,1'b1}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(s_axi_arready),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst({1'b0,1'b1}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(s_axi_awready),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bid(NLW_inst_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_buser(NLW_inst_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rid(NLW_inst_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_inst_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_ruser(NLW_inst_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b1),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(s_axi_wvalid));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

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

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

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

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
