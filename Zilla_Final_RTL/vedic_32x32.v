
`define ZILLA_32_BIT 
`timescale 1ns/1ps

module vedic_32x32(
    input  [31:0] a_in  ,
    input  [31:0] b_in  ,
    output [63:0] result
                       );

    wire [31:0] q0, q1, q2, q3;
    wire [47:0] temp1, temp2, temp3, temp4, temp5;
    wire [47:0] sum;

    // vedic 16x16 instatiation
    vedic_16x16 vedic_16x16_0(
    .a_in(a_in[15:0]),
    .b_in(b_in[15:0]),
    .result(q0)     );

    assign result[15:0] = q0[15:0];

    vedic_16x16 vedic_16x16_1(
    .a_in(a_in[15:0] ),
    .b_in(b_in[31:16]),
    .result(q1)      );

    assign temp1 = {16'd0, q1};

    vedic_16x16 vedic_16x16_2(
    .a_in(a_in[31:16]),
    .b_in(b_in[15:0] ),
    .result(q2)      );

    assign temp2 = {16'd0, q2};

    vedic_16x16 vedic_16x16_3(
    .a_in(a_in[31:16]),
    .b_in(b_in[31:16]),
    .result(q3)      );

    assign temp3 = {q3, q0[31:16]};

    // 48bit carry save adder instatiation
    csa_48bit csa_inst(
    .ain(temp1),
    .bin(temp2),
    .cin(temp3),
    .sum(temp4),
    .co (temp5)
              );

    // 48bit carry skip adder instatiation              
    carry_skip_48bit carry_skip_inst(
    .ain(temp4),
    .bin(temp5),
    .cin(1'b0 ),
    .sum(sum  ),
    .cout()   ); 

    assign result[63:16] = sum;

endmodule

