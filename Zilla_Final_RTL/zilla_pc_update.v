`define ZILLA_32_BIT 
`timescale 1ns / 1ps

//program count(instruction read addr) update

module zilla_pc_update
#(
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
input 			z_clk			,
input 			z_rst			,
input           wdt_reset_i     ,
input 	   [2 :0] 	zpc_pc_ctrl_i		,
input 	   [7 :0] 	ack_interrupt_id_i	,
input 	   [DATA_WIDTH-1:0] 	csr_mtvec_i		,
input 			trap_valid_i		,
input 	   [PC_WIDTH-1:0] 	csr_mepc_i		,
input               	branch_valid_i 		,
input      [PC_WIDTH-1:0]   	branch_pc_i		,
input           stall_valid_i       ,
input 			interrupt_valid_i	,
input 			exception_valid_i	,
input 	   [DATA_WIDTH-1:0]	exception_handler_addr_i,
output reg [PC_WIDTH-1:0] 	csr_mepc_o		,
output 	   [PC_WIDTH-1:0] 	instr_read_addr_o 	,
output 	 reg		z_instruction_read_enable_o,
output reg      read_write_ptr_valid    ,
input      [PC_WIDTH-1:0]      dpc_i   ,
input          debug_mode_valid_i,
input dbg_hartreset_i,
input dbg_ndmrst_i,
input dbg_haltreq_i

//output     [PC_WIDTH-1:0]      dpc_o        

);
reg branch_valid_r ;
reg debug_mode_valid_r;
reg [PC_WIDTH-1:0] pc_r ;
reg [PC_WIDTH-1:0] next_pc_r;
localparam BOOT_SEQ = 20'h8100;//20'h8100
localparam RST 		= 3'b000;
localparam PC_INC	= 3'b001;
localparam TRAP_ENTRY   = 3'b010;
localparam TRAP_EXIT	= 3'b011;
localparam DEBUG_ENTRY = 3'b100;
localparam DEBUG_EXIT  = 3'b101;
//localparam STALL	= 3'b100;

wire [DATA_WIDTH-1:0] trap_vec_addr_r;
wire [DATA_WIDTH-1:0] int_val;
wire [DATA_WIDTH-1:0] interrupt_vec_addr_r;
wire [PC_WIDTH-1:0] trap_pc;

assign trap_pc = (pc_r - {{DATA_WIDTH-4{1'b0}},4'b0100} );//{{DATA_WIDTH-4{1'b0}},4'b0100}
assign int_val = ack_interrupt_id_i << 2 ;
reg  z_instruction_read_enable_w;
//reg debug_mode_valid;
assign interrupt_vec_addr_r = {csr_mtvec_i[DATA_WIDTH-1:2],2'b00} + int_val;
assign trap_vec_addr_r = exception_valid_i ? exception_handler_addr_i : interrupt_vec_addr_r ;
//assign dpc_o = pc_r - 20'd2;

reg stall_valid_r;
wire pos_debug_valid;
wire debug_branch_valid;
reg [PC_WIDTH-1:0] branch_pc_r ;
always@(posedge z_clk or negedge z_rst)
begin
    if(!z_rst)
    begin
        stall_valid_r <= 1'b0;
        debug_mode_valid_r <= 1'b0;
        branch_valid_r <= 1'b0;
        branch_pc_r <= 0;
    end
    else
    begin
        stall_valid_r <= stall_valid_i;
        debug_mode_valid_r <= debug_mode_valid_i;
        branch_valid_r <= branch_valid_i;
        branch_pc_r <= branch_pc_i;
    end
end

assign pos_debug_valid = debug_mode_valid_i ^  debug_mode_valid_r;
assign debug_branch_valid = branch_valid_r && pos_debug_valid ;
always@(posedge z_clk or negedge z_rst)
begin
if(!z_rst )
begin
			pc_r <= {{PC_WIDTH-20{1'b0}},20'h8100};//{{PC_WIDTH-12{1'b0}},12'h100}
			z_instruction_read_enable_w <= 1'b0 ;
            //debug_mode_valid_o <= 1'b0;
end
else if(dbg_hartreset_i | dbg_ndmrst_i | wdt_reset_i)
begin
    	    pc_r <= {{PC_WIDTH-20{1'b0}},20'h8100};
			z_instruction_read_enable_w <= 1'b0 ;
           // debug_mode_valid_o <= 1'b0;

end
else
begin
	case(zpc_pc_ctrl_i)
		RST:
		begin
			pc_r <= BOOT_SEQ;
			z_instruction_read_enable_w <= 1'b0 ;
            //debug_mode_valid_o <= 1'b0;

		end
		PC_INC:
		begin
            if(!dbg_haltreq_i)
            begin
			pc_r <= next_pc_r;
			z_instruction_read_enable_w <= 1'b1 ;
       end
           // debug_mode_valid_o <= 1'b0;



		end
		TRAP_ENTRY:
		begin
			pc_r <= trap_vec_addr_r;
			z_instruction_read_enable_w <= 1'b1 ;
           // debug_mode_valid_o <= 1'b0;

		end
		TRAP_EXIT:
		begin
			pc_r <= csr_mepc_i;
			z_instruction_read_enable_w <= 1'b1 ;
		end
        DEBUG_ENTRY:
        begin
            if(debug_branch_valid)
            begin
            pc_r <= branch_pc_r    ;
            end
            else
            begin
                pc_r <= pc_r;
            end
          //  debug_mode_valid_o <= 1'b1;
            z_instruction_read_enable_w <= 1'b0;
        end
        DEBUG_EXIT:
        begin
            pc_r <= pc_r  ;
         //   debug_mode_valid_o <= 1'b0;
            z_instruction_read_enable_w <= 1'b1;
        end
		default:
		begin
			pc_r <= next_pc_r;
           // debug_mode_valid_o <= 1'b0;
			z_instruction_read_enable_w <= 1'b0 ;
			end
	endcase
	end
end


always@(*)
begin
    if((debug_mode_valid_i) | (stall_valid_i | stall_valid_r))
    begin
        next_pc_r = pc_r ;
        z_instruction_read_enable_o = 1'b0;
    end
    else if(branch_valid_i)
    begin
        next_pc_r = branch_pc_i;
        z_instruction_read_enable_o = 1'b1;
    end
    else
    begin
        if(z_instruction_read_enable_w)
        begin
        next_pc_r = pc_r + {{DATA_WIDTH-4{1'b0}},4'b0100};
        z_instruction_read_enable_o = z_instruction_read_enable_w;
        end
        else
        begin
        next_pc_r = pc_r ;
        z_instruction_read_enable_o = 1'b0;

        end

    end

end

always@(*)
begin
    if(stall_valid_i)
    begin
        read_write_ptr_valid = 1'b0;
    end
    else if(branch_valid_i)
    begin
        read_write_ptr_valid = 1'b1;
    end
    else
    begin
        if(z_instruction_read_enable_w)
        begin
        read_write_ptr_valid = z_instruction_read_enable_w;
        end
        else
        begin
        read_write_ptr_valid = 1'b0;

        end

    end

end

always@(posedge z_clk or negedge z_rst)
begin
	if(!z_rst)
	begin
		csr_mepc_o <= {PC_WIDTH{1'b0}};
	end
	else
	begin
		if(trap_valid_i)
		begin
			csr_mepc_o <= trap_pc;
		end
	end
end



assign instr_read_addr_o = pc_r;
endmodule
