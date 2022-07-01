
`define ZILLA_32_BIT 
`timescale 1ns/1ps

module half_adder(ain, bin, sum, cout);
	input  ain, bin ;
	output sum, cout;

	assign sum  = ain ^ bin;
	assign cout = ain & bin;

endmodule
