
`define ZILLA_32_BIT 
`timescale 1ns/1ps

module carry_skip_4bit(
    input  [3:0] ain ,
    input  [3:0] bin ,
    input        cin ,
    output [3:0] sum ,
    output       cout
                    );

    wire [3:0] cp;
    wire      sel;
    wire      co ;

    assign cp  = ain ^ bin;
    assign sel = &cp;

    cla_adder_4bit cla_adder_4bit_inst(
    .ain(ain),
    .bin(bin),
    .cin(cin),
    .sum(sum),
    .cout(co)
            );

    assign cout = sel ? cin : co;            

endmodule

