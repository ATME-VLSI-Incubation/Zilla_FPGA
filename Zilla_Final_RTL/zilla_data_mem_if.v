`define ZILLA_32_BIT 
`timescale 1ns / 1ps

module data_mem #(parameter DATA_WIDTH = 64)
(
input 			                    mem_clk				            ,
input           	                mem_rst         		        ,
input                               wdt_reset_i                     ,
input 			                    wr_en				            ,
input 			                    rd_en				            ,
input 	[DATA_WIDTH-1       :0]   	wr_addr				            ,
input   [DATA_WIDTH-1       :0]		rd_addr				            ,
input	[DATA_WIDTH-1       :0]		wr_data				            ,
input   [(DATA_WIDTH>>3)-1  :0]	    byte_en				            ,
input 			                    sign_bit			            ,
input 			                    stall_en			            ,
output reg [DATA_WIDTH-1    :0]  	rd_data				            , //to register file
output	 		                    data_mem_write_en		        , //data memory write enable 
output  [DATA_WIDTH-1       :0]     data_mem_write_addr		        , //data memory write address
output  [DATA_WIDTH-1       :0]     data_mem_write_data		        , //data memory write address
output 			                    data_mem_read_en		        , //data memory read enable
output  [DATA_WIDTH-1       :0]     data_mem_read_addr		        , //data memory read address
input	[DATA_WIDTH-1       :0]     data_mem_read_data		        , //data memory read data
input  [31:0] 		                zic_mmr_read_data_i		        ,
input 			                    zic_mmr_read_en_i 		        ,
output  [(DATA_WIDTH>>3)-1  :0]     data_mem_strobe		            ,
input                               debug_mode_valid_i              ,
output reg   [63:0]                 debug_mem_read_data             , 
input                               debug_mem_read_enable           , 
input                               debug_mem_write_enable          , 
input [63:0]                        debug_mem_read_addr             , 
input [63:0]                        debug_mem_write_addr            , 
input [63:0]                        debug_mem_write_data            , 
input [7:0]                         debug_mem_strobe                ,
output                              debug_mem_read_valid            ,
input                               debug_instr_mem_read_data_valid ,
input  [DATA_WIDTH-1        :0]     debug_instr_mem_read_data       




);					
reg [(DATA_WIDTH>>3)-1:0]       ld_byte_en              ;
reg                             ld_sign_bit             ;
reg                             read_data_sel           ;
wire [DATA_WIDTH-1    :0]       rd_data_r	            ;
wire [7:0]                      byte_en_r               ;
wire                            sign_bit_r              ;
reg                             debug_read_data_valid_r ;
reg                             debug_mode_valid_r      ;
reg [DATA_WIDTH-1:0] 		rd_addr_r;



always@(posedge mem_clk or negedge mem_rst)
begin
    if(!mem_rst)
    begin
        debug_mode_valid_r <= 1'b0;
    end
    else
    begin
        debug_mode_valid_r <= debug_mode_valid_i;
    end
end
//reg rd_addr_r;

assign sign_bit_r           = debug_mode_valid_r    ? 1'b0                  : sign_bit ;
assign data_mem_write_en	= stall_en              ? 1'b0                  : wr_en    ;
assign data_mem_write_addr	= debug_mode_valid_r    ? debug_mem_write_addr  : wr_addr  ;
assign data_mem_write_data	= debug_mode_valid_r    ? debug_mem_write_data  : wr_data  ;
assign data_mem_read_en		= rd_en	  ;	
assign data_mem_read_addr	= debug_mode_valid_r    ? debug_mem_read_addr   : rd_addr  ;
assign data_mem_strobe		=  debug_mode_valid_r   ? debug_mem_strobe      :byte_en   ;
assign rd_data_r 		    = zic_mmr_read_en_i     ? zic_mmr_read_data_i   : data_mem_read_data ;
assign byte_en_r            = debug_mode_valid_r    ? debug_mem_strobe      : byte_en  ;

	always@(posedge mem_clk or negedge mem_rst)
begin
    if(!mem_rst)
    begin
        ld_byte_en              <= {(DATA_WIDTH>>3){1'b0}};//{(DATA_WIDTH>>3){1'b0}}
        ld_sign_bit             <= 1'b0                   ;
	    read_data_sel           <= 1'b0                   ;
    	read_data_sel           <= 1'b0                   ;
        debug_read_data_valid_r <= 1'b0                   ; 
         rd_addr_r <= {DATA_WIDTH{1'b0}};
    end
    else
    begin
        ld_byte_en              <= byte_en_r              ;
        ld_sign_bit             <= sign_bit               ;
	    read_data_sel           <= rd_en                  ;
    	read_data_sel           <= rd_en                  ;
        debug_read_data_valid_r <= debug_mem_read_enable  ;
        rd_addr_r <= rd_addr;


    end
end

`ifdef ZILLA_64_BIT
always@(*)
begin
	case({ld_byte_en,sign_bit})
		9'b000000010://unsigned load byte
		begin
			rd_data = {56'd0,rd_data_r[7:0]}                ;
				end
		9'b000000110://load half word unsigned
		begin
			rd_data = {48'd0,rd_data_r[15:0]}               ;
		end
		9'b000000011://signed lb
		begin
			rd_data = {{56{rd_data_r[7]}},rd_data_r[7:0]}   ;
		
		end
		9'b000011110://load word unsigned
		begin
			rd_data = {{32{1'b0}},rd_data_r[31:0]}          ;
		
		end
		9'b000000111://load half word signed
		begin
			rd_data = {{48{rd_data_r[15]}},rd_data_r[15:0]};
			
		end
		9'b000011111://load word signed
		begin
			rd_data = {{32{rd_data_r[31]}},rd_data_r[31:0]};
		end
		9'b111111110://load double word 
		begin
			rd_data = rd_data_r                             ;
		end
		default:
		begin
		rd_data     = {DATA_WIDTH{1'b0}}                    ;
		end
endcase
end

`elsif ZILLA_32_BIT
always@(*)
begin
	case({ld_byte_en,sign_bit})
		5'b00010://unsigned load byte
		begin
			if(rd_addr_r[1:0] == 2'b00)
			begin
				rd_data = {24'd0,rd_data_r[7:0]};

			end
			else if(rd_addr_r[1:0] == 2'b01)
			begin
				rd_data = {24'd0,rd_data_r[15:8]};

			end
			else if(rd_addr_r[1:0] == 2'b10)
			begin
				rd_data = {24'd0,rd_data_r[23:16]};

			end
			else if(rd_addr_r[1:0] == 2'b11)
			begin
				rd_data = {24'd0,rd_data_r[31:24]};

			end
			else
			begin
				rd_data = {24'd0,rd_data_r[7:0]};

			end
							end
		5'b00110://load half word unsigned
		begin
		//	rd_data = {16'd0,rd_data_r[15:0]};
			if(rd_addr_r[1] == 1'b0)
			begin
				rd_data = {16'd0,rd_data_r[15:0]};
			end
			else
			begin
				rd_data = {16'd0,rd_data_r[31:16]};
			end
		end
		5'b00011://signed lb
		begin
		//	rd_data = {{24{rd_data_r[7]}},rd_data_r[7:0]};
			if(rd_addr_r[1:0] == 2'b00)
			begin
				rd_data = {{24{rd_data_r[7]}},rd_data_r[7:0]};

			end
			else if(rd_addr_r[1:0] == 2'b01)
			begin
				rd_data = {{24{rd_data_r[15]}},rd_data_r[15:8]};

			end
			else if(rd_addr_r[1:0] == 2'b10)
			begin
			rd_data = {{24{rd_data_r[23]}},rd_data_r[23:16]};

			end
			else if(rd_addr_r[1:0] == 2'b11)
			begin
				rd_data = {{24{rd_data_r[31]}},rd_data_r[31:24]};

			end
			else
			begin
				rd_data = {{24{rd_data_r[7]}},rd_data_r[7:0]};
			end

		
		end
		5'b11110://load word unsigned
		begin
			rd_data = {rd_data_r[31:0]};
		
		end
		5'b11111://load word unsigned
		begin
			rd_data = {rd_data_r[31:0]};
		
		end

		5'b00111://load half word signed
		begin
			//rd_data = {{16{rd_data_r[15]}},rd_data_r[15:0]};
			if(rd_addr_r[1] == 0)
			begin
				rd_data = {{16{rd_data_r[15]}},rd_data_r[15:0]};
			end
			else
			begin
				rd_data = {{16{rd_data_r[31]}},rd_data_r[31:16]};
			end

			
		end
	    default:
		begin
		rd_data = {DATA_WIDTH{1'b0}};
		end
endcase
end



`endif


/*`elsif ZILLA_32_BIT
always@(*)
begin
	case({ld_byte_en,sign_bit})
		5'b00010://unsigned load byte
		begin
			rd_data = {24'd0,rd_data_r[7:0]}                ;
				end
		5'b00110://load half word unsigned
		begin
			rd_data = {16'd0,rd_data_r[15:0]}               ;
		end
		5'b00011://signed lb
		begin
			rd_data = {{24{rd_data_r[7]}},rd_data_r[7:0]}   ;
		
		end
		5'b11110://load word unsigned
		begin
			rd_data = {rd_data_r[31:0]}                     ;
		
		end
		5'b11111://load word unsigned
		begin
			rd_data = {rd_data_r[31:0]}                     ;
		
		end

		5'b00111://load half word signed
		begin
			rd_data = {{16{rd_data_r[15]}},rd_data_r[15:0]};
			
		end
	    default:
		begin
		rd_data     = {DATA_WIDTH{1'b0}}                    ;
		end
endcase
end

`endif*/


always@(*)
begin
    if(debug_instr_mem_read_data_valid)
    begin
    debug_mem_read_data         = debug_instr_mem_read_data ;
    end
    else
    begin
        if(debug_mode_valid_i)
            debug_mem_read_data     = rd_data;
        else
            debug_mem_read_data     = 0     ;
    end

end
assign debug_mem_read_valid = debug_read_data_valid_r   || debug_instr_mem_read_data_valid ;
endmodule
