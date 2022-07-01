`define ZILLA_32_BIT 
`timescale 1ns / 1ps
//interrupt request generator
//recieves the highest pending interrupt from priority resolve block
//compares the highest pending interrupt with current serving interrupt level
//if highest pending interrupt hs sufficient priority, then request will be generated


module zic_irg
(
input 		zic_clk				        ,
input 		zic_rst				        ,
input       wdt_reset_i                 ,
input [7:0] highest_pending_lvl_pr_i	,//from zic_pr block
input 		highest_pending_lvl_pr_valid,
input [7:0] highest_pending_int_id_i    ,
input [7:0] active_lvl_pr_i 	    	,//from CSR
output 		interrupt_request_o	    	,//to core
output [7:0]interrupt_id_o		    	,//to zic_ack_mmr
output	   	interrupt_id_valid_o	    ,//to zic_ack_mmr
input		zic_eoi_valid			    , //end of interrupt signal from core
input           debug_mode_valid_i          ,
input           debug_mode_reset_i          ,
input           debug_ndm_reset_i             



);

wire pending_irq_valid;
reg [7:0] highest_pending_lvl_pr_r;

always@(posedge zic_clk or negedge zic_rst)
begin
	if(!zic_rst)
	begin
		highest_pending_lvl_pr_r <= 8'd0;
	end
    else if(wdt_reset_i)
    begin
        highest_pending_lvl_pr_r <= 8'd0;
    end
	else
	begin
		highest_pending_lvl_pr_r <= highest_pending_lvl_pr_i;
	end
end

assign pending_irq_valid = highest_pending_lvl_pr_i ^ highest_pending_lvl_pr_r ;

//wire [7:0] highest_pending_lvl_pr_w;
//assign highest_pending_lvl_pr_w = pending_irq_valid ? highest_pending_lvl_pr_i : 8'd0 ;

reg sufficient_level_valid;

always@(*)
begin
	if(highest_pending_lvl_pr_i[7:5] > active_lvl_pr_i[7:5])
	begin
		sufficient_level_valid = 1'b1 ;
	end
	else
	begin
		sufficient_level_valid = 1'b0 ;
	end
end

wire interrupt_pending_w;
assign interrupt_pending_w = (highest_pending_lvl_pr_i != 0) 				  ? 1'b1 	   : 1'b0;
//assign interrupt_request_o = (sufficient_level_valid | (zic_eoi_valid && interrupt_pending_w ))? 1'b1 	   : 1'b0;
//assign interrupt_id_o	   = (sufficient_level_valid | (zic_eoi_valid && interrupt_pending_w ))? highest_pending_int_id_i: 8'd0;
//assign interrupt_id_valid_o= (sufficient_level_valid | (zic_eoi_valid && interrupt_pending_w ))? 1'b1 	   : 1'b0;
assign interrupt_request_o = (sufficient_level_valid && (!debug_mode_valid_i) )? 1'b1 	   : 1'b0;
assign interrupt_id_o	   = (sufficient_level_valid )? highest_pending_int_id_i: 8'd0;
assign interrupt_id_valid_o= (sufficient_level_valid )? 1'b1 	   : 1'b0;





endmodule


