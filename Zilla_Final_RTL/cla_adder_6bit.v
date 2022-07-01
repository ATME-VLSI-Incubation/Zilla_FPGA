
`define ZILLA_32_BIT 
`timescale 1ns/1ps

module cla_adder_6bit(
    input  [5:0] ain ,
    input  [5:0] bin ,
    output [5:0] sum 
                    );

    wire [5:0] cp; // carry propagate
    wire [5:0] cg; // carry generate
    wire [5:0] co; // carry output

    assign cp = ain ^ bin;
    assign cg = ain & bin;

    assign co[0] = 1'b0;
    assign co[1] = (cg[0] | (co[0] & cp[0]));
    assign co[2] = (cg[1] | (co[1] & cp[1]));
    assign co[3] = (cg[2] | (co[2] & cp[2]));
    assign co[4] = (cg[3] | (co[3] & cp[3]));
    assign co[5] = (cg[4] | (co[4] & cp[4]));

    assign sum   = cp ^ co;

endmodule

