`define ZILLA_32_BIT 
`timescale 1ns / 1ps
//logic to check conditional branch 
//also forwarding from execute state for brnach operand

module branch_condition_check #(parameter DATA_WIDTH    = 0,
                                parameter OPCODE        = 0,
                                parameter FUNC3         = 0,
                                parameter PC_WIDTH      = 0,
                                parameter GPR_ADDR_WIDTH = 0)
(
input 			                    br_clk		        ,//external clock
input 			                    br_rst		        ,//external reset
input                               wdt_reset_i         ,
input       		                stall_en	        ,
input 		[OPCODE-1        :0] 	opcode		        ,
input 		[FUNC3-1         :0] 	func3		        ,
input 		[DATA_WIDTH-1    :0] 	rs1_data	        ,//source register 1 data
input 		[DATA_WIDTH-1    :0] 	rs2_data	        ,//source register 2 data
input 		[DATA_WIDTH-1    :0]    alu_data	        ,//ALU output data
input 		[DATA_WIDTH-1    :0]	mem_wb_data	        ,//ALU data/memory read data
input 		[DATA_WIDTH-1    :0]	wb_data		        ,//multiplexer output
input 		[GPR_ADDR_WIDTH-1:0]    id_ex_rd	        ,
input 			                    id_ex_reg_wr_en	    ,
input 		[GPR_ADDR_WIDTH-1:0]    id_ex_rs1	        ,
input 		[GPR_ADDR_WIDTH-1:0]    id_ex_rs2	        ,
input 		[DATA_WIDTH-1    :0] 	imm_val		        ,//immediate value as target address offset
input 		[PC_WIDTH-1      :0] 	pc		            ,//program counter value
output 		[PC_WIDTH-1      :0] 	branch_pc	        ,//calculated target address to instruction memory
output     	                        branch_en	        , //branch enable signal to instruction memory
input                               debug_mode_valid_i  

);

reg             	              branch_enable	    ;
wire 			                  beq		        ;
wire 			                  bne		        ;
wire 			                  blt		        ;
wire 			                  bge		        ;
wire 			                  bltu		        ;
wire 			                  bgeu		        ;
reg 		[DATA_WIDTH-1    :0]  oper1		        ;
reg 		[DATA_WIDTH-1    :0]  oper2		        ;
wire 		[PC_WIDTH-1      :0]  pc_r 		        ;
wire        [PC_WIDTH-1      :0]  pc_r1             ;
wire        [PC_WIDTH-1      :0]  pc_r2             ;
reg 		[GPR_ADDR_WIDTH-1:0]  ex_mem_rd	        ;
reg 		[GPR_ADDR_WIDTH-1:0]  mem_wb_rd	        ;
reg 		[GPR_ADDR_WIDTH-1:0]  wb_rd    	        ;
reg 		[1:0]                 fwd_br_rs1	    ;
reg 		[1:0]                 fwd_br_rs2	    ;
reg 		                      ex_mem_reg_wr_en  ;
reg 		                      mem_wb_reg_wr_en  ;
reg 		                      wb_reg_wr_en      ;

reg debug_mode_valid_r;
reg debug_mode_valid_r1;
reg debug_mode_valid_r2;
wire debug_mode_valid_w;

//calculate right pc value: 
//pipelining the rsq,rs2 and rd values to detect hazard condition
always@(posedge br_clk or negedge br_rst)
begin
	if(!br_rst)
	begin
			ex_mem_rd		    <= {GPR_ADDR_WIDTH{1'b0}}; 
            mem_wb_rd		    <= {GPR_ADDR_WIDTH{1'b0}};
        	wb_rd  			    <= {GPR_ADDR_WIDTH{1'b0}};
			ex_mem_reg_wr_en	<= 1'd0			         ;
        	mem_wb_reg_wr_en	<= 1'd0			         ;
        	wb_reg_wr_en    	<= 1'd0			         ;
            debug_mode_valid_r  <= 1'b0                  ;
            debug_mode_valid_r1 <= 1'b0                  ;
            debug_mode_valid_r2 <= 1'b0                  ;

	end
	else
	begin
			ex_mem_rd		    <= id_ex_rd		         ;
			mem_wb_rd		    <= ex_mem_rd		     ;
			wb_rd  			    <= mem_wb_rd		     ;
			ex_mem_reg_wr_en	<= id_ex_reg_wr_en	     ;
			mem_wb_reg_wr_en	<= ex_mem_reg_wr_en	     ;
			wb_reg_wr_en    	<= mem_wb_reg_wr_en	     ;
            debug_mode_valid_r  <= debug_mode_valid_i    ;
            debug_mode_valid_r1 <= debug_mode_valid_r    ;
            debug_mode_valid_r2 <= debug_mode_valid_r1   ;

	end
end
assign pc_r2                    = pc - 20'd8                        ;
assign pc_r1                    = pc - 20'd4                        ;
assign branch_en                = stall_en ? 1'b0 : branch_enable   ;

assign debug_mode_valid_w = debug_mode_valid_i || debug_mode_valid_r  || debug_mode_valid_r1 || debug_mode_valid_r2 ;
assign pc_r               = debug_mode_valid_w ? pc_r1 : pc_r2;

//hazard condition detection with respect to rs1 address
assign rs1_fwd_ex_mem	= ((ex_mem_rd 	!= {GPR_ADDR_WIDTH{1'b0}}) && (ex_mem_reg_wr_en 	== 1'b1) && (id_ex_rs1 == ex_mem_rd	));
assign rs1_fwd_mem_wb	= ((mem_wb_rd 	!= {GPR_ADDR_WIDTH{1'b0}}) && (mem_wb_reg_wr_en 	== 1'b1) && (id_ex_rs1 != ex_mem_rd	) && (id_ex_rs1 == mem_wb_rd));
assign rs1_fwd_wb	    = ((wb_rd 	    != {GPR_ADDR_WIDTH{1'b0}}) && (wb_reg_wr_en 	    == 1'b1) && (id_ex_rs1 != ex_mem_rd	) && (id_ex_rs1 != mem_wb_rd ) && (id_ex_rs1 == wb_rd));

//hazard condition detection with respect to rs2 address
assign rs2_fwd_ex_mem	= ((ex_mem_rd 	!= {GPR_ADDR_WIDTH{1'b0}}) && (ex_mem_reg_wr_en 	== 1'b1) && (id_ex_rs2 == ex_mem_rd	));                                             
assign rs2_fwd_mem_wb	= ((mem_wb_rd 	!= {GPR_ADDR_WIDTH{1'b0}}) && (mem_wb_reg_wr_en 	== 1'b1) && (id_ex_rs2 != ex_mem_rd	) && (id_ex_rs2 == mem_wb_rd));                 
assign rs2_fwd_wb	    = ((wb_rd 	    != {GPR_ADDR_WIDTH{1'b0}}) && (wb_reg_wr_en 	    == 1'b1) && (id_ex_rs2 != ex_mem_rd	) && (id_ex_rs2 != mem_wb_rd ) && (id_ex_rs2 == wb_rd)); 

//
always@(*)
begin
	case({rs1_fwd_ex_mem,rs1_fwd_mem_wb,rs1_fwd_wb})
		3'b100: 
		begin
			fwd_br_rs1 	= 2'b01		;//forwarding rs1 data from execution stage
		end
		3'b010:
		begin
			fwd_br_rs1 	= 2'b10		;//forwarding rs1 data from memory stage

		end
		3'b001:
		begin
			fwd_br_rs1 	= 2'b11		;//forwarding rs1 data from write back stage
		end
		default:
		begin
			fwd_br_rs1 	= 2'b00		;//default with no hazard

		end

	endcase
end

always@(*)
begin
	case({rs2_fwd_ex_mem,rs2_fwd_mem_wb,rs2_fwd_wb})
		3'b100: 
		begin
			fwd_br_rs2 	= 2'b01		; //forwarding rs2 data from execution stage
		end                                                                           
		3'b010:                                                                       
		begin                                                                         
			fwd_br_rs2 	= 2'b10		; //forwarding rs2 data from memory stage
		end                                                                           
		3'b001:                                                                       
		begin                                                                         
			fwd_br_rs2 	= 2'b11		; //forwarding rs2 data from write back stage                                           
		end                               
		default:
		begin
			fwd_br_rs2 	= 2'b00		; //by default with no hazard
		end

	endcase
end

always@(*)
begin
	case(fwd_br_rs1)
		2'b00:
		begin
			oper1 		= rs1_data	; //default with no hazard
		end
		2'b01:
		begin
			oper1 		= alu_data	; //forwarding from alu output
		end
		2'b10:
		begin
			oper1 		= mem_wb_data	; //forwarding from memory access stage
		end
		2'b11:
		begin
			oper1 		= wb_data	; //forwarding from write back stage
		end
		default:
		begin
			oper1 		= rs1_data	; //default with no hazard		
		end
	endcase
end

always@(*)
begin
	case(fwd_br_rs2)
		2'b00:
		begin
			oper2 		= rs2_data	; //default with no hazard
		end                                                                              
		2'b01:                                                                           
		begin                                                                            
			oper2 		= alu_data	; //forwarding from alu output
		end                                                                              
		2'b10:                                                                           
		begin                                                                            
			oper2 		= mem_wb_data	; //forwarding from memory access stage
		end                                                                              
		2'b11:                                                                           
		begin                                                                            
			oper2 		= wb_data	; //forwarding from write back stage
		end                                                                              
		default:                                                                         
		begin                                                                            
			oper2 		= rs2_data	; //default with no hazard		
		end
	endcase
end

////////////////////////calculating target address
wire [DATA_WIDTH-1:0] 	imm_2s_comp		    ;//1
wire [DATA_WIDTH-1:0] 	tar_sum			    ;
wire [DATA_WIDTH-1:0] 	tar_sum_2s_comp		;
wire [DATA_WIDTH-1:0] 	branch_target 		;
wire 		            branch_target_sign	;
wire [DATA_WIDTH-1:0] 	jalr_target 		;
wire  		            jalr_target_sign 	;
wire 		            tar_addr_s		    ;
wire 		            jalr_en 		    ;
wire [PC_WIDTH-1:0] 	jump_forward		;
wire [PC_WIDTH-1:0] 	jump_backward		;
wire [PC_WIDTH-1:0] 	jal_pc			    ;





assign imm_2s_comp 		    = (~imm_val) + 64'd1 		; 			//jal and  branch //2
assign tar_sum 			    = imm_val    + oper1 		; 			//jalr//1
assign tar_sum_2s_comp 		= (~tar_sum) + 64'd1 		; 			//2
assign branch_target 		= imm_val[DATA_WIDTH-1]   	? imm_2s_comp 		: imm_val 		;//3
assign branch_target_sign 	= imm_val[DATA_WIDTH-1]   	? 1'b1        		: 1'b0 			;
assign jalr_target 		    = tar_sum 					;
assign jalr_target_sign  	= tar_sum[DATA_WIDTH-1]   	? 1'b1 	      		: 1'b0 			;
assign tar_addr_s 		    = (opcode == 7'b1100111) 		? jalr_target_sign 	: branch_target_sign    ;
assign jalr_en 			    = (opcode == 7'b1100111) 		? 1'b1 			: 1'b0 			;
assign jump_forward 		= pc_r + branch_target[PC_WIDTH-1:0] 	;
assign jump_backward 		= pc_r - branch_target[PC_WIDTH-1:0] 	;
assign jal_pc 			    = branch_target_sign    ? jump_backward 	: jump_forward  	;
assign branch_pc 		    = (jalr_en) 		? jalr_target 		: jal_pc 		; 

////////output logic////////////////////
always@(*)
begin
	case({opcode,func3})
		10'b1100011000://beq
		begin
			branch_enable 	= beq	;
		end
		10'b1100011001://bne
		begin
			branch_enable 	= bne	;
		end
		10'b1100011100://blt
		begin
			branch_enable 	= blt	;
		end
		10'b1100011101://bge
		begin
			branch_enable 	= bge	;
		end
		10'b1100011110://bltu
		begin
			branch_enable 	= bltu	;
		end
		10'b1100011111://bgeu
		begin
			branch_enable 	= bgeu	;
		end

		10'b1101111000://JAL
		begin
			branch_enable 	= 1'b1	;
		end
		10'b1100111000://JALR
		begin
			branch_enable 	= 1'b1	;
		end
		default:
		begin
			branch_enable 	= 1'b0	;
		end
		endcase
end


/////////////////instances////////////
beq #(.DATA_WIDTH(DATA_WIDTH))
beq_inst
(
.in1	(oper1	),
.in2	(oper2	),
.beq	(beq	)
);

bne #(.DATA_WIDTH(DATA_WIDTH))
bne_inst
(
.in1	(oper1	),
.in2	(oper2	),
.bne	(bne	)

);

blt #(.DATA_WIDTH(DATA_WIDTH))
blt_inst
(
.in1	(oper1	),
.in2	(oper2	),
.blt	(blt	)

);

bge #(.DATA_WIDTH(DATA_WIDTH))
bge_inst
(
.in1	(oper1	),
.in2	(oper2	),
.bge 	(bge	)

);

bltu #(.DATA_WIDTH(DATA_WIDTH))
bltu_inst
(
.in1	(oper1	),
.in2	(oper2	),
.bltu 	(bltu	)
);

bgeu #(.DATA_WIDTH(DATA_WIDTH))
bgeu_inst
(
.in1	(oper1	),
.in2	(oper2	),
.bgeu 	(bgeu	)

);




endmodule


module beq #(parameter DATA_WIDTH = 0)
(
input [DATA_WIDTH-1:0] in1,
input [DATA_WIDTH-1:0] in2,
output beq
);

assign beq = (in1 == in2) ? 1'b1 : 1'b0;
endmodule

module bne #(parameter DATA_WIDTH = 0)
(
input [DATA_WIDTH-1:0] in1,
input [DATA_WIDTH-1:0] in2,
output bne
);

assign bne = (in1 == in2) ? 1'b0 : 1'b1;
endmodule

module blt #(parameter DATA_WIDTH = 0)
(
input [DATA_WIDTH-1:0] in1,
input [DATA_WIDTH-1:0] in2,
output reg blt
);
always@(*)
begin
	if(in1[DATA_WIDTH-1] == in2[DATA_WIDTH-1])
	begin
		if(in1[DATA_WIDTH-1] && in2[DATA_WIDTH-1])
		begin
			if(in1[DATA_WIDTH-2:0] < in2[DATA_WIDTH-2:0])
			begin
				blt = 1'b1;
			end
			else
			begin
				blt = 1'b0;
			end
		end
		else
		begin
			if(in1[DATA_WIDTH-2:0] < in2[DATA_WIDTH-2:0])
			begin
				blt = 1'b1;
			end
			else
			begin
				blt = 1'b0;
			end
		end
	end
	else
	begin
		if(in1[DATA_WIDTH-1])
		begin
			blt = 1'b1;
		end
		else
		begin
			blt = 1'b0;
		end
	end
end

//assign blt = (in1 < in2) ? 1'b1:1'b0;
endmodule

module bge #(parameter DATA_WIDTH = 0)
(
input [DATA_WIDTH-1:0] in1,
input [DATA_WIDTH-1:0] in2,
output reg bge
);
always@(*)
begin
	if(in1[DATA_WIDTH-1] == in2[DATA_WIDTH-1])
	begin
		if(in1[DATA_WIDTH-1] && in2[DATA_WIDTH-1])
		begin
			if(in1[DATA_WIDTH-2:0] >= in2[DATA_WIDTH-2:0])
			begin
				bge = 1'b1;
			end
			else
			begin
				bge = 1'b0;
			end
		end
		else
		begin
			if(in1[DATA_WIDTH-2:0] >= in2[DATA_WIDTH-2:0])
			begin
				bge = 1'b1;
			end
			else
			begin
				bge = 1'b0;
			end
		end
	end
	else
	begin
		if(in1[DATA_WIDTH-1])
		begin
			bge = 1'b0;
		end
		else
		begin
			bge = 1'b1;
		end
	end
end

	
//assign bge = (in1 > in2) ? 1'b1 : 1'b0;
endmodule

module bltu #(parameter DATA_WIDTH = 0)
(
input [DATA_WIDTH-1:0] in1,
input [DATA_WIDTH-1:0] in2,
output bltu
);

assign bltu = (in1 < in2) ? 1'b1:1'b0;
endmodule

module bgeu #(parameter DATA_WIDTH = 0)
(
input [DATA_WIDTH-1:0] in1,
input [DATA_WIDTH-1:0] in2,
output bgeu
);

assign bgeu = (in1 >= in2) ? 1'b1 : 1'b0;
endmodule
