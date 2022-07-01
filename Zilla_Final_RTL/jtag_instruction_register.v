
// JTAG Instruction Register Design
// The instruction register allows an instruction to be shifted into the design. 
// The instruction is used to select the test to be performed or the test data register to be accessed or both. 
// Also, store JTAG instructions for instruction decoder.
// Company: FrenusTech Pvt Ltd
// Domain : RTL Domain
// Author : Papu Maharana

`define ZILLA_32_BIT 
//`timescale 1ns/1ps
module jtag_instruction_register #(parameter IR_BITS = 5)(
	input                    TRST          , // JTAG asynch active low Reset signal
	input                    TDI           , // JTAG Test Data Input signal
	input                    Reset         , // State is in TEST_LOGIC_RESET
	
	// Capture and Shift stage signals
	input                    Capture_clk   , // posedge(TCK) clock signal for capture and shift operation
	input                    Capture_IR    , // controls capture operation of IR: capture the instruction bits
	input                    Shift_IR      , // controls shift operation of IR  : shifts the instruction bits
	
	// Update stage signals
	input                    Update_clk    , // negedge(TCK) clock signal for update operation
	input                    Update_IR     , // controls update operation of IR : update the instruction bits
	
	// IR output signals
	output reg [IR_BITS-1:0] instr_reg_out , // Instruction Register updates its value at Update Stage
	output                   ir_shift_out  , // IR Shift Output signal latched on negedge TCK after output MUX
	
	// Instruction Decoder signals
	output reg               bypass_sel    , // Selects Bypass Register
	output reg               idcode_sel    , // Selects IDCODE Register
	output reg               dtm_csr_sel   , // Selects DTM(Debug Transport Module) Control & Status Register
	output reg               dmi_access_sel // Selects Debug Module Interface Access
//	output reg               command_sel     // Selects Abstarct Command
	                                      );
	
	// Parameters for instructions
	localparam IDCODE     = 5'h01; // IDCODE Instruction
	localparam BYPASS     = 5'h1F; // BYPASS Instruction
	localparam DTM_CSR    = 5'h10; // DTM Control & Status Instruction
	localparam DMI_ACCESS = 5'h11; // DMI_ACCESS Instruction
//	localparam COMMAND    = 5'h17; // COMMAND Instruction
	
	// internal shift register declaration
	reg [IR_BITS-1:0] instr_shift_reg; // shifts the instruction bits 

	// logic for shift operation
	always @(posedge Capture_clk or negedge TRST)
		begin
			if(!TRST)           // Reset State
				instr_shift_reg <= {IR_BITS{1'b0}};
				
			else if(Reset)      // State is in TEST_LOGIC_RESET
				instr_shift_reg <= {IR_BITS{1'b0}};
				
			else if(Capture_IR) // Capture State
				instr_shift_reg <= {{(IR_BITS-1){1'b0}}, 1'b1};
				
			else if(Shift_IR)   // Shift State
				instr_shift_reg <= {TDI, instr_shift_reg[IR_BITS-1:1]};
		end
	
	assign ir_shift_out = instr_shift_reg[0];
	
	// logic for Update operation
	always @(posedge Update_clk or negedge TRST)
		begin
			if(!TRST)          // Reset Stage
				instr_reg_out <= IDCODE;
				
			else if(Reset)     // State is in TEST_LOGIC_RESET
				instr_reg_out <= IDCODE;
				
			else if(Update_IR) // Update Stage
				instr_reg_out <= instr_shift_reg;
		end
		
	// Instruction decoder logic
	// Based on 8bit instructions different registers gets selected	
	always @(*)
		begin
			idcode_sel     = 1'b0;
			bypass_sel     = 1'b0;
			dtm_csr_sel    = 1'b0;
			dmi_access_sel = 1'b0;
	//		command_sel    = 1'b0;
			
			case(instr_reg_out)
				IDCODE     : idcode_sel     = 1'b1;
				BYPASS     : bypass_sel     = 1'b1;
				DTM_CSR    : dtm_csr_sel    = 1'b1;
				DMI_ACCESS : dmi_access_sel = 1'b1;
		//		COMMAND    : command_sel    = 1'b1;
				default    : bypass_sel     = 1'b1;
			endcase
		end

endmodule
