
// JTAG TOP module contains 6 lower level modules
// Company: FrenusTech Pvt Ltd
// Domain : RTL Domain
// Author : Papu Maharana

`define ZILLA_32_BIT 
`timescale 1ns/1ps
module jtag_top 
  #(parameter           DWIDTH  = 32   , // DATA WIDTH for DMI Register 
                        AWIDTH  = 32   , // ADDRESS WIDTH for DMI Register
						IR_BITS = 5    , // parameter declaration for Instruction length
						
	parameter [3:0]     VERSION = 4'h0 , // IDCODE Register VERSION
	parameter [15:0]	PART_NO = 16'h10, // IDCODE Register PART Number //random  number for time being
	parameter [10:0]	MANF_ID = 11'h20  // IDCODE Register Manufacture ID //random  numbers for time being
						              )(
	input               TCK            , // Test Clock Input
	input               TRST           , // Test Reset Input: asynch active low reset
	input               TMS            , // Test Mode Select Input
	input               TDI            , // Test Data Input
	output              TDO            , // Test Data Output
	output              tdo_en         , // TDO output enable: this flag is high when state is in Shift_IR | Shift_DR
	
	input  [DWIDTH-1:0] dmi_data_in    , // Data Read from APB Master
	output              dr_scan        , // DTMCS Register 16th pin
	output [DWIDTH-1:0] dmi_data_out   , // DMI Register Data Out
	output [AWIDTH-1:0] dmi_address_out, // DMI Register Address Out
	output [1:0]        dmi_op_out     , // DMI operation Output: 0=NOP, 1=READ, 2=WRITE, 3=RESERVED
	output              dmi_transfer    // transfer signal operates APB Master FSM
	
//	output [7:0]        cmd_type       , // this type determines the overall functionality of abstract command
//	output [23:0]       control_out     // this field described for each abstract command

    //input [1:0]         state          
    //input               slave_err_i
	                                  );
	
	// wire declarations for interconnnected blocks
	wire               Reset_Out_In         ;
	wire               Capture_clk          ;
	wire               Update_clk           ;
	
	wire               Capture_DR    ;
	wire               Shift_DR_Out_In      ;
	wire               Update_DR_Out_In     ;
	
	wire               Capture_IR_Out_In    ;
	wire               Shift_IR_Out_In      ;
	wire               Update_IR_Out_In     ;
	
	wire [IR_BITS-1:0] instr_reg_out_in     ;
	wire               ir_shift_out_in      ;
	
	wire               bypass_sel           ;
	wire               bypass_shift_out_in  ;
	
	wire               idcode_sel           ;
	wire               idcode_shift_out_in  ;
	
	wire               dtm_csr_sel          ;
	wire               dtm_csr_shift_out_in ;
	
	wire               dmi_access_sel       ;
	wire               dmi_shift_out_in     ;
	
//	wire               command_sel          ;
//	wire               command_shift_out_in ;
	
	
	/* 
	  ===================== Instatiaton of TAP_Controller =====================
	                                                                           */
	jtag_tap_controller jtag_tap_controller_instance
	(.TMS         (TMS              ), // Test Mode Select Input controls TAP Controller
	 .TCK         (TCK              ), // Test Clock Input 
	 .TRST        (TRST             ), // Active low asynchronous reset resets the TAP Controller

	 // outputs for Data Register Path
     .dr_scan     (dr_scan   ),
	 .Capture_DR  (Capture_DR), // Controls Capture operation in DR Path
	 .Shift_DR    (Shift_DR_Out_In  ), // Controls Shift Operation in DR Path
	 .Update_DR   (Update_DR_Out_In ), // Control Update DR operation
	
	 // outputs for Instruction Register Path
	 .Capture_IR  (Capture_IR_Out_In), // Controls Capture operation in IR Path
	 .Shift_IR    (Shift_IR_Out_In  ), // Controls Shift operation in IR Path
	 .Update_IR   (Update_IR_Out_In ), // Control Update IR operation
 
	 // capture and update stage clock signals 
	 .Capture_clk (Capture_clk      ), // posedge clpck signal for capture and shift stages
	 .Update_clk  (Update_clk       ), // negedge clock signal for update stage	
	 .Reset       (Reset_Out_In     )  // Reset Output
					                );											  
	/* 
	  ===================== End of TAP_Controller =====================
	                                                                   */
																							 

	/* 
	  =====================	Instatiation of Instruction_Register =====================
	                                                                                  */
	jtag_instruction_register #(.IR_BITS(IR_BITS)) jtag_instruction_register_inst
	(.TRST          (TRST             ), // JTAG asynch active low Reset signal
	 .TDI           (TDI              ), // JTAG Test Data Input signal
	 .Reset         (Reset_Out_In     ), // State is in TEST_LOGIC_RESET
	
	 // Capture and Shift stage signals
	 .Capture_clk   (Capture_clk      ), // posedge(TCK) clock signal for capture and shift operation
	 .Capture_IR    (Capture_IR_Out_In), // controls capture operation of IR: capture the instruction bits
	 .Shift_IR      (Shift_IR_Out_In  ), // controls shift operation of IR  : shifts the instruction bits
	
	 // Update stage signals
	 .Update_clk    (Update_clk       ), // negedge(TCK) clock signal for update operation
	 .Update_IR     (Update_IR_Out_In ), // controls update operation of IR : update the instruction bits
	
	 // IR output signals
	 .instr_reg_out (instr_reg_out_in ), // Instruction Register updates its value at Update Stage
	 .ir_shift_out  (ir_shift_out_in  ), // IR Shift Output signal latched on negedge TCK after output MUX
	 
	 // Instruction Decoder signals
	 .bypass_sel    (bypass_sel       ), // Selects Bypass Register
	 .idcode_sel    (idcode_sel       ), // Selects IDCODE Register
	 .dtm_csr_sel   (dtm_csr_sel      ), // Selects DTM(Debug Transport Module) Control & Status Register
	 .dmi_access_sel(dmi_access_sel   ) // Selects Debug Module Interface Access
//	 .command_sel   (command_sel      )  // Selects Abstarct Command
	                                  );
	/* 
	  =====================	End of Instruction_Register =====================
	                                                                         */	

	
	/* 
	  =====================	Instatiation of Data_Register =====================
	                                                                           */
																										
	jtag_data_register 
	#(.DWIDTH             (DWIDTH               ),
	  .AWIDTH             (AWIDTH               ),
      .VERSION            (VERSION              ),
	  .PART_NO            (PART_NO              ),
	  .MANF_ID            (MANF_ID              )
	                                            ) jtag_data_register_inst
	(.TRST                (TRST                 ), // active low asynchronous reset
	 .Reset               (Reset_Out_In         ), // state is in TEST_LOGIC_RESET State
	 .TDI                 (TDI                  ), // Test Data Input
	
	 .Capture_clk         (Capture_clk          ), // shifts the TDI to TDO at posedge TCK clock
	 .Capture_DR          (Capture_DR    ), // Capture the data
	 .Shift_DR            (Shift_DR_Out_In      ), // controls the Shift Operation of Bypass Register
	 
	 .Update_clk          (Update_clk           ), // Updates the USER DATA at negedge of TCK
	 .Update_DR           (Update_DR_Out_In     ), // Updates the USER DATA
	
	 .bypass_sel          (bypass_sel           ), // Selects the Bypass Register
	 .bypass_shift_out    (bypass_shift_out_in  ), // Bypass Register Output
	
	 .idcode_sel          (idcode_sel           ), // Selects the IDCODE Register
	 .idcode_shift_out    (idcode_shift_out_in  ), // IDCODE Register Output
	 
	 .dtm_csr_sel         (dtm_csr_sel          ), // Selects DTM Control & Status Register
	 .dtm_csr_shift_out   (dtm_csr_shift_out_in ), // DTM_CSR Register Output
	 
	 .dmi_access_sel      (dmi_access_sel       ), // Selects DMI Access Register
	 .dmi_access_shift_out(dmi_shift_out_in     ), // DMI Access Register Output
	 
	 .dmi_data_in         (dmi_data_in          ), // Data Read from APB Master
	 //.dmi_reset           (dmi_reset            ), // DTMCS Register 16th pin
	 .dmi_data_out        (dmi_data_out         ), // DMI Register Data Out
	 .dmi_address_out     (dmi_address_out      ), // DMI Register Address Out
	 .dmi_op_out          (dmi_op_out           ), // DMI operation Output: 0=NOP, 1=READ, 2=WRITE, 3=RESERVED
	 .dmi_transfer        (dmi_transfer         ) // transfer signal operates APB Master FSM
	 
//	 .command_sel         (command_sel          ), // Selects Abstarct Command
//	 .command_shift_out   (command_shift_out_in ), // Command Shift Output
//	 .cmd_type            (cmd_type             ), // this type determines the overall functionality of abstract command
//	 .control_out         (control_out          ) // this field described for each abstract command

     //.state               (state                )
     //.slave_err_i         (slave_err_i          )
	                                            );
	/* 
	  =====================	End of Data_Register =====================
	                                                                  */
	
	
	/* 
	  =====================	Instatiation of TDO_Mux =====================
	                                                                     */
	jtag_tdo_mux #(.IR_BITS(IR_BITS)) jtag_tdo_mux_inst
	(.instr_reg_in       (instr_reg_out_in     ), // Instructions coming from Instruction Register
	 .TCK                (TCK                  ), // Test Clock Input
	 .TRST               (TRST                 ), // asynchronous active low reset
	
	 // IR Stage SIgnals
	 .Shift_IR           (Shift_IR_Out_In      ), // Shift IR Stage Shifts the Instruction bit to TDO
	 .ir_shift_in        (ir_shift_out_in      ), // Instruction bit shifts to TDO
	
	 // DR Stage Signals
	 .Shift_DR           (Shift_DR_Out_In      ), // Shift DR Stage Shifts the Data bit to TDO	
	 .bypass_shift_in    (bypass_shift_out_in  ), // Bypass bit shifts to TDO
	 .idcode_shift_in    (idcode_shift_out_in  ), // IDCODE bit Shifts to TDO
	 .dtm_csr_shift_in   (dtm_csr_shift_out_in ), // DTMCS bits shifts to TDO
	 .dmi_access_shift_in(dmi_shift_out_in     ), // DMI bits shifts to TDO
//	 .command_shift_in   (command_shift_out_in ), // COMMAND bits shifts to TDO
	
	 // TDO Output Signals
	 .TDO                (TDO                  ), // Test Data Output
	 .tdo_en             (tdo_en               )  // TDO output enable enables TDO output data
	                                           );
	/* 
	  =====================	End of TDO_Mux =====================
	                                                            */

endmodule
