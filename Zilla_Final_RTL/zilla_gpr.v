`define ZILLA_32_BIT 
`timescale 1ns / 1ps
//risc-v 
//register file
//	32 		registers  
//	64bit 		width
//////////////address lines ////////////////////////
//	rs1		source register 1 address
//	rs2 		source register 2 address
//	rd 		destination register address
//
/////////////data lines ////////////////////////////
//	wr_data		input data to the register
//	rs1_data	read data from rs1 reg
//	rs2_data	read data from rs2 reg
//
/////////////control lines///////////////////////
//
//
//
//
//////////////////////////////////////////////////

module reg_file #(parameter DATA_WIDTH     = 0,
                  parameter GPR_ADDR_WIDTH = 0
                  )
(
input 			                    reg_clk		                ,
input 			                    wr_data_en	                ,
input  	      [GPR_ADDR_WIDTH-1:0]	rs1		                    ,
input  	      [GPR_ADDR_WIDTH-1:0]	rs2		                    ,
input  	      [GPR_ADDR_WIDTH-1:0]	rd		                    ,
input  	      [DATA_WIDTH-1    :0]	wr_data		                ,
output reg    [DATA_WIDTH-1    :0]	rs1_data	                ,
output	      [DATA_WIDTH-1    :0] 	rs1_data_r	                ,
output	      [DATA_WIDTH-1    :0]	rs2_data_r	                ,
output reg    [DATA_WIDTH-1    :0]	rs2_data                    ,
input                               dbg_mode_valid_i            ,      
input                               dbg_mode_write_en_i         , 
input         [DATA_WIDTH-1    :0]  dbg_mode_write_data_i       ,
input         [15:0]                dbg_mode_gpr_addr_i         ,
input                               dbg_mode_read_en_i          ,
output        [DATA_WIDTH-1    :0]  dbg_mode_gpr_read_data_o    ,
output                              dbg_gpr_read_valid_o        ,
input                               dbg_ndm_reset_i             ,
input                               dbg_hart_reset              ,
output [DATA_WIDTH-1:0] 	    gpr_15_out		,
output [DATA_WIDTH-1:0] 	    gpr_a0_out,			
output [DATA_WIDTH-1:0] 	    gpr_a1_out,			
output [DATA_WIDTH-1:0] 	    gpr_a2_out,			
output [DATA_WIDTH-1:0] 	    gpr_a3_out,			
output [DATA_WIDTH-1:0] 	    gpr_a4_out,			
output [DATA_WIDTH-1:0] 	    gpr_a5_out,			
output [DATA_WIDTH-1:0] 	    gpr_s0_out,			
output [DATA_WIDTH-1:0] 	    gpr_ra_out,			
output [DATA_WIDTH-1:0] 	    gpr_sp_out,
output [DATA_WIDTH-1:0] 	    gpr_t0_out,			
output [DATA_WIDTH-1:0] 	    gpr_t1_out,			
output [DATA_WIDTH-1:0] 	    gpr_t2_out,
output [DATA_WIDTH-1:0] 	    gpr_t3_out,
output [DATA_WIDTH-1:0] 	    gpr_t4_out,
input [4:0] 		uart_rd		,
	  input 			uart_rd_valid	,
	  input  [DATA_WIDTH-1:0] 	uart_data	


	
);
wire                        wr_en		;
wire [GPR_ADDR_WIDTH-1:0]   rd_addr1 	;
wire [GPR_ADDR_WIDTH-1:0]   rd_addr2	;
wire [GPR_ADDR_WIDTH-1:0]   wr_addr	    ;
wire [DATA_WIDTH-1:0] wr_data_r;


assign wr_en 	= uart_rd_valid ? 1'b1 :wr_data_en	;
assign rd_addr1 = rs1			; // source register-1 address
assign rd_addr2 = rs2			; // source register-2 address 
assign wr_addr	= uart_rd_valid ? uart_rd : rd			; //destination register address
assign wr_data_r = uart_rd_valid ? uart_data : wr_data;




always@(posedge reg_clk)
begin
	rs1_data <= rs1_data_r;
	rs2_data <= rs2_data_r;
end

dp_ram #(.DATA_WIDTH(DATA_WIDTH),
           .GPR_ADDR_WIDTH(GPR_ADDR_WIDTH))
dp_ram_inst
(
.ram_clk	                (reg_clk	            ),     	
.wr_en		                (wr_en		            ),
.rd_addr1	                (rd_addr1	            ),
.rd_addr2	                (rd_addr2	            ),
.wr_addr	                (wr_addr	            ),
.datain		                (wr_data_r	            ),
.dataout1	                (rs1_data_r	            ),
.dataout2	                (rs2_data_r	            ),
.dbg_mode_valid_i           (dbg_mode_valid_i       ),
.dbg_mode_write_en_i        (dbg_mode_write_en_i    ),
.dbg_mode_write_data_i      (dbg_mode_write_data_i  ),
.dbg_mode_gpr_addr_i        (dbg_mode_gpr_addr_i    ),
.dbg_mode_read_en_i         (dbg_mode_read_en_i     ),
.dbg_mode_gpr_read_data_o   (dbg_mode_gpr_read_data_o),
.dbg_gpr_read_valid_o       (dbg_gpr_read_valid_o    ),
.gpr_a0_out(gpr_a0_out),			
.gpr_a1_out(gpr_a1_out),			
.gpr_a2_out(gpr_a2_out),			
.gpr_a3_out(gpr_a3_out),			
.gpr_a4_out(gpr_a4_out),			
.gpr_a5_out(gpr_a5_out),			
.gpr_s0_out(gpr_s0_out),			
.gpr_ra_out(gpr_ra_out),			
.gpr_sp_out(gpr_sp_out),
.gpr_t0_out(gpr_t0_out),	
.gpr_t1_out(gpr_t1_out),
.gpr_t2_out(gpr_t2_out),
.gpr_t3_out(gpr_t3_out),
.gpr_t4_out(gpr_t4_out)

);
endmodule


module dp_ram #(parameter DATA_WIDTH     = 0,
                  parameter GPR_ADDR_WIDTH = 0
                  )
(
input 			                    ram_clk		                ,
input 			                    wr_en		                ,
input 	    [GPR_ADDR_WIDTH-1:0] 	rd_addr1	                ,
input 	    [GPR_ADDR_WIDTH-1:0] 	rd_addr2	                ,
input 	    [GPR_ADDR_WIDTH-1:0]	wr_addr		                ,
input 	    [DATA_WIDTH-1    :0] 	datain		                ,
output      [DATA_WIDTH-1    :0] 	dataout1	                ,
output      [DATA_WIDTH-1    :0] 	dataout2	                ,
input                               dbg_mode_valid_i            ,      
input                               dbg_mode_write_en_i         , 
input       [DATA_WIDTH-1    :0]    dbg_mode_write_data_i       ,
input       [15:0]                  dbg_mode_gpr_addr_i         ,
input                               dbg_mode_read_en_i          ,
output      [DATA_WIDTH-1    :0]    dbg_mode_gpr_read_data_o    ,
output                              dbg_gpr_read_valid_o        ,
input                               dbg_ndm_reset_i             ,
input                               dbg_hart_reset              ,
output [DATA_WIDTH-1:0] 	    gpr_15_out		,
output [DATA_WIDTH-1:0] 	    gpr_a0_out,			
output [DATA_WIDTH-1:0] 	    gpr_a1_out,			
output [DATA_WIDTH-1:0] 	    gpr_a2_out,			
output [DATA_WIDTH-1:0] 	    gpr_a3_out,			
output [DATA_WIDTH-1:0] 	    gpr_a4_out,			
output [DATA_WIDTH-1:0] 	    gpr_a5_out,			
output [DATA_WIDTH-1:0] 	    gpr_s0_out,			
output [DATA_WIDTH-1:0] 	    gpr_ra_out,			
output [DATA_WIDTH-1:0] 	    gpr_sp_out,
output [DATA_WIDTH-1:0] 	    gpr_t0_out,			
output [DATA_WIDTH-1:0] 	    gpr_t1_out,			
output [DATA_WIDTH-1:0] 	    gpr_t2_out,
output [DATA_WIDTH-1:0] 	    gpr_t3_out,
output [DATA_WIDTH-1:0] 	    gpr_t4_out







);
wire dbg_gpr_access_valid;

assign dbg_gpr_access_valid = (dbg_mode_gpr_addr_i[12] == 1'b1) ? 1'b1 : 1'b0 ;
reg [DATA_WIDTH-1:0] regfile [31:0];

always@(posedge ram_clk)
begin
    if(dbg_mode_valid_i && dbg_mode_write_en_i && dbg_gpr_access_valid)
    begin
        regfile[dbg_mode_gpr_addr_i[GPR_ADDR_WIDTH-1:0]] <= dbg_mode_write_data_i ;
    end
	else if(wr_en)
	begin
		regfile[wr_addr] <= datain;
	end
end
assign gpr_a0_out = regfile[5'd10];
assign gpr_a1_out = regfile[5'd11];
assign gpr_a2_out = regfile[5'd12];
assign gpr_a3_out = regfile[5'd13];
assign gpr_a4_out = regfile[5'd14];
assign gpr_a5_out = regfile[5'd15];
assign gpr_s0_out = regfile[5'd8];
assign gpr_ra_out = regfile[5'd1];
assign gpr_sp_out = regfile[5'd2];
assign gpr_t0_out =regfile[5];	
assign gpr_t1_out =regfile[6];
assign gpr_t2_out =regfile[7];
assign gpr_t3_out =regfile[28];
assign gpr_t4_out = regfile[29];

assign dataout1                 = (rd_addr1)? regfile[rd_addr1]:{DATA_WIDTH{1'b0}}; // source address points to zeroth (x0) register then zero should be returned as x0 is always zero 
assign dataout2                 = (rd_addr2)? regfile[rd_addr2]:{DATA_WIDTH{1'b0}}; //register x0 is hardwired to zero
assign dbg_mode_gpr_read_data_o = (dbg_mode_valid_i && dbg_mode_read_en_i && dbg_gpr_access_valid) ? regfile[dbg_mode_gpr_addr_i[GPR_ADDR_WIDTH-1:0]]:64'd0;
assign dbg_gpr_read_valid_o     = (dbg_mode_valid_i && dbg_mode_read_en_i && dbg_gpr_access_valid) ? 1'b1 : 1'b0 ;
endmodule
