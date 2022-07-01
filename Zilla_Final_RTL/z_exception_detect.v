`define ZILLA_32_BIT 
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: FRENUSTECH PVT LTD
// Engineer: SIDDARTHA HP
// 
// Create Date: 08/03/2021 03:50:28 PM
// Design Name: EXCEPTION DETECTION
// Module Name: z_exception_detect
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module z_exception_detect
#(
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
input 				z_clk			,
input 				z_rst			,
input               wdt_reset_i     ,
input 				invalid_instr_valid_i	,
input 				breakpoint_valid_i	,
input 				ecall_valid_i		,
input [PC_WIDTH-1:0] 			branch_pc_i		,
input [DATA_WIDTH-1:0] 			ld_sd_addr_i		,
input 				ld_valid_i		,
input 				sd_valid_i		,
input [DATA_WIDTH-1:0] 			csr_mtvec_i		,
input 				branch_valid_i		,
input [DATA_WIDTH-1:0]			data_mem_max_addr_i	,
input [1:0] 			byte_sel_i		,//indicates whether the load/store instruction is byte/halfword/word/doubleword
output [DATA_WIDTH-1:0] 			exception_handler_addr_o,
output reg			exception_valid_o	,
output reg [7:0] 		exception_id_o		,
output 				ld_sd_misalign_valid_o  ,
output [DATA_WIDTH-1:0] 			ld_sd_misalign_addr_o	,
output 				instr_misalign_valid_o  ,
output [PC_WIDTH-1:0] 			instr_misalign_addr_o	,
output 				invalid_instr_valid_o   ,
input               debug_mode_valid_i  ,
input stall_valid_i	,
input           debug_mem_read_enable         , 
input           debug_mem_write_enable        , 
input [DATA_WIDTH-1:0]           debug_mem_read_addr           , 
input [DATA_WIDTH-1:0]          debug_mem_write_addr       ,
input [(DATA_WIDTH>>3)-1:0] debug_mem_strobe,
output debug_exception_valid_o,
input mem_addr_invalid_i

//output [INSTRUCTION_WIDTH-1:0] 			invalid_instruction_in	
);

localparam INSTR_MIS_ALGN   = {DATA_WIDTH{1'b0}}	;
localparam ILLEGAL_INSTR    = 64'd2	;
localparam BREAKPOINT	    = 64'd3	;
localparam ECALL	    = 64'd11	;
localparam LD_ADDR_MIS_ALGN = 64'd4	;
localparam SD_ADDR_MIS_ALGN = 64'd6	;
localparam MEM_OUT_OF_BOUND = 64'd24	;


wire [DATA_WIDTH-1:0] debug_mem_addr_w;
assign debug_mem_addr_w = debug_mem_write_enable ? debug_mem_write_addr: debug_mem_read_addr ;
wire   w_instr_misalign_ex;
assign w_instr_misalign_ex = ((branch_pc_i[1:0] != 0) & branch_valid_i) ? 1'b1 : 1'b0;
wire   w_invalid_instr_ex;
assign w_invalid_instr_ex = invalid_instr_valid_i ;

wire   w_breakpoint_ex;
assign w_breakpoint_ex = breakpoint_valid_i;

wire   w_ecall_ex;
assign w_ecall_ex = ecall_valid_i;


wire w_ld_misalign_addr_ex;
wire w_sd_misalign_addr_ex;
reg w_ld_sd_misalign_addr_ex;
wire data_mem_addr_max_ex_w;
wire data_mem_addr_max_ex;
wire debug_mem_addr_max_ex;
reg debug_mem_misaligned_exception_w;
assign debug_mem_addr_max_ex = (debug_mode_valid_i && (debug_mem_addr_w > data_mem_max_addr_i)) ? 1'b1 : 1'b0 ;
	assign data_mem_addr_max_ex_w = ((ld_sd_addr_i > data_mem_max_addr_i) || mem_addr_invalid_i) ? 1'b1 : 0;
assign data_mem_addr_max_ex = ((ld_valid_i && (!stall_valid_i)) & (!w_ld_misalign_addr_ex) & (!w_sd_misalign_addr_ex))  ? data_mem_addr_max_ex_w : 0;
assign w_ld_misalign_addr_ex = (ld_valid_i && (!stall_valid_i)) ? w_ld_sd_misalign_addr_ex : 0 ;
assign w_sd_misalign_addr_ex = sd_valid_i ? w_ld_sd_misalign_addr_ex : 0 ;

//{w_instr_misalign_ex,w_invalid_instr_ex,w_breakpoint_ex,w_ecall_ex,w_ld_misalign_addr_ex,w_sd_misalign_addr_ex}

reg debug_mem_misaligned_exception_r ;
reg debug_mem_misaligned_exception_r1;
wire debug_mem_misaligned_exception_w1;
always@(posedge z_clk or negedge z_rst)
    begin
        if(!z_rst)
        begin
            debug_mem_misaligned_exception_r <= 1'b0;
            debug_mem_misaligned_exception_r1 <= 1'b0;
        end
        else
        begin
            debug_mem_misaligned_exception_r <= debug_mem_misaligned_exception_w;
            debug_mem_misaligned_exception_r1 <= debug_mem_misaligned_exception_r;

        end
    end
 
 assign debug_mem_misaligned_exception_w1 = debug_mem_misaligned_exception_w ^ debug_mem_misaligned_exception_r ;
always@(*)
begin
	case(byte_sel_i)
		2'b00://ld sd byte
		begin
			w_ld_sd_misalign_addr_ex = 1'b0;
		end
		2'b01://ld sd halfword
		begin
			if(ld_sd_addr_i[0] != 0)
			begin
				w_ld_sd_misalign_addr_ex = 1'b1;
			end
			else
			begin
				w_ld_sd_misalign_addr_ex = 1'b0;
			end
		end
		2'b10://ld sd word
		begin
			if(ld_sd_addr_i[1:0] != 0)
			begin
				w_ld_sd_misalign_addr_ex = 1'b1;
			end
			else
			begin
				w_ld_sd_misalign_addr_ex = 1'b0;
			end

		end
		2'b11://ld sd double word
		begin
			if(ld_sd_addr_i[2:0] != 0)
			begin
				w_ld_sd_misalign_addr_ex = 1'b1;
			end
			else
			begin
				w_ld_sd_misalign_addr_ex = 1'b0;
			end

		end
		default: 
		begin
				w_ld_sd_misalign_addr_ex = 1'b0;
		end
		endcase
end


always@(*)
begin
    if(!debug_mode_valid_i)
    begin
	case({w_instr_misalign_ex,w_invalid_instr_ex,w_breakpoint_ex,w_ecall_ex,w_ld_misalign_addr_ex,w_sd_misalign_addr_ex,data_mem_addr_max_ex})
		7'b0000000://no exception
		begin
			exception_valid_o = 1'b0;
			exception_id_o	  = 0   ;
		end
		7'b1000000://instruction misalign
		begin
			exception_valid_o = 1'b1;
			exception_id_o	  = INSTR_MIS_ALGN  ;
		end

		7'b0100000://invalid instruction
		begin
			exception_valid_o = 1'b1;
			exception_id_o	  = ILLEGAL_INSTR  ;
		end

		7'b0010000://break point
		begin
			exception_valid_o = 1'b0;
			exception_id_o	  = BREAKPOINT  ;
		end

		7'b0001000://ecall
		begin
			exception_valid_o = 1'b1;
			exception_id_o	  = ECALL  ;
		end

		7'b0000100://load addr misalign
		begin
			exception_valid_o = 1'b1;
			exception_id_o	  = LD_ADDR_MIS_ALGN  ;
		end

		7'b0000010://store addr misalign
		begin
			exception_valid_o = 1'b1;
			exception_id_o	  = SD_ADDR_MIS_ALGN  ;
		end
		7'b0000001://memory out of bound
		begin
			exception_valid_o = 1'b1;
			exception_id_o	  = MEM_OUT_OF_BOUND  ;
		end


		default:
		begin
			exception_valid_o = 1'b0;
			exception_id_o	  = 0   ;
		end

	endcase
end
else
begin
    if(debug_mem_misaligned_exception_w & debug_mem_read_enable)
    begin
			exception_valid_o = 1'b1;
			exception_id_o	  = LD_ADDR_MIS_ALGN  ;

    end
    else if(debug_mem_misaligned_exception_w & debug_mem_write_enable)
    begin
        	exception_valid_o = 1'b1;
			exception_id_o	  = SD_ADDR_MIS_ALGN  ;

    end
    else if(debug_mem_addr_max_ex && (debug_mem_read_enable || debug_mem_write_enable))
    begin
			exception_valid_o = 1'b1;
			exception_id_o	  = MEM_OUT_OF_BOUND  ;
     
    end
    else
    begin
        			exception_valid_o = 1'b0;
			exception_id_o	  = 8'd0 ;
     

    end
end
end

always@(*)
begin
    if(debug_mode_valid_i && (debug_mem_read_enable || debug_mem_write_enable))
    begin
        case(debug_mem_strobe)
            8'b0000_0001:
            begin
                debug_mem_misaligned_exception_w = 1'b0;
            end
            8'b0000_0011:
            begin
                if(debug_mem_addr_w[0]  != 1'b0 )
                begin
                    debug_mem_misaligned_exception_w = 1'b1 ;
                end
                else
                begin
                    debug_mem_misaligned_exception_w = 1'b0 ;
                end
            end
            8'b0000_1111:
            begin
                if(debug_mem_addr_w[1:0]  != 2'b00 )
                begin
                    debug_mem_misaligned_exception_w = 1'b1 ;

                end
                else
                begin
                    debug_mem_misaligned_exception_w = 1'b0 ;
                end

            end
            8'b1111_1111:
            begin
                if(debug_mem_addr_w[2:0]  != 3'b000 )
                begin
                    debug_mem_misaligned_exception_w = 1'b1 ;

                end
                else
                begin
                    debug_mem_misaligned_exception_w = 1'b0 ;
                end

            end
            default:
               begin
                debug_mem_misaligned_exception_w = 1'b0 ;

               end

        endcase
    end
    else
    begin
        debug_mem_misaligned_exception_w = 1'b0 ;
    end
end

assign exception_handler_addr_o = {csr_mtvec_i[DATA_WIDTH-1:2],2'b00}				;
assign ld_sd_misalign_valid_o   = (w_ld_misalign_addr_ex | w_sd_misalign_addr_ex)	;
assign ld_sd_misalign_addr_o    = ld_sd_addr_i						;
assign instr_misalign_valid_o   = w_instr_misalign_ex					;
assign instr_misalign_addr_o    = branch_pc_i						;
assign invalid_instr_valid_o    = w_invalid_instr_ex					;
//output [31:0] 			assign invalid_instruction_in	
assign debug_exception_valid_o =  debug_mem_misaligned_exception_r |  debug_mem_misaligned_exception_w;
endmodule
