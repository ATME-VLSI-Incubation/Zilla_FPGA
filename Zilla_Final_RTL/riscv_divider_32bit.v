// div
`define INST_DIV 32'h2004033  
`define INST_DIV_MASK 32'hfe00707f

// divu
`define INST_DIVU 32'h2005033
`define INST_DIVU_MASK 32'hfe00707f

// rem
`define INST_REM 32'h2006033
`define INST_REM_MASK 32'hfe00707f

// remu
`define INST_REMU 32'h2007033
`define INST_REMU_MASK 32'hfe00707f 

`define ZILLA_32_BIT 
`timescale 1ns/1ps

module riscv_divider_32bit(
    // Inputs
    input          clk_i          ,
    input          rst_i          ,
    input          valid_i        ,
    input  [31:0] opcode_i        ,
    input  [31:0] operand_dividend,
    input  [31:0] operand_divisor ,
    output          div_busy_o      , 

    // Outputs
    output         valid_o        ,
    output [31:0] div_rem_value_o
				 );

	// signals for valid and quotient or reminder output
	reg        valid_reg   ;
	reg [31:0] div_rem_reg ;
	reg [31:0] div_result_r;

	// signals for computation
	reg [31:0] dividend_reg;
	reg [62:0] divisor_reg ;
	reg [31:0] quotient_reg;
	reg [31:0] mask_reg    ;
	reg        div_opr_sel ;
	reg        div_busy_sel;
	reg        invert_sel  ;

	// signals to select and detect divison operation
	wire signed_operation;
	wire div_rem_valid   ;
	wire div_operation   ;
	wire div_start   ;
	wire div_complete;

     reg valid_r;
    
    always @(posedge clk_i)
    begin
        valid_r <= valid_i;
    end
  

    assign div_busy_o = div_busy_sel;
	assign div_rem_valid = ((opcode_i & `INST_DIV_MASK ) == `INST_DIV ) || 
                           ((opcode_i & `INST_DIVU_MASK) == `INST_DIVU) ||
                           ((opcode_i & `INST_REM_MASK ) == `INST_REM ) ||
                           ((opcode_i & `INST_REMU_MASK) == `INST_REMU);

	assign signed_operation = ((opcode_i & `INST_DIV_MASK) == `INST_DIV) || 
							  ((opcode_i & `INST_REM_MASK) == `INST_REM);
							  
	assign div_operation    = ((opcode_i & `INST_DIV_MASK ) == `INST_DIV ) || 
	                          ((opcode_i & `INST_DIVU_MASK) == `INST_DIVU);

	assign div_start    = (valid_r && div_rem_valid);
	assign div_complete = (!(|mask_reg) && div_busy_sel);

	// division operation logic
	always @(posedge clk_i or negedge rst_i)
	begin
	if (!rst_i)
	begin
		div_busy_sel <= 1'b0  ;
		dividend_reg <= 32'd0 ;
		divisor_reg  <= 63'd0 ;
		invert_sel   <= 1'b0  ;
		quotient_reg <= 32'd0 ;
		mask_reg     <= 32'd0 ;
		div_opr_sel  <= 1'b0  ;
	end
	// divison operation starts
	else if(div_start)
	begin
		div_busy_sel <= 1'b1;
		div_opr_sel  <= div_operation;

		// 2's complement values for dividend if dividend is -ve
		if (signed_operation && operand_dividend[31])
			dividend_reg <= ~operand_dividend + 1'b1;
		else
			dividend_reg <= operand_dividend;

		// 2's complement values for divisor if divisor is -ve
		if (signed_operation && operand_divisor[31])
			divisor_reg <= {~operand_divisor + 1'b1, 31'd0};
		else
			divisor_reg <= {operand_divisor, 31'd0};

		// quotient and reminder negative select
		invert_sel <= (((opcode_i & `INST_DIV_MASK) == `INST_DIV   ) && 
		               (operand_dividend[31] != operand_divisor[31]) && |operand_divisor) || 
                      (((opcode_i & `INST_REM_MASK) == `INST_REM   ) && operand_dividend[31]);

		quotient_reg <= 32'd0;
		mask_reg     <= 32'h8000_0000; 
	end
	// divison completes
	else if(div_complete)
	begin
		div_busy_sel <= 1'b0;
	end
	// divison operation continuing
	else if(div_busy_sel)
	begin
		if(divisor_reg <= {31'd0, dividend_reg})
		begin
			dividend_reg <= dividend_reg - divisor_reg[31:0];
			quotient_reg <= quotient_reg | mask_reg;
		end

		divisor_reg <= {1'b0, divisor_reg[62:1]};
		mask_reg    <= {1'b0, mask_reg[31:1]};
	end
	end

	// divison and reminder result output logic
	always @(*)
	begin
		div_result_r = 32'd0;
		// quotient output
		if (div_opr_sel)
			if(invert_sel)
				div_result_r = ~quotient_reg + 1'b1; 
			else
				div_result_r = quotient_reg;
		// reminder output
		else
			if(invert_sel)
				div_result_r = ~dividend_reg + 1'b1; 
			else
				div_result_r = dividend_reg;
	end

	// sending valid signal when divison is completed
	always @(posedge clk_i or negedge rst_i)
	begin
		if (!rst_i)
			valid_reg <= 1'b0;
		else
			valid_reg <= div_complete;
	end

	// registering quotient and reminder output 
	always @(posedge clk_i or negedge rst_i)
	begin
		if (!rst_i)
			div_rem_reg <= 32'd0;
		else if (div_complete)
			div_rem_reg <= div_result_r;
		else
			div_rem_reg <= 32'd0;
	end

	assign valid_o         = valid_reg  ;
	assign div_rem_value_o = div_rem_reg;

endmodule


