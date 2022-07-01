`define ZILLA_32_BIT 
`timescale 1ns/1ps
module zilla_reminder
#(
parameter DATA_WIDTH = 0,
parameter INSTRUCTION_WIDTH = 0
)
(
input                   clk_i           ,
input                   rst_i           ,
input                   en              ,
input [DATA_WIDTH-1:0]  dividend        ,
input [DATA_WIDTH-1:0]  divisor         ,
input [31:0]            opcode_i        ,
output [DATA_WIDTH-1:0] reminder        ,
output                  reminder_valid  ,
output                  rem_busy_o      

);

reg [DATA_WIDTH-1:0] dividend_r;
reg [DATA_WIDTH-1:0] divisor_r;



always@(posedge clk_i or negedge rst_i)
begin
    if(!rst_i)
    begin
        dividend_r <= 0;
        divisor_r <= 0;
    end
    else
    begin
        if(en)
        begin
        dividend_r <= dividend;
        divisor_r <= divisor;
    end
    end
end



`ifdef ZILLA_64_BIT
riscv_divider_64bit 
riscv_divider_64bit_inst(

 .clk_i           (clk_i            ),
 .rst_i           (rst_i            ),
 .valid_i         (en               ),
 .opcode_i        (opcode_i         ),
 .operand_dividend(dividend_r         ),
 .operand_divisor (divisor_r          ),
 .valid_o         (reminder_valid         ),
 .div_rem_value_o (reminder   ),
 .div_busy_o      (rem_busy_o      )
				 );
 
 `elsif ZILLA_32_BIT                

 riscv_divider_32bit
 riscv_divider_32bit_inst
 (
.clk_i           (clk_i          ),
.rst_i           (rst_i          ),
.valid_i         (en             ),
.opcode_i        (opcode_i       ),
.operand_dividend(dividend_r       ),
.operand_divisor (divisor_r        ),
.valid_o         (reminder_valid       ),
.div_rem_value_o (reminder ),
.div_busy_o     (rem_busy_o)
				 );

`endif
endmodule

