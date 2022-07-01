`define ZILLA_32_BIT 
`timescale 1ns / 1ps
//zic top module
module zic_top
(
input 	       		zic_clk		        	,//global clock
input 	       		zic_rst		        	,//global reset
input               wdt_reset_i             ,
input 		[47:0]  interrupt_enable_i  		,//from memory mapped register
input 	       		ext_int0_i	        	,//external interrupt lines 0 to 47
input 	       		ext_int1_i	        	,
input 	       		ext_int2_i	        	,
input 	       		ext_int3_i	        	,
input 	       		ext_int4_i	        	,
input 	       		ext_int5_i	        	,
input 	       		ext_int6_i	        	,
input 	       		ext_int7_i	        	,
input 	       		ext_int8_i	        	,
input 	       		ext_int9_i	        	,
input 	       		ext_int10_i	        	,
input 	       		ext_int11_i	        	,
input 	       		ext_int12_i	        	,
input 	       		ext_int13_i	        	,
input 	       		ext_int14_i	        	,
input 	       		ext_int15_i	        	,
input 	       		ext_int16_i	        	,
input 	       		ext_int17_i	        	,
input 	       		ext_int18_i	        	,
input 	       		ext_int19_i	        	,
input 	       		ext_int20_i	        	,
input 	       		ext_int21_i	        	,
input 	       		ext_int22_i	        	,
input 	       		ext_int23_i	        	,
input 	       		ext_int24_i	        	,
input 	       		ext_int25_i	        	,
input 	       		ext_int26_i	        	,
input 	       		ext_int27_i	        	,
input 	       		ext_int28_i	        	,
input 	       		ext_int29_i	        	,
input 	       		ext_int30_i	        	,
input 	       		ext_int31_i	        	,
input 	       		ext_int32_i	        	,
input 	       		ext_int33_i	        	,
input 	       		ext_int34_i	        	,
input 	       		ext_int35_i	        	,
input 	       		ext_int36_i	        	,
input 	       		ext_int37_i	        	,
input 	       		ext_int38_i	        	,
input 	       		ext_int39_i	        	,
input 	       		ext_int40_i	        	,
input 	       		ext_int41_i	        	,
input 	       		ext_int42_i	        	,
input 	       		ext_int43_i	        	,
input 	       		ext_int44_i	        	,
input 	       		ext_int45_i	        	,
input 	       		ext_int46_i	        	,
input 	       		ext_int47_i	        	,
input 		[7:0] 	int0_lp_i	        	,//interrupt level priority value from zic mmr 
input 		[7:0] 	int1_lp_i	        	,//each interrupt has corresponding predefined level-priority value 
input 		[7:0] 	int2_lp_i	        	,
input 		[7:0] 	int3_lp_i	        	,
input 		[7:0] 	int4_lp_i	        	,
input 		[7:0] 	int5_lp_i	        	,
input 		[7:0] 	int6_lp_i	        	,
input 		[7:0] 	int7_lp_i	        	,
input 		[7:0] 	int8_lp_i	        	,
input 		[7:0] 	int9_lp_i	        	,
input 		[7:0] 	int10_lp_i	        	,
input 		[7:0] 	int11_lp_i	        	,
input 		[7:0] 	int12_lp_i	        	,
input 		[7:0] 	int13_lp_i	        	,
input 		[7:0] 	int14_lp_i	        	,
input 		[7:0] 	int15_lp_i	        	,
input 		[7:0] 	int16_lp_i	        	,
input 		[7:0] 	int17_lp_i	        	,
input 		[7:0] 	int18_lp_i	        	,
input 		[7:0] 	int19_lp_i	        	,
input 		[7:0] 	int20_lp_i	        	,
input 		[7:0] 	int21_lp_i	        	,
input 		[7:0] 	int22_lp_i	        	,
input 		[7:0] 	int23_lp_i	        	,
input 		[7:0] 	int24_lp_i	        	,
input 		[7:0] 	int25_lp_i	        	,
input 		[7:0] 	int26_lp_i	        	,
input 		[7:0] 	int27_lp_i	        	,
input 		[7:0] 	int28_lp_i	        	,
input 		[7:0] 	int29_lp_i	        	,
input 		[7:0] 	int30_lp_i	        	,
input 		[7:0] 	int31_lp_i	        	,
input 		[7:0] 	int32_lp_i	        	,
input 		[7:0] 	int33_lp_i	        	,
input 		[7:0] 	int34_lp_i	        	,
input 		[7:0] 	int35_lp_i	        	,
input 		[7:0] 	int36_lp_i	        	,
input 		[7:0] 	int37_lp_i	        	,
input 		[7:0] 	int38_lp_i	        	,
input 		[7:0] 	int39_lp_i	        	,
input 		[7:0] 	int40_lp_i	        	,
input 		[7:0] 	int41_lp_i	        	,
input 		[7:0] 	int42_lp_i	        	,
input 		[7:0] 	int43_lp_i	        	,
input 		[7:0] 	int44_lp_i	        	,
input 		[7:0] 	int45_lp_i	        	,
input 		[7:0] 	int46_lp_i	        	,
input 		[7:0] 	int47_lp_i	        	,
input 		[7:0] 	active_lvl_pr_i			,//active interrupt levl-priority value	
input 			zic_eoi_valid_i			,//end of interrupt valid signal from core/zic_mmr
input               	zic_ack_in          		,//interrupt request acknowledge signal from core/zic_mmr
input       	[7:0]  	zic_ack_id_in       		,//interrupt id of acknowledged interrupt
output 			interrupt_request_o		,//interrupt request signal to core	    		
output 		[7:0] 	interrupt_id_o			,//interrupt id of requested interrupt   			
output	   		interrupt_id_valid_o		,//valid signal for requested interrupt id
output  	[47:0]  interrupt_pending_o		,//interrupt pending signal fr each interrupt line to zic_mmr
output 			interrupt_pending_valid_o	,
output 			zic_nxtp_valid_o	 	,//from zic to reg file
output 		[7:0] 	highest_pending_lvl_pr_o 	,
output  	[7:0] 	zic_nxtp_id_o			, //from zic to reg file
input           debug_mode_valid_i          ,
input           debug_mode_reset_i          ,
input           debug_ndm_reset_i             





);

wire        [7:0] interrupt_id_w			        ;				
wire        [7:0] highest_pending_lvl_pr_w		    ;	
wire 	          highest_pending_lvl_pr_valid_w	;	
assign highest_pending_lvl_pr_o = highest_pending_lvl_pr_w ;

assign zic_nxtp_valid_o = highest_pending_lvl_pr_valid_w;
assign zic_nxtp_id_o    = interrupt_id_w		;

interrupt_recieve interrupt_recieve_inst
(
.zic_clk		   	            (zic_clk	    		            ),
.zic_rst		   	            (zic_rst	    		            ),
.wdt_reset_i                    (wdt_reset_i                        ),
.ack_in                         (zic_ack_in                         ),
.ack_id                         (zic_ack_id_in                      ),
.interrupt_enable_i 	   	    (interrupt_enable_i 	            ),//from memory mapped register
.interrupt_pending_o	   	    (interrupt_pending_o	            ),//to memoey mapped register and to pr module
.interrupt_pending_valid_o	    (interrupt_pending_valid_o),
.ext_int0_in	   	   	        (ext_int0_i 			            ),//external interrupt lines
.ext_int1_in	   	   	        (ext_int1_i 			            ),
.ext_int2_in	   	   	        (ext_int2_i 			            ),
.ext_int3_in	   	   	        (ext_int3_i 			            ),
.ext_int4_in	   	   	        (ext_int4_i 			            ),
.ext_int5_in	   	   	        (ext_int5_i 			            ),
.ext_int6_in	   	   	        (ext_int6_i 			            ),
.ext_int7_in	   	   	        (ext_int7_i 			            ),
.ext_int8_in	   	   	        (ext_int8_i 			            ),
.ext_int9_in	   	   	        (ext_int9_i 			            ),
.ext_int10_in	   	   	        (ext_int10_i			            ),
.ext_int11_in	   	   	        (ext_int11_i			            ),
.ext_int12_in	   	   	        (ext_int12_i			            ),
.ext_int13_in	   	   	        (ext_int13_i			            ),
.ext_int14_in	   	   	        (ext_int14_i			            ),
.ext_int15_in	   	   	        (ext_int15_i			            ),
.ext_int16_in	   	   	        (ext_int16_i			            ),
.ext_int17_in	   	   	        (ext_int17_i			            ),
.ext_int18_in	   	   	        (ext_int18_i			            ),
.ext_int19_in	   	   	        (ext_int19_i			            ),
.ext_int20_in	   	   	        (ext_int20_i			            ),
.ext_int21_in	   	   	        (ext_int21_i			            ),
.ext_int22_in	   	   	        (ext_int22_i			            ),
.ext_int23_in	   	   	        (ext_int23_i			            ),
.ext_int24_in	   	   	        (ext_int24_i			            ),
.ext_int25_in	   	   	        (ext_int25_i			            ),
.ext_int26_in	   	   	        (ext_int26_i			            ),
.ext_int27_in	   	   	        (ext_int27_i			            ),
.ext_int28_in	   	   	        (ext_int28_i			            ),
.ext_int29_in	   	   	        (ext_int29_i			            ),
.ext_int30_in	   	   	        (ext_int30_i			            ),
.ext_int31_in	   	   	        (ext_int31_i			            ),
.ext_int32_in	   	   	        (ext_int32_i			            ),
.ext_int33_in	   	   	        (ext_int33_i			            ),
.ext_int34_in	   	   	        (ext_int34_i			            ),
.ext_int35_in	   	   	        (ext_int35_i			            ),
.ext_int36_in	   	   	        (ext_int36_i			            ),
.ext_int37_in	   	   	        (ext_int37_i			            ),
.ext_int38_in	   	   	        (ext_int38_i			            ),
.ext_int39_in	   	   	        (ext_int39_i			            ),
.ext_int40_in	   	   	        (ext_int40_i			            ),
.ext_int41_in	   	   	        (ext_int41_i			            ),
.ext_int42_in	   	   	        (ext_int42_i			            ),
.ext_int43_in	   	   	        (ext_int43_i			            ),
.ext_int44_in	   	   	        (ext_int44_i			            ),
.ext_int45_in	   	   	        (ext_int45_i			            ),
.ext_int46_in	   	   	        (ext_int46_i			            ),
.ext_int47_in	 	   	        (ext_int47_i			            ) 
);

priority_resolve priority_resolve_inst
(
.zic_clk			            (zic_clk			                ),
.zic_rst			            (zic_rst			                ),
.wdt_reset_i                    (wdt_reset_i                        ),
.int_pending_i	                (interrupt_pending_o                ),
.int0_lp_i			            (int0_lp_i			                ),//interrupt level priority value
.int1_lp_i			            (int1_lp_i			                ),
.int2_lp_i			            (int2_lp_i			                ),
.int3_lp_i			            (int3_lp_i			                ),
.int4_lp_i			            (int4_lp_i			                ),
.int5_lp_i			            (int5_lp_i			                ),
.int6_lp_i			            (int6_lp_i			                ),
.int7_lp_i			            (int7_lp_i			                ),
.int8_lp_i			            (int8_lp_i			                ),
.int9_lp_i			            (int9_lp_i			                ),
.int10_lp_i			            (int10_lp_i			                ),
.int11_lp_i			            (int11_lp_i			                ),
.int12_lp_i			            (int12_lp_i			                ),
.int13_lp_i			            (int13_lp_i			                ),
.int14_lp_i			            (int14_lp_i			                ),
.int15_lp_i			            (int15_lp_i			                ),
.int16_lp_i			            (int16_lp_i			                ),
.int17_lp_i			            (int17_lp_i			                ),
.int18_lp_i			            (int18_lp_i			                ),
.int19_lp_i			            (int19_lp_i			                ),
.int20_lp_i			            (int20_lp_i			                ),
.int21_lp_i			            (int21_lp_i			                ),
.int22_lp_i			            (int22_lp_i			                ),
.int23_lp_i			            (int23_lp_i			                ),
.int24_lp_i			            (int24_lp_i			                ),
.int25_lp_i			            (int25_lp_i			                ),
.int26_lp_i			            (int26_lp_i			                ),
.int27_lp_i			            (int27_lp_i			                ),
.int28_lp_i			            (int28_lp_i			                ),
.int29_lp_i			            (int29_lp_i			                ),
.int30_lp_i			            (int30_lp_i			                ),
.int31_lp_i			            (int31_lp_i			                ),
.int32_lp_i			            (int32_lp_i			                ),
.int33_lp_i			            (int33_lp_i			                ),
.int34_lp_i			            (int34_lp_i			                ),
.int35_lp_i			            (int35_lp_i			                ),
.int36_lp_i			            (int36_lp_i			                ),
.int37_lp_i			            (int37_lp_i			                ),
.int38_lp_i			            (int38_lp_i			                ),
.int39_lp_i			            (int39_lp_i			                ),
.int40_lp_i			            (int40_lp_i			                ),
.int41_lp_i			            (int41_lp_i			                ),
.int42_lp_i			            (int42_lp_i			                ),
.int43_lp_i			            (int43_lp_i			                ),
.int44_lp_i			            (int44_lp_i			                ),
.int45_lp_i			            (int45_lp_i			                ),
.int46_lp_i			            (int46_lp_i			                ),
.int47_lp_i			            (int47_lp_i			                ),
.interrupt_id_o		            (interrupt_id_w			            ),//interrupt id of highest pending interrupt
.highest_pending_lvl_pr_o	    (highest_pending_lvl_pr_w	        ),//highest level-priority value among pending interrupts
.highest_pending_lvl_pr_valid	(highest_pending_lvl_pr_valid_w	    ) //highest level-priority pending interrupt valid signal

);

zic_irg zic_irg_inst
(
.zic_clk			            (zic_clk			                ),
.zic_rst			            (zic_rst			                ),
.wdt_reset_i                    (wdt_reset_i                        ),
.highest_pending_lvl_pr_i	    (highest_pending_lvl_pr_w	        ),//from zic_pr block
.highest_pending_lvl_pr_valid	(highest_pending_lvl_pr_valid_w	    ),
.active_lvl_pr_i 	    	    (active_lvl_pr_i		            ),//from CSR
.highest_pending_int_id_i		(interrupt_id_w			            ),//from zic_pr
.interrupt_request_o	    	(interrupt_request_o		        ),//to core
.interrupt_id_o		    	    (interrupt_id_o			            ),//to zic_ack_mmr
.interrupt_id_valid_o	    	(interrupt_id_valid_o		        ),//to zic_ack_mmr
.zic_eoi_valid			        (zic_eoi_valid_i		            ), //end of interrupt signal from core
.debug_mode_valid_i             (debug_mode_valid_i                 ),
.debug_mode_reset_i             (dbg_hart_only_rst_i               ),
.debug_ndm_reset_i              (dbg_ndmrst_i                       )

);

endmodule
