
// This is the top module includes both JTAG-APB Master & APB Slave-DM Register 
// Company: FrenusTech Pvt Ltd
// Domain : RTL Design
// Author : JTAG-Papu Maharana & APB-Vinay Chowdary 
`timescale 1ns / 1ps 								  // Time scale

`define ZILLA_32_BIT 

module dtm_to_dm
		#(
		// parameters for JTAG
		parameter   	DWIDTH  = 32   				, // DATA WIDTH for DMI Register
        parameter       AWIDTH  = 32   				, // ADDRESS WIDTH for DMI Register
		parameter		IR_BITS = 5    				, // parameter declaration for Instruction length
						
		parameter 		[3:0]  VERSION = 4'h0 		, // IDCODE Register VERSION
		parameter 		[15:0] PART_NO = 16'h10		, // IDCODE Register PART Number
		parameter 		[10:0] MANF_ID = 11'h20		, // IDCODE Register Manufacture ID
	
		// parameters for APB 
		parameter 	    ADDR_WIDTH = 32				, // 32 bit address bit
		parameter 	   	DATA_WIDTH = 32  			,  // 32 bit data bit

        `ifdef ZILLA_64_BIT
            parameter CORE_DATA_WIDTH = 64
          `elsif ZILLA_32_BIT
            parameter CORE_DATA_WIDTH = 32
           `endif
												   )(

		// ============== JTAG Ports =============
		input           TCK            				, // Test Clock Input: JTAG
		input           TRST           				, // Test Reset Input: asynch active low reset
		input           TMS          			 	, // Test Mode Select Input
		input           TDI            				, // Test Data Input
		output          TDO            				, // Test Data Output
		output          tdo_en         				, // TDO output enable: this flag is high when state is in Shift_IR | Shift_DR
	
		//output          dmi_reset      				, // DTMCS Register 16th pin	
	//	output [7:0]    cmd_type       				, // this type determines the overall functionality of abstract command
	///	output [23:0]   control_out    				, // this field described for each abstract command
	
		// =========== APB Master Ports ============
		input           pclock  					, // APB Clock signal
		input           presetn   					,  // Asynchronous active low reset for APB
		
		// =========== Debug Module FSM Ports ============
		
		input 			step						,
		input 			ebreak 						,
		input 			exception 					,
		input 			[CORE_DATA_WIDTH-1:0] debug_reg_read_data	,
		input 			debug_reg_read_valid		,
        input           [CORE_DATA_WIDTH-1:0] debug_mem_read_data  ,
        input           debug_mem_read_valid        ,
		
		output 			[7:0] cmdtype				,
		output 			ndmreset					,
		//output  		hartreset					,
        output          h_reset                     ,
		output 			haltreq						,
		output 			resumereq					,
		output 			setresethaltreq				,
		output			clrresethaltreq				,
        output          resethaltreq                ,
		output 			debug_reg_write_enable		,
		output 			[CORE_DATA_WIDTH-1:0] debug_reg_write_data	,
		output 			debug_reg_read_enable		,
		output 			[15:0]debug_reg_address		,
        output          debug_mem_read_enable       ,
        output          debug_mem_write_enable      ,
        output          [CORE_DATA_WIDTH-1:0]debug_mem_read_addr   ,
        output          [CORE_DATA_WIDTH-1:0]debug_mem_write_addr  ,
        output          [CORE_DATA_WIDTH-1:0]debug_mem_write_data  ,
        output          [(CORE_DATA_WIDTH>>3)-1:0] debug_mem_strobe         

				
												   );	
		// Declaration of wires
	
		wire 			[DATA_WIDTH-1:0] prdata		;
		wire 			pready						;
		wire 			pslverr						;
		wire 			psel 						;
		wire 			penable 					;
		wire 			pwrite 						;
		wire 			[DATA_WIDTH-1:0] pwdata		;
		wire 		    [ADDR_WIDTH-1 :0] paddr 	;
		wire 			transfer_reg 				;
		wire 			postexec					;
		wire 			[DATA_WIDTH-1:0] command_reg;
		wire 			[2:0] cmderr 				;
		wire 			dmactive					;
		wire 			busy 						;
		wire 			halted 						;
		wire 			running						;
        wire            done                        ;
        wire            reset                       ;
        wire            hartreset                   ;
      //  wire            h_reset                     ;
      //
        assign reset = (hartreset || ndmreset ) ? 1'b1 : 1'b0 ;
	
		/* ;
		=============== Instatiation of JTAG TOP =============== 
	                                                          */
		jtag_apb_master_interface
		#(.DWIDTH        (DWIDTH          ), // DATA WIDTH for DMI Register
		.AWIDTH          (AWIDTH          ), // ADDRESS WIDTH for DMI Register
		.IR_BITS         (IR_BITS         ), // parameter declaration for Instruction length						
		.VERSION         (VERSION         ), // IDCODE Register VERSION
		.PART_NO         (PART_NO         ), // IDCODE Register PART Number
		.MANF_ID         (MANF_ID         )  // IDCODE Register Manufacture ID 
										  ) jtag_apb_master_interface_instance 
		(
		.TCK             (TCK             ), // Test Clock Input
		.TRST            (TRST            ), // Test Reset Input: asynch active low reset
		.TMS             (TMS             ), // Test Mode Select Input
		.TDI             (TDI             ), // Test Data Input
		.TDO             (TDO             ), // Test Data Output
		.tdo_en          (tdo_en          ), // TDO output enable: this flag is high when state is in Shift_IR | Shift_DR
		//.dmi_reset       (dmi_reset       ), // DTMCS Register 16th pin
	//	.cmd_type        (cmd_type        ), // this type determines the overall functionality of abstract command
	//	.control_out     (control_out     ), // this field described for each abstract command
		.pclock		  	 (pclock    	  ), // System clock
		.presetn		 (presetn		  ), // Active low reset signal
		.prdata			 (prdata		  ), // read data from DM registers by slave
		.pready 	 	 (pready		  ), // Ready signal coming from APB Slave 
		.pslverr 		 (pslverr		  ), // Error Signal coming from APB Slave
		.psel 			 (psel   		  ), // Selecct signal
		.pwrite			 (pwrite		  ), // Write signal 1 indicates write 0 indicates read
		.penable		 (penable		  ), // Enable signal
		.paddr 			 (paddr		  	  ), // Address signal going to slave
		.pwdata 		 (pwdata		  ) 
	                                     );
		/* 
		=============== End of JTAG TOP =============== 
	                                                 */								   
	
									 
		/* 
		================== Instatiation of APB Slave DM reg top ================= 
																	 */
		apb_slave_dmreg_top 
		#(
		.ADDR_WIDTH    (ADDR_WIDTH        ), // 32 bit address bit
		.DATA_WIDTH    (DATA_WIDTH        ),  // 32 bit data bit

        .CORE_DATA_WIDTH(CORE_DATA_WIDTH)   
										  )
		apb_slave_dmreg_top_instnc     	  (
		.pclock		     (pclock		  ), // System clock
		.presetn	     (presetn		  ), // Active low reset signal
		.psel		     (psel			  ), // Select signal
		.penable		 (penable		  ), // Enable signal coming from Master
		.pwrite			 (pwrite		  ), // write signal coming from Master 1 for write , 0 for rread
		.paddr			 (paddr		  	  ), // Address signal coming from Master
		.pwdata			 (pwdata		  ), // write data coming from Master
		.prdata			 (prdata		  ), // Data read from DM registers going to Master
		.pready			 (pready		  ), // Ready signal going tto Master
		.pslverr 		 (pslverr		  ), // Error signal indicates failure of transaction going to Master
		.running(running)							,
		.halted(halted)								,
        .h_reset(h_reset)                           ,
        .done(done)                                 ,
		.busy(busy)									,
		.exception(exception)						,
		.dmactive(dmactive)							,
		.ndmreset(ndmreset)							,
		.clrresethaltreq(clrresethaltreq)			,
		.setresethaltreq(setresethaltreq)			,
		.hartreset(hartreset)						,
		.resumereq(resumereq)						,
		.haltreq(haltreq)							,
		.transfer_reg(transfer_reg)					,
		.postexec(postexec)							,
		.command_reg(command_reg)					,
		.cmderr(cmderr)								,
		.cmdtype(cmdtype)							,
		.debug_reg_write_enable(debug_reg_write_enable),
		.debug_reg_write_data(debug_reg_write_data)	,
		.debug_reg_read_data(debug_reg_read_data)	,
		.debug_reg_read_valid(debug_reg_read_valid)	,
		.debug_reg_read_enable(debug_reg_read_enable),
		.debug_reg_address(debug_reg_address)        ,
        .debug_mem_read_data(debug_mem_read_data),
        .debug_mem_read_valid(debug_mem_read_valid),
        .debug_mem_write_enable(debug_mem_write_enable),
        .debug_mem_read_enable(debug_mem_read_enable),
        .debug_mem_read_addr(debug_mem_read_addr),
        .debug_mem_write_addr(debug_mem_write_addr),
        .debug_mem_write_data(debug_mem_write_data),
        .debug_mem_strobe(debug_mem_strobe)


		
	
													);						
	/* 
	  ====================== End of APB Slave DM Reg Top ===================== 
																	*/
																	
	/* 
	  ====================== Start of Debug Module FSM ===================== 
		
															*/
		debug_module_fsm  debug_module_fsm_instnc			
											(
		.pclock(pclock) 					,
		.presetn(presetn)					,
		.dmactive(dmactive)					,
		.setresethaltreq(setresethaltreq)	,
		.clrresethaltreq(clrresethaltreq)	,
        .resethaltreq(resethaltreq)         ,
		.hartreset(reset)				,
        //.h_reset(h_reset)                   ,
		.resumereq(resumereq)				,
		.haltreq(haltreq)					,
		.step(step)					 		,
		.ebreak(ebreak)						,
		.command(command_reg)				,
		.cmderr(cmderr)						,
        .exception(exception)               ,
		.transfer_reg(transfer_reg)			,
		.postexec(postexec)					,	
		.busy(busy)		  				   	,
		.halted(halted)						,
        .h_reset(h_reset)                   ,
        .done(done)                         ,
		.running(running)					);

		
	/* 
	  ====================== End of Debug Module FSM ===================== 
		
															*/

endmodule
