`timescale 1ns / 1ps

`define ZILLA_32_BIT

//`define ZILLA_64_BIT
//`define ZILLA_32_BIT

module z_multiplier#(
    `ifdef ZILLA_64_BIT
    parameter DATA_WIDTH = 64
`elsif ZILLA_32_BIT
    parameter DATA_WIDTH = 32
  `endif
)
(
input                       z_clk   ,
input                       z_rst   ,
input [DATA_WIDTH-1:0]      oper1   ,
input [DATA_WIDTH-1:0]      oper2   ,
output  [(DATA_WIDTH*2)-1:0]  product
);

//wire [DATA_WIDTH-1:0] product_r;


`ifdef ZILLA_64_BIT

wire [DATA_WIDTH-1:0] product_w;
wire [DATA_WIDTH-1:0] product_r;

vedic_64x64 vedic_64x64_inst(
.clk   (z_clk   ),
.rstn  (z_rst   ),
.a_in  (oper1   ),
.b_in  (oper2   ),
.result(product_w )
                        );

assign product_r = product_w;

`elsif ZILLA_32_BIT

wire [DATA_WIDTH-1:0] product_w;
reg [DATA_WIDTH-1:0] product_r;


always@(posedge z_clk or negedge z_rst)
begin
    if(!z_rst)
    begin
        product_r <= {DATA_WIDTH{1'b0}};

    end
    else
    begin
        product_r <= product_w ;
    end
end

 vedic_32x32 vedic_32x32_inst(
 .a_in  (oper1  ),
 .b_in  (oper2  ),
 .result(product_w)
                       );
 `endif

 assign product = product_r ;
 endmodule


