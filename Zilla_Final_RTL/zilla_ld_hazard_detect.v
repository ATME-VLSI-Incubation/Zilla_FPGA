`define ZILLA_32_BIT 
`timescale 1ns / 1ps
//load hazard detection unit
//
//
//////////////////////////

module load_hazard_ctrl
#(
parameter GPR_ADDR_WIDTH = 0
)
(
input 		ld_hz_ctrl_clk	,
input 		ld_hz_ctrl_rst	,
input                               wdt_reset_i     ,
input 		id_ex_mem_rd_en	,
input [GPR_ADDR_WIDTH-1:0]	id_ex_rd	,
input [GPR_ADDR_WIDTH-1:0]	if_id_rs1	,
input [GPR_ADDR_WIDTH-1:0]	if_id_rs2	,
//input [6:0] 	opcode		,
output 	reg	stall_pipeline  ,
output      stall_en,
input       mult_valid_i,
input       div_valid_i,
input       rem_valid_i,
input       div_busy_i,
input       rem_busy_i,
input uart_mem_read_en,
input dm_ar_valid_out,
input data_mem_write_en_to_stall,
input uart_read_stall 

);
reg div_valid_r;
reg mult_valid_r;
reg rem_valid_r;
reg mult_valid_r1;

reg div_busy_r;
reg div_busy_r1;

reg rem_busy_r;
reg rem_busy_r1;
reg uart_mem_read_en_r;
reg data_mem_write_en_to_stall_r;

//reg uart_mem_read_en_r1;
//reg uart_mem_read_en_r2;
//reg uart_mem_read_en_r3;
//reg uart_mem_read_en_r4;
//reg uart_mem_read_en_r5;
//reg uart_mem_read_en_r6;




//wire stall_en;
assign stall_en = (data_mem_write_en_to_stall ||  rem_valid_r || uart_mem_read_en  || uart_read_stall || dm_ar_valid_out || div_valid_r || div_busy_i ||div_busy_r || div_busy_r1 || rem_busy_r || rem_busy_r1 || rem_busy_i || div_valid_i || rem_valid_i ||mult_valid_r1 ||  mult_valid_r || mult_valid_i || ((id_ex_rd!={GPR_ADDR_WIDTH{1'b0}})&&(id_ex_mem_rd_en) && ((id_ex_rd == if_id_rs1) || (id_ex_rd == if_id_rs2)))) ? 1'b1 : 1'b0;

//assign stall_en  = ((id_ex_mem_rd_en) && ((id_ex_rd == if_id_rs1) || (id_ex_rd == if_id_rs2)));

always@(posedge ld_hz_ctrl_clk or negedge ld_hz_ctrl_rst)
begin
	if(!ld_hz_ctrl_rst)
	begin
		stall_pipeline <= 1'd0;
        div_valid_r <= 1'b0;
        mult_valid_r <= 1'b0;
        rem_valid_r <= 1'b0;
        mult_valid_r1 <= 1'b0;
        div_busy_r      <= 1'b0;
        div_busy_r1     <= 1'b0;
        rem_busy_r      <= 1'b0;
        rem_busy_r1     <= 1'b0;
        uart_mem_read_en_r <= 1'b0 ;
        //uart_mem_read_en_r1 <= 1'b0;
        data_mem_write_en_to_stall_r <= 1'b0;
        //uart_mem_read_en_r2 <= 1'b0;
        //uart_mem_read_en_r3 <= 1'b0;
        //uart_mem_read_en_r4 <= 1'b0;
        //uart_mem_read_en_r5 <= 1'b0;
        //uart_mem_read_en_r6 <= 1'b0;
        




	end
    else if(wdt_reset_i)
    begin
    	stall_pipeline <= 1'd0;
    end
	else
	begin
        div_valid_r <= div_valid_i;
        mult_valid_r <= mult_valid_i;
        rem_valid_r <= rem_valid_i;
        mult_valid_r1 <= mult_valid_r;
        div_busy_r <= div_busy_i;
        div_busy_r1 <= div_busy_r;
        rem_busy_r <= rem_busy_i;
        rem_busy_r1 <= rem_busy_r;
        uart_mem_read_en_r <= uart_mem_read_en;
        //uart_mem_read_en_r1 <= uart_mem_read_en_r;
        data_mem_write_en_to_stall_r <= data_mem_write_en_to_stall;
        //uart_mem_read_en_r2 <= uart_mem_read_en_r1;
        //uart_mem_read_en_r3 <= uart_mem_read_en_r2;
        //uart_mem_read_en_r4 <= uart_mem_read_en_r3;
        //uart_mem_read_en_r5 <= uart_mem_read_en_r4;
        //uart_mem_read_en_r6 <= uart_mem_read_en_r5;

		if(data_mem_write_en_to_stall || rem_valid_r || uart_mem_read_en || uart_read_stall|| dm_ar_valid_out || div_valid_r || div_busy_i ||div_busy_r || div_busy_r1 || rem_busy_r || rem_busy_r1 || rem_busy_i || div_valid_i || rem_valid_i ||mult_valid_r1 ||  mult_valid_r || mult_valid_i ||((id_ex_rd!={GPR_ADDR_WIDTH{1'b0}})&&(id_ex_mem_rd_en) && ((id_ex_rd == if_id_rs1) || (id_ex_rd == if_id_rs2))))
		begin
			stall_pipeline <= 1'b1;
		end
		else
		begin
			stall_pipeline <= 1'b0;
		end
	end
end

/*always@(*)
begin

		if(((id_ex_mem_rd_en) && ((id_ex_rd == if_id_rs1) || (id_ex_rd == if_id_rs2))))
		begin
			stall_pipeline = 1'b1;
		end
		else
		begin
			stall_pipeline = 1'b0;
		end
end*/

//assign stall_pipeline = 1'b0;//((id_ex_mem_rd_en) && ((id_ex_rd == if_id_rs1) || (id_ex_rd == if_id_rs2)))? 1'b1: 1'b0;
endmodule
