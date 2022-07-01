//CSR Register file
//top module where individual csr registers are instantiated
//


module csr_register_file
#(
parameter CSR_ADDR_WIDTH    = 0,
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
input 		                    csr_clk			            ,
input 		                    csr_rst			            ,
input                           wdt_reset_i                 ,
input 		                    csr_write_en		        ,
input  [CSR_ADDR_WIDTH-1:0] 	csr_addr		            ,
input  [DATA_WIDTH-1:0]  	    csr_write_data		        ,
input 		                    csr_set_bit		            ,
input                           mret_valid_i                ,
input 		                    csr_clear_bit		        ,
input 		                    interrupt_valid 	        ,
input  [DATA_WIDTH-1:0]	        interrupt_code		        ,
input 		                    exception_valid 	        ,
input  [DATA_WIDTH-1:0]	        exception_code		        ,
input 		                    ld_sd_misalign_valid        ,
input [DATA_WIDTH-1:0] 	        ld_sd_misalign_addr	        ,
input 		                    instr_misalign_valid        ,
input 			                trap_valid_i		        ,
input 			                stall_valid_i		        ,
input 			                branch_valid_i		        ,
input [DATA_WIDTH-1:0] 	        instr_misalign_addr	        ,
input 		                    mie_set			            ,//interrupt occurs
input 		                    mie_clear		            ,//end of interrupt
input 	[PC_WIDTH-1:0]	        csr_mepc_in			        ,
input 		                    csr_mepc_write_valid        ,
output  [PC_WIDTH-1:0]	        csr_mepc_o			        ,
input 		                    invalid_instr_valid	        ,
input  [INSTRUCTION_WIDTH-1:0]  invalid_instruction	        ,
input [7:0]   	                interrupt_lvl_pr_i	        ,//from zic
output [DATA_WIDTH-1:0] 	    interrupt_active_level_priority_o,
input 		                    exception_id_write_valid_i  ,
input		                    interrupt_id_write_valid_i  ,
input  [PC_WIDTH-1:0]           pc			,
output [DATA_WIDTH-1:0] 	    mvendorid_o		,	
output [DATA_WIDTH-1:0] 	    marchid_o  		,     
output [DATA_WIDTH-1:0] 	    mimpid_o   		,     
output [DATA_WIDTH-1:0] 	    mhartid_o  		,     
output [DATA_WIDTH-1:0] 	    mstatus_o  		,     
output		                    mstatus_mie_o		,
output [DATA_WIDTH-1:0] 	    misa_o	   		,     
output [DATA_WIDTH-1:0] 	    medeleg_o  		,     
output [DATA_WIDTH-1:0] 	    mideleg_o  		,     
output [DATA_WIDTH-1:0] 	    mie_o 	   		,     
output [DATA_WIDTH-1:0] 	    mtvec_o	   		,	
output [DATA_WIDTH-1:0] 	    mcounter_o 		,     
output [DATA_WIDTH-1:0] 	    mscratch_o 		,	
output [DATA_WIDTH-1:0] 	    mepc_o 	   		,
output [DATA_WIDTH-1:0] 	    mcause_o   		,	
output [DATA_WIDTH-1:0] 	    mtval_o    		,	
output [DATA_WIDTH-1:0] 	    mip_o 			,
output [DATA_WIDTH-1:0]         mcounter_inhibit_o 	,		
output [DATA_WIDTH-1:0]         mcycle_o			,
output [DATA_WIDTH-1:0]         minstret_o		,
output [DATA_WIDTH-1:0]         zic_base_addr_o		,
output [DATA_WIDTH-1:0]         mhpm_counter3_o 		, 
output [DATA_WIDTH-1:0]         mhpm_counter4_o 		, 
output [DATA_WIDTH-1:0]         mhpm_counter5_o 		, 
output [DATA_WIDTH-1:0]         mhpm_counter6_o 		, 
output [DATA_WIDTH-1:0]         mhpm_counter7_o 		, 
output [DATA_WIDTH-1:0]         mhpm_counter8_o 		, 
output [DATA_WIDTH-1:0]         mhpm_counter9_o 		, 
output [DATA_WIDTH-1:0]         mhpm_counter10_o 		, 
output [DATA_WIDTH-1:0]         mhpm_counter11_o		,
output [DATA_WIDTH-1:0]         mhpm_counter12_o		,
output [DATA_WIDTH-1:0]         mhpm_counter13_o		,
output [DATA_WIDTH-1:0]         mhpm_counter14_o		,
output [DATA_WIDTH-1:0]         mhpm_counter15_o		,
output [DATA_WIDTH-1:0]   mhpm_counter16_o		,
output [DATA_WIDTH-1:0]   mhpm_counter17_o		,
output [DATA_WIDTH-1:0]   mhpm_counter18_o		,
output [DATA_WIDTH-1:0]   mhpm_counter19_o		,
output [DATA_WIDTH-1:0]   mhpm_counter20_o		,
output [DATA_WIDTH-1:0]   mhpm_counter21_o		,
output [DATA_WIDTH-1:0]   mhpm_counter22_o		,
output [DATA_WIDTH-1:0]   mhpm_counter23_o		,
output [DATA_WIDTH-1:0]   mhpm_counter24_o		,
output [DATA_WIDTH-1:0]   mhpm_counter25_o		,
output [DATA_WIDTH-1:0]   mhpm_counter26_o		,
output [DATA_WIDTH-1:0]   mhpm_counter27_o		,
output [DATA_WIDTH-1:0]   mhpm_counter28_o		,
output [DATA_WIDTH-1:0]   mhpm_counter29_o		,
output [DATA_WIDTH-1:0]   mhpm_counter30_o		,
output [DATA_WIDTH-1:0]   mhpm_counter31_o	    ,
output [DATA_WIDTH-1:0] mhpm_event3_o ,     
output [DATA_WIDTH-1:0] mhpm_event4_o ,
output [DATA_WIDTH-1:0] mhpm_event5_o ,
output [DATA_WIDTH-1:0] mhpm_event6_o ,
output [DATA_WIDTH-1:0] mhpm_event7_o ,
output [DATA_WIDTH-1:0] mhpm_event8_o ,
output [DATA_WIDTH-1:0] mhpm_event9_o ,
output [DATA_WIDTH-1:0] mhpm_event10_o,
output [DATA_WIDTH-1:0] mhpm_event11_o,
output [DATA_WIDTH-1:0] mhpm_event12_o,
output [DATA_WIDTH-1:0] mhpm_event13_o,
output [DATA_WIDTH-1:0] mhpm_event14_o,
output [DATA_WIDTH-1:0] mhpm_event15_o,
output [DATA_WIDTH-1:0] mhpm_event16_o,
output [DATA_WIDTH-1:0] mhpm_event17_o,
output [DATA_WIDTH-1:0] mhpm_event18_o,
output [DATA_WIDTH-1:0] mhpm_event19_o,
output [DATA_WIDTH-1:0] mhpm_event20_o,
output [DATA_WIDTH-1:0] mhpm_event21_o,
output [DATA_WIDTH-1:0] mhpm_event22_o,
output [DATA_WIDTH-1:0] mhpm_event23_o,
output [DATA_WIDTH-1:0] mhpm_event24_o,
output [DATA_WIDTH-1:0] mhpm_event25_o,
output [DATA_WIDTH-1:0] mhpm_event26_o,
output [DATA_WIDTH-1:0] mhpm_event27_o,
output [DATA_WIDTH-1:0] mhpm_event28_o,
output [DATA_WIDTH-1:0] mhpm_event29_o,
output [DATA_WIDTH-1:0] mhpm_event30_o,
output [DATA_WIDTH-1:0] mhpm_event31_o,
output [DATA_WIDTH-1:0] data_mem_max_addr_o,
input           ebreak_valid_i          ,
input           trigger_valid_i         ,
input           haltreq_valid_i         ,
input           single_step_valid_i     ,
input           reset_haltreq_valid_i   ,
output [DATA_WIDTH-1:0]   dcsr_o                  ,
output [PC_WIDTH-1:0]   dpc_o                   ,

input           dbg_csr_write_en_i      ,
input [CSR_ADDR_WIDTH-1:0]    dbg_csr_addr_i          ,
input [DATA_WIDTH-1:0]    dbg_csr_write_data_i    ,
input           debug_mode_valid_i      ,
input           dbg_ndm_reset_i         ,
input           dbg_hart_reset_i       ,
input    [PC_WIDTH-1:0]  branch_pc_i      



);
wire int_exp_valid_w;
assign int_exp_valid_w = interrupt_valid | exception_valid ;
wire [7:0]mintststus_w;
wire [7:0] prv_int_lvl_pr_w ;

march_csr 
#(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)

march_csr_inst
(
.csr_clk		(csr_clk		),
.csr_rst		(csr_rst		),
.wdt_reset_i    (wdt_reset_i    ),
.march_id_o		(marchid_o		)
);

misa_csr #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
misa_csr_inst
(
.csr_clk		(csr_clk		),
.csr_rst		(csr_rst		),
.wdt_reset_i    (wdt_reset_i    ),
.misa_csr_o		(misa_o			)
);

mvendorid_csr #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
mvendorid_csr_inst
(
.csr_clk		(csr_clk		),
.csr_rst		(csr_rst		),
.wdt_reset_i    (wdt_reset_i    ),
.mvendor_id_o		(mvendorid_o		) 
);

mimpid_csr #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
mimpid_csr_inst
(
.csr_clk		(csr_clk		),
.csr_rst		(csr_rst		),
.wdt_reset_i    (wdt_reset_i    ),
.mimp_id_o 		(mimpid_o		)
);

mhardid_csr #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
mhardid_csr_inst
(
.csr_clk		(csr_clk		),
.csr_rst		(csr_rst		),
.wdt_reset_i    (wdt_reset_i    ),
.mhart_id_o		(mhartid_o		) 
);

mstatus_csr #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
mstatus_csr_inst
(
.csr_clk		         (csr_clk		        ),
.csr_rst		         (csr_rst		        ),
.wdt_reset_i    (wdt_reset_i    ),
.csr_write_data		     (csr_write_data		),
.csr_write_enable	     (csr_write_en	        ),
.csr_write_addr		     (csr_addr		        ),
.csr_set_bit		     (csr_set_bit  		    ),
.csr_clear_bit		     (csr_clear_bit		    ),
.mie_set		         (mie_set		        ),//interrupt occurence
.mie_clear		         (mie_clear		        ),//end of interrupt
.mstatus_o 		         (mstatus_o		        ),
.mstatus_mie_o		     (mstatus_mie_o		    ),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);

mscratch_csr #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
mscratch_csr_inst
(
.csr_clk		(csr_clk		),
.csr_rst		(csr_rst		),
.wdt_reset_i    (wdt_reset_i    ),
.csr_write_data		(csr_write_data		),
.csr_write_enable	(csr_write_en	),
.csr_write_addr		(csr_addr		),
.csr_set_bit		(csr_set_bit  		),
.csr_clear_bit		(csr_clear_bit		),
.mscratch_o 		(mscratch_o		),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);

mcause_csr #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
mcause_csr_inst
(
.csr_clk		(csr_clk		),
.csr_rst		(csr_rst		),
.wdt_reset_i    (wdt_reset_i    ),
.csr_write_data		(csr_write_data		),
.csr_write_en		(csr_write_en		),
.csr_write_addr		(csr_addr		),
.interrupt_valid	(interrupt_valid	),
.csr_set_bit 		(csr_set_bit		),
.csr_clear_bit		(csr_clear_bit		),
.exception_valid	(exception_valid	),
.exception_code		(exception_code		),
.interrupt_code		(interrupt_code		),
.mcause_o   		(mcause_o		),
.exception_id_write_valid_i(exception_id_write_valid_i),
.interrupt_id_write_valid_i(interrupt_id_write_valid_i),
.mintstatus_i       	(mintststus_w       	),
.prv_int_lvl_pr_o   	(prv_int_lvl_pr_w   	),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )




);

mtval_csr #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
mtval_csr_inst
(
.csr_clk		(csr_clk		),
.csr_rst		(csr_rst		),
.wdt_reset_i    (wdt_reset_i    ),
.csr_write_data		(csr_write_data		),
.csr_write_en		(csr_write_en		),
.csr_write_addr		(csr_addr		),
.ld_sd_misalign_valid	(ld_sd_misalign_valid	),	
.ld_sd_misalign_addr 	(ld_sd_misalign_addr 	),   
.instr_misalign_valid	(instr_misalign_valid	),	
.instr_misalign_addr 	(instr_misalign_addr 	),   
.illegal_instr_valid	(invalid_instr_valid	),
.illegal_instruction 	(invalid_instruction	),	
.trap_valid		(exception_valid	),//exceptions
.mtval_o  		(mtval_o		) ,
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )



);

mip_csr #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
mip_csr_inst
(
.csr_clk		(csr_clk		),
.csr_rst		(csr_rst		),
.wdt_reset_i    (wdt_reset_i    ),
.csr_write_data		(csr_write_data		),
.csr_write_enable	(csr_write_en		),
.csr_write_addr		(csr_addr		),
.csr_set_bit		(csr_set_bit  		),
.csr_clear_bit		(csr_clear_bit		),
.mip_o 			(mip_o			),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);

mie_csr #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
mie_csr_inst
(
.csr_clk		(csr_clk		),
.csr_rst		(csr_rst		),
.wdt_reset_i    (wdt_reset_i    ),
.csr_write_data		(csr_write_data		),
.csr_write_enable	(csr_write_en	),
.csr_write_addr		(csr_addr		),
.csr_set_bit		(csr_set_bit  		),
.csr_clear_bit		(csr_clear_bit		),
.mie_o 			(mie_o			),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);

mepc_csr #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
mepc_csr_inst
(
.csr_clk		(csr_clk		),
.csr_rst		(csr_rst		),
.wdt_reset_i    (wdt_reset_i    ),
.csr_write_data		(csr_write_data		),
.csr_write_en		(csr_write_en		),
.csr_write_addr		(csr_addr		),
.int_exp_valid		(int_exp_valid_w	),
.instr_misalign_valid	(instr_misalign_valid	),
.pc			(pc			),
.csr_mepc_in		(csr_mepc_in		),
.csr_mepc_write_valid	(csr_mepc_write_valid	),
.csr_mepc_o		(csr_mepc_o		),	
.mepc_csr_o   		(mepc_o			),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);

mtvec_csr #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
mtvec_csr_inst
(
.csr_clk		(csr_clk),
.csr_rst		(csr_rst),
.wdt_reset_i    (wdt_reset_i    ),
.csr_write_data		(csr_write_data		),
.csr_write_enable	(csr_write_en	),
.csr_write_addr		(csr_addr		),
.csr_set_bit		(csr_set_bit  ),
.csr_clear_bit		(csr_clear_bit),
.mtvec_o 		(mtvec_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);

mcounter_inhibit_csr #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
mcounter_inhibit_csr_inst
(
.csr_clk			(csr_clk		),
.csr_rst			(csr_rst		),
.wdt_reset_i    (wdt_reset_i    ),
.csr_write_enable		(csr_write_en		),
.csr_set_bit			(csr_set_bit		),
.csr_clear_bit			(csr_clear_bit		),
.csr_write_addr			(csr_addr		),
.csr_write_data			(csr_write_data		),
.mcounter_inhibit_o		(mcounter_inhibit_o	),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);

mhpm_counter_top #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
mhpm_counter_inst
(
.csr_clk				(csr_clk		),
.csr_rst				(csr_rst		),
.wdt_reset_i    (wdt_reset_i    ),
.csr_write_enable			(csr_write_en	),
.csr_write_addr				(csr_addr		),
.csr_write_data				(csr_write_data		),
.mhpm_counter_csr_inhibit_bit		(mcounter_inhibit_o	),
.mhpm_counter3_o			(mhpm_counter3_o 		),
.mhpm_counter4_o			(mhpm_counter4_o		),
.mhpm_counter5_o			(mhpm_counter5_o		),
.mhpm_counter6_o			(mhpm_counter6_o		),
.mhpm_counter7_o			(mhpm_counter7_o		),
.mhpm_counter8_o			(mhpm_counter8_o		),
.mhpm_counter9_o			(mhpm_counter9_o		),
.mhpm_counter10_o			(mhpm_counter10_o		),
.mhpm_counter11_o			(mhpm_counter11_o		),
.mhpm_counter12_o			(mhpm_counter12_o		),
.mhpm_counter13_o			(mhpm_counter13_o		),
.mhpm_counter14_o			(mhpm_counter14_o		),
.mhpm_counter15_o			(mhpm_counter15_o		),
.mhpm_counter16_o			(mhpm_counter16_o		),
.mhpm_counter17_o			(mhpm_counter17_o		),
.mhpm_counter18_o			(mhpm_counter18_o		),
.mhpm_counter19_o			(mhpm_counter19_o		),
.mhpm_counter20_o			(mhpm_counter20_o		),
.mhpm_counter21_o			(mhpm_counter21_o		),
.mhpm_counter22_o			(mhpm_counter22_o		),
.mhpm_counter23_o			(mhpm_counter23_o		),
.mhpm_counter24_o			(mhpm_counter24_o		),
.mhpm_counter25_o			(mhpm_counter25_o		),
.mhpm_counter26_o			(mhpm_counter26_o		),
.mhpm_counter27_o			(mhpm_counter27_o		),
.mhpm_counter28_o			(mhpm_counter28_o		),
.mhpm_counter29_o			(mhpm_counter29_o		),
.mhpm_counter30_o			(mhpm_counter30_o		),
.mhpm_counter31_o			(mhpm_counter31_o		),
.mhpm_event3_o              (mhpm_event3_o ),     
.mhpm_event4_o              (mhpm_event4_o ),
.mhpm_event5_o              (mhpm_event5_o ),
.mhpm_event6_o              (mhpm_event6_o ),
.mhpm_event7_o              (mhpm_event7_o ),
.mhpm_event8_o              (mhpm_event8_o ),
.mhpm_event9_o              (mhpm_event9_o ),
.mhpm_event10_o             (mhpm_event10_o),
.mhpm_event11_o             (mhpm_event11_o),
.mhpm_event12_o             (mhpm_event12_o),
.mhpm_event13_o             (mhpm_event13_o),
.mhpm_event14_o             (mhpm_event14_o),
.mhpm_event15_o             (mhpm_event15_o),
.mhpm_event16_o             (mhpm_event16_o),
.mhpm_event17_o             (mhpm_event17_o),
.mhpm_event18_o             (mhpm_event18_o),
.mhpm_event19_o             (mhpm_event19_o),
.mhpm_event20_o             (mhpm_event20_o),
.mhpm_event21_o             (mhpm_event21_o),
.mhpm_event22_o             (mhpm_event22_o),
.mhpm_event23_o             (mhpm_event23_o),
.mhpm_event24_o             (mhpm_event24_o),
.mhpm_event25_o             (mhpm_event25_o),
.mhpm_event26_o             (mhpm_event26_o),
.mhpm_event27_o             (mhpm_event27_o),
.mhpm_event28_o             (mhpm_event28_o),
.mhpm_event29_o             (mhpm_event29_o),
.mhpm_event30_o             (mhpm_event30_o),
.mhpm_event31_o             (mhpm_event31_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )





);

mcycle_csr #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
mcycle_csr_inst
(
.csr_clk			(csr_clk		),
.csr_rst			(csr_rst		),
.wdt_reset_i    (wdt_reset_i    ),
.csr_write_enable		(csr_write_en	),
.csr_write_addr			(csr_addr		),
.csr_write_data			(csr_write_data		),
.mcycle_csr_inhibit_bit		(mcounter_inhibit_o	),
.mcycle_o			(mcycle_o			),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);

minstret_csr #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
minstret_csr_inst
(
.csr_clk			(csr_clk		),
.csr_rst			(csr_rst		),
.wdt_reset_i    (wdt_reset_i    ),
.csr_write_enable		(csr_write_en	),
.csr_write_addr			(csr_addr		),
.csr_write_data			(csr_write_data		),
.minstret_csr_inhibit_bit	(mcounter_inhibit_o	),
.minstret_o			(minstret_o		),
.trap_valid_i	(trap_valid_i  ),
.stall_valid_i	(stall_valid_i ),
.branch_valid_i	(branch_valid_i),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )



);

mintstatus_csr #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
mintstatus_csr_inst
(
.csr_clk					(csr_clk		),
.csr_rst					(csr_rst		),
.wdt_reset_i    (wdt_reset_i    ),
.interrupt_valid_i				(interrupt_valid	),
.exception_valid_i              (exception_valid),
.mret_valid_i					(mret_valid_i		),
.interrupt_active_level_priority_i		(interrupt_lvl_pr_i	),
.interrupt_active_level_priority_o		(interrupt_active_level_priority_o)	,
.mintstatus_o           (mintststus_w),
.prv_int_lvl_pr_i        (prv_int_lvl_pr_w),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


zic_base_csr #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
zic_base_csr_inst
(
.csr_clk			(csr_clk		),
.csr_rst			(csr_rst		),
.wdt_reset_i    (wdt_reset_i    ),
.csr_write_enable		(csr_write_en		),
.csr_write_addr			(csr_addr		),
.csr_write_data			(csr_write_data		),
.zic_base_addr_o		(zic_base_addr_o	),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);

data_mem_max_addr #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
data_mem_max_addr_inst
(
.csr_clk		(csr_clk	    ),
.csr_rst		(csr_rst	    ),
.wdt_reset_i    (wdt_reset_i    ),
.write_enable		(csr_write_en	    ),
.csr_write_addr		(csr_addr	    ),
.csr_write_data		(csr_write_data	    ),
	.data_mem_max_addr_o	(data_mem_max_addr_o),
    .dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);
                   
dcsr #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
dcsr_inst
(
.dcsr_clk_i              (csr_clk              ),
.dcsr_rst_i              (csr_rst              ),
.wdt_reset_i    (wdt_reset_i    ),
.dcsr_write_data_i       (csr_write_data       ),
.dcsr_addr_i             (csr_addr             ),
.dcsr_write_en_i         (csr_write_en         ),
.dcsr_set_en_i           (csr_set_bit          ),
.dcsr_clear_en_i         (csr_clear_bit        ),
.ebreak_valid_i          (ebreak_valid_i       ),
.trigger_valid_i         (trigger_valid_i      ),
.haltreq_valid_i         (haltreq_valid_i      ),
.single_step_valid_i     (single_step_valid_i  ),
.reset_haltreq_valid_i   (reset_haltreq_valid_i),
.dcsr_o                  (dcsr_o               ),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);

dpc #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
dpc_inst
(
.dpc_clk_i             (csr_clk             ),
.dpc_rst_i             (csr_rst             ),
.wdt_reset_i    (wdt_reset_i    ),
.dpc_write_en_i        (csr_write_en        ),
.dpc_set_en_i          (csr_set_bit         ),
.dpc_clear_en_i        (csr_clear_bit       ),
.dpc_addr_i            (csr_addr            ),
.dpc_write_data_i      (csr_write_data      ),
.ebreak_valid_i        (ebreak_valid_i      ),
.trigger_valid_i       (trigger_valid_i     ),
.single_step_valid_i   (single_step_valid_i ),
.haltreq_valid_i       (haltreq_valid_i     ),
.pc_i                  (pc                  ),
.dpc_o                 (dpc_o               ),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      ),
.branch_valid_i    (branch_valid_i), 
.branch_pc_i       (branch_pc_i) ,
.stall_valid_i      (stall_valid_i)


);


endmodule

module data_mem_max_addr
#(
parameter CSR_ADDR_WIDTH    = 0,
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
input 		csr_clk			,
input 		csr_rst			,
input       wdt_reset_i     ,
input 		write_enable		,
input [CSR_ADDR_WIDTH-1:0] 	csr_write_addr		,
input [DATA_WIDTH-1:0] 	csr_write_data		,
output reg 	[DATA_WIDTH-1:0] data_mem_max_addr_o,
input           dbg_csr_write_en_i      ,
input [CSR_ADDR_WIDTH-1:0]    dbg_csr_addr_i          ,
input [DATA_WIDTH-1:0]    dbg_csr_write_data_i    ,
input           debug_mode_valid_i      ,
input           dbg_ndm_reset_i         ,
input           dbg_hart_reset_i                  

);

localparam DATA_MEM_CSR_ADDR = 12'hFC1;

always@(posedge csr_clk or negedge csr_rst )
begin
	if(!csr_rst )
	begin
		data_mem_max_addr_o <= {{DATA_WIDTH-20{1'b0}},20'h4C000};//87fff{{DATA_WIDTH-20{1'b0}},20'h3ffff}
	end
    else if(dbg_ndm_reset_i | dbg_hart_reset_i | wdt_reset_i)
    begin
        		data_mem_max_addr_o <= {{DATA_WIDTH-20{1'b0}},20'h4C000};
    end
	else
	begin
        if(dbg_csr_write_en_i && debug_mode_valid_i && (dbg_csr_addr_i == DATA_MEM_CSR_ADDR) )
        begin
                data_mem_max_addr_o <= dbg_csr_write_data_i;
        end
		else if(write_enable && (csr_write_addr == DATA_MEM_CSR_ADDR))
		begin
		data_mem_max_addr_o <= csr_write_data;
		end
	end

end
endmodule

module zic_base_csr
#(
parameter CSR_ADDR_WIDTH    = 0,
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
input 			csr_clk				,
input 			csr_rst				,
input wdt_reset_i,
input 			csr_write_enable		,
input 	   [CSR_ADDR_WIDTH-1:0] 	csr_write_addr			,
input      [DATA_WIDTH-1:0] 	csr_write_data			,
output reg [DATA_WIDTH-1:0] 	zic_base_addr_o		,
input           dbg_csr_write_en_i      ,
input [CSR_ADDR_WIDTH-1:0]    dbg_csr_addr_i          ,
input [DATA_WIDTH-1:0]    dbg_csr_write_data_i    ,
input           debug_mode_valid_i      ,
input           dbg_ndm_reset_i         ,
input           dbg_hart_reset_i                  

);
localparam ZIC_BASE = {{DATA_WIDTH-8{1'b0}},8'b00011000};//{{DATA_WIDTH-8{1'b0}},8'b00011000}
localparam ZIC_BASE_ADDR = 12'hbc0;
always@(posedge csr_clk or negedge csr_rst )
begin
	if(!csr_rst )
	begin
		zic_base_addr_o <= ZIC_BASE;
	end
    else if(dbg_ndm_reset_i | dbg_hart_reset_i |wdt_reset_i)
    begin
        		zic_base_addr_o <= ZIC_BASE;
    end
	else
	begin
        if(dbg_csr_write_en_i && debug_mode_valid_i && (dbg_csr_addr_i == ZIC_BASE_ADDR) )
        begin
                zic_base_addr_o <= dbg_csr_write_data_i;
        end
		else if(csr_write_enable && (csr_write_addr == ZIC_BASE_ADDR))
		begin
			zic_base_addr_o <= csr_write_data;
		end
	end
end
endmodule

module mintstatus_csr//addr = 0xFC0
#(
parameter CSR_ADDR_WIDTH    = 0,
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
input 		csr_clk					,
input 		csr_rst					,
input       wdt_reset_i ,
input 		interrupt_valid_i			,
input       exception_valid_i       ,
input 		mret_valid_i				,
input [7:0] prv_int_lvl_pr_i ,
input [7:0] 	interrupt_active_level_priority_i	,
output[DATA_WIDTH-1:0] 	interrupt_active_level_priority_o	,
output reg [7:0] mintstatus_o       ,
input           dbg_csr_write_en_i      ,
input [CSR_ADDR_WIDTH-1:0]    dbg_csr_addr_i          ,
input [DATA_WIDTH-1:0]    dbg_csr_write_data_i    ,
input           debug_mode_valid_i      ,
input           dbg_ndm_reset_i         ,
input           dbg_hart_reset_i                  

);

wire [7:0] din;
wire [7:0] dout;
assign din = interrupt_active_level_priority_i;

reg [7:0] fifo [6:0];
reg [2:0] ptr;
reg [2:0] trap_entry_cnt;
reg [2:0] trap_exit_cnt;

always@(posedge csr_clk or negedge csr_rst )
begin
	if(!csr_rst )
    begin
        mintstatus_o <= 8'd0 ;
    end
    else if(dbg_ndm_reset_i | dbg_hart_reset_i |wdt_reset_i)
    begin
                mintstatus_o <= 8'd0 ;

    end

    else
    begin
        if(dbg_csr_write_en_i && debug_mode_valid_i && (dbg_csr_addr_i == 0) )
        begin
                mintstatus_o <= dbg_csr_write_data_i;
        end
		else if (exception_valid_i)
        begin
        mintstatus_o <= 8'hff;
        end
        else if(interrupt_valid_i)
        begin
            mintstatus_o <= din ;
        end
        else if(mret_valid_i)
        begin
            mintstatus_o <= prv_int_lvl_pr_i ;//from mcause
        end
    end
end
/*
always@(posedge csr_clk or negedge csr_rst)
begin
	if(!csr_rst)
	begin
		ptr <= 3'd0;
		trap_entry_cnt <= 3'd0;
		trap_exit_cnt <= 3'd0;
	end
	else
	begin
	        if((trap_entry_cnt == trap_exit_cnt) & (trap_entry_cnt != 0))
				begin
				trap_entry_cnt <= 0;
				trap_exit_cnt <= 0;
		     end 
			else if(interrupt_valid_i & (!exception_valid_i))
			begin
				ptr 	  <= ptr+3'd1;
				fifo[ptr] <= din;
				trap_entry_cnt <= trap_entry_cnt + 1 ;
			
			end
			else if(exception_valid_i)
			begin
			ptr <= ptr+3'd1;
			fifo[ptr] <= 8'hff;
			trap_entry_cnt <= trap_entry_cnt + 1 ;
			end
			else if(mret_valid_i)
			begin
				ptr	    <= ptr - 3'd1 ;
				//fifo[ptr-1] <= 8'd0;
				trap_exit_cnt <= trap_exit_cnt + 1;
	
			end
	end
end

//assign dout =(mret_valid_i) ? fifo[ptr] : 0;
assign dout = (trap_entry_cnt != trap_exit_cnt ) ? fifo[ptr-1] : 0 ; */
	assign interrupt_active_level_priority_o = mintstatus_o ;
endmodule

////////////////////////////////////////////////////////////
//minstret csr
//counts the number of indtructions HART has retitred
////////////////////////////////////////////////////////////
module minstret_csr
#(
parameter CSR_ADDR_WIDTH    = 0,
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
input 			csr_clk				,
input 			csr_rst				,
input wdt_reset_i,
input 			csr_write_enable		,
input 	   [CSR_ADDR_WIDTH-1:0] 	csr_write_addr			,
input      [DATA_WIDTH-1:0] 	csr_write_data			,
input 			trap_valid_i				,
input 			stall_valid_i				,
input 			branch_valid_i				,
input 		[DATA_WIDTH-1:0] 	minstret_csr_inhibit_bit	,
output [DATA_WIDTH-1:0] 	minstret_o		,
input           dbg_csr_write_en_i      ,
input [CSR_ADDR_WIDTH-1:0]    dbg_csr_addr_i          ,
input [DATA_WIDTH-1:0]    dbg_csr_write_data_i    ,
input           debug_mode_valid_i      ,
input           dbg_ndm_reset_i         ,
input           dbg_hart_reset_i                  

);
localparam MINSTRET = 12'hb02;
localparam RST_VAL = 0;
	reg [DATA_WIDTH-1:0] minstret_r;


reg stall_valid_r;
reg branch_valid_r;
reg trap_valid_r;

always@(posedge csr_clk or negedge csr_rst )
begin
	if(!csr_rst )
	begin
		stall_valid_r	<= 1'b0	;
		branch_valid_r	<= 1'b0	;
		trap_valid_r	<= 1'b0	;

	end
    else if(dbg_ndm_reset_i | dbg_hart_reset_i| wdt_reset_i)
    begin
        		stall_valid_r	<= 1'b0	;
		branch_valid_r	<= 1'b0	;
		trap_valid_r	<= 1'b0	;

    end
	else
	begin
		stall_valid_r	<= stall_valid_i	;
		branch_valid_r	<= branch_valid_i	;
		trap_valid_r	<= trap_valid_i		;
		
	end
end

wire minstret_count_valid;
assign minstret_count_valid = (debug_mode_valid_i | stall_valid_i | branch_valid_i | trap_valid_i | stall_valid_r | branch_valid_r | trap_valid_r) ;

always@(posedge csr_clk or negedge csr_rst )
begin
	if(!csr_rst )
	begin
		//minstret_o <= RST_VAL;
		minstret_r <= RST_VAL;
	end
    else if(dbg_ndm_reset_i | dbg_hart_reset_i| wdt_reset_i)
    begin
        		minstret_r <= RST_VAL;
    end
	else
	begin
        if(dbg_csr_write_en_i && debug_mode_valid_i && (dbg_csr_addr_i == MINSTRET) )
        begin
                minstret_r <= dbg_csr_write_data_i;
        end
		else if(csr_write_enable && (csr_write_addr == MINSTRET))
			begin
				minstret_r <= csr_write_data;
			end
		else
			begin
				if((!minstret_csr_inhibit_bit[2] ) && (!minstret_count_valid))
				begin
					minstret_r <= minstret_r + {{DATA_WIDTH-1{1'b0}},1'b1} ;
				end
				else
				begin
					minstret_r <= minstret_r ;
				end
			end
	end
end
	
/*	always@(posedge csr_clk or negedge csr_rst)
		begin
			if(!csr_rst)
				begin
					minstret_o <= RST_VAL;
				end
			else
				begin
					if(!minstret_csr_inhibit_bit[2])
						begin
							minstret_o <= minstret_r;
						end
				end
		end*/
       assign minstret_o = minstret_r;
endmodule

//////////////////////////////////////////////////////////////////////////////////////////////////
//mcycle 
//this register counts the number of cycles executed by the processor core on which HART is running
//it will have hold random value upon reset
//it can be written with any given value
//
//////////////////////////////////////////////////////////////////////////////////////////////////


module mcycle_csr
#(
parameter CSR_ADDR_WIDTH    = 0,
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
input 			csr_clk			,
input 			csr_rst			,
input wdt_reset_i,
input 			csr_write_enable	,
input 	   [CSR_ADDR_WIDTH-1:0] 	csr_write_addr		,
input      [DATA_WIDTH-1:0] 	csr_write_data		,
input 	   [DATA_WIDTH-1:0]		mcycle_csr_inhibit_bit	,
output  [DATA_WIDTH-1:0] 	mcycle_o		,
input           dbg_csr_write_en_i      ,
input [CSR_ADDR_WIDTH-1:0]    dbg_csr_addr_i          ,
input [DATA_WIDTH-1:0]    dbg_csr_write_data_i    ,
input           debug_mode_valid_i      ,
input           dbg_ndm_reset_i         ,
input           dbg_hart_reset_i                  

);


localparam MCYCLE = 12'hb00;
localparam RST_VAL = 0;
	reg [DATA_WIDTH-1:0] mcycle_r;
always@(posedge csr_clk or negedge csr_rst )
begin
	if(!csr_rst )
	begin
		mcycle_r <= RST_VAL;
		//mcycle_o <= RST_VAL;
	end
    else if(dbg_ndm_reset_i | dbg_hart_reset_i| wdt_reset_i)
    begin
        		mcycle_r <= RST_VAL;

    end
	else
	begin
		//mcycle_o <= mcycle_r;
        if(dbg_csr_write_en_i && debug_mode_valid_i && (dbg_csr_addr_i == MCYCLE) )
        begin
                mcycle_r <= dbg_csr_write_data_i;
        end
		else if(csr_write_enable && (csr_write_addr == MCYCLE))
			begin
				mcycle_r <= csr_write_data;
			end
		else
			begin
				if((!mcycle_csr_inhibit_bit[0]) && (!debug_mode_valid_i))
				begin
					mcycle_r <= mcycle_r + {{DATA_WIDTH-1{1'b0}},1'b1} ;
				end
				else
				begin
					mcycle_r <= mcycle_r ;
				end
			end
	end
end
/*	always@(posedge csr_clk or negedge csr_rst)
		begin
			if(!csr_rst)
				begin
					mcycle_o <= RST_VAL;
				end
			else
				begin
					if(!mcycle_csr_inhibit_bit[0])
						begin
							mcycle_o <= mcycle_r;
						end
				end
		end*/
       assign mcycle_o = mcycle_r;
	
endmodule

//////////////////////////////////////////////////////////////////////////////
//machine counter inhibit register - mcounterinhibit
//can be written with any values
//if a perticular bit is set, then corresponding counter is not incremented
//////////////////////////////////////////////////////////////////////////////


module mcounter_inhibit_csr
#(
parameter CSR_ADDR_WIDTH    = 0,
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
input 			csr_clk			,
input 			csr_rst			,
input wdt_reset_i,
input 			csr_write_enable	,
input 			csr_set_bit		,
input 			csr_clear_bit		,
input 	   [CSR_ADDR_WIDTH-1:0] 	csr_write_addr		,
input      [DATA_WIDTH-1:0] 	csr_write_data		,
output reg [DATA_WIDTH-1:0] 	mcounter_inhibit_o		,
input           dbg_csr_write_en_i      ,
input [CSR_ADDR_WIDTH-1:0]    dbg_csr_addr_i          ,
input [DATA_WIDTH-1:0]    dbg_csr_write_data_i    ,
input           debug_mode_valid_i      ,
input           dbg_ndm_reset_i         ,
input           dbg_hart_reset_i                  

);

localparam MCOUNT_INHIBIT = 12'h320;
localparam RST_VAL	  = 0 ;


always@(posedge csr_clk or negedge csr_rst )
begin
	if(!csr_rst )
	begin
		mcounter_inhibit_o <= RST_VAL;
	end
    else if(dbg_ndm_reset_i | dbg_hart_reset_i| wdt_reset_i)
    begin
        		mcounter_inhibit_o <= RST_VAL;

    end
	else
	begin
        if(dbg_csr_write_en_i && debug_mode_valid_i && (dbg_csr_addr_i == MCOUNT_INHIBIT) )
        begin
                mcounter_inhibit_o <= dbg_csr_write_data_i;
        end
		else if(csr_write_enable && (csr_write_addr == MCOUNT_INHIBIT))
		begin
			case({csr_clear_bit,csr_set_bit})
				2'b00://complete write
				begin
					mcounter_inhibit_o <= csr_write_data;
				end
				2'b01://set
				begin
					mcounter_inhibit_o <= (mcounter_inhibit_o | csr_write_data) ;
				end
				2'b10://clear
				begin
					mcounter_inhibit_o <= (mcounter_inhibit_o & (~csr_write_data));
				end
            		endcase
		end
	end
end
	


endmodule

///////////////////////////////////////////////////
//mtvec csr - holds trap vector configuration
//read write register 
///////////////////////////////////////////////////

module mtvec_csr
#(
parameter CSR_ADDR_WIDTH    = 0,
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
input 			csr_clk		,
input 			csr_rst		,
input wdt_reset_i,
input [DATA_WIDTH-1:0] 		csr_write_data	,
input 	     		csr_write_enable,
input [CSR_ADDR_WIDTH-1:0] 		csr_write_addr	,
input 			csr_set_bit	,
input 			csr_clear_bit	,
output [DATA_WIDTH-1:0] 	mtvec_o 	,
input           dbg_csr_write_en_i      ,
input [CSR_ADDR_WIDTH-1:0]    dbg_csr_addr_i          ,
input [DATA_WIDTH-1:0]    dbg_csr_write_data_i    ,
input           debug_mode_valid_i      ,
input           dbg_ndm_reset_i         ,
input           dbg_hart_reset_i                  

);
localparam INT_MODE = 1;
localparam MTVEC = 12'b0011_0000_0101;//305
wire wr_addr_valid;
assign wr_addr_valid = (csr_write_addr == MTVEC) ? 1'b1 : 1'b0;

wire [1:0] mode;
assign mode = INT_MODE;


reg [DATA_WIDTH-1:0] mtvec_r ;

assign mtvec_o = {mtvec_r[DATA_WIDTH-1:2],mode};

always@(posedge csr_clk or negedge csr_rst )
begin
	if(!csr_rst )
	begin
		mtvec_r <= {{DATA_WIDTH-16{1'b0}},16'd32768};//32768 16'h8000
	end
    else if(dbg_ndm_reset_i | dbg_hart_reset_i| wdt_reset_i)
    begin
       		mtvec_r <= {{DATA_WIDTH-16{1'b0}},16'd32768};
    end
	else
	begin
        if(dbg_csr_write_en_i && debug_mode_valid_i && (dbg_csr_addr_i == MTVEC) )
        begin
                mtvec_r <= dbg_csr_write_data_i;
        end
		else if(csr_write_enable && wr_addr_valid)
		begin
			case({csr_clear_bit,csr_set_bit})
			2'b00://complete write
				begin
					mtvec_r <= {csr_write_data[DATA_WIDTH-1:0]};
				end
				2'b01://set
				begin
					mtvec_r <= (mtvec_r | csr_write_data) ;
				end
				2'b10://clear
				begin
					mtvec_r <= (mtvec_r & (~csr_write_data));
				end
            endcase
		end

	end
end
endmodule



//machine exception program counter
//it stores the PC value of a instruction which is being interrupted of
//encountered an exception
//software can also access and write 
//


module mepc_csr
#(
parameter CSR_ADDR_WIDTH    = 0,
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
input 			csr_clk			,
input 			csr_rst			,
input wdt_reset_i,
input [DATA_WIDTH-1:0] 		csr_write_data		,
input 			csr_write_en		,
input [CSR_ADDR_WIDTH-1:0] 		csr_write_addr		,
input 			int_exp_valid		,
input 			instr_misalign_valid 	,
input [PC_WIDTH-1:0] 		pc			,
input [PC_WIDTH-1:0]		csr_mepc_in		,
input 			csr_mepc_write_valid	,
output  [PC_WIDTH-1:0]		csr_mepc_o		,	
output reg [DATA_WIDTH-1:0] 	mepc_csr_o   	,
input           dbg_csr_write_en_i      ,
input [CSR_ADDR_WIDTH-1:0]    dbg_csr_addr_i          ,
input [DATA_WIDTH-1:0]    dbg_csr_write_data_i    ,
input           debug_mode_valid_i      ,
input           dbg_ndm_reset_i         ,
input           dbg_hart_reset_i                  

   
);

localparam MEPC = 12'b0011_0100_0001;//341

wire wr_addr_valid;
	assign wr_addr_valid = ((csr_write_addr == MEPC) || (int_exp_valid | csr_mepc_write_valid )) ? 1'b1 : 1'b0;

/*always@(posedge csr_clk or negedge csr_rst)
begin
	if(!csr_rst)
	begin
		mepc_csr_o <= {DATA_WIDTH{1'b0}};
	end
	else
	begin
	if(wr_addr_valid)
		begin
		if(csr_mepc_write_valid && (!instr_misalign_valid))
		begin
			mepc_csr_o <= {44'd0,csr_mepc_in};
		end
		else if(csr_write_en && (csr_write_addr == MEPC) )
		begin
			mepc_csr_o <= csr_write_data;
		end
	end

	end
end*/
	always@(posedge csr_clk or negedge csr_rst )
begin
	if(!csr_rst )
				begin
					mepc_csr_o <= {DATA_WIDTH{1'b0}};
				end
                else if(dbg_ndm_reset_i | dbg_hart_reset_i| wdt_reset_i)
                begin
                    mepc_csr_o <= {DATA_WIDTH{1'b0}};
                end
				else
				begin
                    if(dbg_csr_write_en_i && debug_mode_valid_i && (dbg_csr_addr_i == MEPC) )
                    begin
                        mepc_csr_o <= dbg_csr_write_data_i;
                    end
		            else if((csr_mepc_write_valid & (!instr_misalign_valid)))
						begin
							mepc_csr_o <= {{DATA_WIDTH-PC_WIDTH{1'b0}},csr_mepc_in};
						end
					else if(csr_write_en && (csr_write_addr == MEPC) )
						begin
							mepc_csr_o <= csr_write_data;
						end
				end
		end
assign csr_mepc_o = mepc_csr_o;
endmodule




/////////////////////////////////////////////
//machine interrupt enable csr
/////////////////////////////////////////////
module mie_csr
#(
parameter CSR_ADDR_WIDTH    = 0,
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
input 			csr_clk		,
input 			csr_rst		,
input wdt_reset_i,
input [DATA_WIDTH-1:0] 		csr_write_data	,
input 	     		csr_write_enable,
input [CSR_ADDR_WIDTH-1:0] 		csr_write_addr	,
input 			csr_set_bit	,
input 			csr_clear_bit	,
output [DATA_WIDTH-1:0] 	mie_o 	,
input           dbg_csr_write_en_i      ,
input [CSR_ADDR_WIDTH-1:0]    dbg_csr_addr_i          ,
input [DATA_WIDTH-1:0]    dbg_csr_write_data_i    ,
input           debug_mode_valid_i      ,
input           dbg_ndm_reset_i         ,
input           dbg_hart_reset_i                  

);
localparam MIE = 12'b0011_0000_0100;//304
wire wr_addr_valid;
	assign wr_addr_valid = (csr_write_addr == MIE) ? 1'b1 : 1'b0;

reg [DATA_WIDTH-1:0] mie_r;

assign mie_o = {{DATA_WIDTH-12{1'b0}},mie_r[11],3'd0,mie_r[7],3'd0,mie_r[3],3'd0};
always@(posedge csr_clk or negedge csr_rst )
begin
	if(!csr_rst )
	begin
		mie_r <= {DATA_WIDTH{1'b0}};
	end
    else if(dbg_ndm_reset_i | dbg_hart_reset_i| wdt_reset_i)
    begin
        		mie_r <= {DATA_WIDTH{1'b0}};

    end
	else
	begin
        if(dbg_csr_write_en_i && debug_mode_valid_i && (dbg_csr_addr_i == MIE) )
        begin
                mie_r <= dbg_csr_write_data_i;
        end
		else if(csr_write_enable && wr_addr_valid)
		begin
			case({csr_clear_bit,csr_set_bit})

				2'b00://complete write
				begin
					mie_r <= csr_write_data;
				end
				2'b01://clear specified bits
				begin
					mie_r <= (mie_r | csr_write_data) ;
				end
				2'b10://set specified bits
				begin
					mie_r <= (mie_r & (~csr_write_data));
				end
endcase
		end

	end
end
endmodule



//////////////////////////////////////////
//machine interrupt pending csr
////////////////////////////////////////////


module mip_csr
#(
parameter CSR_ADDR_WIDTH    = 0,
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
input 			csr_clk		,
input 			csr_rst		,
input wdt_reset_i,
input [DATA_WIDTH-1:0] 		csr_write_data	,
input 	     		csr_write_enable,
input [CSR_ADDR_WIDTH-1:0] 		csr_write_addr	,
input 			csr_set_bit	,
input 			csr_clear_bit	,
output  [DATA_WIDTH-1:0] 	mip_o 	,
input           dbg_csr_write_en_i      ,
input [CSR_ADDR_WIDTH-1:0]    dbg_csr_addr_i          ,
input [DATA_WIDTH-1:0]    dbg_csr_write_data_i    ,
input           debug_mode_valid_i      ,
input           dbg_ndm_reset_i         ,
input           dbg_hart_reset_i                  

);
localparam MTVEC = 12'b0011_0100_0100;//344
wire wr_addr_valid;
assign wr_addr_valid = (csr_write_addr == MTVEC) ? 1'b1 : 1'b0;
reg [DATA_WIDTH-1:0] mip_r;

assign mip_o = {{DATA_WIDTH-12{1'b0}},mip_r[11],3'd0,mip_r[7],3'd0,mip_r[3],3'd0};

always@(posedge csr_clk or negedge csr_rst)
begin
	if(!csr_rst )
	begin
		mip_r <= {DATA_WIDTH{1'b0}};
	end
    else if(dbg_ndm_reset_i | dbg_hart_reset_i| wdt_reset_i)
    begin
        	mip_r <= {DATA_WIDTH{1'b0}};
    end
	else
	begin
        if(dbg_csr_write_en_i && debug_mode_valid_i && (dbg_csr_addr_i == MTVEC) )
        begin
                mip_r <= dbg_csr_write_data_i;
        end
		else if(csr_write_enable && wr_addr_valid)
		begin
			case({csr_clear_bit,csr_set_bit})
				2'b00://complete write
				begin
					mip_r <= csr_write_data;
				end
				2'b01://clear specified bits
				begin
					mip_r <= (mip_r | csr_write_data) ;
				end
				2'b10://set specified bits
				begin
					mip_r <= (mip_r & (~csr_write_data));
				end
			endcase
		end

	end
end
endmodule


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//when a trap is taken into M-Mode, this csr will be set to zero or written
//with exception specific value
//breakpoint is triggered, or an instruction-fetch, load, or store address-misaligned, access, or page-fault exception occurs, mtval is written with the faulting virtual address.
//On an illegal instruction trap, mtval may be written with the first XLEN or ILEN bits of the faulting instruction as described below.
//For other traps, mtval is set to zero
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module mtval_csr
#(
parameter CSR_ADDR_WIDTH    = 0,
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
input 			csr_clk			,
input 			csr_rst			,
input wdt_reset_i,
input [DATA_WIDTH-1:0]		csr_write_data		,
input 			csr_write_en		,
input [CSR_ADDR_WIDTH-1:0]		csr_write_addr		,
input 			ld_sd_misalign_valid	,
input [DATA_WIDTH-1:0] 		ld_sd_misalign_addr	,
input 			instr_misalign_valid	,
input [DATA_WIDTH-1:0] 		instr_misalign_addr	,
input 			illegal_instr_valid	,
input [INSTRUCTION_WIDTH-1:0] 		illegal_instruction 	,	
input			trap_valid		,//exceptions
output reg [DATA_WIDTH-1:0] 	mtval_o   ,
input           dbg_csr_write_en_i      ,
input [CSR_ADDR_WIDTH-1:0]    dbg_csr_addr_i          ,
input [DATA_WIDTH-1:0]    dbg_csr_write_data_i    ,
input           debug_mode_valid_i      ,
input           dbg_ndm_reset_i         ,
input           dbg_hart_reset_i                  


);

localparam MTVAL = 12'b0011_0100_0011;//343

wire wr_addr_valid;
assign wr_addr_valid = ((csr_write_addr == MTVAL) && csr_write_en) ? 1'b1 : 1'b0;

always@(posedge csr_clk or negedge csr_rst )
begin
	if(!csr_rst )
	begin
		mtval_o <= {DATA_WIDTH{1'b0}};
	end
    else if(dbg_ndm_reset_i | dbg_hart_reset_i| wdt_reset_i)
    begin
        mtval_o <= {DATA_WIDTH{1'b0}};
    end
	else
	begin
        if(dbg_csr_write_en_i && debug_mode_valid_i && (dbg_csr_addr_i == MTVAL) )
        begin
                mtval_o <= dbg_csr_write_data_i;
        end
		else if(trap_valid)
		begin
		if(ld_sd_misalign_valid)
		begin
			mtval_o <= ld_sd_misalign_addr;
		end
		else if(instr_misalign_valid)
		begin
			mtval_o <= instr_misalign_addr;
		end
		else if(illegal_instr_valid)
		begin
			mtval_o <= {{DATA_WIDTH-INSTRUCTION_WIDTH{1'b0}},illegal_instruction};//pc
		end
		else
		begin
			mtval_o <= {DATA_WIDTH{1'b0}};
		end
		end
		else if(wr_addr_valid)
		begin
			mtval_o <= csr_write_data;
		end

	end
end

endmodule



//////////////////////////////////////////////////////////////////////////////////
//mcause register
//Stores info regarding interrupt and exception
//exclusive excpetion/interrupt code and interrupt bits for each interrupt and
//exception

//machine exception program counter
//it stores the PC value of a instruction which is being interrupted of
//encountered an exception
//software can also access and write 
///////////////////////////////////////////////////////////////////////////////////


module mcause_csr
#(
parameter CSR_ADDR_WIDTH    = 0,
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
input csr_clk		,
input csr_rst		,
input wdt_reset_i,
input [DATA_WIDTH-1:0] csr_write_data	,
input csr_write_en	,
input [CSR_ADDR_WIDTH-1:0] csr_write_addr	,
input interrupt_valid	,
input csr_set_bit,
input csr_clear_bit,
input exception_valid	,
input [DATA_WIDTH-1:0] exception_code,
input [DATA_WIDTH-1:0] interrupt_code,
input exception_id_write_valid_i,
input interrupt_id_write_valid_i,
output [DATA_WIDTH-1:0] mcause_o  ,
input [7:0] mintstatus_i,
output [7:0]prv_int_lvl_pr_o,
input           dbg_csr_write_en_i      ,
input [CSR_ADDR_WIDTH-1:0]    dbg_csr_addr_i          ,
input [DATA_WIDTH-1:0]    dbg_csr_write_data_i    ,
input           debug_mode_valid_i      ,
input           dbg_ndm_reset_i         ,
input           dbg_hart_reset_i                  


);
reg [7:0] prev_int_lvl_pr_r;
reg [DATA_WIDTH-1:0] mcause_r;
reg [7:0] mintstatus_r;
localparam MCAUSE = 12'b0011_0100_0010;//342

wire wr_addr_valid;
assign wr_addr_valid = ((csr_write_addr == MCAUSE) && csr_write_en) ? 1'b1 : 1'b0;
assign prv_int_lvl_pr_o = mcause_r[23:16]; 
//assign mcause_o = mcause_r;
assign mcause_o = {mcause_r[DATA_WIDTH-1],{DATA_WIDTH-32{1'b0}},1'b1,2'b11,mcause_r[27],3'd0,mcause_r[23:16],4'd0,mcause_r[CSR_ADDR_WIDTH-1:0]};
reg interrupt_valid_r;
/*always@(posedge csr_clk or negedge csr_rst)
begin
     if(!csr_rst)
    begin
       prev_int_lvl_pr_r  <= 8'd0;
    end
    else if(interrupt_valid | exception_valid)
    begin
        prev_int_lvl_pr_r <= mintstatus_i ;
    end

end*/
always@(posedge csr_clk or negedge csr_rst )
begin
	if(!csr_rst )
    begin
        interrupt_valid_r <= 1'b0;
        mintstatus_r <= 8'd0 ;
    end
    else if(dbg_ndm_reset_i | dbg_hart_reset_i| wdt_reset_i)
    begin
        interrupt_valid_r <= 1'b0;
        mintstatus_r <= 8'd0 ;

    end
    else
    begin
        if(dbg_csr_write_en_i && debug_mode_valid_i && (dbg_csr_addr_i == MCAUSE) )
        begin
                mintstatus_r <= dbg_csr_write_data_i;


        end
		else
        begin
        interrupt_valid_r <= interrupt_valid ;
        mintstatus_r <= mintstatus_i ;
        end
    end
end
always@(posedge csr_clk or negedge csr_rst )
begin
	if(!csr_rst )
	begin
		mcause_r <= {DATA_WIDTH{1'b0}};
	end
    else if(dbg_ndm_reset_i | dbg_hart_reset_i| wdt_reset_i)
    begin
        		mcause_r <= {DATA_WIDTH{1'b0}};

    end
	else
	begin
        if(dbg_csr_write_en_i && debug_mode_valid_i && (dbg_csr_addr_i == MCAUSE) )
        begin
                mcause_r <= dbg_csr_write_data_i;
        end
		else if(exception_id_write_valid_i)
		begin
			//mcause_r <= {1'b0,exception_code[62:0]};//{40'd0,mintststus_r,4'd0,exception_code[CSR_ADDR_WIDTH-1:0]}
            mcause_r <=   {{DATA_WIDTH-24{1'b0}},mintstatus_i,4'd0,exception_code[CSR_ADDR_WIDTH-1:0]};
		end
		else if(interrupt_id_write_valid_i)
		begin
		//	mcause_r <= {1'b1,interrupt_code[62:0]};
            mcause_r <=   {1'b1,{DATA_WIDTH-25{1'b0}},mintstatus_r,4'd0,interrupt_code[CSR_ADDR_WIDTH-1:0]};
            
          //  mcause_o <= {1'b1,63'd10};
		end
		else if(wr_addr_valid)
		begin
				case({csr_clear_bit,csr_set_bit})

				2'b00://complete write
				begin
					mcause_r <= csr_write_data;
				end
				2'b01://clear specified bits
				begin
					mcause_r <= (mcause_r | csr_write_data) ;
				end
				2'b10://set specified bits
				begin
					mcause_r <= (mcause_r & (~csr_write_data));
				end
			endcase

		end
	end
end

endmodule





//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//mscratch csr
//read write register
//it is used to hold a pointer to a machine-mode hart-local context space and swapped with a user register upon entry to an M-mode trap handler.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

module mscratch_csr
#(
parameter CSR_ADDR_WIDTH    = 0,
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
input 			csr_clk		,
input 			csr_rst		,
input wdt_reset_i,
input [DATA_WIDTH-1:0] 		csr_write_data	,
input 	     		csr_write_enable,
input [CSR_ADDR_WIDTH-1:0] 		csr_write_addr	,
input 			csr_set_bit	,
input 			csr_clear_bit	,
output reg [DATA_WIDTH-1:0] 	mscratch_o 	,
input           dbg_csr_write_en_i      ,
input [CSR_ADDR_WIDTH-1:0]    dbg_csr_addr_i          ,
input [DATA_WIDTH-1:0]    dbg_csr_write_data_i    ,
input           debug_mode_valid_i      ,
input           dbg_ndm_reset_i         ,
input           dbg_hart_reset_i                  

);
localparam MSCRATCH = 12'b0011_0100_0000;//340
wire wr_addr_valid;


assign wr_addr_valid = (csr_write_addr == MSCRATCH) ? 1'b1 : 1'b0;

always@(posedge csr_clk or negedge csr_rst )
begin
	if(!csr_rst )	
    begin
		mscratch_o <= {DATA_WIDTH{1'b0}};
	end
    else if(dbg_ndm_reset_i | dbg_hart_reset_i| wdt_reset_i)
    begin
        		mscratch_o <= {DATA_WIDTH{1'b0}};

    end
	else
	begin
        if(dbg_csr_write_en_i && debug_mode_valid_i && (dbg_csr_addr_i == MSCRATCH) )
        begin
                mscratch_o <= dbg_csr_write_data_i;
        end
		else if(csr_write_enable && wr_addr_valid)
		begin
			case({csr_clear_bit,csr_set_bit})
				2'b00://complete write
				begin
					mscratch_o <= csr_write_data;
				end
				2'b01://clear specified bits
				begin
					mscratch_o <= (mscratch_o | csr_write_data) ;
				end
				2'b10://set specified bits
				begin
					mscratch_o <= (mscratch_o & (~csr_write_data));
				end
endcase
		end

	end
end
endmodule


/////////////////////////////////////////////////////
//mstatus csr
//read write register
//global interrupt enable bits - MIE, SIE, UIE
////////////////////////////////////////////////////


module mstatus_csr
#(
parameter CSR_ADDR_WIDTH    = 0,
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
input 			csr_clk		,
input 			csr_rst		,
input wdt_reset_i,
input [DATA_WIDTH-1:0] 		csr_write_data	,
input 	     		csr_write_enable,
input [CSR_ADDR_WIDTH-1:0] 		csr_write_addr	,
input 			csr_set_bit	,
input 			csr_clear_bit	,
input			mie_set		,//interrupt occurs
input 			mie_clear	,//end of interrupt
output  [DATA_WIDTH-1:0] 		mstatus_o 	,
output			mstatus_mie_o		,
input           dbg_csr_write_en_i      ,
input [CSR_ADDR_WIDTH-1:0]    dbg_csr_addr_i          ,
input [DATA_WIDTH-1:0]    dbg_csr_write_data_i    ,
input           debug_mode_valid_i      ,
input           dbg_ndm_reset_i         ,
input           dbg_hart_reset_i                  

);
localparam MSTATUS = 12'b0011_0000_0000;
wire wr_addr_valid;
assign wr_addr_valid = (csr_write_addr == MSTATUS) ? 1'b1 : 1'b0;
reg [DATA_WIDTH-1:0] mstatus;

assign mstatus_o = {{DATA_WIDTH-13{1'b0}},2'b11,3'd0,mstatus[7],3'd0,mstatus[3],3'd0};
always@(posedge csr_clk or negedge csr_rst )
begin
	if(!csr_rst )
	begin
		mstatus <= {DATA_WIDTH{1'b0}};
	end
    else if(dbg_ndm_reset_i | dbg_hart_reset_i| wdt_reset_i)
    begin
        		mstatus <= {DATA_WIDTH{1'b0}};

    end
	else
	begin
        if(dbg_csr_write_en_i && debug_mode_valid_i && (dbg_csr_addr_i == MSTATUS) )
        begin
                mstatus <= dbg_csr_write_data_i;
        end
		else if(csr_write_enable && wr_addr_valid)
		begin
			case({csr_clear_bit,csr_set_bit})
				2'b00://complete write
				begin
					mstatus <= csr_write_data;
				end
				2'b01://clear specified bits
				begin
					mstatus <= (mstatus | csr_write_data) ;
				end
				2'b10://set specified bits
				begin
					mstatus <= (mstatus & (~csr_write_data));
				end
			endcase
		end
		else if(mie_set)
			begin
	//	mstatus[7] <= mstatus[3];
                mstatus[3] <= 1'b1;
			end
		else if(mie_clear)
			begin
			//	mstatus[3] <= mstatus[7];
              mstatus[3] <= 1'b0;
			end

	end
end
assign mstatus_mie_o = mstatus[3];
endmodule

///////////////////////////////////////////////////////
//indicates the id of the hardware thread running
//hart id must be unique
//atleast one hart must have id zero
//////////////////////////////////////////////////////////

module mhardid_csr
#(
parameter CSR_ADDR_WIDTH    = 0,
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
input csr_clk,
input csr_rst,
input wdt_reset_i,
output reg [DATA_WIDTH-1:0] mhart_id_o 
);

localparam HARTID = 0 ;

always@(posedge csr_clk or negedge csr_rst)
begin
	if(!csr_rst)
	begin
		mhart_id_o <= HARTID;
	end
end
endmodule


////////////////////////////////////////////////////////////////////
//machine level core implementation id
//this is fixed by the provider of architectural source code
//it is a read only csr
//zero value indicates that this csr is not implemented
//this register should be written MSB to LSB 
////////////////////////////////////////////////////////////////////
module mimpid_csr
#(
parameter CSR_ADDR_WIDTH    = 0,
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
input csr_clk,
input csr_rst,
input wdt_reset_i,
output reg [DATA_WIDTH-1:0] mimp_id_o 
);

localparam MIMPID = 0 ;

always@(posedge csr_clk or negedge csr_rst)
begin
	if(!csr_rst)
	begin
		mimp_id_o <= MIMPID;
	end
end
endmodule

///////////////////////////////////////////////////////////////////////
//machine vendor id csr
//32 bit read onlt register
//value zero indicates that this CSR is not implemented or the core is
//non-commercial 
///////////////////////////////////////////////////////////////////////

module mvendorid_csr
#(
parameter CSR_ADDR_WIDTH    = 0,
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
input csr_clk,
input csr_rst,
input wdt_reset_i,
output reg [DATA_WIDTH-1:0] mvendor_id_o 
);

localparam VID = 0 ;

always@(posedge csr_clk or negedge csr_rst)
begin
	if(!csr_rst)
	begin
		mvendor_id_o <= VID;
	end
end
endmodule


////////////////////////////////////////////////////////////////
//indicates the machine architecture id
//zero indicates this csr is not implemented
//for open cores architecture id is fixed by RISCV org
//for commercial cores arch id is defined by respective vendors
////////////////////////////////////////////////////////////////
module march_csr
#(
parameter CSR_ADDR_WIDTH    = 0,
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
input csr_clk,
input csr_rst,
input wdt_reset_i,
output reg [DATA_WIDTH-1:0] march_id_o 
);

localparam ARCHID = 0 ;

always@(posedge csr_clk or negedge csr_rst)
begin
	if(!csr_rst)
	begin
		march_id_o <= ARCHID;
	end
end
endmodule


////////////////////////////////////////////////////////////////////
//machine mode ISA info CSR
//bit 31:30 gives the widest length ISA that the core support
//value 00 indicates misa csr has not implemented
//01: 32 
//10: 64
//11: 128
////////////////////////////////////////////////////////////////////
module misa_csr
#(
parameter CSR_ADDR_WIDTH    = 0,
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
input			csr_clk		,
input			csr_rst		,
input wdt_reset_i,
//input 			csr_write_data	,
//input 			csr_write_enable,
output reg [DATA_WIDTH-1:0] 	misa_csr_o
);

localparam RV32 = 2'b01;
localparam RV64 = 2'b10;
localparam RV128 = 2'b11;

wire [1:0] isa_type;
assign isa_type = RV64;
wire A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z;
assign A = 1'b0; //Atomic extension
assign B = 1'b0; //Tentatively reserved for Bit-Manipulation extension
assign C = 1'b0; //Compressed extension
assign D = 1'b0; //Double-precision floating-point extension
assign E = 1'b0; //RV32E base ISA
assign F = 1'b0; //Single-precision floating-point extension
assign G = 1'b0; //Additional standard extensions present
assign H = 1'b0; //Hypervisor extension
assign I = 1'b1; //RV32I/64I/128I base ISA
assign J = 1'b0; //Tentatively reserved for Dynamically Translated Languages extension
assign K = 1'b0; //Reserved
assign L = 1'b0; //Tentatively reserved for Decimal Floating-Point extension
assign M = 1'b1; //Integer Multiply/Divide extension
assign N = 1'b0; //User-level interrupts supported
assign O = 1'b0; //Reserved
assign P = 1'b0; //Tentatively reserved for Packed-SIMD extension
assign Q = 1'b0; //Quad-precision floating-point extension
assign R = 1'b0; //Reserved
assign S = 1'b0; //Supervisor mode implemented
assign T = 1'b0; //Tentatively reserved for Transactional Memory extension
assign U = 1'b0; //User mode implemented
assign V = 1'b0; //Tentatively reserved for Vector extension
assign W = 1'b0; //Reserved
assign X = 1'b1; //Non-standard extensions present
assign Y = 1'b0; //Reserved
assign Z = 1'b0; //Reserved   							



always@(posedge csr_clk or negedge csr_rst)
	begin
		if(!csr_rst)
		begin
			misa_csr_o <= {isa_type,{{DATA_WIDTH-28}{1'b0}},Z,Y,X,W,V,U,T,S,R,Q,P,O,N,M,L,K,J,I,H,G,F,E,D,C,B,A};
		end
	end

endmodule

//////////////debug module related CSRs////////////////////
module dcsr
#(
parameter CSR_ADDR_WIDTH    = 0,
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
input           dcsr_clk_i              ,
input           dcsr_rst_i              ,
input wdt_reset_i,
input [DATA_WIDTH-1:0]    dcsr_write_data_i       ,
input [CSR_ADDR_WIDTH-1:0]    dcsr_addr_i             ,
input           dcsr_write_en_i         ,
input           dcsr_set_en_i           ,
input           dcsr_clear_en_i         ,

input           ebreak_valid_i          ,
input           trigger_valid_i         ,
input           haltreq_valid_i         ,
input           single_step_valid_i     ,
input           reset_haltreq_valid_i   ,

output [DATA_WIDTH-1:0]   dcsr_o              ,
input           dbg_csr_write_en_i      ,
input [CSR_ADDR_WIDTH-1:0]    dbg_csr_addr_i          ,
input [DATA_WIDTH-1:0]    dbg_csr_write_data_i    ,
input           debug_mode_valid_i      ,
input           dbg_ndm_reset_i         ,
input           dbg_hart_reset_i                  


);

localparam DCSR_ADDR     = 12'h7b0  ;
localparam DEBUG_VER     = 4'd4     ;
localparam RSVD          = 10'd0    ;
localparam EBREAK_VS     = 1'b0     ;
localparam EBREAK_VU     = 1'b0     ;
localparam EBREAK_M      = 1'b1     ;
localparam EBREAK_U      = 1'b0     ;
localparam EBREAK_S      = 1'b0     ;
localparam STEP_IE       = 1'b0     ;
localparam STOP_CNT      = 1'b1     ;
localparam STOP_TIME     = 1'b1     ;
localparam CS_EBREAK     = 3'd1     ;
localparam CS_TRIG       = 3'd2     ;
localparam CS_HALTREQ    = 3'd3     ;
localparam CS_STEP       = 3'd4     ;
localparam CS_RST_HALTREQ= 3'd5     ;
localparam MPRVEN        = 1'b0     ;
localparam NMIP          = 1'b0     ;
localparam STEP          = 1'b0     ;
localparam PRV           = 2'd3     ;


reg [DATA_WIDTH-1:0] dcsr_r;

always@(posedge dcsr_clk_i or negedge dcsr_rst_i )
begin
    if(!dcsr_rst_i )   
    begin
    dcsr_r <= {DEBUG_VER,RSVD,EBREAK_VS,EBREAK_VU,EBREAK_M,1'b0,EBREAK_S,EBREAK_U,STEP_IE,STOP_CNT,STOP_TIME,3'd0,1'b0,MPRVEN,NMIP,STEP,PRV};
    end
    else if(dbg_ndm_reset_i | dbg_hart_reset_i| wdt_reset_i)
    begin

    dcsr_r <= {DEBUG_VER,RSVD,EBREAK_VS,EBREAK_VU,EBREAK_M,1'b0,EBREAK_S,EBREAK_U,STEP_IE,STOP_CNT,STOP_TIME,3'd0,1'b0,MPRVEN,NMIP,STEP,PRV};
    end
    else
    begin
        if(dcsr_write_en_i && (dcsr_addr_i == 12'h7B0))
        begin
            if(dcsr_set_en_i)
            begin
                dcsr_r <= dcsr_r | dcsr_write_data_i ; 
            end
            else if (dcsr_clear_en_i)
            begin
                dcsr_r <= (dcsr_r & (~dcsr_write_data_i));
            end
            else
            begin
                dcsr_r  <= dcsr_write_data_i    ;
            end
        end

    end
end

reg [2:0] debug_cause;

always@(posedge dcsr_clk_i or negedge dcsr_rst_i )
begin
    if(!dcsr_rst_i )
    begin
        debug_cause <= 3'd0;
    end
    else if(dbg_ndm_reset_i | dbg_hart_reset_i| wdt_reset_i)
    begin
                debug_cause <= 3'd0;
    end
    else
    begin
        if(trigger_valid_i)
        begin
            debug_cause <= CS_TRIG;
        end
        else if(ebreak_valid_i)
        begin
            debug_cause <= CS_EBREAK;

        end
        else if(reset_haltreq_valid_i)
        begin
            debug_cause <= CS_RST_HALTREQ;

        end
        else if(haltreq_valid_i)
        begin
            debug_cause <= CS_HALTREQ;

        end
        else if(single_step_valid_i)
        begin
            debug_cause <= CS_STEP;

        end

    end
end

assign dcsr_o = {32'd0,dcsr_r[31:9],debug_cause,dcsr_r[5:0]};
endmodule

////////////////////////////////////////////////////////////////


module dpc
#(
parameter CSR_ADDR_WIDTH    = 0,
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
input           dpc_clk_i             ,
input           dpc_rst_i             ,
input wdt_reset_i,
input           dpc_write_en_i        ,
input           dpc_set_en_i          ,
input           dpc_clear_en_i        ,
input [CSR_ADDR_WIDTH-1:0]    dpc_addr_i            ,
input [DATA_WIDTH-1:0]    dpc_write_data_i      ,
input           ebreak_valid_i        ,
input           trigger_valid_i       ,
input           single_step_valid_i   ,
input           haltreq_valid_i       ,
input [PC_WIDTH-1:0]    pc_i                  ,
output [INSTRUCTION_WIDTH-1:0]   dpc_o         ,
input           dbg_csr_write_en_i      ,
input [CSR_ADDR_WIDTH-1:0]    dbg_csr_addr_i          ,
input [DATA_WIDTH-1:0]    dbg_csr_write_data_i    ,
input           debug_mode_valid_i      ,
input           dbg_ndm_reset_i         ,
input           dbg_hart_reset_i    ,
input                   branch_valid_i  ,
input [PC_WIDTH-1:0]    branch_pc_i    ,
input stall_valid_i

);

localparam DPC_ADDR = 12'h7B1;
reg [DATA_WIDTH-1:0] dpc_r;
wire [PC_WIDTH-1:0] pc_r;
wire [PC_WIDTH-1:0] ebreak_pc;
wire [PC_WIDTH-1:0] stall_pc;

assign ebreak_pc = pc_i - {{PC_WIDTH-4{1'b0}},4'b0100} ;
assign pc_r = pc_i - {{PC_WIDTH-4{1'b0}},4'b0100} ;//{{PC_WIDTH-4{1'b0}},4'b0100}
assign stall_pc = pc_i - {{PC_WIDTH-4{1'b0}},4'b1000} ;//{{PC_WIDTH-4{1'b0}},4'b0100}
//assign pc_r = pc_i;
/////////////
reg dbg_hart_reset_r;
wire neg_dbg_hart_rst;
wire pos_dbg_hart_req;
reg haltreq_valid_r;
wire neg_dbg_hart_req;
reg branch_valid_r;
reg stall_valid_r;
reg [PC_WIDTH-1:0] branch_pc_r;
always@(posedge dpc_clk_i or negedge dpc_rst_i)
   begin
       if(!dpc_rst_i)
         begin
             dbg_hart_reset_r <=1'b0 ;
             haltreq_valid_r    <= 1'b0;
            branch_valid_r      <=  1'b0;
            branch_pc_r         <= {PC_WIDTH{1'b0}};
            stall_valid_r       <= 1'b0;
         end
       else
       begin
           dbg_hart_reset_r <= dbg_hart_reset_i ;
           haltreq_valid_r <= haltreq_valid_i;
           branch_valid_r   <=  branch_valid_i;
           branch_pc_r      <=  branch_pc_i ;
           stall_valid_r <= stall_valid_i   ;
       end
   end

assign neg_dbg_hart_rst = (~dbg_hart_reset_i) && (dbg_hart_reset_r ^ dbg_hart_reset_i) ;
assign pos_dbg_hart_req = (haltreq_valid_i ^ haltreq_valid_r );
assign neg_dbg_hart_req = (~haltreq_valid_i) && (haltreq_valid_r ^ haltreq_valid_i) ;
////////////
always@(posedge dpc_clk_i or negedge dpc_rst_i )
begin
    if(!dpc_rst_i )
    begin
        dpc_r <= {DATA_WIDTH{1'b0}};
    end
    else if(dbg_ndm_reset_i | dbg_hart_reset_i | wdt_reset_i)
    begin
                dpc_r <= {DATA_WIDTH{1'b0}};
    end
    else if(neg_dbg_hart_rst)
    begin
        dpc_r <=  {{DATA_WIDTH-PC_WIDTH{1'b0}},pc_i};
    end
    else
    begin
        if(ebreak_valid_i)
        begin
            dpc_r <= {{DATA_WIDTH-PC_WIDTH{1'b0}},ebreak_pc};
        end
        else if(trigger_valid_i)
        begin
            dpc_r <= {{DATA_WIDTH-PC_WIDTH{1'b0}},pc_r};
        end
        else if(single_step_valid_i)
        begin
            dpc_r <= {{DATA_WIDTH-PC_WIDTH{1'b0}},pc_r};
        end
        else if(pos_dbg_hart_req && branch_valid_i)
        begin
            dpc_r <= branch_pc_i;
        end
        else if(pos_dbg_hart_req && stall_valid_i)
        begin
            dpc_r <= stall_pc;
        end

        else if(pos_dbg_hart_req && stall_valid_r)
        begin
            dpc_r <= stall_pc;
        end
        else if(pos_dbg_hart_req && branch_valid_r)
        begin
            dpc_r <= branch_pc_r;
        end
        else if(pos_dbg_hart_req && (!neg_dbg_hart_req))
        begin
            dpc_r <= {{DATA_WIDTH-PC_WIDTH{1'b0}},pc_r};
        end
        else if(dpc_write_en_i && (dpc_addr_i == DPC_ADDR) & (!dpc_set_en_i) & (!dpc_clear_en_i))
        begin
            dpc_r <= dpc_write_data_i ;
        end
       /* else if(debug_mode_valid_i)
        begin
            dpc_r <= pc_i;
        end*/

    end
end

assign dpc_o = dpc_r;

endmodule

