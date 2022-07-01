
// JTAG DATA REGISTER Module
// Company: FrenusTech Pvt Ltd
// Domain : RTL Domain
// Author : Papu Maharana

`define ZILLA_32_BIT 
`timescale 1ns/1ps
module jtag_data_register 
  #(parameter           DWIDTH  = 32        , // DATA WIDTH for DMI Register
                        AWIDTH  = 32        , // ADDRESS WIDTH for DMI Register
	
	parameter [3:0]     VERSION = 4'h0      , // IDCODE Register VERSION
	parameter [15:0]	PART_NO = 16'h0     , // IDCODE Register PART Number
	parameter [10:0]	MANF_ID = 11'h0       // IDCODE Register Manufacture ID
									       )(
	input               TRST                , // active low asynchronous reset
	input               Reset               , // state is in TEST_LOGIC_RESET State
	input               TDI                 , // Test Data Input
	
	input               Capture_clk         , // shifts the TDI to TDO at posedge TCK clock
	input               Capture_DR          , // Capture the data
	input               Shift_DR            , // controls the Shift Operation of Bypass Register
	
	input               Update_clk          , // Updates the USER DATA at negedge of TCK
	input               Update_DR           , // Updates the USER DATA
	
	input               bypass_sel          , // Selects the Bypass Register
	output              bypass_shift_out    , // Bypass Register Output
	
	input               idcode_sel          , // Selects the IDCODE Register
	output              idcode_shift_out    , // IDCODE Register Output
	
	input               dtm_csr_sel         , // Selects DTM Control & Status Register
	output              dtm_csr_shift_out   , // DTM_CSR Register Output
	
	input               dmi_access_sel      , // Selects DMI Access Register
	output              dmi_access_shift_out, // DMI Access Register Output
	
	input  [DWIDTH-1:0] dmi_data_in         , // Data Read from APB Master
	output [DWIDTH-1:0] dmi_data_out        , // DMI Register Data Out
	output [AWIDTH-1:0] dmi_address_out     , // DMI Register Address Out
	output [1:0]        dmi_op_out          , // DMI operation Output: 0=NOP, 1=READ, 2=WRITE, 3=RESERVED
	output reg          dmi_transfer         // transfer signal operates APB Master FSM
	
//	input               command_sel         , // Selects Abstract Command
//	output              command_shift_out   , // Command Shift Output
//	output [7:0]        cmd_type            , // this type determines the overall functionality of abstract command
//	output [23:0]       control_out           // this field described for each abstract command	
	                                       );
										   
	localparam [1:0] DMINoError = 2'b00;
	localparam [1:0] Reserved   = 2'b01;
	localparam [1:0] OpFailed   = 2'b10;
	localparam [1:0] DMIBusy    = 2'b11;
								 
	// Local Parameter declaration for different registers
	wire [31:0] jtag_idcode;
	wire [31:0] jtag_dtmcsr;
//	wire [31:0] jtag_command;
	wire [40:0] jtag_dmiaccess;
	
	// DTM CSR
	reg 	  dtm_csr_dmi_hard_reset;
	reg 	  dtm_csr_dmi_reset;
	reg [2:0] dtm_csr_idle;
	reg [1:0] dtm_csr_dmi_stat;
	reg [5:0] dtm_csr_abits;
	reg [3:0] dtm_csr_version;
	
	// DMI ACCESS
	wire [6:0]  dmi_address_o;
	reg  [6:0]  dmi_address;
	reg  [31:0] dmi_data;
	reg  [1:0]  dmi_op;
	reg  [1:0]  op_field;
	
	// internal register declaration for data registers
	reg        bypass_reg_out    ; // internal register for Bypass Register
	reg [31:0] idcode_reg_out    ; // internal register for IDCODE Register
	
	reg [31:0] dtm_csr_reg_out   ; // internal register for DTM_CSR
	//reg [31:0] dtm_csr_rdata     ; // DTM_CSR Register Output
	reg        dmi_hard_reset    ; // DTMCS Register 17th pin
	reg        dmi_reset         ; // DTMCS Register 16th pin
	
	reg [40:0] dmi_access_reg_out; // internal register for DMI Access
	reg [40:0] dmi_access_rdata  ; // DMI Access Register Output	
	
//	reg [31:0] abs_cmd_reg_out   ; // Internal Register for Abstract Command
//	reg [31:0] abs_cmd_rdata     ; // Abstract Command Output
	
	assign jtag_idcode = {VERSION, // IDCODE Register VERSION
	                      PART_NO, // IDCODE Register PART Number
						  MANF_ID, // IDCODE Register Manufacture ID
						  1'b1     // IDCODE Standard
							    };
										   
	assign jtag_dtmcsr = {14'd0                 , // zero_31_to_18
	                      dtm_csr_dmi_hard_reset, // dmi_hard_reset
						  dtm_csr_dmi_reset     , // dmi_reset
						  1'b0                  , // zero_15
						  dtm_csr_idle          , // DTMCS IDLE
						  //dtm_csr_dmi_stat      , // dmi_stat
                          2'd0,
						  dtm_csr_abits         , // abits
						  dtm_csr_version         // version
							                   };
	
	assign jtag_dmiaccess = {dmi_address, // Address
							 dmi_data   , // Data
							 2'd0         // Op 
									   };
												  
//	assign jtag_command = {8'd0 , // cmd_type
//						   24'd0  // control 
//							   };
	
	// DATA Registers	
	// Captures & Shifts the DR 
	always @(posedge Capture_clk or negedge TRST)
		begin
			if(!TRST)
				begin
					bypass_reg_out     <= 1'b0 ;
					dmi_access_reg_out <= 41'd0;
					idcode_reg_out     <= 32'd0;
					dtm_csr_reg_out    <= 32'd0;
				//	abs_cmd_reg_out    <= 32'd0;
				end	
				
			else if(Reset)
				begin
					bypass_reg_out     <= 1'b0 ;
					dmi_access_reg_out <= 41'd0;
					idcode_reg_out     <= 32'd0;
					dtm_csr_reg_out    <= 32'd0;
				//	abs_cmd_reg_out    <= 32'd0;
				end	
							
			else if(Capture_DR) // Captures the DATA
				begin
					if(bypass_sel)     // Bypass Register Captures the DATA
						begin
							bypass_reg_out <= 1'b0;
						end					
					if(idcode_sel)     // IDCODE Register Captures the DATA
						begin
							idcode_reg_out <= jtag_idcode;
						end					
					if(dtm_csr_sel)    // DTM_CSR Captures the DATA
						begin
							dtm_csr_reg_out <= jtag_dtmcsr;
						end						
					if(dmi_access_sel) // DMI Access Register Captures the DATA
						begin
							dmi_access_reg_out <= jtag_dmiaccess;
						end
			//		if(command_sel)    // Abstract Command Captures the DATA
			//			begin
			//				abs_cmd_reg_out <= jtag_command;
			//			end
				end
				
			else if(Shift_DR) // Shifts the DATA
				begin
					if(bypass_sel)     // Bypass Register Shifts the DATA
						begin
							bypass_reg_out     <= TDI;
						end
					if(idcode_sel)     // IDCODE Register Shifts the DATA
						begin
							idcode_reg_out     <= {TDI, idcode_reg_out[31:1]} ;
						end
					if(dtm_csr_sel)    // DTM_CSR Shifts the DATA
						begin
							dtm_csr_reg_out    <= {TDI, dtm_csr_reg_out[31:1]};
						end	
					if(dmi_access_sel) // DMI Access Register Shifts the DATA
						begin
							dmi_access_reg_out <= {TDI, dmi_access_reg_out[40:1]};
						end
				//	if(command_sel)    // Abstract Command Shifts the DATA
				//		begin
				//			abs_cmd_reg_out    <= {TDI, abs_cmd_reg_out[31:1]};
				//		end
				end
		end
	
    assign bypass_shift_out     = bypass_reg_out       ; // Bypass Shift Out bit
	assign idcode_shift_out     = idcode_reg_out[0]    ; // IDCODE Shift Out bit
	assign dtm_csr_shift_out    = dtm_csr_reg_out[0]   ; // DTM CSR Shift Out bit
	assign dmi_access_shift_out = dmi_access_reg_out[0]; // DMI Access Shift Out bit
//	assign command_shift_out    = abs_cmd_reg_out[0]   ;
	
	// Updates the DTM CSR, DMI Access, & Abstract Commands DATA
	always @(posedge Update_clk or negedge TRST)
		begin
			if(!TRST)
				begin
					dmi_access_rdata <= 41'd0;
				//	abs_cmd_rdata    <= 32'd0;
				end				
			else if(Update_DR)
				begin
					if(dtm_csr_sel)
						begin
							dmi_hard_reset  <= dtm_csr_reg_out[17];
	                        dmi_reset       <= dtm_csr_reg_out[16];
						end
					if(dmi_access_sel)
						begin
							dmi_access_rdata <= dmi_access_reg_out;
						end						
				//	if(command_sel)
				//		begin
				//			abs_cmd_rdata <= abs_cmd_reg_out;
				//		end
				end
            else
            begin
                dmi_hard_reset <= 1'b0;
            end
		end
	
	assign dmi_address_o   = dmi_access_rdata[40:34];
	assign dmi_address_out = {25'd0, dmi_address_o}; 
	assign dmi_data_out    = dmi_access_rdata[33:2];           
	assign dmi_op_out      = dmi_access_rdata[1:0] ;
	
//	assign cmd_type        = abs_cmd_rdata[31:24];
//	assign control_out     = abs_cmd_rdata[23:0] ;
	
	// logic for dmi transfer
	always @(posedge Update_clk)
		begin
			if(Update_DR && dmi_access_sel && !dmi_hard_reset)
				dmi_transfer <= 1'b1;
			else
				dmi_transfer <= 1'b0;
		end
	
	// DMI OP Field
	
	always @(posedge Capture_clk or negedge TRST)
	begin
	if(!TRST)
		begin
			// DTM_CSR
			dtm_csr_idle 	 <= 3'd0;
			dtm_csr_dmi_stat <= 2'd0;
			dtm_csr_abits	 <= 6'd7;
			dtm_csr_version  <= 4'd1;
			
			// DMI ACCESS
			dmi_address <= 7'd0;
			dmi_data    <= 32'd0;
			dmi_op      <= 2'd0;
		end
	else 
		begin
		if(dmi_hard_reset)
			begin
				// DTM CSR
				dtm_csr_dmi_hard_reset <= 1'b0;
				dtm_csr_dmi_reset <= 1'b0;
				dtm_csr_idle 	  <= 3'd0;
				dtm_csr_dmi_stat  <= 2'd0;
				dtm_csr_abits	  <= 6'd7;
				dtm_csr_version   <= 4'd1;
			  	
				// DMI ACCESS
				dmi_address <= 7'd0;
				dmi_data    <= 32'd0;
				dmi_op      <= 2'd0;
			end
		else
			begin
				// DTM CSR
                dtm_csr_dmi_hard_reset <= 1'b0;
				dtm_csr_dmi_reset <= 1'b0;
                dtm_csr_dmi_stat  <= op_field;
				
				// DMI ACCESS
				dmi_data    <= dmi_data_in;
				dmi_op      <= op_field;
			end
		end
	end
		
endmodule

