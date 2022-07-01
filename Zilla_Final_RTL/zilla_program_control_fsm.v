`define ZILLA_32_BIT 
`timescale 1ns / 1ps
//state machine to control program flow and status update
module zilla_program_control_fsm
#(
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
input 			zpc_clk				,
input 			zpc_rst				,
input           wdt_reset_i         ,
input 			csr_mstatus_mie_i		,//from CSR
input 			zic_int_req_i			,//from zic
input 			stall_valid_i			,//from load hazard control block
input 			mret_valid_i			,//from decoder
input  	    [7:0]    	zic_mmr_ack_id_i		,//from zic_mmr	
input 			exception_valid_i		,//from exception detect block
input 	    [7:0] 	mcause_id_i			,//from CSR: new change
output			interrupt_valid_o		,//to pc update 
output  reg		csr_mstatus_mie_set_o		,//to CSR
output  		csr_mstatus_mie_clear_o		,//to CSR
output 			csr_mepc_write_valid_o		,//to CSR
output			zic_mmr_ack_read_valid_o	,//to zic mmr
output 			zic_mmr_eoi_write_valid_o	,//to zic mmr
output [7:0]    zic_mmr_eoi_id_o		,//to zic mmr
output [2:0]    zpc_pc_ctrl_o			,
output			trap_valid_o			,
output 			flush_valid_o		    ,
input           dbg_hartreset_i	        ,     
input           dbg_haltreq_i	        ,
input           dbg_resumereq_i	        ,
input           dbg_ndmrst_i            ,
input           dbg_setresethaltreq_i   ,
input           ebreak_valid_i          ,
output   reg       hart_halt_valid_o       ,
output          hart_resume_valid_o    ,
input resethaltreq_i
);

reg [2:0] present_state_r;
reg [2:0] next_state_r;
localparam RST 		= 3'b000;
localparam PC_INC	= 3'b001;
localparam TRAP_ENTRY   = 3'b010;
localparam TRAP_EXIT	= 3'b011;
localparam DEBUG_ENTRY  = 3'b100;
localparam DEBUG_EXIT   = 3'b101;
//localparam STALL	= 3'b100;
wire [7:0]eoi_id_w;
wire  csr_mstatus_mie_set_w;

//wire interrupt_valid_0;//op
wire trap_valid_r ;
assign trap_valid_o = trap_valid_r;

//assign trap_valid_r = (zic_int_req_i & csr_mstatus_mie_i) ? 1'b1 : 1'b0;
assign interrupt_valid_o = (zic_int_req_i & csr_mstatus_mie_i) ? 1'b1 : 1'b0;
assign trap_valid_r	= interrupt_valid_o | exception_valid_i;

//reg stall_valid_r;
//reg stall_valid_r1;
////////present state logic///////////////////////////
always@(posedge zpc_clk or negedge zpc_rst)
begin
	if(!zpc_rst )
	begin
		present_state_r <= RST		;
		csr_mstatus_mie_set_o <= 1'b0	;
	//	stall_valid_r <= 1'b0;
	//	stall_valid_r1 <= 1'b0;

	end
  /*else if(resethaltreq_i)
    begin
        present_state_r <= DEBUG_ENTRY;
        csr_mstatus_mie_set_o <= 1'b0	;

    end*/
   else if(dbg_hartreset_i | dbg_ndmrst_i | wdt_reset_i)
   begin
       		present_state_r <= RST		;
		csr_mstatus_mie_set_o <= 1'b0	;

   end
	else
	begin
		present_state_r <= next_state_r ;
		csr_mstatus_mie_set_o	<= csr_mstatus_mie_set_w;
	end
end
///////////////////////////////////////////////////////


///////next state logic////////////////////////////////
always@(*)
begin
	case(present_state_r)
		RST:
		begin
            //hart_halt_valid_o = 1'b0;
			if(zpc_rst &&(!dbg_hartreset_i) && (!dbg_ndmrst_i) && resethaltreq_i)
			begin
				next_state_r = DEBUG_ENTRY	;
			end
			else if((zpc_rst &&(!dbg_hartreset_i) && (!dbg_ndmrst_i) && (!resethaltreq_i)))
			begin
				next_state_r = 	PC_INC;
			end
            else
            begin
                next_state_r = RST;
            end
		end
        DEBUG_ENTRY:
        begin
            //hart_halt_valid_o = 1'b1;
            if(dbg_resumereq_i)
            begin
                next_state_r = DEBUG_EXIT;
            end
            else
            begin
                next_state_r = DEBUG_ENTRY;
            end
        end
        DEBUG_EXIT:
        begin
           //hart_halt_valid_o =1'b0;
            next_state_r = PC_INC;
        end
		PC_INC:
		begin
            //hart_halt_valid_o = 1'b0;
            if(dbg_haltreq_i | ebreak_valid_i)
            begin
                next_state_r = DEBUG_ENTRY;
            end
            /*else if(dbg_resumereq_i)
            begin
                next_state_r = DEBUG_EXIT;
            end*/
			else if(trap_valid_r)
			begin
				next_state_r = TRAP_ENTRY; 
			end
			else if(mret_valid_i)
			begin
				next_state_r = TRAP_EXIT;
			end
		//	else if(stall_valid_i)
		//	begin
		//		next_state_r = STALL;
		//	end
			else
			begin
               //hart_halt_valid_o = 1'b0;
				next_state_r = PC_INC;
			end
		end
		TRAP_ENTRY:
		begin
             //hart_halt_valid_o = 1'b0;
			if(!trap_valid_r)
			begin
				next_state_r = PC_INC;
			end
			else
			begin
				next_state_r = TRAP_ENTRY;
			end
		
		end
		TRAP_EXIT:
		begin
             //hart_halt_valid_o = 1'b0;
			if(!mret_valid_i)
			begin
				next_state_r = PC_INC;
			end
			else
			begin
				next_state_r = TRAP_EXIT;
			end
		
		end
	/*	STALL:
		begin
			if(!stall_valid_i)
			begin
				next_state_r = PC_INC;
			end
			else
			begin
				next_state_r = STALL;
			end
		end*/
		default:
		begin
			next_state_r = PC_INC;
             //hart_halt_valid_o = 1'b0;
		end
	endcase
end

/*always@(posedge zpc_clk or negedge zpc_rst)
begin
        	if(!zpc_rst )
	        begin
                hart_halt_valid_o <= 1'b0;
            end
            else if (dbg_hartreset_i | dbg_ndmrst_i)
            begin
                hart_halt_valid_o <= 1'b0;
            end
            else if(present_state_r == DEBUG_ENTRY)
            begin
                hart_halt_valid_o <= 1'b1;
            end
            else
            begin
                hart_halt_valid_o <= 1'b0 ; 
            end


end*/

always@(*)
begin
             if (dbg_hartreset_i | dbg_ndmrst_i | wdt_reset_i)
            begin
                hart_halt_valid_o = 1'b0;
            end
            else if(present_state_r == DEBUG_ENTRY)
            begin
                hart_halt_valid_o = 1'b1;
            end
            else
            begin
                hart_halt_valid_o = 1'b0 ; 
            end


end

//assign hart_halt_valid_o = (present_state_r == DEBUG_ENTRY) ? 1'b1 : 1'b0;
assign hart_resume_valid_o = (present_state_r == DEBUG_EXIT ) ? 1'b1 : 1'b0;
assign zpc_pc_ctrl_o = present_state_r;
assign csr_mstatus_mie_set_w    = (present_state_r == TRAP_EXIT )  ? 1'b1 : 1'b0;
assign csr_mstatus_mie_clear_o  = (present_state_r == TRAP_ENTRY)  ? 1'b1 : 1'b0;
assign csr_mepc_write_valid_o   = (present_state_r == TRAP_ENTRY)  ? 1'b1 : 1'b0;
assign zic_mmr_ack_read_valid_o = (present_state_r == TRAP_ENTRY)  ? 1'b1 : 1'b0;
//assign flush_valid_o 		= (((present_state_r == RST) | present_state_r == TRAP_ENTRY) | (present_state_r == STALL)) ? 1'b1 :1'b0 ;
assign flush_valid_o 		= (((present_state_r == RST) | present_state_r == TRAP_ENTRY)| (present_state_r == TRAP_EXIT)) ? 1'b1 :1'b0 ;
/////////interrupt id fifo for nested interrupts////////////////////

//always@(posedge 
/*cs_fifo eoi_fifo_inst
(
.fifo_clk		        (zpc_clk),
.fifo_rst		        (zpc_rst),
.interrupt_valid_i		(interrupt_valid_o),
.exception_valid_i	    (exception_valid_i),
.mret_valid_i		    (mret_valid_i),
.din			        (zic_mmr_ack_id_i),
.dout			        (eoi_id_w)
);*/

assign zic_mmr_eoi_id_o = mret_valid_i ? mcause_id_i : 0 ;
assign zic_mmr_eoi_write_valid_o= mret_valid_i  ? 1'b1 : 1'b0;
//assign zic_mmr_eoi_id_o = eoi_id_w;
//assign zic_mmr_eoi_write_valid_o = mret_valid_i ? 1'b1 : 1'b0 ;
////////////////////////////////////////////////////////////////////////////////////

endmodule


