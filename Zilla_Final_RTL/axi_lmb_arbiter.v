
//parameter DATA_WIDTH        = 32 ;

module axi_lmb_arbiter #(parameter DATA_WIDTH = 32)

(
     
input clk,
input rst,

input 			            data_mem_write_en	,		
input 			            data_mem_read_en	,
input 	[3:0] 	       	    data_mem_strobe	,
input 	[DATA_WIDTH-1:0]    data_mem_addr_o	,
input 	[DATA_WIDTH-1:0]    data_mem_write_data	,
output reg [DATA_WIDTH-1:0] data_mem_read_data	,//to data mem if

output reg 		            uart_mem_write_en	,		
output reg                  uart_mem_read_en	,
output reg [3:0] 	        uart_mem_strobe		,
output reg [DATA_WIDTH-1:0] uart_mem_addr_o		,
output reg [DATA_WIDTH-1:0] uart_mem_write_data	,
input  	   [DATA_WIDTH-1:0] uart_mem_read_data	,

input 	   [DATA_WIDTH-1:0] lmb_mem_read_data	,//from lmb memory

output 		            lmb_mem_write_en_o	,
output                  lmb_mem_read_en_o		,
output [3:0] 	        lmb_mem_strobe_o		,
output  [DATA_WIDTH-1:0] lmb_mem_addr_o		,
output [DATA_WIDTH-1:0] lmb_mem_write_data_o	,
output data_mem_write_en_to_stall
	
);

wire [DATA_WIDTH-1:0] read_addr;
wire [DATA_WIDTH-1:0] write_addr;

assign lmb_mem_addr_o = lmb_mem_read_en_o ? read_addr : write_addr;

reg 		            lmb_mem_write_en	;
reg                  lmb_mem_read_en		;
reg [3:0] 	        lmb_mem_strobe		    ;
reg [DATA_WIDTH-1:0] lmb_mem_addr	    ;
reg [DATA_WIDTH-1:0] lmb_mem_write_data	    ;


read_modify_write 
#(.DATA_WIDTH(DATA_WIDTH))
read_modify_write_inst


(

.clk                     (clk),
.rst                     (rst),
.data_mem_write_en		 (lmb_mem_write_en), //from data_mem_if data memory write enable 
.data_mem_write_addr	 (lmb_mem_addr), //from data_mem_if data memory write address
.data_mem_write_data	 (lmb_mem_write_data), //from data_mem_if data memory write address
.data_mem_read_en		 (lmb_mem_read_en), //from data_mem_if data memory read enable
.data_mem_read_addr		 (lmb_mem_addr), //from data_mem_if data memory read address
.data_mem_read_data		 (), //to data_mem_if  data memory read data // no use here
.data_mem_strobe		 (lmb_mem_strobe),
.data_mem_write_en_o     (lmb_mem_write_en_o),
.data_mem_write_data_o   (lmb_mem_write_data_o),
.data_mem_write_addr_o   (write_addr),
.data_mem_strobe_o       (lmb_mem_strobe_o), 
.data_mem_read_en_o      (lmb_mem_read_en_o),
.data_mem_read_addr_o    (read_addr),
.data_mem_read_data_i    (lmb_mem_read_data),
.data_mem_write_en_to_stall(data_mem_write_en_to_stall) //to stall pipeline
);






reg uart_valid;
reg lmb_valid;

reg uart_valid_reg;
reg lmb_valid_reg;
always@(*)
begin
	if(data_mem_addr_o <= {{DATA_WIDTH-20{1'b0}},20'h47fff})
	begin

		lmb_mem_write_en	= data_mem_write_en  ;			
		lmb_mem_read_en		= data_mem_read_en   ;	
		lmb_mem_strobe		= data_mem_strobe    ;
		lmb_mem_addr		= data_mem_addr_o    ;
		lmb_mem_write_data	= data_mem_write_data;
		lmb_valid              = 1'b1;
		uart_valid 	       = 1'b0;
	//	lmb_mem_read_data	= ;
		uart_mem_write_en	= 1'b0 			;  	
                uart_mem_read_en	= 1'b0 			;
                uart_mem_strobe		= 4'd0 			;	
                uart_mem_addr_o		= {DATA_WIDTH{1'b0}} 	;
              //  uart_mem_addr_o		= {DATA_WIDTH{1'b0}} 	;
                uart_mem_write_data	= {DATA_WIDTH{1'b0}} 	;

                //uart_mem_read_data	= 0 ;

	end
	else
	begin
		lmb_mem_write_en	= 1'b0 		    ;			
		lmb_mem_read_en		= 1'b0 		    ;	
		lmb_mem_strobe		= 4'd0 		    ;
		lmb_mem_addr		= {DATA_WIDTH{1'b0}};
		//lmb_mem_addr_o		= {DATA_WIDTH{1'b0}};
		lmb_mem_write_data	= {DATA_WIDTH{1'b0}};
	//	lmb_mem_read_data	= ;
		uart_mem_write_en	= data_mem_write_en  ;  	
                uart_mem_read_en	= data_mem_read_en   ;
                uart_mem_strobe		= data_mem_strobe    ;	
                uart_mem_addr_o		= data_mem_addr_o    ;
                //uart_mem_addr_o		= data_mem_addr_o    ;
                uart_mem_write_data	= data_mem_write_data;
		uart_valid		= 1'b1;
		lmb_valid 		= 1'b0;
               // uart_mem_read_data	= ;



	end

end

always@(posedge clk or negedge rst)
begin
	if(!rst)
	begin
		uart_valid_reg <= 1'b0;
		lmb_valid_reg <= 1'b0;
	end
	else
	begin
		uart_valid_reg <= uart_valid;
		lmb_valid_reg <= lmb_valid;

	end
end


always@(*)
begin
	if(lmb_valid_reg)
	begin
		data_mem_read_data = lmb_mem_read_data;
	end
	else if(uart_valid_reg)
	begin
		data_mem_read_data = uart_mem_read_data;
	end
	else
	begin
		data_mem_read_data = {DATA_WIDTH{1'b0}};
	end
end

endmodule




module read_modify_write
#(parameter DATA_WIDTH = 32)
(

input                           clk                     ,
input                           rst                     ,
input	 	                    data_mem_write_en		, //from data_mem_if data memory write enable 
input  [DATA_WIDTH-1:0] 	    data_mem_write_addr		, //from data_mem_if data memory write address
input  [DATA_WIDTH-1:0] 	    data_mem_write_data		, //from data_mem_if data memory write address
input 		                    data_mem_read_en		, //from data_mem_if data memory read enable
input  [DATA_WIDTH-1:0]         data_mem_read_addr		, //from data_mem_if data memory read address
output	[DATA_WIDTH-1:0]        data_mem_read_data		, //to data_mem_if  data memory read data
input  [(DATA_WIDTH>>3)-1:0] 	data_mem_strobe			,

output reg                         data_mem_write_en_o     ,
output reg [DATA_WIDTH-1:0]     data_mem_write_data_o   ,
output reg [DATA_WIDTH-1:0]     data_mem_write_addr_o   ,
output reg [(DATA_WIDTH>>3)-1:0] data_mem_strobe_o  , 
output                          data_mem_read_en_o      ,
output [DATA_WIDTH-1:0]         data_mem_read_addr_o    ,
input  [DATA_WIDTH-1:0]         data_mem_read_data_i    ,
output                    data_mem_write_en_to_stall //to stall pipeline
);

reg data_mem_write_en_r;
reg [(DATA_WIDTH>>3)-1:0] data_mem_strobe_r;
reg [DATA_WIDTH-1:0] data_mem_write_data_r;             
reg [DATA_WIDTH-1:0] data_mem_write_addr_r;



assign data_mem_write_en_to_stall =  data_mem_write_en;
assign data_mem_read_en_o = data_mem_write_en ? 1'b1 : data_mem_read_en;
assign data_mem_read_data = data_mem_read_data_i ;
assign data_mem_read_addr_o = data_mem_write_en ? {data_mem_write_addr[(DATA_WIDTH-1):2],2'b00} : data_mem_read_addr;

always@(posedge clk or negedge rst)
begin
    if(!rst)
    begin
        data_mem_write_en_r <= 1'b0;
        data_mem_strobe_r <= 0;
        data_mem_write_addr_o <= 0;
        data_mem_write_data_r <= 0;
        data_mem_write_addr_r <= 0;
    end
    else
    begin
        data_mem_write_en_r <= data_mem_write_en ;
        data_mem_strobe_r <= data_mem_strobe;
        data_mem_write_addr_o <= {data_mem_write_addr[(DATA_WIDTH-1):2],2'b00};
        data_mem_write_data_r <= data_mem_write_data;
        data_mem_write_addr_r <= data_mem_write_addr;
    end
end

always@(*)
begin
    if(data_mem_write_en_r)
    begin
        case(data_mem_strobe_r)
            4'b0001:
            begin
                if(data_mem_write_addr_r[1:0] == 2'b00)
                begin
                    data_mem_write_data_o = {data_mem_read_data_i[(DATA_WIDTH-1):8],data_mem_write_data_r[7:0]};
                    data_mem_write_en_o = 1'b1;
                    data_mem_strobe_o = 4'b1111;
                end
                else if((data_mem_write_addr_r[1:0] == 2'b01))
                begin
                    data_mem_write_data_o = {data_mem_read_data_i[(DATA_WIDTH-1):16],data_mem_write_data_r[7:0],data_mem_read_data_i[7:0]};
                    data_mem_write_en_o = 1'b1;
                    data_mem_strobe_o = 4'b1111;


                end
                else if((data_mem_write_addr_r[1:0] == 2'b10))
                begin
                    data_mem_write_data_o = {data_mem_read_data_i[(DATA_WIDTH-1):24],data_mem_write_data_r[7:0],data_mem_read_data_i[15:0]};
                    data_mem_write_en_o = 1'b1;
                    data_mem_strobe_o = 4'b1111;


                end
                else
                begin
                    data_mem_write_data_o = {data_mem_write_data_r[7:0],data_mem_read_data_i[23:0]};
                    data_mem_write_en_o = 1'b1;
                    data_mem_strobe_o = 4'b1111;


                end

            end
            4'b0011:
            begin
                if(data_mem_write_addr_r[1:0] ==2'b00)
                begin
                     data_mem_write_data_o = {data_mem_read_data_i[(DATA_WIDTH-1):16],data_mem_write_data_r[15:0]};
                     data_mem_write_en_o = 1'b1;
                     data_mem_strobe_o = 4'b1111;

                end
                else if(data_mem_write_addr_r[1:0] == 2'b10)
                begin
                    data_mem_write_data_o = {data_mem_write_data_r[15:0],data_mem_read_data_i[15:0]};
                    data_mem_write_en_o = 1'b1;
                    data_mem_strobe_o = 4'b1111;

                end
                else
                begin
                     data_mem_write_data_o = data_mem_read_data_i;
                     data_mem_write_en_o = 1'b0;
                     data_mem_strobe_o = 4'b0000;

                end
            end
            4'b1111:
            begin
                    data_mem_write_data_o = data_mem_write_data_r ;
                    data_mem_write_en_o = 1'b1;
                    data_mem_strobe_o = 4'b1111;

            end
            default:
            begin
                    data_mem_write_data_o = data_mem_read_data_i ;
                    data_mem_write_en_o = 1'b0;
                    data_mem_strobe_o = 4'b0000;


            end

        endcase
    end
    else
    begin
                    data_mem_write_data_o = data_mem_read_data_i ;
                    data_mem_write_en_o = 1'b0;
                    data_mem_strobe_o = 4'b0000;



    end

end





endmodule


