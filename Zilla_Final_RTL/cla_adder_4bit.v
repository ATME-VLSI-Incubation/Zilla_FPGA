
`define ZILLA_32_BIT 
`timescale 1ns/1ps

module cla_adder_4bit(
    input  [3:0] ain ,
    input  [3:0] bin ,
    input        cin ,
    output [3:0] sum ,
    output       cout
                    );

    wire [3:0] cp; // carry propagate
    wire [3:0] cg; // carry generate
    wire [3:0] co; // carry output

    assign cp = ain ^ bin;
    assign cg = ain & bin;

    assign co[0] = cin;
    assign co[1] = (cg[0] | (co[0] & cp[0]));
    assign co[2] = (cg[1] | (co[1] & cp[1]));
    assign co[3] = (cg[2] | (co[2] & cp[2]));

    assign cout  = (cg[3] | (co[3] & cp[3]));
    assign sum   = cp ^ co;

endmodule

