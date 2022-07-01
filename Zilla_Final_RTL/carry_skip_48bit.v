
`define ZILLA_32_BIT 
`timescale 1ns/1ps

module carry_skip_48bit(
    input  [47:0] ain ,
    input  [47:0] bin ,
    input         cin ,
    output [47:0] sum ,
    output        cout
                     );

    wire [11:1] c;

    carry_skip_4bit cs0(.ain(ain[3:0]), .bin(bin[3:0]), .cin(cin), 
                        .sum(sum[3:0]), .cout(c[1]));

    carry_skip_4bit cs1(.ain(ain[7:4]), .bin(bin[7:4]), .cin(c[1]), 
                        .sum(sum[7:4]), .cout(c[2]));

    carry_skip_4bit cs2(.ain(ain[11:8]), .bin(bin[11:8]), .cin(c[2]), 
                        .sum(sum[11:8]), .cout(c[3]));

    carry_skip_4bit cs3(.ain(ain[15:12]), .bin(bin[15:12]), .cin(c[3]), 
                        .sum(sum[15:12]), .cout(c[4]));
    
    carry_skip_4bit cs4(.ain(ain[19:16]), .bin(bin[19:16]), .cin(c[4]), 
                        .sum(sum[19:16]), .cout(c[5]));

    carry_skip_4bit cs5(.ain(ain[23:20]), .bin(bin[23:20]), .cin(c[5]), 
                        .sum(sum[23:20]), .cout(c[6]));

    carry_skip_4bit cs6(.ain(ain[27:24]), .bin(bin[27:24]), .cin(c[6]), 
                        .sum(sum[27:24]), .cout(c[7]));

    carry_skip_4bit cs7(.ain(ain[31:28]), .bin(bin[31:28]), .cin(c[7]), 
                        .sum(sum[31:28]), .cout(c[8]));

    carry_skip_4bit cs8(.ain(ain[35:32]), .bin(bin[35:32]), .cin(c[8]), 
                        .sum(sum[35:32]), .cout(c[9]));

    carry_skip_4bit cs9(.ain(ain[39:36]), .bin(bin[39:36]), .cin(c[9]), 
                        .sum(sum[39:36]), .cout(c[10]));

    carry_skip_4bit cs10(.ain(ain[43:40]), .bin(bin[43:40]), .cin(c[10]), 
                         .sum(sum[43:40]), .cout(c[11]));

    carry_skip_4bit cs11(.ain(ain[47:44]), .bin(bin[47:44]), .cin(c[11]), 
                         .sum(sum[47:44]), .cout(cout));

endmodule

