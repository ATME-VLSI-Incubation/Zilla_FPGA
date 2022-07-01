`define ZILLA_32_BIT 
`timescale 1ns / 1ps
//zic memory mapped register control
//ctl ie ip attr

module zic_mmr_ctrl
(
input 		zic_clk			,
input 		zic_rst			,
input       wdt_reset_i     ,
input [15:0] 	zic_mmr_write_addr	,
input [31:0] 	zic_mmr_write_data	,
input 	     	zic_mmr_write_en	,
input [47:0] 	zic_int_pending_bit	,
input           zic_int_pending_valid	,
input [47:0]	global_int_enable_bit	,
input           global_int_enable_valid ,
output [47:0] 	zic_int_en_o		,
output [31:0] 	irq0_ctrl_o		,
output [31:0] 	irq1_ctrl_o		,
output [31:0] 	irq2_ctrl_o		,
output [31:0] 	irq3_ctrl_o		,
output [31:0] 	irq4_ctrl_o		,
output [31:0] 	irq5_ctrl_o		,
output [31:0] 	irq6_ctrl_o		,
output [31:0] 	irq7_ctrl_o		,
output [31:0] 	irq8_ctrl_o		,
output [31:0] 	irq9_ctrl_o		,
output [31:0] 	irq10_ctrl_o		,
output [31:0] 	irq11_ctrl_o		,
output [31:0] 	irq12_ctrl_o		,
output [31:0] 	irq13_ctrl_o		,
output [31:0] 	irq14_ctrl_o		,
output [31:0] 	irq15_ctrl_o		,
output [31:0] 	irq16_ctrl_o		,
output [31:0] 	irq17_ctrl_o		,
output [31:0] 	irq18_ctrl_o		,
output [31:0] 	irq19_ctrl_o		,
output [31:0] 	irq20_ctrl_o		,
output [31:0] 	irq21_ctrl_o		,
output [31:0] 	irq22_ctrl_o		,
output [31:0] 	irq23_ctrl_o		,
output [31:0] 	irq24_ctrl_o		,
output [31:0] 	irq25_ctrl_o		,
output [31:0] 	irq26_ctrl_o		,
output [31:0] 	irq27_ctrl_o		,
output [31:0] 	irq28_ctrl_o		,
output [31:0] 	irq29_ctrl_o		,
output [31:0] 	irq30_ctrl_o		,
output [31:0] 	irq31_ctrl_o		,
output [31:0] 	irq32_ctrl_o		,
output [31:0] 	irq33_ctrl_o		,
output [31:0] 	irq34_ctrl_o		,
output [31:0] 	irq35_ctrl_o		,
output [31:0] 	irq36_ctrl_o		,
output [31:0] 	irq37_ctrl_o		,
output [31:0] 	irq38_ctrl_o		,
output [31:0] 	irq39_ctrl_o		,
output [31:0] 	irq40_ctrl_o		,
output [31:0] 	irq41_ctrl_o		,
output [31:0] 	irq42_ctrl_o		,
output [31:0] 	irq43_ctrl_o		,
output [31:0] 	irq44_ctrl_o		,
output [31:0] 	irq45_ctrl_o		,
output [31:0] 	irq46_ctrl_o		,
output [31:0] 	irq47_ctrl_o		
);

	assign zic_int_en_o = {irq47_ctrl_o[8],irq46_ctrl_o[8],irq45_ctrl_o[8],irq44_ctrl_o[8],irq43_ctrl_o[8],irq42_ctrl_o[8],irq41_ctrl_o[8],irq40_ctrl_o[8],irq39_ctrl_o[8],irq38_ctrl_o[8],irq37_ctrl_o[8],irq36_ctrl_o[8],irq35_ctrl_o[8],irq34_ctrl_o[8],irq33_ctrl_o[8],irq32_ctrl_o[8],irq31_ctrl_o[8],irq30_ctrl_o[8],irq29_ctrl_o[8],irq28_ctrl_o[8],irq27_ctrl_o[8],irq26_ctrl_o[8],irq25_ctrl_o[8],irq24_ctrl_o[8],irq23_ctrl_o[8],irq22_ctrl_o[8],irq21_ctrl_o[8],irq20_ctrl_o[8],irq19_ctrl_o[8],irq18_ctrl_o[8],irq17_ctrl_o[8],irq16_ctrl_o[8],irq15_ctrl_o[8],irq14_ctrl_o[8],irq13_ctrl_o[8],irq12_ctrl_o[8],irq11_ctrl_o[8],irq10_ctrl_o[8],irq9_ctrl_o[8],irq8_ctrl_o[8],irq7_ctrl_o[8],irq6_ctrl_o[8],irq5_ctrl_o[8],irq4_ctrl_o[8],irq3_ctrl_o[8],irq2_ctrl_o[8],irq1_ctrl_o[8],irq0_ctrl_o[8]};


irq_ctrl #(	   
	   .MMR_IP_ADDR  (16'h1000), 
	   .MMR_IE_ADDR   (16'h1001),
	   .MMR_ATTR_ADDR (16'h1002),
	   .MMR_CTL_ADDR  (16'h1003),
	   .LVL_PR_VAL    (8'hff)
	  	)
irq_0_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[0]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[0]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq0_ctrl_o			)

);

irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1004), 
	   .MMR_IE_ADDR   (16'h1005),
	   .MMR_ATTR_ADDR (16'h1006),
	   .MMR_CTL_ADDR  (16'h1007),
	   .LVL_PR_VAL    (8'hfb)
	  	)
irq_1_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[1]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[1]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq1_ctrl_o			)

);


irq_ctrl #(	   
       .MMR_IP_ADDR  (16'h1008), 
	   .MMR_IE_ADDR   (16'h1009),
	   .MMR_ATTR_ADDR (16'h100a),
	   .MMR_CTL_ADDR  (16'h100b),
.LVL_PR_VAL    (8'hf7) 
	  	)
irq_2_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[2]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[2]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq2_ctrl_o			)

);

irq_ctrl #(	   
       .MMR_IP_ADDR  (16'h100c), 
	   .MMR_IE_ADDR   (16'h100d),
	   .MMR_ATTR_ADDR (16'h100e),
	   .MMR_CTL_ADDR  (16'h100f),	   
  .LVL_PR_VAL    (8'hf3)

	  	)
irq_3_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[3]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[3]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq3_ctrl_o			)

);

irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1010), 
	   .MMR_IE_ADDR   (16'h1011),
	   .MMR_ATTR_ADDR (16'h1012),
	   .MMR_CTL_ADDR  (16'h1013),
	     .LVL_PR_VAL    (8'hef) 
	  	)
irq_4_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[4]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid	),
.global_int_enable_bit		(global_int_enable_bit[4]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq4_ctrl_o			)

);
irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1014), 
	   .MMR_IE_ADDR   (16'h1015),
	   .MMR_ATTR_ADDR (16'h1016),
	   .MMR_CTL_ADDR  (16'h1017),
	     .LVL_PR_VAL    (8'heb)



	  	)
irq_5_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[5]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[5]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq5_ctrl_o			)

);

irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1018), 
	   .MMR_IE_ADDR   (16'h1019),
	   .MMR_ATTR_ADDR (16'h101a),
	   .MMR_CTL_ADDR  (16'h101b),
	     .LVL_PR_VAL    (8'he7)

	  	)
irq_6_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[6]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[6]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq6_ctrl_o			)

);
irq_ctrl #(
	   .MMR_IP_ADDR  (16'h101c), 
	   .MMR_IE_ADDR   (16'h101d),
	   .MMR_ATTR_ADDR (16'h101e),
	   .MMR_CTL_ADDR  (16'h101f),
	     .LVL_PR_VAL    (8'hdf)

	  	)
irq_7_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[7]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[7]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq7_ctrl_o			)

);
irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1020), 
	   .MMR_IE_ADDR   (16'h1021),
	   .MMR_ATTR_ADDR (16'h1022),
	   .MMR_CTL_ADDR  (16'h1023),
	     .LVL_PR_VAL    (8'hdb)


	  	)
irq_8_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[8]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[8]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq8_ctrl_o			)

);
irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1024), 
	   .MMR_IE_ADDR   (16'h1025),
	   .MMR_ATTR_ADDR (16'h1026),
	   .MMR_CTL_ADDR  (16'h1027),
	    .LVL_PR_VAL    (8'hd7)

	  	)
irq_9_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[9]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[9]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq9_ctrl_o			)

);
irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1028), 
	   .MMR_IE_ADDR   (16'h1029),
	   .MMR_ATTR_ADDR (16'h102a),
	   .MMR_CTL_ADDR  (16'h102b),
	   .LVL_PR_VAL    (8'hd3)

	  	)
irq_10_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[10]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[10]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq10_ctrl_o			)

);
irq_ctrl #(
	   .MMR_IP_ADDR  (16'h102c), 
	   .MMR_IE_ADDR   (16'h102d),
	   .MMR_ATTR_ADDR (16'h102e),
	   .MMR_CTL_ADDR  (16'h102f),
	    .LVL_PR_VAL    (8'hcf)

	  	)
irq_11_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[11]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[11]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq11_ctrl_o			)

);


irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1030), 
	   .MMR_IE_ADDR   (16'h1031),
	   .MMR_ATTR_ADDR (16'h1032),
	   .MMR_CTL_ADDR  (16'h1033),
	   .LVL_PR_VAL    (8'hcb)


	  	)
irq_12_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[12]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[12]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq12_ctrl_o			)

);

irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1034), 
	   .MMR_IE_ADDR   (16'h1035),
	   .MMR_ATTR_ADDR (16'h1036),
	   .MMR_CTL_ADDR  (16'h1037),
	   .LVL_PR_VAL    (8'hc7)


	  	)
irq_13_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[13]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[13]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq13_ctrl_o			)

);

irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1038), 
	   .MMR_IE_ADDR   (16'h1039),
	   .MMR_ATTR_ADDR (16'h103a),
	   .MMR_CTL_ADDR  (16'h103b),
	   .LVL_PR_VAL    (8'hbf)

	  	)
irq_14_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[14]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[14]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq14_ctrl_o			)

);
irq_ctrl #(
	   .MMR_IP_ADDR  (16'h103c), 
	   .MMR_IE_ADDR   (16'h103d),
	   .MMR_ATTR_ADDR (16'h103e),
	   .MMR_CTL_ADDR  (16'h103f),
	   .LVL_PR_VAL    (8'hbb)

	  	)
irq_15_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[15]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[15]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq15_ctrl_o			)

);

irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1040), 
	   .MMR_IE_ADDR   (16'h1041),
	   .MMR_ATTR_ADDR (16'h1042),
	   .MMR_CTL_ADDR  (16'h1043),
	   .LVL_PR_VAL    (8'hb7)

	  	)
irq_16_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[16]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[16]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq16_ctrl_o			)

);
irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1044), 
	   .MMR_IE_ADDR   (16'h1045),
	   .MMR_ATTR_ADDR (16'h1046),
	   .MMR_CTL_ADDR  (16'h1047),
	   .LVL_PR_VAL    (8'hb3)

	  	)
irq_17_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[17]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[17]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq17_ctrl_o			)

);
irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1048), 
	   .MMR_IE_ADDR   (16'h1049),
	   .MMR_ATTR_ADDR (16'h104a),
	   .MMR_CTL_ADDR  (16'h104b),
	   .LVL_PR_VAL    (8'haf)

	  	)
irq_18_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[18]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[18]	),
.global_int_enable_valid 	(global_int_enable_valid	),
	.zic_irq_ctrl_o			(irq18_ctrl_o			)

);
irq_ctrl #(
	   .MMR_IP_ADDR  (16'h104c), 
	   .MMR_IE_ADDR   (16'h104d),
	   .MMR_ATTR_ADDR (16'h104e),
	   .MMR_CTL_ADDR  (16'h104f),
	   .LVL_PR_VAL    (8'hab)

	  	)
irq_19_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[19]	),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[19]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq19_ctrl_o			)

);
irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1050), 
	   .MMR_IE_ADDR   (16'h1051),
	   .MMR_ATTR_ADDR (16'h1052),
	   .MMR_CTL_ADDR  (16'h1053),
	   .LVL_PR_VAL    (8'h9f)


	  	)
irq_20_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[20]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[20]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq20_ctrl_o			)

);
irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1054), 
	   .MMR_IE_ADDR   (16'h1055),
	   .MMR_ATTR_ADDR (16'h1056),
	   .MMR_CTL_ADDR  (16'h1057),
	   .LVL_PR_VAL    (8'h9b)


	  	)
irq_21_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[21]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[21]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq21_ctrl_o			)

);


irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1058), 
	   .MMR_IE_ADDR   (16'h1059),
	   .MMR_ATTR_ADDR (16'h105a),
	   .MMR_CTL_ADDR  (16'h105b),
	   .LVL_PR_VAL    (8'h97)


	  	)
irq_22_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[22]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[22]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq22_ctrl_o			)

);

irq_ctrl #(
	   .MMR_IP_ADDR  (16'h105c), 
	   .MMR_IE_ADDR   (16'h105d),
	   .MMR_ATTR_ADDR (16'h105e),
	   .MMR_CTL_ADDR  (16'h105f),
	   .LVL_PR_VAL    (8'h93)


	  	)
irq_23_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[23]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[23]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq23_ctrl_o			)

);

irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1060), 
	   .MMR_IE_ADDR   (16'h1061),
	   .MMR_ATTR_ADDR (16'h1062),
	   .MMR_CTL_ADDR  (16'h1063),
	   .LVL_PR_VAL    (8'h8f)

	  	)
irq_24_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[24]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[24]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq24_ctrl_o			)

);
irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1064), 
	   .MMR_IE_ADDR   (16'h1065),
	   .MMR_ATTR_ADDR (16'h1066),
	   .MMR_CTL_ADDR  (16'h1067),
	   .LVL_PR_VAL    (8'h8b)

	  	)
irq_25_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[25]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[25]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq25_ctrl_o			)

);

irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1068), 
	   .MMR_IE_ADDR   (16'h1069),
	   .MMR_ATTR_ADDR (16'h106a),
	   .MMR_CTL_ADDR  (16'h106b),
	   .LVL_PR_VAL    (8'h87)


	  	)
irq_26_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[26]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[26]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq26_ctrl_o			)

);
irq_ctrl #(
	   .MMR_IP_ADDR  (16'h106c), 
	   .MMR_IE_ADDR   (16'h106d),
	   .MMR_ATTR_ADDR (16'h106e),
	   .MMR_CTL_ADDR  (16'h106f),
	   .LVL_PR_VAL    (8'h7f)


	  	)
irq_27_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[27]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[27]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq27_ctrl_o			)

);
irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1070), 
	   .MMR_IE_ADDR   (16'h1071),
	   .MMR_ATTR_ADDR (16'h1072),
	   .MMR_CTL_ADDR  (16'h1073),
	   .LVL_PR_VAL    (8'h7b)

	  	)
irq_28_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[28]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[28]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq28_ctrl_o			)

);
irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1074), 
	   .MMR_IE_ADDR   (16'h1075),
	   .MMR_ATTR_ADDR (16'h1076),
	   .MMR_CTL_ADDR  (16'h1077),
	   .LVL_PR_VAL    (8'h77)


	  	)
irq_29_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[29]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[29]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq29_ctrl_o			)

);
irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1078), 
	   .MMR_IE_ADDR   (16'h1079),
	   .MMR_ATTR_ADDR (16'h107a),
	   .MMR_CTL_ADDR  (16'h107b),
	   .LVL_PR_VAL    (8'h73)

	  	)
irq_30_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[30]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[30]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq30_ctrl_o			)

);
irq_ctrl #(
	   .MMR_IP_ADDR  (16'h107c), 
	   .MMR_IE_ADDR   (16'h107d),
	   .MMR_ATTR_ADDR (16'h107e),
	   .MMR_CTL_ADDR  (16'h107f),
	   .LVL_PR_VAL    (8'h6f)

	  	)
irq_31_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[31]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[31]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq31_ctrl_o			)

);


irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1080), 
	   .MMR_IE_ADDR   (16'h1081),
	   .MMR_ATTR_ADDR (16'h1082),
	   .MMR_CTL_ADDR  (16'h1083),
	   .LVL_PR_VAL    (8'h6b)

	  	)
irq_32_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[32]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[32]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq32_ctrl_o			)

);

irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1084), 
	   .MMR_IE_ADDR   (16'h1085),
	   .MMR_ATTR_ADDR (16'h1086),
	   .MMR_CTL_ADDR  (16'h1087),
	   .LVL_PR_VAL    (8'h67)


	  	)
irq_33_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[33]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[33]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq33_ctrl_o			)

);

irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1088), 
	   .MMR_IE_ADDR   (16'h1089),
	   .MMR_ATTR_ADDR (16'h108a),
	   .MMR_CTL_ADDR  (16'h108b),
	   .LVL_PR_VAL    (8'h5f)

	  	)
irq_34_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[34]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[34]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq34_ctrl_o			)

);
irq_ctrl #(
	   .MMR_IP_ADDR  (16'h108c), 
	   .MMR_IE_ADDR   (16'h108d),
	   .MMR_ATTR_ADDR (16'h108e),
	   .MMR_CTL_ADDR  (16'h108f),
	   .LVL_PR_VAL    (8'h5b)


	  	)
irq_35_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[35]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[35]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq35_ctrl_o			)

);

irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1090), 
	   .MMR_IE_ADDR   (16'h1091),
	   .MMR_ATTR_ADDR (16'h1092),
	   .MMR_CTL_ADDR  (16'h1093),
	   .LVL_PR_VAL    (8'h57)

	  	)
irq_36_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[36]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[36]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq36_ctrl_o			)

);
irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1094), 
	   .MMR_IE_ADDR   (16'h1095),
	   .MMR_ATTR_ADDR (16'h1096),
	   .MMR_CTL_ADDR  (16'h1097),
	   .LVL_PR_VAL    (8'h53)


	  	)
irq_37_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[37]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[37]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq37_ctrl_o			)

);
irq_ctrl #(
	   .MMR_IP_ADDR  (16'h1098), 
	   .MMR_IE_ADDR   (16'h1099),
	   .MMR_ATTR_ADDR (16'h109a),
	   .MMR_CTL_ADDR  (16'h109b),
	   .LVL_PR_VAL    (8'h4f)

	  	)
irq_38_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[38]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[38]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq38_ctrl_o			)

);
irq_ctrl #(
       .MMR_IP_ADDR  (16'h109c), 
	   .MMR_IE_ADDR   (16'h109d),
	   .MMR_ATTR_ADDR (16'h109e),
	   .MMR_CTL_ADDR  (16'h109f),
	   .LVL_PR_VAL    (8'h4b)

	  	)
irq_39_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[39]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[39]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq39_ctrl_o			)

);
irq_ctrl #(	   
	   .MMR_IP_ADDR  (16'h10a0), 
	   .MMR_IE_ADDR   (16'h10a1),
	   .MMR_ATTR_ADDR (16'h10a2),
	   .MMR_CTL_ADDR  (16'h10a3),
	   .LVL_PR_VAL    (8'h47)


	  	)
irq_40_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[40]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[40]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq40_ctrl_o			)

);
irq_ctrl #(
	   .MMR_IP_ADDR  (16'h10a4), 
	   .MMR_IE_ADDR   (16'h10a5),
	   .MMR_ATTR_ADDR (16'h10a6),
	   .MMR_CTL_ADDR  (16'h10a7),
	   .LVL_PR_VAL    (8'h3f)

	  	)
irq_41_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[41]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[41]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq41_ctrl_o			)

);


irq_ctrl #(
	   .MMR_IP_ADDR  (16'h10a8), 
	   .MMR_IE_ADDR   (16'h10a9),
	   .MMR_ATTR_ADDR (16'h10aa),
	   .MMR_CTL_ADDR  (16'h10ab),
	   .LVL_PR_VAL    (8'h3b)

	  	)
irq_42_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[42]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[42]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq42_ctrl_o			)

);

irq_ctrl #(
	   .MMR_IP_ADDR  (16'h10ac), 
	   .MMR_IE_ADDR   (16'h10ad),
	   .MMR_ATTR_ADDR (16'h10ae),
	   .MMR_CTL_ADDR  (16'h10af),
	   .LVL_PR_VAL    (8'h37)

	  	)
irq_43_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[43]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[43]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq43_ctrl_o			)

);

irq_ctrl #(
   .MMR_IP_ADDR  (16'h10b0), 
	   .MMR_IE_ADDR   (16'h10b1),
	   .MMR_ATTR_ADDR (16'h10b2),
	   .MMR_CTL_ADDR  (16'h10b3),
	   .LVL_PR_VAL    (8'h33)


	  	)
irq_44_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[44]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[44]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq44_ctrl_o			)

);
irq_ctrl #(
		   .MMR_IP_ADDR  (16'h10b4), 
	   .MMR_IE_ADDR   (16'h10b5),
	   .MMR_ATTR_ADDR (16'h10b6),
	   .MMR_CTL_ADDR  (16'h10b7),
	   .LVL_PR_VAL    (8'h2f)


	  	)
irq_45_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[45]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[45]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq45_ctrl_o			)

);

irq_ctrl #(
	   .MMR_IP_ADDR  (16'h10b8), 
	   .MMR_IE_ADDR   (16'h10b9),
	   .MMR_ATTR_ADDR (16'h10ba),
	   .MMR_CTL_ADDR  (16'h10bb),
	   .LVL_PR_VAL    (8'h2b)


	  	)
irq_46_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[46]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[46]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq46_ctrl_o			)

);
irq_ctrl #(
	   .MMR_IP_ADDR  (16'h10bc), 
	   .MMR_IE_ADDR   (16'h10bd),
	   .MMR_ATTR_ADDR (16'h10be),
	   .MMR_CTL_ADDR  (16'h10bf),
	   .LVL_PR_VAL    (8'h27)
	   
	  	)
irq_47_ctrl(
.zic_clk			(zic_clk			),
.zic_rst			(zic_rst			),
.wdt_reset_i        (wdt_reset_i),
.zic_mmr_write_addr		(zic_mmr_write_addr		),
.zic_mmr_write_en		(zic_mmr_write_en		),
.zic_mmr_write_data		(zic_mmr_write_data		),
.zic_int_pending_bit		(zic_int_pending_bit[47]		),
.zic_int_pending_bit_valid 	(zic_int_pending_valid		),
.global_int_enable_bit		(global_int_enable_bit[47]	),
.global_int_enable_valid 	(global_int_enable_valid	),
.zic_irq_ctrl_o			(irq47_ctrl_o			)

);


endmodule

module irq_ctrl #(parameter MMR_CTL_ADDR  = 0,
		  parameter MMR_ATTR_ADDR = 0,
	          parameter MMR_IE_ADDR   = 0,
	          parameter MMR_IP_ADDR  = 0,
		  parameter LVL_PR_VAL	= 0 
	  	)
(
input 		zic_clk				,
input 		zic_rst				,
input       wdt_reset_i         ,
input [15:0] 	zic_mmr_write_addr		,
input 		zic_mmr_write_en		,
input [31:0] 	zic_mmr_write_data		,
input 		zic_int_pending_bit		,
input 		zic_int_pending_bit_valid 	,
input 		global_int_enable_bit		,
input 		global_int_enable_valid 	,
output	[31:0]  zic_irq_ctrl_o			

);

reg [7:0] zic_ie_mmr;
reg [7:0] zic_ip_mmr;
reg [7:0] zic_attr_mmr;
reg [7:0] zic_ctl_mmr;


always@(posedge zic_clk or negedge zic_rst) //ie
begin
	if(!zic_rst)
	begin
		zic_ie_mmr <= 8'd0;
	end
    else if(wdt_reset_i)
    begin
        zic_ie_mmr <= 8'd0;
    end
	else
	begin
		if(zic_mmr_write_en && (zic_mmr_write_addr ==MMR_IE_ADDR))
		begin
			zic_ie_mmr <= {7'd0,zic_mmr_write_data[0]};
		end
		else if(global_int_enable_valid)
		begin
			zic_ie_mmr <= {7'd0,global_int_enable_bit};
		end
	end
end

always@(posedge zic_clk or negedge zic_rst) //ip
begin
		if(!zic_rst)
	begin
		zic_ip_mmr <= 8'd0;
	end
    else if(wdt_reset_i)
    begin
        zic_ip_mmr <= 8'd0;
    end

	else
	begin
		if(zic_mmr_write_en && (zic_mmr_write_addr ==MMR_IP_ADDR))
		begin
			zic_ip_mmr <= {7'd0,zic_mmr_write_data[0]};
		end
		else if(zic_int_pending_bit_valid)
		begin
			zic_ip_mmr <= {7'd0,zic_int_pending_bit};
		end
	end

end

always@(posedge zic_clk or negedge zic_rst) //attr
begin
	if(!zic_rst)
	begin
		zic_attr_mmr <= 8'd0;
	end
        else if(wdt_reset_i)
    begin
        zic_attr_mmr <= 8'd0;
    end

	else
	begin
		zic_attr_mmr <= {2'b11,6'd0};
	end
end

always@(posedge zic_clk or negedge zic_rst) //ctl
begin
	if(!zic_rst)
	begin
		zic_ctl_mmr <= LVL_PR_VAL;
	end
        else if(wdt_reset_i)
    begin
        zic_ctl_mmr <= 8'd0;
    end

	else
	begin
		if(zic_mmr_write_en && (zic_mmr_write_addr == MMR_CTL_ADDR))
		begin
			zic_ctl_mmr <= zic_mmr_write_data[7:0];
		end
	end

end


assign zic_irq_ctrl_o = {zic_ctl_mmr,zic_attr_mmr,zic_ie_mmr,zic_ip_mmr};
endmodule
