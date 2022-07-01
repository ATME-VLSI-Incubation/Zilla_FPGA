`define ZILLA_32_BIT 
`timescale 1ns / 1ps
//load and store address calculation
//
//
//
///////////
module addr_gen
#(
parameter DATA_WIDTH        = 0,
parameter GPR_ADDR_WIDTH    = 0
)
(
input 				addr_clk		,//external clock
input 				addr_rst		,//external reset
input                               wdt_reset_i     ,
input 		[DATA_WIDTH-1:0] 		rs1_data		,
input 		[DATA_WIDTH-1:0] 		imm_val			,
input 		[GPR_ADDR_WIDTH-1:0] 		id_ex_rd		,
input 		[GPR_ADDR_WIDTH-1:0] 		id_ex_rs1		,
input 	    			id_ex_reg_wr_en		,
input	    			id_ex_mem_wr_en		,
input	    			id_ex_mem_rd_en		,
input 		[DATA_WIDTH-1:0] 		alu_data		,
input 		[DATA_WIDTH-1:0] 		mem_wb_data		,
input 		[DATA_WIDTH-1:0] 		wb_data			,
input 		[11:0] 	       	alu_ctrl		,
output reg 	[DATA_WIDTH-1:0] 		addr			,
output reg 	[(DATA_WIDTH>>3)-1 :0] 		byte_en			,
output reg 			sign_bit		,
output		[DATA_WIDTH-1:0] 		de_ld_sd_addr_o		,
output reg 			ld_valid_o		,
output reg 			sd_valid_o		,
output reg [1:0] 		byte_sel_o	,
input               stall_pipeline


);
wire		[DATA_WIDTH-1:0] 		addr_temp		;
reg 		[DATA_WIDTH-1:0] 		oper1			;
reg 		[DATA_WIDTH-1:0] 		oper2			;
reg 		[GPR_ADDR_WIDTH-1:0] 		ex_mem_rd		;
reg 		[GPR_ADDR_WIDTH-1:0] 		mem_wb_rd		;
reg 		[GPR_ADDR_WIDTH-1:0] 		wb_rd			;
reg 				ex_mem_reg_wr_en	;
reg 				mem_wb_reg_wr_en	;
reg 				wb_reg_wr_en		;
reg 				ex_mem_mem_wr_en	;
reg 				mem_mem_wr_en		;
reg 				ex_mem_mem_rd_en	;
reg 				mem_mem_rd_en		;
reg 		[(DATA_WIDTH>>3)-1 :0]		byte_en_r		;
reg 				sign_bit_r		;
reg 		[1 :0] 		fwd			;
wire 				rs1_fwd_id_ex		;
wire 				rs1_fwd_ex_mem		;
wire 				rs1_fwd_mem_wb		;

wire [GPR_ADDR_WIDTH-1:0] id_ex_rd_w;
wire id_ex_reg_wr_en_w;
wire id_ex_mem_rd_en_w;
assign id_ex_rd_w = stall_pipeline ? {GPR_ADDR_WIDTH{1'b0}} : id_ex_rd;
assign id_ex_reg_wr_en_w = stall_pipeline ? 1'b0 : id_ex_reg_wr_en;
assign id_ex_mem_rd_en_w = (stall_pipeline & id_ex_mem_rd_en) ? 1'b0 : id_ex_mem_rd_en;

always@(posedge addr_clk or negedge addr_rst)
begin
	if(!addr_rst)
	begin
		addr 			<=	{DATA_WIDTH{1'b0}}			;
		ex_mem_rd		<=	{GPR_ADDR_WIDTH{1'b0}}			;	
		byte_en			<=	{(DATA_WIDTH>>3)-1{1'b0}}			;
		sign_bit		<=	1'b0			;
		mem_wb_rd		<=	{GPR_ADDR_WIDTH{1'b0}}			;
		wb_rd			<=	{GPR_ADDR_WIDTH{1'b0}}			;
		ex_mem_reg_wr_en	<=	1'd0			;	
		mem_wb_reg_wr_en	<=	1'd0			;
		wb_reg_wr_en		<=	1'd0			;
		ex_mem_mem_wr_en	<=	1'd0			;
		ex_mem_mem_rd_en	<=	1'd0			;
		mem_mem_wr_en		<=	1'd0			;
		mem_mem_rd_en		<=	1'd0			;
	end
    else if(wdt_reset_i)
    begin
        		addr 			<=	{DATA_WIDTH{1'b0}}			;
		ex_mem_rd		<=	{GPR_ADDR_WIDTH{1'b0}}			;	
		byte_en			<=	{(DATA_WIDTH>>3)-1{1'b0}}			;
		sign_bit		<=	1'b0			;
		mem_wb_rd		<=	{GPR_ADDR_WIDTH{1'b0}}			;
		wb_rd			<=	{GPR_ADDR_WIDTH{1'b0}}			;
		ex_mem_reg_wr_en	<=	1'd0			;	
		mem_wb_reg_wr_en	<=	1'd0			;
		wb_reg_wr_en		<=	1'd0			;
		ex_mem_mem_wr_en	<=	1'd0			;
		ex_mem_mem_rd_en	<=	1'd0			;
		mem_mem_wr_en		<=	1'd0			;
		mem_mem_rd_en		<=	1'd0			;

    end
	else
	begin
		addr 			<= 	addr_temp		;
		ex_mem_rd		<= 	id_ex_rd_w		;
		byte_en 		<= 	byte_en_r		;
		sign_bit		<= 	sign_bit_r		;
		mem_wb_rd		<= 	ex_mem_rd		;
		wb_rd			<= 	mem_wb_rd		;
		ex_mem_reg_wr_en	<= 	id_ex_reg_wr_en_w		;
		mem_wb_reg_wr_en	<= 	ex_mem_reg_wr_en	;
		wb_reg_wr_en		<= 	mem_wb_reg_wr_en	;
		ex_mem_mem_wr_en	<=	id_ex_mem_wr_en		;
		ex_mem_mem_rd_en	<=	id_ex_mem_rd_en_w		;
		mem_mem_wr_en		<=	ex_mem_mem_wr_en	;
		mem_mem_rd_en		<=	ex_mem_mem_rd_en	;



	end
end

assign rs1_fwd_id_ex 	= ((id_ex_rd !={GPR_ADDR_WIDTH{1'b0}}) && (id_ex_reg_wr_en  && (id_ex_mem_wr_en || id_ex_mem_rd_en)) && (id_ex_rd  == id_ex_rs1));
assign rs1_fwd_ex_mem 	= ((ex_mem_rd!={GPR_ADDR_WIDTH{1'b0}}) && (ex_mem_reg_wr_en && (id_ex_mem_wr_en || id_ex_mem_rd_en)) && (ex_mem_rd == id_ex_rs1) && (id_ex_rd != id_ex_rs1));
assign rs1_fwd_mem_wb 	= ((mem_wb_rd!={GPR_ADDR_WIDTH{1'b0}}) && (mem_wb_reg_wr_en && (id_ex_mem_wr_en || id_ex_mem_rd_en)) && (mem_wb_rd == id_ex_rs1) && (id_ex_rd != id_ex_rs1) && (ex_mem_rd != id_ex_rs1));

always@(*)
begin
	case({rs1_fwd_id_ex,rs1_fwd_ex_mem,rs1_fwd_mem_wb})
	3'b100:
	begin
		fwd  	= 2'b01		;
	end
	3'b010:
	begin
		fwd 	= 2'b10		;
	end
	3'b001:
	begin
		fwd 	= 2'b11		;
	end
	default:
	begin
		fwd 	= 2'b00		;
	end
	endcase
end

always@(*)
begin
	case(fwd)
	2'b00:
	begin
		oper1 	= rs1_data	;
		oper2 	= imm_val	;
	end
	2'b01:
	begin
		oper1 	= alu_data	;
		oper2 	= imm_val	;
	end
	2'b10:
	begin
		oper1 	= mem_wb_data	;
		oper2 	= imm_val	;
	end
	2'b11:
	begin
		oper1 	= wb_data	;
		oper2 	= imm_val	;
	end
	default:
	begin
		oper1 	= rs1_data	;
		oper2 	= imm_val	;
	end
	endcase
end


/*always@(*)
begin
	if(oper2[DATA_WIDTH-1])
	begin
		//addr_temp = (oper1 - {53'd0,oper2[10:0]});
		addr_temp = oper1 + oper2;
	end
	else
	begin
		addr_temp = (oper1 + {53'd0,oper2[10:0]});

	end

end*/

assign addr_temp = oper1 + oper2 ;
assign de_ld_sd_addr_o = addr_temp;
//load_valid_o store_valid_o byte_sel_o
`ifdef ZILLA_64_BIT
always@(*)
begin
	case(alu_ctrl)
	12'b000000000011://lb
	begin
		byte_en_r  	= 8'b00000001	; //3
		sign_bit_r 	= 1'b1		;
		ld_valid_o 	= 1'b1		;
		sd_valid_o 	= 1'b0		;
		byte_sel_o 	= 2'b00		;
	end
	12'b000010000011://lh
	begin
		byte_en_r  = 8'b00000011	; //5
		sign_bit_r = 1'b1		;
		ld_valid_o 	= 1'b1		;
		sd_valid_o 	= 1'b0		;
		byte_sel_o 	= 2'b01		;


	end
	12'b000100000011://lw
	begin
		byte_en_r  = 8'b00001111	; //7
		sign_bit_r = 1'b1		;
		ld_valid_o 	= 1'b1		;
		sd_valid_o 	= 1'b0		;
		byte_sel_o 	= 2'b10		;


	end
	12'b000110000011://ld
	begin
		byte_en_r  = 8'b11111111	;
		sign_bit_r = 1'b0		;
		ld_valid_o 	= 1'b1		;
		sd_valid_o 	= 1'b0		;
		byte_sel_o 	= 2'b11		;


	end
	12'b001000000011://lbu
	begin
		byte_en_r  = 8'b00000001	;
		sign_bit_r = 1'b0		;
		ld_valid_o 	= 1'b1		;
		sd_valid_o 	= 1'b0		;
		byte_sel_o 	= 2'b00		;


	end
	12'b001010000011://lhu
	begin
		byte_en_r  = 8'b00000011	;
	        sign_bit_r = 1'b0		;
		ld_valid_o 	= 1'b1		;
		sd_valid_o 	= 1'b0		;
		byte_sel_o 	= 2'b01		;


	end
	12'b001100000011://lwu
	begin
		byte_en_r  = 8'b00001111	; 
		sign_bit_r = 1'b0		;
		ld_valid_o 	= 1'b1		;
		sd_valid_o 	= 1'b0		;
		byte_sel_o 	= 2'b10		;


	end
	12'b000000100011://sb
	begin
		byte_en_r  = 8'b00000001	;
		sign_bit_r = 1'b0		;
		ld_valid_o 	= 1'b0		;
		sd_valid_o 	= 1'b1		;
		byte_sel_o 	= 2'b00		;


	end
	12'b000010100011://sh
	begin
		byte_en_r  = 8'b00000011	;
		sign_bit_r = 1'b0		;
		ld_valid_o 	= 1'b0		;
		sd_valid_o 	= 1'b1		;
		byte_sel_o 	= 2'b01		;

	end
	12'b000100100011://sw
	begin
		byte_en_r = 8'b00001111		;
		sign_bit_r = 1'b0		;
		ld_valid_o 	= 1'b0		;
		sd_valid_o 	= 1'b1		;
		byte_sel_o 	= 2'b10		;

	end
	12'b000110100011://sd
	begin
		byte_en_r  = 8'b11111111	;
		sign_bit_r = 1'b1		;
		ld_valid_o 	= 1'b0		;
		sd_valid_o 	= 1'b1		;
		byte_sel_o 	= 2'b11		;

	end
	default:
	begin
		byte_en_r  = 8'b00000000	;
		ld_valid_o 	= 1'b0		;
		sd_valid_o 	= 1'b0		;
		byte_sel_o 	= 2'b00		;
		sign_bit_r 	= 1'b0		;

	end
	endcase

end

`elsif ZILLA_32_BIT
always@(*)
begin
	case(alu_ctrl)
	12'b000000000011://lb
	begin
		byte_en_r  	= 4'b0001	; //3
		sign_bit_r 	= 1'b1		;
		ld_valid_o 	= 1'b1		;
		sd_valid_o 	= 1'b0		;
		byte_sel_o 	= 2'b00		;
	end
	12'b000010000011://lh
	begin
		byte_en_r  = 4'b0011	; //5
		sign_bit_r = 1'b1		;
		ld_valid_o 	= 1'b1		;
		sd_valid_o 	= 1'b0		;
		byte_sel_o 	= 2'b01		;


	end
	12'b000100000011://lw
	begin
		byte_en_r  = 4'b1111	; //7
		sign_bit_r = 1'b1		;
		ld_valid_o 	= 1'b1		;
		sd_valid_o 	= 1'b0		;
		byte_sel_o 	= 2'b10		;


	end
	12'b001000000011://lbu
	begin
		byte_en_r  = 4'b0001	;
		sign_bit_r = 1'b0		;
		ld_valid_o 	= 1'b1		;
		sd_valid_o 	= 1'b0		;
		byte_sel_o 	= 2'b00		;


	end
	12'b001010000011://lhu
	begin
		byte_en_r  = 4'b0011	;
	        sign_bit_r = 1'b0		;
		ld_valid_o 	= 1'b1		;
		sd_valid_o 	= 1'b0		;
		byte_sel_o 	= 2'b01		;


	end
	12'b001100000011://lwu
	begin
		byte_en_r  = 4'b1111	; 
		sign_bit_r = 1'b0		;
		ld_valid_o 	= 1'b1		;
		sd_valid_o 	= 1'b0		;
		byte_sel_o 	= 2'b10		;


	end
	12'b000000100011://sb
	begin
		byte_en_r  = 4'b0001	;
		sign_bit_r = 1'b0		;
		ld_valid_o 	= 1'b0		;
		sd_valid_o 	= 1'b1		;
		byte_sel_o 	= 2'b00		;


	end
	12'b000010100011://sh
	begin
		byte_en_r  = 4'b0011	;
		sign_bit_r = 1'b0		;
		ld_valid_o 	= 1'b0		;
		sd_valid_o 	= 1'b1		;
		byte_sel_o 	= 2'b01		;

	end
	12'b000100100011://sw
	begin
		byte_en_r = 4'b1111		;
		sign_bit_r = 1'b0		;
		ld_valid_o 	= 1'b0		;
		sd_valid_o 	= 1'b1		;
		byte_sel_o 	= 2'b10		;

	end
	default:
	begin
		byte_en_r  = 4'b0000	;
		ld_valid_o 	= 1'b0		;
		sd_valid_o 	= 1'b0		;
		byte_sel_o 	= 2'b00		;
		sign_bit_r 	= 1'b0		;

	end
	endcase

end


`endif
endmodule
