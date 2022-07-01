`define ZILLA_32_BIT 
`timescale 1ns / 1ps

module instr_decode #(
parameter DATA_WIDTH        = 0 ,
parameter INSTRUCTION_WIDTH = 0 ,
parameter OPCODE            = 0 ,
parameter FUNC3             = 0 ,
parameter FUNC7             = 0 ,
parameter GPR_ADDR_WIDTH    = 0 ,
parameter CSR_ADDR_WIDTH    = 0 

)
(
input 				                    de_clk				        ,
input				                    de_rst				        ,
input                                   wdt_reset_i                 ,
input	   		[INSTRUCTION_WIDTH-1:0]	instruction_r			    ,
input	   		     	                stall_pipeline			    ,
input                                   stall_en                    ,
input 	   		     	                branch_en			        ,
input 				                    decode_instruction_valid_i	,
output	   		[OPCODE-1:0]	        opcode				        ,
output	   		[FUNC3-1:0]	            func3				        ,
output reg 		[11:0]	                alu_ctrl_r			        ,
output reg 		[DATA_WIDTH-1:0]	    imm_val				        ,
output reg 		[DATA_WIDTH-1:0]	    imm_r				        ,
output reg	   	[GPR_ADDR_WIDTH-1:0]	rs1				            ,
output reg	   	[GPR_ADDR_WIDTH-1:0]	rs2				            ,
output reg	   	[GPR_ADDR_WIDTH-1:0]	rd				            ,
output reg 			                    reg_wr_en_r			        ,
output reg 			                    mem_rd_en_r			        ,
output reg 			                    mem_wr_en_r			        ,
output reg			                    mem_to_reg_en_r 		    ,
output reg		[OPCODE-1:0]            opcode_r			        ,
output reg 			                    e_call_valid_o  		    ,//e-call exception
output reg 			                    e_break_valid_o 		    ,//e-break exception
output reg 			                    mret_valid_o			    ,//mret instruction valid
output  			                    invalid_instruction_valid_o	,//invalid instruction exception
output reg 			                    csr_write_en_o			    ,
output reg 			                    csr_read_en_o			    ,
output reg 		[CSR_ADDR_WIDTH-1:0]	                csr_addr_o			        ,
output reg 			                    csr_set_valid_o 		    ,
output reg 			                    csr_clear_valid_o		    ,
output reg 			                    csr_imm_valid_o			    ,
output reg 			                    ret_func_valid		        ,
input                                   debug_mode_valid_i          ,
output reg                              ebreak_valid_o              ,
input                                   debug_mode_reset_i          ,
input                                   debug_ndm_reset_i           ,
output                              mult_valid_o                ,
output reg                              div_valid_o                 ,
output reg                              rem_valid_o                 ,
output reg    [31:0]                    rem_opcode_o                ,
output reg    [31:0]                    div_opcode_o                
);
reg invalid_instruction_w;
reg [31:0] rem_opcode_r;
reg [31:0] div_opcode_r;

reg [11:0]  alu_ctrl	  ;
reg 	    reg_wr_en	  ;
reg	        mem_rd_en	  ;
reg	        mem_wr_en	  ;
reg 	    mem_to_reg_en ;


reg	                            imm_en_r	            ;
reg  [DATA_WIDTH-1:0]           imm_r1	                ;
wire [INSTRUCTION_WIDTH-1:0]    instruction             ;
wire [FUNC7-1:0]                func7	                ;
wire [GPR_ADDR_WIDTH-1:0]       source_reg1	            ;
wire [GPR_ADDR_WIDTH-1:0]       source_reg2             ;
wire [GPR_ADDR_WIDTH-1:0]       dest_reg	            ;
reg 	                        branch_en_r             ;
reg 	                        branch_en_r1            ;
wire [CSR_ADDR_WIDTH-1:0]       csr_addr_w              ;
wire                            dbg_branch_invalid_instr;
wire                            dbg_pc_invalid_instr    ;
reg                             auipc_valid_r           ;
reg mult_valid;
reg mult_valid_r;
reg mult_valid_r1;
reg div_valid;
reg rem_valid;
assign dbg_branch_invalid_instr    = (debug_mode_valid_i && branch_en);
assign dbg_pc_invalid_instr        = (debug_mode_valid_i && auipc_valid_r);
assign csr_addr_w                  = instruction[31:20] ;
assign invalid_instruction_valid_o = (dbg_branch_invalid_instr | dbg_pc_invalid_instr | invalid_instruction_w);	
assign instruction                 =((stall_pipeline) | (branch_en_r) | (branch_en_r1)) ?  32'd0 :instruction_r ;
	
assign opcode 		= instruction[OPCODE-1:0]  ;
assign func3  		= (instruction[OPCODE-1:0] == 7'b1101111)? 3'd0:instruction[14:12];
assign source_reg1 	= instruction[19:15];
assign source_reg2 	= instruction[24:20];
assign dest_reg	   	= instruction[11:7] ;
assign func7        = instruction[31:25];
//reg [OPCODE-1:0]opcode_r;
always@(posedge de_clk or negedge de_rst )
begin
	if(!de_rst )
	begin
		imm_val  	        <= {DATA_WIDTH{1'b0}}	;
		imm_r1		        <= {DATA_WIDTH{1'b0}}	;
		alu_ctrl 	        <=  12'd0	;
		reg_wr_en	        <=  1'd0	;
		mem_wr_en	        <=  1'd0	;
		mem_rd_en	        <=  1'd0	;
		mem_to_reg_en 	    <=  1'b0	;
		branch_en_r	        <= 1'b0;
		branch_en_r1        <= 1'b0;
		opcode_r 	        <= {OPCODE{1'b0}};
        //auipc_valid_r       <= 1'b0;
      //  ebreak_valid_o     <= 1'b0;
       //  mult_valid_o       <= 1'b0;
         div_valid_o        <= 1'b0;
         rem_valid_o        <= 1'b0;
         rem_opcode_o <= 32'd0;
         div_opcode_o <= 32'd0;
         mult_valid_r <= 1'b0;
         mult_valid_r1 <= 1'b0;
         


	end
    else if(debug_ndm_reset_i | debug_mode_reset_i | wdt_reset_i)
    begin
        imm_val  	         <= {DATA_WIDTH{1'b0}}	;
		imm_r1		         <= {DATA_WIDTH{1'b0}}	;
		alu_ctrl 	         <=  12'd0	;
		reg_wr_en	         <=  1'd0	;
		mem_wr_en	         <=  1'd0	;
		mem_rd_en	         <=  1'd0	;
		mem_to_reg_en 	     <=  1'b0	;
		branch_en_r	         <= 1'b0;
		branch_en_r1         <= 1'b0;
		opcode_r 	         <= 7'd0;
       // auipc_valid_r        <= 1'b0;
        // ebreak_valid_o      <= 1'b0;
         //mult_valid_o        <= 1'b0;
                  div_valid_o        <= 1'b0;
         rem_valid_o        <= 1'b0;
         rem_opcode_o <= 32'd0;
         div_opcode_o <= 32'd0;
         mult_valid_r <= 1'b0;
         mult_valid_r1 <= 1'b0;
         



    end
	else
	begin
		imm_r1	 	        <= imm_r	;
		imm_val  	        <= imm_r	;
		alu_ctrl 	        <= alu_ctrl_r	;
		reg_wr_en	        <= reg_wr_en_r  ;
		mem_wr_en	        <= mem_wr_en_r  ;
		mem_rd_en	        <= mem_rd_en_r  ;
		mem_to_reg_en       <= mem_to_reg_en_r;
		branch_en_r	        <= branch_en	;
		branch_en_r1        <= branch_en_r;
		opcode_r            <= opcode;
      //  auipc_valid_r       <= 1'b0;
        // ebreak_valid_o     <= 1'b0;
         //mult_valid_o <= mult_valid;
         div_valid_o        <= div_valid;
         rem_valid_o        <= rem_valid;
         mult_valid_r <= mult_valid;
         mult_valid_r1 <= mult_valid_r;

         if(!(stall_pipeline|| stall_en))
         begin
             rem_opcode_o <= rem_opcode_r;
             div_opcode_o <= div_opcode_r;
         end

	end
end


assign mult_valid_o = (mult_valid_r && (!mult_valid_r1));

always@(*)
begin
	if((!branch_en_r) & (decode_instruction_valid_i))
	begin
     	case(opcode)
	     7'b0000011:	begin //load lb, lh, lw, ld, lbu, lhu, lwu
		   	rs1	  	            = source_reg1					;
			rs2	   	            = {GPR_ADDR_WIDTH{1'b0}}						;
			rd	   	            = dest_reg					;
		    imm_r	   	        = {{(DATA_WIDTH-12){instruction[31]}},instruction[31:20]}	;
			alu_ctrl_r 	        = {2'd0,func3,opcode}				;
			reg_wr_en_r  	    = 1'b1						;
			mem_rd_en_r  	    = 1'b1						;
			mem_wr_en_r  	    = 1'b0						;
			mem_to_reg_en_r     = 1'b1						;
			csr_write_en_o	    = 1'b0				;	
			csr_read_en_o	    = 1'b0				;
			csr_addr_o		    = {CSR_ADDR_WIDTH{1'b0}}				;
			csr_set_valid_o 	= 1'b0				;
			csr_clear_valid_o	= 1'b0				;
			e_call_valid_o  	= 1'b0				;	
			e_break_valid_o 	= 1'b0				;	
			mret_valid_o		= 1'b0				;
			invalid_instruction_w = 1'b0			;
			csr_imm_valid_o 	= 1'b0				;
		     ret_func_valid     = 1'b0;
             auipc_valid_r      = 1'b0;
              ebreak_valid_o    = 1'b0;
              mult_valid = 1'b0;
              div_valid        = 1'b0;
         rem_valid        = 1'b0;
         rem_opcode_r     = 32'd0;
         div_opcode_r     = 32'd0;




	     		end
	     7'b0010011:	begin //arithmatic and logical immediate addi,xori,ori,andi,slti
		  if(func3 == 3'b000 || func3 == 3'b100 || func3 == 3'b110 || func3 == 3'b111 || func3 == 3'b010 || func3 == 3'b011)
		  begin
			rs1	   	            = source_reg1					;
			rs2	   	            = {GPR_ADDR_WIDTH{1'b0}}						;
			rd	   	            = dest_reg					;
			imm_r      	        =  {{(DATA_WIDTH-12){instruction[31]}},instruction[31:20]}	;
			alu_ctrl_r 	        = {2'd0,func3,opcode}				;
			reg_wr_en_r  	    = 1'b1						;
         	mem_rd_en_r  	    = 1'b0						;
         	mem_wr_en_r  	    = 1'b0						;
			mem_to_reg_en_r     = 1'b0						;
			csr_write_en_o		= 1'b0				;	
			csr_read_en_o		= 1'b0				;
			csr_addr_o		    = {CSR_ADDR_WIDTH{1'b0}}				;
			csr_set_valid_o 	= 1'b0				;
			csr_clear_valid_o	= 1'b0				;
			e_call_valid_o  	= 1'b0				;	
			e_break_valid_o 	= 1'b0				;	
			mret_valid_o		= 1'b0				;
			invalid_instruction_w = 1'b0			;
			csr_imm_valid_o 	= 1'b0				;
			  ret_func_valid    = 1'b0;
              auipc_valid_r     = 1'b0;
               ebreak_valid_o   = 1'b0;
               mult_valid = 1'b0;
               div_valid        = 1'b0;
         rem_valid        = 1'b0;
         rem_opcode_r     = 32'd0;
         div_opcode_r     = 32'd0;





			end
			else//slli srli srai 
			begin
			rs1	                = source_reg1					;
			rs2	                = {GPR_ADDR_WIDTH{1'b0}}						;
			rd	                = dest_reg						;
			imm_r               =  {{(DATA_WIDTH-12){instruction[25]}},instruction[25:20]}	;
			alu_ctrl_r          = {instruction[30],1'b0,func3,opcode}		;
			reg_wr_en_r         = 1'b1						;
         		mem_rd_en_r     = 1'b0								;
         		mem_wr_en_r     = 1'b0								;
			mem_to_reg_en_r     = 1'b0;
			csr_write_en_o		= 1'b0				;	
			csr_read_en_o		= 1'b0				;
			csr_addr_o		    = {CSR_ADDR_WIDTH{1'b0}}				;
			csr_set_valid_o 	= 1'b0				;
			csr_clear_valid_o	= 1'b0				;
			e_call_valid_o  	= 1'b0				;	
			e_break_valid_o 	= 1'b0				;	
			mret_valid_o		= 1'b0				;
			invalid_instruction_w = 1'b0			;
			csr_imm_valid_o 	= 1'b0				;
				ret_func_valid  = 1'b0;
                auipc_valid_r   = 1'b0;
                 ebreak_valid_o = 1'b0;
                 mult_valid = 1'b0;
                 div_valid        = 1'b0;
         rem_valid        = 1'b0;
         rem_opcode_r     = 32'd0;
         div_opcode_r     = 32'd0;





			end


	     		end
	     7'b0100011:	begin // store sb, sh, sw, sd
			rs1	                = source_reg1					;
			rs2	                = source_reg2					;
			rd 	                = {GPR_ADDR_WIDTH{1'b0}}						;
		    imm_r	            = {{(DATA_WIDTH-12){instruction[31]}},instruction[31:25],instruction[11:7]}	;
			alu_ctrl_r          = {2'd0,func3,opcode}				;
			reg_wr_en_r         = 1'b0						;
            mem_rd_en_r         = 1'b0						;
            mem_wr_en_r         = 1'b1						;
			mem_to_reg_en_r     = 1'b0						;
			csr_write_en_o		= 1'b0				;	
			csr_read_en_o		= 1'b0				;
			csr_addr_o		    = {CSR_ADDR_WIDTH{1'b0}}				;
			csr_set_valid_o 	= 1'b0				;
			csr_clear_valid_o	= 1'b0				;
			e_call_valid_o  	= 1'b0				;	
			e_break_valid_o 	= 1'b0				;	
			mret_valid_o		= 1'b0				;
			invalid_instruction_w = 1'b0			;
			csr_imm_valid_o 	= 1'b0				;
		    ret_func_valid      = 1'b0;
            auipc_valid_r       = 1'b0;
            ebreak_valid_o      = 1'b0;
            mult_valid = 1'b0;
            div_valid        = 1'b0;
         rem_valid        = 1'b0;
         rem_opcode_r     = 32'd0;
         div_opcode_r     = 32'd0;







		     	end
	     7'b0110011:	
         begin // arithmatic add, sub, sll, srs, xor, and , or, srl, mul,mulh,mulhu,div,divu,rem,remu,slt
			rs1	                = source_reg1					;
			rs2                 = source_reg2					;
			rd	                = dest_reg						;
			imm_r	            = {DATA_WIDTH{1'b0}}						;
			alu_ctrl_r          = {instruction[30],instruction[25],func3,opcode}	;
			reg_wr_en_r         = 1'b1						;
            mem_rd_en_r         = 1'b0						;
            mem_wr_en_r         = 1'b0						;
			mem_to_reg_en_r     = 1'b0						;
			csr_write_en_o		= 1'b0				;	
			csr_read_en_o		= 1'b0				;
			csr_addr_o		    = {CSR_ADDR_WIDTH{1'b0}}				;
			csr_set_valid_o 	= 1'b0				;
			csr_clear_valid_o	= 1'b0				;
			e_call_valid_o  	= 1'b0				;	
			e_break_valid_o 	= 1'b0				;	
			mret_valid_o		= 1'b0				;
			invalid_instruction_w = 1'b0			;
			csr_imm_valid_o 	= 1'b0				;
		    ret_func_valid      = 1'b0;
            auipc_valid_r       = 1'b0;
            ebreak_valid_o      = 1'b0;
            if(func3 == 3'd0 || func3 == 3'd1 || func3 == 3'd2 || func3 == 3'd3 )
            begin
                if(func7 == 7'd1)
                begin
                    mult_valid = 1'b1;
                    div_valid  = 1'b0;
                    rem_valid  = 1'b0;
                    rem_opcode_r     = 32'd0;
                    div_opcode_r     = 32'd0;
                end
                else
                begin
                                        mult_valid = 1'b0;
                    div_valid = 1'b0;
                    rem_valid = 1'b0;
                    rem_opcode_r     = 32'd0;
                    div_opcode_r     = 32'd0;

                end
            end
            else if(func3 == 3'd4 || func3 == 3'd5)
            begin
               if(func7 == 7'd1)
                begin
                div_valid = 1'b1;
                mult_valid = 1'b0;
                rem_valid = 1'b0;
                rem_opcode_r     = 32'd0;
                div_opcode_r     ={12'h200,1'b0,func3,12'h033};//{12'h200,1'b0,func3,12'h033}
                end
                else
                begin
                                        mult_valid = 1'b0;
                    div_valid = 1'b0;
                    rem_valid = 1'b0;
                    rem_opcode_r     = 32'd0;
                    div_opcode_r     = 32'd0;

                end
            end
            else if(func3 == 3'd6 || func3 == 3'd7)
            begin
                if(func7 == 7'd1)
                begin
                rem_valid = 1'b1;
                div_valid = 1'b0;
                mult_valid = 1'b0;
                rem_opcode_r     = {12'h200,1'b0,func3,12'h033};
                div_opcode_r     = 32'd0;
                end
                else
                begin
                                        mult_valid = 1'b0;
                    div_valid = 1'b0;
                    rem_valid = 1'b0;
                    rem_opcode_r     = 32'd0;
                    div_opcode_r     = 32'd0;

                end



            end

            else
            begin
                    mult_valid = 1'b0;
                    div_valid = 1'b0;
                    rem_valid = 1'b0;
                    rem_opcode_r     = 32'd0;
                    div_opcode_r     = 32'd0;
            end
          //  end





end
		7'b1100011:	begin //conditional branch
			rs1     	        = source_reg1;
			rs2     	        = source_reg2;
			rd		            = {GPR_ADDR_WIDTH{1'b0}};
			imm_r		        = {{(DATA_WIDTH-13){instruction[31]}},instruction[31],instruction[7],instruction[30:25],instruction[11:8],1'b0};
			//alu_ctrl 	        = 12'd0;
            alu_ctrl_r          = 12'd0;
			reg_wr_en_r 	    = 1'b0;
			mem_rd_en_r 	    = 1'b0;
			mem_wr_en_r 	    = 1'b0;
			mem_to_reg_en_r     = 1'b0;
			csr_write_en_o		= 1'b0				;	
			csr_read_en_o		= 1'b0				;
			csr_addr_o		    = {CSR_ADDR_WIDTH{1'b0}}				;
			csr_set_valid_o 	= 1'b0				;
			csr_clear_valid_o	= 1'b0				;
			e_call_valid_o  	= 1'b0				;	
			e_break_valid_o 	= 1'b0				;	
			mret_valid_o		= 1'b0				;
			invalid_instruction_w = 1'b0			;
			csr_imm_valid_o 	= 1'b0				;
			ret_func_valid      = 1'b0;
            auipc_valid_r       = 1'b0;
            ebreak_valid_o      = 1'b0;
            mult_valid = 1'b0;
            div_valid = 1'b0;
                rem_valid = 1'b0;
                rem_opcode_r     = 32'd0;
                div_opcode_r     = 32'd0;




				end
		7'b1101111: 	begin //JAL - jump and link
			rs1     	        = {GPR_ADDR_WIDTH{1'b0}};
			rs2     	        = {GPR_ADDR_WIDTH{1'b0}};
			rd		            = dest_reg;
			imm_r		        = {{(DATA_WIDTH-21){instruction[31]}},instruction[31],instruction[19:12],instruction[20],instruction[30:21],1'b0};
			alu_ctrl_r 	        = {2'b00,3'b000,opcode};//00 000 1101111
           // alu_ctrl_r        = 12'd0;
			reg_wr_en_r 	    = 1'b1;
			mem_rd_en_r 	    = 1'b0;
			mem_wr_en_r 	    = 1'b0;
			mem_to_reg_en_r     = 1'b0;
			csr_write_en_o		= 1'b0				;	
			csr_read_en_o		= 1'b0				;
			csr_addr_o		    = {CSR_ADDR_WIDTH{1'b0}}				;
			csr_set_valid_o 	= 1'b0				;
			csr_clear_valid_o	= 1'b0				;
			e_call_valid_o  	= 1'b0				;	
			e_break_valid_o 	= 1'b0				;	
			mret_valid_o		= 1'b0				;
			invalid_instruction_w = 1'b0			;
			csr_imm_valid_o 	= 1'b0				;
			ret_func_valid      = 1'b0;
            auipc_valid_r       = 1'b0;
             ebreak_valid_o     = 1'b0;
             mult_valid = 1'b0;
             div_valid = 1'b0;
                rem_valid = 1'b0;
                rem_opcode_r     = 32'd0;
                div_opcode_r     = 32'd0;




				end
		7'b1100111: //JALR - jump and link register 
		begin
			rs1 	            = source_reg1						;
			rs2 		        = {GPR_ADDR_WIDTH{1'b0}}							;
			rd 		            = dest_reg						;
			imm_r 		        = {{(DATA_WIDTH-12){instruction[31]}},instruction[31:20]}	;
			alu_ctrl_r 	        = {2'd0,func3,opcode}					;// 00 000 1100111
            reg_wr_en_r  	    = 1'b1							;
			ret_func_valid      = 1'b1							;
            mem_rd_en_r  	    = 1'b0							;
            mem_wr_en_r  	    = 1'b0							;
            mem_to_reg_en_r     = 1'b0							;
			csr_write_en_o		= 1'b0				;	
			csr_read_en_o		= 1'b0				;
			csr_addr_o		    = {CSR_ADDR_WIDTH{1'b0}}				;
			csr_set_valid_o 	= 1'b0				;
			csr_clear_valid_o	= 1'b0				;
			e_call_valid_o  	= 1'b0				;	
			e_break_valid_o 	= 1'b0				;	
			mret_valid_o		= 1'b0				;
			invalid_instruction_w = 1'b0			;
			csr_imm_valid_o 	= 1'b0				;
            auipc_valid_r       = 1'b0;
            ebreak_valid_o      = 1'b0;
            mult_valid = 1'b0;
            div_valid = 1'b0;
                rem_valid = 1'b0;
                rem_opcode_r     = 32'd0;
                div_opcode_r     = 32'd0;








		end

		7'b0110111://lui
		begin
		rs1 		        = {GPR_ADDR_WIDTH{1'b0}}			;
		rs2 		        = {GPR_ADDR_WIDTH{1'b0}}			;
		rd  		        = dest_reg					;
		imm_r 		        = {{(DATA_WIDTH-32){instruction[31]}},instruction[31:12],12'd0};
		alu_ctrl_r 	        = {2'b00,3'b000,opcode};//000000110111
		reg_wr_en_r  	    = 1'b1						;
		mem_rd_en_r  	    = 1'b0						;
		mem_wr_en_r  	    = 1'b0						;
		mem_to_reg_en_r	    = 1'b0						;
		csr_write_en_o		= 1'b0				;	
		csr_read_en_o		= 1'b0				;
		csr_addr_o		    = {CSR_ADDR_WIDTH{1'b0}}				;
		csr_set_valid_o 	= 1'b0				;
		csr_clear_valid_o	= 1'b0				;
		e_call_valid_o  	= 1'b0				;	
		e_break_valid_o 	= 1'b0				;	
		mret_valid_o		= 1'b0				;
		invalid_instruction_w = 1'b0			;
		csr_imm_valid_o 	= 1'b0				;
		ret_func_valid      = 1'b0;
        auipc_valid_r       = 1'b0;
        ebreak_valid_o      = 1'b0;
        mult_valid = 1'b0;
        div_valid = 1'b0;
                rem_valid = 1'b0;
                rem_opcode_r     = 32'd0;
                div_opcode_r     = 32'd0;




		
		end
		
		
		7'b0010111://auipc
		begin
		rs1 		        = {GPR_ADDR_WIDTH{1'b0}}			;
		rs2 		        = {GPR_ADDR_WIDTH{1'b0}}			;
		rd  		        = dest_reg					;
		imm_r 		        ={{(DATA_WIDTH-32){instruction[31]}},instruction[31:12],12'd0};
		alu_ctrl_r 	        = {2'b00,3'b000,opcode};
		reg_wr_en_r  	    = 1'b1						;
		mem_rd_en_r  	    = 1'b0						;
		mem_wr_en_r  	    = 1'b0						;
		mem_to_reg_en_r	    = 1'b0						;
		csr_write_en_o		= 1'b0				;	
		csr_read_en_o		= 1'b0				;
		csr_addr_o		    = {CSR_ADDR_WIDTH{1'b0}}				;
		csr_set_valid_o 	= 1'b0				;
		csr_clear_valid_o	= 1'b0				;
		e_call_valid_o  	= 1'b0				;	
		e_break_valid_o 	= 1'b0				;	
		mret_valid_o		= 1'b0				;
		invalid_instruction_w = 1'b0			;
		csr_imm_valid_o 	= 1'b0				;
		ret_func_valid      = 1'b0;
        auipc_valid_r       = 1'b1;
        ebreak_valid_o      = 1'b0;
        mult_valid = 1'b0;
        div_valid = 1'b0;
                rem_valid = 1'b0;
                rem_opcode_r     = 32'd0;
                div_opcode_r     = 32'd0;



		
		end
        `ifdef ZILLA_64_BIT
	     7'b0111011://addw,subw,sllw,srlw,sraw,mulw,divw,divuw,remw,remuw
		begin
			rs1	                = source_reg1					;
			rs2                 = source_reg2					;
			rd	                = dest_reg						;
			imm_r	            = {DATA_WIDTH{1'b0}}						;
			alu_ctrl_r          = {instruction[30],instruction[25],func3,opcode}	;
			reg_wr_en_r         = 1'b1						;
            mem_rd_en_r         = 1'b0						;
            mem_wr_en_r         = 1'b0						;
			mem_to_reg_en_r     = 1'b0	;
			csr_write_en_o		= 1'b0				;	
			csr_read_en_o		= 1'b0				;
			csr_addr_o		    = {CSR_ADDR_WIDTH{1'b0}}				;
			csr_set_valid_o 	= 1'b0				;
			csr_clear_valid_o	= 1'b0				;
			e_call_valid_o  	= 1'b0				;	
			e_break_valid_o 	= 1'b0				;	
			mret_valid_o		= 1'b0				;
			invalid_instruction_w = 1'b0			;
			csr_imm_valid_o 	= 1'b0				;
			ret_func_valid      = 1'b0;
            auipc_valid_r       = 1'b0;
            ebreak_valid_o      = 1'b0;
            if(func3 == 3'd0)
            begin
                if(func7 == 7'd1)
                begin
                    mult_valid = 1'b1;
                    rem_valid = 1'b0;
                    div_valid = 1'b0;
                    rem_opcode_r     = 32'd0;
                    div_opcode_r     = 32'd0;

                end

                else
                begin
                    mult_valid = 1'b0;
                    rem_valid = 1'b0;
                    div_valid = 1'b0;
                    rem_opcode_r     = 32'd0;
                    div_opcode_r     = 32'd0;

                end
            end
            else if(func3 == 3'd4 || func3 == 3'd5)
            begin
                if(func7 == 7'd1)
                begin
                    div_valid = 1'b1;
                    mult_valid = 1'b0;
                    rem_valid = 1'b0;
                    rem_opcode_r     = 32'd0;
                    div_opcode_r     = {12'h200,1'b0,func3,12'h033};

                end
                else
                begin
                    div_valid = 1'b0;
                    mult_valid = 1'b0;
                    rem_valid = 1'b0;
                    rem_opcode_r     = 32'd0;
                    div_opcode_r     = 32'd0;

                end
            end
            else if(func3 == 3'd6 || func3 == 3'd7)
            begin
                if(func7 == 7'd1)
                begin
                    rem_valid = 1'b1;
                    mult_valid = 1'b0;
                    div_valid = 1'b0;
                    rem_opcode_r     = {12'h200,1'b0,func3,12'h033};
                    div_opcode_r     = 32'd0;

                end
                else
                begin
                    rem_valid = 1'b0;
                    mult_valid = 1'b0;
                    div_valid = 1'b0;
                    rem_opcode_r     = 32'd0;
                    div_opcode_r     = 32'd0;

                end
            end
            else
            begin
                mult_valid = 1'b0;
                div_valid = 1'b0;
                rem_valid = 1'b0;
                rem_opcode_r     = 32'd0;
                div_opcode_r     = 32'd0;

            end




		end
		7'b0011011:
		begin
		if(func3 == 3'b000)//addiw
		  begin
			rs1	   	            = source_reg1					;
			rs2	   	            = {GPR_ADDR_WIDTH{1'b0}}						;
			rd	   	            = dest_reg					;
			imm_r      	        =  {32'd0,{20{instruction[31]}},instruction[31:20]}	;
			alu_ctrl_r 	        = {2'd0,func3,opcode}				;//addiw 00 000 0011011
			reg_wr_en_r  	    = 1'b1						;
         	mem_rd_en_r  	    = 1'b0						;
         	mem_wr_en_r  	    = 1'b0						;
			mem_to_reg_en_r     = 1'b0;
			csr_write_en_o		= 1'b0				;	
			csr_read_en_o		= 1'b0				;
			csr_addr_o		    = {CSR_ADDR_WIDTH{1'b0}}				;
			csr_set_valid_o 	= 1'b0				;
			csr_clear_valid_o	= 1'b0				;
			e_call_valid_o  	= 1'b0				;	
			e_break_valid_o 	= 1'b0				;	
			mret_valid_o		= 1'b0				;
			invalid_instruction_w = 1'b0			;
			csr_imm_valid_o 	= 1'b0				;
			ret_func_valid      = 1'b0;
            auipc_valid_r       = 1'b0;
            ebreak_valid_o      = 1'b0;
            mult_valid = 1'b0;
            div_valid = 1'b0;
                rem_valid = 1'b0;
                rem_opcode_r     = 32'd0;
                div_opcode_r     = 32'd0;




			end
			else if(func3 == 3'b001 | func3 ==3'b101)//slliw srliw sraiw 
			begin
			rs1	   	            = source_reg1					;
			rs2	   	            = {GPR_ADDR_WIDTH{1'b0}}						;
			rd	   	            = dest_reg					;
			imm_r      	        =  {32'd0,{27{instruction[24]}},instruction[24:20]}	;
			alu_ctrl_r 	        = {instruction[30],1'b0,func3,opcode}		;//slliw 00 001 0011011
			reg_wr_en_r  	    = 1'b1						;//srliw 00 101 0011011
         	mem_rd_en_r  	    = 1'b0						;//sraiw 10 101 0011011
         	mem_wr_en_r  	    = 1'b0						;
			mem_to_reg_en_r     = 1'b0;
			csr_write_en_o		= 1'b0				;	
			csr_read_en_o		= 1'b0				;
			csr_addr_o		    = {CSR_ADDR_WIDTH{1'b0}}				;
			csr_set_valid_o 	= 1'b0				;
			csr_clear_valid_o	= 1'b0				;
			e_call_valid_o  	= 1'b0				;	
			e_break_valid_o 	= 1'b0				;	
			mret_valid_o		= 1'b0				;
			invalid_instruction_w = 1'b0			;
			csr_imm_valid_o 	= 1'b0				;
			ret_func_valid = 1'b0;
            auipc_valid_r   = 1'b0;
            ebreak_valid_o = 1'b0;
            mult_valid = 1'b0;
            div_valid = 1'b0;
                rem_valid = 1'b0;
                rem_opcode_r     = 32'd0;
                div_opcode_r     = 32'd0;




			end

		end
    `endif

		7'b1111011://compare and rotate// R - type
		begin
			rs1	   	= source_reg1					;
			rs2        	= source_reg2					;
			rd	   	= dest_reg						;
			imm_r	   	= {DATA_WIDTH{1'b0}}						;
			alu_ctrl_r 	= {instruction[30],instruction[25],func3,opcode}	;
			reg_wr_en_r	= 1'b1						;
            mem_rd_en_r	  = 1'b0						;
            mem_wr_en_r	  = 1'b0						;
			mem_to_reg_en_r = 1'b0	;	
			csr_write_en_o		= 1'b0				;	
			csr_read_en_o		= 1'b0				;
			csr_addr_o		= {CSR_ADDR_WIDTH{1'b0}}				;
			csr_set_valid_o 	= 1'b0				;
			csr_clear_valid_o	= 1'b0				;
			e_call_valid_o  	= 1'b0				;	
			e_break_valid_o 	= 1'b0				;	
			mret_valid_o		= 1'b0				;
			invalid_instruction_w = 1'b0			;
			csr_imm_valid_o 	= 1'b0				;
			ret_func_valid = 1'b0;
            auipc_valid_r   = 1'b0;
            ebreak_valid_o = 1'b0;
            mult_valid = 1'b0;
            div_valid = 1'b0;
                rem_valid = 1'b0;
                rem_opcode_r     = 32'd0;
                div_opcode_r     = 32'd0;




		end
		7'b1110111://rotate immediate// I - type//7'b1110111
		begin
			rs1	   		= source_reg1					;
			rs2	   		= {GPR_ADDR_WIDTH{1'b0}}						;
			rd	   		= dest_reg					;
			imm_r      		=  {{(DATA_WIDTH-12){instruction[31]}},instruction[31:20]}	;
			alu_ctrl_r 		= {2'd0,func3,opcode}				;
			reg_wr_en_r  		= 1'b1						;
         	mem_rd_en_r  		= 1'b0						;
         	mem_wr_en_r  		= 1'b0						;
			mem_to_reg_en_r 	= 1'b0						;
			csr_write_en_o		= 1'b0				;	
			csr_read_en_o		= 1'b0				;
			csr_addr_o		= {CSR_ADDR_WIDTH{1'b0}}				;
			csr_set_valid_o 	= 1'b0				;
			csr_clear_valid_o	= 1'b0				;
			e_call_valid_o  	= 1'b0				;	
			e_break_valid_o 	= 1'b0				;	
			mret_valid_o		= 1'b0				;
			invalid_instruction_w = 1'b0			;
			csr_imm_valid_o 	= 1'b0				;
			ret_func_valid = 1'b0;
            auipc_valid_r   = 1'b0;
            ebreak_valid_o = 1'b0;
            mult_valid = 1'b0;
            div_valid = 1'b0;
                rem_valid = 1'b0;
                rem_opcode_r     = 32'd0;
                div_opcode_r     = 32'd0;




		end
		7'b1011011://move immediate signed //7'b1011011
		begin
		rs1 			    = {GPR_ADDR_WIDTH{1'b0}}			;
		rs2 			    = {GPR_ADDR_WIDTH{1'b0}}			;
		rd  			    = dest_reg					;
		imm_r 			    ={{(DATA_WIDTH-20){instruction[31]}},instruction[31:12]};
		alu_ctrl_r 		    = {2'b00,3'b000,opcode};//12'b000000001011
		reg_wr_en_r  		= 1'b1						;
		mem_rd_en_r  		= 1'b0						;
		mem_wr_en_r  		= 1'b0						;
		mem_to_reg_en_r		= 1'b0						;
		csr_write_en_o		= 1'b0				;	
		csr_read_en_o		= 1'b0				;
		csr_addr_o		= {CSR_ADDR_WIDTH{1'b0}}				;
		csr_set_valid_o 	= 1'b0				;
		csr_clear_valid_o	= 1'b0				;
		e_call_valid_o  	= 1'b0				;	
		e_break_valid_o 	= 1'b0				;	
		mret_valid_o		= 1'b0				;
		invalid_instruction_w = 1'b0			;
		csr_imm_valid_o 	= 1'b0				;
		ret_func_valid = 1'b0;
        auipc_valid_r   = 1'b0;
        ebreak_valid_o = 1'b0;
        mult_valid = 1'b0;
        div_valid = 1'b0;
                rem_valid = 1'b0;
                rem_opcode_r     = 32'd0;
                div_opcode_r     = 32'd0;





		end
		7'b0101011://move immediate unsigned
		begin
		rs1 			    = {GPR_ADDR_WIDTH{1'b0}}				;
		rs2 			    = {GPR_ADDR_WIDTH{1'b0}}				;
		rd  			    = dest_reg			;
		imm_r 			    ={{(DATA_WIDTH-20){1'b0}},instruction[31:12]}	;
		alu_ctrl_r 		    = {2'b00,3'b000,opcode}		;
		reg_wr_en_r  		= 1'b1				;
		mem_rd_en_r  		= 1'b0				;
		mem_wr_en_r  		= 1'b0				;
		mem_to_reg_en_r		= 1'b0				;
		csr_write_en_o		= 1'b0				;	
		csr_read_en_o		= 1'b0				;
		csr_addr_o		= {CSR_ADDR_WIDTH{1'b0}}				;
		csr_set_valid_o 	= 1'b0				;
		csr_clear_valid_o	= 1'b0				;
		e_call_valid_o  	= 1'b0				;	
		e_break_valid_o 	= 1'b0				;	
		mret_valid_o		= 1'b0				;
		invalid_instruction_w = 1'b0			;
		csr_imm_valid_o 	= 1'b0				;
		ret_func_valid = 1'b0;
        auipc_valid_r   = 1'b0;
        ebreak_valid_o = 1'b0;
        mult_valid = 1'b0;
        div_valid = 1'b0;
                rem_valid = 1'b0;
                rem_opcode_r     = 32'd0;
                div_opcode_r     = 32'd0;





		end
		7'b1110011://ecall, ebreak, m-ret, csr instructions
		begin
			if(func3 == 3'b000)//ecall ebreak mret
			begin
				if(instruction[31:20] == 12'b000000000000)//ecall
				begin
					e_call_valid_o  	= 1'b1		;	
					e_break_valid_o 	= 1'b0		;	
					mret_valid_o		= 1'b0		;
					csr_write_en_o		= 1'b0		;	
					csr_read_en_o		= 1'b0		;
					csr_addr_o		= {CSR_ADDR_WIDTH{1'b0}}		;
					csr_set_valid_o 	= 1'b0		;
					csr_clear_valid_o	= 1'b0		;
					rs1 			    = {GPR_ADDR_WIDTH{1'b0}}		;
					rs2 			    = {GPR_ADDR_WIDTH{1'b0}}		;
					rd  			    = {GPR_ADDR_WIDTH{1'b0}}		;
					imm_r 			    = {DATA_WIDTH{1'b0}}		;
					alu_ctrl_r 		    = 12'd0		;
					reg_wr_en_r  		= 1'b0		;
					mem_rd_en_r  		= 1'b0		;
					mem_wr_en_r  		= 1'b0		;
					mem_to_reg_en_r		= 1'b0		;
					invalid_instruction_w = 1'b0			;
					csr_imm_valid_o 	= 1'b0				;
					ret_func_valid = 1'b0;
                    auipc_valid_r   = 1'b0;
                    ebreak_valid_o = 1'b0;
                    mult_valid = 1'b0;
                    div_valid = 1'b0;
                rem_valid = 1'b0;
                rem_opcode_r     = 32'd0;
                div_opcode_r     = 32'd0;




	


				end
				else if(instruction[31:20] == 12'b000000000001) //ebreak
				begin
					e_call_valid_o  	= 1'b0		;	
					e_break_valid_o 	= 1'b1		;	
					mret_valid_o		= 1'b0		;
					csr_write_en_o		= 1'b0		;	
					csr_read_en_o		= 1'b0		;
					csr_addr_o		= {CSR_ADDR_WIDTH{1'b0}}		;
					csr_set_valid_o 	= 1'b0		;
					csr_clear_valid_o	= 1'b0		;
					rs1 			    = {GPR_ADDR_WIDTH{1'b0}}		;
					rs2 			    = {GPR_ADDR_WIDTH{1'b0}}		;
					rd  			    = {GPR_ADDR_WIDTH{1'b0}}		;
					imm_r 			    = {DATA_WIDTH{1'b0}}		;
					alu_ctrl_r 		    = 12'd0		;
					reg_wr_en_r  		= 1'b0		;
					mem_rd_en_r  		= 1'b0		;
					mem_wr_en_r  		= 1'b0		;
					mem_to_reg_en_r		= 1'b0		;
					invalid_instruction_w = 1'b0			;
					csr_imm_valid_o 	= 1'b0				;
					ret_func_valid = 1'b0;
                    auipc_valid_r   = 1'b0;
                    ebreak_valid_o  =   1'b1;
                    mult_valid = 1'b0;
                    div_valid = 1'b0;
                rem_valid = 1'b0;
                rem_opcode_r     = 32'd0;
                div_opcode_r     = 32'd0;





				end
				else if(instruction[31:20] == 12'b001100000010)//mret
				begin
					e_call_valid_o  	= 1'b0		;	
					e_break_valid_o 	= 1'b0		;	
					mret_valid_o		= 1'b1		;
					csr_write_en_o		= 1'b0		;	
					csr_read_en_o		= 1'b0		;
					csr_addr_o		= {CSR_ADDR_WIDTH{1'b0}}		;
					csr_set_valid_o 	= 1'b0		;
					csr_clear_valid_o	= 1'b0		;
					rs1 			    = {GPR_ADDR_WIDTH{1'b0}}		;
					rs2 			    = {GPR_ADDR_WIDTH{1'b0}}		;
					rd  			    = {GPR_ADDR_WIDTH{1'b0}}		;
					imm_r 			    = {DATA_WIDTH{1'b0}}		;
					alu_ctrl_r 		    = 12'd0		;
					reg_wr_en_r  		= 1'b0		;
					mem_rd_en_r  		= 1'b0		;
					mem_wr_en_r  		= 1'b0		;
					mem_to_reg_en_r		= 1'b0		;
					invalid_instruction_w = 1'b0	;
					csr_imm_valid_o 	= 1'b0		;
					ret_func_valid = 1'b0;
                    auipc_valid_r   = 1'b0;
                    ebreak_valid_o = 1'b0;
                    mult_valid = 1'b0;
                    div_valid = 1'b0;
                rem_valid = 1'b0;
                rem_opcode_r     = 32'd0;
                div_opcode_r     = 32'd0;






				end
				else
				begin
					e_call_valid_o  	= 1'b0		;	
					e_break_valid_o 	= 1'b0		;	
					mret_valid_o		= 1'b0		;
					csr_write_en_o		= 1'b0		;	
					csr_read_en_o		= 1'b0		;
					csr_addr_o		= {CSR_ADDR_WIDTH{1'b0}}		;
					csr_set_valid_o 	= 1'b0		;
					csr_clear_valid_o	= 1'b0		;
					rs1 			    = {GPR_ADDR_WIDTH{1'b0}}		;
					rs2 			    = {GPR_ADDR_WIDTH{1'b0}}		;
					rd  			    = {GPR_ADDR_WIDTH{1'b0}}		;
					imm_r 			    = {DATA_WIDTH{1'b0}}		;
					alu_ctrl_r 		    = 12'd0		;
					reg_wr_en_r  		= 1'b0		;
					mem_rd_en_r  		= 1'b0		;
					mem_wr_en_r  		= 1'b0		;
					mem_to_reg_en_r		= 1'b0		;
					invalid_instruction_w = 1'b1			;
					csr_imm_valid_o 	= 1'b0		;
					ret_func_valid = 1'b0;
                    auipc_valid_r   = 1'b0;
                    ebreak_valid_o = 1'b0;
                    mult_valid = 1'b0;
                    div_valid = 1'b0;
                rem_valid = 1'b0;
                rem_opcode_r     = 32'd0;
                div_opcode_r     = 32'd0;






				end

			end
			else
			begin
				if(func3 == 3'b001)//CSRRW
				begin
					csr_write_en_o		=1'b1		;	
					csr_read_en_o		=1'b1		;
					csr_addr_o		=csr_addr_w	;
					csr_set_valid_o 	=1'b0		;
					csr_clear_valid_o	=1'b0		;
					rs1 			    = source_reg1	;
					rs2 			    = {GPR_ADDR_WIDTH{1'b0}}		;
					rd  			    = dest_reg	;
					imm_r 			    = {DATA_WIDTH{1'b0}}		;
					alu_ctrl_r 		    = 12'd0		;
					reg_wr_en_r  		= 1'b1		;
					mem_rd_en_r  		= 1'b0		;
					mem_wr_en_r  		= 1'b0		;
					mem_to_reg_en_r		= 1'b0		;
					e_call_valid_o  	= 1'b0;	
					e_break_valid_o 	= 1'b0;	
					mret_valid_o		= 1'b0;
					invalid_instruction_w = 1'b0			;
					csr_imm_valid_o 	= 1'b0		;
					ret_func_valid = 1'b0;
                    auipc_valid_r   = 1'b0;
                    ebreak_valid_o = 1'b0;
                    mult_valid = 1'b0;
                    div_valid = 1'b0;
                rem_valid = 1'b0;
                rem_opcode_r     = 32'd0;
                div_opcode_r     = 32'd0;




				end 

				else if(func3 == 3'b010)//CSRRS
				begin
					csr_write_en_o		=1'b1		;	
					csr_read_en_o		=1'b1		;
					csr_addr_o		=csr_addr_w	;
					csr_set_valid_o 	=1'b1		;
					csr_clear_valid_o	=1'b0		;
					rs1 			    = source_reg1	;
					rs2 			    = {GPR_ADDR_WIDTH{1'b0}}		;
					rd  			    = dest_reg	;
					imm_r 			    = {DATA_WIDTH{1'b0}}		;
					alu_ctrl_r 		    = 12'd0		;
					reg_wr_en_r  		= 1'b1		;
					mem_rd_en_r  		= 1'b0		;
					mem_wr_en_r  		= 1'b0		;
					mem_to_reg_en_r		= 1'b0		;
					e_call_valid_o  	= 1'b0;	
					e_break_valid_o 	= 1'b0;	
					mret_valid_o		= 1'b0;
					invalid_instruction_w = 1'b0			;
					csr_imm_valid_o 	= 1'b0		;
					ret_func_valid = 1'b0;
                    auipc_valid_r   = 1'b0;
                    ebreak_valid_o = 1'b0;
                    mult_valid = 1'b0;
                    div_valid = 1'b0;
                rem_valid = 1'b0;
                rem_opcode_r     = 32'd0;
                div_opcode_r     = 32'd0;



				end
				
				else if(func3 == 3'b011)//CSRRC
				begin
					csr_write_en_o		=1'b1		;	
					csr_read_en_o		=1'b1		;
					csr_addr_o		=csr_addr_w	;
					csr_set_valid_o 	=1'b0		;
					csr_clear_valid_o	=1'b1		;
					rs1 			    = source_reg1	;
					rs2 			    = {GPR_ADDR_WIDTH{1'b0}}		;
					rd  			    = dest_reg	;
					imm_r 			    = {DATA_WIDTH{1'b0}}		;
					alu_ctrl_r 		    = 12'd0		;
					reg_wr_en_r  		= 1'b1		;
					mem_rd_en_r  		= 1'b0		;
					mem_wr_en_r  		= 1'b0		;
					mem_to_reg_en_r		= 1'b0		;
					e_call_valid_o  	= 1'b0;	
					e_break_valid_o 	= 1'b0;	
					mret_valid_o		= 1'b0;
					invalid_instruction_w = 1'b0			;
					csr_imm_valid_o 	= 1'b0		;
					ret_func_valid = 1'b0;
                    auipc_valid_r   = 1'b0;
                    ebreak_valid_o = 1'b0;
                    mult_valid = 1'b0;
                    div_valid = 1'b0;
                rem_valid = 1'b0;
                rem_opcode_r     = 32'd0;
                div_opcode_r     = 32'd0;



				end
				
				else if(func3 == 3'b101)//CSRRWI
				begin
					csr_write_en_o		=1'b1		;	
					csr_read_en_o		=1'b1		;
					csr_addr_o		=csr_addr_w	;
					csr_set_valid_o 	=1'b0		;
					csr_clear_valid_o	=1'b0		;
					rs1 			    = {GPR_ADDR_WIDTH{1'b0}}		;
					rs2 			    = {GPR_ADDR_WIDTH{1'b0}}		;
					rd  			    = dest_reg	;
					imm_r 			    = {59'd0,source_reg1}	;
					alu_ctrl_r 		    = 12'd0		;
					reg_wr_en_r  		= 1'b1		;
					mem_rd_en_r  		= 1'b0		;
					mem_wr_en_r  		= 1'b0		;
					mem_to_reg_en_r		= 1'b0		;
					e_call_valid_o  	= 1'b0;	
					e_break_valid_o 	= 1'b0;	
					mret_valid_o		= 1'b0;
					invalid_instruction_w = 1'b0			;
					csr_imm_valid_o 	= 1'b1		;
					ret_func_valid = 1'b0;
                    auipc_valid_r   = 1'b0;
                    ebreak_valid_o = 1'b0;
                    mult_valid = 1'b0;
                    div_valid = 1'b0;
                rem_valid = 1'b0;
                rem_opcode_r     = 32'd0;
                div_opcode_r     = 32'd0;


				end
				
				else if(func3 == 3'b110)//CSRRSI
				begin
					csr_write_en_o		=1'b1		;	
					csr_read_en_o		=1'b1		;
					csr_addr_o		=csr_addr_w	;
					csr_set_valid_o 	=1'b1		;
					csr_clear_valid_o	=1'b0		;
					rs1 			    = {GPR_ADDR_WIDTH{1'b0}}		;
					rs2 			    = {GPR_ADDR_WIDTH{1'b0}}		;
					rd  			    = dest_reg	;
					imm_r 			    = {{DATA_WIDTH-GPR_ADDR_WIDTH{1'b0}},source_reg1}	;
					alu_ctrl_r 		    = 12'd0		;
					reg_wr_en_r  		= 1'b1		;
					mem_rd_en_r  		= 1'b0		;
					mem_wr_en_r  		= 1'b0		;
					mem_to_reg_en_r		= 1'b0		;
					e_call_valid_o  	= 1'b0;	
					e_break_valid_o 	= 1'b0;	
					mret_valid_o		= 1'b0;
					invalid_instruction_w = 1'b0			;
					csr_imm_valid_o 	= 1'b1		;
					ret_func_valid = 1'b0;
                    auipc_valid_r   = 1'b0;
                    ebreak_valid_o = 1'b0;
                    mult_valid = 1'b0;
                    div_valid = 1'b0;
                rem_valid = 1'b0;
                rem_opcode_r     = 32'd0;
                div_opcode_r     = 32'd0;



				end
				
				else if(func3 == 3'b111)//CSRRCI
				begin
					csr_write_en_o		=1'b1		;	
					csr_read_en_o		=1'b1		;
					csr_addr_o		=csr_addr_w	;
					csr_set_valid_o 	=1'b0		;
					csr_clear_valid_o	=1'b1		;
					e_call_valid_o  	= 1'b0		;	
					e_break_valid_o 	= 1'b0		;	
					mret_valid_o		= 1'b0		;
					rs1 			= {GPR_ADDR_WIDTH{1'b0}}		;
					rs2 			= {GPR_ADDR_WIDTH{1'b0}}		;
					rd  			= dest_reg	;
					imm_r 			= {{DATA_WIDTH-GPR_ADDR_WIDTH{1'b0}},source_reg1}	;
					alu_ctrl_r 		= 12'd0		;
					reg_wr_en_r  		= 1'b1		;
					mem_rd_en_r  		= 1'b0		;
					mem_wr_en_r  		= 1'b0		;
					mem_to_reg_en_r		= 1'b0		;
					invalid_instruction_w = 1'b0			;
					csr_imm_valid_o 	= 1'b1		;
					ret_func_valid = 1'b0;
                    auipc_valid_r   = 1'b0;
                    ebreak_valid_o = 1'b0;
                    mult_valid = 1'b0;
                    div_valid = 1'b0;
                rem_valid = 1'b0;
                rem_opcode_r     = 32'd0;
                div_opcode_r     = 32'd0;



				end



				
			end
		end
			default: begin
					rs1 			    = {GPR_ADDR_WIDTH{1'b0}}		;
					rs2 			    = {GPR_ADDR_WIDTH{1'b0}}		;
					rd  			    = {GPR_ADDR_WIDTH{1'b0}}		;
					imm_r 			    = {DATA_WIDTH{1'b0}}		;
					alu_ctrl_r 		    = 12'd0		;
					reg_wr_en_r  		= 1'b0		;
                    mem_rd_en_r  		= 1'b0		;
                    mem_wr_en_r  		= 1'b0		;
					mem_to_reg_en_r		= 1'b0		;
					csr_write_en_o		=1'b0		;	
					csr_read_en_o		=1'b0		;
					csr_addr_o		={CSR_ADDR_WIDTH{1'b0}}		;
					csr_set_valid_o 	=1'b0		;
					csr_clear_valid_o	=1'b0		;
					e_call_valid_o  	= 1'b0		;	
					e_break_valid_o 	= 1'b0		;	
					mret_valid_o		= 1'b0		;
					invalid_instruction_w = 1'b1			;
					csr_imm_valid_o 	= 1'b0		;
				    ret_func_valid = 1'b0;
                    auipc_valid_r   = 1'b0;
                    ebreak_valid_o = 1'b0;
                    mult_valid = 1'b0;
                    div_valid = 1'b0;
                rem_valid = 1'b0;
                rem_opcode_r     = 32'd0;
                div_opcode_r     = 32'd0;





				end
				endcase

		end
		else
		begin
					rs1 			    = {GPR_ADDR_WIDTH{1'b0}}		;
					rs2 			    = {GPR_ADDR_WIDTH{1'b0}}		;
					rd  			    = {GPR_ADDR_WIDTH{1'b0}}		;
					imm_r 			    = {DATA_WIDTH{1'b0}}		;
					alu_ctrl_r 		    = 12'd0		;
					reg_wr_en_r  		= 1'b0		;
                    mem_rd_en_r  		= 1'b0		;
                    mem_wr_en_r  		= 1'b0		;
					mem_to_reg_en_r		= 1'b0		;
					csr_write_en_o		=1'b0		;	
					csr_read_en_o		=1'b0		;
					csr_addr_o		={CSR_ADDR_WIDTH{1'b0}}		;
					csr_set_valid_o 	=1'b0		;
					csr_clear_valid_o	=1'b0		;
					e_call_valid_o  	= 1'b0		;	
					e_break_valid_o 	= 1'b0		;	
					mret_valid_o		= 1'b0		;
					invalid_instruction_w = 1'b0			;
					csr_imm_valid_o 	= 1'b0		;
			        ret_func_valid = 1'b0;
                    auipc_valid_r   = 1'b0;
                    ebreak_valid_o = 1'b0;
                    mult_valid = 1'b0;
                    div_valid = 1'b0;
                rem_valid = 1'b0;
                rem_opcode_r     = 32'd0;
                div_opcode_r     = 32'd0;




		end
				
end


endmodule

