`define ZILLA_32_BIT 
`timescale 1ns / 1ps
// multiplexer
//
////////////


module mux2x1 #(parameter DATA_WIDTH = 64)
(
input  [DATA_WIDTH-1:0]  		in1			,//from memory
input  [DATA_WIDTH-1:0]  		in2			,//from alu
input  [DATA_WIDTH-1:0]  		csr_read_data_i		,//from csr
input  	       		csr_read_data_valid 	,	
input 	       		sel			,
output reg [DATA_WIDTH-1:0]  	out			

);

always@(*)
begin
	if(sel)
	begin
		out = in1 ;
	end
	else if(csr_read_data_valid)
	begin
		out = csr_read_data_i;
	end
	else
	begin
		out = in2 ;
	end
end

//assign out = (sel) ? in1 : in2 ;
endmodule
