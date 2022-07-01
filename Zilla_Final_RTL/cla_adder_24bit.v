
`define ZILLA_32_BIT 
`timescale 1ns/1ps

module cla_adder_24bit(
    input  [23:0] ain ,
    input  [23:0] bin ,
    output [23:0] sum 
                     );

    wire [23:0] cp; // carry propagate
    wire [23:0] cg; // carry generate
    wire [23:0] co; // carry output

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
    assign co[12] = (cg[11] | (co[11] & cp[11]));
    assign co[13] = (cg[12] | (co[12] & cp[12]));
    assign co[14] = (cg[13] | (co[13] & cp[13]));
    assign co[15] = (cg[14] | (co[14] & cp[14]));
    assign co[16] = (cg[15] | (co[15] & cp[15]));
    assign co[17] = (cg[16] | (co[16] & cp[16]));
    assign co[18] = (cg[17] | (co[17] & cp[17]));
    assign co[19] = (cg[18] | (co[18] & cp[18]));
    assign co[20] = (cg[19] | (co[19] & cp[19]));
    assign co[21] = (cg[20] | (co[20] & cp[20]));
    assign co[22] = (cg[21] | (co[21] & cp[21]));
    assign co[23] = (cg[22] | (co[22] & cp[22]));

    assign sum  = cp ^ co;

endmodule

