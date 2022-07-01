
`define ZILLA_32_BIT 
`timescale 1ns/1ps

module cla_adder_12bit(
    input  [11:0] ain ,
    input  [11:0] bin ,
    output [11:0] sum 
                     );

    wire [11:0] cp; // carry propagate
    wire [11:0] cg; // carry generate
    wire [11:0] co; // carry output

    assign cp = ain ^ bin;
    assign cg = ain & bin;

    assign co[0]  = 1'b0;
    assign co[1]  = (cg[0] | (co[0] & cp[0]));
    assign co[2]  = (cg[1] | (co[1] & cp[1]));
    assign co[3]  = (cg[2] | (co[2] & cp[2]));
    assign co[4]  = (cg[3] | (co[3] & cp[3]));
    assign co[5]  = (cg[4] | (co[4] & cp[4]));
    assign co[6]  = (cg[5] | (co[5] & cp[5]));
    assign co[7]  = (cg[6] | (co[6] & cp[6]));
    assign co[8]  = (cg[7] | (co[7] & cp[7]));
    assign co[9]  = (cg[8] | (co[8] & cp[8]));
    assign co[10] = (cg[9] | (co[9] & cp[9]));
    assign co[11] = (cg[10] | (co[10] & cp[10]));

    assign sum   = cp ^ co;

endmodule

