
`define ZILLA_32_BIT 
`timescale 1ns/1ps

module vedic_16x16(
    input  [15:0] a_in  ,
    input  [15:0] b_in  ,
    output [31:0] result
                       );

    wire [15:0] q0, q1, q2, q3;
    wire [23:0] temp1, temp2, temp3, temp4, temp5;
    wire [15:0] temp6;

    // vedic 8x8 instatiation [7:0]
    vedic_8x8 vedic_8x8_0(
    .a_in(a_in[7:0]),
    .b_in(b_in[7:0]),
    .result(q0)    );

    assign result[7:0] = q0[7:0];
    assign temp1       = {16'd0, q0[15:8]};

    // cross multiplication
    vedic_8x8 vedic_8x8_1(
    .a_in(a_in[7:0] ),
    .b_in(b_in[15:8]),
    .result(q1)     );

    vedic_8x8 vedic_8x8_2(
    .a_in(a_in[15:8]),
    .b_in(b_in[7:0] ),
    .result(q2)     );

    assign temp2 = {8'd0, q1};
    assign temp3 = {8'd0, q2};

    // 24 bit adder instatiation
    cla_adder_24bit cla_adder_24bit_inst0(
    .ain(temp2),
    .bin(temp3),
    .sum(temp4) 
              );

    cla_adder_24bit cla_adder_24bit_inst1(
    .ain(temp4),
    .bin(temp1),
    .sum(temp5) 
              );
                  
    assign result[15:8] = temp5[7:0];

    // vedic 8x8 instatiation [15:8]
    vedic_8x8 vedic_8x8_3(
    .a_in(a_in[15:8]),
    .b_in(b_in[15:8]),
    .result(q3)     );

    // 16bit adder instatiation
    cla_adder_16bit cla_adder_16bit_inst(
    .ain(q3),
    .bin(temp5[23:8]),
    .sum(temp6));

    assign result[31:16] = temp6;

endmodule

