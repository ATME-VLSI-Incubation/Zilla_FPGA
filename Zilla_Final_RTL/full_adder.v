
`define ZILLA_32_BIT 
`timescale 1ns/1ps

module full_adder(ain, bin, cin, sum, cout);
	input  ain, bin, cin;
	output sum, cout;

	assign sum  = ain ^ bin ^ cin;
	assign cout = (ain & bin) | (bin & cin) | (cin & ain);
	
endmodule

