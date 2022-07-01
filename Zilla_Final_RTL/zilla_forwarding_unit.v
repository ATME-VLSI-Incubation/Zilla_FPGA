`define ZILLA_32_BIT 
`timescale 1ns / 1ps
///////////////////////////////////
//
//forwarding to remove data hazard
//
//////////////////////////////////


module forwarding #(parameter GPR_ADDR_WIDTH = 0)
(

input 			                fwd_clk		    ,
input 			                fwd_rst		    ,
input                           wdt_reset_i     ,
input 			                reg_wr_en	    ,
input [GPR_ADDR_WIDTH-1:0]		rd		        ,
input [GPR_ADDR_WIDTH-1:0] 		rs1		        ,
input [GPR_ADDR_WIDTH-1:0]		rs2		        ,
input                           stall_pipeline  ,
output reg [1:0]    	        forward_a	    ,
output reg [1:0]    	        forward_b       ,
input                   div_busy_i  ,
input                   rem_busy_i  ,
input                   mult_valid_i,
input                   div_valid_i ,
input                   rem_valid_i



);

reg       mult_valid_r;
reg       div_valid_r;
reg       rem_valid_r;
reg       rem_busy_r;
reg       div_busy_r;


reg [GPR_ADDR_WIDTH-1:0] id_ex_rd		    ;
reg [GPR_ADDR_WIDTH-1:0] ex_mem_rd		    ;
reg [GPR_ADDR_WIDTH-1:0] mem_wb_rd		    ;
reg [GPR_ADDR_WIDTH-1:0] wb_rd              ;
reg [GPR_ADDR_WIDTH-1:0] id_ex_rs1		    ;
reg [GPR_ADDR_WIDTH-1:0] id_ex_rs2		    ;
reg	                     id_ex_reg_wr_en	;
reg	                     ex_mem_reg_wr_en	;
reg	                     mem_wb_reg_wr_en	;
reg                      wb_reg_wr_en       ;
wire 	                 rs1_fwd_ex_mem	    ; 
wire 	                 rs1_fwd_mem_wb	    ;             
wire 	                 rs2_fwd_ex_mem	    ;
wire 	                 rs2_fwd_mem_wb	    ;
wire                     rs1_fwd_wb         ;
wire                     rs2_fwd_wb         ;

always@(posedge fwd_clk or negedge fwd_rst )
begin
	if(!fwd_rst )
	begin
        mult_valid_r <= 1'b0;
        div_valid_r  <= 1'b0;
        rem_valid_r  <= 1'b0;
        rem_busy_r   <= 1'b0;
        div_busy_r   <= 1'b0;


    end
    else
    begin
        mult_valid_r <= mult_valid_i;
        div_valid_r  <= div_valid_i ;
        rem_valid_r  <= rem_valid_i ;
        rem_busy_r   <= rem_busy_i;
        div_busy_r   <= div_busy_i;

        

    end
end


always@(posedge fwd_clk or negedge fwd_rst)
begin
	if(!fwd_rst)
	begin
		id_ex_rd	        <= 	{GPR_ADDR_WIDTH{1'b0}}		;		
		ex_mem_rd	        <= 	{GPR_ADDR_WIDTH{1'b0}}		;
		mem_wb_rd	        <= 	{GPR_ADDR_WIDTH{1'b0}}		;
		wb_rd 		        <=  {GPR_ADDR_WIDTH{1'b0}}      ;
		id_ex_rs1	        <= 	{GPR_ADDR_WIDTH{1'b0}}		;
		id_ex_rs2	        <= 	{GPR_ADDR_WIDTH{1'b0}}		;
		id_ex_reg_wr_en     <= 	1'd0		                ;
		ex_mem_reg_wr_en    <= 	1'b0 		                ;
		mem_wb_reg_wr_en    <= 	1'b0 		                ;
        wb_reg_wr_en        <=  1'b0                        ;
	end
	else
	begin
        ex_mem_rd	        <=	id_ex_rd	                ;
        mem_wb_rd	        <=	ex_mem_rd	                ;
		wb_rd 		        <= mem_wb_rd                    ;
		ex_mem_reg_wr_en    <= id_ex_reg_wr_en              ;
		mem_wb_reg_wr_en    <=	ex_mem_reg_wr_en            ;
        wb_reg_wr_en        <= mem_wb_reg_wr_en             ;

        if(!stall_pipeline)
        begin
		id_ex_rd	        <=	rd		                    ;
        id_ex_rs1	        <=	rs1		                    ;
        id_ex_rs2	        <=	rs2		                    ;
        id_ex_reg_wr_en     <=	reg_wr_en	                ;
    end
        else if(rem_valid_r || div_valid_r || mult_valid_r || div_busy_i || rem_busy_i)
        begin
        id_ex_rd  		<=id_ex_rd;  
	//	ex_mem_rd 		<=ex_mem_rd;
        id_ex_reg_wr_en 		<= id_ex_reg_wr_en		    ;
     //   ex_mem_reg_wr_en		<= ex_mem_reg_wr_en	    ;	
        end
        else if(rem_busy_r || div_busy_r)
        begin
        id_ex_rd  		<=rd;  
        id_ex_reg_wr_en <=reg_wr_en ;
	//	ex_mem_rd 		<=ex_mem_rd;
     //   ex_mem_reg_wr_en<= ex_mem_reg_wr_en;

        end

    else
    begin
        id_ex_rd            <= {GPR_ADDR_WIDTH{1'b0}}       ;
        id_ex_rs1           <= {GPR_ADDR_WIDTH{1'b0}}       ;
        id_ex_rs2           <= {GPR_ADDR_WIDTH{1'b0}}       ;
        id_ex_reg_wr_en     <= 1'b0                         ;
     end

	end
end

assign rs1_fwd_ex_mem =	((ex_mem_rd != {GPR_ADDR_WIDTH{1'b0}}) && (ex_mem_reg_wr_en == 1'b1)        && (ex_mem_rd == id_ex_rs1)); //alu o/p assigned as data_in1 i/p to alu for the next instruction
assign rs1_fwd_mem_wb = ((mem_wb_rd != {GPR_ADDR_WIDTH{1'b0}}) && (mem_wb_reg_wr_en == 1'b1)        && (mem_wb_rd == id_ex_rs1) && (ex_mem_rd != id_ex_rs1)); //mem o/p as rs1 data to alu
assign rs1_fwd_wb     = ((wb_rd     != {GPR_ADDR_WIDTH{1'b0}}) && (wb_reg_wr_en	    ==	1'b1)       && (wb_rd     == id_ex_rs1));

assign rs2_fwd_ex_mem = ((ex_mem_reg_wr_en == 1'b1       )     && (ex_mem_rd        != 4'b0)        && (ex_mem_rd == id_ex_rs2));//alu o/p as rs2 data to alu
assign rs2_fwd_mem_wb = ((mem_wb_reg_wr_en == 1'b1       )     && (ex_mem_rd        != id_ex_rs2)   && (mem_wb_rd == id_ex_rs2) && (mem_wb_rd != 4'd0));// mem o/p as rs2 data to alu
assign rs2_fwd_wb     = ((wb_rd != {GPR_ADDR_WIDTH{1'b0}})     && (wb_reg_wr_en	    ==	1'b1)       && (wb_rd     == id_ex_rs2));
always@(*)
	begin
		if(rs1_fwd_ex_mem)
		begin
			forward_a = 2'b01   ;
		end
		else if(rs1_fwd_mem_wb)
		begin
			forward_a = 2'b10   ;
		end
		else if(rs1_fwd_wb)
		begin
			forward_a = 2'b11   ;
		end
		else
		begin
			forward_a = 2'b00   ;
		end

	end

always@(*)
	begin
		if(rs2_fwd_ex_mem)
		begin
			forward_b = 2'b01   ;
		end
		else if(rs2_fwd_mem_wb)
		begin
			forward_b = 2'b10   ;
		end
		else if(rs2_fwd_wb)
		begin
			forward_b = 2'b11   ;
		end
		else
		begin
			forward_b = 2'b00   ;
		end

	end

endmodule
