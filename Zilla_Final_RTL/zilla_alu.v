`define ZILLA_32_BIT 
`timescale 1ns / 1ps
//risc-v 
//alu
///////data lines//////////
//	data_in_1	64 bit input data
//	data_in_2	64 bit input data
//	data_out	64 bit output  
//
///////control lines///////
//	alu_ctrl 	
//
///////////////////////////
//alu module
module alu #(parameter DATA_WIDTH = 0,
             parameter PC_WIDTH   = 0,
             parameter OPCODE     = 0)
(
input 			                    alu_clk	 	    , 
input 			                    alu_rst		    ,
input                               wdt_reset_i     ,
input 		[11:0]	                alu_ctrl	    ,//control
input		[DATA_WIDTH-1     :0]   ld_sd_addr	    ,
input 		[(DATA_WIDTH>>3)-1:0]	id_ex_byte_en	,//byte selection for load / store:pipeline
input 			                    id_ex_sign_bit	,
output reg 		                    ex_mem_sign_bit	,
input 		[DATA_WIDTH-1:0]        imm_val		    ,//immediate value
input 		[DATA_WIDTH-1:0]	    data_in_1	    ,//data from source register 1
input 		[DATA_WIDTH-1:0]	    data_in_2	    ,//data from source  register 2
input 		[PC_WIDTH-1:0]          pc		        ,//program counter value for auipc instruction
output reg	[DATA_WIDTH-1:0]        mem_addr	    ,//pipelined load store adress
output reg	[(DATA_WIDTH>>3)-1 :0]  ex_mem_byte_en  ,//byte selection signal:pipelined
output reg 	[DATA_WIDTH-1:0]	    data_out	    ,//output data  from alu
output reg	[DATA_WIDTH-1:0]	    data_out_1_o	    ,//to addr_gen
output reg		                    carry_o		    ,
output reg		                    zero_o		    ,
input 		[OPCODE-1:0]              opcode_r	    ,
input 			                    branch_en	   ,
output                              div_busy_o      ,
output                              rem_busy_o      ,
input [31:0]                        div_opcode_i    ,
input [31:0]                        rem_opcode_i    ,
output reg                          div_rem_valid_o,
output [31:0]                       product_out     ,
output                              product_valid_o,
output [31:0]                       mult_op1,
output [31:0]                       mult_op2,
output                              mult_en_r2

);
reg [DATA_WIDTH-1:0] data_out_1;

wire div_valid_w;
wire rem_valid_w;
wire div_rem_valid_w;

wire product_valid;
assign div_rem_valid_w = div_valid_w || rem_valid_w;

wire 		[11:0]	            alu_ctrl_r	    ;
reg  			                oper1_sign	    ;
reg  			                oper2_sign	    ;
wire 			                carry_out	    ;
wire 			                borrow_out	    ;
reg  			                carry		    ;
reg  			                zero		    ;
reg  		[DATA_WIDTH-1:0]    oper1		    ;
reg  		[DATA_WIDTH-1:0]    oper2		    ;
wire 		[DATA_WIDTH-1 :0]   sum		        ;
wire 		[DATA_WIDTH-1 :0]   diff		    ;
wire 		[DATA_WIDTH-1 :0]   sll_op		    ;
wire 		[DATA_WIDTH-1 :0]   srl_op		    ;
wire 		[DATA_WIDTH-1 :0]   sra_op		    ;
wire		[DATA_WIDTH-1 :0]   sraw_op		    ;
wire 		[DATA_WIDTH-1 :0]   xor_op		    ;
wire 		[DATA_WIDTH-1 :0]   and_op		    ;
wire 		[DATA_WIDTH-1 :0]   or_op		    ;
wire 		[DATA_WIDTH-1 :0]   slt_op		    ;
wire 		[(DATA_WIDTH*2)-1:0] product		;
wire 		[DATA_WIDTH-1 :0]   quotient	    ;
wire 		[DATA_WIDTH-1 :0]   remainder	    ;
wire 		[DATA_WIDTH-1 :0]   lui_op		    ;	
wire 		[DATA_WIDTH-1 :0]   auipc_op	    ;
wire 		[DATA_WIDTH-1 :0]   jal_op		    ;
wire 		[DATA_WIDTH-1 :0]   jalr_op		    ;
wire 		[DATA_WIDTH-1 :0]   rol_op		    ;
wire 		[DATA_WIDTH-1 :0]   ror_op		    ;
wire 			                cg_op		    ;
wire 			                cge_op		    ;
wire 			                cgu_op		    ;
wire 			                cgeu_op		    ;
wire 			                clt_op		    ;
wire 			                cltu_op		    ;
wire 			                clte_op		    ;
wire 			                clteu_op	    ;
wire 			                ceq_op		    ;
wire 			                cne_op		    ;
wire 		[DATA_WIDTH-1 :0]   mov_op  	    ;
wire 			                add_en		    ;
wire 			                sub_en		    ;
wire 			                sll_en 		    ;
wire 			                srl_en		    ;
wire 			                sra_en		    ;
wire			                sraw_en		    ;
wire 			                xor_en		    ;
wire 			                and_en		    ;
wire 			                or_en		    ;
wire 			                slt_en		    ;
wire 			                mult_en		    ;
wire 			                div_en		    ;
wire 			                rem_en		    ;
wire 			                lui_en		    ;	
wire 			                auipc_en	    ;
wire 			                jal_en		    ;
wire 			                jalr_en		    ;
wire 			                rol_en		    ;
wire 			                ror_en		    ;
wire 			                cg_en		    ;
wire 			                cge_en		    ;
wire 			                cgu_en		    ;
wire 			                cgeu_en		    ;
wire 			                clt_en		    ;
wire 			                cltu_en		    ;
wire 			                clte_en		    ;
wire 			                clteu_en	    ;
wire 			                ceq_en		    ;
wire 			                cne_en		    ;
wire 	    		            add_zero	    ;
wire 	    		            sub_zero	    ;
wire 	    		            and_zero	    ;
wire 	    		            or_zero	        ;	
wire 	    		            xor_zero	    ;
wire 	    		            sll_zero	    ;
wire 	    		            srl_zero	    ;
wire 	    		            sra_zero	    ;
wire 			                sraw_zero	    ;
wire	    		            mult_zero	    ;
reg 		[11:0]              alu_ctrl_r1	    ;
reg 		[11:0]              alu_ctrl_r2	    ;
wire 		[PC_WIDTH-1:0]      pc_w		    ;
reg  		[PC_WIDTH-1:0]      pc_r		    ;
wire 		[PC_WIDTH-1:0]      jal_pc		    ;
reg  		[PC_WIDTH-1:0]      jal_pc_r	    ;


assign     jal_pc 	= pc - 20'd4					 ;
assign 	   pc_w 	= pc - 20'd8					 ;
assign     alu_ctrl_r 	= (branch_en) ? {5'd0,opcode_r} : alu_ctrl 	 ;



assign product_out = product[31:0];
assign product_valid_o = product_valid;
always@(*)
begin
    if(div_valid_w)
    begin
        data_out_1_o = quotient;
    end
    else if(rem_valid_w)
    begin
        data_out_1_o = remainder;
    end
    else if(product_valid)
    begin
        case(alu_ctrl_r2)
		12'b01_000_0110011://mul signed
		begin
			data_out_1_o = product[DATA_WIDTH-1:0];
			carry	   = 1'b0                   ;
			if(product[DATA_WIDTH-1:0] == {DATA_WIDTH{1'b0}})
				begin
				zero	 = 1'b1;
				end
			else
				begin
				zero = 1'b0;
				end
		end
		12'b01_001_0110011://mulh signed
		begin
			data_out_1_o = product[(DATA_WIDTH*2)-1:DATA_WIDTH];
			carry	   = 1'b0;
			if(product[(DATA_WIDTH*2)-1:DATA_WIDTH] == {DATA_WIDTH{1'b0}})
				begin
				zero	 = 1'b1;
				end
			else
				begin
				zero = 1'b0;
				end
		end
		12'b01_011_0110011://mulhu unsigned
		begin
			data_out_1_o = product[(DATA_WIDTH*2)-1:DATA_WIDTH];
			carry	   = 1'b0;
			if(product[(DATA_WIDTH*2)-1:DATA_WIDTH] == {DATA_WIDTH{1'b0}})
				begin
				zero	 = 1'b1;
				end
			else
				begin
				zero = 1'b0;
				end
		end
		12'b01_010_0110011://mulhsu signed and unsigned
		begin
			data_out_1_o = product[(DATA_WIDTH*2)-1:DATA_WIDTH];
			carry	   = 1'b0;
			if(product[(DATA_WIDTH*2)-1:DATA_WIDTH] == {DATA_WIDTH{1'b0}})
				begin
				zero	 = 1'b1;
				end
			else
				begin
				zero = 1'b0;
				end
		end
        12'b01_000_0111011://MULW

begin
	data_out_1_o = {{32{product[31]}},product[31:0]};
	carry	   = 1'b0;
	if(product[31:0] == 32'd0)
	begin
		zero = 1'b1;
	end
	else
	begin
		zero = 1'b0;
	end
end	

      default: data_out_1_o = data_out_1;
    endcase
    end
        else
    begin
        data_out_1_o = data_out_1;
    end
end
always@(posedge alu_clk or negedge alu_rst)
begin
		if(!alu_rst)
		begin
			alu_ctrl_r1 	<= 	12'd0	;
			alu_ctrl_r2 	<= 	12'd0	;
			mem_addr    	<= 	{DATA_WIDTH{1'b0}}	;
			ex_mem_byte_en 	<= 	{DATA_WIDTH>>3{1'b0}}	;//
			ex_mem_sign_bit <= 	1'b0	;
			pc_r 		<= 	{PC_WIDTH{1'b0}}	;
        		jal_pc_r 	<= 	{PC_WIDTH{1'b0}}	;
                div_rem_valid_o <= 1'b0;
		end
		else
		begin
			alu_ctrl_r1 	<= alu_ctrl_r	 ;
			alu_ctrl_r2 	<= alu_ctrl_r1	 ;
			mem_addr    	<= ld_sd_addr	 ; //pipelining the load and store address in execution phase
			ex_mem_byte_en 	<= id_ex_byte_en ;
			ex_mem_sign_bit <= id_ex_sign_bit;
			pc_r 		<= pc_w          ;
            		jal_pc_r 	<= jal_pc	 ;
                    div_rem_valid_o <= div_rem_valid_w;


		end
end
assign lui_en	= ((alu_ctrl_r1 == 12'b00_000_0110111))? 1'b1:1'b0;
assign auipc_en = ((alu_ctrl_r1 == 12'b00_000_0010111))? 1'b1:1'b0;
assign jal_en	= ((alu_ctrl_r1 == 12'b00_000_1101111))? 1'b1:1'b0;
assign jalr_en	= ((alu_ctrl_r1 == 12'b00_000_1100111))? 1'b1:1'b0;
assign cg_en	= ((alu_ctrl_r1 == 12'b00_000_1111011))? 1'b1:1'b0;
assign cge_en	= ((alu_ctrl_r1 == 12'b10_000_1111011))? 1'b1:1'b0;
assign cgu_en	= ((alu_ctrl_r1 == 12'b00_001_1111011))? 1'b1:1'b0;
assign cgeu_en	= ((alu_ctrl_r1 == 12'b10_001_1111011))? 1'b1:1'b0;
assign clt_en	= ((alu_ctrl_r1 == 12'b00_010_1111011))? 1'b1:1'b0;
assign clte_en	= ((alu_ctrl_r1 == 12'b10_010_1111011))? 1'b1:1'b0;
assign cltu_en	= ((alu_ctrl_r1 == 12'b00_011_1111011))? 1'b1:1'b0;
assign clteu_en	= ((alu_ctrl_r1 == 12'b10_011_1111011))? 1'b1:1'b0;
assign ceq_en	= ((alu_ctrl_r1 == 12'b00_100_1111011))? 1'b1:1'b0;
assign cne_en	= ((alu_ctrl_r1 == 12'b00_101_1111011))? 1'b1:1'b0;
assign sub_en	= ((alu_ctrl_r1 == 12'b10_000_0110011) || (alu_ctrl_r1 == 12'b10_000_0111011))? 1'b1:1'b0;
assign xor_en	= ((alu_ctrl_r1 == 12'b00_100_0110011) || (alu_ctrl_r1 == 12'b00_100_0010011))? 1'b1:1'b0;
assign and_en	= ((alu_ctrl_r1 == 12'b00_111_0110011) || (alu_ctrl_r1 == 12'b00_111_0010011))? 1'b1:1'b0;
assign or_en	= ((alu_ctrl_r1 == 12'b00_110_0110011) || (alu_ctrl_r1 == 12'b00_110_0010011))? 1'b1:1'b0;
assign rol_en	= ((alu_ctrl_r1 == 12'b00_110_1111011) || (alu_ctrl_r1 == 12'b00_110_1110111))? 1'b1:1'b0;		
assign ror_en	= ((alu_ctrl_r1 == 12'b00_111_1111011) || (alu_ctrl_r1 == 12'b00_111_1110111))? 1'b1:1'b0;
assign mov_en   = ((alu_ctrl_r1 == 12'b00_000_1011011) || (alu_ctrl_r1 == 12'b00_000_0101011))? 1'b1:1'b0;
assign div_en	= ((alu_ctrl_r1 == 12'b01_100_0110011) || (alu_ctrl_r1 == 12'b01_100_0111011) || (alu_ctrl_r1 == 12'b01_101_0111011) || (alu_ctrl_r1 == 12'b01_101_0110011))? 1'b1:1'b0;
assign rem_en	= ((alu_ctrl_r1 == 12'b01_110_0110011) || (alu_ctrl_r1 == 12'b01_110_0111011) || (alu_ctrl_r1 == 12'b01_111_0111011) || (alu_ctrl_r1 == 12'b01_111_0110011))? 1'b1:1'b0;
assign add_en	= ((alu_ctrl_r1 == 12'b00_000_0110011) || (alu_ctrl_r1 == 12'b00_000_0010011) || (alu_ctrl_r1 == 12'b00_000_0111011) || (alu_ctrl_r1 == 12'b00_000_0011011))? 1'b1:1'b0;
assign sll_en 	= ((alu_ctrl_r1 == 12'b00_001_0110011) || (alu_ctrl_r1 == 12'b00_001_0010011) || (alu_ctrl_r1 == 12'b00_001_0111011) || (alu_ctrl_r1 == 12'b00_001_0011011))? 1'b1:1'b0;
assign srl_en	= ((alu_ctrl_r1 == 12'b00_101_0110011) || (alu_ctrl_r1 == 12'b00_101_0010011) || (alu_ctrl_r1 == 12'b00_101_0111011) || (alu_ctrl_r1 == 12'b00_101_0011011))? 1'b1:1'b0;
assign sra_en	= ((alu_ctrl_r1 == 12'b10_101_0110011) || (alu_ctrl_r1 == 12'b10_101_0010011) )? 1'b1:1'b0;
assign sraw_en =  ((alu_ctrl_r1 == 12'b10_101_0111011) || (alu_ctrl_r1 == 12'b10_101_0011011) ) ? 1'b1:1'b0;
assign slt_en	= ((alu_ctrl_r1 == 12'b00_010_0010011) || (alu_ctrl_r1 == 12'b00_011_0010011) || (alu_ctrl_r1 == 12'b00_011_0110011) || (alu_ctrl_r1 == 12'b00_010_0110011))? 1'b1:1'b0;
assign mult_en	= ((alu_ctrl_r1 == 12'b01_000_0110011) || (alu_ctrl_r1 == 12'b01_000_0111011) || (alu_ctrl_r1 == 12'b01_001_0110011) || (alu_ctrl_r1 == 12'b01_011_0110011) ||  (alu_ctrl_r1 == 12'b01_010_0110011))? 1'b1:1'b0;                                                       


reg mult_en_r;
reg mult_en_r1;
//wire mult_en_r2;

always@(posedge alu_clk or negedge alu_rst)
begin
    if(!alu_rst)
    begin
        mult_en_r <= 1'b0;
        mult_en_r1 <= 1'b0;
    end
    else
    begin
        mult_en_r <= mult_en;
        mult_en_r1 <= mult_en_r;

    end
  end

  assign mult_en_r2 = (mult_en && (!mult_en_r));
always@(*) // to route proper operand - 2
begin
	case(alu_ctrl_r1)
		12'b00_000_0110011://add 00	000	0110011
		begin
		       oper1 		= data_in_1 		;
		       oper2 		= data_in_2 		;
		       oper1_sign 	= 1'b0			    ;
		       oper2_sign 	= 1'b0			    ;
		end

		12'b10_000_0110011://sub
		begin
		       oper2 		= data_in_2 		;
		       oper1 		= data_in_1		    ;
		       oper1_sign 	= 1'b0			    ;
               oper2_sign 	= 1'b0			    ;
		end
//////////////////////////////////////////////////////////////////////////////////
//
//
/////////////////////hardware only for 64 bit processor///////////////////////////
//
//mult_eo
////////////////////////////////////////////////////////////////////////////////////
`ifdef ZILLA_64_BIT
		12'b00_001_0110011://sll
		begin
		   oper2 		= {58'd0,data_in_2[5:0]};//{DATA_WIDTH-
		   oper1 		= data_in_1		        ;
		   oper1_sign 	= 1'b0			        ;
           oper2_sign 	= 1'b0			        ;
		end
        12'b00_101_0110011://srl
		begin
		   oper2 		= {58'd0,data_in_2[5:0]};
		   oper1 		= data_in_1		        ;
		   oper1_sign 	= 1'b0			        ;
           oper2_sign 	= 1'b0			        ;
        end
		12'b10_101_0110011: //sra
		begin
			oper2 		= {58'd0,data_in_2[5:0]};
			oper1 		= data_in_1 		    ;
			oper1_sign 	= 1'b0			        ;
            oper2_sign 	= 1'b0			        ;
		end
		12'b00_001_0010011://slli
		begin
			oper2 		= {58'd0,imm_val[5:0]}  ;
			oper1 		= data_in_1		        ;
			oper1_sign 	= 1'b0			        ;
            oper2_sign 	= 1'b0			        ;

		end
		12'b00_101_0010011://srli
		begin
			oper2 		= {58'd0,imm_val[5:0]} 	;
			oper1 		= data_in_1		        ;
			oper1_sign 	= 1'b0			        ;
            oper2_sign 	= 1'b0			        ;

		end
		12'b10_101_0010011://srai
		begin
			oper2 		= {58'd0,imm_val[5:0]}  ;
			oper1 		= data_in_1		        ;
			oper1_sign 	= 1'b0			        ;
            oper2_sign 	= 1'b0			        ;

		end

///////////////////////////////////////////////////////////////////////////
////////////////////////////                //////////////////////////////
//////////////////////////////////////////////////////////////////////////
//
//
////////hardware only for 32 bit processor///////////////////////////////
//
////////////////////////////////////////////////////////////////////////

`elsif ZILLA_32_BIT
		12'b00_001_0110011://sll
		begin
		   oper2 		= {27'd0,data_in_2[4:0]};//{DATA_WIDTH-
		   oper1 		= data_in_1		        ;
		   oper1_sign 	= 1'b0			        ;
           oper2_sign 	= 1'b0			        ;
		end
        12'b00_101_0110011://srl
		begin
		   oper2 		= {27'd0,data_in_2[4:0]};
		   oper1 		= data_in_1		        ;
		   oper1_sign 	= 1'b0			        ;
           oper2_sign 	= 1'b0			        ;
        end
		12'b10_101_0110011: //sra
		begin
			oper2 		= {27'd0,data_in_2[4:0]};
			oper1 		= data_in_1 		    ;
			oper1_sign 	= 1'b0			        ;
            oper2_sign 	= 1'b0			        ;
		end
		12'b00_001_0010011://slli
		begin
			oper2 		= {27'd0,imm_val[4:0]}  ;
			oper1 		= data_in_1		        ;
			oper1_sign 	= 1'b0			        ;
            oper2_sign 	= 1'b0			        ;

		end
		12'b00_101_0010011://srli
		begin
			oper2 		= {27'd0,imm_val[4:0]} 	;
			oper1 		= data_in_1		        ;
			oper1_sign 	= 1'b0			        ;
            oper2_sign 	= 1'b0			        ;

		end
		12'b10_101_0010011://srai
		begin
			oper2 		= {27'd0,imm_val[4:0]}  ;
			oper1 		= data_in_1		        ;
			oper1_sign 	= 1'b0			        ;
            oper2_sign 	= 1'b0			        ;

		end
 `endif

 ///////////////////////////////////////////////////////////
 //////////////////////////////////////////////////////////
 
		12'b00_000_0111011: //addw
		begin
			oper1 		= {32'd0,data_in_1[31:0]};	
            oper2 		= {32'd0,data_in_2[31:0]};
			oper1_sign 	= 1'b0			         ;
            oper2_sign 	= 1'b0			         ;


		end
         	12'b10_000_0111011: //subw
		begin
			oper1 		={32'd0,data_in_1[31:0]} ;  
			oper2 		={32'd0,data_in_2[31:0]} ;
			oper1_sign 	= 1'b0			         ;
            oper2_sign 	= 1'b0			         ;
	      	
		end
         	12'b00_001_0111011: //sllw
		begin
			oper1 		={32'd0,data_in_1[31:0]} ;  
			oper2 		={59'd0,data_in_2[4:0]}  ;  
			oper1_sign 	= 1'b0			         ;
            oper2_sign 	= 1'b0			         ;
		
		end
		12'b00_101_0111011: //srlw
		begin
			oper1 		={32'd0,data_in_1[31:0]} ;  
			oper2 		={59'd0,data_in_2[4:0]}  ; 
	       	oper1_sign 	= 1'b0			         ;
            oper2_sign 	= 1'b0			         ;

	
		end
		12'b10_101_0111011: //sraw
		begin
			oper1 		={32'd0,data_in_1[31:0]} ;  
			oper2 		={59'd0,data_in_2[4:0]}  ; 
			oper1_sign 	= 1'b0			         ;
            oper2_sign 	= 1'b0			         ;
		
		end


		12'b00_000_0011011://addiw
		begin
			oper1 		={32'd0,data_in_1[31:0]}; 
			oper2 		= {32'd0,imm_val[31:0]} ;
			oper1_sign 	= 1'b0                  ;
            oper2_sign 	= 1'b0                  ;
	
		end
		12'b00_001_0011011:   //slliw
		begin
			oper1 		={32'd0,data_in_1[31:0]}; 
			oper2 		={59'd0,imm_val[4:0]}   ;
			oper1_sign 	= 1'b0                  ;
            oper2_sign 	= 1'b0                  ;

		end
		12'b00_101_0011011:  //srliw
		begin
			oper1 		={32'd0,data_in_1[31:0]}; 
			oper2 		={59'd0,imm_val[4:0]}   ;
			oper1_sign 	= 1'b0                  ;
            oper2_sign 	= 1'b0                  ;

		end
		12'b10_101_0011011:  //sraiw
		begin
			oper1 		={32'd0,data_in_1[31:0]}; 
			oper2 		={59'd0,imm_val[4:0]}   ;
			oper1_sign 	= 1'b0                  ;
            oper2_sign 	= 1'b0                  ;

		end

		12'b01_000_0111011: //MULW
		begin
		oper1 		={{32{data_in_1[31]}},data_in_1[31:0]};  
		oper2 		={{32{data_in_2[31]}},data_in_2[31:0]}; 
		oper1_sign 	= 1'b0                                ;
        oper2_sign 	= 1'b0                                ;

		end	
		12'b01_100_0111011: //DIVW 
		begin
		oper1 		={{32{data_in_1[31]}},data_in_1[31:0]};  
		oper2 		={{32{data_in_2[31]}},data_in_2[31:0]}; 
		oper1_sign 	= 1'b1                                ;
        oper2_sign 	= 1'b1                                ;

		end
		12'b01_101_0111011: //DIVUW
		begin
		oper1 		={32'd0,data_in_1[31:0]}              ;  
		oper2 		={32'd0,data_in_2[31:0]}              ; 
		oper1_sign 	= 1'b0                                ;
        oper2_sign 	= 1'b0                                ;

		end
		12'b01_110_0111011: //REMW 
		begin
		oper1 		={{32{data_in_1[31]}},data_in_1[31:0]};  
		oper2 		={{32{data_in_2[31]}},data_in_2[31:0]}; 
		oper1_sign 	= 1'b1                                ;
        oper2_sign 	= 1'b1                                ;

		end
		12'b01_111_0111011: //REMUW
		begin
		oper1 		={32'd0,data_in_1[31:0]}              ;  
		oper2 		={32'd0,data_in_2[31:0]}              ; 
		oper1_sign 	= 1'b0                                ;
        oper2_sign 	= 1'b0                                ;

		end


		12'b00_110_1111011: //rol_en 
		begin
			oper1 		= data_in_1                       ;
			oper2 		= {58'd0,data_in_2[5:0]}          ;
			oper1_sign 	= 1'b0                            ;
            oper2_sign 	= 1'b0                            ;


		end	
		12'b00_111_1111011: //ror_en 
		begin
			oper1 		= data_in_1                      ;
			oper2 		= {58'd0,data_in_2[5:0]}         ;
			oper1_sign 	= 1'b0                           ;
            oper2_sign 	= 1'b0                           ;

		end	
		12'b00_000_1111011: //cg_en  
		begin
			oper1 		= data_in_1                      ;
			oper2 		= data_in_2                      ;
			oper1_sign 	= 1'b0                           ;
            oper2_sign 	= 1'b0                           ;

		end	
		12'b10_000_1111011: //cge_en 
		begin
			oper1 		= data_in_1                      ;
			oper2 		= data_in_2                      ;
			oper1_sign 	= 1'b0                           ;
            oper2_sign 	= 1'b0                           ;

		end	
		12'b00_001_1111011: //cgu_en 
		begin
			oper1 		= data_in_1;
			oper2 		= data_in_2;
			oper1_sign 	= 1'b0;
            oper2_sign 	= 1'b0;

		end	
		12'b10_001_1111011: //cgeu_en
		begin
			oper1 		= data_in_1;
			oper2 		= data_in_2;
			oper1_sign 	= 1'b0;
            oper2_sign 	= 1'b0;

		end	
		12'b00_010_1111011: //clt_en 
		begin
			oper1 		= data_in_1;
			oper2 		= data_in_2;
			oper1_sign 	= 1'b0;
            oper2_sign 	= 1'b0;

		end	
		12'b00_011_1111011: //cltu_en
		begin
			oper1 		= data_in_1;
			oper2 		= data_in_2;
			oper1_sign = 1'b0;
            oper2_sign = 1'b0;

		end	
		12'b10_010_1111011: //clte_en
		begin
			oper1 		= data_in_1;
			oper2 		= data_in_2;
			oper1_sign 	= 1'b0;
            oper2_sign 	= 1'b0;

		end	
		12'b10_011_1111011: //clteu_e
		begin
			oper1 		= data_in_1;
			oper2 		= data_in_2;
			oper1_sign 	= 1'b0;
            oper2_sign 	= 1'b0;

		end
		12'b00_100_1111011: //ceq_en 
		begin
			oper1 		= data_in_1;
			oper2 		= data_in_2;
			oper1_sign 	= 1'b0;
            oper2_sign 	= 1'b0;

		end	
		12'b00_101_1111011: //cne_en 
		begin
			oper1 		= data_in_1;
			oper2 		= data_in_2;
			oper1_sign 	= 1'b0;
            oper2_sign 	= 1'b0;

		end
		12'b00_110_1110111://roli
		begin
			oper1 		= data_in_1;
			oper2 		= {58'd0,imm_val[5:0]};
			oper1_sign 	= 1'b0;
            oper2_sign 	= 1'b0;

		end
		12'b00_111_1110111://rori
		begin
			oper1 		= data_in_1;
			oper2 		= {58'd0,imm_val[5:0]};
			oper1_sign 	= 1'b0;
            oper2_sign 	= 1'b0;

		end
		12'b00_000_1011011: //mov_en signed
		begin
			oper1 		= data_in_1;
			oper2 		= imm_val;
			oper1_sign 	= 1'b0;
            oper2_sign 	= 1'b0;

		end	
		12'b00_000_0101011: //move unsigned
		begin
			oper1 		= data_in_1;
			oper2 		= imm_val;
			oper1_sign 	= 1'b0;
            oper2_sign 	= 1'b0;

		end

		12'b00_100_0110011://xor
		begin
		       oper2 		= data_in_2 		;
		       oper1 		= data_in_1		    ;
		       oper1_sign 	= 1'b0			    ;
           oper2_sign 	= 1'b0			        ;
		end

		12'b00_110_0110011://or
		begin
			oper2 		= data_in_2 		;
			oper1 		= data_in_1 		;
			oper1_sign 	= 1'b0			    ;
            oper2_sign 	= 1'b0			    ;


		end
		12'b00_111_0110011://and
		begin
			oper2      	= data_in_2 		;
			oper1      	= data_in_1		    ;
			oper1_sign 	= 1'b0			    ;
            oper2_sign 	= 1'b0			    ;
		end

		12'b00_000_0010011://addi
		begin
			oper2 		= imm_val 		;
			oper1 		= data_in_1		;
			oper1_sign 	= 1'b0			;
            oper2_sign 	= 1'b0			;

		end
		12'b00_100_0010011://xori
		begin
			oper2 		= imm_val 		;
			oper1 		= data_in_1		;
			oper1_sign 	= 1'b0			;
            oper2_sign 	= 1'b0			;

		end
		12'b00_110_0010011://ori
		begin
			oper2 		= imm_val 		;
			oper1 		= data_in_1		;
			oper1_sign 	= 1'b0			;
            oper2_sign 	= 1'b0			;

		end
		12'b00_111_0010011://andi
		begin
			oper2 		= imm_val 		;
			oper1 		= data_in_1		;
			oper1_sign 	= 1'b0			;
            oper2_sign 	= 1'b0			;

		end
		12'b01_000_0110011://mul signed
		begin
		       oper2 	  	= data_in_2 		;
		       oper1     	= data_in_1		    ;
		       oper1_sign 	= 1'b1			    ;
               oper2_sign 	= 1'b1			    ;
		end
		12'b01_001_0110011://mulh unsigned
		begin
		       oper2 		= data_in_2 		;
		       oper1 		= data_in_1		    ;
		       oper1_sign 	= 1'b1			    ;
               oper2_sign 	= 1'b1			    ;

		end
		12'b01_011_0110011://mulhu unsigned
		begin
		       oper2 		= data_in_2 		;
		       oper1 		= data_in_1		    ;
		       oper1_sign 	= 1'b0			    ;
               oper2_sign 	= 1'b0			    ;
		end
		12'b01_010_0110011://mulhsu
		begin
			oper2 		    = data_in_2 		;
		    oper1 		    = data_in_1		    ;
			oper1_sign 	    = 1'b1			    ;
	        oper2_sign 	    = 1'b0			    ;

		end
		12'b01_100_0110011://div
		begin
		       oper2 		= data_in_2 		;
		       oper1 		= data_in_1		    ;
		       oper1_sign 	= 1'b1			    ;
               oper2_sign 	= 1'b1			    ;
		end
		12'b01_101_0110011://divu
		begin
		       oper2 		= data_in_2 		;
		       oper1 		= data_in_1		    ;
		       oper1_sign 	= 1'b0			    ;
               oper2_sign 	= 1'b0			    ;

		end
		12'b01_110_0110011://rem
		begin
		       oper2 		= data_in_2 		;
		       oper1 		= data_in_1		    ;
		       oper1_sign 	= 1'b1			    ;
               oper2_sign 	= 1'b1			    ;

		end
		12'b01_111_0110011://remu
		begin
			oper2 		= data_in_2 		;
			oper1 		= data_in_1		    ;
			oper1_sign 	= 1'b0			    ;
            oper2_sign 	= 1'b0			    ;
		end
		12'b00_000_0110111://lui
		begin
			oper2 		= imm_val		                ;
			oper1 		= {DATA_WIDTH{1'b0}}			;
			oper1_sign 	= 1'b0			                ;
            oper2_sign 	= 1'b0			                ;
		end

		12'b00_000_0010111://auipc
		begin
			oper2 		= imm_val		    ;
			oper1 		= {44'd0,pc_r}		;
			oper1_sign 	= 1'b0			    ;
            oper2_sign 	= 1'b0			    ;
		end
		12'b00_000_1101111://jal 
		begin
			oper2 		= {DATA_WIDTH{1'b0}} 		        ;
			oper1 		= {{DATA_WIDTH-20{1'b0}},jal_pc_r}	;
			oper1_sign 	= 1'b0			                    ;
            oper2_sign 	= 1'b0			                    ;
		end

		12'b00_000_1100111://jalr
		begin
			oper2 		= {DATA_WIDTH{1'b0}} 		        ;
			oper1 		= {{DATA_WIDTH-20{1'b0}},jal_pc_r}	;
            oper1_sign 	= 1'b0			                    ;
            oper2_sign 	= 1'b0			                    ;
			
		end
		12'b00_010_0010011://slti signed
		begin
			oper2 		= imm_val		    ;
			oper1 		= data_in_1		    ;
			oper1_sign 	= 1'b0			    ;
            oper2_sign 	= 1'b0			    ;

		end
		12'b00_011_0010011://sltiu unsigned
		begin
			oper1 		= data_in_1		    ;
			oper2 		= imm_val		    ;
			oper1_sign 	= 1'b0			    ;
            oper2_sign 	= 1'b0			    ;

		end
		12'b00_011_0110011://sltu unsigned
		begin
			oper1 		= data_in_1		    ;
			oper2 		= data_in_2		    ;
			oper1_sign 	= 1'b0			    ;
            oper2_sign 	= 1'b0			    ;


		end
		12'b00_010_0110011://slt signed
		begin
			oper1 		= data_in_1		    ;
			oper2 		= data_in_2		    ;
			oper1_sign 	= 1'b0			    ;
            oper2_sign 	= 1'b0			    ;

		end
		default:
		begin
			oper2       = {DATA_WIDTH{1'b0}};
			oper1       = {DATA_WIDTH{1'b0}};
			oper1_sign  = 1'b0              ;
            oper2_sign  = 1'b0              ;

		end
	endcase
end

`ifdef ZILLA_64_BIT
    sraw #(.DATA_WIDTH(DATA_WIDTH))
sraw_inst
(
.oper1		(oper1		),
.oper2		(oper2		),
.rslt		(sraw_op    ),
.zero		(sraw_zero	),
.en		    (sraw_en    )

);

`endif


auipc #(.DATA_WIDTH(DATA_WIDTH))
auipc_inst
(

.oper1		(oper1		),
.oper2		(oper2		),
.auipc_out	(auipc_op	),
.en		    (auipc_en	)
);

lui #(.DATA_WIDTH(DATA_WIDTH))
lui_inst

(

.oper1		(oper1		),
.oper2		(oper2		),
.lui_out	(lui_op		),
.en		    (lui_en     )
);

jalr #(.DATA_WIDTH(DATA_WIDTH)) 
jalr_inst
(
.oper1		(oper1		),
.oper2		(oper2		),
.jalr_out	(jalr_op	),
.en		    (jalr_en    )

);
jal #(.DATA_WIDTH(DATA_WIDTH)) 
jal_inst
(
.oper1		(oper1		),
.oper2		(oper2		),
.jal_out	(jal_op		),
.en		    (jal_en     )
);

add #(.DATA_WIDTH(DATA_WIDTH))
add_inst
(

.oper1		(oper1		),
.oper2		(oper2		),
.rslt		(sum		),
.carry		(carry_out	),
.zero		(add_zero	),
.en		    (add_en     )
);

sub #(.DATA_WIDTH(DATA_WIDTH)) 
sub_inst
(
.oper1		(oper1		),
.oper2		(oper2		),
.rslt		(diff		),
.borrow		(borrow_out ),
.zero		(sub_zero	),
.en		    (sub_en     )

);

sll #(.DATA_WIDTH(DATA_WIDTH)) 
sll_inst
(
.oper1		(oper1		),
.oper2		(oper2		),
.rslt		(sll_op		),
.zero		(sll_zero	),
.en		    (sll_en     )

);

xorg #(.DATA_WIDTH(DATA_WIDTH)) 
xor_inst
(
.oper1		(oper1		),
.oper2		(oper2		),
.rslt		(xor_op		),
.zero		(xor_zero	),
.en		    (xor_en     )

);

srl #(.DATA_WIDTH(DATA_WIDTH)) 
srl_inst
(

.oper1		(oper1		),
.oper2		(oper2		),
.rslt		(srl_op		),
.zero		(srl_zero	),
.en		    (srl_en	    )

);

sra #(.DATA_WIDTH(DATA_WIDTH))
sra_inst
(
.oper1		(oper1		),
.oper2		(oper2		),
.rslt		(sra_op		),
.zero		(sra_zero	),
.en		    (sra_en     )

);

org #(.DATA_WIDTH(DATA_WIDTH)) 
or_inst
(
.oper1		(oper1		),
.oper2		(oper2		),
.rslt		(or_op		),
.zero		(or_zero	),
.en		    (or_en      )

);

andg #(.DATA_WIDTH(DATA_WIDTH)) 
and_inst
(
.oper1		(oper1		),
.oper2		(oper2		),
.rslt		(and_op		),
.zero		(and_zero	),
.en		    (and_en	    )

);

mult #(.DATA_WIDTH(DATA_WIDTH))
mult_inst
(
.z_clk(alu_clk),
.z_rst(alu_rst),
.multiplicand	(oper1		),
.multiplier	(oper2		),
.oper1_sign	(oper1_sign	),
.oper2_sign	(oper2_sign	),
.product	(product	),
.zero		(mult_zero	),
.product_valid(product_valid),
.en		(mult_en_r2),
.op1(mult_op1),
.op2(mult_op2)
);

div #(.DATA_WIDTH(DATA_WIDTH)) 
div_inst
(
.clk_i          (alu_clk        ),
.rst_i          (alu_rst        ),
.devisor		(oper2          ),//rs2
.devidend	    (oper1          ),//rs1
.oper1_sign	    (oper1_sign     ),
.oper2_sign	    (oper2_sign     ),
.quotient	    (quotient       ),
.zero           (div_zero       ),
.en             (div_en         ),
.div_opcode_i   (div_opcode_i   ),
.div_valid_o    (div_valid_w    ),
.div_busy_o     (div_busy_o     ) 

);

rem #(.DATA_WIDTH(DATA_WIDTH)) 
rem_inst

(
.clk_i           (alu_clk       ),
.rst_i           (alu_rst       ),
.en              (rem_en            ),
.devidend        (oper1         ),
.devisor         (oper2         ),
.opcode_i        (rem_opcode_i  ),
.remainder        (remainder     ),
.reminder_valid  (rem_valid_w  ),
.rem_busy_o      (rem_busy_o    )   

);


slt #(.DATA_WIDTH(DATA_WIDTH)) slt_inst
(
.in1	(oper1		    ),
.in2	(oper2		    ),
.ctrl	(alu_ctrl_r1	),
.op	    (slt_op		    ),
.en		(slt_en         )
);

rotate_left #(.DATA_WIDTH(DATA_WIDTH)) 
rotate_left_inst
(
.oper1	(oper1  ),
.oper2	(oper2  ),
.en	    (rol_en ),
.result	(rol_op )
);

rotate_right #(.DATA_WIDTH(DATA_WIDTH))
rotate_right_inst
(
.oper1	(oper1  ),
.oper2	(oper2  ),
.en	    (ror_en ),
.result	(ror_op )

);

cmp_eq #(.DATA_WIDTH(DATA_WIDTH))
cmp_eq_inst
(
.oper1	(oper1  ),
.oper2	(oper2  ),
.en	    (ceq_en ),
.result	(ceq_op )

);

cmp_ne #(.DATA_WIDTH(DATA_WIDTH))
cmp_ne_inst
(
.oper1	(oper1  ),
.oper2	(oper2  ),
.en	    (cne_en ),
.result	(cne_op )

);

cmp_gt #(.DATA_WIDTH(DATA_WIDTH))
cmp_gt_inst
(
.oper1	(oper1  ),
.oper2	(oper2  ),
.en	    (cg_en  ),
.result	(cg_op  )

);

cmp_gte #(.DATA_WIDTH(DATA_WIDTH))
cmp_gte_inst
(
.oper1	(oper1  ),
.oper2	(oper2  ),
.en	    (cge_en ),
.result	(cge_op )

);

cmp_gtu #(.DATA_WIDTH(DATA_WIDTH))
cmp_gtu_inst
(
.oper1	(oper1  ),
.oper2	(oper2  ),
.en	    (cgu_en ),
.result	(cgu_op )


);

cmp_gteu #(.DATA_WIDTH(DATA_WIDTH))
cmp_gteu_inst
(
.oper1	(oper1  ),
.oper2	(oper2  ),
.en	    (cgeu_en),
.result	(cgeu_op)

);

cmp_lt #(.DATA_WIDTH(DATA_WIDTH))
cmp_lt_inst
(
.oper1	(oper1  ),
.oper2	(oper2  ),
.en	    (clt_en ),
.result	(clt_op )

);

cmp_lte #(.DATA_WIDTH(DATA_WIDTH))
cmp_lte_inst
(
.oper1	(oper1  ),
.oper2	(oper2  ),
.en	    (clte_en),
.result	(clte_op)

);

cmp_ltu #(.DATA_WIDTH(DATA_WIDTH))
cmp_ltu_inst
(
.oper1	(oper1  ),
.oper2	(oper2  ),
.en	    (cltu_en),
.result	(cltu_op)

);

cmp_lteu #(.DATA_WIDTH(DATA_WIDTH))
cmp_lteu_inst
(
.oper1	(oper1   ),
.oper2	(oper2   ),
.en	    (clteu_en),
.result	(clteu_op)

);

mvi #(.DATA_WIDTH(DATA_WIDTH))
mvi_inst
(
.oper1	(oper1  ),
.oper2	(oper2  ),
.en	    (mov_en ),
.result	(mov_op )

);
always@(posedge alu_clk or negedge alu_rst)
begin
			if(!alu_rst)
			begin
			data_out    <= {DATA_WIDTH{1'b0}};
			zero_o      <= 1'b0              ;
			carry_o     <= 1'b0              ;
			end
			else
			begin
           data_out <= data_out_1_o;
                //if(product_valid)
                //begin
			    //    data_out <= product[DATA_WIDTH-1:0];
                //end
                //else
                //begin
                //    data_out <= data_out_1_o;
                //end
			carry_o <= carry;
			zero_o <= zero;

			end

end

always@(*) // to route proper output    
begin
	case(alu_ctrl_r1)
		12'b00_000_0110011://add
		begin
			data_out_1 = sum        ;
			carry	   = carry_out  ;
			zero	   = add_zero   ;
		end
		12'b10_000_0110011://sub
		begin
			data_out_1 = diff       ;
			carry  	   = borrow_out ;
			zero	   = sub_zero   ;

		end
		12'b00_001_0110011://sll
		begin
			data_out_1 = sll_op     ;
			carry	   = 1'b0       ;
			zero	   = sll_zero   ;

		end
		12'b00_100_0110011://xor
		begin
			data_out_1 = xor_op     ;
			carry	   = 1'b0       ;
			zero	   = xor_zero   ;


		end
		12'b00_101_0110011://srl
		begin
			data_out_1 = srl_op     ;
			carry	   = 1'b0       ;
			zero	   = srl_zero   ;


		end
		12'b10_101_0110011://sra
		begin
			data_out_1 = sra_op     ;
			carry	   = 1'b0       ;
			zero	   = sra_zero   ;


		end
		12'b00_110_0110011://or
		begin
			data_out_1 = or_op      ;
			carry	   = 1'b0       ;
			zero	   = or_zero    ;


		end
		12'b00_111_0110011://and
		begin
			data_out_1 = and_op     ;
			carry	   = 1'b0       ;
			zero	   = and_zero   ;


		end
		12'b00_000_0010011://addi
		begin
			data_out_1 = sum        ;
			carry	   = carry_out  ;
			zero	   = add_zero   ;


		end
		12'b00_001_0010011://slli
		begin
			data_out_1 = sll_op     ;
			carry	   = 1'b0       ;
			zero	   = sll_zero   ;


		end
		12'b00_100_0010011://xori
		begin
			data_out_1 = xor_op     ;
			carry	   = 1'b0       ;
			zero	   = xor_zero   ;


		end
		12'b00_101_0010011://srli
		begin
			data_out_1 = srl_op     ;
			carry	   = 1'b0       ;
			zero	   = srl_zero   ;


		end
		12'b10_101_0010011://srai
		begin
			data_out_1 = sra_op     ;
			carry	   = 1'b0       ;
			zero	   = sra_zero   ;


		end
		12'b00_110_0010011://ori
		begin
			data_out_1 = or_op      ;
			carry	   = 1'b0       ;
			zero	   = or_zero    ;


		end
		12'b00_111_0010011://andi
		begin
			data_out_1 = and_op     ;
			carry	   = 1'b0       ;
			zero	   = and_zero   ;


		end
		12'b01_000_0110011://mul signed
		begin
			data_out_1 = product[DATA_WIDTH-1:0];
			carry	   = 1'b0                   ;
			if(product[DATA_WIDTH-1:0] == {DATA_WIDTH{1'b0}})
				begin
				zero	 = 1'b1;
				end
			else
				begin
				zero = 1'b0;
				end
		end
		12'b01_001_0110011://mulh signed
		begin
			data_out_1 = product[(DATA_WIDTH*2)-1:DATA_WIDTH];
			carry	   = 1'b0;
			if(product[(DATA_WIDTH*2)-1:DATA_WIDTH] == {DATA_WIDTH{1'b0}})
				begin
				zero	 = 1'b1;
				end
			else
				begin
				zero = 1'b0;
				end
		end
		12'b01_011_0110011://mulhu unsigned
		begin
			data_out_1 = product[(DATA_WIDTH*2)-1:DATA_WIDTH];
			carry	   = 1'b0;
			if(product[(DATA_WIDTH*2)-1:DATA_WIDTH] == {DATA_WIDTH{1'b0}})
				begin
				zero	 = 1'b1;
				end
			else
				begin
				zero = 1'b0;
				end
		end
		12'b01_010_0110011://mulhsu signed and unsigned
		begin
			data_out_1 = product[(DATA_WIDTH*2)-1:DATA_WIDTH];
			carry	   = 1'b0;
			if(product[(DATA_WIDTH*2)-1:DATA_WIDTH] == {DATA_WIDTH{1'b0}})
				begin
				zero	 = 1'b1;
				end
			else
				begin
				zero = 1'b0;
				end
		end

	/*	12'b01_100_0110011://div signed
		begin
			data_out_1 = quotient   ;
			carry	   = 1'b0       ;
			zero	   = div_zero   ;

		end
		12'b01_101_0110011://divu unsigned
		begin
			data_out_1 = quotient   ;
			carry	   = 1'b0       ;
			zero	   = div_zero   ;

		end */
		/*12'b01_110_0110011://rem signed
		begin
			data_out_1 = remainder  ;
			carry	   = 1'b0       ;
			zero	   = rem_zero   ;

		end
		12'b01_111_0110011://remu unsigned
		begin
			data_out_1 = remainder  ;
			carry	   = 1'b0       ;
			zero	   = rem_zero   ;

		end */
		12'b00_000_0110111://lui
		begin
			data_out_1 = lui_op;
			carry      = 1'b0  ;
            if(lui_op == {DATA_WIDTH{1'b0}})
            begin
			zero	 = 1'b1	 ;
            end
            else
            begin
            zero = 1'b0;
            end
		    end
		12'b00_000_0010111://auipc
		begin
			data_out_1  = auipc_op;
			carry       = 1'b0  ;
		    if(auipc_op == {DATA_WIDTH{1'b0}})
            begin
			zero	 = 1'b1	 ;
            end
            else
            begin
            zero = 1'b0;
            end
		    end
		12'b00_000_1100111://jalr
		begin
			data_out_1  = jalr_op;
			carry       = 1'b0;
			if(jalr_op == {DATA_WIDTH{1'b0}})
			begin
			zero = 1'b1;
			end
			else
			begin
			zero = 1'b0;
			end
		end
		12'b00_000_1101111://jal
		begin
			data_out_1 = jal_op;
			carry    = 1'b0  ;
			if(jal_op == {DATA_WIDTH{1'b0}})
			begin
		    zero = 1'b1;
			end
			else
			begin
			zero = 1'b0;
			end
		end
		12'b00_010_0010011://slti signed
		begin
			data_out_1 = slt_op	;
			carry 	   = 1'b0	;
			if(data_out_1 != {DATA_WIDTH{1'b0}})
			begin
			zero 	   = 1'b0	;
			end
			else
			begin
			zero = 1'b1;
			end
		end
		12'b00_011_0010011://sltiu unsigned
		begin
			data_out_1 = slt_op	;
			carry 	   = 1'b0	;
			if(data_out_1 != {DATA_WIDTH{1'b0}})
			begin
			zero 	   = 1'b0	;
			end
			else
			begin
			zero = 1'b1;
			end
		end
		12'b00_011_0110011://sltu unsigned
		begin
			data_out_1 = slt_op	;
			carry 	   = 1'b0	;
			if(data_out_1 != {DATA_WIDTH{1'b0}})
			begin
			zero 	   = 1'b0	;
			end
			else
			begin
			zero = 1'b1;
			end			
		end
		
		12'b00_010_0110011://slt signed
		begin
			data_out_1 = slt_op	;			
			carry 	   = 1'b0	;
			if(data_out_1 != {DATA_WIDTH{1'b0}})
			begin
			zero 	   = 1'b0	;
			end
			else
			begin
			zero = 1'b1;
			end
		end

 `ifdef ZILLA_64_BIT
		12'b00_000_0111011: //addw
		begin
			data_out_1 = {{32{sum[31]}},sum[31:0]}; 	
			if(sum[31:0] == 32'd0)
			begin
			zero = 1'b1;
			end
			else
			begin
			zero = 1'b0;
			end
			if(sum[32])
			begin
			carry = 1'b1;
			end
			else
			begin
			carry = 1'b0;
			end
		end

         	12'b10_000_0111011: //subw
		begin
			data_out_1 = {{32{diff[31]}},diff[31:0]}; 	
			if(diff[31:0] == 32'd0)
				begin
					zero = 1'b1;
				end
			else
				begin
					zero = 1'b0;
				end
			if(diff[32])
			begin
				carry = 1'b1;
			end
			else
			begin
				carry = 1'b0;
			end
		end
         	12'b00_001_0111011: //sllw
		begin
			data_out_1 = {{32{sll_op[31]}},sll_op[31:0]}	;			
			carry 	   = 1'b0			;
			if(sll_op[31:0] == 32'd0)
				begin
					zero = 1'b1;
				end
			else
				begin
					zero = 1'b0;
				end
		end
		12'b00_101_0111011: //srlw
		begin
			data_out_1 = {{32{srl_op[31]}},srl_op[31:0]}	;			
			carry 	   = 1'b0			;
			if(srl_op[31:0] == 32'd0)
				begin
					zero = 1'b1;
				end
			else
				begin
					zero = 1'b0;
				end
		end
		12'b10_101_0111011: //sraw
		begin
			data_out_1 = {{32{sraw_op[31]}},sraw_op[31:0]}	;			
			carry 	   = 1'b0			;
			if(sraw_op[31:0] == 32'd0)
				begin
					zero = 1'b1;
				end
			else
				begin
					zero = 1'b0;
				end
		end
		12'b00_000_0011011://addiw
		begin
			data_out_1 = {{32{sum[31]}},sum[31:0]}; 	
        		if(sum[31:0] == 32'd0)
				begin
					zero = 1'b1;
				end
			else
				begin
					zero = 1'b0;
				end
			if(sum[32])
			begin
				carry = 1'b1;
			end
			else
			begin
				carry = 1'b0;
			end
		end
		12'b00_001_0011011:   //slliw
		begin
			data_out_1 = {{32{sll_op[31]}},sll_op[31:0]}	;			
			carry 	   = 1'b0			;
			if(sll_op[31:0] == 32'd0)
			begin
			zero 	   = 1'b1			;
			end
			else
			begin
			zero = 1'b0;
			end
		end
		12'b00_101_0011011:  //srliw
		begin
			data_out_1 = {{32{srl_op[31]}},srl_op[31:0]}	;			
			carry 	   = 1'b0			;
			if(srl_op[31:0] == 32'd0)
			begin
			zero 	   = 1'b1			;
			end
			else
			begin
			zero = 1'b0;
			end

		end
		12'b10_101_0011011:  //sraiw
		begin
			data_out_1 = {{32{sraw_op[31]}},sraw_op[31:0]}	;			
			carry 	   = 1'b0			;
			if(sraw_op[31:0] == 32'd0)
			begin
			zero 	   = 1'b1			;
			end
			else
			begin
			zero = 1'b0;
			end
		end
12'b01_000_0111011://MULW

begin
	data_out_1 = {{32{product[31]}},product[31:0]};
	carry	   = 1'b0;
	if(product[31:0] == 32'd0)
	begin
		zero = 1'b1;
	end
	else
	begin
		zero = 1'b0;
	end
end	
 /*
12'b01_100_0111011:	//DIVW 
begin
	data_out_1 = {{32{quotient[31]}},quotient[31:0]};
	carry	   = 1'b0;
	if(quotient[31:0] == 32'd0)
	begin
		zero = 1'b1;
	end
	else
	begin
		zero = 1'b0;
	end


end
12'b01_101_0111011://DIVUW
begin
	data_out_1 = {{32{quotient[31]}},quotient[31:0]};
	carry	   = 1'b0;
	if(quotient[31:0] == 32'd0)
	begin
		zero = 1'b1;
	end
	else
	begin
		zero = 1'b0;
	end


end	
12'b01_110_0111011://REMW 

begin
	data_out_1 = {{32{remainder[31]}},remainder[31:0]};
	carry	   = 1'b0;
	if(remainder[31:0] == 32'd0)
	begin
		zero = 1'b1;
	end
	else
	begin
		zero = 1'b0;
	end


end	
12'b01_111_0111011://REMUW
begin
	data_out_1 = {32'd0,remainder[31:0]};
	carry	   = 1'b0;
	if(remainder[31:0] == 32'd0)
	begin
		zero = 1'b1;
	end
	else
	begin
		zero = 1'b0;
	end


end	*/


 `endif
		12'b00_110_1111011: //rol_en 
		begin
			data_out_1 	= rol_op;
			carry	 	= 1'b0;
			if(data_out_1 != {DATA_WIDTH{1'b0}})
			begin
			zero 	   = 1'b0	;
			end
			else
			begin
				zero = 1'b1;
			end
		end	
		12'b00_111_1111011: //ror_en 
		begin
			data_out_1 	= ror_op;
			carry	 	=1'b0 ;
			if(data_out_1 != {DATA_WIDTH{1'b0}})
			begin
			zero 	   = 1'b0	;
			end
			else
			begin
				zero = 1'b1;
			end                        
		end	
		12'b00_000_1111011: //cg_en  
		begin
			data_out_1 	= {63'd0,cg_op};
			carry	 	=1'b0 ;
			if(data_out_1 != {DATA_WIDTH{1'b0}})
			begin
			zero 	   = 1'b0	;
			end
			else
			begin
				zero = 1'b1;
			end
		end	
		12'b10_000_1111011: //cge_en 
		begin
			data_out_1 	= {{DATA_WIDTH-1{1'b0}},cge_op};
			carry	 	=1'b0 ;
			if(data_out_1 != {DATA_WIDTH{1'b0}})
			begin
			zero 	   = 1'b0	;
			end
			else
			begin
				zero = 1'b1;
			end                     
		end	
		12'b00_001_1111011: //cgu_en 
		begin
			data_out_1 	= {{DATA_WIDTH-1{1'b0}},cgu_op};
			carry	 	=1'b0 ;
			if(data_out_1 != {DATA_WIDTH{1'b0}})
			begin
			zero 	   = 1'b0	;
			end
			else
			begin
				zero = 1'b1;
			end                      
		end	
		12'b10_001_1111011: //cgeu_en
		begin
			data_out_1 	= {{DATA_WIDTH-1{1'b0}},cgeu_op};
			carry	 	=1'b0 ;
			if(data_out_1 != {DATA_WIDTH{1'b0}})
			begin
			zero 	   = 1'b0	;
			end
			else
			begin
				zero = 1'b1;
			end                        
		end	
		12'b00_010_1111011: //clt_en 
		begin
			data_out_1 	= {{DATA_WIDTH-1{1'b0}},clt_op};
			carry	 	=1'b0 ;
			if(data_out_1 != {DATA_WIDTH{1'b0}})
			begin
			zero 	   = 1'b0	;
			end
			else
			begin
				zero = 1'b1;
			end                        
		end	
		12'b00_011_1111011: //cltu_en
		begin
			data_out_1 	= {{DATA_WIDTH-1{1'b0}},cltu_op};
			carry	 	=1'b0 ;
			if(data_out_1 != {DATA_WIDTH{1'b0}})
			begin
			zero 	   = 1'b0	;
			end
			else
			begin
				zero = 1'b1;
			end                        
		end	
		12'b10_010_1111011: //clte_en
		begin
			data_out_1 	= {{DATA_WIDTH-1{1'b0}},clte_op};
			carry	 	=1'b0 ;
			if(data_out_1 != {DATA_WIDTH{1'b0}})
			begin
			zero 	   = 1'b0	;
			end
			else
			begin
				zero = 1'b1;
			end                        
		end	
		12'b10_011_1111011: //clteu_e
		begin
			data_out_1 	= {{DATA_WIDTH-1{1'b0}},clteu_op};
			carry	 	=1'b0 ;
			if(data_out_1 != {DATA_WIDTH{1'b0}})
			begin
			zero 	   = 1'b0	;
			end
			else
			begin
				zero = 1'b1;
			end                        
		end
		12'b00_100_1111011: //ceq_en 
		begin			
			data_out_1 	= {{DATA_WIDTH-1{1'b0}},ceq_op};
			carry	 	= 1'b0;
 			if(data_out_1 != {DATA_WIDTH{1'b0}})
			begin
			zero 	   = 1'b0	;
			end
			else
			begin
				zero = 1'b1;
			end
		end	
		12'b00_101_1111011: //cne_en 
		begin
			data_out_1 	= {{DATA_WIDTH-1{1'b0}},cne_op};
			carry	 	= 1'b0;
			if(data_out_1 != {DATA_WIDTH{1'b0}})
			begin
			zero 	   = 1'b0	;
			end
			else
			begin
				zero = 1'b1;
			end                        
		end
		12'b00_110_1110111://roli
		begin			
			data_out_1 	= rol_op;
			carry	 	= 1'b0;
			if(data_out_1 != {DATA_WIDTH{1'b0}})
			begin
			zero 	   = 1'b0	;
			end
			else
			begin
				zero = 1'b1;
			end
		end
		12'b00_111_1110111://rori
		begin
			data_out_1 	= ror_op;
			carry	 	= 1'b0;
			if(data_out_1 != {DATA_WIDTH{1'b0}})
			begin
			zero 	   = 1'b0	;
			end
			else
			begin
				zero = 1'b1;
			end
		end
		12'b00_000_1011011: //mov_en signed
		begin
			data_out_1 	= mov_op;
			carry	 	= 1'b0;
			if(mov_op == {DATA_WIDTH{1'b0}})
			begin
			zero	 	= 1'b1; 
			end
			else
			begin
				zero = 1'b0;
			end                        
		end
        12'b00_000_0101011://mov imm unsigned
        begin
			data_out_1 	= mov_op;
			carry	 	= 1'b0;
			if(mov_op == {DATA_WIDTH{1'b0}})
			begin
			zero	 	= 1'b1; 
			end
			else
			begin
				zero = 1'b0;
			end
        end	
		default:
		begin
			data_out_1 	= {DATA_WIDTH{1'b0}}	;
			carry	 	= 1'b0	;
			zero	 	= 1'b0	;    
		end
	endcase
end
endmodule

////////////////////////////// 
//	addition 	    //
//////////////////////////////
module add #(parameter DATA_WIDTH = 0)

(
input		                en	    ,
input  [DATA_WIDTH-1:0] 	oper1	,
input  [DATA_WIDTH-1:0] 	oper2	,
output [DATA_WIDTH-1:0] 	rslt	,
output 	      	            carry	,
output		                zero	
);

wire [DATA_WIDTH:0] sum;

assign sum   = en ? (oper1 + oper2) : {DATA_WIDTH+1{1'b0}} ;
assign rslt  = sum[DATA_WIDTH-1:0];
assign carry = sum[DATA_WIDTH];
assign zero  = (rslt == {DATA_WIDTH{1'b0}}) ? 1'b1 : 1'b0;

endmodule

////////////////////////////// 
//	substraction	    //
//////////////////////////////
module sub #(parameter DATA_WIDTH = 0)
(
input 		                en	    ,
input  [DATA_WIDTH-1:0] 	oper1	,
input  [DATA_WIDTH-1:0] 	oper2	,
output [DATA_WIDTH-1:0] 	rslt	,
output 		                borrow	,
output 		                zero	


);
wire [DATA_WIDTH:0]diff;

assign diff   = en ? (oper1 - oper2) : {DATA_WIDTH+1{1'b0}} ;
assign rslt   = diff[DATA_WIDTH-1:0];
assign borrow = diff[DATA_WIDTH];
assign zero   = (diff == {DATA_WIDTH{1'b0}}) ? 1'b1 : 1'b0;

endmodule

////////////////////////////// 
//   logical left shift	    //
//////////////////////////////
module sll #(parameter DATA_WIDTH = 0)
(
input [DATA_WIDTH-1:0] 		oper1	,
input [DATA_WIDTH-1:0] 		oper2	,
output [DATA_WIDTH-1:0] 	rslt	,
output 			            zero    ,	
input 		                en	    

);

assign rslt = en ? (oper1 << oper2) : {DATA_WIDTH{1'b0}} ;
assign zero = (rslt == {DATA_WIDTH{1'b0}}) ? 1'b1 : 1'b0;

endmodule

////////////////////////////// 
//   logical XOR	    //
//////////////////////////////
module xorg #(parameter DATA_WIDTH = 0)
(
input [DATA_WIDTH-1:0] 		oper1	,
input [DATA_WIDTH-1:0] 		oper2	,
output [DATA_WIDTH-1:0] 	rslt	,
output 			            zero	,
input			            en


);
assign rslt = en ? (oper1 ^ oper2) : {DATA_WIDTH{1'b0}} ;
assign zero = (rslt == {DATA_WIDTH{1'b0}}) ? 1'b1 : 1'b0;


endmodule


////////////////////////////// 
//   logical right shift    //
//////////////////////////////

module srl #(parameter DATA_WIDTH = 0)
(

input [DATA_WIDTH-1:0] 		oper1	,
input [DATA_WIDTH-1:0] 		oper2	,
output [DATA_WIDTH-1:0] 	rslt	,
output 			            zero    ,
input			            en


);
assign rslt = en ? (oper1 >> oper2) : {DATA_WIDTH{1'b0}}  ; 
assign zero = (rslt == {DATA_WIDTH{1'b0}}) ? 1'b1 : 1'b0;


endmodule



////////////////////////////////// 
//  arithmetic right shift double word	//
//////////////////////////////////
module sra #(parameter DATA_WIDTH = 0)
(
input 		[DATA_WIDTH-1:0] 		oper1	,
input 		[DATA_WIDTH-1:0] 		oper2	,
output 		[DATA_WIDTH-1:0] 		rslt	,
output 				                zero    ,
input				                en      


);
	reg [DATA_WIDTH-1:0] result;
`ifdef ZILLA_64_BIT
always@(*)
begin
if(en)
begin
case(oper2[5:0])
 6'b000000:result = oper1;
 6'b000001:result = {{ 2{oper1[DATA_WIDTH-1]}} ,oper1[62:1 ] };
 6'b000010:result = {{ 3{oper1[DATA_WIDTH-1]}} ,oper1[62:2 ] };
 6'b000011:result = {{ 4{oper1[DATA_WIDTH-1]}} ,oper1[62:3 ] };
 6'b000100:result = {{ 5{oper1[DATA_WIDTH-1]}} ,oper1[62:4 ] };
 6'b000101:result = {{ 6{oper1[DATA_WIDTH-1]}} ,oper1[62:5 ] };
 6'b000110:result = {{ 7{oper1[DATA_WIDTH-1]}} ,oper1[62:6 ] };
 6'b000111:result = {{ 8{oper1[DATA_WIDTH-1]}} ,oper1[62:7 ] };
 6'b001000:result = {{ 9{oper1[DATA_WIDTH-1]}} ,oper1[62:8 ] };
 6'b001001:result = {{10{oper1[DATA_WIDTH-1]}} ,oper1[62:9 ] };
 6'b001010:result = {{11{oper1[DATA_WIDTH-1]}} ,oper1[62:10] };
 6'b001011:result = {{12{oper1[DATA_WIDTH-1]}} ,oper1[62:11] };
 6'b001100:result = {{13{oper1[DATA_WIDTH-1]}} ,oper1[62:12] };
 6'b001101:result = {{14{oper1[DATA_WIDTH-1]}} ,oper1[62:13] };
 6'b001110:result = {{15{oper1[DATA_WIDTH-1]}} ,oper1[62:14] };
 6'b001111:result = {{16{oper1[DATA_WIDTH-1]}} ,oper1[62:15] };
 6'b010000:result = {{17{oper1[DATA_WIDTH-1]}} ,oper1[62:16] };
 6'b010001:result = {{18{oper1[DATA_WIDTH-1]}} ,oper1[62:17] };
 6'b010010:result = {{19{oper1[DATA_WIDTH-1]}} ,oper1[62:18] };
 6'b010011:result = {{20{oper1[DATA_WIDTH-1]}} ,oper1[62:19] };
 6'b010100:result = {{21{oper1[DATA_WIDTH-1]}} ,oper1[62:20] };
 6'b010101:result = {{22{oper1[DATA_WIDTH-1]}} ,oper1[62:21] };
 6'b010110:result = {{23{oper1[DATA_WIDTH-1]}} ,oper1[62:22] };
 6'b010111:result = {{24{oper1[DATA_WIDTH-1]}} ,oper1[62:23] };
 6'b011000:result = {{25{oper1[DATA_WIDTH-1]}} ,oper1[62:24] };
 6'b011001:result = {{26{oper1[DATA_WIDTH-1]}} ,oper1[62:25] };
 6'b011010:result = {{27{oper1[DATA_WIDTH-1]}} ,oper1[62:26] };
 6'b011011:result = {{28{oper1[DATA_WIDTH-1]}} ,oper1[62:27] };
 6'b011100:result = {{29{oper1[DATA_WIDTH-1]}} ,oper1[62:28] };
 6'b011101:result = {{30{oper1[DATA_WIDTH-1]}} ,oper1[62:29] };
 6'b011110:result = {{31{oper1[DATA_WIDTH-1]}} ,oper1[62:30] };
 6'b011111:result = {{32{oper1[DATA_WIDTH-1]}} ,oper1[62:31] };
 6'b100000:result = {{33{oper1[DATA_WIDTH-1]}} ,oper1[62:32] };
 6'b100001:result = {{34{oper1[DATA_WIDTH-1]}} ,oper1[62:33] };
 6'b100010:result = {{35{oper1[DATA_WIDTH-1]}} ,oper1[62:34] };
 6'b100011:result = {{36{oper1[DATA_WIDTH-1]}} ,oper1[62:35] };
 6'b100100:result = {{37{oper1[DATA_WIDTH-1]}} ,oper1[62:36] };
 6'b100101:result = {{38{oper1[DATA_WIDTH-1]}} ,oper1[62:37] };
 6'b100110:result = {{39{oper1[DATA_WIDTH-1]}} ,oper1[62:38] };
 6'b100111:result = {{40{oper1[DATA_WIDTH-1]}} ,oper1[62:39] };
 6'b101000:result = {{41{oper1[DATA_WIDTH-1]}} ,oper1[62:40] };
 6'b101001:result = {{42{oper1[DATA_WIDTH-1]}} ,oper1[62:41] };
 6'b101010:result = {{43{oper1[DATA_WIDTH-1]}} ,oper1[62:42] };
 6'b101011:result = {{44{oper1[DATA_WIDTH-1]}} ,oper1[62:43] };
 6'b101100:result = {{45{oper1[DATA_WIDTH-1]}} ,oper1[62:44] };
 6'b101101:result = {{46{oper1[DATA_WIDTH-1]}} ,oper1[62:45] };
 6'b101110:result = {{47{oper1[DATA_WIDTH-1]}} ,oper1[62:46] };
 6'b101111:result = {{48{oper1[DATA_WIDTH-1]}} ,oper1[62:47] };
 6'b110000:result = {{49{oper1[DATA_WIDTH-1]}} ,oper1[62:48] };
 6'b110001:result = {{50{oper1[DATA_WIDTH-1]}} ,oper1[62:49] };
 6'b110010:result = {{51{oper1[DATA_WIDTH-1]}} ,oper1[62:50] };
 6'b110011:result = {{52{oper1[DATA_WIDTH-1]}} ,oper1[62:51] };
 6'b110100:result = {{53{oper1[DATA_WIDTH-1]}} ,oper1[62:52] };
 6'b110101:result = {{54{oper1[DATA_WIDTH-1]}} ,oper1[62:53] };
 6'b110110:result = {{55{oper1[DATA_WIDTH-1]}} ,oper1[62:54] };
 6'b110111:result = {{56{oper1[DATA_WIDTH-1]}} ,oper1[62:55] };
 6'b111000:result = {{57{oper1[DATA_WIDTH-1]}} ,oper1[62:56] };
 6'b111001:result = {{58{oper1[DATA_WIDTH-1]}} ,oper1[62:57] };
 6'b111010:result = {{59{oper1[DATA_WIDTH-1]}} ,oper1[62:58] };
 6'b111011:result = {{60{oper1[DATA_WIDTH-1]}} ,oper1[62:59] };
 6'b111100:result = {{61{oper1[DATA_WIDTH-1]}} ,oper1[62:60] };
 6'b111101:result = {{62{oper1[DATA_WIDTH-1]}} ,oper1[62:61] };
 6'b111110:result = {{DATA_WIDTH-1{oper1[DATA_WIDTH-1]}} ,oper1[62]    };
 6'b111111:result = {{64{oper1[DATA_WIDTH-1]}}		     };
default:result = {DATA_WIDTH{1'b0}};
endcase
end
else
begin
result = {DATA_WIDTH{1'b0}};
end
end

`elsif ZILLA_32_BIT
always@(*)
begin
if(en)
begin
case(oper2[4:0])
 5'b000000:result = oper1;
 5'b000001:result = {{ 2{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:1 ] };
 5'b000010:result = {{ 3{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:2 ] };
 5'b000011:result = {{ 4{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:3 ] };
 5'b000100:result = {{ 5{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:4 ] };
 5'b000101:result = {{ 6{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:5 ] };
 5'b000110:result = {{ 7{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:6 ] };
 5'b000111:result = {{ 8{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:7 ] };
 5'b001000:result = {{ 9{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:8 ] };
 5'b001001:result = {{10{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:9 ] };
 5'b001010:result = {{11{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:10] };
 5'b001011:result = {{12{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:11] };
 5'b001100:result = {{13{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:12] };
 5'b001101:result = {{14{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:13] };
 5'b001110:result = {{15{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:14] };
 5'b001111:result = {{16{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:15] };
 5'b010000:result = {{17{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:16] };
 5'b010001:result = {{18{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:17] };
 5'b010010:result = {{19{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:18] };
 5'b010011:result = {{20{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:19] };
 5'b010100:result = {{21{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:20] };
 5'b010101:result = {{22{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:21] };
 5'b010110:result = {{23{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:22] };
 5'b010111:result = {{24{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:23] };
 5'b011000:result = {{25{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:24] };
 5'b011001:result = {{26{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:25] };
 5'b011010:result = {{27{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:26] };
 5'b011011:result = {{28{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:27] };
 5'b011100:result = {{29{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:28] };
 5'b011101:result = {{30{oper1[DATA_WIDTH-1]}} ,oper1[DATA_WIDTH-2:29] };
 5'b011110:result = {{31{oper1[DATA_WIDTH-1]}} ,oper1[30] };//63{oper1[63],oper[62]
 5'b011111:result = {{32{oper1[DATA_WIDTH-1]}} };
default:result = {DATA_WIDTH{1'b0}};
endcase
end
else
begin
result = {DATA_WIDTH{1'b0}};
end
end
`endif

	assign rslt = result ;
endmodule
/////////////////////////////////////////////////////////////////////


////////////////////////////////// 
//  arithmetic right shift word	//
//////////////////////////////////
`ifdef ZILLA_64_BIT
module sraw #(parameter DATA_WIDTH = 0)
(
input 		[DATA_WIDTH-1:0] 		oper1	,
input 		[DATA_WIDTH-1:0] 		oper2	,
output 		[DATA_WIDTH-1:0] 		rslt	,
output 				zero,
input				en


);

reg [DATA_WIDTH-1:0] result ;
	
always@(*)
begin
if(en)
begin
case(oper2[4:0])
 5'b00000:result = oper1;
 5'b00001:result = {32'd0,{ 2{oper1[31]}} ,oper1[30:1 ] };
 5'b00010:result = {32'd0,{ 3{oper1[31]}} ,oper1[30:2 ] };
 5'b00011:result = {32'd0,{ 4{oper1[31]}} ,oper1[30:3 ] };
 5'b00100:result = {32'd0,{ 5{oper1[31]}} ,oper1[30:4 ] };
 5'b00101:result = {32'd0,{ 6{oper1[31]}} ,oper1[30:5 ] };
 5'b00110:result = {32'd0,{ 7{oper1[31]}} ,oper1[30:6 ] };
 5'b00111:result = {32'd0,{ 8{oper1[31]}} ,oper1[30:7 ] };
 5'b01000:result = {32'd0,{ 9{oper1[31]}} ,oper1[30:8 ] };
 5'b01001:result = {32'd0,{10{oper1[31]}} ,oper1[30:9 ] };
 5'b01010:result = {32'd0,{11{oper1[31]}} ,oper1[30:10] };
 5'b01011:result = {32'd0,{12{oper1[31]}} ,oper1[30:11] };
 5'b01100:result = {32'd0,{13{oper1[31]}} ,oper1[30:12] };
 5'b01101:result = {32'd0,{14{oper1[31]}} ,oper1[30:13] };
 5'b01110:result = {32'd0,{15{oper1[31]}} ,oper1[30:14] };
 5'b01111:result = {32'd0,{16{oper1[31]}} ,oper1[30:15] };
 5'b10000:result = {32'd0,{17{oper1[31]}} ,oper1[30:16] };
 5'b10001:result = {32'd0,{18{oper1[31]}} ,oper1[30:17] };
 5'b10010:result = {32'd0,{19{oper1[31]}} ,oper1[30:18] };
 5'b10011:result = {32'd0,{20{oper1[31]}} ,oper1[30:19] };
 5'b10100:result = {32'd0,{21{oper1[31]}} ,oper1[30:20] };
 5'b10101:result = {32'd0,{22{oper1[31]}} ,oper1[30:21] };
 5'b10110:result = {32'd0,{23{oper1[31]}} ,oper1[30:22] };
 5'b10111:result = {32'd0,{24{oper1[31]}} ,oper1[30:23] };
 5'b11000:result = {32'd0,{25{oper1[31]}} ,oper1[30:24] };
 5'b11001:result = {32'd0,{26{oper1[31]}} ,oper1[30:25] };
 5'b11010:result = {32'd0,{27{oper1[31]}} ,oper1[30:26] };
 5'b11011:result = {32'd0,{28{oper1[31]}} ,oper1[30:27] };
 5'b11100:result = {32'd0,{29{oper1[31]}} ,oper1[30:28] };
 5'b11101:result = {32'd0,{30{oper1[31]}} ,oper1[30:29] };
 5'b11110:result = {32'd0,{31{oper1[31]}} ,oper1[30] };
 5'b11111:result = {32'd0,{32{oper1[31]}}};
 default:result = {DATA_WIDTH{1'b0}};
endcase
end
else
begin
result = {DATA_WIDTH{1'b0}};
end
end

	assign rslt = result ;
endmodule
`endif

//////////////////////////////////////////////////////////////////////

////////////////////////////// 
//   logical OR	    	    //
//////////////////////////////
module org #(parameter DATA_WIDTH = 0)
(
input [DATA_WIDTH-1:0] 		oper1	,
input [DATA_WIDTH-1:0] 		oper2	,
output [DATA_WIDTH-1:0] 	rslt	,
output 			            zero    ,
input			            en      


);
assign rslt = en ? (oper1 | oper2) : {DATA_WIDTH{1'b0}} ;
assign zero = (rslt == {DATA_WIDTH{1'b0}}) ? 1'b1 : 1'b0;


endmodule

////////////////////////////// 
//   logical 	AND	    //
//////////////////////////////
module andg #(parameter DATA_WIDTH = 0)
(
input [DATA_WIDTH-1:0] 		oper1	,
input [DATA_WIDTH-1:0] 		oper2	,
output [DATA_WIDTH-1:0] 	rslt	,
output 			            zero    ,
input			            en      

);

assign rslt = en ? (oper1 & oper2) : {DATA_WIDTH{1'b0}} ;
assign zero = (rslt == {DATA_WIDTH{1'b0}}) ? 1'b1 : 1'b0;
endmodule

////////////////////////////// 
//   multiplication	    //
//////////////////////////////
module mult #(parameter DATA_WIDTH = 0)

(
input z_clk,
input z_rst,
input [DATA_WIDTH-1:0]		multiplicand	,
input [DATA_WIDTH-1:0] 		multiplier	,
input 			oper1_sign	,
input 			oper2_sign	,
output reg [(DATA_WIDTH*2)-1:0] 	product		,
output                              product_valid,
output			zero	,
input			en,
output reg [DATA_WIDTH-1:0] op1,
output reg [DATA_WIDTH-1:0] op2 


);

//reg [DATA_WIDTH-1:0] op1;
//reg [DATA_WIDTH-1:0] op2;

wire [(DATA_WIDTH*2)-1:0] prod_r;


always@(*)
begin
	if(en)
	begin
	if(oper1_sign)
	begin
		if(multiplicand[DATA_WIDTH-1])
		begin
			op1 = ((~multiplicand) + {{DATA_WIDTH-1{1'b0}},1'b1});
		end
		else
		begin
			op1 = multiplicand;
		end
	end
	else
	begin
		op1 = multiplicand;
	end
end
else
begin
	op1 = {DATA_WIDTH{1'b0}};
end
end

always@(*)
begin
	if(en)
	begin
	if(oper2_sign)
	begin
		if(multiplier[DATA_WIDTH-1])
		begin
			op2 = ((~multiplier) + {{DATA_WIDTH-1{1'b0}},1'b1});
		end
		else
		begin
			op2 = multiplier;
		end
	end
	else
	begin
		op2 = multiplier;
	end
end
else
begin
	op2 = {DATA_WIDTH{1'b0}};
end
end

//assign prod_r = en ? (op1 * op2) : {(DATA_WIDTH*2)-1{1'b0}};

z_multiplier#(.DATA_WIDTH(DATA_WIDTH))
z_multiplier_inst
(
 .z_clk  (z_clk) ,
 .z_rst  (z_rst) ,
 .oper1  (op1) ,
 .oper2  (op2) ,
 .product(prod_r)
);

wire op1_s;
wire op2_s;

assign op1_s = oper1_sign & multiplicand[DATA_WIDTH-1];
assign op2_s = oper2_sign & multiplier[DATA_WIDTH-1];

reg oper1_sign_r;
reg oper2_sign_r;
reg en_r;
reg op1_s_r;
reg op2_s_r;

always@(posedge z_clk or negedge z_rst)
begin
    if(!z_rst)
    begin
        oper1_sign_r    <= 1'b0 ;
        oper2_sign_r    <= 1'b0 ;
        en_r            <= 1'b0 ;
        op1_s_r         <= 1'b0;
        op2_s_r         <= 1'b0;

    end
    else
    begin
        oper1_sign_r    <= oper1_sign ;
        oper2_sign_r    <= oper2_sign ;
        en_r            <= en         ;
        op1_s_r         <= op1_s;
        op2_s_r         <= op2_s;

    end
end

assign product_valid = en_r;
always@(*)
begin
	if(en_r)
	begin
	if(oper1_sign_r | oper2_sign_r)
	begin
		if(op1_s_r ^ op2_s_r)
			begin
				product = (~prod_r) + {{(DATA_WIDTH*2)-1{1'b0}},1'b1};
			end
		else
			begin
				product =  prod_r;
			end
		end
	else
	begin
		product = prod_r;
	end
	end
	else
	begin
		product = {DATA_WIDTH{1'b0}} ;
	end

end


//assign product = product_r ;//need change
assign zero = (product == {DATA_WIDTH*2{1'b0}}) ? 1'b1 : 1'b0;

endmodule

////////////////////////////// 
//      division	    //
//////////////////////////////

module div #(parameter DATA_WIDTH = 0)
(
input                       clk_i,
input                       rst_i,
input [DATA_WIDTH-1:0]		devisor		,//rs2
input [DATA_WIDTH-1:0]		devidend	,//rs1
input 			            oper1_sign	,
input 			            oper2_sign	,
output  [DATA_WIDTH-1:0] 	quotient	,
output 			zero    ,
input			en      ,
input  [31:0]   div_opcode_i,
output          div_valid_o,
output          div_busy_o
);
//reg [DATA_WIDTH-1:0] op1;
//reg [DATA_WIDTH-1:0] op2;
wire [DATA_WIDTH:0] quotient_r;

/*
always@(*)
begin
	if(en)
	begin
	if(oper1_sign)
	begin
		if(devidend[DATA_WIDTH-1])
		begin
			op1 = ((~devidend) + ({{DATA_WIDTH-1{1'b0}},1'b1}));
		end
		else
		begin
			op1 = devidend;
		end
	end
	else
	begin
		op1 = devidend;
	end
end
else
begin
	op1 = {DATA_WIDTH{1'b0}};
end

end

always@(*)
begin
	if(en)
	begin
	if(oper2_sign)
	begin
		if(devisor[DATA_WIDTH-1])
		begin
			op2 = ((~devisor) + ({{DATA_WIDTH-1{1'b0}},1'b1}));
		end
		else
		begin
			op2 = devisor;
		end
	end
	else
	begin
		op2 = devisor;
	end
end
else
begin
	op2 = {DATA_WIDTH{1'b0}};
end

end*/

	//assign quotient_r = ((devisor != {DATA_WIDTH{1'b0}}) && en) ? (op1 / op2) : ({DATA_WIDTH{1'b1}});
    //
zilla_divider 
#(
.DATA_WIDTH(DATA_WIDTH)
//.INSTRUCTION_WIDTH(INSTRUCTION_WIDTH)
) 
zilla_divider_inst(
.clk_i           (clk_i),
.rst_i           (rst_i),
.en              (en),
.dividend        (devidend),
.divisor         (devisor),
.opcode_i        (div_opcode_i),
.quotient        (quotient_r),
.quotient_valid  (div_valid_o),
.div_busy_o      (div_busy_o)

);
/*
reg [DATA_WIDTH-1:0] quotient_r1;

always@(*)
begin
	if(en)
	begin

if(oper1_sign | oper2_sign)
begin
	if(devidend[DATA_WIDTH-1] ^ devisor[DATA_WIDTH-1])
	begin
		quotient_r1 = (~quotient_r) + ({{DATA_WIDTH-1{1'b0}},1'b1});
	end
	else
	begin
		quotient_r1 =  quotient_r;
	end
end
else
begin
		quotient_r1 = quotient_r;
end
end
else
begin
	quotient_r1 = {DATA_WIDTH{1'b0}};
end
end*/

assign quotient = quotient_r;
assign zero = (quotient_r == {DATA_WIDTH{1'b0}} ) ? 1'b1 : 1'b0;

endmodule


////////////////////////////// 
//   remainder		    //
//////////////////////////////
module rem #(parameter DATA_WIDTH = 0)

(
input clk_i,
input rst_i,
input [31:0] opcode_i,
input [DATA_WIDTH-1:0]		devisor		,
input [DATA_WIDTH-1:0]		devidend	,
input oper1_sign,
input oper2_sign,
output  [DATA_WIDTH-1:0] 	remainder	,
output reminder_valid,
output rem_busy_o,
output 			zero    ,
input			en
);
reg [DATA_WIDTH-1:0] op1;
reg [DATA_WIDTH-1:0] op2;

wire [DATA_WIDTH:0] reminder_r;

//wire [DATA_WIDTH-1:0] a;
//wire [DATA_WIDTH-1:0] b;
//assign reminder_valid = 1'b0;
//assign rem_busy_o = 1'b0;

zilla_reminder 
#(
.DATA_WIDTH(DATA_WIDTH)
//.INSTRUCTION_WIDTH(INSTRUCTION_WIDTH)
) 
zilla_reminder_inst(
.clk_i           (clk_i     ),
.rst_i           (rst_i     ),
.en              (en        ),
.dividend        (devidend  ),
.divisor         (devisor   ),
.opcode_i        (opcode_i  ),
.reminder        (reminder_r),
.reminder_valid  (reminder_valid),
.rem_busy_o      (rem_busy_o)


);

assign remainder = reminder_r;
/*always@(*)
begin
	if(en)
	begin
	if(oper1_sign)
	begin
		if(devidend[DATA_WIDTH-1])
		begin
			op1 = ((~devidend) + ({{DATA_WIDTH-1{1'b0}},1'b1}));
		end
		else
		begin
			op1 = devidend;
		end
	end
	else
	begin
		op1 = devidend;
	end
end
else
begin
	op1 = {DATA_WIDTH{1'b0}};
end

end*/

/*always@(*)
begin
	if(en)
	begin
	if(oper2_sign)
	begin
		if(devisor[DATA_WIDTH-1])
		begin
			op2 = ((~devisor) + ({{DATA_WIDTH-1{1'b0}},1'b1}));
		end
		else
		begin
			op2 = devisor;
		end
	end
	else
	begin
		op2 = devisor;
	end
end
else
begin
	op2 = {DATA_WIDTH{1'b0}};
end
end*/

//	assign reminder_r = (devisor != {DATA_WIDTH{1'b0}} && en ) ? (op1 % op2) : devidend ;

/*always@(*)
begin
	if(en)
	begin
if((oper1_sign | oper2_sign) && (devisor != {DATA_WIDTH{1'b0}}))
begin
	if(devidend[DATA_WIDTH-1])
	begin
		remainder = (~reminder_r) + ({{DATA_WIDTH-1{1'b0}},1'b1}) ;
	end
	else
	begin
		remainder =  reminder_r;
	end
end
else
begin
		remainder = reminder_r;
end
end
else
	remainder = {DATA_WIDTH{1'b0}};
end*/

endmodule
//////////////////////////////////////////////////////////////////////////////////
module lui #(parameter DATA_WIDTH = 0)

(
input  [DATA_WIDTH-1:0]     oper1   ,
input  [DATA_WIDTH-1:0]     oper2   ,
output [DATA_WIDTH-1:0]     lui_out ,
input			            en
);

assign lui_out = en ? oper2 : {DATA_WIDTH{1'b0}};
endmodule

module jal #(parameter DATA_WIDTH = 0)
(
input [DATA_WIDTH-1:0]      oper1   ,
input [DATA_WIDTH-1:0]      oper2   ,
output [DATA_WIDTH-1:0]     jal_out ,
input			            en      

);

assign jal_out = en ? oper1 : {DATA_WIDTH{1'b0}} ;//pc


endmodule

module jalr #(parameter DATA_WIDTH = 0)

(
input  [DATA_WIDTH-1:0] oper1       ,
input  [DATA_WIDTH-1:0] oper2       ,
output [DATA_WIDTH-1:0] jalr_out    ,
input			        en

);

assign jalr_out = en ? oper1 : {DATA_WIDTH{1'b0}} ;//pc


endmodule


module auipc #(parameter DATA_WIDTH = 0)
(
input [DATA_WIDTH-1:0]  oper1       ,
input [DATA_WIDTH-1:0]  oper2       ,
output [DATA_WIDTH-1:0] auipc_out   ,
input			        en          

);

assign auipc_out = (en)? (oper1 + oper2) : {DATA_WIDTH{1'b0}};

endmodule

module slt #(parameter DATA_WIDTH = 0)

(
input [DATA_WIDTH-1:0] 	        in1	    ,
input [DATA_WIDTH-1:0]	        in2	    ,
input [11:0]	                ctrl	,
output reg [DATA_WIDTH-1:0]     op	    ,
input			                en      

);

always@(*)
begin
	if(en)
	begin
	case(ctrl)
		12'b00_010_0010011://slti signed
		begin
			if(in1[DATA_WIDTH-1] && in2[DATA_WIDTH-1])
			begin
				op = (in1[DATA_WIDTH-2:0] < in2[DATA_WIDTH-2:0]) ? ({{DATA_WIDTH-1{1'b0}},1'b1}) :{DATA_WIDTH{1'b0}} ;
			end
			else
			begin
				if((in1[DATA_WIDTH-1] == 1) && (in2[DATA_WIDTH-1] == 0))
				begin
					op = ({{DATA_WIDTH-1{1'b0}},1'b1}) ;
				end
				else if ((in1[DATA_WIDTH-1] == 0) && (in2[DATA_WIDTH-1] == 1))
				begin
					op = {DATA_WIDTH{1'b0}} ;
				end
				else if ((in1[DATA_WIDTH-1] == 0) && (in2[DATA_WIDTH-1] == 0))
				begin
					op = (in1[DATA_WIDTH-2:0] < in2[DATA_WIDTH-2:0]) ? ({{DATA_WIDTH-1{1'b0}},1'b1}) : {DATA_WIDTH{1'b0}} ;
				end
			end
		end
		12'b00_011_0010011://sltiu unsigned
		begin
			op = (in1 < in2) ? ({{DATA_WIDTH-1{1'b0}},1'b1}) : {DATA_WIDTH{1'b0}};
		end
		12'b00_011_0110011://sltu unsigned
		begin
			op = (in1 < in2) ? ({{DATA_WIDTH-1{1'b0}},1'b1}) : {DATA_WIDTH{1'b0}};
		end
		12'b00_010_0110011://slt signed
		begin
			if(in1[DATA_WIDTH-1] && in2[DATA_WIDTH-1])
			begin
				op = (in1[DATA_WIDTH-2:0] < in2[DATA_WIDTH-2:0]) ? ({{DATA_WIDTH-1{1'b0}},1'b1}) :{DATA_WIDTH{1'b0}} ;
			end
			else
			begin
				if((in1[DATA_WIDTH-1] == 1) && (in2[DATA_WIDTH-1] == 0))
				begin
					op = ({{DATA_WIDTH-1{1'b0}},1'b1}) ;
				end
				else if ((in1[DATA_WIDTH-1] == 0) && (in2[DATA_WIDTH-1] == 1))
				begin
					op = {DATA_WIDTH{1'b0}} ;
				end
				else if ((in1[DATA_WIDTH-1] == 0) && (in2[DATA_WIDTH-1] == 0))
				begin
					op = (in1[DATA_WIDTH-2:0] < in2[DATA_WIDTH-2:0]) ? 64'd1 : {DATA_WIDTH{1'b0}} ;
				end
			end

		end
		default:
		begin
			op = {DATA_WIDTH{1'b0}};
		end


	endcase
end
else
begin
	op = {DATA_WIDTH{1'b0}};
end
end
endmodule

module rotate_left #(parameter DATA_WIDTH = 0)

(
input [DATA_WIDTH-1:0]      oper1   ,
input [DATA_WIDTH-1:0]      oper2   ,
input                       en      ,
output reg [DATA_WIDTH-1:0] result
);


`ifdef ZILLA_64_BIT
always@(*)
begin
if(en)
begin
case(oper2[5:0])
 6'b000000:result = oper1;
 6'b000001:result = {oper1[62:0],oper1[DATA_WIDTH-1]};
 6'b000010:result = {oper1[61:0],oper1[DATA_WIDTH-1:62]};//DATA_WIDTH-2
 6'b000011:result = {oper1[60:0],oper1[DATA_WIDTH-1:61]};//DATA_WIDTH-3
 6'b000100:result = {oper1[59:0],oper1[DATA_WIDTH-1:60]};//DATA_WIDTH-4 
 6'b000101:result = {oper1[58:0],oper1[DATA_WIDTH-1:59]};//DATA_WIDTH-5
 6'b000110:result = {oper1[57:0],oper1[DATA_WIDTH-1:58]};//DATA_WIDTH-6
 6'b000111:result = {oper1[56:0],oper1[DATA_WIDTH-1:57]};//DATA_WIDTH-7
 6'b001000:result = {oper1[55:0],oper1[DATA_WIDTH-1:56]};//DATA_WIDTH-8
 6'b001001:result = {oper1[54:0],oper1[DATA_WIDTH-1:55]};//DATA_WIDTH-9
 6'b001010:result = {oper1[53:0],oper1[DATA_WIDTH-1:54]};//DATA_WIDTH-10
 6'b001011:result = {oper1[52:0],oper1[DATA_WIDTH-1:53]};//DATA_WIDTH-11
 6'b001100:result = {oper1[51:0],oper1[DATA_WIDTH-1:52]};//DATA_WIDTH-12
 6'b001101:result = {oper1[50:0],oper1[DATA_WIDTH-1:51]};//DATA_WIDTH-13
 6'b001110:result = {oper1[49:0],oper1[DATA_WIDTH-1:50]};//DATA_WIDTH-14
 6'b001111:result = {oper1[48:0],oper1[DATA_WIDTH-1:49]};//DATA_WIDTH-15
 6'b010000:result = {oper1[47:0],oper1[DATA_WIDTH-1:48]};//DATA_WIDTH-16
 6'b010001:result = {oper1[46:0],oper1[DATA_WIDTH-1:47]};//DATA_WIDTH-17
 6'b010010:result = {oper1[45:0],oper1[DATA_WIDTH-1:46]};//DATA_WIDTH-18
 6'b010011:result = {oper1[44:0],oper1[DATA_WIDTH-1:45]};//DATA_WIDTH-19
 6'b010100:result = {oper1[43:0],oper1[DATA_WIDTH-1:44]};//DATA_WIDTH-20
 6'b010101:result = {oper1[42:0],oper1[DATA_WIDTH-1:43]};//DATA_WIDTH-21
 6'b010110:result = {oper1[41:0],oper1[DATA_WIDTH-1:42]};//DATA_WIDTH-22
 6'b010111:result = {oper1[40:0],oper1[DATA_WIDTH-1:41]};//DATA_WIDTH-23
 6'b011000:result = {oper1[39:0],oper1[DATA_WIDTH-1:40]};//DATA_WIDTH-24
 6'b011001:result = {oper1[38:0],oper1[DATA_WIDTH-1:39]};//DATA_WIDTH-25
 6'b011010:result = {oper1[37:0],oper1[DATA_WIDTH-1:38]};//DATA_WIDTH-26
 6'b011011:result = {oper1[36:0],oper1[DATA_WIDTH-1:37]};//DATA_WIDTH-27
 6'b011100:result = {oper1[35:0],oper1[DATA_WIDTH-1:36]};//DATA_WIDTH-28
 6'b011101:result = {oper1[34:0],oper1[DATA_WIDTH-1:35]};//DATA_WIDTH-29
 6'b011110:result = {oper1[33:0],oper1[DATA_WIDTH-1:34]};//DATA_WIDTH-30
 6'b011111:result = {oper1[32:0],oper1[DATA_WIDTH-1:33]};//DATA_WIDTH-31
 6'b100000:result = {oper1[31:0],oper1[DATA_WIDTH-1:32]};//DATA_WIDTH-32
 6'b100001:result = {oper1[30:0],oper1[DATA_WIDTH-1:31]};//DATA_WIDTH-33
 6'b100010:result = {oper1[29:0],oper1[DATA_WIDTH-1:30]};//DATA_WIDTH-34
 6'b100011:result = {oper1[28:0],oper1[DATA_WIDTH-1:29]};//DATA_WIDTH-35
 6'b100100:result = {oper1[27:0],oper1[DATA_WIDTH-1:28]};//DATA_WIDTH-36
 6'b100101:result = {oper1[26:0],oper1[DATA_WIDTH-1:27]};//DATA_WIDTH-37
 6'b100110:result = {oper1[25:0],oper1[DATA_WIDTH-1:26]};//DATA_WIDTH-38
 6'b100111:result = {oper1[24:0],oper1[DATA_WIDTH-1:25]};//DATA_WIDTH-39
 6'b101000:result = {oper1[23:0],oper1[DATA_WIDTH-1:24]};//DATA_WIDTH-40
 6'b101001:result = {oper1[22:0],oper1[DATA_WIDTH-1:23]};//DATA_WIDTH-41
 6'b101010:result = {oper1[21:0],oper1[DATA_WIDTH-1:22]};//DATA_WIDTH-42
 6'b101011:result = {oper1[20:0],oper1[DATA_WIDTH-1:21]};//DATA_WIDTH-43
 6'b101100:result = {oper1[19:0],oper1[DATA_WIDTH-1:20]};//DATA_WIDTH-44
 6'b101101:result = {oper1[18:0],oper1[DATA_WIDTH-1:19]};//DATA_WIDTH-45
 6'b101110:result = {oper1[17:0],oper1[DATA_WIDTH-1:18]};//DATA_WIDTH-46
 6'b101111:result = {oper1[16:0],oper1[DATA_WIDTH-1:17]};//DATA_WIDTH-47
 6'b110000:result = {oper1[15:0],oper1[DATA_WIDTH-1:16]};//DATA_WIDTH-48
 6'b110001:result = {oper1[14:0],oper1[DATA_WIDTH-1:15]};//DATA_WIDTH-49
 6'b110010:result = {oper1[13:0],oper1[DATA_WIDTH-1:14]};//DATA_WIDTH-50
 6'b110011:result = {oper1[12:0],oper1[DATA_WIDTH-1:13]};//DATA_WIDTH-51
 6'b110100:result = {oper1[11:0],oper1[DATA_WIDTH-1:12]};//DATA_WIDTH-52
 6'b110101:result = {oper1[10:0],oper1[DATA_WIDTH-1:11]};//DATA_WIDTH-53
 6'b110110:result = {oper1[9 :0],oper1[DATA_WIDTH-1:10]};//DATA_WIDTH-54
 6'b110111:result = {oper1[8 :0],oper1[DATA_WIDTH-1:9]};//DATA_WIDTH-55 
 6'b111000:result = {oper1[7 :0],oper1[DATA_WIDTH-1:8]};//DATA_WIDTH-56 
 6'b111001:result = {oper1[6 :0],oper1[DATA_WIDTH-1:7]};//DATA_WIDTH-57
 6'b111010:result = {oper1[5 :0],oper1[DATA_WIDTH-1:6]};//DATA_WIDTH-58
 6'b111011:result = {oper1[4 :0],oper1[DATA_WIDTH-1:5]};//DATA_WIDTH-59
 6'b111100:result = {oper1[3 :0],oper1[DATA_WIDTH-1:4]};//DATA_WIDTH-60
 6'b111101:result = {oper1[2 :0],oper1[DATA_WIDTH-1:3]};//DATA_WIDTH-61
 6'b111110:result = {oper1[1 :0],oper1[DATA_WIDTH-1:2]};//DATA_WIDTH-62
 6'b111111:result = {oper1[0 :0],oper1[DATA_WIDTH-1:1]};//DATA_WIDTH-63
default:result = oper1;
endcase
end
else
begin
result = {DATA_WIDTH{1'b0}};
end
end

`elsif ZILLA_32_BIT
always@(*)
begin
if(en)
begin
case(oper2[4:0])

 5'b00000:result = {oper1[31:0]};//DATA_WIDTH-32
 5'b00001:result = {oper1[30:0],oper1[DATA_WIDTH-1]};//DATA_WIDTH-33
 5'b00010:result = {oper1[29:0],oper1[DATA_WIDTH-1:30]};//DATA_WIDTH-34
 5'b00011:result = {oper1[28:0],oper1[DATA_WIDTH-1:29]};//DATA_WIDTH-35
 5'b00100:result = {oper1[27:0],oper1[DATA_WIDTH-1:28]};//DATA_WIDTH-36
 5'b00101:result = {oper1[26:0],oper1[DATA_WIDTH-1:27]};//DATA_WIDTH-37
 5'b00110:result = {oper1[25:0],oper1[DATA_WIDTH-1:26]};//DATA_WIDTH-38
 5'b00111:result = {oper1[24:0],oper1[DATA_WIDTH-1:25]};//DATA_WIDTH-39
 5'b01000:result = {oper1[23:0],oper1[DATA_WIDTH-1:24]};//DATA_WIDTH-40
 5'b01001:result = {oper1[22:0],oper1[DATA_WIDTH-1:23]};//DATA_WIDTH-41
 5'b01010:result = {oper1[21:0],oper1[DATA_WIDTH-1:22]};//DATA_WIDTH-42
 5'b01011:result = {oper1[20:0],oper1[DATA_WIDTH-1:21]};//DATA_WIDTH-43
 5'b01100:result = {oper1[19:0],oper1[DATA_WIDTH-1:20]};//DATA_WIDTH-44
 5'b01101:result = {oper1[18:0],oper1[DATA_WIDTH-1:19]};//DATA_WIDTH-45
 5'b01110:result = {oper1[17:0],oper1[DATA_WIDTH-1:18]};//DATA_WIDTH-46
 5'b01111:result = {oper1[16:0],oper1[DATA_WIDTH-1:17]};//DATA_WIDTH-47
 5'b10000:result = {oper1[15:0],oper1[DATA_WIDTH-1:16]};//DATA_WIDTH-48
 5'b10001:result = {oper1[14:0],oper1[DATA_WIDTH-1:15]};//DATA_WIDTH-49
 5'b10010:result = {oper1[13:0],oper1[DATA_WIDTH-1:14]};//DATA_WIDTH-50
 5'b10011:result = {oper1[12:0],oper1[DATA_WIDTH-1:13]};//DATA_WIDTH-51
 5'b10100:result = {oper1[11:0],oper1[DATA_WIDTH-1:12]};//DATA_WIDTH-52
 5'b10101:result = {oper1[10:0],oper1[DATA_WIDTH-1:11]};//DATA_WIDTH-53
 5'b10110:result = {oper1[9 :0],oper1[DATA_WIDTH-1:10]};//DATA_WIDTH-54
 5'b10111:result = {oper1[8 :0],oper1[DATA_WIDTH-1:9]};//DATA_WIDTH-55 
 5'b11000:result = {oper1[7 :0],oper1[DATA_WIDTH-1:8]};//DATA_WIDTH-56 
 5'b11001:result = {oper1[6 :0],oper1[DATA_WIDTH-1:7]};//DATA_WIDTH-57
 5'b11010:result = {oper1[5 :0],oper1[DATA_WIDTH-1:6]};//DATA_WIDTH-58
 5'b11011:result = {oper1[4 :0],oper1[DATA_WIDTH-1:5]};//DATA_WIDTH-59
 5'b11100:result = {oper1[3 :0],oper1[DATA_WIDTH-1:4]};//DATA_WIDTH-60
 5'b11101:result = {oper1[2 :0],oper1[DATA_WIDTH-1:3]};//DATA_WIDTH-61
 5'b11110:result = {oper1[1 :0],oper1[DATA_WIDTH-1:2]};//DATA_WIDTH-62
 5'b11111:result = {oper1[0 :0],oper1[DATA_WIDTH-1:1]};//DATA_WIDTH-63
default:result = oper1;
endcase
end
else
begin
result = {DATA_WIDTH{1'b0}};
end
end

`endif

endmodule

/////////////////////////////////////////////////////////////////////


/////////////////rotate right///////////////////////////////////////
module rotate_right #(parameter DATA_WIDTH = 0)

(
input [DATA_WIDTH-1:0]      oper1   ,
input [DATA_WIDTH-1:0]      oper2   ,
input                       en      ,
output reg [DATA_WIDTH-1:0] result  
);


`ifdef ZILLA_64_BIT
always@(*)
begin
if(en)
begin
case(oper2[5:0])
6'b000000:result = oper1;
6'b000001:result = {oper1[0   ],oper1[DATA_WIDTH-1:1 ]};
6'b000010:result = {oper1[1 :0],oper1[DATA_WIDTH-1:2 ]};
6'b000011:result = {oper1[2 :0],oper1[DATA_WIDTH-1:3 ]};
6'b000100:result = {oper1[3 :0],oper1[DATA_WIDTH-1:4 ]};
6'b000101:result = {oper1[4 :0],oper1[DATA_WIDTH-1:5 ]};
6'b000110:result = {oper1[5 :0],oper1[DATA_WIDTH-1:6 ]};
6'b000111:result = {oper1[6 :0],oper1[DATA_WIDTH-1:7 ]};
6'b001000:result = {oper1[7 :0],oper1[DATA_WIDTH-1:8 ]};
6'b001001:result = {oper1[8 :0],oper1[DATA_WIDTH-1:9 ]};
6'b001010:result = {oper1[9 :0],oper1[DATA_WIDTH-1:10]};
6'b001011:result = {oper1[10:0],oper1[DATA_WIDTH-1:11]};
6'b001100:result = {oper1[11:0],oper1[DATA_WIDTH-1:12]};
6'b001101:result = {oper1[12:0],oper1[DATA_WIDTH-1:13]};
6'b001110:result = {oper1[13:0],oper1[DATA_WIDTH-1:14]};
6'b001111:result = {oper1[14:0],oper1[DATA_WIDTH-1:15]};
6'b010000:result = {oper1[15:0],oper1[DATA_WIDTH-1:16]};
6'b010001:result = {oper1[16:0],oper1[DATA_WIDTH-1:17]};
6'b010010:result = {oper1[17:0],oper1[DATA_WIDTH-1:18]};
6'b010011:result = {oper1[18:0],oper1[DATA_WIDTH-1:19]};
6'b010100:result = {oper1[19:0],oper1[DATA_WIDTH-1:20]};
6'b010101:result = {oper1[20:0],oper1[DATA_WIDTH-1:21]};
6'b010110:result = {oper1[21:0],oper1[DATA_WIDTH-1:22]};
6'b010111:result = {oper1[22:0],oper1[DATA_WIDTH-1:23]};
6'b011000:result = {oper1[23:0],oper1[DATA_WIDTH-1:24]};
6'b011001:result = {oper1[24:0],oper1[DATA_WIDTH-1:25]};
6'b011010:result = {oper1[25:0],oper1[DATA_WIDTH-1:26]};
6'b011011:result = {oper1[26:0],oper1[DATA_WIDTH-1:27]};
6'b011100:result = {oper1[27:0],oper1[DATA_WIDTH-1:28]};
6'b011101:result = {oper1[28:0],oper1[DATA_WIDTH-1:29]};
6'b011110:result = {oper1[29:0],oper1[DATA_WIDTH-1:30]};
6'b011111:result = {oper1[30:0],oper1[DATA_WIDTH-1:31]};
6'b100000:result = {oper1[31:0],oper1[DATA_WIDTH-1:32]};
6'b100001:result = {oper1[32:0],oper1[DATA_WIDTH-1:33]};
6'b100010:result = {oper1[33:0],oper1[DATA_WIDTH-1:34]};
6'b100011:result = {oper1[34:0],oper1[DATA_WIDTH-1:35]};
6'b100100:result = {oper1[35:0],oper1[DATA_WIDTH-1:36]};
6'b100101:result = {oper1[36:0],oper1[DATA_WIDTH-1:37]};
6'b100110:result = {oper1[37:0],oper1[DATA_WIDTH-1:38]};
6'b100111:result = {oper1[38:0],oper1[DATA_WIDTH-1:39]};
6'b101000:result = {oper1[39:0],oper1[DATA_WIDTH-1:40]};
6'b101001:result = {oper1[40:0],oper1[DATA_WIDTH-1:41]};
6'b101010:result = {oper1[41:0],oper1[DATA_WIDTH-1:42]};
6'b101011:result = {oper1[42:0],oper1[DATA_WIDTH-1:43]};
6'b101100:result = {oper1[43:0],oper1[DATA_WIDTH-1:44]};
6'b101101:result = {oper1[44:0],oper1[DATA_WIDTH-1:45]};
6'b101110:result = {oper1[45:0],oper1[DATA_WIDTH-1:46]};
6'b101111:result = {oper1[46:0],oper1[DATA_WIDTH-1:47]};
6'b110000:result = {oper1[47:0],oper1[DATA_WIDTH-1:48]};
6'b110001:result = {oper1[48:0],oper1[DATA_WIDTH-1:49]};
6'b110010:result = {oper1[49:0],oper1[DATA_WIDTH-1:50]};
6'b110011:result = {oper1[50:0],oper1[DATA_WIDTH-1:51]};
6'b110100:result = {oper1[51:0],oper1[DATA_WIDTH-1:52]};
6'b110101:result = {oper1[52:0],oper1[DATA_WIDTH-1:53]};
6'b110110:result = {oper1[53:0],oper1[DATA_WIDTH-1:54]};
6'b110111:result = {oper1[54:0],oper1[DATA_WIDTH-1:55]};
6'b111000:result = {oper1[55:0],oper1[DATA_WIDTH-1:56]};
6'b111001:result = {oper1[56:0],oper1[DATA_WIDTH-1:57]};
6'b111010:result = {oper1[57:0],oper1[DATA_WIDTH-1:58]};
6'b111011:result = {oper1[58:0],oper1[DATA_WIDTH-1:59]};
6'b111100:result = {oper1[59:0],oper1[DATA_WIDTH-1:60]};
6'b111101:result = {oper1[60:0],oper1[DATA_WIDTH-1:61]};
6'b111110:result = {oper1[61:0],oper1[DATA_WIDTH-1:62]};
6'b111111:result = {oper1[62:0],oper1[DATA_WIDTH-1]};
default:result = oper1;
endcase
end
else
begin
result = {DATA_WIDTH{1'b0}};
end
end

`elsif ZILLA_32_BIT
always@(*)
begin
if(en)
begin
case(oper2[4:0])
5'b00000:result = oper1;
5'b00001:result = {oper1[0   ],oper1[DATA_WIDTH-1:1 ]};//31:1
5'b00010:result = {oper1[1 :0],oper1[DATA_WIDTH-1:2 ]};
5'b00011:result = {oper1[2 :0],oper1[DATA_WIDTH-1:3 ]};
5'b00100:result = {oper1[3 :0],oper1[DATA_WIDTH-1:4 ]};
5'b00101:result = {oper1[4 :0],oper1[DATA_WIDTH-1:5 ]};
5'b00110:result = {oper1[5 :0],oper1[DATA_WIDTH-1:6 ]};
5'b00111:result = {oper1[6 :0],oper1[DATA_WIDTH-1:7 ]};
5'b01000:result = {oper1[7 :0],oper1[DATA_WIDTH-1:8 ]};
5'b01001:result = {oper1[8 :0],oper1[DATA_WIDTH-1:9 ]};
5'b01010:result = {oper1[9 :0],oper1[DATA_WIDTH-1:10]};
5'b01011:result = {oper1[10:0],oper1[DATA_WIDTH-1:11]};
5'b01100:result = {oper1[11:0],oper1[DATA_WIDTH-1:12]};
5'b01101:result = {oper1[12:0],oper1[DATA_WIDTH-1:13]};
5'b01110:result = {oper1[13:0],oper1[DATA_WIDTH-1:14]};
5'b01111:result = {oper1[14:0],oper1[DATA_WIDTH-1:15]};
5'b10000:result = {oper1[15:0],oper1[DATA_WIDTH-1:16]};
5'b10001:result = {oper1[16:0],oper1[DATA_WIDTH-1:17]};
5'b10010:result = {oper1[17:0],oper1[DATA_WIDTH-1:18]};
5'b10011:result = {oper1[18:0],oper1[DATA_WIDTH-1:19]};
5'b10100:result = {oper1[19:0],oper1[DATA_WIDTH-1:20]};
5'b10101:result = {oper1[20:0],oper1[DATA_WIDTH-1:21]};
5'b10110:result = {oper1[21:0],oper1[DATA_WIDTH-1:22]};
5'b10111:result = {oper1[22:0],oper1[DATA_WIDTH-1:23]};
5'b11000:result = {oper1[23:0],oper1[DATA_WIDTH-1:24]};
5'b11001:result = {oper1[24:0],oper1[DATA_WIDTH-1:25]};
5'b11010:result = {oper1[25:0],oper1[DATA_WIDTH-1:26]};
5'b11011:result = {oper1[26:0],oper1[DATA_WIDTH-1:27]};
5'b11100:result = {oper1[27:0],oper1[DATA_WIDTH-1:28]};
5'b11101:result = {oper1[28:0],oper1[DATA_WIDTH-1:29]};
5'b11110:result = {oper1[29:0],oper1[DATA_WIDTH-1:30]};
5'b11111:result = {oper1[30:0],oper1[DATA_WIDTH-1]};//31:31
default:result = oper1;
endcase
end
else
begin
result = {DATA_WIDTH{1'b0}};
end
end

`endif
endmodule

///////////////////////////////////////////////////////////////////


///////////////compare/////////////////////////////////
module cmp_eq #(parameter DATA_WIDTH = 0)

(
input [DATA_WIDTH-1:0]  oper1       ,
input [DATA_WIDTH-1:0]  oper2       ,
output                  result		,
input                   en          
);

assign result = (!en) ? 1'b0 : (oper1 == oper2) ? 1'b1 : 1'b0;


endmodule
////////////////////////////////////////////
//
//
module cmp_gteu #(parameter DATA_WIDTH = 0)

(
input [DATA_WIDTH-1:0]    oper1   ,
input [DATA_WIDTH-1:0]    oper2   ,
output                    result  ,
input 		              en
);
assign result = (!en) ? 1'b0 : (oper1 >= oper2) ? 1'b1 : 1'b0;

endmodule
//////////////////////////////////////////////
//
//
//compare logic for greater than for signed numbers
module cmp_gte #(parameter DATA_WIDTH = 0)

(
input [DATA_WIDTH-1:0]oper1,
input [DATA_WIDTH-1:0]oper2,
output  reg result,
input en
);

always@(*)
begin
	if(en)
	begin
	if(oper1[DATA_WIDTH-1] == oper2[DATA_WIDTH-1])
	begin
		if(oper1[DATA_WIDTH-1] && oper2[DATA_WIDTH-1])
		begin
			if(oper1[DATA_WIDTH-2:0] >= oper2[DATA_WIDTH-2:0])
			begin
				result = 1'b1;
			end
			else
			begin
				result = 1'b0;
			end
		end
		else
		begin
			if(oper1[DATA_WIDTH-2:0] >= oper2[DATA_WIDTH-2:0])
			begin
				result = 1'b1;
			end
			else
			begin
				result = 1'b0;
			end
		end
	end
	else
	begin
		if(oper1[DATA_WIDTH-1])
		begin
			result = 1'b0;
		end
		else
		begin
			result = 1'b1;
		end
	end
end
else
begin
	result = 1'b0;
end
end

endmodule

/////////////////////////////////////////////////

module cmp_gtu #(parameter DATA_WIDTH = 0)

(
input [DATA_WIDTH-1:0]    oper1   ,
input [DATA_WIDTH-1:0]    oper2   ,
output                    result  ,
input 		              en
);
wire   result_r;
assign result_r = (oper1 > oper2) ? 1'b1 : 1'b0;
assign result   = (en) ? result_r : 1'b0;

endmodule

///////////////////////////////////////////////
////
//
//
//compare logic for greater than for signed numbers
module cmp_gt #(parameter DATA_WIDTH = 0)

(
input [DATA_WIDTH-1:0]oper1,
input [DATA_WIDTH-1:0]oper2,
output  reg           result,
input                 en
);

always@(*)
begin
	if(en)
	begin
	if(oper1[DATA_WIDTH-1] == oper2[DATA_WIDTH-1])
	begin
		if(oper1[DATA_WIDTH-1] && oper2[DATA_WIDTH-1])
		begin
			if(oper1[DATA_WIDTH-2:0] > oper2[DATA_WIDTH-2:0])
			begin
				result = 1'b1;
			end
			else
			begin
				result = 1'b0;
			end
		end
		else
		begin
			if(oper1[DATA_WIDTH-2:0] > oper2[DATA_WIDTH-2:0])
			begin
				result = 1'b1;
			end
			else
			begin
				result = 1'b0;
			end
		end
	end
	else
	begin
		if(oper1[DATA_WIDTH-1])
		begin
			result = 1'b0;
		end
		else
		begin
			result = 1'b1;
		end
	end
end
else
begin
	result = 1'b0;
end
end

endmodule
////////////////////////////////////////////////
module cmp_lteu #(parameter DATA_WIDTH = 0)

(
input [DATA_WIDTH-1:0]    oper1   ,
input [DATA_WIDTH-1:0]    oper2   ,
output                    result  ,
input 		              en
);
assign result = (!en) ? 1'b0 : (oper1 <= oper2) ? 1'b1 : 1'b0;

endmodule

/////////////////////////////////////
//
//

//compare less than logic
module cmp_lte #(parameter DATA_WIDTH = 0)

(
input [DATA_WIDTH-1:0] oper1    ,
input [DATA_WIDTH-1:0] oper2    ,
output reg             result   ,
input                  en       
);
always@(*)
begin
	if(en)
	begin
	if(oper1[DATA_WIDTH-1] == oper2[DATA_WIDTH-1])
	begin
		if(oper1[DATA_WIDTH-1] && oper2[DATA_WIDTH-1])
		begin
			if(oper1[DATA_WIDTH-2:0] <= oper2[DATA_WIDTH-2:0])
			begin
				result = 1'b1;
			end
			else
			begin
				result = 1'b0;
			end
		end
		else
		begin
			if(oper1[DATA_WIDTH-2:0] <= oper2[DATA_WIDTH-2:0])
			begin
				result = 1'b1;
			end
			else
			begin
				result = 1'b0;
			end
		end
	end
	else
	begin
		if(oper1[DATA_WIDTH-1])
		begin
			result = 1'b1;
		end
		else
		begin
			result = 1'b0;
		end
	end
end
else
begin
	result = 1'b0;
end
end

endmodule

/////////////////////////////////////////////////////////////
//
//

module cmp_ltu #(parameter DATA_WIDTH = 0)

(
input [DATA_WIDTH-1:0]    oper1   ,
input [DATA_WIDTH-1:0]    oper2   ,
output                    result  ,
input                     en
);
wire result_r;
assign result_r = (oper1 < oper2) ? 1'b1 : 1'b0;
assign result = (en) ? result_r : 1'b0 ;

endmodule

/////////////////////////////////////////////////////////////
//
//

module cmp_ne #(parameter DATA_WIDTH = 0)

(
input [DATA_WIDTH-1:0] oper1    ,
input [DATA_WIDTH-1:0] oper2    ,
output                 result   ,
input                  en
);

assign result = (!en) ? 1'b0 : (oper1 == oper2) ? 1'b0 : 1'b1;
endmodule
////////////////////////////////////////////////////
//
//
//compare less than logic
module cmp_lt #(parameter DATA_WIDTH = 0)

(
input [DATA_WIDTH-1:0] oper1    ,
input [DATA_WIDTH-1:0] oper2    ,
output reg             result   ,
input                  en
);
always@(*)
begin
	if(en)
	begin
	if(oper1[DATA_WIDTH-1] == oper2[DATA_WIDTH-1])
	begin
		if(oper1[DATA_WIDTH-1] && oper2[DATA_WIDTH-1])
		begin
			if(oper1[DATA_WIDTH-2:0] < oper2[DATA_WIDTH-2:0])
			begin
				result = 1'b1;
			end
			else
			begin
				result = 1'b0;
			end
		end
		else
		begin
			if(oper1[DATA_WIDTH-2:0] < oper2[DATA_WIDTH-2:0])
			begin
				result = 1'b1;
			end
			else
			begin
				result = 1'b0;
			end
		end
	end
	else
	begin
		if(oper1[DATA_WIDTH-1])
		begin
			result = 1'b1;
		end
		else
		begin
			result = 1'b0;
		end
	end
	end
	else
	begin
		result = 1'b0;
	end

end

endmodule

module mvi #(parameter DATA_WIDTH = 0)

(
	input [DATA_WIDTH-1:0] 	    oper1	,
	input [DATA_WIDTH-1:0] 	    oper2	,
	input 		                en	    ,
	output [DATA_WIDTH-1:0] 	result 
);

assign result = (en)? oper2 : {DATA_WIDTH{1'b0}};
endmodule



