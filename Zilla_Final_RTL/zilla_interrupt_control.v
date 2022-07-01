`define ZILLA_32_BIT 
`timescale 1ns / 1ps
//top module comprises zic and mmr
module zilla_interrupt_control
(
input 		    zic_clk				        ,
input 		    zic_rst				        ,
input 		    zic_mmr_write_en_i		    ,//from core
input 	[15:0]	zic_mmr_write_addr_i	    ,//from core
input 	[31:0]	zic_mmr_write_data_i	    ,//from core
input 		    zic_mmr_read_en_i		    ,//from core
input 	[15:0]	zic_mmr_read_addr_i		    ,//from core
output 	[31:0]	zic_mmr_read_data_o		    ,//to core
input 		    zic_ack_read_valid_en	    ,//ack int id read en from processor
output 	[7:0]	zic_ack_int_id_o		    ,//to processor ack
input 		    zic_eoi_valid_i			    ,//eoi write enable from processor
input   [7:0] 	zic_eoi_id_i			    ,//eoi int id from processor
input 	[7:0] 	active_lvl_pr_i			    ,//from CSR
output 		    interrupt_request_o		    ,//interrupt request signal to core	    
input 	[47:0]	global_int_enable_bit_i	    ,
input  	  	    global_int_enable_valid_i	, //lets make one bit
output [7:0] 	highest_pending_lvl_pr_o	,
input 		    ext_int0_i			        ,	  
input 		    ext_int1_i			        ,	  
input 		    ext_int2_i			        ,	  
input 		    ext_int3_i			        ,	  
input 		    ext_int4_i			        ,	  
input 		    ext_int5_i			        ,	  
input 		    ext_int6_i			        ,	  
input 		    ext_int7_i			        ,	  
input 		    ext_int8_i			        ,	  
input 		    ext_int9_i			        ,	  
input 		    ext_int10_i			        ,	  
input 		    ext_int11_i			        ,	  
input 		    ext_int12_i			        ,	  
input 		    ext_int13_i			        ,	  
input 		    ext_int14_i			        ,	  
input 		    ext_int15_i			        ,	  
input 		    ext_int16_i			        ,	  
input 		    ext_int17_i			        ,	  
input 		    ext_int18_i			        ,	  
input 		    ext_int19_i			        ,	  
input 		    ext_int20_i			        ,	  
input 		    ext_int21_i			        ,	  
input 		    ext_int22_i			        ,	  
input 		    ext_int23_i			        ,	  
input 		    ext_int24_i			        ,	  
input 		    ext_int25_i			        ,	  
input 		    ext_int26_i			        ,	  
input 		    ext_int27_i			        ,	  
input 		    ext_int28_i			        ,	  
input 		    ext_int29_i			        ,	  
input 		    ext_int30_i			        ,	  
input 		    ext_int31_i			        ,	  
input 		    ext_int32_i			        ,	  
input 		    ext_int33_i			        ,	  
input 		    ext_int34_i			        ,	  
input 		    ext_int35_i			        ,	  
input 		    ext_int36_i			        ,	  
input 		    ext_int37_i			        ,	  
input 		    ext_int38_i			        ,	  
input 		    ext_int39_i			        ,	  
input 		    ext_int40_i			        ,	  
input 		    ext_int41_i			        ,	  
input 		    ext_int42_i			        ,	  
input 		    ext_int43_i			        ,	  
input 		    ext_int44_i			        ,	  
input 		    ext_int45_i			        ,	  
input 		    ext_int46_i			        ,
input           debug_mode_valid_i          ,
input           debug_mode_reset_i          ,
input           debug_ndm_reset_i           ,
output          wdt_reset_o             

);

wire		zic_ack_write_valid_w		;
wire [7:0] 	zic_ack_int_id_w		    ;
wire		zic_ack_w			        ;
wire		zic_eoi_w			        ;
wire		zic_nxtp_valid_w		    ;
wire [7:0] 	zic_nxtp_id_w			    ;
wire		zic_int_pending_valid_w		;
wire [47:0] zic_int_pending_bit_w	    ;
wire [7:0] 	irq0_ctrl_w 			    ; 
wire [7:0] 	irq1_ctrl_w 			    ; 
wire [7:0] 	irq2_ctrl_w 			    ; 
wire [7:0] 	irq3_ctrl_w 			    ; 
wire [7:0] 	irq4_ctrl_w 			    ; 
wire [7:0] 	irq5_ctrl_w 			    ; 
wire [7:0] 	irq6_ctrl_w 			    ; 
wire [7:0] 	irq7_ctrl_w 			    ; 
wire [7:0] 	irq8_ctrl_w 			    ; 
wire [7:0] 	irq9_ctrl_w 			    ; 
wire [7:0] 	irq10_ctrl_w			    ; 
wire [7:0] 	irq11_ctrl_w			    ;
wire [7:0] 	irq12_ctrl_w			    ;
wire [7:0] 	irq13_ctrl_w			    ;
wire [7:0] 	irq14_ctrl_w			    ;
wire [7:0] 	irq15_ctrl_w			    ;
wire [7:0] 	irq16_ctrl_w			    ;
wire [7:0] 	irq17_ctrl_w			    ;
wire [7:0] 	irq18_ctrl_w			    ;
wire [7:0] 	irq19_ctrl_w			    ;
wire [7:0] 	irq20_ctrl_w			    ;
wire [7:0] 	irq21_ctrl_w			    ;
wire [7:0] 	irq22_ctrl_w			    ;
wire [7:0] 	irq23_ctrl_w			    ;
wire [7:0] 	irq24_ctrl_w			    ;
wire [7:0] 	irq25_ctrl_w			    ;
wire [7:0] 	irq26_ctrl_w			    ;
wire [7:0] 	irq27_ctrl_w			    ;
wire [7:0] 	irq28_ctrl_w			    ;
wire [7:0] 	irq29_ctrl_w			    ;
wire [7:0] 	irq30_ctrl_w			    ;
wire [7:0] 	irq31_ctrl_w			    ;
wire [7:0] 	irq32_ctrl_w			    ;
wire [7:0] 	irq33_ctrl_w			    ;
wire [7:0] 	irq34_ctrl_w			    ;
wire [7:0] 	irq35_ctrl_w			    ;
wire [7:0] 	irq36_ctrl_w			    ;
wire [7:0] 	irq37_ctrl_w			    ;
wire [7:0] 	irq38_ctrl_w			    ;
wire [7:0] 	irq39_ctrl_w			    ;
wire [7:0] 	irq40_ctrl_w			    ;
wire [7:0] 	irq41_ctrl_w			    ;
wire [7:0] 	irq42_ctrl_w			    ;
wire [7:0] 	irq43_ctrl_w			    ;
wire [7:0] 	irq44_ctrl_w			    ;
wire [7:0] 	irq45_ctrl_w			    ;
wire [7:0] 	irq46_ctrl_w			    ;
wire [7:0] 	irq47_ctrl_w			    ;
wire [47:0] 	zic_int_en_w			;


wire wdt_irq_w;

zic_mmr_top zic_mmr_top_inst
(
.zic_clk			            (zic_clk			        ),//from top module
.zic_rst			            (zic_rst			        ),//from top module
.zic_mmr_write_en_i		        (zic_mmr_write_en_i		    ),//from core
.zic_mmr_write_addr_i		    (zic_mmr_write_addr_i		),//from core
.zic_mmr_write_data_i		    (zic_mmr_write_data_i		),//from core
.zic_mmr_read_en_i		        (zic_mmr_read_en_i		    ),//from core
.zic_mmr_read_addr_i		    (zic_mmr_read_addr_i		),//from core
.zic_mmr_read_data_o		    (zic_mmr_read_data_o		),//to core
.irq0_ctrl_o			        (irq0_ctrl_w 			    ),// [7:0] - zic
.irq1_ctrl_o			        (irq1_ctrl_w 			    ),
.irq2_ctrl_o			        (irq2_ctrl_w 			    ),
.irq3_ctrl_o			        (irq3_ctrl_w 			    ),
.irq4_ctrl_o			        (irq4_ctrl_w 			    ),
.irq5_ctrl_o			        (irq5_ctrl_w 			    ),
.irq6_ctrl_o			        (irq6_ctrl_w 			    ),
.irq7_ctrl_o			        (irq7_ctrl_w 			    ),
.irq8_ctrl_o			        (irq8_ctrl_w 			    ),
.irq9_ctrl_o			        (irq9_ctrl_w 			    ),
.irq10_ctrl_o			        (irq10_ctrl_w			    ),
.irq11_ctrl_o			        (irq11_ctrl_w			    ),
.irq12_ctrl_o			        (irq12_ctrl_w			    ),
.irq13_ctrl_o			        (irq13_ctrl_w			    ),
.irq14_ctrl_o			        (irq14_ctrl_w			    ),
.irq15_ctrl_o			        (irq15_ctrl_w			    ),
.irq16_ctrl_o			        (irq16_ctrl_w			    ),
.irq17_ctrl_o			        (irq17_ctrl_w			    ),
.irq18_ctrl_o			        (irq18_ctrl_w			    ),
.irq19_ctrl_o			        (irq19_ctrl_w			    ),
.irq20_ctrl_o			        (irq20_ctrl_w			    ),
.irq21_ctrl_o			        (irq21_ctrl_w			    ),
.irq22_ctrl_o			        (irq22_ctrl_w			    ),
.irq23_ctrl_o			        (irq23_ctrl_w			    ),
.irq24_ctrl_o			        (irq24_ctrl_w			    ),
.irq25_ctrl_o			        (irq25_ctrl_w			    ),
.irq26_ctrl_o			        (irq26_ctrl_w			    ),
.irq27_ctrl_o			        (irq27_ctrl_w			    ),
.irq28_ctrl_o			        (irq28_ctrl_w			    ),
.irq29_ctrl_o			        (irq29_ctrl_w			    ),
.irq30_ctrl_o			        (irq30_ctrl_w			    ),
.irq31_ctrl_o			        (irq31_ctrl_w			    ),
.irq32_ctrl_o			        (irq32_ctrl_w			    ),
.irq33_ctrl_o			        (irq33_ctrl_w			    ),
.irq34_ctrl_o			        (irq34_ctrl_w			    ),
.irq35_ctrl_o			        (irq35_ctrl_w			    ),
.irq36_ctrl_o			        (irq36_ctrl_w			    ),
.irq37_ctrl_o			        (irq37_ctrl_w			    ),
.irq38_ctrl_o			        (irq38_ctrl_w			    ),
.irq39_ctrl_o			        (irq39_ctrl_w			    ),
.irq40_ctrl_o			        (irq40_ctrl_w			    ),
.irq41_ctrl_o			        (irq41_ctrl_w			    ),
.irq42_ctrl_o			        (irq42_ctrl_w			    ),
.irq43_ctrl_o			        (irq43_ctrl_w			    ),
.irq44_ctrl_o			        (irq44_ctrl_w			    ),
.irq45_ctrl_o			        (irq45_ctrl_w			    ),
.irq46_ctrl_o			        (irq46_ctrl_w			    ),
.irq47_ctrl_o			        (irq47_ctrl_w			    ),
.zic_ack_write_valid_i	        (zic_ack_write_valid_w		),//ack int id write enable from zic
.zic_ack_int_id_i		        (zic_ack_int_id_w		    ),//ack int id from zic
.zic_ack_read_valid_en	        (zic_ack_read_valid_en		),//ack int id read en from processor
.zic_ack_int_id_o		        (zic_ack_int_id_o		    ),//to processor ack
.zic_ack_o			            (zic_ack_w			        ),//acknowledgement signal to zic
.zic_eoi_valid_i		        (zic_eoi_valid_i		    ),//eoi write enable from processor
.zic_eoi_id_i			        (zic_eoi_id_i			    ),//eoi int id from processor
.zic_eoi_o			            (zic_eoi_w			        ),//eoi signal to zic
.zic_nxtp_valid_i		        (zic_nxtp_valid_w		    ),//from zic to reg file
.zic_nxtp_id_i			        (zic_nxtp_id_w   		    ),//from zic to reg file
.zic_int_pending_valid_i        (zic_int_pending_valid_w	),//lets make one bit	
.zic_int_pending_bit_i	        (zic_int_pending_bit_w		),
.global_int_enable_bit_i        (global_int_enable_bit_i	),
.global_int_enable_valid_i	    (global_int_enable_valid_i	), //lets make one bit
.zic_int_en_o			        (zic_int_en_w			    ),
.wdt_irq_o			            (wdt_irq_w                  ),
.debug_mode_valid_i             (debug_mode_valid_i         ),
.debug_mode_reset_i             (dbg_hart_only_rst_i        ),
.debug_ndm_reset_i              (dbg_ndmrst_i               ),
.wdt_reset_o                    (wdt_reset_o                )



);


zic_top zic_top_inst
(
.zic_clk		(zic_clk			),//global clock
.zic_rst		(zic_rst			),//global reset
.wdt_reset_i    (wdt_reset_o        ),
.interrupt_enable_i  	(zic_int_en_w			),//from memory mapped register
.ext_int0_i	        (ext_int0_i	 		),//external interrupt lines 0 to 47
.ext_int1_i	        (ext_int1_i	 		),//from top module
.ext_int2_i	        (ext_int2_i	 		),
.ext_int3_i	        (ext_int3_i	 		),
.ext_int4_i	        (ext_int4_i	 		),
.ext_int5_i	        (ext_int5_i	 		),
.ext_int6_i	        (ext_int6_i	 		),
.ext_int7_i	        (ext_int7_i	 		),
.ext_int8_i	        (ext_int8_i	 		),
.ext_int9_i	        (ext_int9_i	 		),
.ext_int10_i	        (ext_int10_i	 		),
.ext_int11_i	        (ext_int11_i	 		),
.ext_int12_i	        (ext_int12_i	 		),
.ext_int13_i	        (ext_int13_i	 		),
.ext_int14_i	        (ext_int14_i	 		),
.ext_int15_i	        (ext_int15_i	 		),
.ext_int16_i	        (ext_int16_i	 		),
.ext_int17_i	        (ext_int17_i	 		),
.ext_int18_i	        (ext_int18_i	 		),
.ext_int19_i	        (ext_int19_i	 		),
.ext_int20_i	        (ext_int20_i	 		),
.ext_int21_i	        (ext_int21_i	 		),
.ext_int22_i	        (ext_int22_i	 		),
.ext_int23_i	        (ext_int23_i	 		),
.ext_int24_i	        (ext_int24_i	 		),
.ext_int25_i	        (ext_int25_i	 		),
.ext_int26_i	        (ext_int26_i	 		),
.ext_int27_i	        (ext_int27_i	 		),
.ext_int28_i	        (ext_int28_i	 		),
.ext_int29_i	        (ext_int29_i	 		),
.ext_int30_i	        (ext_int30_i	 		),
.ext_int31_i	        (ext_int31_i	 		),
.ext_int32_i	        (ext_int32_i	 		),
.ext_int33_i	        (ext_int33_i	 		),
.ext_int34_i	        (ext_int34_i	 		),
.ext_int35_i	        (ext_int35_i	 		),
.ext_int36_i	        (ext_int36_i	 		),
.ext_int37_i	        (ext_int37_i	 		),
.ext_int38_i	        (ext_int38_i	 		),
.ext_int39_i	        (ext_int39_i	 		),
.ext_int40_i	        (ext_int40_i	 		),
.ext_int41_i	        (ext_int41_i	 		),
.ext_int42_i	        (ext_int42_i	 		),
.ext_int43_i	        (ext_int43_i	 		),
.ext_int44_i	        (ext_int44_i	 		),
.ext_int45_i	        (ext_int45_i	 		),
.ext_int46_i	        (ext_int46_i	 		),
.ext_int47_i	        (wdt_irq_w	 		),
.int0_lp_i	        (irq0_ctrl_w 			),//interrupt level priority value from zic mmr 
.int1_lp_i	        (irq1_ctrl_w 			),//each interrupt has corresponding predefined level-priority value 
.int2_lp_i	        (irq2_ctrl_w 			),//from mmr
.int3_lp_i	        (irq3_ctrl_w 			),
.int4_lp_i	        (irq4_ctrl_w 			),
.int5_lp_i	        (irq5_ctrl_w 			),
.int6_lp_i	        (irq6_ctrl_w 			),
.int7_lp_i	        (irq7_ctrl_w 			),
.int8_lp_i	        (irq8_ctrl_w 			),
.int9_lp_i	        (irq9_ctrl_w 			),
.int10_lp_i	        (irq10_ctrl_w			),
.int11_lp_i	        (irq11_ctrl_w			),
.int12_lp_i	        (irq12_ctrl_w			),
.int13_lp_i	        (irq13_ctrl_w			),
.int14_lp_i	        (irq14_ctrl_w			),
.int15_lp_i	        (irq15_ctrl_w			),
.int16_lp_i	        (irq16_ctrl_w			),
.int17_lp_i	        (irq17_ctrl_w			),
.int18_lp_i	        (irq18_ctrl_w			),
.int19_lp_i	        (irq19_ctrl_w			),
.int20_lp_i	        (irq20_ctrl_w			),
.int21_lp_i	        (irq21_ctrl_w			),
.int22_lp_i	        (irq22_ctrl_w			),
.int23_lp_i	        (irq23_ctrl_w			),
.int24_lp_i	        (irq24_ctrl_w			),
.int25_lp_i	        (irq25_ctrl_w			),
.int26_lp_i	        (irq26_ctrl_w			),
.int27_lp_i	        (irq27_ctrl_w			),
.int28_lp_i	        (irq28_ctrl_w			),
.int29_lp_i	        (irq29_ctrl_w			),
.int30_lp_i	        (irq30_ctrl_w			),
.int31_lp_i	        (irq31_ctrl_w			),
.int32_lp_i	        (irq32_ctrl_w			),
.int33_lp_i	        (irq33_ctrl_w			),
.int34_lp_i	        (irq34_ctrl_w			),
.int35_lp_i	        (irq35_ctrl_w			),
.int36_lp_i	        (irq36_ctrl_w			),
.int37_lp_i	        (irq37_ctrl_w			),
.int38_lp_i	        (irq38_ctrl_w			),
.int39_lp_i	        (irq39_ctrl_w			),
.int40_lp_i	        (irq40_ctrl_w			),
.int41_lp_i	        (irq41_ctrl_w			),
.int42_lp_i	        (irq42_ctrl_w			),
.int43_lp_i	        (irq43_ctrl_w			),
.int44_lp_i	        (irq44_ctrl_w			),
.int45_lp_i	        (irq45_ctrl_w			),
.int46_lp_i	        (irq46_ctrl_w			),
.int47_lp_i	        (irq47_ctrl_w			),
.active_lvl_pr_i	(active_lvl_pr_i		),//active interrupt levl-priority value	
.zic_eoi_valid_i	(zic_eoi_w			),//end of interrupt valid signal from core/zic_mmr
.zic_ack_in          	(zic_ack_w			),//interrupt request acknowledge signal from core/zic_mmr
.zic_ack_id_in       	(zic_ack_int_id_o		),//interrupt id of acknowledged interrupt
.interrupt_request_o	(interrupt_request_o		),//interrupt request signal to core	    		
.interrupt_id_o		(zic_ack_int_id_w		),//interrupt id of requested interrupt   			
.interrupt_id_valid_o	(zic_ack_write_valid_w		),//valid signal for requested interrupt id
.interrupt_pending_o	(zic_int_pending_bit_w		), //interrupt pending signal fr each interrupt line to zic_mmr
.interrupt_pending_valid_o(zic_int_pending_valid_w	),
.zic_nxtp_valid_o	(zic_nxtp_valid_w		),
.zic_nxtp_id_o		(zic_nxtp_id_w    		),
.highest_pending_lvl_pr_o(highest_pending_lvl_pr_o	),
.debug_mode_valid_i             (debug_mode_valid_i                 ),
.debug_mode_reset_i             (dbg_hart_only_rst_i                ),
.debug_ndm_reset_i              (dbg_ndmrst_i                       )


);
endmodule

