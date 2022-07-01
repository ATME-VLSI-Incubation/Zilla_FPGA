`define ZILLA_32_BIT 
`timescale 1ns / 1ps
//zilla interrupt contrller memory mapped register top module

//zic_info //not needed for zic //onlt software read
//zic_eoi  //value is not needed for zic, only eoi_wr_en from processor is needed        
//zic_ack  //needed by the processor //written by zic
//zic_nxtp //for sw read //written by zic
//zic_ip   //written by zic //for sw read purpose
//zic_ie   //written by software also by zic depending upon present interrupt id value
//zic_int_attr //for software read
//zic_int_ctl //specifies level-priority value for each interrupt
////zic_int_cfg //specifies how level and priority are assigned

//
module zic_mmr_top
(
input 		zic_clk			,
input 		zic_rst			,
//write and read signals from/to the core
input 		zic_mmr_write_en_i	,
input 		[15:0]zic_mmr_write_addr_i	,
input 		[31:0]zic_mmr_write_data_i	,
input 		zic_mmr_read_en_i	,
input 		[15:0]zic_mmr_read_addr_i	,
output 		[31:0]zic_mmr_read_data_o	,
//////////////////////////////////////////
//signals to zic 
output [7:0] 	irq0_ctrl_o		,// [7:0] - zic_ip
output [7:0] 	irq1_ctrl_o		,
output [7:0] 	irq2_ctrl_o		,
output [7:0] 	irq3_ctrl_o		,
output [7:0] 	irq4_ctrl_o		,
output [7:0] 	irq5_ctrl_o		,
output [7:0] 	irq6_ctrl_o		,
output [7:0] 	irq7_ctrl_o		,
output [7:0] 	irq8_ctrl_o		,
output [7:0] 	irq9_ctrl_o		,
output [7:0] 	irq10_ctrl_o		,
output [7:0] 	irq11_ctrl_o		,
output [7:0] 	irq12_ctrl_o		,
output [7:0] 	irq13_ctrl_o		,
output [7:0] 	irq14_ctrl_o		,
output [7:0] 	irq15_ctrl_o		,
output [7:0] 	irq16_ctrl_o		,
output [7:0] 	irq17_ctrl_o		,
output [7:0] 	irq18_ctrl_o		,
output [7:0] 	irq19_ctrl_o		,
output [7:0] 	irq20_ctrl_o		,
output [7:0] 	irq21_ctrl_o		,
output [7:0] 	irq22_ctrl_o		,
output [7:0] 	irq23_ctrl_o		,
output [7:0] 	irq24_ctrl_o		,
output [7:0] 	irq25_ctrl_o		,
output [7:0] 	irq26_ctrl_o		,
output [7:0] 	irq27_ctrl_o		,
output [7:0] 	irq28_ctrl_o		,
output [7:0] 	irq29_ctrl_o		,
output [7:0] 	irq30_ctrl_o		,
output [7:0] 	irq31_ctrl_o		,
output [7:0] 	irq32_ctrl_o		,
output [7:0] 	irq33_ctrl_o		,
output [7:0] 	irq34_ctrl_o		,
output [7:0] 	irq35_ctrl_o		,
output [7:0] 	irq36_ctrl_o		,
output [7:0] 	irq37_ctrl_o		,
output [7:0] 	irq38_ctrl_o		,
output [7:0] 	irq39_ctrl_o		,
output [7:0] 	irq40_ctrl_o		,
output [7:0] 	irq41_ctrl_o		,
output [7:0] 	irq42_ctrl_o		,
output [7:0] 	irq43_ctrl_o		,
output [7:0] 	irq44_ctrl_o		,
output [7:0] 	irq45_ctrl_o		,
output [7:0] 	irq46_ctrl_o		,
output [7:0] 	irq47_ctrl_o		,
output [47:0]  zic_int_en_o		,
output wdt_irq_o	,
//acknowledgement signals
input 		zic_ack_write_valid_i		,//ack int id write enable from zic
input   [7:0] 	zic_ack_int_id_i		,//ack int id from zic
input 		zic_ack_read_valid_en		,//ack int id read en from processor
output 	[7:0]	zic_ack_int_id_o		,//to processor ack
output 		zic_ack_o			,//acknowledgement signal to zic
//end of interrupt signals
input 		zic_eoi_valid_i			,//eoi write enable from processor
input   [7:0] 	zic_eoi_id_i			,//eoi int id from processor
output 		zic_eoi_o			,//eoi signal to zic
//next pending interrupt id signals
input 		zic_nxtp_valid_i		,//from zic to reg file
input  [7:0] 	zic_nxtp_id_i			,//from zic to reg file
//interrupt pending signals
input 		zic_int_pending_valid_i 	,//lets make one bit	
input [47:0] 	zic_int_pending_bit_i		,
//interrupt enable signals
input 	[47:0]	global_int_enable_bit_i		,
input  	  	global_int_enable_valid_i	 ,//lets make one bit
input debug_mode_valid_i             ,
input debug_mode_reset_i             ,
input debug_ndm_reset_i          ,
output wdt_reset_o


);
  wire [31:0] wdt_timeout_reg_w;
  wire [31:0] wdt_counter_w	;
  wire [31:0] wdt_ctrl_w	;
  
wire   [7:0] 	ack_int_id_w	  ;
wire   [7:0] 	zic_eoi_id_w	  ;
wire   [7:0] 	zic_cfg_w	  ;
wire   [31:0] 	zic_info_w	  ;
wire   [7:0] 	zic_nxtp_w	  ;

wire [31:0]irq0_ctrl_w; 
wire [31:0]irq1_ctrl_w; 
wire [31:0]irq2_ctrl_w; 
wire [31:0]irq3_ctrl_w; 
wire [31:0]irq4_ctrl_w; 
wire [31:0]irq5_ctrl_w; 
wire [31:0]irq6_ctrl_w; 
wire [31:0]irq7_ctrl_w; 
wire [31:0]irq8_ctrl_w; 
wire [31:0]irq9_ctrl_w; 
wire [31:0]irq10_ctrl_w; 
wire [31:0]irq11_ctrl_w;
wire [31:0]irq12_ctrl_w;
wire [31:0]irq13_ctrl_w;
wire [31:0]irq14_ctrl_w;
wire [31:0]irq15_ctrl_w;
wire [31:0]irq16_ctrl_w;
wire [31:0]irq17_ctrl_w;
wire [31:0]irq18_ctrl_w;
wire [31:0]irq19_ctrl_w;
wire [31:0]irq20_ctrl_w;
wire [31:0]irq21_ctrl_w;
wire [31:0]irq22_ctrl_w;
wire [31:0]irq23_ctrl_w;
wire [31:0]irq24_ctrl_w;
wire [31:0]irq25_ctrl_w;
wire [31:0]irq26_ctrl_w;
wire [31:0]irq27_ctrl_w;
wire [31:0]irq28_ctrl_w;
wire [31:0]irq29_ctrl_w;
wire [31:0]irq30_ctrl_w;
wire [31:0]irq31_ctrl_w;
wire [31:0]irq32_ctrl_w;
wire [31:0]irq33_ctrl_w;
wire [31:0]irq34_ctrl_w;
wire [31:0]irq35_ctrl_w;
wire [31:0]irq36_ctrl_w;
wire [31:0]irq37_ctrl_w;
wire [31:0]irq38_ctrl_w;
wire [31:0]irq39_ctrl_w;
wire [31:0]irq40_ctrl_w;
wire [31:0]irq41_ctrl_w;
wire [31:0]irq42_ctrl_w;
wire [31:0]irq43_ctrl_w;
wire [31:0]irq44_ctrl_w;
wire [31:0]irq45_ctrl_w;
wire [31:0]irq46_ctrl_w;
wire [31:0]irq47_ctrl_w;

assign irq0_ctrl_o =  irq0_ctrl_w[31:24]; 
assign irq1_ctrl_o =  irq1_ctrl_w[31:24]; 
assign irq2_ctrl_o =  irq2_ctrl_w[31:24]; 
assign irq3_ctrl_o =  irq3_ctrl_w[31:24]; 
assign irq4_ctrl_o =  irq4_ctrl_w[31:24]; 
assign irq5_ctrl_o =  irq5_ctrl_w[31:24]; 
assign irq6_ctrl_o =  irq6_ctrl_w[31:24]; 
assign irq7_ctrl_o =  irq7_ctrl_w[31:24]; 
assign irq8_ctrl_o =  irq8_ctrl_w[31:24]; 
assign irq9_ctrl_o =  irq9_ctrl_w[31:24]; 
assign irq10_ctrl_o= irq10_ctrl_w[31:24]; 
assign irq11_ctrl_o= irq11_ctrl_w[31:24];
assign irq12_ctrl_o= irq12_ctrl_w[31:24];
assign irq13_ctrl_o= irq13_ctrl_w[31:24];
assign irq14_ctrl_o= irq14_ctrl_w[31:24];
assign irq15_ctrl_o= irq15_ctrl_w[31:24];
assign irq16_ctrl_o= irq16_ctrl_w[31:24];
assign irq17_ctrl_o= irq17_ctrl_w[31:24];
assign irq18_ctrl_o= irq18_ctrl_w[31:24];
assign irq19_ctrl_o= irq19_ctrl_w[31:24];
assign irq20_ctrl_o= irq20_ctrl_w[31:24];
assign irq21_ctrl_o= irq21_ctrl_w[31:24];
assign irq22_ctrl_o= irq22_ctrl_w[31:24];
assign irq23_ctrl_o= irq23_ctrl_w[31:24];
assign irq24_ctrl_o= irq24_ctrl_w[31:24];
assign irq25_ctrl_o= irq25_ctrl_w[31:24];
assign irq26_ctrl_o= irq26_ctrl_w[31:24];
assign irq27_ctrl_o= irq27_ctrl_w[31:24];
assign irq28_ctrl_o= irq28_ctrl_w[31:24];
assign irq29_ctrl_o= irq29_ctrl_w[31:24];
assign irq30_ctrl_o= irq30_ctrl_w[31:24];
assign irq31_ctrl_o= irq31_ctrl_w[31:24];
assign irq32_ctrl_o= irq32_ctrl_w[31:24];
assign irq33_ctrl_o= irq33_ctrl_w[31:24];
assign irq34_ctrl_o= irq34_ctrl_w[31:24];
assign irq35_ctrl_o= irq35_ctrl_w[31:24];
assign irq36_ctrl_o= irq36_ctrl_w[31:24];
assign irq37_ctrl_o= irq37_ctrl_w[31:24];
assign irq38_ctrl_o= irq38_ctrl_w[31:24];
assign irq39_ctrl_o= irq39_ctrl_w[31:24];
assign irq40_ctrl_o= irq40_ctrl_w[31:24];
assign irq41_ctrl_o= irq41_ctrl_w[31:24];
assign irq42_ctrl_o= irq42_ctrl_w[31:24];
assign irq43_ctrl_o= irq43_ctrl_w[31:24];
assign irq44_ctrl_o= irq44_ctrl_w[31:24];
assign irq45_ctrl_o= irq45_ctrl_w[31:24];
assign irq46_ctrl_o= irq46_ctrl_w[31:24];
assign irq47_ctrl_o= irq47_ctrl_w[31:24];

assign zic_eoi_o = zic_eoi_valid_i;
assign zic_ack_o = zic_ack_read_valid_en;


zic_mmr_reg_file zic_mmr_reg_file_inst
(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_o        (wdt_reset_o    ),
.zic_mmr_write_en_i		(zic_mmr_write_en_i		),//store write enable
.zic_mmr_write_addr_i		(zic_mmr_write_addr_i		),//store write address
.zic_mmr_write_data_i		(zic_mmr_write_data_i		),//store write data
.zic_int_pending_valid_i 	(zic_int_pending_valid_i 	),	
.zic_int_pending_bit_i		(zic_int_pending_bit_i		),//zic interrupt pending bits
.global_int_enable_bit_i	(global_int_enable_bit_i	),//zic interrupt enable signal
.global_int_enable_valid_i	(global_int_enable_valid_i	),
.zic_ack_valid_i		(zic_ack_write_valid_i		),//from zic to regfile
.zic_ack_int_id_i		(zic_ack_int_id_i		),//from zic to regfile
.zic_ack_int_id_o		(ack_int_id_w			),//to read mux 
.zic_nxtp_valid_i		(zic_nxtp_valid_i		),//from zic to reg file	
.zic_nxtp_id_i			(zic_nxtp_id_i			),//from zic to reg file
.zic_eoi_valid_i		(zic_eoi_valid_i		),//to reg file
.zic_eoi_id_i			(zic_eoi_id_i			),//to reg file
.zic_eoi_o			(zic_eoi_id_w			),//to read mux 
.zic_cfg_o			(zic_cfg_w			),//to read mux and to zic
.zic_info_o			(zic_info_w			),//to read mux
.zic_nxtp_o			(zic_nxtp_w			),//to read mux
.irq0_ctrl_o 			(irq0_ctrl_w			),//to zic and read mux		
.irq1_ctrl_o 			(irq1_ctrl_w			),//to zic and read mux
.irq2_ctrl_o 			(irq2_ctrl_w			),//to zic and read mux
.irq3_ctrl_o 			(irq3_ctrl_w			),//to zic and read mux
.irq4_ctrl_o 			(irq4_ctrl_w			),//to zic and read mux
.irq5_ctrl_o 			(irq5_ctrl_w			),//to zic and read mux
.irq6_ctrl_o 			(irq6_ctrl_w			),//to zic and read mux
.irq7_ctrl_o 			(irq7_ctrl_w			),//to zic and read mux
.irq8_ctrl_o 			(irq8_ctrl_w			),//to zic and read mux
.irq9_ctrl_o 			(irq9_ctrl_w			),//to zic and read mux
.irq10_ctrl_o			(irq10_ctrl_w			),//to zic and read mux
.irq11_ctrl_o			(irq11_ctrl_w			),//to zic and read mux
.irq12_ctrl_o			(irq12_ctrl_w			),//to zic and read mux
.irq13_ctrl_o			(irq13_ctrl_w			),//to zic and read mux
.irq14_ctrl_o			(irq14_ctrl_w			),//to zic and read mux
.irq15_ctrl_o			(irq15_ctrl_w			),//to zic and read mux
.irq16_ctrl_o			(irq16_ctrl_w			),//to zic and read mux
.irq17_ctrl_o			(irq17_ctrl_w			),//to zic and read mux
.irq18_ctrl_o			(irq18_ctrl_w			),//to zic and read mux
.irq19_ctrl_o			(irq19_ctrl_w			),//to zic and read mux
.irq20_ctrl_o			(irq20_ctrl_w			),//to zic and read mux
.irq21_ctrl_o			(irq21_ctrl_w			),//to zic and read mux
.irq22_ctrl_o			(irq22_ctrl_w			),//to zic and read mux
.irq23_ctrl_o			(irq23_ctrl_w			),//to zic and read mux
.irq24_ctrl_o			(irq24_ctrl_w			),//to zic and read mux
.irq25_ctrl_o			(irq25_ctrl_w			),//to zic and read mux
.irq26_ctrl_o			(irq26_ctrl_w			),//to zic and read mux
.irq27_ctrl_o			(irq27_ctrl_w			),//to zic and read mux
.irq28_ctrl_o			(irq28_ctrl_w			),//to zic and read mux
.irq29_ctrl_o			(irq29_ctrl_w			),//to zic and read mux
.irq30_ctrl_o			(irq30_ctrl_w			),//to zic and read mux
.irq31_ctrl_o			(irq31_ctrl_w			),//to zic and read mux
.irq32_ctrl_o			(irq32_ctrl_w			),//to zic and read mux
.irq33_ctrl_o			(irq33_ctrl_w			),//to zic and read mux
.irq34_ctrl_o			(irq34_ctrl_w			),//to zic and read mux
.irq35_ctrl_o			(irq35_ctrl_w			),//to zic and read mux
.irq36_ctrl_o			(irq36_ctrl_w			),//to zic and read mux
.irq37_ctrl_o			(irq37_ctrl_w			),//to zic and read mux
.irq38_ctrl_o			(irq38_ctrl_w			),//to zic and read mux
.irq39_ctrl_o			(irq39_ctrl_w			),//to zic and read mux
.irq40_ctrl_o			(irq40_ctrl_w			),//to zic and read mux
.irq41_ctrl_o			(irq41_ctrl_w			),//to zic and read mux
.irq42_ctrl_o			(irq42_ctrl_w			),//to zic and read mux
.irq43_ctrl_o			(irq43_ctrl_w			),//to zic and read mux
.irq44_ctrl_o			(irq44_ctrl_w			),//to zic and read mux
.irq45_ctrl_o			(irq45_ctrl_w			),//to zic and read mux
.irq46_ctrl_o			(irq46_ctrl_w			),//to zic and read mux
.irq47_ctrl_o			(irq47_ctrl_w			),
.zic_int_en_o(zic_int_en_o),//to zic
.wdt_counter_o	(wdt_counter_w	),
.wdt_ctrl_o	(wdt_ctrl_w	),
  .wdt_irq_o	(wdt_irq_o	),
  .wdt_timeout_reg_o(wdt_timeout_reg_w),
.debug_mode_valid_i             (debug_mode_valid_w         ),
.debug_mode_reset_i             (dbg_hart_only_rst_w        ),
.debug_ndm_reset_i              (dbg_ndmrst_w               )


);

zic_mmr_op_mux zic_mmr_op_mux_inst
(
.zic_ack_int_id_i	(ack_int_id_w		),	
.zic_eoi_i  		(zic_eoi_id_w		), 
.zic_cfg_i   		(zic_cfg_w		),
.zic_info_i  		(zic_info_w		),
.zic_nxtp_i  		(zic_nxtp_w		),
.irq0_ctrl_i 		(irq0_ctrl_w 		),
.irq1_ctrl_i 		(irq1_ctrl_w 		),
.irq2_ctrl_i 		(irq2_ctrl_w 		),
.irq3_ctrl_i 		(irq3_ctrl_w 		),
.irq4_ctrl_i 		(irq4_ctrl_w 		),
.irq5_ctrl_i 		(irq5_ctrl_w 		),
.irq6_ctrl_i 		(irq6_ctrl_w 		),
.irq7_ctrl_i 		(irq7_ctrl_w 		),
.irq8_ctrl_i 		(irq8_ctrl_w 		),
.irq9_ctrl_i 		(irq9_ctrl_w 		),
.irq10_ctrl_i		(irq10_ctrl_w		),	
.irq11_ctrl_i		(irq11_ctrl_w		),	
.irq12_ctrl_i		(irq12_ctrl_w		),	
.irq13_ctrl_i		(irq13_ctrl_w		),	
.irq14_ctrl_i		(irq14_ctrl_w		),	
.irq15_ctrl_i		(irq15_ctrl_w		),	
.irq16_ctrl_i		(irq16_ctrl_w		),	
.irq17_ctrl_i		(irq17_ctrl_w		),	
.irq18_ctrl_i		(irq18_ctrl_w		),	
.irq19_ctrl_i		(irq19_ctrl_w		),	
.irq20_ctrl_i		(irq20_ctrl_w		),	
.irq21_ctrl_i		(irq21_ctrl_w		),	
.irq22_ctrl_i		(irq22_ctrl_w		),	
.irq23_ctrl_i		(irq23_ctrl_w		),	
.irq24_ctrl_i		(irq24_ctrl_w		),	
.irq25_ctrl_i		(irq25_ctrl_w		),	
.irq26_ctrl_i		(irq26_ctrl_w		),	
.irq27_ctrl_i		(irq27_ctrl_w		),	
.irq28_ctrl_i		(irq28_ctrl_w		),	
.irq29_ctrl_i		(irq29_ctrl_w		),	
.irq30_ctrl_i		(irq30_ctrl_w		),	
.irq31_ctrl_i		(irq31_ctrl_w		),	
.irq32_ctrl_i		(irq32_ctrl_w		),	
.irq33_ctrl_i		(irq33_ctrl_w		),	
.irq34_ctrl_i		(irq34_ctrl_w		),	
.irq35_ctrl_i		(irq35_ctrl_w		),	
.irq36_ctrl_i		(irq36_ctrl_w		),	
.irq37_ctrl_i		(irq37_ctrl_w		),	
.irq38_ctrl_i		(irq38_ctrl_w		),	
.irq39_ctrl_i		(irq39_ctrl_w		),	
.irq40_ctrl_i		(irq40_ctrl_w		),	
.irq41_ctrl_i		(irq41_ctrl_w		),	
.irq42_ctrl_i		(irq42_ctrl_w		),	
.irq43_ctrl_i		(irq43_ctrl_w		),	
.irq44_ctrl_i		(irq44_ctrl_w		),	
.irq45_ctrl_i		(irq45_ctrl_w		),	
.irq46_ctrl_i		(irq46_ctrl_w		),	
.irq47_ctrl_i		(irq47_ctrl_w		),
.zic_mmr_read_en_i	(zic_mmr_read_en_i  	),
.zic_mmr_read_addr_i	(zic_mmr_read_addr_i	),
.zic_ack_read_valid	(zic_ack_read_valid_en	),//from program control (processor core)
.zic_mmr_read_data_o	(zic_mmr_read_data_o	),
.zic_ack_int_id_o	(zic_ack_int_id_o	), //to program control(processor core)
.wdt_counter_i		(wdt_counter_w		),
  .wdt_ctrl_i   		(wdt_ctrl_w		),
  .wdt_timeout_reg_i(wdt_timeout_reg_w)

);
endmodule


