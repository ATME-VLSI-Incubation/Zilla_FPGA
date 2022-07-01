
`define ZILLA_32_BIT 
`timescale 1ns/1ps

module vedic_4x4(
    input  [3:0] a_in  ,
    input  [3:0] b_in  ,
    output [7:0] result
                      );

    wire [3:0] q0, q1, q2, q3;
    wire [5:0] temp1, temp2, temp3, temp4, temp5;
    wire [3:0] temp6;

    // vedic 2x2 multiplier instatiation [1:0]
    vedic_2x2 vedic_2x2_0(.a_in(a_in[1:0]),
                          .b_in(b_in[1:0]),
                          .result(q0)    );

    assign temp1       = {4'd0, q0[3:2]};  
    assign result[1:0] = q0[1:0];
 
    // cross multiplication 
    vedic_2x2 vedic_2x2_1(.a_in(a_in[1:0]),
                          .b_in(b_in[3:2]),
                          .result(q1)    );
                      
    vedic_2x2 vedic_2x2_2(.a_in(a_in[3:2]),
                          .b_in(b_in[1:0]),
                          .result(q2)    );

    assign temp2 = {2'd0, q1};  
    assign temp3 = {2'd0, q2};

    // 6bit adder instatiation
    cla_adder_6bit cla_adder_6bit_inst0(.ain(temp2),
                                        .bin(temp3),
                                        .sum(temp4));
                                    
    cla_adder_6bit cla_adder_6bit_inst1(.ain(temp4),
                                        .bin(temp1),
                                        .sum(temp5));
    assign result[3:2] = temp5[1:0]; 

    // vedic 2x2 instatiation of [3:2]
    vedic_2x2 vedic_2x2_3(.a_in(a_in[3:2]),
                          .b_in(b_in[3:2]),
                          .result(q3)    );

    // 4bit adder instatiation
    cla_adder_4bit cla_adder_4bit_inst(.ain(q3),
                                       .bin(temp5[5:2]),
                                       .cin(1'b0),
                                       .sum(temp6),
                                       .cout()   );

    assign result[7:4] = temp6;

endmodule

