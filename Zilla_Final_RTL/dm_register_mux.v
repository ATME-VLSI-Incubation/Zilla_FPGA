
// Project: DM Register Mux
// Company: FrenusTech Pvt Ltd
// Domain : RTL Design
// Author : Vinay chowdary

`define ZILLA_32_BIT 
`timescale 1ns / 1ps  
module  dm_register_mux	
													   #(
		parameter 	ADDR_WIDTH = 32						,	// 32 bit address bit
		parameter 	DATA_WIDTH = 32	   						// 32 bit data bit
													    )		
														(
		// inputs of DM register mux
		
		// inputs coming from apb slave dmreg top
		input 		clock								,	// System clock signal
		input 		resetn 								,	// Active low reset signal
		
		input 		sel									,	// Select signal coming from APB Matser
		input 		enable								,	// Enable signal coming from APB Master
		input 		write 								,	// Write signal coming from APB Master
		input 		[ADDR_WIDTH-1:0] addr				,	// Address coming from APB Master
		
		// inputs coming from dm register file
		input 		[DATA_WIDTH-1:0] dmstatus_reg		,	// Debug module status register coming from DM_Register_file
		input  		[DATA_WIDTH-1:0] hartinfo_reg 		,	// Hart information register coming from DM_Register_file
		input 		[DATA_WIDTH-1:0] command_reg		,	// Abstract command register coming from DM_Register_file
		input 		[DATA_WIDTH-1:0] abstractcs_reg		,	// Abstract command and status register coming from DM_Register_file
		input  		[DATA_WIDTH-1:0] dmcontrol_reg		,	// Debug module control register coming from DM_Register_file
		input 		[DATA_WIDTH-1:0] data0_reg			,	// Abstract Data 0 register coming from DM_Register_file
		input  		[DATA_WIDTH-1:0] data1_reg			,	// Abstract Data 1 register coming from DM_Register_file
		input 		[DATA_WIDTH-1:0] data2_reg			,	// Abstract Data 2 register coming from DM_Register_file
		input 		[DATA_WIDTH-1:0] data3_reg			,	// Abstract Data 3 register coming from DM_Register_file
		`ifdef PROGRAM_BUFFER_VALID
        input 		[DATA_WIDTH-1:0] data4_reg			,	// Abstract Data 4 register coming from DM_Register_file
		input 		[DATA_WIDTH-1:0] data5_reg			,	// Abstract Data 5 register coming from DM_Register_file
		input 	 	[DATA_WIDTH-1:0] data6_reg			,	// Abstract Data 6 register coming from DM_Register_file
		input  		[DATA_WIDTH-1:0] data7_reg			,	// Abstract Data 7 register coming from DM_Register_file
		input  		[DATA_WIDTH-1:0] data8_reg			,	// Abstract Data 8 register coming from DM_Register_file
		input  		[DATA_WIDTH-1:0] data9_reg			,	// Abstract Data 9 register coming from DM_Register_file
		input  		[DATA_WIDTH-1:0] data10_reg			,	// Abstract Data 10 register coming from DM_Register_file
		input  		[DATA_WIDTH-1:0] data11_reg			,	// Abstract Data 11 register coming from DM_Register_file
		input  		[DATA_WIDTH-1:0] progbuf0_reg		,	// Program buffer 0 register coming from DM_Register_file
		input  		[DATA_WIDTH-1:0] progbuf1_reg		,	// Program buffer 1 register coming from DM_Register_file
		input  		[DATA_WIDTH-1:0] progbuf2_reg		,	// Program buffer 2 register coming from DM_Register_file
		input  		[DATA_WIDTH-1:0] progbuf3_reg		,	// Program buffer 3 register coming from DM_Register_file
		input  		[DATA_WIDTH-1:0] progbuf4_reg		,	// Program buffer 4 register coming from DM_Register_file
		input  		[DATA_WIDTH-1:0] progbuf5_reg		,	// Program buffer 5 register coming from DM_Register_file
		input  		[DATA_WIDTH-1:0] progbuf6_reg		,	// Program buffer 6 register coming from DM_Register_file
		input  		[DATA_WIDTH-1:0] progbuf7_reg		,	// Program buffer 7 register coming from DM_Register_file
		input  		[DATA_WIDTH-1:0] progbuf8_reg		,	// Program buffer 8 register coming from DM_Register_file
		input  		[DATA_WIDTH-1:0] progbuf9_reg		,	// Program buffer 9 register coming from DM_Register_file
		input  		[DATA_WIDTH-1:0] progbuf10_reg		,	// Program buffer 10 register coming from DM_Register_file
		input  		[DATA_WIDTH-1:0] progbuf11_reg		,	// Program buffer 11 register coming from DM_Register_file
		input  		[DATA_WIDTH-1:0] progbuf12_reg		,	// Program buffer 12 register coming from DM_Register_file
		input  		[DATA_WIDTH-1:0] progbuf13_reg		,	// Program buffer 13 register coming from DM_Register_file
		input  		[DATA_WIDTH-1:0] progbuf14_reg		,	// Program buffer 14 register coming from DM_Register_file
		input  		[DATA_WIDTH-1:0] progbuf15_reg	  	,	// Program buffer 15 register coming from DM_Register_file
    `endif
		output reg 	[DATA_WIDTH-1:0] reg_data_out 	   );	// Data out signal
		
		
		
		// reg_data_out logic
		always@(negedge clock or negedge resetn)
			begin
				if(~resetn)
					begin
						reg_data_out <= 0;				// Under reset reg_data_out will be zero
					end
				else 
					begin
						if(sel && enable && ~write)		// Read condition
							begin
								case(addr[7:0])
									8'h04 :			reg_data_out <= data0_reg 		;	// read from data0 register
									8'h05 :			reg_data_out <= data1_reg		;	// read from data1 register
									8'h06 :			reg_data_out <= data2_reg 		;	// read from data2 register
									8'h07 : 		reg_data_out <= data3_reg 		;	// read from data3 register
									8'h10 : 		reg_data_out <= {2'b0,dmcontrol_reg[29],2'b0,dmcontrol_reg[26:6],4'b0,dmcontrol_reg[1:0]}	;	// read from dmcontrol register
									8'h11 : 		reg_data_out <= dmstatus_reg	;	// read from dmstatus register
									8'h12 : 		reg_data_out <= hartinfo_reg	;	// read from hartinfo register
									8'h16 : 		reg_data_out <= abstractcs_reg	;	// read from abstractcs register
									8'h17 : 		reg_data_out <= 32'b0			;	// read from command register
                                    `ifdef PROGRAM_BUFFER_VALID
                                    8'h08 : 		reg_data_out <= data4_reg 		;	// read from data4 register
									8'h09 : 		reg_data_out <= data5_reg 		;	// read from data5 register
									8'h0A : 		reg_data_out <= data6_reg		;	// read from data6 register
									8'h0B : 		reg_data_out <= data7_reg	 	;	// read from data7 register
									8'h0C : 		reg_data_out <= data8_reg 		;	// read from data8 register
									8'h0D : 		reg_data_out <= data9_reg 		;	// read from data9 register
									8'h0E : 		reg_data_out <= data10_reg		;	// read from data10 register
									8'h0F : 		reg_data_out <= data11_reg		;	// read from data11 register
									8'h20 : 		reg_data_out <= progbuf0_reg	;	// read from progbuf0 register
									8'h21 : 		reg_data_out <= progbuf1_reg	;	// read from progbuf1 register
									8'h22 : 		reg_data_out <= progbuf2_reg	;	// read from progbuf2 register
									8'h23 : 		reg_data_out <= progbuf3_reg	;	// read from progbuf3 register
									8'h24 : 		reg_data_out <= progbuf4_reg	;	// read from progbuf4 register
									8'h25 : 		reg_data_out <= progbuf5_reg	;	// read from progbuf5 register
									8'h26 : 		reg_data_out <= progbuf6_reg	;	// read from progbuf6 register
									8'h27 : 		reg_data_out <= progbuf7_reg	;	// read from progbuf7 register
									8'h28 : 		reg_data_out <= progbuf8_reg	;	// read from progbuf8 register
									8'h29 : 		reg_data_out <= progbuf9_reg	;	// read from progbuf9 register
									8'h2A : 		reg_data_out <= progbuf10_reg	;	// read from progbuf10 register
									8'h2B : 		reg_data_out <= progbuf11_reg	;	// read from progbuf11 register
									8'h2C : 		reg_data_out <= progbuf12_reg	;	// read from progbuf12 register
									8'h2D : 		reg_data_out <= progbuf13_reg	;	// read from progbuf13 register
									8'h2E : 		reg_data_out <= progbuf14_reg	;	// read from progbuf14 register
									8'h2F : 		reg_data_out <= progbuf15_reg	;	// read from progbuf15 register
                                `endif
									default : 		reg_data_out <= 0 				;	// read 0 when default address
								endcase
							end
						else
							begin
								reg_data_out <=0;
							end
					end
			end

endmodule
