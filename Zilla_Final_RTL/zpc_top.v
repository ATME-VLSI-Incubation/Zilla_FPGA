`define ZILLA_32_BIT 
`timescale 1ns / 1ps
module zpc_top
#(
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
input 			                z_clk				        ,
input 			                z_rst				        ,
input 			                csr_mstatus_mie_i		    ,//from CSR to fsm
input 			                zic_int_req_i			    ,//from zic to fsm
input 			                stall_valid_i			    ,//from load hazard control block to fsm and pc update
input 			                mret_valid_i			    ,//from decoder to fsm
input   [7 :0]                  zic_mmr_ack_id_i		    ,//from zic_mmr	
input   [DATA_WIDTH-1:0]	    csr_mtvec_i			        ,//from mepc CSR
input   [PC_WIDTH-1:0]          csr_mepc_i			        ,//from mtvec CSR
input                           branch_valid_i          	,//from branch condition chk block
input   [PC_WIDTH-1:0]          branch_pc_i             	,//from branch condition chk block
input   [INSTRUCTION_WIDTH-1:0] z_instruction_i	        	,//////////from instruction memory
input 	                        invalid_instr_valid_i		,//from decode		
input 	                        breakpoint_valid_i		    ,//from decode / debug
input   [7:0]		            csr_mcause_id_i			    ,
input 			                ecall_valid_i			    ,//from decode / debug
input   [DATA_WIDTH-1:0] 	    ld_sd_addr_i			    ,//from load - store addr calc
input 			                ld_valid_i			        ,//from load store addr calc
input 			                sd_valid_i			        ,//from load - store addr calc
input 	[1:0] 	                byte_sel_i			        ,//from load - store addr calc
input 	[DATA_WIDTH-1:0]		data_mem_max_addr_i	    	,
output	[PC_WIDTH-1:0]          csr_mepc_o	        	    ,//to CSR
output 	[PC_WIDTH-1:0]          instr_read_addr_o       	,//////////to instruction memory
output  		                csr_mstatus_mie_set_o   	,//to CSR
output  		                csr_mstatus_mie_clear_o		,//to CSR
output 			                csr_mepc_write_valid_o		,//to CSR
output			                zic_mmr_ack_read_valid_o	,//to zic mmr
output 			                zic_mmr_eoi_write_valid_o	,//to zic mmr
output 	[INSTRUCTION_WIDTH-1:0] z_instruction_o			    ,///////////to decoder
output 	[7:0]                   zic_mmr_eoi_id_o		    ,//to zic mmr
output 			                z_instruction_read_enable_o , //from pc updte to instr memory
output 			                exception_valid_o		    ,
output	[7:0]		            exception_id_o			    ,
output			                interrupt_valid_o		    ,
output			                exception_id_write_valid_o	,
output reg 		                interrupt_id_write_valid_o	,
output 			                ld_sd_misalign_valid_o  	,
output  [DATA_WIDTH-1:0] 		ld_sd_misalign_addr_o		,
output 			                instr_misalign_valid_o  	,
output  [PC_WIDTH-1:0] 		    instr_misalign_addr_o		,
output 			                invalid_instr_valid_o		,
output          	            decode_instruction_valid_o  ,
output                          trap_valid_o                ,
//debug ports
input                           dbg_hartreset_i	            ,     
input                           dbg_haltreq_i	            ,
input                           dbg_resumereq_i	            ,
input                           dbg_ndmrst_i                ,
input                           dbg_setresethaltreq_i       ,
//input                           ebreak_valid_i          ,
//output                          hart_halt_valid_o       ,
//output                          debug_mode_valid_o      ,
output                          hart_resume_valid_o         ,
input  [PC_WIDTH-1:0]           dpc_csr_i                   ,
output                          debug_mode_valid_o          ,
input                           resethaltreq_i              ,
input           debug_mem_read_enable         , 
input           debug_mem_write_enable        , 
input [DATA_WIDTH-1:0]           debug_mem_read_addr           , 
input [DATA_WIDTH-1:0]          debug_mem_write_addr       ,
input [(DATA_WIDTH>>3)-1:0] debug_mem_strobe,
output debug_exception_valid_o,
input mem_addr_invalid_i,
input wdt_reset_i







);
wire debug_mode_valid_w;

wire [2:0] 	zpc_pc_ctrl_w	;
wire 		trap_valid_w	;
wire 		flush_valid_w	;
//wire 		exception_valid_w;
	wire [DATA_WIDTH-1:0] 	exception_handler_addr_w;
//wire 		interrupt_valid_w;

wire 		z_instruction_valid_w;
reg 		z_instruction_valid_r ;
assign trap_valid_o = trap_valid_w;
always@(posedge z_clk or negedge z_rst)
begin
	if(!z_rst)
	begin
		z_instruction_valid_r <= 1'b0;
		interrupt_id_write_valid_o <= 1'b0	;
	end
	else
	begin
		z_instruction_valid_r <= z_instruction_read_enable_o;
		interrupt_id_write_valid_o <= interrupt_valid_o	;
	end
end
assign exception_id_write_valid_o = exception_valid_o	;
//assign z_instruction_valid_w = (stall_valid_i | branch_valid_i) ? 1'b0 : z_instruction_read_enable_o;
//assign z_instruction_valid_w = z_instruction_read_enable_o;

//assign debug_mode_valid_o = debug_mode_valid_w;

zilla_instruction_buffer 
#(
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)

zilla_instruction_buffer_inst
(
.z_clk				(z_clk				),
.z_rst				(z_rst				),
.wdt_reset_i        (wdt_reset_i        ),
.z_instruction_valid_i		(z_instruction_valid_w		),//from pc update 
.flush_valid_i			(flush_valid_w			),//from program control fsm
.stall_valid_i			(stall_valid_i			),//from load - hazard control block
.branch_valid_i			(branch_valid_i			),//from branch condition check
.z_instruction_i		(z_instruction_i		),//from instruction memory
.z_instruction_o		(z_instruction_o		), //to decoder
.trap_valid_i			(trap_valid_w			),
.decode_instruction_valid(decode_instruction_valid_o),
.mret_valid_i           (mret_valid_i           ),
.debug_mode_valid_i     (debug_mode_valid_o     ),
.dbg_hartreset_i(dbg_hartreset_i),
.dbg_ndmrst_i(dbg_ndmrst_i),
.dbg_haltreq_i          (dbg_haltreq_i)

//.read_write_ptr_valid();

);
zilla_pc_update 
#(
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)

zilla_pc_update_inst
(
.z_clk				    (z_clk				),
.z_rst				    (z_rst				),
.wdt_reset_i        (wdt_reset_i        ),
.zpc_pc_ctrl_i			(zpc_pc_ctrl_w			),//from fsm
.ack_interrupt_id_i		(zic_mmr_ack_id_i		),//from zic mmr
.csr_mtvec_i			(csr_mtvec_i			),//from csr
.trap_valid_i			(trap_valid_w			),//from fsm
.branch_valid_i			(branch_valid_i			),
.branch_pc_i    		(branch_pc_i			),
.stall_valid_i          (stall_valid_i          ),
.csr_mepc_i			    (csr_mepc_i			),//from csr
.csr_mepc_o			    (csr_mepc_o			),//to csr
.instr_read_addr_o 		(instr_read_addr_o		), //to instruction memory
.z_instruction_read_enable_o	(z_instruction_read_enable_o	),
.interrupt_valid_i		(interrupt_valid_o		),
.exception_valid_i		(exception_valid_o		),
.exception_handler_addr_i	(exception_handler_addr_w	),
.read_write_ptr_valid   (z_instruction_valid_w),
.dpc_i                  (dpc_csr_i              ),
.debug_mode_valid_i    (debug_mode_valid_o     ),
.dbg_hartreset_i(dbg_hartreset_i),
.dbg_ndmrst_i(dbg_ndmrst_i),
.dbg_haltreq_i      (dbg_haltreq_i)

//.dpc_o                  (dpc_csr_o              )

);
//wire [PC_WIDTH-1:0] dpc_csr_o;
zilla_program_control_fsm 
#(
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)

zilla_program_control_fsm_inst
(
.zpc_clk			(z_clk				),
.zpc_rst			(z_rst				),
.wdt_reset_i        (wdt_reset_i        ),
.csr_mstatus_mie_i		(csr_mstatus_mie_i		),//from CSR
.zic_int_req_i			(zic_int_req_i			),//from zic
.stall_valid_i			(stall_valid_i			),//from load hazard control block
.mret_valid_i			(mret_valid_i			),//from decoder
.zic_mmr_ack_id_i		(zic_mmr_ack_id_i		),//from zic_mmr
.exception_valid_i		(exception_valid_o		),//from exception detect block
.interrupt_valid_o		(interrupt_valid_o		),//to pc update 
.csr_mstatus_mie_set_o		(csr_mstatus_mie_set_o		),//to CSR
.csr_mstatus_mie_clear_o	(csr_mstatus_mie_clear_o	),//to CSR
.csr_mepc_write_valid_o		(csr_mepc_write_valid_o		),//to CSR
.zic_mmr_ack_read_valid_o	(zic_mmr_ack_read_valid_o	),//to zic mmr
.zic_mmr_eoi_write_valid_o	(zic_mmr_eoi_write_valid_o	),//to zic mmr
.zic_mmr_eoi_id_o		(zic_mmr_eoi_id_o		),//to zic mmr
.zpc_pc_ctrl_o			(zpc_pc_ctrl_w			),
.trap_valid_o			(trap_valid_w			),
.flush_valid_o			(flush_valid_w			),
.mcause_id_i			(csr_mcause_id_i		),
.dbg_hartreset_i	    (dbg_hartreset_i	    ),     
.dbg_haltreq_i	        (dbg_haltreq_i	        ),
.dbg_resumereq_i	    (dbg_resumereq_i	    ),
.dbg_ndmrst_i           (dbg_ndmrst_i           ),
.dbg_setresethaltreq_i  (dbg_setresethaltreq_i  ),
.ebreak_valid_i         (breakpoint_valid_i         ),
.hart_halt_valid_o      (debug_mode_valid_o      ),
.hart_resume_valid_o    (hart_resume_valid_o    ),
.resethaltreq_i(resethaltreq_i)
);

z_exception_detect 
#(
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)

z_exception_detect_inst
(
.z_clk			 	(z_clk				),
.z_rst			 	(z_rst				),
.wdt_reset_i        (wdt_reset_i        ),
.invalid_instr_valid_i	 	(invalid_instr_valid_i		),//from decoder
.breakpoint_valid_i	 	(breakpoint_valid_i		),//from decoder / debug //ebreak
.ecall_valid_i		 	(ecall_valid_i			),//from decoder / debug
.branch_pc_i		 	(branch_pc_i			),//from branch condition check 
.ld_sd_addr_i		 	(ld_sd_addr_i			),//from load store addr gen
.ld_valid_i		 	(ld_valid_i			),//from load store addr gen
.sd_valid_i		 	(sd_valid_i			),//from load store addr gen
.csr_mtvec_i		 	(csr_mtvec_i			),//from mtvec csr
.branch_valid_i		 	(branch_valid_i			),//from branch condition check
.byte_sel_i		 	(byte_sel_i			),//indicates whether the load/store instruction is byte/halfword/word/doubleword
.exception_handler_addr_o	(exception_handler_addr_w	),
.exception_valid_o	 	(exception_valid_o		),
.exception_id_o		 	(exception_id_o			),
.ld_sd_misalign_valid_o		(ld_sd_misalign_valid_o		), 
.ld_sd_misalign_addr_o 		(ld_sd_misalign_addr_o 		), 
.instr_misalign_valid_o		(instr_misalign_valid_o		), 
.instr_misalign_addr_o 		(instr_misalign_addr_o 		), 
.invalid_instr_valid_o 		(invalid_instr_valid_o 		),
.data_mem_max_addr_i		(data_mem_max_addr_i		),
.debug_mode_valid_i         (debug_mode_valid_o),
.stall_valid_i			(stall_valid_i			),
.debug_mem_read_enable         (debug_mem_read_enable ), 
.debug_mem_write_enable        (debug_mem_write_enable), 
.debug_mem_read_addr           (debug_mem_read_addr   ), 
.debug_mem_write_addr          (debug_mem_write_addr  ),
.debug_mem_strobe(debug_mem_strobe),
.debug_exception_valid_o(debug_exception_valid_o),
.mem_addr_invalid_i     (mem_addr_invalid_i)

);

endmodule

