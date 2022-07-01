
// TAP Controller State Machine Design
// It has 16 statees, 4 mandotory pins and 1 optional pin
// Company: FrenusTech Pvt Ltd
// Domain : RTL Domain
// Author : Papu Maharana

`define ZILLA_32_BIT 
`timescale 1ns/1ps

module jtag_tap_controller(
	input    TMS             , // Test Mode Select Input controls TAP Controller
	input    TCK             , // Test Clock Input 
    input    TRST            , // Active low asynchronous reset resets the TAP Controller
//	input    risc_rst_i      , // Core reset pin : active low reset pin

	// outputs for Data Register Path
    output   dr_scan         , // State is in DR Scan State
	output   Capture_DR      , // Controls Capture operation in DR Path
	output   Shift_DR        , // Controls Shift Operation in DR Path
	output   Update_DR       , // Control Update DR operation
	
	// outputs for Instruction Register Path
	output   Capture_IR      , // Controls Capture operation in IR Path
	output   Shift_IR        , // Controls Shift operation in IR Path
	output   Update_IR       , // Control Update IR operation

	// capture and update stage clock signals 
	output   Capture_clk     , // posedge clpck signal for capture and shift stages
	output   Update_clk      , // negedge clock signal for update stage	
	output   Reset             // Reset Output
	                        );

	//reg    tms_q1, tms_q2, tms_q3, tms_q4; //, tms_q5;
	wire   tms_reset;        // reset to test_logic_reset state
	wire   resetn;           // reset to initial state when jtag reset or core reset is low	
	
	reg    test_logic_reset; // Test Logic Reset State
	reg    run_test_idle   ; // Run Test Idle State
	
	// Data Register Signals
	reg    select_dr_scan;   // Select DR Scan State
	reg    capture_dr;		 // Capture_DR State
	reg    shift_dr;		 // Shift_DR State
	reg    exit1_dr;		 // Exit1 DR State
	reg    pause_dr; 		 // Pause DR State
	reg    exit2_dr; 		 // Exit2 DR State
	reg    update_dr;	  	 // Update DR State
	
	// Instruction Register Signals
	reg    select_ir_scan;	 // Select IR Scan State
	reg    capture_ir;		 // Capture_IR State
	reg    shift_ir;		 // Shift_IR State
	reg    exit1_ir;		 // Exit1 IR State
	reg    pause_ir;		 // Pause IR State
	reg    exit2_ir;		 // Exit2 IR State
	reg    update_ir;		 // Update IR State

	// 5 consecutive TMS=1 cause state to test_logic_reset state
	/*always @(posedge TCK)
	begin
		tms_q1 <= TMS;
		tms_q2 <= tms_q1;
		tms_q3 <= tms_q2;
		tms_q4 <= tms_q3;
     	//tms_q5 <= tms_q4;
	end*/

	assign tms_reset = 1'b0; //tms_q1 & tms_q2 & tms_q3 & tms_q4 & TMS; //& tms_q5; // 5 consecutive TMS=1 causes reset
	assign resetn    = (!TRST /*|| !risc_rst_i*/ ) ? 1'b0 : 1'b1;  // asynchronous active low reset
	
	/*****************************************************************************************
	*            TAP State Machine: It has 16 state machine having DR and IR Paths           *
	*****************************************************************************************/
	
	// Test Logic Reset State
	always @(posedge TCK or negedge resetn)
	begin
		if(!resetn)
			test_logic_reset <= 1'b1;
		else if(tms_reset)
			test_logic_reset <= 1'b1;
		else begin
			if(TMS && (test_logic_reset || select_ir_scan))
				test_logic_reset <= 1'b1;
			else 
				test_logic_reset <= 1'b0;
		end
	end

	// Run Test Idle State
	always @(posedge TCK or negedge resetn)
	begin
		if(!resetn)
			run_test_idle <= 1'b0;
		else if(tms_reset)
			run_test_idle <= 1'b0;
		else begin
			if(!TMS && (test_logic_reset || run_test_idle || update_dr || update_ir))
				run_test_idle <= 1'b1;
			else 
				run_test_idle <= 1'b0;
		end
	end
	
	// Select DR Scan State
	always @(posedge TCK or negedge resetn)
	begin
		if(!resetn)
			select_dr_scan <= 1'b0;
		else if(tms_reset)
			select_dr_scan <= 1'b0;
		else begin
			if(TMS && (run_test_idle || update_dr || update_ir))
				select_dr_scan <= 1'b1;
			else 
				select_dr_scan <= 1'b0;
		end
	end
	
	// Capture DR State
	always @(posedge TCK or negedge resetn)
	begin
		if(!resetn)
			capture_dr <= 1'b0;
		else if(tms_reset)
			capture_dr <= 1'b0;
		else begin
			if(!TMS && select_dr_scan)
				capture_dr <= 1'b1;
			else
				capture_dr <= 1'b0;
		end
	end
	
	// Shift DR State
	always @(posedge TCK or negedge resetn)
	begin
		if(!resetn)
			shift_dr <= 1'b0;
		else if(tms_reset)
			shift_dr <= 1'b0;
		else begin 
			if(!TMS && (capture_dr || shift_dr || exit2_dr))
				shift_dr <= 1'b1;
			else
				shift_dr <= 1'b0;
            end
		end
	
	// Exit1 DR State
	always @(posedge TCK or negedge resetn)
	begin
		if(!resetn)
			exit1_dr <= 1'b0;
		else if(tms_reset)
			exit1_dr <= 1'b0;
		else begin 
			if(TMS && (capture_dr || shift_dr))
				exit1_dr <= 1'b1;
			else
				exit1_dr <= 1'b0;
		end
	end
	
	// Pause DR State
	always @(posedge TCK or negedge resetn)
	begin
		if(!resetn)
			pause_dr <= 1'b0;
		else if(tms_reset)
			pause_dr <= 1'b0;
		else begin
			if(!TMS && (exit1_dr || pause_dr))
				pause_dr <= 1'b1;
			else
				pause_dr <= 1'b0;
		end
	end
	
	// Exit2 DR State
	always @(posedge TCK or negedge resetn)
	begin
		if(!resetn)
			exit2_dr <= 1'b0;
		else if(tms_reset)
			exit2_dr <= 1'b0;
		else begin
			if(TMS && pause_dr)
				exit2_dr <= 1'b1;
			else 
				exit2_dr <= 1'b0;
		end
	end
	
	// Update DR State
	always @(posedge TCK or negedge resetn)
	begin
		if(!resetn)
			update_dr <= 1'b0;
		else if(tms_reset)
			update_dr <= 1'b0;
		else begin
			if(TMS && (exit1_dr || exit2_dr))
				update_dr <= 1'b1;
			else 
				update_dr <= 1'b0;
		end
	end
	
	// Select IR Scan State
	always @(posedge TCK or negedge resetn)
	begin
		if(!resetn)
			select_ir_scan <= 1'b0;
		else if(tms_reset)
			select_ir_scan <= 1'b0;
		else begin
			if(TMS && select_dr_scan)
				select_ir_scan <= 1'b1;
			else 
				select_ir_scan <= 1'b0;
		end
	end
	
	// Capture IR State
	always @(posedge TCK or negedge resetn)
	begin
		if(!resetn)
			capture_ir <= 1'b0;
		else if(tms_reset)
			capture_ir <= 1'b0;
		else begin
			if(!TMS && select_ir_scan)
				capture_ir <= 1'b1;
			else
				capture_ir <= 1'b0;
		end
	end
	
	// Shift IR State
	always @(posedge TCK or negedge resetn)
	begin
		if(!resetn)
			shift_ir <= 1'b0;
		else if(tms_reset)
			shift_ir <= 1'b0;
		else begin
			if(!TMS && (capture_ir || shift_ir || exit2_ir))
				shift_ir <= 1'b1;
			else
				shift_ir <= 1'b0;
		end
	end
	
	// Exit1 IR State
	always @(posedge TCK or negedge resetn)
	begin
		if(!resetn)
			exit1_ir <= 1'b0;
		else if(tms_reset)
			exit1_ir <= 1'b0;
		else begin
			if(TMS && (capture_ir || shift_ir))
				exit1_ir <= 1'b1;
			else
				exit1_ir <= 1'b0;
		end
	end
	
	// Pause IR State
	always @(posedge TCK or negedge resetn)
	begin
		if(!resetn)
			pause_ir <= 1'b0;
		else if(tms_reset)
			pause_ir <= 1'b0;
		else begin
			if(!TMS && (exit1_ir || pause_ir))
				pause_ir <= 1'b1;
			else
				pause_ir <= 1'b0;
		end
	end
	
	// Exit2 IR State
	always @(posedge TCK or negedge resetn)
	begin
		if(!resetn)
			exit2_ir <= 1'b0;
		else if(tms_reset)
			exit2_ir <= 1'b0;
		else begin
			if(TMS && pause_ir)
				exit2_ir <= 1'b1;
			else
				exit2_ir <= 1'b0;
		end
	end
	
	// Update IR State
	always @(posedge TCK or negedge resetn)
	begin
		if(!resetn)
			update_ir <= 1'b0;
		else if(tms_reset)
			update_ir <= 1'b0;
		else begin
			if(TMS && (exit1_ir || exit2_ir))
				update_ir <= 1'b1;
			else
				update_ir <= 1'b0;
		end
	end
	
	/*****************************************************************************************
	*                                   TAP State Machine Ends                               *
	*****************************************************************************************/

	assign Capture_clk =  TCK;               // Clock signal for Capture and Shift Stages: posedge TCK
	assign Update_clk  = ~TCK;               // Clock Signal for Update Stage            : negedge TCK	
	assign Reset       =  test_logic_reset;  // state is in test logic reset state to reset to initial cnditions
	
    assign dr_scan     =  select_dr_scan;    // state is in select_dr_scan state
	assign Capture_DR  =  capture_dr;		 // state is in capture_dr state
	assign Shift_DR    =  shift_dr;          // state is in shift_dr state
	assign Update_DR   =  update_dr;		 // state is in update_dr state
	
	assign Capture_IR  =  capture_ir;		 // state is in capture_ir state
	assign Shift_IR    =  shift_ir;			 // state is in shift_ir state
	assign Update_IR   =  update_ir; 		 // state is in update_ir state

endmodule

