`timescale 1ns / 1ps

`define ZILLA_32_BIT 
`define INSTRUCTION_32_BIT

// company: frenustech private limited
// designer: siddartha hp
// 
//
// ////////////////////////////////////////////////
module riscv_top #(
     `ifdef ZILLA_64_BIT 
        parameter DATA_WIDTH            = 64    ,
     `elsif ZILLA_32_BIT 
        parameter DATA_WIDTH            = 32    ,
      `endif
        parameter PC_WIDTH              = 20    ,
        parameter CSR_ADDR_WIDTH        = 12    ,

      `ifdef INSTRUCTION_32_BIT
          parameter INSTRUCTION_WIDTH   = 32    ,
          parameter OPCODE              = 7     ,
          parameter FUNC3               = 3     ,
          parameter FUNC7               = 7     ,
          parameter GPR_ADDR_WIDTH      = 5     
       `endif
                   )
(
input 		                    risc_clk			    , //gllobal clock
input		               risc_rst_i	        , //global reset
input                          locked                   , //clock valid signal from fpga clock divider block
//output	 	                    data_mem_write_en		, //data memory write enable 
//output  [DATA_WIDTH-1:0] 	    data_mem_write_data		, //data memory write address
//output 		                    data_mem_read_en		, //data memory read enable
//output  [DATA_WIDTH-1:0]        data_mem_read_addr		, //data memory read address
//input	[DATA_WIDTH-1:0]        data_mem_read_data		, //data memory read data
//output  [(DATA_WIDTH>>3)-1:0] 	data_mem_strobe			,

//output		                    carry				    , //carry flag 
//output		                    zero		 		    ,  //zero flag  

output  		            lmb_mem_write_en		,	
output                      lmb_mem_read_en		,
output  [3:0] 	      		lmb_mem_strobe		,
//output  [DATA_WIDTH-1:0] lmb_mem_addr_o		,
output  [DATA_WIDTH-1:0]    lmb_mem_addr_o		,
output  [DATA_WIDTH-1:0]    lmb_mem_write_data	,	
input  [DATA_WIDTH-1:0]     lmb_mem_read_data		,	
input 			       dlmb_ce		        ,
input 			       dlmb_ready	        ,
input 			       dlmb_rst		        ,
input 			       dlmb_ue		        ,
input 			       dlmb_wait	        ,
output 			       dm_addr_strobe	        ,
output  [DATA_WIDTH-1:0] DM_AW_ADDR_OUT ,
output                   DM_AW_VALID_OUT,
input                    DM_AW_READY_IN ,
output  [DATA_WIDTH-1:0] DM_W_DATA_OUT  ,
output  [3:0] DM_W_STRB_OUT  ,
output                   DM_W_VALID_OUT ,
input                    DM_W_READY_IN  ,
input   [1:0]            DM_B_RESP_IN   ,
input                    DM_B_VALID_IN  ,
output                   DM_B_READY_OUT ,
output  [DATA_WIDTH-1:0] DM_AR_ADDR_OUT ,
output                   DM_AR_VALID_OUT,
input                    DM_AR_READY_IN ,
input   [DATA_WIDTH-1:0] DM_R_DATA_IN   ,
input   [1:0]            DM_R_RESP_IN   ,
input                    DM_R_VALID_IN  ,
output                   DM_R_READY_OUT ,
output [2:0] 		 DM_ARPROT	   ,
output [2:0] 		 DM_AWPROT	,
                    
input 		                    ext_int0_i			    ,//external interrupt signals from 0 to 47	  
input 		                    ext_int1_i			    ,	  
input 		                    ext_int2_i			    ,	  
input 		                    ext_int3_i			    ,	  
input 		                    ext_int4_i			    ,	  
input 		                    ext_int5_i			    ,	  
input 		                    ext_int6_i			    ,	  
input 		                    ext_int7_i			    ,	  
input 		                    ext_int8_i			    ,	  
input 		                    ext_int9_i			    ,	  
input 		                    ext_int10_i			    ,	  
//input 		                    ext_int11_i			    ,	  
//input 		                    ext_int12_i			    ,	  
//input 		                    ext_int13_i			    ,	  
//input 		                    ext_int14_i			    ,	  
//input 		                    ext_int15_i			    ,	  
//input 		                    ext_int16_i			    ,	  
//input 		                    ext_int17_i			    ,	  
//input 		                    ext_int18_i			    ,	  
//input 		                    ext_int19_i			    ,	  
//input 		                    ext_int20_i			    ,	  
//input 		                    ext_int21_i			    ,	  
//input 		                    ext_int22_i			    ,	  
//input 		                    ext_int23_i			    ,	  
//input 		                    ext_int24_i			    ,	  
//input 		                    ext_int25_i			    ,	  
//input 		                    ext_int26_i			    ,	  
//input 		                    ext_int27_i			    ,	  
//input 		                    ext_int28_i			    ,	  
//input 		                    ext_int29_i			    ,	  
//input 		                    ext_int30_i			    ,	  
//input 		                    ext_int31_i			    ,	  
//input 		                    ext_int32_i			    ,	  
//input 		                    ext_int33_i			    ,	  
//input 		                    ext_int34_i			    ,	  
//input 		                    ext_int35_i			    ,	  
//input 		                    ext_int36_i			    ,	  
//input 		                    ext_int37_i			    ,	  
//input 		                    ext_int38_i			    ,	  
//input 		                    ext_int39_i			    ,	  
//input 		                    ext_int40_i			    ,	  
//input 		                    ext_int41_i			    ,	  
//input 		                    ext_int42_i			    ,	  
//input 		                    ext_int43_i			    ,	  
//input 		                    ext_int44_i			    ,	  
//input 		                    ext_int45_i			    ,	  
//input 		                    ext_int46_i			    ,
output 		                    ret_func_valid		    , //return function valid signal for testbench purpose
input                           TCK            			, // Test Clock Input: JTAG
input                           TRST           			, // Test Reset Input: asynch active low reset
input                           TMS          			, // Test Mode Select Input
input                           TDI            			, // Test Data Input
output                          TDO            			, // Test Data Output
output                          tdo_en         			 , // TDO output enable: this flag is high when state is in Shift_IR | Shift_DR
/////////////instruction memory access ports/////////////////////////
output 			               z_im_write_en_o		    ,
output [DATA_WIDTH-1     :0]   z_instruction_addr_o	    ,
output [DATA_WIDTH-1     :0]   z_im_write_data_o	    ,
output [(DATA_WIDTH>>3)-1:0]   z_im_write_data_strobe_o	,
output 			               z_im_read_en_o		    ,
input  [DATA_WIDTH-1     :0]   z_im_read_data_i         ,
input 			               ilmb_ce		            ,
input 			               ilmb_ready	            ,
input 			               ilmb_rst		            ,
input 			               ilmb_ue		            ,
input 			               ilmb_wait	            ,
output 			               im_addr_strobe	     ,
output  [DATA_WIDTH-1:0] uart_mem_read_data,
output [DATA_WIDTH-1:0] 	    gpr_a4_out,			
output [DATA_WIDTH-1:0] 	    gpr_a5_out		,
output [DATA_WIDTH-1       :0]	reg_write_data	,
output [19:0] 				pc_out,
output  [INSTRUCTION_WIDTH-1:0] 	de_instruction_w	 ,
output [DATA_WIDTH-1       :0] 	mem_out		,
//output [GPR_ADDR_WIDTH-1   :0] 	rd			        ,
output [GPR_ADDR_WIDTH-1   :0] 	mem_wb_rd,		    
output [DATA_WIDTH-1:0] 	    gpr_a0_out		,
output [4:0] 		uart_rd		,
output		uart_rd_valid	,
output mem_wb_reg_wr_en,
output  		                    mem_rd_en		,    
output  		                    id_ex_mem_rd_en	,	
output  		                    ex_mem_mem_rd_en,	
output  		                    mem_wb_mem_rd_en,
output 		                    reg_wr_en		    ,
output  		                    id_ex_reg_wr_en 	,
output  		                    ex_mem_reg_wr_en 	,
output                              uart_valid,
output                          r_ex_mem_reg_wr_en,
output                          uart_mem_read_en,
output stall_pipeline,
output stall_en,
output uart_read_stall








//output  [DATA_WIDTH-1:0] 	    data_mem_write_addr		, //data memory write address
////////////////ports for ILA FPGA ///////////////////////
/*output  [INSTRUCTION_WIDTH-1:0] 	if_instruction_w	            ,//from instruction memory to program control
output  [INSTRUCTION_WIDTH-1:0] 	de_instruction_w	            ,//from program control block to decode
output [19:0] 				pc_out,
output [PC_WIDTH-1         :0]    dpc_w       ,
output [7:0] 	                    exception_id_w				,
output exception_valid_w		,
output invalid_instr_valid_w,
output interrupt_valid_w*/
/*output dbg_halt_req_w,
output dbg_resume_req_w,
output [DATA_WIDTH-1:0]       data_mem_addr_o	   ,
output [DATA_WIDTH-1:0] dmcontrol_reg		,
output 		[DATA_WIDTH-1:0] dmstatus_reg		    ,	// Debug module status register
output 		[DATA_WIDTH-1:0] abstractcs_reg		    ,	// Abstract command and status register
output 		[31:0]           command_reg	,
output  [DATA_WIDTH-1     :0]     debug_mem_read_data             , 
output                            debug_mem_read_enable           ,
output [DATA_WIDTH-1      :0]     debug_mem_read_addr        ,
output                            debug_mem_write_enable          , 
output [DATA_WIDTH-1      :0]     debug_mem_write_addr             ,
output [DATA_WIDTH-1      :0]     debug_mem_write_data             ,
output [(DATA_WIDTH>>3)-1 :0]     debug_mem_strobe               ,
output                            debug_mem_read_valid   */         








/*output [DATA_WIDTH-1:0] 	    gpr_15_out		,
output [DATA_WIDTH-1:0] 	    gpr_a0_out,			
output [DATA_WIDTH-1:0] 	    gpr_a1_out,			
output [DATA_WIDTH-1:0] 	    gpr_a2_out,			
output [DATA_WIDTH-1:0] 	    gpr_a3_out,			
output [DATA_WIDTH-1:0] 	    gpr_a4_out,			
output [DATA_WIDTH-1:0] 	    gpr_a5_out,			
output [DATA_WIDTH-1:0] 	    gpr_s0_out,			
output [DATA_WIDTH-1:0] 	    gpr_ra_out,			
output [DATA_WIDTH-1:0] 	    gpr_sp_out,
output [DATA_WIDTH-1:0] 	    gpr_t0_out,			
output [DATA_WIDTH-1:0] 	    gpr_t1_out,			
output [DATA_WIDTH-1:0] 	    gpr_t2_out,
output [DATA_WIDTH-1:0] 	    gpr_t3_out,
output [DATA_WIDTH-1:0] 	    gpr_t4_out*/






);

///////////////////////////////////////////////////////////////////////////////////
wire  [INSTRUCTION_WIDTH-1:0] 	if_instruction_w	            ;//from instruction memory to program control
//wire  [INSTRUCTION_WIDTH-1:0] 	de_instruction_w	            ;//from program control block to decode
//wire [19:0] 				pc_out;
wire [PC_WIDTH-1         :0]    dpc_w       ;
wire [7:0] 	                    exception_id_w				;
wire exception_valid_w		;
wire invalid_instr_valid_w;
wire interrupt_valid_w;
wire dbg_halt_req_w;
wire dbg_resume_req_w;
wire [DATA_WIDTH-1:0]       data_mem_addr_o	   ;
wire [DATA_WIDTH-1:0] dmcontrol_reg		;
wire 		[DATA_WIDTH-1:0] dmstatus_reg		    ;	// Debug module status register
wire 		[DATA_WIDTH-1:0] abstractcs_reg		    ;	// Abstract command and status register
wire 		[31:0]           command_reg	;
wire  [DATA_WIDTH-1     :0]     debug_mem_read_data            ;
wire                            debug_mem_read_enable          ;
wire [DATA_WIDTH-1      :0]     debug_mem_read_addr        ;
wire                            debug_mem_write_enable          ;
wire [DATA_WIDTH-1      :0]     debug_mem_write_addr             ;
wire [DATA_WIDTH-1      :0]     debug_mem_write_data             ;
wire [(DATA_WIDTH>>3)-1 :0]     debug_mem_strobe              ;
wire                            debug_mem_read_valid   ;         
wire  [DATA_WIDTH-1:0] 	    data_mem_write_addr	;
//////////////////////////////////////////////////////////////
wire [31:0]                       product_out       ;
wire                              product_valid_o   ;
wire [31:0]                       mult_op1          ;
wire [31:0]                       mult_op2          ;
wire                              mult_en_r2        ;
wire  [DATA_WIDTH-1       :0] 	ld_sd_addr		 ;


/////////////////////////////////////////////////////////////////////////////////
wire [DATA_WIDTH-1:0]        data_mem_read_addr		;
wire [DATA_WIDTH-1:0] 	    gpr_15_out;
//wire [DATA_WIDTH-1:0] 	    gpr_a0_out;			
wire [DATA_WIDTH-1:0] 	    gpr_a1_out;			
wire [DATA_WIDTH-1:0] 	    gpr_a2_out;			
wire [DATA_WIDTH-1:0] 	    gpr_a3_out;			
//wire [DATA_WIDTH-1:0] 	    gpr_a4_out;			
//wire [DATA_WIDTH-1:0] 	    gpr_a5_out;			
wire [DATA_WIDTH-1:0] 	    gpr_s0_out;			
wire [DATA_WIDTH-1:0] 	    gpr_ra_out;			
wire [DATA_WIDTH-1:0] 	    gpr_sp_out;
wire [DATA_WIDTH-1:0] 	    gpr_t0_out;			
wire [DATA_WIDTH-1:0] 	    gpr_t1_out;			
wire [DATA_WIDTH-1:0] 	    gpr_t2_out;
wire [DATA_WIDTH-1:0] 	    gpr_t3_out;
wire [DATA_WIDTH-1:0] 	    gpr_t4_out;

////////////////////////////////////////////////////////////////////////////////////////////

wire  	               	    data_mem_write_en               ; //data memory write enable 
//wire [DATA_WIDTH-1:0]       data_mem_addr_o	       ; //data memory write address
wire [DATA_WIDTH-1:0]       data_mem_write_data        ; //data memory write address
wire 	               	    data_mem_read_en	               ; //data memory read enable
wire [DATA_WIDTH-1:0]       data_mem_read_data         ; //data memory read data
wire [(DATA_WIDTH>>3)-1:0]  data_mem_strobe	       ;

wire 		      uart_mem_write_en		;	
//wire                  uart_mem_read_en		;
wire [3:0] 	      uart_mem_strobe		;
wire [DATA_WIDTH-1:0] uart_mem_addr_o		;
//wire [DATA_WIDTH-1:0] uart_mem_addr_o		;
wire [DATA_WIDTH-1:0] uart_mem_write_data	;	
//wire [DATA_WIDTH-1:0] uart_mem_read_data	;
//wire [4:0] 		uart_rd		;
//wire 			uart_rd_valid	;
wire [DATA_WIDTH-1:0] 	uart_data	;


wire risc_rst;
wire z_im_write_en_w		;
wire [DATA_WIDTH-1:0]z_im_write_addr_w		;
wire [DATA_WIDTH-1:0] z_im_write_data_w		;

wire div_rem_valid_w;
wire risc_rst_r;
wire [11:0] 	                alu_ctrl		    ; //to alu 
wire [DATA_WIDTH-1       :0] 	imm_val			    ; //to alu
wire [DATA_WIDTH-1       :0] 	addr_gen_imm_val	; //to ld/sd addr gen
wire [GPR_ADDR_WIDTH-1   :0] 	rs1			        ; //to reg file
wire [GPR_ADDR_WIDTH-1   :0]	rs2			        ; //to reg file
wire [DATA_WIDTH-1       :0]    target_addr_rs2_data; //conditional branch
wire 		                    branch_en		    ; //conditional branch
wire [OPCODE-1           :0]	opcode			    ; //conditional branch
wire [FUNC3-1            :0]	func3			    ; //conditional branch
wire [INSTRUCTION_WIDTH-1:0] 	instruction		    ;
reg  [INSTRUCTION_WIDTH-1:0] 	if_id_instruction	;
//wire 	    	                stall_pipeline		;
wire [DATA_WIDTH-1       :0] 	reg_write_data_1	;
wire [PC_WIDTH-1         :0]    if_id_pc		    ;
wire [PC_WIDTH-1         :0]    id_ex_pc		    ;
wire [(DATA_WIDTH>>3)-1  :0] 	byte_en			    ;

//////////////////////////////////////////////////////////////////
//		destination register 
//////////////////////////////////////////////////////////////////
//
//
wire [GPR_ADDR_WIDTH-1   :0] 	rd			        ;
wire [GPR_ADDR_WIDTH-1   :0] 	id_ex_rd		    ;
wire [GPR_ADDR_WIDTH-1   :0] 	ex_mem_rd		    ;
//wire [GPR_ADDR_WIDTH-1   :0] 	mem_wb_rd		    ;
//wire 		                    stall_en		    ;//26/05
////////////////////////////////////////////////////////////////
//		register write enable
////////////////////////////////////////////////////////////////
//wire 		                    reg_wr_en		    ;
//wire  		                    id_ex_reg_wr_en 	;
//wire  		                    ex_mem_reg_wr_en 	;
//wire  		                    mem_wb_reg_wr_en 	;
/////////////////////////////////////////////////////////////////
//		memory read enable
/////////////////////////////////////////////////////////////////
//wire  		                    mem_rd_en		    ;
//wire  		                    id_ex_mem_rd_en		;
//wire  		                    ex_mem_mem_rd_en	;
//wire  		                    mem_wb_mem_rd_en	;
/////////////////////////////////////////////////////////////////
//		memory write enable
//////////////////////////////////////////////////////////////////
wire  		                    mem_wr_en		    ;
wire  		                    id_ex_mem_wr_en		;
wire  		                    ex_mem_mem_wr_en	;
wire  		                    mem_wb_mem_wr_en	;
//////////////////////////////////////////////////////////////////
//		load data enable signal 
//////////////////////////////////////////////////////////////////
wire 		                    mem_to_reg_en		;
wire 		                    id_ex_mem_to_reg_en	;
wire 		                    ex_mem_mem_to_reg_en;
wire 		                    mem_wb_mem_to_reg_en;
wire [11:0] 	                alu_ctrl_mem		;
//////////////////////////////////////////////////////////////////
wire [DATA_WIDTH-1       :0] 	addr_gen_rs1_data	            ;// rs1_data_r	to ld/sd addr calc
//wire [DATA_WIDTH-1       :0] 	ld_sd_addr		                ; // to execution stage
wire [DATA_WIDTH-1       :0]	mem_addr		                ; // memory address	
wire [DATA_WIDTH-1       :0]	store_data		                ; // rs2_data_mem_acs; //store instruction data
//wire [DATA_WIDTH-1       :0] 	mem_out			                ; // mem_to_reg_data	; //data read from memory 
reg  [DATA_WIDTH-1       :0]	reg_wr_data		                ; // alu output pipelined in mem access stage
//wire [DATA_WIDTH-1       :0]	reg_write_data		            ;
wire [DATA_WIDTH-1       :0]    rs1_data		                ; // from reg_file to alu
wire [DATA_WIDTH-1       :0]	rs2_data		                ; // from reg_file to alu
wire [DATA_WIDTH-1       :0] 	alu_out			                ; // alu output
wire [1:0 ]	                    forward_a		                ; // forwarding control signal in execution stage
wire [1:0 ]	                    forward_b		                ; // forwarding control signal in memory access stage
wire [DATA_WIDTH-1       :0]	alu_data_in_1		            ;
wire [DATA_WIDTH-1       :0]	alu_data_in_2		            ;
wire [DATA_WIDTH-1       :0] 	alu_to_mux		                ; // alu_out_r;
wire [DATA_WIDTH-1       :0] 	mem_to_mux		                ; // mem_to_reg_data_r;
wire [DATA_WIDTH-1       :0]    store_data_r		            ;
wire 		                    sign_bit		                ;
reg 		                    mem_to_reg_en_r2	            ;
wire [OPCODE-1           :0] 	opcode_r		                ;
wire [DATA_WIDTH-1       :0] 	addr_alu_out		            ;
wire [DATA_WIDTH-1       :0] 	addr_gen_data		            ;
wire [DATA_WIDTH-1       :0] 	target_address		            ;//from branch cond block to instruction memory block
wire [(DATA_WIDTH>>3)-1  :0]	id_ex_byte_en		            ;
wire		                    id_ex_sign_bit  	            ;
wire [(DATA_WIDTH>>3)-1  :0]	ex_mem_byte_en		            ;
wire 		                    ex_mem_sign_bit 	            ;
wire [PC_WIDTH-1         :0] 	pc			                    ;
wire [PC_WIDTH-1         :0] 	branch_pc		                ;
wire 		                    tar_addr_s		                ;
wire 		                    instruction_read_en_w	        ;//from program control to instruction memory
wire [PC_WIDTH-1         :0] 	instruction_read_addr_w         ;//from program control to instruction memory
//wire [INSTRUCTION_WIDTH-1:0] 	if_instruction_w	            ;//from instruction memory to program control
//wire [INSTRUCTION_WIDTH-1:0] 	de_instruction_w	            ;//from program control block to decode
wire 		                    interrupt_request_w	            ;
wire [DATA_WIDTH-1       :0] 	csr_mtvec_w		                ;
wire 		                    mstatus_mie_w		            ;
wire 		                    zic_mmr_ack_read_valid_w	    ;
wire [7:0]	                    zic_mmr_ack_id_w			    ;
wire [7:0] 	                    zic_mmr_eoi_id_o			    ;
//wire [7:0] 	                    exception_id_w				    ;
wire [47:0] 	                global_interrupt_enable_w		;
wire [15:0] 	                zic_mmr_read_addr_w			    ;
wire [15:0] 	                zic_mmr_write_addr_w			;
wire [31:0]	                    zic_mmr_write_data_w			;
wire [31:0] 	                zic_mmr_read_data_w			    ;
wire [7:0] 	                    highest_pending_lvl_pr_w		;
wire [7:0] 	                    interrupt_active_level_priority_w	;
wire [1:0] 	                    byte_sel_w                      ;
wire [7:0]                      csr_mcause_id_w                 ;
wire 		                    zic_mmr_eoi_write_valid_w	    ;
wire [PC_WIDTH-1         :0] 	zpc_to_csr_mepc_w			    ;
wire 		                    zpc_to_csr_mepc_write_valid_w	;
wire [PC_WIDTH-1         :0]	csr_to_zpc_mepc_w			    ;
//wire 		                    interrupt_valid_w			    ;//zpc to csr
//wire 		                    exception_valid_w			    ;
wire 		                    ld_sd_misalign_valid_w 			;
wire [DATA_WIDTH-1       :0] 	ld_sd_misalign_addr_w			;
wire 		                    instr_misalign_valid_w 			;
wire [PC_WIDTH-1         :0]	instr_misalign_addr_w			;
//wire 		                    invalid_instr_valid_w			;
wire 		                    csr_mstatus_mie_set_w			;
wire 		                    csr_mstatus_mie_clear_w			;
wire [PC_WIDTH-1         :0] 	csr_mepc_w				        ;
wire 		                    global_interrupt_enable_valid_w	;
wire 		                    zic_mmr_read_en_w			    ;	
wire 		                    zic_mmr_write_en_w			    ;
wire 		                    e_call_valid_w 				    ;		
wire 		                    e_break_valid_w 			    ;		
wire 		                    mret_valid_w				    ;			
wire 		                    invalid_instruction_valid_w		;
wire 		                    csr_write_en_w				    ;
wire 		                    csr_read_en_w				    ;
wire [CSR_ADDR_WIDTH-1   :0] 	csr_addr_w				        ;
wire 		                    csr_set_valid_w 			    ;
wire 		                    csr_clear_valid_w			    ;
wire 		                    csr_imm_valid_w				    ;
wire [CSR_ADDR_WIDTH-1   :0] 	ex_mem_csr_addr_w			    ;		
wire 		                    ex_mem_csr_write_en_w			;			
wire 		                    ex_mem_csr_read_en_w			;		
wire [DATA_WIDTH-1       :0] 	ex_mem_csr_write_data_w 		;	
wire 		                    ex_mem_csr_set_valid_w  		;	
wire 		                    ex_mem_csr_clear_valid_w		;	
wire [DATA_WIDTH-1       :0] 	csr_read_data_w				    ;
wire [DATA_WIDTH-1       :0]    de_ld_sd_addr_w                 ;
wire 		                    ld_valid_w                      ;
wire 		                    sd_valid_w                      ;
wire [DATA_WIDTH-1       :0]    csr_to_mux                      ;
wire                            decode_instruction_valid_w      ;
wire                            csr_rd_en_to_mux                ;
wire                            exception_id_write_valid_w      ;
wire                            interrupt_id_write_valid_w      ;
wire [DATA_WIDTH-1       :0]    data_mem_max_addr_w             ;
wire                            trap_valid_w                    ;

//////////////////////////////////////////
//////debug related ports/pins/wires//////
/////////////////////////////////////////

wire [DATA_WIDTH-1       :0]    dbg_write_data_w                ;
wire [7:0]                      dbg_command_type_w              ;
wire [15:0]                     dbg_cmd_reg_addr_w              ;
wire                            dbg_write_en_w                  ; 
wire                            dbg_ndmrst_w                    ; 
wire                            dbg_dmactive_w                  ; 
wire                            dbg_hart_only_rst_w             ; 
//wire                            dbg_halt_req_w                  ; 
//wire                            dbg_resume_req_w                ; 
wire                            dbg_setresethaltreq_w           ; 
wire                            dbg_clrresethaltreq_w           ; 
wire                            debug_mode_valid_w              ;
wire                            dbg_reg_write_en_w              ;
wire [DATA_WIDTH-1       :0]    dbg_reg_write_data_w            ;
wire [15:0]                     dbg_reg_addr_w                  ;
wire                            dbg_reg_read_en_w               ;
wire [DATA_WIDTH-1       :0]    dbg_csr_read_data_w             ;
wire                            dbg_csr_read_valid_w            ;
//wire [PC_WIDTH-1         :0]    dpc_w                           ;
wire [DATA_WIDTH-1       :0]    dbg_gpr_read_data_w             ;
wire                            dbg_gpr_read_valid_w            ;
reg [DATA_WIDTH-1        :0]    debug_reg_read_data             ;
reg                             debug_reg_read_data_valid       ;

wire                            dbg_mode_exception              ;
assign dbg_mode_exception = ( exception_valid_w && debug_mode_valid_w )  ? 1'b1 : 1'b0 ;

//wire  [DATA_WIDTH-1     :0]     debug_mem_read_data             ; 
//wire                            debug_mem_read_enable           ;
//wire [DATA_WIDTH-1      :0]     debug_mem_read_addr             ; 

//wire                            debug_mem_write_enable          ; 
//wire [DATA_WIDTH-1      :0]     debug_mem_write_addr            ; 
//wire [DATA_WIDTH-1      :0]     debug_mem_write_data            ; 
//wire [(DATA_WIDTH>>3)-1 :0]     debug_mem_strobe                ;
//wire                            debug_mem_read_valid            ;
wire                            debug_exception_valid_w         ;
wire                            mem_addr_invalid_w              ;
wire                            debug_instr_mem_read_data_valid ;
wire [DATA_WIDTH-1      :0]     debug_instr_mem_read_data       ; 
wire                            wdt_reset_w                     ;
wire [DATA_WIDTH-1      :0]     alu_csr_data                    ;
wire                            resethaltreq_w                  ;
wire                            debug_instr_mem_access_valid    ;

wire data_mem_write_en_to_stall;

//////////////////////////////////////////
//
//
assign DM_AWPROT = 3'b000;
assign DM_ARPROT = 3'b000;
assign dm_addr_strobe = lmb_mem_write_en|| lmb_mem_read_en ;
assign im_addr_strobe = z_im_read_en_o  || z_im_write_en_o;
assign pc_out = instruction_read_addr_w;
assign data_mem_addr_o = data_mem_read_en ? data_mem_read_addr : data_mem_write_addr;

assign 		zic_mmr_write_data_w 			= store_data_r[31:0] 	;
assign 		global_interrupt_enable_w 		= {48{mstatus_mie_w}}	;
assign 		global_interrupt_enable_valid_w	= mstatus_mie_w		    ;
assign 		addr_gen_data                   = (ex_mem_mem_to_reg_en) ? mem_out : alu_out; //new change 20/12/2020
assign      pc                              = instruction_read_addr_w;
assign      alu_csr_data                    = ex_mem_csr_read_en_w ? csr_read_data_w : alu_out ;
assign      risc_rst_r                      = risc_rst;


//wire [DATA_WIDTH-1:0] alu_csr_data;
//assign alu_csr_data = ex_mem_csr_read_en_w ? csr_read_data_w : alu_out ;

//wire resethaltreq_w;
//wire debug_instr_mem_access_valid;

assign risc_rst 		= risc_rst_i && locked  					;

wire mult_valid_w;
wire div_valid_w;
wire rem_valid_w;
wire div_busy_w;
wire rem_busy_w;
wire [31:0] rem_opcode_w;
wire [31:0] div_opcode_w;
wire [DATA_WIDTH-1:0]   z_im_write_addr_o		    ;
wire [DATA_WIDTH-1	:0] data_mem_addr 		    ;
wire [19:0]             z_im_read_addr_o		    ;
wire 		      	    risc_rst			    ;
wire [19:0] 	      	    z_instruction_addr_w	    ;
wire [(DATA_WIDTH>>3)-1	:0] z_im_write_data_strobe_w        ;


assign z_im_write_en_o          = z_im_write_en_w		 					;
assign z_im_write_addr_o        = z_im_write_addr_w		 				    ;
assign z_im_write_data_o        = z_im_write_data_w		 					;
assign z_im_write_data_strobe_o = z_im_write_data_strobe_w							;
assign z_instruction_addr_o	= z_im_read_en_o ? {12'b0,z_im_read_addr_o} : z_im_write_addr_o;






axi_lmb_arbiter axi_lmb_arbiter_inst
(
.clk			(risc_clk),
.rst			(risc_rst),
.data_mem_write_en	(data_mem_write_en),	
.data_mem_read_en	(data_mem_read_en),
.data_mem_strobe	(data_mem_strobe),
.data_mem_addr_o	(data_mem_addr_o),
//.data_mem_addr_o	(data_mem_addr_o),
.data_mem_write_data	(data_mem_write_data),
.data_mem_read_data	(data_mem_read_data),
.uart_mem_write_en	(uart_mem_write_en	),		
.uart_mem_read_en	(uart_mem_read_en	),
.uart_mem_strobe	(uart_mem_strobe	),
.uart_mem_addr_o	(uart_mem_addr_o	),
//.uart_mem_addr_o	(uart_mem_addr_o	),
.uart_mem_write_data	(uart_mem_write_data	),
.uart_mem_read_data	(uart_mem_read_data	),
.lmb_mem_write_en_o	(lmb_mem_write_en	),	
.lmb_mem_read_en_o	(lmb_mem_read_en	),
.lmb_mem_strobe_o	(lmb_mem_strobe		),
.lmb_mem_addr_o	(lmb_mem_addr_o		),
//.lmb_mem_addr_o	(lmb_mem_addr_o		),
.lmb_mem_write_data_o	(lmb_mem_write_data	),
.lmb_mem_read_data	(lmb_mem_read_data	),
.data_mem_write_en_to_stall(data_mem_write_en_to_stall),
.uart_valid         (uart_valid),
.uart_read_stall(uart_read_stall),
.uart_rd_valid(uart_rd_valid)  
);



axi4_lite_master 
	#(
		  .ADDR_WIDTH (32),
		  .DATA_WIDTH (32),
		  .STRB_WIDTH (4) 		  
                  )
uart_axi_interface		  
		  (
	 
	  // system control ports
	  .axi4_lite_clk (risc_clk), // syatem clock signal
	  .axi4_lite_rstn(risc_rst), // syatem reset signal: async active low reset
	  .M_AW_ADDR_OUT (DM_AW_ADDR_OUT 	), 
	  .M_AW_VALID_OUT(DM_AW_VALID_OUT	),
	  .M_AW_READY_IN (DM_AW_READY_IN 	),
	  .M_W_DATA_OUT  (DM_W_DATA_OUT  	),
	  .M_W_STRB_OUT  (DM_W_STRB_OUT  	),
	  .M_W_VALID_OUT (DM_W_VALID_OUT 	),
	  .M_W_READY_IN  (DM_W_READY_IN  	),
	  .M_B_RESP_IN   (DM_B_RESP_IN   	),
	  .M_B_VALID_IN  (DM_B_VALID_IN  	),
	  .M_B_READY_OUT (DM_B_READY_OUT 	),
	  .M_AR_ADDR_OUT (DM_AR_ADDR_OUT 	),
	  .M_AR_VALID_OUT(DM_AR_VALID_OUT	),
	  .M_AR_READY_IN (DM_AR_READY_IN 	),
	  .M_R_DATA_IN   (DM_R_DATA_IN   	),
	  .M_R_RESP_IN   (DM_R_RESP_IN   	),
	  .M_R_VALID_IN  (DM_R_VALID_IN  	),
	  .M_R_READY_OUT (DM_R_READY_OUT 	),
	  .wr_en_in      (uart_mem_write_en	),
	  .rd_en_in      (uart_mem_read_en	),
	  .byte_en       (uart_mem_strobe	),
	  .wr_addr_in    (uart_mem_addr_o	),
	  .rd_addr_in    (uart_mem_addr_o	),
	  .m_data_in     (uart_mem_write_data	),
	  .m_data_out    (uart_mem_read_data	),
          .master_read_data_valid() ,
        //  .state_r(state_r),
	  .rd 			(id_ex_rd),
	  .uart_rd		(uart_rd		),
	  .uart_rd_valid	(uart_rd_valid	),
	  .uart_data		(uart_data		)

						   );









/////////////////////////////////////////////////////////////
//                                                         //
//                                                         //
//              DEBUG MODULE                               //
//                                                         //
//////////////////////////////////////////////////////////////

dtm_to_dm 
dtm_to_dm_inst
(
		// ============== JTAG Ports =============
.TCK            				(TCK                        ), // Test Clock Input: JTAG
.TRST           				(TRST                       ), // Test Reset Input: asynch active low reset
.TMS          			 	    (TMS                        ), // Test Mode Select Input
.TDI            				(TDI                        ), // Test Data Input
.TDO            				(TDO                        ), // Test Data Output
.tdo_en         				(tdo_en                     ), // TDO output enable: this flag is high when state is in Shift_IR | Shift_DR
.pclock  					    (risc_clk                   ), // APB Clock signal
.presetn   					    (risc_rst                   ),  // Asynchronous active low reset for APB
.step						    (  1'b0                     ),
.ebreak 						(e_break_valid_w            ),
.exception 					    (debug_exception_valid_w    ),
.debug_reg_read_data	        (debug_reg_read_data        ),
.debug_reg_read_valid		    (debug_reg_read_data_valid  ),
.cmdtype				        (dbg_command_type_w         ),
.ndmreset					    (dbg_ndmrst_w               ),
.h_reset					    (dbg_hart_only_rst_w        ),
.haltreq					    (dbg_halt_req_w             ),
.resumereq					    (dbg_resume_req_w           ),
.setresethaltreq			    (dbg_setresethaltreq_w      ),
.clrresethaltreq			    (dbg_clrresethaltreq_w      ),
.debug_reg_write_enable		    (dbg_reg_write_en_w         ),
.debug_reg_write_data	        (dbg_reg_write_data_w       ),
.debug_reg_read_enable		    (dbg_reg_read_en_w          ),
.debug_reg_address			    (dbg_reg_addr_w             ),
.resethaltreq                   (resethaltreq_w             ),
.debug_mem_read_data            (debug_mem_read_data        ),
.debug_mem_read_enable          (debug_mem_read_enable      ),
.debug_mem_write_enable         (debug_mem_write_enable     ),
.debug_mem_read_addr            (debug_mem_read_addr        ),
.debug_mem_write_addr           (debug_mem_write_addr       ),
.debug_mem_write_data           (debug_mem_write_data       ),
.debug_mem_strobe               (debug_mem_strobe           ),
.debug_mem_read_valid           (debug_mem_read_valid       ),
.dmcontrol_reg                  (dmcontrol_reg),
.dmstatus_reg                   (dmstatus_reg    ),    		    
.abstractcs_reg	                (abstractcs_reg	 ),	    
.command_reg	                (command_reg	 )	

);	

 	                                                  
/*muxing between csr register read and gpr read in debug mode*/
always@(*)
begin
    case({dbg_csr_read_valid_w,dbg_gpr_read_valid_w})
        2'b10:
        begin
            debug_reg_read_data         = dbg_csr_read_data_w  ;
            debug_reg_read_data_valid   = dbg_csr_read_valid_w ;

        end
        2'b01:
        begin
            debug_reg_read_data         =  dbg_gpr_read_data_w  ; 
            debug_reg_read_data_valid   =  dbg_gpr_read_valid_w ;
            
        end
        default:
        begin
            debug_reg_read_data         = {DATA_WIDTH{1'b0}};
            debug_reg_read_data_valid   = 1'b0 ;
        end
    endcase
end

//////////////////////////////////////////////////////////////////
//																//
//				INSTRUCTION MEMORY INSTANCE						//
//																//
//////////////////////////////////////////////////////////////////
instruction_memory 
#(
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH),
.PC_WIDTH          (PC_WIDTH         ),
.DATA_WIDTH         (DATA_WIDTH)
)

instruction_memory_inst //ins	truction memory instance
(
.im_clk					        (risc_clk			     ),
.im_rst					        (risc_rst			     ),
.instruction_read_en_i			(instruction_read_en_w   ),//from program control logic
.instruction_read_addr_i		(instruction_read_addr_w ),//from program control logic
.instruction_o 				    (if_instruction_w		 ), //to program control
.debug_mode_valid_i             (debug_mode_valid_w      ),
.debug_mode_reset_i             (dbg_hart_only_rst_w     ),
.debug_ndm_reset_i              (dbg_ndmrst_w            ),
.z_im_write_en_o		(z_im_write_en_w		),
.z_im_write_addr_o		(z_im_write_addr_w		),
.z_im_write_data_o		(z_im_write_data_w		),
.z_im_write_data_strobe_o	(z_im_write_data_strobe_w	),
.z_im_read_en_o			(z_im_read_en_o			),
.z_im_read_addr_o		(z_im_read_addr_o		),
.z_im_read_data_i		(z_im_read_data_i		),
.debug_mem_read_data            (debug_instr_mem_read_data    ),
.debug_mem_read_enable          (debug_mem_read_enable  ),
.debug_mem_write_enable         (debug_mem_write_enable ),
.debug_mem_read_addr            (debug_mem_read_addr    ),
.debug_mem_write_addr           (debug_mem_write_addr   ),
.debug_mem_write_data           (debug_mem_write_data   ),
.debug_mem_strobe               (debug_mem_strobe       ),
.instr_mem_access_valid         (debug_instr_mem_access_valid),
.debug_instr_mem_read_data_valid    (debug_instr_mem_read_data_valid)
//z_im_read_data_strobe_o,



);


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//																//
//				PROGRAM CONTROL INSTANCE									//
//																//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

zpc_top 
#(
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)

zpc_top_inst //zilla program control instance
(
.z_clk					            (risc_clk			         ),
.z_rst					            (risc_rst_r			         ),
.wdt_reset_i                        (wdt_reset_w                 ),
.trap_valid_o                       (trap_valid_w                ),
.csr_mstatus_mie_i			        (mstatus_mie_w			     ),//from CSR to fsm
.zic_int_req_i				        (interrupt_request_w		 ),//from zic to fsm
.stall_valid_i				        (stall_en			         ),//from load hazard control block to fsm and pc update
.zic_mmr_ack_id_i			        (zic_mmr_ack_id_w		     ),//from zic_mmr	
.csr_mtvec_i				        (csr_mtvec_w			     ),//from mepc CSR
.branch_valid_i                     (branch_en			         ),//from branch condition chk block
.branch_pc_i                        (branch_pc			         ),//from branch condition chk block
.z_instruction_i	                (if_instruction_w		     ),//////////from instruction memory
.ld_sd_addr_i				        (de_ld_sd_addr_w		     ),//from load - store addr calc
.ld_valid_i				            (ld_valid_w			         ),//from load store addr calc
.sd_valid_i				            (sd_valid_w			         ),//from load - store addr calc
.byte_sel_i				            (byte_sel_w			         ),//from load - store addr calc
.instr_read_addr_o       	        (instruction_read_addr_w	 ),//////////to instruction memory
.csr_mstatus_mie_set_o   	        (csr_mstatus_mie_set_w		 ),//to CSR
.csr_mstatus_mie_clear_o	        (csr_mstatus_mie_clear_w	 ),//to CSR
.csr_mepc_i				            (csr_to_zpc_mepc_w		     ),//from mtvec CSR
.csr_mepc_o	        		        (zpc_to_csr_mepc_w		     ),//to CSR
.csr_mepc_write_valid_o		        (zpc_to_csr_mepc_write_valid_w	     ),//to CSR
.zic_mmr_ack_read_valid_o	        (zic_mmr_ack_read_valid_w	 ),//to zic mmr
.zic_mmr_eoi_write_valid_o	        (zic_mmr_eoi_write_valid_w	 ),//to zic mmr
.z_instruction_o			        (de_instruction_w		     ),///////////to decoder
.zic_mmr_eoi_id_o			        (zic_mmr_eoi_id_o		     ),//to zic mmr
.z_instruction_read_enable_o        (instruction_read_en_w		 ), //from pc updte to instr memory
.exception_valid_o			        (exception_valid_w		     ),
.exception_id_o				        (exception_id_w			     ),
.interrupt_valid_o			        (interrupt_valid_w		     ),
.exception_id_write_valid_o	        (exception_id_write_valid_w	 ),
.interrupt_id_write_valid_o	        (interrupt_id_write_valid_w	 ),
.ld_sd_misalign_valid_o  	        (ld_sd_misalign_valid_w 	 ),
.ld_sd_misalign_addr_o		        (ld_sd_misalign_addr_w		 ),
.instr_misalign_valid_o  	        (instr_misalign_valid_w 	 ),
.instr_misalign_addr_o		        (instr_misalign_addr_w		 ),
.invalid_instr_valid_o		        (invalid_instr_valid_w		 ),
.invalid_instr_valid_i		        (invalid_instruction_valid_w ),//from decode		
.breakpoint_valid_i			        (e_break_valid_w		     ),//from decode / debug
.ecall_valid_i				        (e_call_valid_w			     ),//from decode / debug
.mret_valid_i				        (mret_valid_w			     ),//from decoder to fsm
.csr_mcause_id_i			        (csr_mcause_id_w		     ),
.decode_instruction_valid_o	        (decode_instruction_valid_w	 ),
.data_mem_max_addr_i		        (data_mem_max_addr_w		 ),
.dbg_hartreset_i	                (dbg_hart_only_rst_w         ),
.dbg_haltreq_i	                    (dbg_halt_req_w              ),
.dbg_resumereq_i	                (dbg_resume_req_w            ),
.dbg_setresethaltreq_i              (dbg_setresethaltreq_w       ),
.debug_mode_valid_o                 (debug_mode_valid_w          ),
.dpc_csr_i                          (dpc_w                       ),
.dbg_ndmrst_i                       (dbg_ndmrst_w                ),
.resethaltreq_i                     (resethaltreq_w              ),
.debug_mem_read_enable              (debug_mem_read_enable       ), 
.debug_mem_write_enable             (debug_mem_write_enable      ), 
.debug_mem_read_addr                (debug_mem_read_addr         ), 
.debug_mem_write_addr               (debug_mem_write_addr        ),
.debug_mem_strobe                   (debug_mem_strobe            ),
.debug_exception_valid_o            (debug_exception_valid_w     ),
.mem_addr_invalid_i                 (mem_addr_invalid_w          )


);



//////////////////////////////////////////////////////////////////
//																//
//				INTERRUPT CONTROL INSTANCE						//
//																//
//////////////////////////////////////////////////////////////////

zilla_interrupt_control zilla_interrupt_control_inst //interrupt control block
(
.zic_clk				        (risc_clk			                ),
.zic_rst				        (risc_rst_r			                ),
.zic_mmr_write_en_i			    (zic_mmr_write_en_w		            ),//from decode load / store instruction
.zic_mmr_write_addr_i			(zic_mmr_write_addr_w		        ),//from decode load / store instruction
.zic_mmr_write_data_i			(zic_mmr_write_data_w		        ),//from decode load / store instruction
.zic_mmr_read_en_i			    (zic_mmr_read_en_w		            ),//from decode load / store instruction
.zic_mmr_read_addr_i			(zic_mmr_read_addr_w		        ),//from decode load / store instruction
.zic_mmr_read_data_o			(zic_mmr_read_data_w		        ),//to register file load  / store instruction
.active_lvl_pr_i			    (interrupt_active_level_priority_w  ),//from CSR
.global_int_enable_bit_i		(global_interrupt_enable_w	        ),//additional logic in CSR
.global_int_enable_valid_i		(global_interrupt_enable_valid_w    ), //lets make one bit
.zic_ack_read_valid_en			(zic_mmr_ack_read_valid_w	        ),//ack int id read en from processor
.zic_ack_int_id_o			    (zic_mmr_ack_id_w		            ),//to processor ack
.zic_eoi_valid_i			    (zic_mmr_eoi_write_valid_w	        ),//eoi write enable from processor
.zic_eoi_id_i				    (zic_mmr_eoi_id_o		            ),//eoi int id from processor
.interrupt_request_o			(interrupt_request_w		        ),//interrupt request signal to core	 
.highest_pending_lvl_pr_o		(highest_pending_lvl_pr_w	        ),
.ext_int0_i				        (ext_int0_i			                ),	  
.ext_int1_i				        (ext_int1_i			                ),	  
.ext_int2_i				        (ext_int2_i			                ),	  
.ext_int3_i				        (ext_int3_i			                ),	  
.ext_int4_i				        (ext_int4_i			                ),	  
.ext_int5_i				        (ext_int5_i			                ),	  
.ext_int6_i				        (ext_int6_i			                ),	  
.ext_int7_i				        (ext_int7_i			                ),	  
.ext_int8_i				        (ext_int8_i			                ),	  
.ext_int9_i				        (ext_int9_i			                ),	  
.ext_int10_i				    (ext_int10_i			            ),	  
.ext_int11_i				    (ext_int11_i			            ),	  
.ext_int12_i				    (ext_int12_i			            ),	  
.ext_int13_i				    (ext_int13_i			            ),	  
.ext_int14_i				    (ext_int14_i			            ),	  
.ext_int15_i				    (ext_int15_i			            ),	  
.ext_int16_i				    (ext_int16_i			            ),	  
.ext_int17_i				    (ext_int17_i			            ),	  
.ext_int18_i				    (ext_int18_i			            ),	  
.ext_int19_i				    (ext_int19_i			            ),	  
.ext_int20_i				    (ext_int20_i			            ),	  
.ext_int21_i				    (ext_int21_i			            ),	  
.ext_int22_i				    (ext_int22_i			            ),	  
.ext_int23_i				    (ext_int23_i			            ),	  
.ext_int24_i				    (ext_int24_i			            ),	  
.ext_int25_i				    (ext_int25_i			            ),	  
.ext_int26_i				    (ext_int26_i			            ),	  
.ext_int27_i				    (ext_int27_i			            ),	  
.ext_int28_i				    (ext_int28_i			            ),	  
.ext_int29_i				    (ext_int29_i			            ),	  
.ext_int30_i				    (ext_int30_i			            ),	  
.ext_int31_i				    (ext_int31_i			            ),	  
.ext_int32_i				    (ext_int32_i			            ),	  
.ext_int33_i				    (ext_int33_i			            ),	  
.ext_int34_i				    (ext_int34_i			            ),	  
.ext_int35_i				    (ext_int35_i			            ),	  
.ext_int36_i				    (ext_int36_i			            ),	  
.ext_int37_i				    (ext_int37_i			            ),	  
.ext_int38_i				    (ext_int38_i			            ),	  
.ext_int39_i				    (ext_int39_i			            ),	  
.ext_int40_i				    (ext_int40_i			            ),	  
.ext_int41_i				    (ext_int41_i			            ),	  
.ext_int42_i				    (ext_int42_i			            ),	  
.ext_int43_i				    (ext_int43_i			            ),	  
.ext_int44_i				    (ext_int44_i			            ),	  
.ext_int45_i				    (ext_int45_i			            ),	  
.ext_int46_i				    (ext_int46_i			            ),
.debug_mode_valid_i             (debug_mode_valid_w                 ),
.debug_mode_reset_i             (dbg_hart_only_rst_w                ),
.debug_ndm_reset_i              (dbg_ndmrst_w                       ),
.wdt_reset_o                    (wdt_reset_w                        )
);

//////////////////////////////////////////////////////////////////
//																//
//				CONTROL AND STATUS REGISTER INSTANCE			//
//																//
//////////////////////////////////////////////////////////////////

csr_top 
#(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)

csr_top_inst
(
.csr_clk				            (risc_clk				            ),
.csr_rst				            (risc_rst_r				            ),
.wdt_reset_i                        (wdt_reset_w                        ),
.mret_valid_i                       (mret_valid_w                       ),
.csr_write_en_in			        (ex_mem_csr_write_en_w			    ),//from decoder		
.csr_addr_in				        (ex_mem_csr_addr_w			        ),//from decoder
.csr_read_en_in      			    (ex_mem_csr_read_en_w			    ),//from decoder
.csr_read_data_o     			    (csr_read_data_w			        ),//from decoder	
.csr_write_data_in			        (ex_mem_csr_write_data_w		    ),//from decoder	
.csr_set_bit_in				        (ex_mem_csr_set_valid_w 		    ),//from decoder	
.csr_clear_bit_in			        (ex_mem_csr_clear_valid_w		    ),//from decoder
.pc_in					            (pc					                ), //pc value of invalid instruction
.interrupt_valid_in			        (interrupt_valid_w			        ),//interrupt valid signal //program control 	
.interrupt_code_in			        ({56'd0,zic_mmr_ack_id_w}		    ),//interrupt_code //from zic	
.exception_valid_in			        (exception_valid_w			        ),//exception valid signal 	
.exception_code_in			        ({56'd0,exception_id_w}			    ),//exception code
.ld_sd_misalign_valid_in		    (ld_sd_misalign_valid_w			    ),
.ld_sd_misalign_addr_in			    (ld_sd_misalign_addr_w			    ),
.instr_misalign_valid_in		    (instr_misalign_valid_w			    ),
.instr_misalign_addr_in			    ({44'd0,instr_misalign_addr_w}	    ),
.invalid_instr_valid_in			    (invalid_instr_valid_w			    ),//invalid instruction valid 
.invalid_instruction_in			    (de_instruction_w			        ),
.mie_set               			    (csr_mstatus_mie_set_w  		    ),//start of an interrupt
.mie_clear              		    (csr_mstatus_mie_clear_w		    ),//end of an interrupt
.csr_mepc_in				        (zpc_to_csr_mepc_w			        ),
.csr_mepc_write_valid			    (zpc_to_csr_mepc_write_valid_w	    ),
.csr_mepc_o				            (csr_to_zpc_mepc_w			        ),
.mstatus_mie_o				        (mstatus_mie_w				        ),
.csr_mtvec_o				        (csr_mtvec_w				        ),
.interrupt_lvl_pr_i			        (highest_pending_lvl_pr_w		    ),
.interrupt_active_level_priority_o	(interrupt_active_level_priority_w	),
.csr_mcause_o				        (csr_mcause_id_w			        ),
.exception_id_write_valid_i		    (exception_id_write_valid_w		    ),
.interrupt_id_write_valid_i		    (interrupt_id_write_valid_w		    ),
.data_mem_max_addr_o			    (data_mem_max_addr_w                ),
.trap_valid_i	                    (trap_valid_w                       ),
.stall_valid_i	                    (stall_en                           ),
.branch_valid_i	                    (branch_en                          ),
.dbg_mode_valid_i                   (debug_mode_valid_w                 ),
.dbg_mode_write_en_i                (dbg_reg_write_en_w                 ),
.dbg_mode_write_data_i              (dbg_reg_write_data_w               ),
.dbg_mode_csr_addr_i                (dbg_reg_addr_w                     ),
.dbg_mode_read_en_i                 (dbg_reg_read_en_w                  ),
.dbg_mode_read_data_o               (dbg_csr_read_data_w                ),//csr read data
.dbg_csr_read_valid_o               (dbg_csr_read_valid_w               ),//csr read data valid
.ebreak_valid_i                     (ebreak_valid_w                     ),
.trigger_valid_i                    (1'b0                               ),
.haltreq_valid_i                    (dbg_halt_req_w                     ),
.single_step_valid_i                (1'b0                               ),
.reset_haltreq_valid_i              (dbg_setresethaltreq_w              ),
.dpc_o                              (dpc_w                              ),
.dbg_ndm_reset_i                    (dbg_ndmrst_w                       ),
.dbg_hart_reset_i                   (dbg_hart_only_rst_w                ),
.branch_pc_i                        (branch_pc                          )
);


////////////////////////////////////////////////////////////////////    //////////////////////////////////////////////////////////////
//																//
//				INSTRUCTION DECODER INSTANCE									//
//																//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

instr_decode #(
.DATA_WIDTH         (DATA_WIDTH       ),
.INSTRUCTION_WIDTH  (INSTRUCTION_WIDTH),
.OPCODE             (OPCODE           ),
.FUNC3              (FUNC3            ),
.FUNC7              (FUNC7            ),
.GPR_ADDR_WIDTH     (GPR_ADDR_WIDTH   ),
.CSR_ADDR_WIDTH     (CSR_ADDR_WIDTH   )

)
instr_decode_inst
(
.de_clk					    (risc_clk			            ),
.de_rst					    (risc_rst_r			            ),
.wdt_reset_i                (wdt_reset_w                    ),
.instruction_r				(de_instruction_w		        ),
.stall_en           	    (stall_en			),
.stall_pipeline				(stall_pipeline			        ),
.branch_en				    (branch_en			            ),
.opcode					    (opcode				            ),
.func3					    (func3				            ),
.alu_ctrl_r				    (alu_ctrl			            ),
.imm_val				    (imm_val			            ),
.imm_r					    (addr_gen_imm_val		        ),
.rs1					    (rs1				            ),
.rs2					    (rs2				            ),
.rd					        (rd				                ),
.reg_wr_en_r				(reg_wr_en			            ),
.mem_rd_en_r				(mem_rd_en			            ),
.mem_wr_en_r				(mem_wr_en			            ),
.mem_to_reg_en_r 			(mem_to_reg_en		            ),
.opcode_r				    (opcode_r			            ),
.e_call_valid_o  			(e_call_valid_w 		        ),//e-call exception
.e_break_valid_o 			(e_break_valid_w 		        ),//e-break exception
.mret_valid_o				(mret_valid_w			        ),//mret instruction valid
.invalid_instruction_valid_o(invalid_instruction_valid_w	),//invalid instruction exception
.csr_write_en_o				(csr_write_en_w			        ),
.csr_read_en_o				(csr_read_en_w			        ),
.csr_addr_o				    (csr_addr_w			            ),
.csr_set_valid_o 			(csr_set_valid_w 		        ),
.csr_clear_valid_o			(csr_clear_valid_w		        ),
.csr_imm_valid_o 			(csr_imm_valid_w		        ),
.decode_instruction_valid_i	(decode_instruction_valid_w	    ),
.ret_func_valid				(ret_func_valid                 ),
. ebreak_valid_o            (ebreak_valid_w                 ),
.debug_mode_valid_i         (debug_mode_valid_w             ),
.debug_mode_reset_i         (dbg_hart_only_rst_w            ),
.debug_ndm_reset_i          (dbg_ndmrst_w                   ),
.mult_valid_o               (mult_valid_w                   ),
.rem_valid_o(rem_valid_w),
.div_valid_o(div_valid_w),
.rem_opcode_o(rem_opcode_w),
.div_opcode_o(div_opcode_w)


);


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//																//
//				SIGNAL PIPELINING INSTANCE									//
//																//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
pipe #(
.DATA_WIDTH     (DATA_WIDTH     ),
.GPR_ADDR_WIDTH (GPR_ADDR_WIDTH ),
.CSR_ADDR_WIDTH (CSR_ADDR_WIDTH ))
pipe_inst
(
.risc_clk	   			        (risc_clk	     		    ),			 
.risc_rst    			        (risc_rst_r	     		    ),
.wdt_reset_i                    (wdt_reset_w                ),
.rd		    			        (rd		     		        ),
.reg_wr_en	    			    (reg_wr_en	     		    ),
.mem_rd_en	    			    (mem_rd_en	     		    ),
.mem_wr_en	    			    (mem_wr_en	     		    ),
.mem_to_reg_en	    		    (mem_to_reg_en	     		),
.stall_pipeline				    (stall_pipeline	     		),
.id_ex_rd  	    			    (id_ex_rd  	     		    ),
.ex_mem_rd 	    			    (ex_mem_rd 	     		    ),
.mem_wb_rd 	    			    (mem_wb_rd 	     		    ),
.id_ex_reg_wr_en     			(id_ex_reg_wr_en     		),
.ex_mem_reg_wr_en    			(ex_mem_reg_wr_en    		),
.mem_wb_reg_wr_en_o   			(mem_wb_reg_wr_en    		),
.id_ex_mem_rd_en     			(id_ex_mem_rd_en     		),
.ex_mem_mem_rd_en    			(ex_mem_mem_rd_en    		),
.id_ex_mem_wr_en     			(id_ex_mem_wr_en     		),
.ex_mem_mem_wr_en    			(ex_mem_mem_wr_en    		),
.id_ex_mem_to_reg_en 			(id_ex_mem_to_reg_en 		),
.ex_mem_mem_to_reg_en			(ex_mem_mem_to_reg_en		),
.mem_wb_mem_to_reg_en			(mem_wb_mem_to_reg_en		),
.ex_mem_csr_addr_o			    (ex_mem_csr_addr_w		    ),//to csr		
.ex_mem_csr_write_en_o			(ex_mem_csr_write_en_w		),//to csr
.ex_mem_csr_read_en_o			(ex_mem_csr_read_en_w		),//to csr
.ex_mem_csr_write_data_o 		(ex_mem_csr_write_data_w 	),//to csr
.ex_mem_csr_set_valid_o  		(ex_mem_csr_set_valid_w  	),//to csr
.ex_mem_csr_clear_valid_o		(ex_mem_csr_clear_valid_w	),//to csr
.csr_write_data_i			    (alu_data_in_1			    ),//to csr
.csr_imm_data_i  			    (addr_gen_imm_val		    ),//from decode
.csr_imm_valid_i			    (csr_imm_valid_w		    ),//from decode
.csr_addr_i				        (csr_addr_w			        ),//from decode
.csr_write_en_i				    (csr_write_en_w			    ),//from decode	
.csr_read_en_i				    (csr_read_en_w			    ),//from decode
.csr_set_valid_i			    (csr_set_valid_w		    ),//from decode
.csr_clear_valid_i			    (csr_clear_valid_w		    ),//from decode
.csr_rd_en_to_mux               (csr_rd_en_to_mux           ),
.debug_mode_valid_i             (debug_mode_valid_w         ),
.debug_mode_reset_i             (dbg_hart_only_rst_w        ),
.debug_ndm_reset_i              (dbg_ndmrst_w               ),
.div_rem_valid_i                (div_rem_valid_w            ),
.div_busy_i                     (div_busy_w                 ),
.rem_busy_i                     (rem_busy_w                 ),
.mult_valid_i                  (mult_valid_w), 
.div_valid_i                   (div_valid_w ), 
.rem_valid_i                   (rem_valid_w ),
.uart_valid         (uart_valid),
.r_ex_mem_reg_wr_en(r_ex_mem_reg_wr_en)



);

//////////////////////////////////////////////////////////////////
//																//
//				STORE DATA SELECTION							//
//																//
//////////////////////////////////////////////////////////////////

store_data #(.DATA_WIDTH(DATA_WIDTH ),
             .PC_WIDTH  (PC_WIDTH   ))
store_data_inst
(
.risc_clk				(risc_clk			    ),	
.risc_rst				(risc_rst_r			    ),
.wdt_reset_i            (wdt_reset_w            ),
.alu_out 				(alu_out 			    ),
.mem_out 				(mem_out 			    ),
.alu_ctrl				(alu_ctrl			    ),
.if_id_pc				(if_id_pc			    ),
.reg_write_data			(reg_write_data			),
.store_data_r			(store_data_r			),
.store_data				(store_data			    ),
.alu_to_mux				(alu_to_mux			    ),
.mem_to_mux				(mem_to_mux			    ),
.reg_write_data_1		(reg_write_data_1		),
.alu_ctrl_mem			(alu_ctrl_mem			),	
.id_ex_pc				(id_ex_pc			    ),
.csr_rd_data_i          (csr_read_data_w        ),
.csr_to_mux             (csr_to_mux             ),
.debug_mode_valid_i     (debug_mode_valid_w     ),
.debug_mode_reset_i     (dbg_hart_only_rst_w    ),
.debug_ndm_reset_i      (dbg_ndmrst_w           )
);

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//																//
//			FORWARDING MUX												//
//																//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
fwd #(.DATA_WIDTH(DATA_WIDTH))
fwd_inst
(
.rs1_data				    (rs1_data			    ),		
.rs2_data				    (rs2_data			    ),
.alu_out				    (alu_csr_data			),
.forward_a				    (forward_a			    ),
.forward_b  				(forward_b			    ),
.reg_write_data				(reg_write_data			),
.reg_write_data_1			(reg_write_data_1		),
.alu_data_in_1				(alu_data_in_1			),
.alu_data_in_2				(alu_data_in_2			),
.store_data_r				(store_data_r			),
.debug_mode_valid_i         (debug_mode_valid_w     ),
.debug_mode_reset_i         (dbg_hart_only_rst_w    ),
.debug_ndm_reset_i          (dbg_ndmrst_w           )

);

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//																//
//			MUX BETWEEN DATA MEMORY AND MEMORY MAPED REGISTERS							//
//																//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
memory_read_mux #(.DATA_WIDTH(DATA_WIDTH))
memory_read_mux_inst
(
.z_clk                          (risc_clk                       ),
.z_rst                          (risc_rst_r                     ),
.wdt_reset_i                    (wdt_reset_w                    ),
.mem_rd_en				        (id_ex_mem_rd_en	            ),
.mem_rd_addr				    (ld_sd_addr		                ),
.mem_wr_en				        (id_ex_mem_wr_en	            ),
.zic_mmr_read_en_o			    (zic_mmr_read_en_w	            ),//to mmr
.stall_pipeline                 (stall_pipeline                 ),
.zic_mmr_read_addr			    (zic_mmr_read_addr_w	        ),//to mmr
.zic_mmr_write_en_o			    (zic_mmr_write_en_w	            ),//to mmr
.zic_mmr_write_addr_o		    (zic_mmr_write_addr_w	        ),//to mmr
.data_mem_data_rd_en		    (data_mem_data_rd_en	        ),
.data_mem_data_wr_en            (data_mem_data_wr_en            ),
.debug_mode_valid_i             (debug_mode_valid_w             ),
.debug_mode_reset_i             (dbg_hart_only_rst_w            ),
.debug_ndm_reset_i              (dbg_ndmrst_w                   ),
.debug_mem_read_enable          (debug_mem_read_enable          ), 
.debug_mem_write_enable         (debug_mem_write_enable         ), 
.debug_mem_read_addr            (debug_mem_read_addr            ), 
.debug_mem_write_addr           (debug_mem_write_addr           ),
.mem_addr_invalid_o             (mem_addr_invalid_w             ),
.debug_instr_mem_access_valid   (debug_instr_mem_access_valid   )

);

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//																//
//			DATA MEMORY INTERFACE											//
//																//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

data_mem #(.DATA_WIDTH(DATA_WIDTH))
data_mem_inst
(
.mem_clk				        (risc_clk	 		            ),
.mem_rst        			    (risc_rst_r       		        ),
.wdt_reset_i                    (wdt_reset_w                    ),
.wr_en					        (data_mem_data_wr_en		    ),//id_ex_mem_wr_en //ex_mem_mem_wr_en
.rd_en					        (data_mem_data_rd_en		    ),
.wr_addr				        (ld_sd_addr	 		            ),//ld_sd_addr //mem_addr
.rd_addr				        (ld_sd_addr	 		            ),
.wr_data				        (store_data_r	 		        ),//store_data_r //store_data
.rd_data				        (mem_out 	 		            ),
.byte_en				        (id_ex_byte_en	 		        ),//id_ex_byte_en //ex_mem_byte_en
.sign_bit 				        (ex_mem_sign_bit 		        ),
.data_mem_write_en			    (data_mem_write_en		        ),
.stall_en       			    (stall_pipeline			        ),	
.data_mem_write_addr		    (data_mem_write_addr		    ),
.data_mem_write_data		    (data_mem_write_data		    ),
.data_mem_read_en			    (data_mem_read_en		        ),
.data_mem_read_addr			    (data_mem_read_addr		        ),
.zic_mmr_read_data_i		    (zic_mmr_read_data_w		    ),
.zic_mmr_read_en_i 			    (zic_mmr_read_en_w		        ),
.data_mem_strobe			    (data_mem_strobe		        ),	
.data_mem_read_data			    (data_mem_read_data	    	    ),
.debug_mode_valid_i             (debug_mode_valid_w             ),
.debug_mem_read_data            (debug_mem_read_data            ), 
.debug_mem_read_enable          (debug_mem_read_enable          ), 
.debug_mem_write_enable         (debug_mem_write_enable         ), 
.debug_mem_read_addr            (debug_mem_read_addr            ), 
.debug_mem_write_addr           (debug_mem_write_addr           ), 
.debug_mem_write_data           (debug_mem_write_data           ), 
.debug_mem_strobe               (debug_mem_strobe               ),
.debug_mem_read_valid           (debug_mem_read_valid           ),
.debug_instr_mem_read_data_valid(debug_instr_mem_read_data_valid),
.debug_instr_mem_read_data      (debug_instr_mem_read_data      )
);

//////////////////////////////////////////////////////////////////
//																//
//			REGISTER FILE INSTANCE								//
//																//
//////////////////////////////////////////////////////////////////
reg_file #(.DATA_WIDTH(DATA_WIDTH),
           .GPR_ADDR_WIDTH(GPR_ADDR_WIDTH))
reg_file_inst
(
.reg_clk				            (risc_clk			            ),
.wr_data_en				            (mem_wb_reg_wr_en		        ),	//from write back stage
.rs1					            (rs1				            ),	//from decoder
.rs2					            (rs2				            ),	//from decoder
.rd					                (mem_wb_rd			            ),	//from write back stage
.wr_data				            (reg_write_data			        ),	//from write back 
.rs1_data				            (rs1_data			            ),	//to alu 
.rs1_data_r				            (addr_gen_rs1_data		        ),	//to ld/sd addr
.rs2_data				            (rs2_data			            ),	//to alu
.rs2_data_r				            (target_addr_rs2_data	        ),      //conditional branch 
.dbg_mode_valid_i                   (debug_mode_valid_w             ),
.dbg_mode_write_en_i                (dbg_reg_write_en_w             ),
.dbg_mode_write_data_i              (dbg_reg_write_data_w           ),
.dbg_mode_gpr_addr_i                (dbg_reg_addr_w                 ),
.dbg_mode_read_en_i                 (dbg_reg_read_en_w              ),
.dbg_mode_gpr_read_data_o           (dbg_gpr_read_data_w            ),
.dbg_gpr_read_valid_o               (dbg_gpr_read_valid_w           ),
.gpr_a0_out(gpr_a0_out),			
.gpr_a1_out(gpr_a1_out),			
.gpr_a2_out(gpr_a2_out),			
.gpr_a3_out(gpr_a3_out),			
.gpr_a4_out(gpr_a4_out),			
.gpr_a5_out(gpr_a5_out),			
.gpr_s0_out(gpr_s0_out),			
.gpr_ra_out(gpr_ra_out),			
.gpr_sp_out(gpr_sp_out),
.gpr_t0_out(gpr_t0_out),	
.gpr_t1_out(gpr_t1_out),
.gpr_t2_out(gpr_t2_out),
.gpr_t3_out(gpr_t3_out),
.gpr_t4_out(gpr_t4_out),
.uart_rd		(uart_rd	),
.uart_rd_valid		(uart_rd_valid	),
.uart_data		(uart_data	)




);

//////////////////////////////////////////////////////////////////
//																//
//			ALU UNIT											//
//																//
//////////////////////////////////////////////////////////////////
alu #(.DATA_WIDTH   (DATA_WIDTH ),
      .PC_WIDTH     (PC_WIDTH   ),
      .OPCODE       (OPCODE     ))
alu_inst
(
.alu_clk				    (risc_clk	                 ),
.alu_rst				    (risc_rst_r	                 ),
.wdt_reset_i                (wdt_reset_w                 ),
.alu_ctrl				    (alu_ctrl	                 ),
.ld_sd_addr				    (ld_sd_addr	                 ),
.imm_val				    (imm_val	                 ),
.data_in_1				    (alu_data_in_1	             ),
.data_in_2				    (alu_data_in_2	             ),
.mem_addr				    (mem_addr	                 ),
.data_out				    (alu_out	                 ),
.data_out_1_o				    (addr_alu_out	             ),
.pc					        (pc		                     ),
.carry_o				    (carry		                 ),
.zero_o					    (zero		                 ),
.id_ex_byte_en				(id_ex_byte_en	             ),
.id_ex_sign_bit 			(id_ex_sign_bit	             ),
.ex_mem_byte_en				(ex_mem_byte_en	             ),
.ex_mem_sign_bit			(ex_mem_sign_bit             ),
.opcode_r				    (opcode		                 ),
.branch_en				    (branch_en	                 ),
.div_busy_o                 (div_busy_w                  ), 
.rem_busy_o                 (rem_busy_w                  ),
.div_opcode_i               (div_opcode_w                ),
.rem_opcode_i               (rem_opcode_w                ),
.div_rem_valid_o            (div_rem_valid_w            ),
.product_out                (product_out      ),
.product_valid_o            (product_valid_o  ),
.mult_op1   (mult_op1  ),
.mult_op2   (mult_op2  ),
.mult_en_r2 (mult_en_r2)



/*.debug_mode_valid_i(debug_mode_valid_w  ),
.debug_mode_reset_i(dbg_hart_only_rst_w ),
.debug_ndm_reset_i   (dbg_ndmrst_w        )*/


);

//////////////////////////////////////////////////////////////////
//																//
//				WRITE BACK MUX									//
//																//
//////////////////////////////////////////////////////////////////
mux2x1 #(.DATA_WIDTH(DATA_WIDTH))
mem_reg_mux
(
.in1					    (mem_to_mux			    ),//from memory
.in2					    (alu_to_mux			    ),//from alu
.csr_read_data_i			(csr_to_mux		        ),//from csr
.csr_read_data_valid 		(csr_rd_en_to_mux		),	
.sel					    (mem_wb_mem_to_reg_en	),
.out					    (reg_write_data			)
);

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//																//
//			FORWARD CONDITION DETECTION										//
//																//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

forwarding #(.GPR_ADDR_WIDTH(GPR_ADDR_WIDTH))
forwarding_inst
(
.fwd_clk				(risc_clk			),
.fwd_rst				(risc_rst_r			),
.wdt_reset_i            (wdt_reset_w        ),
.reg_wr_en				(reg_wr_en			),
.rd					    (rd				    ),
.rs1					(rs1				),
.rs2					(rs2				),
.forward_a				(forward_a			),
.forward_b   			(forward_b			),
.stall_pipeline         (stall_en           ),
.div_busy_i                     (div_busy_w                 ),
.rem_busy_i                     (rem_busy_w                 ),
.mult_valid_i                  (mult_valid_w), 
.div_valid_i                   (div_valid_w ), 
.rem_valid_i                   (rem_valid_w ) 

);

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//																//
//		LOAD HAZARD DETECTION UNIT											//
//																//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
load_hazard_ctrl #(.GPR_ADDR_WIDTH(GPR_ADDR_WIDTH))
load_hazard_ctrl_inst
(
.ld_hz_ctrl_clk				(risc_clk			),
.ld_hz_ctrl_rst				(risc_rst_r			),
.wdt_reset_i                (wdt_reset_w        ),
.id_ex_mem_rd_en			(id_ex_mem_rd_en	),
.id_ex_rd				    (id_ex_rd			),
.if_id_rs1				    (rs1				),
.if_id_rs2				    (rs2				),
.stall_pipeline  			(stall_pipeline		),
.stall_en           	    (stall_en			),
.mult_valid_i               (mult_valid_w       ),
.div_valid_i                (div_valid_w        ),
.rem_valid_i                (rem_valid_w        ),
.div_busy_i                 (div_busy_w         ),
.rem_busy_i                 (rem_busy_w         ),
.uart_mem_read_en(uart_mem_read_en),
.dm_ar_valid_out (DM_AR_VALID_OUT),
.data_mem_write_en_to_stall(data_mem_write_en_to_stall),
.uart_read_stall(uart_read_stall)


/*.debug_mode_valid_i(debug_mode_valid_w  ),
.debug_mode_reset_i(dbg_hart_only_rst_w ),
.debug_ndm_reset_i   (dbg_ndmrst_w        )*/

);

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//																//
//		BRANCH CONDITION CHECK AND TARGET PC CALCULATION UNIT								//
//																//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
branch_condition_check #(.DATA_WIDTH    (DATA_WIDTH    ),
                         .OPCODE        (OPCODE        ), 
                         .FUNC3         (FUNC3         ),
                         .PC_WIDTH      (PC_WIDTH      ),
                         .GPR_ADDR_WIDTH(GPR_ADDR_WIDTH) )
branch_condition_check_inst
(
.br_clk					(risc_clk			    ),
.br_rst					(risc_rst_r			    ),
.wdt_reset_i            (wdt_reset_w            ),
.opcode					(opcode				    ),
.stall_en				(stall_en			    ),
.func3					(func3				    ),
.rs1_data				(addr_gen_rs1_data		),
.rs2_data				(target_addr_rs2_data	),
.alu_data				(addr_alu_out			),
.mem_wb_data			(addr_gen_data			),
.wb_data				(reg_write_data			),
.id_ex_rd				(rd				        ),		
.id_ex_reg_wr_en		(reg_wr_en			    ),	
.id_ex_rs1				(rs1				    ),
.id_ex_rs2				(rs2				    ),
.imm_val				(addr_gen_imm_val		),
.branch_en				(branch_en			    ),
.pc					    (pc				        ),
.branch_pc 				(branch_pc			    ),
.debug_mode_valid_i       (debug_mode_valid_w   )

);
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//																//
//			LOAD - STORE ADDRESS CALCULATION UNIT													//
//																//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

addr_gen #(.DATA_WIDTH(DATA_WIDTH),
           .GPR_ADDR_WIDTH(GPR_ADDR_WIDTH))
addr_gen_inst
(
.addr_clk				(risc_clk			    ),
.addr_rst				(risc_rst_r			    ),
.wdt_reset_i            (wdt_reset_w            ),
.rs1_data				(addr_gen_rs1_data		),	//from reg file
.imm_val				(addr_gen_imm_val		),	//from decoder
.alu_ctrl				(alu_ctrl			    ),
.id_ex_rd				(id_ex_rd			    ),
.id_ex_reg_wr_en		(id_ex_reg_wr_en		),
.id_ex_rs1				(rs1				    ),
.id_ex_mem_wr_en		(mem_wr_en			    ),
.id_ex_mem_rd_en		(mem_rd_en			    ),
.alu_data				(addr_alu_out			),
.mem_wb_data			(addr_gen_data			),
.wb_data				(reg_write_data			),
.addr					(ld_sd_addr			    ),//to execution phase
.byte_en				(id_ex_byte_en			),
.sign_bit				(id_ex_sign_bit			),
.de_ld_sd_addr_o		(de_ld_sd_addr_w		),
.ld_valid_o				(ld_valid_w			    ),
.sd_valid_o				(sd_valid_w			    ),
.byte_sel_o				(byte_sel_w			    ),
.stall_pipeline         (stall_pipeline         )
);


endmodule


module fwd #(parameter DATA_WIDTH = 0)
(
input       [DATA_WIDTH-1:0] 		rs1_data	        ,
input       [DATA_WIDTH-1:0]		rs2_data	        ,
input       [DATA_WIDTH-1:0] 		alu_out		        ,
input       [1:0]		            forward_a           ,
input       [1:0] 	                forward_b           ,
input       [DATA_WIDTH-1:0] 		reg_write_data	    ,
input       [DATA_WIDTH-1:0] 		reg_write_data_1    ,
output reg  [DATA_WIDTH-1:0] 	    alu_data_in_1	    ,
output reg  [DATA_WIDTH-1:0] 	    alu_data_in_2       ,
output reg  [DATA_WIDTH-1:0]	    store_data_r        ,
input                               debug_mode_valid_i  ,
input                               debug_mode_reset_i  ,
input                               debug_ndm_reset_i     

);
always@(*)
begin
	case(forward_a)
		2'b00:	begin
			alu_data_in_1 = rs1_data	    ;
			end
		2'b01:  begin
			alu_data_in_1 =  alu_out	    ;
			end
		2'b10:  begin
			alu_data_in_1 =	reg_write_data	;
			end
		2'b11:begin
			alu_data_in_1 = reg_write_data_1;
			end
		default:begin
			alu_data_in_1 	=rs1_data	    ;
			end
			endcase
end

always@(*)
begin

case(forward_b)

2'b00:	
begin
	alu_data_in_2 		= 	rs2_data	    ;
	store_data_r		=	rs2_data	    ;
end
2'b01:  
begin
	alu_data_in_2 		= 	alu_out		    ;
	store_data_r		= 	alu_out		    ;
end
2'b10:  
begin
	alu_data_in_2 		= 	reg_write_data	;
	store_data_r		=	reg_write_data	;	
end
2'b11:
begin
	alu_data_in_2 		= 	reg_write_data_1;
	store_data_r		=	reg_write_data_1;
end
default:
begin
	alu_data_in_2 		=	rs2_data	    ;
	store_data_r		=	rs2_data	    ;
end
endcase
end
endmodule

// to select the memory for load instruction depending on the address range

module memory_read_mux#(parameter DATA_WIDTH = 0)
(
input                   z_clk                       ,
input                   z_rst                       ,
input                   wdt_reset_i                 ,
input 		            mem_rd_en			        ,
input [DATA_WIDTH-1:0] 	mem_rd_addr		            ,
input 		            mem_wr_en			        ,
input                   stall_pipeline              ,
output 		            zic_mmr_read_en_o		    ,//to mmr
output [15:0]	        zic_mmr_read_addr		    ,//to mmr
output 		            zic_mmr_write_en_o		    ,//to mmr
output 	[15:0]	        zic_mmr_write_addr_o	    ,//to mmr
output reg	            data_mem_data_rd_en	        ,
output reg              data_mem_data_wr_en         ,
output reg              mem_addr_invalid_o          ,
input                   debug_mode_valid_i          ,
input                   debug_mode_reset_i          ,
input                   debug_ndm_reset_i           ,
input                   debug_mem_read_enable       , 
input                   debug_mem_write_enable      , 
input [DATA_WIDTH-1:0]  debug_mem_read_addr         , 
input [DATA_WIDTH-1:0]  debug_mem_write_addr        ,
output  reg             debug_instr_mem_access_valid 


);
wire                    mem_rd_en_w1        ;
wire                    mem_wr_en_w1        ;
wire                    mem_rd_en_w         ;
wire                    mem_wr_en_w         ;
reg                     zic_mmr_valid       ;
reg                     debug_mode_valid_r  ;
wire [DATA_WIDTH-1:0]   debug_mem_addr      ;
wire [DATA_WIDTH-1:0]   mem_rd_addr_w       ;

always@(posedge z_clk or negedge z_rst)
begin
    if(!z_rst)
    begin
    debug_mode_valid_r <= 1'b0;
    end
    else
    begin
    debug_mode_valid_r <= debug_mode_valid_i;
    end
end

assign debug_mem_addr = debug_mem_read_enable         ? debug_mem_read_addr    : debug_mem_write_addr ;
assign mem_rd_en_w1   = (stall_pipeline & mem_rd_en ) ? 1'b0                   : mem_rd_en;
assign mem_wr_en_w1   = (stall_pipeline & mem_wr_en ) ? 1'b0                   : mem_wr_en;
assign mem_rd_en_w    = debug_mode_valid_r            ? debug_mem_read_enable  : mem_rd_en_w1 ;
assign mem_wr_en_w    = debug_mode_valid_r            ? debug_mem_write_enable : mem_wr_en_w1 ;
assign mem_rd_addr_w  = debug_mode_valid_r            ? debug_mem_addr         : mem_rd_addr ;

always@(*)
begin
	if((mem_rd_en_w | mem_wr_en_w))
		begin
		    if(mem_rd_addr_w <= {{DATA_WIDTH-16{1'b0}},16'd32767})// zic memory map address range
		    begin
		        zic_mmr_valid                 = 1'b1        ;
			    data_mem_data_rd_en           = 1'b0		;
                data_mem_data_wr_en           = 1'b0        ;
                mem_addr_invalid_o            = 1'b0        ;
                debug_instr_mem_access_valid  = 0           ;

		     end
		    else if(mem_rd_addr_w >= 64'd163840 && mem_rd_addr_w <= 64'd376831)//data memory address range uart - d311296
		        begin
			    zic_mmr_valid                 = 1'b0        ;
			    data_mem_data_rd_en           = mem_rd_en_w	;
                data_mem_data_wr_en           = mem_wr_en_w ;
                mem_addr_invalid_o            = 1'b0        ;   
                debug_instr_mem_access_valid  = 0           ;
			
		    end
            else if((mem_rd_addr_w >=  64'd32768 && mem_rd_addr_w <= 64'd163829))//memory out of bound 
            begin
			    zic_mmr_valid                 = 1'b0        ;
			    data_mem_data_rd_en           = 1'b0	    ;
                data_mem_data_wr_en           = 1'b0        ;
                mem_addr_invalid_o            = 1'b1        ;
                debug_instr_mem_access_valid  = 1'b1        ;

            end
	end
    else
	begin
		    zic_mmr_valid                   = 1'b0      ;
			data_mem_data_rd_en             = 1'b0		;
            data_mem_data_wr_en             = 1'b0      ;
            mem_addr_invalid_o              = 1'b0      ;
            debug_instr_mem_access_valid    = 1'b0      ;
	end
end

assign zic_mmr_read_en_o	= 	zic_mmr_valid ? mem_rd_en_w 		    : 1'b0	;
assign zic_mmr_read_addr	=   zic_mmr_valid ?	(mem_rd_addr_w[15:0]) 	: 16'd0 ;
assign zic_mmr_write_en_o	= 	zic_mmr_valid ?	mem_wr_en_w 		    : 1'b0  ;
assign zic_mmr_write_addr_o	= 	zic_mmr_valid ?	(mem_rd_addr_w[15:0]) 	: 16'd0 ;
endmodule


module store_data
#(parameter DATA_WIDTH = 0,
    PC_WIDTH = 0 )
(
input 			                risc_clk	        ,
input 			                risc_rst	        ,
input                           wdt_reset_i         ,
input       [DATA_WIDTH-1:0] 	alu_out 	        ,
input       [DATA_WIDTH-1:0] 	mem_out 	        ,
input       [DATA_WIDTH-1:0] 	reg_write_data	    ,
input       [DATA_WIDTH-1:0]	store_data_r	    ,
input       [DATA_WIDTH-1:0]    csr_rd_data_i       ,//from csr
output reg  [DATA_WIDTH-1:0]    csr_to_mux          ,
input       [PC_WIDTH-1  :0]	if_id_pc	        ,
input       [11:0]	            alu_ctrl	        ,
output reg  [DATA_WIDTH-1:0] 	store_data	        ,
output reg  [DATA_WIDTH-1:0] 	alu_to_mux	        ,
output reg  [DATA_WIDTH-1:0] 	mem_to_mux	        ,
output reg  [DATA_WIDTH-1:0] 	reg_write_data_1    ,
output reg  [11:0]	            alu_ctrl_mem	    ,
output reg  [PC_WIDTH-1  :0]	id_ex_pc            ,
input                           debug_mode_valid_i  ,
input                           debug_mode_reset_i  ,
input                           debug_ndm_reset_i     

);

always@(posedge risc_clk or negedge risc_rst)
begin
if(!risc_rst )
begin
	store_data 		    <=		{DATA_WIDTH{1'b0}};
	alu_to_mux		    <=		{DATA_WIDTH{1'b0}};
	mem_to_mux 		    <= 		{DATA_WIDTH{1'b0}};
	reg_write_data_1 	<=		{DATA_WIDTH{1'b0}};
	alu_ctrl_mem		<= 		12'd0;
	id_ex_pc		    <=		12'd0;
    csr_to_mux          <=      {DATA_WIDTH{1'b0}};
end
else if(debug_mode_reset_i | debug_ndm_reset_i | wdt_reset_i) 
begin
    store_data 		    <=		{DATA_WIDTH{1'b0}};
	alu_to_mux		    <=		{DATA_WIDTH{1'b0}};
	mem_to_mux 		    <= 		{DATA_WIDTH{1'b0}};
	reg_write_data_1 	<=		{DATA_WIDTH{1'b0}};
	alu_ctrl_mem		<= 		12'd0;
	id_ex_pc		    <=		12'd0;
    csr_to_mux          <=      {DATA_WIDTH{1'b0}};

end
else
begin
	store_data		    <= 	store_data_r	;
	alu_to_mux		    <=	alu_out			;
	mem_to_mux 		    <= 	mem_out 		;
	reg_write_data_1 	<= 	reg_write_data	;
	alu_ctrl_mem		<= 	alu_ctrl		;
	id_ex_pc		    <= 	if_id_pc		;
    csr_to_mux          <= csr_rd_data_i    ;
 end
end

endmodule


module pipe #(parameter DATA_WIDTH = 0,
parameter GPR_ADDR_WIDTH = 0,
parameter CSR_ADDR_WIDTH = 0) 

(
input 		                            risc_clk			        ,
input 		                            risc_rst			        ,
input                                   wdt_reset_i,
input [GPR_ADDR_WIDTH-1:0]	            rd			   	            ,
input 		            reg_wr_en			        ,
input 		            mem_rd_en			        ,
input 		            mem_wr_en			        ,
input 		            mem_to_reg_en			    ,
input 		            stall_pipeline			    ,
output  reg [GPR_ADDR_WIDTH-1:0]       id_ex_rd  			        ,	    
output  reg [GPR_ADDR_WIDTH-1:0]       ex_mem_rd 			        ,	    
output  reg [GPR_ADDR_WIDTH-1:0]       mem_wb_rd 			        ,    	
output  reg	            id_ex_reg_wr_en     		,
output  reg	            ex_mem_reg_wr_en    		,
output   	        mem_wb_reg_wr_en_o    		,
output reg 	            id_ex_mem_rd_en     		,
output reg 	            ex_mem_mem_rd_en    		,
output reg 	            id_ex_mem_wr_en     		,
output reg 	            ex_mem_mem_wr_en    		,
output reg 	            id_ex_mem_to_reg_en 		,
output reg 	            ex_mem_mem_to_reg_en		,
output  reg	            mem_wb_mem_to_reg_en		,
output reg [CSR_ADDR_WIDTH-1:0]       ex_mem_csr_addr_o		    ,//to csr
output reg 	            ex_mem_csr_write_en_o		,//to csr
output reg 	            ex_mem_csr_read_en_o		,
output reg [DATA_WIDTH-1:0]       ex_mem_csr_write_data_o 	,//to csr
output reg 	            ex_mem_csr_set_valid_o  	,
output reg 	            ex_mem_csr_clear_valid_o	,
input [DATA_WIDTH-1:0]            csr_write_data_i		    ,
input [DATA_WIDTH-1:0]            csr_imm_data_i  		    ,
input 	                csr_imm_valid_i		        ,
input [CSR_ADDR_WIDTH-1:0] 	        csr_addr_i			        ,
input 		            csr_write_en_i		        ,
input 	                csr_read_en_i			    ,
input 		            csr_set_valid_i		        ,
input 		            csr_clear_valid_i	        ,
output  reg             csr_rd_en_to_mux            ,
input                   debug_mode_valid_i          ,
input                   debug_mode_reset_i          ,
input                   debug_ndm_reset_i           ,
input                   div_rem_valid_i             ,
input                   div_busy_i  ,
input                   rem_busy_i  ,
input                   mult_valid_i,
input                   div_valid_i ,
input                   rem_valid_i ,
input                   uart_valid,
output reg r_ex_mem_reg_wr_en


               
 



);

reg       mult_valid_r;
reg       div_valid_r;
reg       rem_valid_r;
reg       rem_busy_r;
reg       div_busy_r;
reg         rem_valid_r1;
reg [DATA_WIDTH-1:0] 	id_ex_csr_write_data	;
reg 		id_ex_csr_clear_valid   ;
reg 	   	id_ex_csr_set_valid	;
reg 		id_ex_csr_read_en	;
reg 		id_ex_csr_write_en	;
reg [CSR_ADDR_WIDTH-1:0] 	id_ex_csr_addr		;

reg mem_wb_reg_wr_en;
reg         csr_imm_valid_r ;
reg [DATA_WIDTH-1:0]  csr_imm_data_r  ;
reg div_rem_valid_r;
wire [DATA_WIDTH-1:0] csr_write_data_w;
wire [DATA_WIDTH-1:0] csr_write_data_w1;

assign csr_write_data_w = csr_imm_valid_r ? csr_imm_data_r : csr_write_data_i ;

assign csr_write_data_w1 = stall_pipeline ? {DATA_WIDTH{1'b0}} : csr_write_data_w ;
assign mem_wb_reg_wr_en_o = mem_wb_reg_wr_en || div_rem_valid_r;


always@(posedge risc_clk or negedge risc_rst )
begin
	if(!risc_rst )
	begin
        mult_valid_r <= 1'b0;
        div_valid_r  <= 1'b0;
        rem_valid_r  <= 1'b0;
        rem_busy_r   <= 1'b0;
        div_busy_r   <= 1'b0;
        rem_valid_r1 <= 1'b0;


    end
    else
    begin
        mult_valid_r <= mult_valid_i;
        div_valid_r  <= div_valid_i ;
        rem_valid_r  <= rem_valid_i ;
        rem_busy_r   <= rem_busy_i;
        div_busy_r   <= div_busy_i;
        rem_valid_r1 <= rem_valid_r;

        

    end
end
wire div_oper;
wire rem_oper;

assign div_oper = div_busy_r|| div_valid_r || mult_valid_r || div_busy_i;
assign rem_oper = rem_busy_i || rem_valid_r||rem_valid_r1 ||rem_busy_r;
always@(posedge risc_clk or negedge risc_rst )
begin
	if(!risc_rst )
	begin
		        id_ex_rd  		        <= 5'd0;
		        ex_mem_rd 		        <= 5'd0; 
		        mem_wb_rd 		        <= 5'd0;
		        id_ex_reg_wr_en 	    <= 1'd0;			
                ex_mem_reg_wr_en	    <= 1'd0;		
                mem_wb_reg_wr_en	    <= 1'd0;
		        id_ex_mem_rd_en 	    <= 1'd0;	
               	ex_mem_mem_rd_en	    <= 1'd0;	
		        id_ex_mem_wr_en 	    <= 1'd0; 	
                ex_mem_mem_wr_en	    <= 1'd0;	
		        id_ex_mem_to_reg_en 	<= 1'd0;	
                ex_mem_mem_to_reg_en	<= 1'd0;	
                mem_wb_mem_to_reg_en	<= 1'd0;
			    id_ex_csr_write_data	<= {DATA_WIDTH{1'b0}};	
			    id_ex_csr_clear_valid   <= 1'b0; 
			    id_ex_csr_set_valid	    <= 1'b0;
			    id_ex_csr_read_en	    <= 1'b0;
			    id_ex_csr_write_en	    <= 1'b0;
                id_ex_csr_addr		    <= 12'd0;
			    ex_mem_csr_write_data_o	<= {DATA_WIDTH{1'b0}};	
			    ex_mem_csr_clear_valid_o<= 1'b0; 
			    ex_mem_csr_set_valid_o	<= 1'b0;
			    ex_mem_csr_read_en_o	<= 1'b0;
			    ex_mem_csr_write_en_o	<= 1'b0;
                ex_mem_csr_addr_o	    <= 12'd0;
                csr_rd_en_to_mux        <= 1'b0;
                csr_imm_valid_r         <= 1'b0;
                csr_imm_data_r          <= {DATA_WIDTH{1'b0}};
                div_rem_valid_r         <= 1'b0;
                r_ex_mem_reg_wr_en      <= 1'b0;
			
	end
    else if(debug_mode_reset_i | debug_ndm_reset_i | wdt_reset_i )
    begin
        		id_ex_rd  		        <= 5'd0;
		        ex_mem_rd 		        <= 5'd0; 
		        mem_wb_rd 		        <= 5'd0;
		        id_ex_reg_wr_en 	    <= 1'd0;			
                ex_mem_reg_wr_en	    <= 1'd0;		
                mem_wb_reg_wr_en	    <= 1'd0;
		        id_ex_mem_rd_en 	    <= 1'd0;	
               	ex_mem_mem_rd_en	    <= 1'd0;	
		        id_ex_mem_wr_en 	    <= 1'd0; 	
                ex_mem_mem_wr_en	    <= 1'd0;	
		        id_ex_mem_to_reg_en 	<= 1'd0;	
                ex_mem_mem_to_reg_en	<= 1'd0;	
                mem_wb_mem_to_reg_en	<= 1'd0;
			    id_ex_csr_write_data	<= {DATA_WIDTH{1'b0}};	
			    id_ex_csr_clear_valid   <= 1'b0; 
			    id_ex_csr_set_valid	    <= 1'b0;
			    id_ex_csr_read_en	    <= 1'b0;
			    id_ex_csr_write_en	    <= 1'b0;
                id_ex_csr_addr		    <= 12'd0;
			    ex_mem_csr_write_data_o	<= {DATA_WIDTH{1'b0}};	
			    ex_mem_csr_clear_valid_o<= 1'b0; 
			    ex_mem_csr_set_valid_o	<= 1'b0;
			    ex_mem_csr_read_en_o	<= 1'b0;
			    ex_mem_csr_write_en_o	<= 1'b0;
                ex_mem_csr_addr_o	    <= 12'd0;
                csr_rd_en_to_mux        <= 1'b0;
                csr_imm_valid_r         <= 1'b0;
                csr_imm_data_r          <= {DATA_WIDTH{1'b0}};
                r_ex_mem_reg_wr_en <= 1'b0;
    end
	else
	begin
		if((!stall_pipeline))
		begin			
		        id_ex_rd  			    <= rd			        ;		
                ex_mem_rd 			    <= id_ex_rd		        ;				 
                id_ex_reg_wr_en 		<= reg_wr_en		    ;
               ex_mem_reg_wr_en		<= id_ex_reg_wr_en	    ;				  
                id_ex_mem_rd_en 		<= mem_rd_en		    ;
                ex_mem_mem_rd_en		<= id_ex_mem_rd_en	    ;
                id_ex_mem_wr_en 		<= mem_wr_en		    ;
                ex_mem_mem_wr_en		<= id_ex_mem_wr_en	    ;
                id_ex_mem_to_reg_en 	<= mem_to_reg_en	    ;
                ex_mem_mem_to_reg_en	<= id_ex_mem_to_reg_en	;
		        id_ex_csr_write_data	<= csr_write_data_w	    ;	
		        id_ex_csr_clear_valid   <= csr_clear_valid_i	;
		        id_ex_csr_set_valid		<= csr_set_valid_i	    ;
		        id_ex_csr_read_en		<= csr_read_en_i	    ;
		        id_ex_csr_write_en		<= csr_write_en_i	    ;
                id_ex_csr_addr			<= csr_addr_i	        ;
		        ex_mem_csr_write_data_o	<= csr_write_data_w1	;	
		        ex_mem_csr_clear_valid_o<= id_ex_csr_clear_valid;  
		        ex_mem_csr_set_valid_o	<= id_ex_csr_set_valid	;
		        ex_mem_csr_read_en_o	<= id_ex_csr_read_en	;
		        ex_mem_csr_write_en_o	<= id_ex_csr_write_en	;
                ex_mem_csr_addr_o		<= id_ex_csr_addr	    ;	
                csr_imm_valid_r         <= csr_imm_valid_i      ;
                csr_imm_data_r          <= csr_imm_data_i       ;
                if(uart_valid)
                begin
                    r_ex_mem_reg_wr_en		<= 1'b0	    ;	
                end
                else
                begin
                    r_ex_mem_reg_wr_en		<= id_ex_reg_wr_en	    ;	
                end
		end
      else if(div_oper )
        begin
        id_ex_rd  		<=id_ex_rd;  
		ex_mem_rd 		<=ex_mem_rd;
        id_ex_reg_wr_en 		<= id_ex_reg_wr_en		    ;
        ex_mem_reg_wr_en		<= ex_mem_reg_wr_en	    ;	
        end
         else if( rem_oper)
         begin
        id_ex_rd  		<=id_ex_rd;  
		ex_mem_rd 		<=ex_mem_rd;
        id_ex_reg_wr_en 		<= id_ex_reg_wr_en		    ;
        ex_mem_reg_wr_en		<= ex_mem_reg_wr_en	        ;	
         end
        //else if(rem_busy_r || div_busy_r)
        //begin
        //id_ex_rd  		<=id_ex_rd;  
        //id_ex_reg_wr_en <=reg_wr_en ;
		//ex_mem_rd 		<=ex_mem_rd;
        //ex_mem_reg_wr_en<= ex_mem_reg_wr_en;

        //end

		else
		begin
	id_ex_rd  		<=5'd0;  
	ex_mem_rd 		<=5'd0;
		id_ex_reg_wr_en 	<=1'b0;
		ex_mem_reg_wr_en	<=1'b0;
		id_ex_mem_rd_en 	<=1'b0;
		ex_mem_mem_rd_en	<=1'b0;
		id_ex_mem_wr_en 	<=1'b0;
		ex_mem_mem_wr_en	<=1'b0;
		id_ex_mem_to_reg_en	<=1'b0; 
		ex_mem_mem_to_reg_en	<=1'b0;
		id_ex_csr_write_data	<={DATA_WIDTH{1'b0}};	
		id_ex_csr_clear_valid   <=1'b0;
		id_ex_csr_set_valid	    <=1'b0;
		id_ex_csr_read_en	    <=1'b0;
		id_ex_csr_write_en	    <=1'b0;
        id_ex_csr_addr		    <=12'd0;
        csr_imm_valid_r         <= 1'b0;
        csr_imm_data_r          <= {DATA_WIDTH{1'b0}};


		end
							 
                mem_wb_mem_to_reg_en	<= ex_mem_mem_to_reg_en	;
		mem_wb_rd 		<= ex_mem_rd		;
		mem_wb_reg_wr_en	<= ex_mem_reg_wr_en	;
        csr_rd_en_to_mux <= ex_mem_csr_read_en_o ;
        div_rem_valid_r <= div_rem_valid_i;
	end
end
endmodule



