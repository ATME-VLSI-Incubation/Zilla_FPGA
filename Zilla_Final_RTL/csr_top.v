module csr_top
#(
parameter CSR_ADDR_WIDTH    = 0,
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)
(
input 			                    csr_clk					            ,
input 			                    csr_rst					            ,
input                               wdt_reset_i                         ,
input   		                    csr_write_en_in				        ,		
input   [CSR_ADDR_WIDTH-1:0] 		csr_addr_in				            ,
input                               csr_read_en_in      			    ,
output [DATA_WIDTH-1:0]             csr_read_data_o     			    ,	
input   [DATA_WIDTH-1:0] 		    csr_write_data_in			        ,//from source register	
input   		                    csr_set_bit_in				        ,//decoder	
input   		                    csr_clear_bit_in			        ,//decoder	
input   		                    interrupt_valid_in			        ,//interrupt valid signal 	
input   [DATA_WIDTH-1:0] 		    interrupt_code_in			        ,//interrupt_code	
input   		                    exception_valid_in			        ,//exception valid signal 	
input   [DATA_WIDTH-1:0] 		    exception_code_in			        ,//exception code
input 			                    ld_sd_misalign_valid_in			    ,
input 	[DATA_WIDTH-1:0]		    ld_sd_misalign_addr_in			    ,
input			                    instr_misalign_valid_in			    ,
input   [DATA_WIDTH-1:0]		    instr_misalign_addr_in			    ,
input   		                    invalid_instr_valid_in			    ,//invalid instruction valid 	
input   [INSTRUCTION_WIDTH-1:0] 	invalid_instruction_in			    ,//invalid instruction 	
input       		                mie_set               			    ,//start of an interrupt
input       		                mie_clear              			    ,//end of an interrupt
input   [PC_WIDTH-1:0]		        pc_in					            ,//pc value of invalid instruction
input 	[PC_WIDTH-1:0]		        csr_mepc_in				            ,
input 			                    csr_mepc_write_valid			    ,
input 			                    trap_valid_i				        ,
input 			                    stall_valid_i				        ,
input 			                    branch_valid_i				        ,
input [7:0] 		                interrupt_lvl_pr_i			        ,
input 			                    exception_id_write_valid_i		    ,
input 			                    interrupt_id_write_valid_i		    ,
input                               mret_valid_i        			    ,
output [7:0] 		                interrupt_active_level_priority_o	,
output  [PC_WIDTH-1:0]		        csr_mepc_o				            ,
output 			                    mstatus_mie_o				        ,
output	[DATA_WIDTH-1:0] 		    csr_mtvec_o				            ,
output [7:0] 		                csr_mcause_o				        ,
output [DATA_WIDTH-1:0] 		    data_mem_max_addr_o                 ,
input                               ebreak_valid_i                      ,
input                               trigger_valid_i                     ,
input                               haltreq_valid_i                     ,
input                               single_step_valid_i                 ,
input                               reset_haltreq_valid_i               ,
output [PC_WIDTH-1:0]               dpc_o                               ,
input                               dbg_mode_valid_i                    ,      
input                               dbg_mode_write_en_i                 , 
input   [DATA_WIDTH-1:0]            dbg_mode_write_data_i               ,
input   [15:0]                      dbg_mode_csr_addr_i                 ,
input                               dbg_mode_read_en_i                  ,
output  [DATA_WIDTH-1:0]            dbg_mode_read_data_o                ,
output                              dbg_csr_read_valid_o                ,
input                               dbg_ndm_reset_i                     ,
input                               dbg_hart_reset_i                    ,
input [PC_WIDTH-1:0]                branch_pc_i                         







);
wire dbg_mode_csr_read_en_w;
assign dbg_mode_csr_read_en_w = dbg_mode_csr_addr_i[12] ? 1'b0 : dbg_mode_read_en_i ;
wire [DATA_WIDTH-1:0] mcounter_inhibit;
wire [DATA_WIDTH-1:0] mvendorid		;	
wire [DATA_WIDTH-1:0] marchid  		;     
wire [DATA_WIDTH-1:0] mimpid   		;     
wire [DATA_WIDTH-1:0] mhartid  		;     
wire [DATA_WIDTH-1:0] mstatus 		;     
wire [DATA_WIDTH-1:0] misa		;     
wire [DATA_WIDTH-1:0] medeleg  		;     
wire [DATA_WIDTH-1:0] mideleg  		;     
wire [DATA_WIDTH-1:0] mie 		;     
//wire [DATA_WIDTH-1:0] mtvec		;	
wire [DATA_WIDTH-1:0] mcounter 		;     
wire [DATA_WIDTH-1:0] mscratch 		;	
wire [DATA_WIDTH-1:0] mepc 		;
wire [DATA_WIDTH-1:0] mcause   		;	
wire [DATA_WIDTH-1:0] mtval    		;	
wire [DATA_WIDTH-1:0] mip 		;
wire [DATA_WIDTH-1:0] mcycle		;		
wire [DATA_WIDTH-1:0] minstret 		;
wire [DATA_WIDTH-1:0] mhpm_counter3	;
wire [DATA_WIDTH-1:0] mhpm_counter4	;
wire [DATA_WIDTH-1:0] mhpm_counter5	;
wire [DATA_WIDTH-1:0] mhpm_counter6	;
wire [DATA_WIDTH-1:0] mhpm_counter7	;
wire [DATA_WIDTH-1:0] mhpm_counter8	;
wire [DATA_WIDTH-1:0] mhpm_counter9	;
wire [DATA_WIDTH-1:0] mhpm_counter10	;
wire [DATA_WIDTH-1:0] mhpm_counter11	;
wire [DATA_WIDTH-1:0] mhpm_counter12	;
wire [DATA_WIDTH-1:0] mhpm_counter13	;
wire [DATA_WIDTH-1:0] mhpm_counter14	;
wire [DATA_WIDTH-1:0] mhpm_counter15	;
wire [DATA_WIDTH-1:0] mhpm_counter16	;
wire [DATA_WIDTH-1:0] mhpm_counter17	;
wire [DATA_WIDTH-1:0] mhpm_counter18	;
wire [DATA_WIDTH-1:0] mhpm_counter19	;
wire [DATA_WIDTH-1:0] mhpm_counter20	;
wire [DATA_WIDTH-1:0] mhpm_counter21	;
wire [DATA_WIDTH-1:0] mhpm_counter22	;
wire [DATA_WIDTH-1:0] mhpm_counter23	;
wire [DATA_WIDTH-1:0] mhpm_counter24	;
wire [DATA_WIDTH-1:0] mhpm_counter25	;
wire [DATA_WIDTH-1:0] mhpm_counter26	;
wire [DATA_WIDTH-1:0] mhpm_counter27	;
wire [DATA_WIDTH-1:0] mhpm_counter28	;
wire [DATA_WIDTH-1:0] mhpm_counter29	;
wire [DATA_WIDTH-1:0] mhpm_counter30	;
wire [DATA_WIDTH-1:0] mhpm_counter31	;
wire [DATA_WIDTH-1:0] mhpm_event3;     
wire [DATA_WIDTH-1:0] mhpm_event4;
wire [DATA_WIDTH-1:0] mhpm_event5;
wire [DATA_WIDTH-1:0] mhpm_event6;
wire [DATA_WIDTH-1:0] mhpm_event7;
wire [DATA_WIDTH-1:0] mhpm_event8;
wire [DATA_WIDTH-1:0] mhpm_event9;
wire [DATA_WIDTH-1:0] mhpm_event10;
wire [DATA_WIDTH-1:0] mhpm_event11;
wire [DATA_WIDTH-1:0] mhpm_event12;
wire [DATA_WIDTH-1:0] mhpm_event13;
wire [DATA_WIDTH-1:0] mhpm_event14;
wire [DATA_WIDTH-1:0] mhpm_event15;
wire [DATA_WIDTH-1:0] mhpm_event16;
wire [DATA_WIDTH-1:0] mhpm_event17;
wire [DATA_WIDTH-1:0] mhpm_event18;
wire [DATA_WIDTH-1:0] mhpm_event19;
wire [DATA_WIDTH-1:0] mhpm_event20;
wire [DATA_WIDTH-1:0] mhpm_event21;
wire [DATA_WIDTH-1:0] mhpm_event22;
wire [DATA_WIDTH-1:0] mhpm_event23;
wire [DATA_WIDTH-1:0] mhpm_event24;
wire [DATA_WIDTH-1:0] mhpm_event25;
wire [DATA_WIDTH-1:0] mhpm_event26;
wire [DATA_WIDTH-1:0] mhpm_event27;
wire [DATA_WIDTH-1:0] mhpm_event28;
wire [DATA_WIDTH-1:0] mhpm_event29;
wire [DATA_WIDTH-1:0] mhpm_event30;
wire [DATA_WIDTH-1:0] mhpm_event31;
//wire [DATA_WIDTH-1:0] data_mem_max_addr_w;
wire [DATA_WIDTH-1:0] zic_base_addr_w;
wire [DATA_WIDTH-1:0] interrupt_active_level_priority_w;
assign interrupt_active_level_priority_o = interrupt_active_level_priority_w[7:0] ;
assign csr_mcause_o = mcause[7:0];

wire [DATA_WIDTH-1:0] dcsr_w  ;
//wire [INSTRUCTION_WIDTH-1:0] dpc_w   ;

////csr read mux
csr_read_mux 
#(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)

csr_read_mux_inst
(
.clk_i			(csr_clk		),
.rst_i			(csr_rst		),
.csr_read_en		(csr_read_en_in		),
.csr_read_addr		(csr_addr_in		),
.csr_reg_read_data 	(csr_read_data_o	),//to register file
.mcounter_inhibit_i	(mcounter_inhibit	),
.mvendorid_i		(mvendorid		),	//Vendor ID.	
.marchid_i		(marchid  		), 	//Architecture ID.       
.mimpid_i		(mimpid   		), 	//Implementation ID.       
.mhartid_i		(mhartid  		), 	//Hardware thread ID.       
.mstatus_i		(mstatus 		),	//Machine status register.	
.misa_i			(misa			),	//ISA and extensions	
.medeleg_i		(medeleg  		),	//Machine exception delegation register.	
.mideleg_i		(mideleg  		),	//Machine interrupt delegation register.	
.mie_i 			(mie 			),	//Machinterrupt-enable register.ine		
.mtvec_i		(csr_mtvec_o		),	//Machine trap-handler base address.	
.mcounter_i		(mcounter 		),	//Machine counter enable.	
.mscratch_i 		(mscratch 		),	//Scratch register for machine trap handlers.
.mepc_i 		(mepc 			),	//Machine exception program counter.
.mcause_i 		(mcause   		),	//Machine trap cause.
.mtval_i 		(mtval    		),	//Machine bad address or instruction.
.mip_i 			(mip 			),
.mcycle			(mcycle			),		
.minstret 		(minstret 		),	
.zic_base_addr_i	(zic_base_addr_w	),
.mhpm_counter3		(mhpm_counter3		),		
.mhpm_counter4		(mhpm_counter4		),		
.mhpm_counter5		(mhpm_counter5		),		
.mhpm_counter6		(mhpm_counter6		),		
.mhpm_counter7		(mhpm_counter7		),		
.mhpm_counter8		(mhpm_counter8		),
.mhpm_counter9		(mhpm_counter9		),
.mhpm_counter10		(mhpm_counter10		),
.mhpm_counter11		(mhpm_counter11		),
.mhpm_counter12		(mhpm_counter12		),
.mhpm_counter13		(mhpm_counter13		),
.mhpm_counter14		(mhpm_counter14		),
.mhpm_counter15		(mhpm_counter15		),
.mhpm_counter16		(mhpm_counter16		),
.mhpm_counter17		(mhpm_counter17		),
.mhpm_counter18		(mhpm_counter18		),
.mhpm_counter19		(mhpm_counter19		),
.mhpm_counter20		(mhpm_counter20		),
.mhpm_counter21		(mhpm_counter21		),
.mhpm_counter22		(mhpm_counter22		),
.mhpm_counter23		(mhpm_counter23		),
.mhpm_counter24		(mhpm_counter24		),
.mhpm_counter25		(mhpm_counter25		),
.mhpm_counter26		(mhpm_counter26		),
.mhpm_counter27		(mhpm_counter27		),
.mhpm_counter28		(mhpm_counter28		),
.mhpm_counter29		(mhpm_counter29		),
.mhpm_counter30		(mhpm_counter30		),
.mhpm_counter31		(mhpm_counter31		),
.mhpm_event3_i (mhpm_event3 ),     
.mhpm_event4_i (mhpm_event4 ),
.mhpm_event5_i (mhpm_event5 ),
.mhpm_event6_i (mhpm_event6 ),
.mhpm_event7_i (mhpm_event7 ),
.mhpm_event8_i (mhpm_event8 ),
.mhpm_event9_i (mhpm_event9 ),
.mhpm_event10_i(mhpm_event10),
.mhpm_event11_i(mhpm_event11),
.mhpm_event12_i(mhpm_event12),
.mhpm_event13_i(mhpm_event13),
.mhpm_event14_i(mhpm_event14),
.mhpm_event15_i(mhpm_event15),
.mhpm_event16_i(mhpm_event16),
.mhpm_event17_i(mhpm_event17),
.mhpm_event18_i(mhpm_event18),
.mhpm_event19_i(mhpm_event19),
.mhpm_event20_i(mhpm_event20),
.mhpm_event21_i(mhpm_event21),
.mhpm_event22_i(mhpm_event22),
.mhpm_event23_i(mhpm_event23),
.mhpm_event24_i(mhpm_event24),
.mhpm_event25_i(mhpm_event25),
.mhpm_event26_i(mhpm_event26),
.mhpm_event27_i(mhpm_event27),
.mhpm_event28_i(mhpm_event28),
.mhpm_event29_i(mhpm_event29),
.mhpm_event30_i(mhpm_event30),
.mhpm_event31_i(mhpm_event31),
.interrupt_active_level_priority_i(interrupt_active_level_priority_w),
.data_mem_max_addr_i(data_mem_max_addr_o),
.dcsr_i         (dcsr_w),
.dpc_i          (dpc_o ),
.dbg_mode_valid_i                   (dbg_mode_valid_i),
.dbg_mode_csr_addr_i                (dbg_mode_csr_addr_i),
.dbg_mode_read_en_i                 (dbg_mode_csr_read_en_w),
.dbg_mode_read_data_o               (dbg_mode_read_data_o),
.csr_dbg_read_valid_o               (dbg_csr_read_valid_o)

);



//csr register file


csr_register_file 
#(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)

csr_register_file_inst
(
.csr_clk		(csr_clk		),
.csr_rst		(csr_rst		),
.wdt_reset_i    (wdt_reset_i    ),
.mret_valid_i   (mret_valid_i),
.csr_write_en		(csr_write_en_in	),
.csr_addr		(csr_addr_in		),
.csr_write_data		(csr_write_data_in	),
.csr_set_bit		(csr_set_bit_in		),
.csr_clear_bit		(csr_clear_bit_in	),
.interrupt_valid 	(interrupt_valid_in 	),
.interrupt_code		(interrupt_code_in	),
.exception_valid 	(exception_valid_in 	),
.exception_code		(exception_code_in	),
 .csr_mepc_write_valid	(csr_mepc_write_valid	),	
 .csr_mepc_in		(csr_mepc_in		),	
  .csr_mepc_o		(csr_mepc_o		),	
.ld_sd_misalign_valid	(ld_sd_misalign_valid_in),
.ld_sd_misalign_addr	(ld_sd_misalign_addr_in ),
.instr_misalign_valid	(instr_misalign_valid_in),
.instr_misalign_addr	(instr_misalign_addr_in ),
.invalid_instr_valid	(invalid_instr_valid_in	),
.invalid_instruction	(invalid_instruction_in	),
.interrupt_lvl_pr_i	(interrupt_lvl_pr_i)	,//from zic
.interrupt_active_level_priority_o(interrupt_active_level_priority_w),
.exception_id_write_valid_i(exception_id_write_valid_i),
.interrupt_id_write_valid_i(interrupt_id_write_valid_i),
.pc			(pc_in			),
.mie_set  		(mie_set		),
.mie_clear		(mie_clear		),
.mvendorid_o		(mvendorid		),	
.marchid_o  		(marchid  		),     
.mimpid_o   		(mimpid   		),     
.mhartid_o  		(mhartid  		),     
.mstatus_o  		(mstatus 		),    
.mstatus_mie_o		(mstatus_mie_o		),
.misa_o	   		(misa			),     
.medeleg_o  		(medeleg  		),     
.mideleg_o  		(mideleg  		),     
.mie_o 	   		(mie 			),     
.mtvec_o	   	(csr_mtvec_o		),	
.mcounter_o 		(mcounter 		),     
.mscratch_o 		(mscratch 		),	
.mepc_o 	   	(mepc 			),
.mcause_o   		(mcause   		),	
.mtval_o    		(mtval    		),	
.mip_o 			(mip 			),
.mcounter_inhibit_o 	(mcounter_inhibit	),
.zic_base_addr_o	(zic_base_addr_w),
.mcycle_o		(mcycle	       		),
.minstret_o		(minstret      		),
.mhpm_counter3_o 	(mhpm_counter3 		),
.mhpm_counter4_o 	(mhpm_counter4 		),
.mhpm_counter5_o 	(mhpm_counter5 		),
.mhpm_counter6_o 	(mhpm_counter6 		),
.mhpm_counter7_o 	(mhpm_counter7 		),
.mhpm_counter8_o 	(mhpm_counter8 		),
.mhpm_counter9_o 	(mhpm_counter9 		),
.mhpm_counter10_o	(mhpm_counter10		),
.mhpm_counter11_o	(mhpm_counter11		),
.mhpm_counter12_o	(mhpm_counter12		),
.mhpm_counter13_o	(mhpm_counter13		),
.mhpm_counter14_o	(mhpm_counter14		),
.mhpm_counter15_o	(mhpm_counter15		),
.mhpm_counter16_o	(mhpm_counter16		),
.mhpm_counter17_o	(mhpm_counter17		),
.mhpm_counter18_o	(mhpm_counter18		),
.mhpm_counter19_o	(mhpm_counter19		),
.mhpm_counter20_o	(mhpm_counter20		),
.mhpm_counter21_o	(mhpm_counter21		),
.mhpm_counter22_o	(mhpm_counter22		),
.mhpm_counter23_o	(mhpm_counter23		),
.mhpm_counter24_o	(mhpm_counter24		),
.mhpm_counter25_o	(mhpm_counter25		),
.mhpm_counter26_o	(mhpm_counter26		),
.mhpm_counter27_o	(mhpm_counter27		),
.mhpm_counter28_o	(mhpm_counter28		),
.mhpm_counter29_o	(mhpm_counter29		),
.mhpm_counter30_o	(mhpm_counter30		),
.mhpm_counter31_o	(mhpm_counter31		),
.mhpm_event3_o (mhpm_event3 ),     
.mhpm_event4_o (mhpm_event4 ),
.mhpm_event5_o (mhpm_event5 ),
.mhpm_event6_o (mhpm_event6 ),
.mhpm_event7_o (mhpm_event7 ),
.mhpm_event8_o (mhpm_event8 ),
.mhpm_event9_o (mhpm_event9 ),
.mhpm_event10_o(mhpm_event10),
.mhpm_event11_o(mhpm_event11),
.mhpm_event12_o(mhpm_event12),
.mhpm_event13_o(mhpm_event13),
.mhpm_event14_o(mhpm_event14),
.mhpm_event15_o(mhpm_event15),
.mhpm_event16_o(mhpm_event16),
.mhpm_event17_o(mhpm_event17),
.mhpm_event18_o(mhpm_event18),
.mhpm_event19_o(mhpm_event19),
.mhpm_event20_o(mhpm_event20),
.mhpm_event21_o(mhpm_event21),
.mhpm_event22_o(mhpm_event22),
.mhpm_event23_o(mhpm_event23),
.mhpm_event24_o(mhpm_event24),
.mhpm_event25_o(mhpm_event25),
.mhpm_event26_o(mhpm_event26),
.mhpm_event27_o(mhpm_event27),
.mhpm_event28_o(mhpm_event28),
.mhpm_event29_o(mhpm_event29),
.mhpm_event30_o(mhpm_event30),
.mhpm_event31_o(mhpm_event31),
.data_mem_max_addr_o(data_mem_max_addr_o),
.trap_valid_i	(trap_valid_i  ),
.stall_valid_i	(stall_valid_i ),
.branch_valid_i	(branch_valid_i),
.ebreak_valid_i          (ebreak_valid_i        ),
.trigger_valid_i         (trigger_valid_i       ),
.haltreq_valid_i         (haltreq_valid_i       ),
.single_step_valid_i     (single_step_valid_i   ),
.reset_haltreq_valid_i   (reset_haltreq_valid_i ),
.dcsr_o                  (dcsr_w                ),
.dpc_o                   (dpc_o                 ),
.dbg_csr_write_en_i      (dbg_mode_write_en_i    ),
.dbg_csr_addr_i          (dbg_mode_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_mode_write_data_i  ),
.debug_mode_valid_i      (dbg_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      ),
.branch_pc_i            (branch_pc_i)

);
endmodule
