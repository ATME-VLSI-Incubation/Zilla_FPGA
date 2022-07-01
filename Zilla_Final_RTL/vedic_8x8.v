
`define ZILLA_32_BIT 
`timescale 1ns/1ps

module vedic_8x8(
    input  [7:0]  a_in  ,
    input  [7:0]  b_in  ,
    output [15:0] result
                       );

    wire [7:0]  q0, q1, q2, q3;
    wire [11:0] temp1, temp2, temp3, temp4, temp5;
    wire [7:0]  temp6;

    // vedic 4x4 instatiation [3:0]
    vedic_4x4 vedic_4x4_0(.a_in(a_in[3:0]),
                          .b_in(b_in[3:0]),
                          .result(q0)    );
    
    assign result[3:0] = q0[3:0];
    assign temp1       = {8'd0, q0[7:4]};

    // cross multiplication
    vedic_4x4 vedic_4x4_1(.a_in(a_in[3:0]),
                          .b_in(b_in[7:4]),
                          .result(q1)    );

    vedic_4x4 vedic_4x4_2(.a_in(a_in[7:4]),
                          .b_in(b_in[3:0]),
                          .result(q2)    );

    assign temp2 = {4'd0, q1};
    assign temp3 = {4'd0, q2};

    // 12 bit adder instatiation
    cla_adder_12bit cla_adder_12bit_inst0(
    .ain(temp2),
    .bin(temp3),
    .sum(temp4));

    cla_adder_12bit cla_adder_12bit_inst1(
    .ain(temp4),
    .bin(temp1),
    .sum(temp5));

    assign result[7:4] = temp5[3:0];

    // vedic 4x4 instatiation [7:4]
    vedic_4x4 vedic_4x4_3(.a_in(a_in[7:4]),
                          .b_in(b_in[7:4]),
                          .result(q3)    );
    
    // 8bit adder instatiation                      
    cla_adder_8bit cla_adder_8bit_inst(
    .ain(q3),
    .bin(temp5[11:4]),
    .sum(temp6));

    assign result[15:8] = temp6;

endmodule

