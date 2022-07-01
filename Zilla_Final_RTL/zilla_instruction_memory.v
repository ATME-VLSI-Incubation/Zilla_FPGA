`define ZILLA_32_BIT 
`timescale 1ns / 1ps
/////////////////////////
//
//instruction memory
//
////////////////////////

module instruction_memory
#(
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0,
parameter DATA_WIDTH        = 0
)
(
input 				        im_clk			        ,
input 				        im_rst		    	    ,
input                               wdt_reset_i     ,
input 				        instruction_read_en_i	,//from program control logic
input 	[PC_WIDTH-1:0]		instruction_read_addr_i ,//from program control logic
output  [INSTRUCTION_WIDTH-1:0] 	        instruction_o 	        ,	 //to decode stage
input                      debug_mode_valid_i      ,
input                       debug_mode_reset_i      ,
input                       debug_ndm_reset_i       ,
output z_im_write_en_o		,
output [19:0] z_im_write_addr_o	,
output [DATA_WIDTH-1:0] z_im_write_data_o	,
output [(DATA_WIDTH>>3)-1:0] z_im_write_data_strobe_o	,
output z_im_read_en_o		,
output [19:0] z_im_read_addr_o		,
input  [DATA_WIDTH-1:0] z_im_read_data_i ,

output [DATA_WIDTH-1:0]                debug_mem_read_data     , 
input                       debug_mem_read_enable   ,
input                       debug_mem_write_enable  ,
input  [DATA_WIDTH-1:0]                     debug_mem_read_addr     ,
input  [DATA_WIDTH-1:0]                     debug_mem_write_addr    ,
input  [DATA_WIDTH-1:0]                     debug_mem_write_data    ,
input  [(DATA_WIDTH>>3)-1:0]                 debug_mem_strobe      ,
input                                       instr_mem_access_valid      ,
output reg debug_instr_mem_read_data_valid

);

//wire [INSTRUCTION_WIDTH-1:0] instruction_read_addr_w ;
//assign instruction_read_addr_w = instruction_read_addr_i  ;
assign z_im_write_en_o			= (debug_mode_valid_i && instr_mem_access_valid )? debug_mem_write_enable : 0;
assign z_im_write_addr_o		= (debug_mode_valid_i && instr_mem_access_valid )? debug_mem_write_addr : 0;
assign z_im_write_data_o		= (debug_mode_valid_i && instr_mem_access_valid )? debug_mem_write_data :0;
assign z_im_write_data_strobe_o	= debug_mem_strobe      ;
assign z_im_read_en_o			= (debug_mode_valid_i && instr_mem_access_valid) ? debug_mem_read_enable  : instruction_read_en_i;
assign z_im_read_addr_o			= debug_mode_valid_i ? debug_mem_read_addr : instruction_read_addr_i;
assign instruction_o			= z_im_read_data_i[31:0]	;
assign debug_mem_read_data = z_im_read_data_i ;
//assign debug_instr_mem_read_data_valid = 0;

always@(posedge im_clk or negedge im_rst)
begin
    if(!im_rst)
    begin
        debug_instr_mem_read_data_valid <= 1'b0;
    end
    else
    begin
        debug_instr_mem_read_data_valid <= (debug_mem_read_enable && instr_mem_access_valid);
    end
end
endmodule
/*instr_mem 
#(
.INSTRUCTION_WIDTH(INSTRUCTION_WIDTH),
.PC_WIDTH(PC_WIDTH),
.DATA_WIDTH(DATA_WIDTH)
)
instr_mem_inst
(
.clk			        (im_clk			        ),
.rst			        (im_rst			        ),
.instruction_read_en_i  (instruction_read_en_i	),
.instruction_read_addr_i(instruction_read_addr_w),
.instruction_o		    (instruction_o	        ),
.debug_mode_valid_i     (debug_mode_valid_i     ),
.debug_mode_reset_i     (dbg_hart_only_rst_i    ),
.debug_ndm_reset_i      (dbg_ndmrst_i           ),
.debug_mem_read_data            (debug_mem_read_data    ),
.debug_mem_read_enable          (debug_mem_read_enable  ),
.debug_mem_write_enable         (debug_mem_write_enable ),
.debug_mem_read_addr            (debug_mem_read_addr    ),
.debug_mem_write_addr           (debug_mem_write_addr   ),
.debug_mem_write_data           (debug_mem_write_data   ),
.debug_mem_strobe               (debug_mem_strobe       ),
.instr_mem_access_valid         (instr_mem_access_valid),
.debug_instr_mem_read_data_valid(debug_instr_mem_read_data_valid)


);*/

//endmodule
/*
module instr_mem
#(
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0,
parameter DATA_WIDTH        =0 
)

(
input 			    clk			            ,
input 			    rst			            ,
input 			    instruction_read_en_i	,
input 	   [PC_WIDTH-1:0]	instruction_read_addr_i ,
output reg [31:0] 	instruction_o	        ,
//output reg [INSTRUCTION_WIDTH-1:0] 	instruction_o	        ,
input               debug_mode_valid_i      ,
input               debug_mode_reset_i      ,
input               debug_ndm_reset_i         ,
output reg [DATA_WIDTH-1:0]                debug_mem_read_data     , 
output reg                                  debug_instr_mem_read_data_valid,
input                       debug_mem_read_enable   ,
input                       debug_mem_write_enable  ,
input  [DATA_WIDTH-1:0]                     debug_mem_read_addr     ,
input  [DATA_WIDTH-1:0]                     debug_mem_write_addr    ,
input  [DATA_WIDTH-1:0]                     debug_mem_write_data    ,
input  [(DATA_WIDTH>>3)-1:0]                 debug_mem_strobe   ,
input                                       instr_mem_access_valid


);
wire [PC_WIDTH-1:0] instruction_read_addr_w;
//localparam INSTRUCTION_MEM_DEPTH = 262144;
//reg [31:0] INST_MEM [32767:0];
//reg [7:0] INST_MEM [131071:0];
//reg [7:0] INST_MEM_1 [31:0];
//wire [INSTRUCTION_WIDTH-1:0] instruction;
reg [7:0] INST_MEM [294911:32768];//256kb 
wire [63:0] instruction;

assign instruction_read_addr_w = debug_mode_valid_i ? debug_mem_read_addr : instruction_read_addr_i;
always@(posedge clk)
begin
    if(debug_mode_valid_i && instr_mem_access_valid)
    begin
        if(debug_mem_write_enable)
        begin
            INST_MEM[debug_mem_write_addr] <= debug_mem_write_data [7:0] ;
            INST_MEM[debug_mem_write_addr+1] <= debug_mem_write_data [15:8] ;
            INST_MEM[debug_mem_write_addr+2] <= debug_mem_write_data [23:16] ;
            INST_MEM[debug_mem_write_addr+3] <= debug_mem_write_data [31:24] ;
            INST_MEM[debug_mem_write_addr+4] <= debug_mem_write_data [39:32] ;
            INST_MEM[debug_mem_write_addr+5] <= debug_mem_write_data [47:40] ;
            INST_MEM[debug_mem_write_addr+6] <= debug_mem_write_data [55:48] ;
            INST_MEM[debug_mem_write_addr+7] <= debug_mem_write_data [63:56] ;
            

        end
    end
end

//assign instruction = {INST_MEM[instruction_read_addr_w+3],INST_MEM[instruction_read_addr_w+2],INST_MEM[instruction_read_addr_w+1],INST_MEM[instruction_read_addr_w]};
assign instruction = {INST_MEM[instruction_read_addr_w+7],INST_MEM[instruction_read_addr_w+6],INST_MEM[instruction_read_addr_w+5],INST_MEM[instruction_read_addr_w+4],INST_MEM[instruction_read_addr_w+3],INST_MEM[instruction_read_addr_w+2],INST_MEM[instruction_read_addr_w+1],INST_MEM[instruction_read_addr_w]};


always@(posedge clk)
begin	
	if((!debug_mode_valid_i) & instruction_read_en_i)
	begin
	//instruction_o <= instruction;
    instruction_o <=  instruction[31:0];
    debug_instr_mem_read_data_valid <= 0 ;
	end
    else if(debug_mode_valid_i && debug_mem_read_enable && instr_mem_access_valid)
    begin
        debug_mem_read_data <= instruction ;
        debug_instr_mem_read_data_valid <= 1 ;

    end
    else
    begin
                debug_mem_read_data <= 64'd0 ;
        debug_instr_mem_read_data_valid <= 0 ;

    end
end
endmodule*/
