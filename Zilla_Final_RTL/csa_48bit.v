
`define ZILLA_32_BIT 
`timescale 1ns/1ps

module csa_48bit(
    input  [47:0] ain,
    input  [47:0] bin,
    input  [47:0] cin,
    output [47:0] sum,
    output [47:0] co
                    );

    wire [47:0] c, s;

    genvar i;
    generate
    for(i=0; i<48; i=i+1)
    begin : csa_loop
        full_adder FA(.ain(ain[i]), 
                      .bin(bin[i]),
                      .cin(cin[i]),
                      .sum(s[i]  ),
                      .cout(c[i] )
                                 );
    end
    endgenerate

    assign co  = {c[46:0], 1'b0};
    assign sum = s; 

endmodule

