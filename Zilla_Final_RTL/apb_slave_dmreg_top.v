
// Project: APB_Slave_dmreg_top
// Company: FrenusTech Pvt Ltd
// Domain : RTL Design
// Author : Vinay chowdary

`define ZILLA_32_BIT 
`timescale 1ns / 1ps 											// Time scale 

module apb_slave_dmreg_top 
														   #(
		parameter 	ADDR_WIDTH = 0							,	// 32 bit address bit
		parameter 	DATA_WIDTH = 0	   						,	//  32 bit data bit

        parameter   CORE_DATA_WIDTH = 0
															)
															(
		// Inputs of APB Slave
		
		input 		pclock 									,	// System Clock signal
		input 		presetn									,	// Active low reset signal
		input 		psel									,	// Select signal coming from APB Master
		input 		penable									,	// Enable signal coming from APB Master
		input 		pwrite 									,	// Write signal coming from APB Master
		input 		[ADDR_WIDTH-1:0] paddr					,	// Address coming from APB Master
		input 		[DATA_WIDTH-1:0] pwdata					,	// Data signal coming from APB Master
		
		//Inputs coming from Debug Module FSM
		
		input 		running									,
		input 		halted									,
        input       h_reset                                 ,
        input       done                                    ,
		input 		busy									,
		
		// inputs coming from TOP
		input 		exception								,
		input 		[CORE_DATA_WIDTH-1:0]debug_reg_read_data				,
		input 		debug_reg_read_valid					,
        input       [CORE_DATA_WIDTH-1:0] debug_mem_read_data              ,
        input       debug_mem_read_valid                    ,
		
		//outputs of APB Slave
		
		output 		[DATA_WIDTH-1:0] prdata					,	// output data signal going to APB Master
		output reg	pready									,	// Ready signal going to APB Master
		output reg 	pslverr								    ,	// Error signal indicates failure of transfer
		output 		dmactive								,
		output 		ndmreset								,
		output 		clrresethaltreq							,
		output 		setresethaltreq							,
		output 		hartreset								,
		output 		resumereq								,
		output 		haltreq									,
		output  	transfer_reg 							,
		output 		postexec 								,
		output 		[2:0] cmderr							,
		output 		[31:0] command_reg						,
		output 		debug_reg_write_enable 					,
		output 		[7:0] cmdtype							,
		output 		debug_reg_read_enable					,
		output 		[15:0]debug_reg_address					,
		output 		[CORE_DATA_WIDTH-1:0]debug_reg_write_data,

        output      debug_mem_read_enable                   ,
        output      debug_mem_write_enable                  ,
        output      [CORE_DATA_WIDTH-1:0]debug_mem_read_addr,
        output      [CORE_DATA_WIDTH-1:0]debug_mem_write_addr,
        output      [CORE_DATA_WIDTH-1:0]debug_mem_write_data ,
        output      [(CORE_DATA_WIDTH>>3)-1:0] debug_mem_strobe                  
                                                            );
		
		// declaration of wires
		
		wire 		[DATA_WIDTH-1:0] dmstatus_reg			;
		wire 		[DATA_WIDTH-1:0] hartinfo_reg			;
		wire		[DATA_WIDTH-1:0] abstractcs_reg			;
		wire  		[DATA_WIDTH-1:0] dmcontrol_reg			;
		wire 		[DATA_WIDTH-1:0] data0_reg				;
		wire  		[DATA_WIDTH-1:0] data1_reg				;
		wire 		[DATA_WIDTH-1:0] data2_reg				;
		wire		[DATA_WIDTH-1:0] data3_reg				;
        `ifdef PROGRAM_BUFFER_VALID
		wire 		[DATA_WIDTH-1:0] data4_reg				;
		wire 		[DATA_WIDTH-1:0] data5_reg				;
		wire 		[DATA_WIDTH-1:0] data6_reg				;
		wire  		[DATA_WIDTH-1:0] data7_reg				;
		wire 		[DATA_WIDTH-1:0] data8_reg				;
		wire  		[DATA_WIDTH-1:0] data9_reg				;
		wire  		[DATA_WIDTH-1:0] data10_reg				;
		wire  		[DATA_WIDTH-1:0] data11_reg				;
		wire  		[DATA_WIDTH-1:0] progbuf0_reg			;
		wire  		[DATA_WIDTH-1:0] progbuf1_reg			;
		wire  		[DATA_WIDTH-1:0] progbuf2_reg			;
		wire  		[DATA_WIDTH-1:0] progbuf3_reg			;
		wire  		[DATA_WIDTH-1:0] progbuf4_reg			;
		wire  		[DATA_WIDTH-1:0] progbuf5_reg			;
		wire  		[DATA_WIDTH-1:0] progbuf6_reg			;
		wire  		[DATA_WIDTH-1:0] progbuf7_reg			;
		wire  		[DATA_WIDTH-1:0] progbuf8_reg			;
		wire  		[DATA_WIDTH-1:0] progbuf9_reg			;
		wire  		[DATA_WIDTH-1:0] progbuf10_reg			;
		wire  		[DATA_WIDTH-1:0] progbuf11_reg			;
		wire  		[DATA_WIDTH-1:0] progbuf12_reg			;
		wire  		[DATA_WIDTH-1:0] progbuf13_reg			;
		wire  		[DATA_WIDTH-1:0] progbuf14_reg			;
		wire   		[DATA_WIDTH-1:0] progbuf15_reg	   		;
    `endif
		
		
		// dm register instantiation
		
		dm_register_file #(
					.ADDR_WIDTH(ADDR_WIDTH      			), // 32 bit address bit
					.DATA_WIDTH(DATA_WIDTH      			),  // 32 bit data bit
                    .CORE_DATA_WIDTH(CORE_DATA_WIDTH)
															) 
		dm_register_file_instnc 		
															(
					.pclock(pclock)							,
					.presetn(presetn)						,
					.psel(psel)								,
					.penable(penable)						,
					.pwrite(pwrite)							,
					.paddr(paddr)							,
					.pwdata(pwdata)							,
					.running(running)						,
					.halted(halted)							,
                    .h_reset(h_reset)                       ,
                    .done(done)                             ,
					.busy(busy)								,
					.exception(exception)					,
					.dmstatus_reg(dmstatus_reg)				,
					.hartinfo_reg(hartinfo_reg)				,
					.command_reg(command_reg)				,
					.abstractcs_reg(abstractcs_reg)			,
					.dmcontrol_reg(dmcontrol_reg)			,
					.data0_reg(data0_reg)					,
					.data1_reg(data1_reg)					,
					.data2_reg(data2_reg)					,
					.data3_reg(data3_reg)					,
                    `ifdef PROGRAM_BUFFER_VALID
					.data4_reg(data4_reg)					,
					.data5_reg(data5_reg)					,
					.data6_reg(data6_reg)					,
					.data7_reg(data7_reg)					,
					.data8_reg(data8_reg)					,
					.data9_reg(data9_reg)					,
					.data10_reg(data10_reg)					,
					.data11_reg(data11_reg)					,
					.progbuf0_reg(progbuf0_reg)				,
					.progbuf1_reg(progbuf1_reg)				,
					.progbuf2_reg(progbuf2_reg)				,
					.progbuf3_reg(progbuf3_reg)				,
					.progbuf4_reg(progbuf4_reg)				,
					.progbuf5_reg(progbuf5_reg)				,
					.progbuf6_reg(progbuf6_reg)				,
					.progbuf7_reg(progbuf7_reg)				,
					.progbuf8_reg(progbuf8_reg)				,
					.progbuf9_reg(progbuf9_reg)				,
					.progbuf10_reg(progbuf10_reg)			,
					.progbuf11_reg(progbuf11_reg)			,
					.progbuf12_reg(progbuf12_reg)			,
					.progbuf13_reg(progbuf13_reg)			,
					.progbuf14_reg(progbuf14_reg)			,
					.progbuf15_reg(progbuf15_reg)		  	,
                `endif
					.dmactive(dmactive)						,
					.ndmreset(ndmreset)						,
					.clrresethaltreq(clrresethaltreq)		,
					.setresethaltreq(setresethaltreq)		,
					.hartreset(hartreset)					,
					.resumereq(resumereq)					,
					.haltreq(haltreq)						,
					.transfer_reg(transfer_reg)				,
					.postexec(postexec)						,
					.cmderr(cmderr)							,
					.cmdtype(cmdtype)						,
					.debug_reg_write_data(debug_reg_write_data),
					.debug_reg_read_data(debug_reg_read_data),
					.debug_reg_read_enable(debug_reg_read_enable),
					.debug_reg_write_enable(debug_reg_write_enable)	,
					.debug_reg_read_valid(debug_reg_read_valid),
					.debug_reg_address(debug_reg_address)   ,
                    .debug_mem_read_data(debug_mem_read_data),
                    .debug_mem_read_valid(debug_mem_read_valid),
                    .debug_mem_write_enable(debug_mem_write_enable),
                    .debug_mem_read_enable(debug_mem_read_enable),
                    .debug_mem_read_addr(debug_mem_read_addr),
                    .debug_mem_write_addr(debug_mem_write_addr),
                    .debug_mem_write_data(debug_mem_write_data),
                    .debug_mem_strobe(debug_mem_strobe)     
														   );
					
		// dm register mux instantiation
		
		dm_register_mux #(
					.ADDR_WIDTH(ADDR_WIDTH)					, // 32 bit address bit
					.DATA_WIDTH(DATA_WIDTH)  				  // 32 bit data bit		
															) 
					dm_register_mux_instnc 		
															(
					.clock(pclock)							,
					.resetn(presetn)						,
					.sel(psel)								,
					.enable(penable)						,
					.write(pwrite)			 				,
					.addr(paddr)							,
					.dmstatus_reg(dmstatus_reg)				,
					.hartinfo_reg(hartinfo_reg) 			,
					.command_reg(command_reg)				,
					.abstractcs_reg(abstractcs_reg)			,
					.dmcontrol_reg(dmcontrol_reg)			,
					.data0_reg(data0_reg)					,
					.data1_reg(data1_reg)					,
					.data2_reg(data2_reg)					,
					.data3_reg(data3_reg)					,
                    `ifdef PROGRAM_BUFFER_VALID
					.data4_reg(data4_reg)					,
					.data5_reg(data5_reg)					,
					.data6_reg(data6_reg)					,
					.data7_reg(data7_reg)					,
					.data8_reg(data8_reg)					,
					.data9_reg(data9_reg)					,
					.data10_reg(data10_reg)					,
					.data11_reg(data11_reg)					,
					.progbuf0_reg(progbuf0_reg)				,
					.progbuf1_reg(progbuf1_reg)				,
					.progbuf2_reg(progbuf2_reg)				,
					.progbuf3_reg(progbuf3_reg)				,
					.progbuf4_reg(progbuf4_reg)				,
					.progbuf5_reg(progbuf5_reg)				,
					.progbuf6_reg(progbuf6_reg)				,
					.progbuf7_reg(progbuf7_reg)				,
					.progbuf8_reg(progbuf8_reg)				,
					.progbuf9_reg(progbuf9_reg)				,
					.progbuf10_reg(progbuf10_reg)			,
					.progbuf11_reg(progbuf11_reg)			,
					.progbuf12_reg(progbuf12_reg)			,
					.progbuf13_reg(progbuf13_reg)			,
					.progbuf14_reg(progbuf14_reg)			,
					.progbuf15_reg(progbuf15_reg)	  		,
                `endif
					.reg_data_out(prdata)	  	 	       );
					
		// Pready logic
		
		always@(negedge pclock or negedge presetn)
			begin
				if(!presetn)
					begin
						pready <= 0;
					end
				else  
					begin
						if(psel && penable && !pwrite)			
							begin
								pready <= 1; 
							end
						else if(psel && penable && pwrite)
							begin  
								pready <= 1;
							end
						else 
							begin
								pready <=0;
							end
					end
			end
		
		
		// Pslverr logic
		
		always@(*)
			begin
				if(!presetn)
					begin
						pslverr = 0;
					end
				else 
					begin
						if(psel && penable)
							begin
								if((paddr <  32'h00000004) ||
								   (paddr >  32'h0000002F) ||
								   (paddr == 32'h00000013) || 
								   (paddr == 32'h00000014) ||
								   (paddr == 32'h00000015) || 
								   (paddr == 32'h00000018) || 
								   (paddr == 32'h00000019))
								   
									begin
										pslverr = 1;	
									end
								else 
									begin
										pslverr = 0;
									end
							end
						else
							begin
								pslverr = 0;
							end
					end
			end
								
									
endmodule
