
// JTAG Test Data Output Mux
// Company: FrenusTech Pvt Ltd
// Domain : RTL Domain
// Author : Papu Maharana

`define ZILLA_32_BIT 
`timescale 1ns/1ps
module jtag_tdo_mux #(parameter IR_BITS = 5)(
	input [IR_BITS-1:0] instr_reg_in       , // Instructions coming from Instruction Register
	input               TCK                , // Test Clock Input
	input               TRST               , // asynchronous active low reset
	
	// IR Stage SIgnals
	input               Shift_IR           , // Shift IR Stage Shifts the Instruction bit to TDO
	input               ir_shift_in        , // Instruction bit shifts to TDO
	
	// DR Stage Signals
	input               Shift_DR           , // Shift DR Stage Shifts the Data bit to TDO	
	input               bypass_shift_in    , // BYPASS bit shifts to TDO
	input               idcode_shift_in    , // IDCODE bits shifts to TDO
	input               dtm_csr_shift_in   , // DTMCS bits shifts to TDO
	input               dmi_access_shift_in, // DMI bits shifts to TDO
	//input               command_shift_in   , // COMMAND bits shifts to TDO
	
	// TDO Output Signals
	output reg          TDO                , // Test Data Output
	output              tdo_en               // TDO output enable 
	                                      );
												 
	// parameter declaration for instructions
	localparam IDCODE     = 5'h01; // IDCODE Instruction
	localparam BYPASS     = 5'h1F; // BYPASS Instruction
	localparam DTM_CSR    = 5'h10; // DTM Control & Status Instruction
	localparam DMI_ACCESS = 5'h11; // DMI_ACCESS Instruction
//	localparam COMMAND    = 5'h17; // COMMAND Instruction

	reg tdo_mux_out; // internal register for TDO Mux
	
	// logic for TDO Multiplexing Design
	always @(*)
		begin
			if(Shift_IR) // Instruction bits goes to TDO
				tdo_mux_out = ir_shift_in;				
			else         // Data bit goes to TDO
				begin
					case(instr_reg_in)
						BYPASS     : tdo_mux_out = bypass_shift_in    ;
						IDCODE     : tdo_mux_out = idcode_shift_in    ;
						DTM_CSR    : tdo_mux_out = dtm_csr_shift_in   ;
						DMI_ACCESS : tdo_mux_out = dmi_access_shift_in;
					//	COMMAND    : tdo_mux_out = command_shift_in   ;
						default    : tdo_mux_out = bypass_shift_in    ;
					endcase
				end			
		end
		
	// data and instruction bits updates to TDO at negedge of TCK
	always @(negedge TCK or negedge TRST)
		begin
			if(!TRST)
				TDO <= 1'b0;
			else if(Shift_IR || Shift_DR)
				TDO <= tdo_mux_out;
		end
	
	// JTAG TDO output enable 
	assign tdo_en = (Shift_IR || Shift_DR);	
	
endmodule
