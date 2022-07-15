
// Project: DM register file
// Company: FrenusTech Pvt Ltd
// Domain : RTL Design
// Author : Vinay chowdary
//PROGRAM_BUFFER_VALID
/////////////////////////////////////////////////// Start of DM Register File ////////////////////////////////////////////////////

`timescale 1ns / 1ps  	
`define ZILLA_32_BIT 

module dm_register_file 
													   #(
		parameter 	ADDR_WIDTH = 0						,	// 32 bit address bit
		parameter 	DATA_WIDTH = 0	   					,	// 32 bit data bit
        parameter   CORE_DATA_WIDTH = 0
													    )		
														(
		// inputs of DM register coming from APB slave DM reg Top
		
		input 		pclock								,	// System clock signal
		input 		presetn								,	// Active low reset signal
		
		input 		psel								,	// Select signal coming from APB Master
		input 		penable								,	// Enable signal coming from APB Master
		input 		pwrite								,	// Write signal coming from APB Master 1 for write , 0 for read
		input 		[ADDR_WIDTH-1:0] paddr				,	// Address coming from APB Master
		input 		[DATA_WIDTH-1:0] pwdata				,	// Data coming from APB Master
		
		//Inputs coming from Debug Module FSM
		
		input 		running								,
		input 		halted								,
        input       h_reset                             ,
        input       done                                ,
		input 		busy								,
		input 		exception							,
		
		input 		[CORE_DATA_WIDTH-1:0] debug_reg_read_data			,
		input 		debug_reg_read_valid				,

        input       [CORE_DATA_WIDTH-1:0] debug_mem_read_data          ,
        input       debug_mem_read_valid                ,
		
		// outputs of DM register
		
		output 		[DATA_WIDTH-1:0] dmstatus_reg		,	// Debug module status register
		output  	[DATA_WIDTH-1:0] hartinfo_reg 		,	// Hart information register
		output 		[DATA_WIDTH-1:0] command_reg		,	// Abstract command register
		output 		[DATA_WIDTH-1:0] abstractcs_reg		,	// Abstract command and status register
		output  	[DATA_WIDTH-1:0] dmcontrol_reg		,	// Debug module control register
		output 		[DATA_WIDTH-1:0] data0_reg			,	// Abstract Data 0 register
		output  	[DATA_WIDTH-1:0] data1_reg			,	// Abstract Data 1 register
		output 		[DATA_WIDTH-1:0] data2_reg			,	// Abstract Data 2 register
		output 		[DATA_WIDTH-1:0] data3_reg			,	// Abstract Data 3 register
        `ifdef PROGRAM_BUFFER_VALID
		output 		[DATA_WIDTH-1:0] data4_reg			,	// Abstract Data 4 register
		output 		[DATA_WIDTH-1:0] data5_reg			,	// Abstract Data 5 register
		output 	 	[DATA_WIDTH-1:0] data6_reg			,	// Abstract Data 6 register
		output  	[DATA_WIDTH-1:0] data7_reg			,	// Abstract Data 7 register
		output  	[DATA_WIDTH-1:0] data8_reg			,	// Abstract Data 8 register
		output  	[DATA_WIDTH-1:0] data9_reg			,	// Abstract Data 9 register
		output  	[DATA_WIDTH-1:0] data10_reg			,	// Abstract Data 10 register
		output  	[DATA_WIDTH-1:0] data11_reg			,	// Abstract Data 11 register
		output  	[DATA_WIDTH-1:0] progbuf0_reg		,	// Program buffer 0 register
		output  	[DATA_WIDTH-1:0] progbuf1_reg		,	// Program buffer 1 register
		output  	[DATA_WIDTH-1:0] progbuf2_reg		,	// Program buffer 2 register
		output  	[DATA_WIDTH-1:0] progbuf3_reg		,	// Program buffer 3 register
		output  	[DATA_WIDTH-1:0] progbuf4_reg		,	// Program buffer 4 register
		output  	[DATA_WIDTH-1:0] progbuf5_reg		,	// Program buffer 5 register
		output  	[DATA_WIDTH-1:0] progbuf6_reg		,	// Program buffer 6 register
		output  	[DATA_WIDTH-1:0] progbuf7_reg		,	// Program buffer 7 register
		output  	[DATA_WIDTH-1:0] progbuf8_reg		,	// Program buffer 8 register
		output  	[DATA_WIDTH-1:0] progbuf9_reg		,	// Program buffer 9 register
		output  	[DATA_WIDTH-1:0] progbuf10_reg		,	// Program buffer 10 register
		output  	[DATA_WIDTH-1:0] progbuf11_reg		,	// Program buffer 11 register
		output  	[DATA_WIDTH-1:0] progbuf12_reg		,	// Program buffer 12 register
		output  	[DATA_WIDTH-1:0] progbuf13_reg		,	// Program buffer 13 register
		output  	[DATA_WIDTH-1:0] progbuf14_reg		,	// Program buffer 14 register
		output  	[DATA_WIDTH-1:0] progbuf15_reg	   	,	// Program buffer 15 register
    `endif
		
		
		// outputs of DM register going to DEBUG MODULE FSM
		
		output 		dmactive 							, 	// Debug module control 0th bit register
		output  	clrresethaltreq						,	// Debug module control 2nd bit register
		output  	setresethaltreq						,	// Debug module control 3th bit register
		output  	hartreset							,	// Debug module control 29th bit register
		output  	resumereq_o							,	// Debug module control 30th bit register
		output  	haltreq								,	// Debug module control 31th bit register
		output 		ndmreset							,
		output	 	transfer_reg						,	// Abstract command 17th bit register
		output	 	postexec							,	// Abstract command 18th bit register
		//output 		write_reg							,	// Abstract command 16th bit register
		//output 		[15:0]regno							,	// Abstract command 0 to 15 bit registers
		output 		[7:0] cmdtype						,	// Abstract command 24 ti 31 bit registers
		output 		[2:0] cmderr						,	// Abstract contron and status 10-8th bits registers
		output 		[CORE_DATA_WIDTH-1:0] debug_reg_write_data			,
		output 		[15:0] debug_reg_address			,
		output 		debug_reg_read_enable				,
		output 		debug_reg_write_enable				,
        output      debug_mem_read_enable               ,
        output      debug_mem_write_enable              ,
        output      [CORE_DATA_WIDTH-1:0]debug_mem_read_addr           ,
        output      [CORE_DATA_WIDTH-1:0]debug_mem_write_addr          ,
        output      [CORE_DATA_WIDTH-1:0]debug_mem_write_data          ,
        output      [(CORE_DATA_WIDTH>>3)-1:0] debug_mem_strobe          
	 
		
													   );
													   
		// Declaration of wires
		wire 		ackhavereset						;
		wire 		ackunavail							; 
		wire 		write_reg							;
		wire 		[15:0]  regno 						;
        wire        [2:0] aarsize                       ;
        wire        [2:0] aamsize                       ;
        wire        aampostincrement                    ;
      //  wire        aampostincr_done                    ;
      //  wire        cmd_clr                             ;
													   		
wire resumereq;
        reg resumereq_r;
        
assign resumereq_o = (resumereq && (!resumereq_r));

        always@(posedge pclock or negedge presetn)
        begin
            if(!presetn)
            begin
                resumereq_r <= 1'b0;
            end
            else
            begin
                resumereq_r <= resumereq;
            end
        end


		// Abstract control and status register
		
		assign 	cmderr = abstractcs_reg[10:8]			;
		
		// Abstract command registers

		assign	transfer_reg = command_reg[17]			;
		assign  write_reg = command_reg[16]             ;
		assign  regno = command_reg[15:0]				;
        assign  aarsize = (command_reg[31:24] == 8'b0) ? command_reg[22:20] : 3'b0 ;
        assign  aamsize = (command_reg[31:24] == 8'b00000010) ? command_reg[22:20] : 3'b0 ;
        assign  aampostincrement = (command_reg[31:24] == 8'b00000010) ? command_reg[19] : 1'b0 ;
		assign 	postexec = command_reg[18]				;
		assign  cmdtype = command_reg[31:24]		    ;
		
		// DM Control registers
		
		assign  ndmreset = dmactive ? dmcontrol_reg[1] 	: 1'b0 		;
		assign 	ackhavereset = dmactive ? dmcontrol_reg[28] : 1'b0		;
		assign 	ackunavail =  dmactive ? dmcontrol_reg[27] : 1'b0	;
		assign 	clrresethaltreq = (dmactive) ? dmcontrol_reg[2]	: 1'b0	;
		assign  dmactive =  dmcontrol_reg[0] 			;
		assign 	setresethaltreq = (dmactive) ? dmcontrol_reg[3]	: 1'b0	;
		assign 	hartreset =(dmactive) ? dmcontrol_reg[29] : 1'b0			;
		assign 	resumereq = (dmactive) ? dmcontrol_reg[30] : 1'b0			;
		assign	haltreq	=  (dmactive) ? dmcontrol_reg[31] :1'b0	;

/////////////////////////////////////// Program buffer registers instantiation ////////////////////////////////////////////////
`ifdef PROGRAM_BUFF_VALID	
		program_buffer 
													  #(
					.ADDR_WIDTH(ADDR_WIDTH)				,
					.DATA_WIDTH(DATA_WIDTH)				)
					
		program_buffer_instnc							(	
					.clock(pclock)						,
					.resetn(presetn)					,
					.dmactive(dmactive)					,
					.sel(psel)							,
					.enable(penable)					,
					.write(pwrite)						,
					.addr(paddr)						,
					.data(pwdata)						,
					.busy(busy)							,

					.progbuf0_reg(progbuf0_reg)			,
					.progbuf1_reg(progbuf1_reg)			,
					.progbuf2_reg(progbuf2_reg)			,
					.progbuf3_reg(progbuf3_reg)			,
					.progbuf4_reg(progbuf4_reg)			,
					.progbuf5_reg(progbuf5_reg)			,
					.progbuf6_reg(progbuf6_reg)			,
					.progbuf7_reg(progbuf7_reg)			,
					.progbuf8_reg(progbuf8_reg)			,
					.progbuf9_reg(progbuf9_reg)			,
					.progbuf10_reg(progbuf10_reg)		,
					.progbuf11_reg(progbuf11_reg)		,
					.progbuf12_reg(progbuf12_reg)		,
					.progbuf13_reg(progbuf13_reg)		,
					.progbuf14_reg(progbuf14_reg)	    ,
					.progbuf15_reg(progbuf15_reg)	   );

   `endif

////////////////////////////////////////// End of Program buffer registters instantiation //////////////////////////////////////

////////////////////////////////////////// Start of abstract control and status register instantiation /////////////////////////
		
		abstractcs 
													   #(
					.ADDR_WIDTH(ADDR_WIDTH)				,
					.DATA_WIDTH(DATA_WIDTH)				,
                    .CORE_DATA_WIDTH(CORE_DATA_WIDTH)   )
					
		abstractcs_instnc								(
					.clock(pclock)						,
					.resetn(presetn)					,
					.dmactive(dmactive)					,
					.sel(psel)							,
					.enable(penable)					,
					.write(pwrite)						,
					.addr(paddr)						,
                    .aamsize(aamsize)                   ,
                    .aarsize(aarsize)                   ,
					.data(pwdata)						,
					.busy(busy)							,
                    .command_reg(command_reg)           ,
                    .cmdtype(cmdtype)                   ,
                    .regno(regno)                       ,
					.halted(halted)						,
					.exception(exception)				,
					.abstractcs_reg(abstractcs_reg)	   );

////////////////////////////////////////// End of abstract control and status register instantiation ///////////////////////////


////////////////////////////////////////// Start of Command register instantiation /////////////////////////////////////////////

		command 
													   #(
					.ADDR_WIDTH(ADDR_WIDTH)				,
					.DATA_WIDTH(DATA_WIDTH)				)
					
		command_instnc 									(
					.clock(pclock)						,
					.resetn(presetn)					,
					.dmactive(dmactive)					,
					.sel(psel)							,
					.enable(penable)					,
					.write(pwrite)						,
					.addr(paddr)						,
					.data(pwdata)						,
					.cmderr(cmderr)						,
                    .done(done)                         ,
                //    .aampostincr_done(aampostincr_done) ,
                    // .cmd_clr(cmd_clr)                   ,
					.command_reg(command_reg)		   );
					
////////////////////////////////////////// End of abstract command register instantiation //////////////////////////////////////

////////////////////////////////////////// debug module control register instantiation /////////////////////////////////////////
		
		dmcontrol 
													   #(
					.ADDR_WIDTH(ADDR_WIDTH)				,
					.DATA_WIDTH(DATA_WIDTH)				)
					
		dmcontrol_instnc								(
					.clock(pclock)						,
					.resetn(presetn)					,
					.sel(psel)							,
					.enable(penable)					,
					.write(pwrite)						,
					.addr(paddr)						,
					.data(pwdata)						,
					.dmcontrol_reg(dmcontrol_reg) 	   );

////////////////////////////////////////// End of debug module control register instantiation //////////////////////////////////

////////////////////////////////////////// Abstract data registers instantiation	////////////////////////////////////////////
`ifdef PROGRAM_BUFFER_VALID
		data_reg
													   #(
					.ADDR_WIDTH(ADDR_WIDTH)				,
					.DATA_WIDTH(DATA_WIDTH)				)
		
		data_reg_instnc 								(
					.clock(pclock)						,
					.resetn(presetn)					,
					.dmactive(dmactive)					,
					.sel(psel)							,
					.enable(penable)					,
					.write(pwrite)						,
					.addr(paddr)						,
					.data(pwdata)						,
					.busy(busy)							,
				//	.data2_reg(data2_reg)				,
				//	.data3_reg(data3_reg)				,
					.data4_reg(data4_reg)				,
					.data5_reg(data5_reg)				,
					.data6_reg(data6_reg)				,
					.data7_reg(data7_reg)				,
					.data8_reg(data8_reg)				,
					.data9_reg(data9_reg)				,
					.data10_reg(data10_reg)				,
					.data11_reg(data11_reg)			   );
       `endif

////////////////////////////////////////// End of Abstract data registers instantiation	////////////////////////////////////////

////////////////////////////////////////// Start of Abstract data 0 and data 1 register instantiation //////////////////////////

data_reg01
																	#(
					.ADDR_WIDTH(ADDR_WIDTH          ),	
                    .DATA_WIDTH(DATA_WIDTH          ),
                    .CORE_DATA_WIDTH(CORE_DATA_WIDTH            )
                )
		
		data_reg01_instnc 											(
					.clock(pclock)									,
					.resetn(presetn)								,
					.dmactive(dmactive)								,
					.sel(psel)										,
					.enable(penable)								,
					.write(pwrite)									,
					.addr(paddr)									,
					.data(pwdata)									,
					.busy(busy)										,
					.data0_reg(data0_reg)							,
					.data1_reg(data1_reg)							,
                    .data2_reg(data2_reg)                           ,
                    .data3_reg(data3_reg)                           ,
					.debug_reg_write_data(debug_reg_write_data)		,
					.write_reg(write_reg)							,
					.transfer_reg(transfer_reg)						,
					.regno(regno)									,
                    .aarsize(aarsize)                               ,
                    .aamsize(aamsize)                               ,
                    .aampostincrement(aampostincrement)             ,
                    .cmdtype(cmdtype)                               ,
					.debug_reg_read_valid(debug_reg_read_valid)		,
					.debug_reg_read_enable(debug_reg_read_enable)	,
					.debug_reg_write_enable(debug_reg_write_enable)	,
					.debug_reg_address(debug_reg_address)			,
					.debug_reg_read_data(debug_reg_read_data) 		,
                    .debug_mem_read_data(debug_mem_read_data)       ,
                    .debug_mem_read_valid(debug_mem_read_valid)     ,
                    .debug_mem_read_enable(debug_mem_read_enable)   ,
                    .debug_mem_write_enable(debug_mem_write_enable) ,
                    .debug_mem_read_addr(debug_mem_read_addr)       ,
                    .debug_mem_write_addr(debug_mem_write_addr)     ,
                    .debug_mem_write_data(debug_mem_write_data)     ,
                    .debug_mem_strobe(debug_mem_strobe)             
              //      .aampostincr_done(aampostincr_done)             
                                                                    );

////////////////////////////////////////// End of Abstract data 0 and data 1 register instantiation //////////////////////////

//////////////////////////////////////////////// hartinfo register instantiation ///////////////////////////////////////////////
		hartinfo 
													   
		hartinfo_instnc									(
					.clock(pclock)						,
					.resetn(presetn)					,
					.dmactive(dmactive)					,
					.hartinfo_reg(hartinfo_reg)		   );
					
///////////////////////////////////////////// End of hartinfo register instantiation ////////////////////////////////////////////

////////////////////////////////////////// debug module status register instantiation ///////////////////////////////////////////
		dmstatus 
													  
		dmstatus_instnc									(
					.ndmreset(ndmreset)					,
					.ackhavereset(ackhavereset)			,
					.ackunavail(ackunavail)				,
					.resumereq(resumereq_o)				,
					.halted(halted)						,
					.running(running)					,
                    .h_reset(h_reset)                   ,
                    .hartreset(hartreset)				,
					.pclock(pclock)						,
					.presetn(presetn)					,
					.dmactive(dmactive)					,
					.dmstatus_reg(dmstatus_reg)		   );
					
///////////////////////////////////////// End of debug module status register instantiation ////////////////////////////////////

endmodule

////////////////////////////////////////////////////End of DM Register File ////////////////////////////////////////////////////


////////////////////////////////////////// abstract control and status register module /////////////////////////////////////////

module abstractcs 
													   #(
													   
		// Parameters declaration for data and address size
		
		parameter 	ADDR_WIDTH = 32						,	// 32 bit address bit
		parameter 	DATA_WIDTH = 32					  	,	// 32 bit data bit
		parameter   CORE_DATA_WIDTH = 0)
														(
		// inputs of abstractcs register
		input 		clock 								,	// System clock signal
		input 		resetn 								,	// Active low reset signal
		input 		sel									,	// select signal coming from APB Master
		input 		enable 								,	// Enable signal coming from APB Master
		input 		write 								,	// Write signal coming from APB Master 1 for Write ,0 for read
		input 		[ADDR_WIDTH-1:0] addr 				,	// Address signal coming from APB Master
		input 		[DATA_WIDTH-1:0] data 				,	// Data signal coming from APB Master
		
		// inputs coming from Debug Module FSM
		input 		busy								,
        input       [15:0] regno                        ,
        input 		[31:0] command_reg					,
    //    input       transfer_reg                        ,
	//	input 		[7:0]command 						,
	//	input 		running 							,
		input 		halted 								,
	//	input 		hartreset							,
        input       [7:0] cmdtype                       ,
		input 		exception							,
		input 		dmactive							,
        input       [2:0]aamsize                        ,
        input       [2:0]aarsize                        ,
		
		// outputs of abstractcs register 
	//	output reg  cmd_clr                             ,
		output 	[DATA_WIDTH-1:0] abstractcs_reg			// Abstract commanad and status register
													   );

        reg [20:0] abstractcs_reg_a                     ;
        reg [7:0]  abstractcs_reg_b                     ;
        reg [2:0]  cmderr_reg                           ;
													   
		// Local parameter declarations for respective address
		
		localparam  ABSTRACTCS_ADDR = 32'h00000016		;	// localparameter declaration for Abstractcs register address
		localparam  COMMAND_ADDR 	= 32'h00000017		;	// Localparameter declaration for Command register address
		localparam 	PROGBUFF0_ADDR  = 32'h00000020		;	// localparameter declaration for Program buffer 0 register address
		localparam 	PROGBUFF1_ADDR  = 32'h00000021		;	// localparameter declaration for Program buffer 1 register address
		localparam 	PROGBUFF2_ADDR  = 32'h00000022		;	// localparameter declaration for Program buffer 2 register address
		localparam 	PROGBUFF3_ADDR  = 32'h00000023		;	// localparameter declaration for Program buffer 3 register address
		localparam 	PROGBUFF4_ADDR  = 32'h00000024		;	// localparameter declaration for Program buffer 4 register address
		localparam 	PROGBUFF5_ADDR  = 32'h00000025		;	// localparameter declaration for Program buffer 5 register address
		localparam 	PROGBUFF6_ADDR  = 32'h00000026		;	// localparameter declaration for Program buffer 6 register address
		localparam 	PROGBUFF7_ADDR  = 32'h00000027		;	// localparameter declaration for Program buffer 7 register address
		localparam 	PROGBUFF8_ADDR  = 32'h00000028		;	// localparameter declaration for Program buffer 8 register address
		localparam 	PROGBUFF9_ADDR  = 32'h00000029		;	// localparameter declaration for Program buffer 9 register address
		localparam 	PROGBUFF10_ADDR = 32'h0000002A		;	// localparameter declaration for Program buffer 10 register address
		localparam 	PROGBUFF11_ADDR = 32'h0000002B		;	// localparameter declaration for Program buffer 11 register address
		localparam 	PROGBUFF12_ADDR = 32'h0000002C		;	// localparameter declaration for Program buffer 12 register address
		localparam 	PROGBUFF13_ADDR = 32'h0000002D		;	// localparameter declaration for Program buffer 13 register address
		localparam 	PROGBUFF14_ADDR = 32'h0000002E		;	// localparameter declaration for Program buffer 14 register address
		localparam 	PROGBUFF15_ADDR = 32'h0000002F		;	// localparameter declaration for Program buffer 15 register address
		localparam 	DATA0_ADDR 		= 32'h00000004		;	// localparameter declaration for Data0 register address
		localparam 	DATA1_ADDR  	= 32'h00000005		;	// localparameter declaration for Data1 register address
		localparam 	DATA2_ADDR  	= 32'h00000006		;	// localparameter declaration for Data2 register address
		localparam	DATA3_ADDR  	= 32'h00000007		;	// localparameter declaration for Data3 register address
		localparam 	DATA4_ADDR  	= 32'h00000008		;	// localparameter declaration for Data4 register address
		localparam 	DATA5_ADDR  	= 32'h00000009		;	// localparameter declaration for Data5 register address
		localparam 	DATA6_ADDR  	= 32'h0000000A		;	// localparameter declaration for Data6 register address
		localparam 	DATA7_ADDR  	= 32'h0000000B		;	// localparameter declaration for Data7 register address
		localparam 	DATA8_ADDR  	= 32'h0000000C		;	// localparameter declaration for Data8 register address
		localparam 	DATA9_ADDR  	= 32'h0000000D		;	// localparameter declaration for Data9 register address
		localparam 	DATA10_ADDR 	= 32'h0000000E		;	// localparameter declaration for Data10 register address
		localparam 	DATA11_ADDR 	= 32'h0000000F		;	// localparameter declaration for Data11 register address
		

		// Abstractcs register  logic
        //always@(posedge clock or negedge resetn)

		always@(posedge clock or negedge resetn)
			begin
				if(!resetn )
					begin
						abstractcs_reg_a[20:0] <= 21'b0;
                     `ifdef ZILLA_64_BIT
                        abstractcs_reg_b[7:0] <=  8'd4  ;
                     `elsif ZILLA_32_BIT
                        abstractcs_reg_b[7:0] <=  8'd2 ;
                     `endif
					end
                    else if (!dmactive)
                    begin
                        abstractcs_reg_a[20:0] <= 21'b0;
                     `ifdef ZILLA_64_BIT
                        abstractcs_reg_b[7:0] <=  8'd4  ;
                     `elsif ZILLA_32_BIT
                        abstractcs_reg_b[7:0] <=  8'd2 ;
                     `endif

                    end

				else
					begin
						if(sel && enable && write)
							begin
								if(addr == ABSTRACTCS_ADDR)
									begin
										abstractcs_reg_a[20:2] <= 19'b0;
										abstractcs_reg_a[1]    <= busy;
										abstractcs_reg_a[0] 	  <= 1'b0;
                                        `ifdef ZILLA_64_BIT
                                        abstractcs_reg_b[7:0] <=  8'd4  ;
                                        `elsif ZILLA_32_BIT
                                        abstractcs_reg_b[7:0] <=  8'd2 ;
                                        `endif
									end
							end
                        else
                        begin
                            abstractcs_reg_a[20:2] <= 19'b0;
                            abstractcs_reg_a[1] <= busy ;
                            abstractcs_reg_a[0] <= 1'b0;
                            `ifdef ZILLA_64_BIT
                            abstractcs_reg_b[7:0] <=  8'd4  ;
                            `elsif ZILLA_32_BIT
                            abstractcs_reg_b[7:0] <=  8'd2 ;
                            `endif
                        end
					end
			end
	//cmderr logic 
		always@(posedge clock or negedge resetn )
			begin
				if(!resetn)
					begin
						cmderr_reg <= 3'b0;
                        // cmd_clr <=1'b0;
					end
                    else if (!dmactive)
                    begin
                        cmderr_reg <= 3'b0;
                    end
				else 
					begin
					/*	if(sel && enable && write)  //busy while writing other registers cmderr 1 and W1C
							begin
								if(	(addr == ABSTRACTCS_ADDR) ||
											(addr == COMMAND_ADDR) ||	  
											(addr == DATA0_ADDR)	  ||
											(addr == DATA1_ADDR)	   )
											
											begin
												if(busy )
													begin
														if(cmderr_reg == 3'b000)
															begin
															 cmderr_reg <= 3'b001;
															end
														else
															begin
																cmderr_reg <= cmderr_reg;
															end
													end
												else
													begin
														if(addr == ABSTRACTCS_ADDR)
															begin
																if(data[10:8] != 3'b000)
																	begin
																		cmderr_reg <= 3'b000;
                                                                       // cmd_clr <= 1'b1;
																	end
																else 
																	begin
																		cmderr_reg <= cmderr_reg ;
                                                                      //  cmd_clr <= 1'b0;
																	end
															end
													end
											end

							end
						else if(sel && enable && !write) //Reading data registers while busy cmderr 1
							begin
								if((addr == DATA0_ADDR)	  ||
									(addr == DATA1_ADDR)	   )
										begin
											if(busy)
												begin
													if(cmderr_reg == 3'b000)
														begin
															cmderr_reg <= 3'b001;
														end
													else
														begin
															cmderr_reg <= cmderr_reg;
														end
												end
											else 
												begin
													cmderr_reg <= cmderr_reg ;
												end
										end
							end */
                        if(sel && enable && write)  //busy while writing other registers cmderr 1 and W1C
							begin
								if(	(addr == ABSTRACTCS_ADDR) )
                                begin
                                    if(data[10:8] != 3'b000)
										begin
											cmderr_reg <= 3'b000;
										end
									else 
										begin
											cmderr_reg <= cmderr_reg ;
										end
                               end
                           end

						else if((command_reg != 32'b0)  && !halted)	// Hart in not available
							begin
								cmderr_reg <= 3'b100;
							end
                            //`ifdef ZILLA_64_BIT
                            //if (cmdtype == 8'd0)
                                //begin end
                             //`elsif ZILLA_32_BIT
                             //if begin end
                              //`endif
                        else if( (command_reg != 32'b0 ) && (cmdtype == 8'd0)) // register not supported
							begin
                                `ifdef ZILLA_64_BIT
                                if ((aarsize != 3'b011) && (aarsize != 3'b010))
                                begin
                                    cmderr_reg <= 3'b010;
                                end
                                `elsif ZILLA_32_BIT
                                if(/*(CORE_DATA_WIDTH ==32) && */(aarsize != 3'b010))
                                begin
                                    cmderr_reg <= 3'b010;
                                end
                                `endif
								else if((	((regno >= 16'h1000) && (regno <= 16'h101f) ) ||
									(regno == 16'h0f11) ||
									(regno == 16'h0f12) ||
									(regno == 16'h0f13) ||
									(regno == 16'h0f14) ||
									(regno == 16'h0300) ||
									(regno == 16'h0301) ||
									//(regno == 16'h0302) ||
									//(regno == 16'h0303) ||
									(regno == 16'h0304) ||
									(regno == 16'h0305) ||
									//(regno == 16'h0306) ||
									(regno == 16'h0340) ||
									(regno == 16'h0341) || 
									(regno == 16'h0342) ||
									(regno == 16'h0343) ||
									(regno == 16'h0344) ||
									(regno == 16'h0b00) ||  
									((regno >= 16'h0b02) && (regno <= 16'h0b1f) ) ||
									(regno == 16'h0320) ||
									((regno >= 16'h0323) && (regno <= 16'h033f) ) ||
									(regno == 16'h0bc0) ||
									(regno == 16'h0fc0) ||
									(regno == 16'h0fc1) || 
                                    (regno == 16'h07b0 ) || 
                                    (regno == 16'h07b1 )  
                                    ) == 1'b1 	)					
										begin
											cmderr_reg <= cmderr_reg ;
										end
                                else
                                begin
                                    cmderr_reg <= 3'b010 ;
                                end
							end
                        `ifdef ZILLA_64_BIT
                        else if((aamsize > 3'b011) /*&& (CORE_DATA_WIDTH == 64)*/)
                        begin
                            cmderr_reg <= 3'b010;
                        end
                        `elsif ZILLA_32_BIT
                        else if((aamsize > 3'b010) /*&& (CORE_DiATA_WIDTH == 32)*/)
                        begin
                            cmderr_reg <= 3'b010;
                        end
                       `endif
						else if(exception)						// Exception
							begin
								cmderr_reg <= 3'b011;
							end

						else 
							begin
								cmderr_reg <= cmderr_reg ;
							end
					end
			end	
		assign abstractcs_reg = {abstractcs_reg_a,cmderr_reg,abstractcs_reg_b};						
endmodule

////////////////////////////////////////// End of abstract control and status register module ///////////////////////////////

////////////////////////////////////////// Command register module //////////////////////////////////////////////////////////

module command 
													   #(
													   
		// Parameters declaration for data and address size
		
		parameter 	ADDR_WIDTH = 32						,	// 32 bit address bit
		parameter 	DATA_WIDTH = 32					  	)	// 32 bit data bit
		
														(
		// inputs of command register
		
		input 		clock 								,	// System clock signal
		input 		resetn 								,	// Active low reset signal
		input 		sel 								,	// Select signal from APB Master
		input 		enable 								,	// Enable signal coming from APB Master
		input 		write 								,	// Write signal coming from APB Master
		input 		[ADDR_WIDTH-1:0] addr 				,	// Address coming from APB Master
		input 		[DATA_WIDTH-1:0] data 				,	// Data signal coming from APB Master
		input 		dmactive							,
        input       done                                ,
    //    input       aampostincr_done                    ,
      //  input       cmd_clr                             ,
		
		// input coming from Abstractcs register
		
		input 		[2:0] cmderr						,
		
		// outputs of command register
		
		output reg 	[DATA_WIDTH-1:0] command_reg  			//  Command register
													   );
													   
		// Local parameter declarations for respective address
		
		localparam COMMAND_ADDR = 32'h00000017			;	// Localparameter declaration for Command register address
        localparam  ABSTRACTCS_ADDR = 32'h00000016		;	// localparameter declaration for Abstractcs register address
		
		always@(posedge clock or negedge resetn )
			begin
				if(!resetn  )
					begin
						command_reg <= 0;		// under reset command register will be Zero
					end
                    else if (!dmactive)
                    begin
                            command_reg <= 0;	
                    end
				else
                    begin
						if(sel && enable && write)
							begin
								if(addr == COMMAND_ADDR)
									begin
										if(cmderr == 3'b000)
											begin
                                                if(data[31:24] == 8'b0)
                                                    begin
												        command_reg <=  {8'b0,1'b0,data[22:0]};	// writes into command register
                                                    end
                                                else if(data[31:24] == 8'b00000010)
                                                    begin
                                                        command_reg <=  {data[31:24],1'b0,data[22:19],2'b0,data[16],16'b0};
                                                    end
                                                else
                                                    begin
                                                        command_reg <= command_reg;
                                                    end
											end
										else
											begin
												command_reg <= command_reg;
											end
									end
                                else if(addr == ABSTRACTCS_ADDR)
                                    begin
                                        if(data != 3'b000)
                                            begin
                                                command_reg <= 32'b0 ;
                                            end
                                        else
                                            begin
                                                command_reg <=  command_reg ;
                                            end
                                    end

                            end
                         if(done)
                             begin
                                  command_reg <= 32'b0;
                             end
						
					end
			end
			
endmodule
		
////////////////////////////////////////// End of Command register module /////////////////////////////////////////////////////

///////////////////////////////////////// Debug module control register module ////////////////////////////////////////////////

module dmcontrol 
													   #(
													   
		// Parameters declaration for data and address size
		
		parameter 	ADDR_WIDTH = 32						,	// 32 bit address bit
		parameter 	DATA_WIDTH = 32					  	)	// 32 bit data bit
		
														(
		// inputs of dmcontrol register	
		
		input 		clock								,	// Clock source
		input 		resetn								,	// Active low reset signal
		input 		sel									,	// Select signal coming from APB Master
		input 		enable								,	// Enable signal coming from APB Master
		input 		write								,	// Write signal coming from APB Master
		input 		[ADDR_WIDTH-1:0] addr				,	// Address signal coming from APB Master
		input 		[DATA_WIDTH-1:0] data				,	// Data signal coming from APB Master
		
		// outputs of dmcontrol register
		
		output reg 	[DATA_WIDTH-1:0] dmcontrol_reg			// dmcontrol register
													   );
		
		//local parameter declaration
		
		localparam	DMCONTROL_ADDR = 32'h00000010		;	// Local parameter for dmcontrol address
		
		always@( posedge clock or negedge resetn)
			begin
				if(~resetn)
					begin
						dmcontrol_reg <= 0;		// under reset dmcontrol_reg will be 0
					end
				else
					begin
						if(sel && enable && write)
								begin
									if(addr == DMCONTROL_ADDR)
										begin
											dmcontrol_reg <= {data[31:27],21'b0,data[5:0]};	// writes into dmcontrol register
										end
								end		
					end
			end
endmodule

///////////////////////////////////////// End of Debug module control register module ///////////////////////////////////////

///////////////////////////////////////// Program buffer register module ////////////////////////////////////////////////////
`ifdef PROGRAM_BUFFER_VALID
module program_buffer 
													   #(
													   
		// Parameters declaration for data and address size
		
		parameter 	ADDR_WIDTH = 32						,	// 32 bit address bit
		parameter 	DATA_WIDTH = 32					  	)	// 32 bit data bit
		
														(
		//inputs of Program buffer register
		
		input 		clock								,	// Clock source
		input 		resetn								,	// Active low reset signal
		input 		sel									,	// Select signal coming from APB Master
		input 		enable								,	// Enable signal coming from APB Master
		input 		write								,	// Write signal coming from APB Master
		input 		[ADDR_WIDTH-1:0] addr				,	// Address signal coming from APB Master
		input 		[DATA_WIDTH-1:0] data				,	// Data signal coming from APB Master
		
		// inputs from debug module FSM
		
		input 		busy 								,
		input 		dmactive							,
		
		// outputs of Program buffer
		
		output reg 	[DATA_WIDTH-1:0] progbuf0_reg		,	// program buffer 0 register
		output reg 	[DATA_WIDTH-1:0] progbuf1_reg		,	// program buffer 1 register
		output reg 	[DATA_WIDTH-1:0] progbuf2_reg		,	// program buffer 2 register
		output reg 	[DATA_WIDTH-1:0] progbuf3_reg		,	// program buffer 3 register
		output reg 	[DATA_WIDTH-1:0] progbuf4_reg		,	// program buffer 4 register
		output reg 	[DATA_WIDTH-1:0] progbuf5_reg		,	// program buffer 5 register
		output reg 	[DATA_WIDTH-1:0] progbuf6_reg		,	// program buffer 6 register	
		output reg 	[DATA_WIDTH-1:0] progbuf7_reg		,	// program buffer 7 register
		output reg 	[DATA_WIDTH-1:0] progbuf8_reg		,	// program buffer 8 register
		output reg 	[DATA_WIDTH-1:0] progbuf9_reg		,	// program buffer 9 register
		output reg 	[DATA_WIDTH-1:0] progbuf10_reg		,	// program buffer 10 register
		output reg 	[DATA_WIDTH-1:0] progbuf11_reg		,	// program buffer 11 register
		output reg 	[DATA_WIDTH-1:0] progbuf12_reg		,	// program buffer 12 register
		output reg 	[DATA_WIDTH-1:0] progbuf13_reg		,	// program buffer 13 register
		output reg 	[DATA_WIDTH-1:0] progbuf14_reg		,	// program buffer 14 register
		output reg 	[DATA_WIDTH-1:0] progbuf15_reg	   );	// program buffer 15 register
		
		// local parameter declarations
		
		localparam 	PROGBUFF0_ADDR  = 32'h00000020		;	// localparameter declaration for Program buffer 0 register address
		localparam 	PROGBUFF1_ADDR  = 32'h00000021		;	// localparameter declaration for Program buffer 1 register address
		localparam 	PROGBUFF2_ADDR  = 32'h00000022		;	// localparameter declaration for Program buffer 2 register address
		localparam 	PROGBUFF3_ADDR  = 32'h00000023		;	// localparameter declaration for Program buffer 3 register address
		localparam 	PROGBUFF4_ADDR  = 32'h00000024		;	// localparameter declaration for Program buffer 4 register address
		localparam 	PROGBUFF5_ADDR  = 32'h00000025		;	// localparameter declaration for Program buffer 5 register address
		localparam 	PROGBUFF6_ADDR  = 32'h00000026		;	// localparameter declaration for Program buffer 6 register address
		localparam 	PROGBUFF7_ADDR  = 32'h00000027		;	// localparameter declaration for Program buffer 7 register address
		localparam 	PROGBUFF8_ADDR  = 32'h00000028		;	// localparameter declaration for Program buffer 8 register address
		localparam 	PROGBUFF9_ADDR  = 32'h00000029		;	// localparameter declaration for Program buffer 9 register address
		localparam 	PROGBUFF10_ADDR = 32'h0000002A		;	// localparameter declaration for Program buffer 10 register address
		localparam 	PROGBUFF11_ADDR = 32'h0000002B		;	// localparameter declaration for Program buffer 11 register address
		localparam 	PROGBUFF12_ADDR = 32'h0000002C		;	// localparameter declaration for Program buffer 12 register address
		localparam 	PROGBUFF13_ADDR = 32'h0000002D		;	// localparameter declaration for Program buffer 13 register address
		localparam 	PROGBUFF14_ADDR = 32'h0000002E		;	// localparameter declaration for Program buffer 14 register address
		localparam 	PROGBUFF15_ADDR = 32'h0000002F		;	// localparameter declaration for Program buffer 15 register address
		
		always@(posedge clock or negedge resetn)
			begin
				if(!resetn )
					begin
						progbuf0_reg  <= 0;		// under reset program buffer 0 register will be 0
						progbuf1_reg  <= 0;	 	// under reset program buffer 1 register will be 0
						progbuf2_reg  <= 0;		// under reset program buffer 2 register will be 0
						progbuf3_reg  <= 0;		// under reset program buffer 3 register will be 0
						progbuf4_reg  <= 0;		// under reset program buffer 4 register will be 0
						progbuf5_reg  <= 0;		// under reset program buffer 5 register will be 0
						progbuf6_reg  <= 0;		// under reset program buffer 6 register will be 0
						progbuf7_reg  <= 0;		// under reset program buffer 7 register will be 0
						progbuf8_reg  <= 0;		// under reset program buffer 8 register will be 0
						progbuf9_reg  <= 0;		// under reset program buffer 9 register will be 0
						progbuf10_reg <= 0;		// under reset program buffer 10 register will be 0
						progbuf11_reg <= 0;		// under reset program buffer 11 register will be 0
						progbuf12_reg <= 0;		// under reset program buffer 12 register will be 0
						progbuf13_reg <= 0;		// under reset program buffer 13 register will be 0
						progbuf14_reg <= 0;		// under reset program buffer 14 register will be 0
						progbuf15_reg <= 0;		// under reset program buffer 15 register will be 0
					end
                    else if (!dmactive)
                    begin
                        						progbuf0_reg  <= 0;		// under reset program buffer 0 register will be 0
						progbuf1_reg  <= 0;	 	// under reset program buffer 1 register will be 0
						progbuf2_reg  <= 0;		// under reset program buffer 2 register will be 0
						progbuf3_reg  <= 0;		// under reset program buffer 3 register will be 0
						progbuf4_reg  <= 0;		// under reset program buffer 4 register will be 0
						progbuf5_reg  <= 0;		// under reset program buffer 5 register will be 0
						progbuf6_reg  <= 0;		// under reset program buffer 6 register will be 0
						progbuf7_reg  <= 0;		// under reset program buffer 7 register will be 0
						progbuf8_reg  <= 0;		// under reset program buffer 8 register will be 0
						progbuf9_reg  <= 0;		// under reset program buffer 9 register will be 0
						progbuf10_reg <= 0;		// under reset program buffer 10 register will be 0
						progbuf11_reg <= 0;		// under reset program buffer 11 register will be 0
						progbuf12_reg <= 0;		// under reset program buffer 12 register will be 0
						progbuf13_reg <= 0;		// under reset program buffer 13 register will be 0
						progbuf14_reg <= 0;		// under reset program buffer 14 register will be 0
						progbuf15_reg <= 0;		// under reset program buffer 15 register will be 0

                    end
				else
					begin
						if(sel && enable && write)
							begin
								if(!busy)
									begin
										if(addr == PROGBUFF0_ADDR)
											begin
												progbuf0_reg <= data ;	// writes into program buffer 0 register
											end
										if(addr == PROGBUFF1_ADDR)
											begin
												progbuf1_reg <= data ;	// writes into program buffer 1 register
											end
										if(addr == PROGBUFF2_ADDR)
											begin
												progbuf2_reg <= data ;	// writes into program buffer 2 register
											end
										if(addr == PROGBUFF3_ADDR)
											begin
												progbuf3_reg <= data ;	// writes into program buffer 3 register
											end
										if(addr == PROGBUFF4_ADDR)
											begin
												progbuf4_reg <= data ;	// writes into program buffer 4 register
											end
										if(addr == PROGBUFF5_ADDR)
											begin
												progbuf5_reg <= data ;	// writes into program buffer 5 register
											end
										if(addr == PROGBUFF6_ADDR)
											begin
												progbuf6_reg <= data ;	// writes into program buffer 6 register
											end
										if(addr == PROGBUFF7_ADDR)
											begin
												progbuf7_reg <= data ;	// writes into program buffer 7 register
											end
										if(addr == PROGBUFF8_ADDR)
											begin
												progbuf8_reg <= data ;	// writes into program buffer 8 register
											end
										if(addr == PROGBUFF9_ADDR)
											begin
												progbuf9_reg <= data ;	// writes into program buffer 9 register
											end
										if(addr == PROGBUFF10_ADDR)
											begin
												progbuf10_reg <= data ;	// writes into program buffer 10 register
											end
										if(addr == PROGBUFF11_ADDR)
											begin
												progbuf11_reg <= data ;	// writes into program buffer 11 register
											end
										if(addr == PROGBUFF12_ADDR)
											begin
												progbuf12_reg <= data ;	// writes into program buffer 12 register
											end
										if(addr == PROGBUFF13_ADDR)
											begin
												progbuf13_reg <= data ;	// writes into program buffer 13 register
											end
										if(addr == PROGBUFF14_ADDR)
											begin
												progbuf14_reg <= data ;	// writes into program buffer 14 register
											end
										if(addr == PROGBUFF15_ADDR)
											begin
												progbuf15_reg <= data ;	// writes into program buffer 15 register
											end
									end
								else 
									begin
										if(addr == PROGBUFF0_ADDR)
											begin
												progbuf0_reg  <= progbuf0_reg ;
											end
										if(addr == PROGBUFF1_ADDR)
											begin
												progbuf1_reg  <= progbuf1_reg ;
											end
										if(addr == PROGBUFF2_ADDR)
											begin
												progbuf2_reg  <= progbuf2_reg ;
											end
										if(addr == PROGBUFF3_ADDR)
											begin
												progbuf3_reg  <= progbuf3_reg ;
											end
											
										if(addr == PROGBUFF4_ADDR)
											begin
												progbuf4_reg  <= progbuf4_reg ;
											end
										if(addr == PROGBUFF5_ADDR)
											begin
												progbuf5_reg  <= progbuf5_reg ;
											end
										if(addr == PROGBUFF6_ADDR)
											begin
												progbuf6_reg  <= progbuf6_reg ;
											end
										if(addr == PROGBUFF7_ADDR)
											begin
												progbuf7_reg  <= progbuf7_reg ;
											end
										if(addr == PROGBUFF8_ADDR)
											begin
												progbuf8_reg  <= progbuf8_reg ;
											end
										if(addr == PROGBUFF9_ADDR)
											begin
												progbuf9_reg  <= progbuf9_reg ;
											end
										if(addr == PROGBUFF10_ADDR)
											begin
												progbuf10_reg <= progbuf10_reg ;
											end
										if(addr == PROGBUFF11_ADDR)
											begin
												progbuf11_reg <= progbuf11_reg ;
											end
										if(addr == PROGBUFF12_ADDR)
											begin
												progbuf12_reg <= progbuf12_reg ;
											end
										if(addr == PROGBUFF13_ADDR)
											begin
												progbuf13_reg <= progbuf13_reg ;
											end
										if(addr == PROGBUFF14_ADDR)
											begin
												progbuf14_reg <= progbuf14_reg ;
											end
										if(addr == PROGBUFF15_ADDR)
											begin
												progbuf15_reg <= progbuf15_reg ;
											end
									end
							end
					end
			end

endmodule
`endif

///////////////////////////////////////// End of Program buffer register module /////////////////////////////////////////////

///////////////////////////////////////// Start of Hart inforamationregister module /////////////////////////////////////////////

module hartinfo 	
		
														(
		// inputs of hartinfo register
		
		input 		clock								,	// Source clock signal 
		input 		resetn								,	// Active low reset signal
		input 		dmactive							,
		
		// outputs of hartinfo register
		
		output reg 	[31:0] hartinfo_reg			// hart inforamation register
													   );
	
		always@(posedge clock or negedge resetn )
			begin
				if(!resetn)
					begin
						hartinfo_reg <= 0;		// under reset hart inforamation register will be 0
					end
                  else if(!dmactive)
                  begin
                      hartinfo_reg <= 0;
                  end
				else
					begin
						hartinfo_reg <= 0;
					end
			end
endmodule

///////////////////////////////////////// End of Hart inforamation register module //////////////////////////////////////////


///////////////////////////////////////// debug module status register module ///////////////////////////////////////////////


module dmstatus		
														(
		// inputs of dmstatus register
		
		//inputs coming from DM Control register
		
		input 		ndmreset							,
		input 		ackhavereset						,
		input 		ackunavail							,
		input 		resumereq							,
		
		input 		hartreset							,
		input 		pclock								,
		input 		presetn  							,
		input 		dmactive							,
		
		// inputs coming from Debug Module FSM
		
		input 		halted								,
		input 		running								,
        input       h_reset                             ,
		
		// outputs of dmstatus register
		
		output 	[31:0] dmstatus_reg			// dmstatus register		
													   );
		
        reg [6:0] dmstatus_reserved_a ;
        reg ndmresetpending;
        reg stickyunavail;
        reg impebreak;
        reg [1:0] dmstatus_reserved_b;
        reg allhavereset ;
        reg anyhavereset ;
        reg allresumeack ;
        reg anyresumeack ;
        reg allnonexistent ;
        reg anynonexistent ;
        reg allunavail ;
        reg anyunavail ;
        reg allrunning ;
        reg anyrunning ;
        reg allhalted ;
        reg anyhalted ;
        reg authenticated ;
        reg authbusy ;
        reg hasresethaltreq ;
        reg confstrptrvalid;
        reg [3:0] version;
        reg valid ;
        reg resumereq_r;



		always@(posedge pclock or negedge presetn )
			begin
			if(!presetn )
				begin
					dmstatus_reserved_a[6:0]	<= 7'b0;
                    ndmresetpending <=  1'b0 ;//edited 
                    stickyunavail <= 1'b0;
                    impebreak <= 1'b0;
                    dmstatus_reserved_b[1:0]	<= 2'b0;
                    allnonexistent <= 1'b0;
                    anynonexistent <= 1'b0;
					//allrunning <= (ndmreset && !dmactive && presetn) ? 1'b0 : 1'b1;
                    //anyrunning <= (ndmreset && !dmactive && presetn) ? 1'b0 : 1'b1;
                    allrunning <= 1'b1;
                    anyrunning <= 1'b1;
                    allhalted <= 1'b0;
                    anyhalted <= 1'b0;
					authenticated <= 1'b1;
					authbusy <= 1'b0;
					hasresethaltreq <= 1'b1;
					confstrptrvalid <= 1'b0;
                    version[3:0] <= 4'b0;
                    resumereq_r <= 1'b0;

				end
                else if (!dmactive)
                begin
                    dmstatus_reserved_a[6:0]	<= 7'b0;
                    ndmresetpending <=  1'b0 ;
                    stickyunavail <= 1'b0;
                    impebreak <= 1'b0;
                    dmstatus_reserved_b[1:0]	<= 2'b0;
                    allnonexistent <= 1'b0;
                    anynonexistent <= 1'b0;
					allrunning <=  1'b1 ;
                    anyrunning <=  1'b1 ;
                    allhalted <= 1'b0;
                    anyhalted <= 1'b0;
					authenticated <= 1'b1;
					authbusy <= 1'b0;
					hasresethaltreq <= 1'b1;
					confstrptrvalid <= 1'b0;
                    version[3:0] <= 4'b0;
                    resumereq_r <= 1'b0;


                end
			else
				begin
				    dmstatus_reserved_a[6:0]	<= 7'b0;								
				    ndmresetpending 	<= (ndmreset) ? 1'b1 : 1'b0 ;
                    stickyunavail       <= 1'b0;
                    impebreak <= 1'b0;
                    dmstatus_reserved_b[1:0]	<= 2'b0;
                    allnonexistent <= 1'b0;
                    anynonexistent <= 1'b0;
				    allrunning	<= (running && !ndmreset) ? 1'b1 : 1'b0 ;			
				    anyrunning 	<= (running && !ndmreset) ? 1'b1 : 1'b0 ;			
				    allhalted  <= (halted) ? 1'b1 : 1'b0 ;			
				    anyhalted  	<= (halted) ? 1'b1 : 1'b0 ;			
				    authenticated 	<= 1'b1;								
				    authbusy 	<= 1'b0;								
				    hasresethaltreq 	<= 1'b1;								
				    confstrptrvalid 	<= 1'b0;								
				    version[3:0] 	<= 4'b0011;	
                    resumereq_r <= resumereq;
				end
		end
	always@(posedge pclock or negedge presetn )
			begin
			if(!presetn)
				begin
                    allhavereset <= 1'b0;
                    anyhavereset <= 1'b0;
				end
            else if(!dmactive)
                begin
                    allhavereset <= 1'b0;
                    anyhavereset <= 1'b0;
				end
			else
				begin
					if(ackhavereset)
						begin
                            allhavereset <= 1'b0;
                            anyhavereset <= 1'b0;
						end
					else if (hartreset || ndmreset )
						begin
                            allhavereset <= 1'b1;
                            anyhavereset <= 1'b1;
						end
					else 
                        begin
                        allhavereset <= allhavereset;
                        anyhavereset <= anyhavereset;
                        end
				end
		end
		always@(posedge pclock or negedge presetn )
			begin
			if(!presetn)
				begin
                    allunavail <= 1'b0;
                    anyunavail <= 1'b0;
				end
                else if (!dmactive)
                begin
                    allunavail <= 1'b0;
                    anyunavail <= 1'b0;
                    
                end
			else
				begin
					if(h_reset)
						begin
                            allunavail <= 1'b1;
                            anyunavail <= 1'b1;
						end
					else
						begin
                            allunavail <= 1'b0;
                            anyunavail <= 1'b0;
						end
				end
			end
				
       always@(posedge pclock or negedge presetn )
			begin
			if(!presetn )
				begin
                    allresumeack <= 1'b0;
                    anyresumeack <= 1'b0;
                    valid <= 1'b0 ;
				end
                else if (!dmactive)
                begin
                    allresumeack <= 1'b0;
                    anyresumeack <= 1'b0;
                    valid <= 1'b0 ;
                end
			else
				begin
					if(halted && resumereq)
						begin
                            allresumeack <= 1'b0;
                            anyresumeack <= 1'b0;
                            valid <= 1'b1 ;
						end
                    else if(h_reset && resumereq)
                        begin
                            allresumeack <= 1'b0;
                            anyresumeack <= 1'b0;
                            valid <= 1'b0 ;
						end
					else if(resumereq_r && running && valid)
						begin
                            allresumeack <= 1'b1;
                            anyresumeack <= 1'b1;
                            valid <=1'b1 ; 
						end
                   else if(resumereq && running)
                        begin
                            allresumeack <= 1'b0;
                            anyresumeack <= 1'b0;
                            valid <=1'b0 ; 
						end 
                    else 
						begin
                            allresumeack <= allresumeack;
                            anyresumeack <= anyresumeack;
                            valid <= 1'b0 ;

						end
				end
			end

            assign dmstatus_reg = {dmstatus_reserved_a,
                                    ndmresetpending,
                                    stickyunavail,
                                    impebreak,
                                    dmstatus_reserved_b,
                                    allhavereset,
                                    anyhavereset,
                                    allresumeack,
                                    anyresumeack,
                                    allnonexistent,
                                    anynonexistent,
                                    allunavail,
                                    anyunavail,
                                    allrunning,
                                    anyrunning,
                                    allhalted,
                                    anyhalted,
                                    authenticated,
                                    authbusy,
                                    hasresethaltreq,
                                    confstrptrvalid,
                                    version};

endmodule 


///////////////////////////////////////// End of debug module status register module ////////////////////////////////////////

///////////////////////////////////////// Abstract data registers module ////////////////////////////////////////////////////
`ifdef PROGRAM_BUFFER_VALID
module data_reg 
													   #(
													   
		// Parameters declaration for data and address size
		
		parameter 	ADDR_WIDTH = 32						,	// 32 bit address bit
		parameter 	DATA_WIDTH = 32					  	)	// 32 bit data bit
		
														(
		// inputs of data_reg registers
		
		input 		clock								,	// Clock source signal
		input 		resetn 								,	// Active low Reset signal
		input 		sel 								,	// Select signal coming from APB Master
		input 		enable 								,	// Enable signal coming from APB Master
		input 		write 								,	// Write signal coming from APB Master
		input 		[ADDR_WIDTH-1:0] addr 				,	// Address coming from APB Master
		input		[DATA_WIDTH-1:0] data 				,	// Data coming from APB Master
		
		// inputs coming from Debug Module FSM
		
		input 		busy 								,
		input 		dmactive							,
		
		// outputs of data registers

	//	output reg 	[DATA_WIDTH-1:0] data2_reg			,	// Abstract Data 2 register
	//	output reg 	[DATA_WIDTH-1:0] data3_reg			,	// Abstract Data 3 register	
		output reg 	[DATA_WIDTH-1:0] data4_reg			,	// Abstract Data 4 register
		output reg 	[DATA_WIDTH-1:0] data5_reg			,	// Abstract Data 5 register
		output reg 	[DATA_WIDTH-1:0] data6_reg			,	// Abstract Data 6 register
		output reg 	[DATA_WIDTH-1:0] data7_reg			,	// Abstract Data 7 register
		output reg 	[DATA_WIDTH-1:0] data8_reg			,	// Abstract Data 8 register	
		output reg 	[DATA_WIDTH-1:0] data9_reg			,	// Abstract Data 9 register
		output reg 	[DATA_WIDTH-1:0] data10_reg			,	// Abstract Data 10 register
		output reg 	[DATA_WIDTH-1:0] data11_reg				// Abstract Data 11 register
													   );
													   
		// Local parameter declarations for respective address
		
	//	localparam DATA2_ADDR  = 32'h00000006			;	// localparameter declaration for Data2 register address
	//	localparam DATA3_ADDR  = 32'h00000007			;	// localparameter declaration for Data3 register address
		localparam DATA4_ADDR  = 32'h00000008			;	// localparameter declaration for Data4 register address
		localparam DATA5_ADDR  = 32'h00000009			;	// localparameter declaration for Data5 register address
		localparam DATA6_ADDR  = 32'h0000000A			;	// localparameter declaration for Data6 register address
		localparam DATA7_ADDR  = 32'h0000000B			;	// localparameter declaration for Data7 register address
		localparam DATA8_ADDR  = 32'h0000000C			;	// localparameter declaration for Data8 register address
		localparam DATA9_ADDR  = 32'h0000000D			;	// localparameter declaration for Data9 register address
		localparam DATA10_ADDR = 32'h0000000E			;	// localparameter declaration for Data10 register address
		localparam DATA11_ADDR = 32'h0000000F			;	// localparameter declaration for Data11 register address
		
		always@(posedge clock or negedge resetn)
			begin
				if(!resetn)
					begin
					//	data2_reg <= 0;		// under reset data2 register will be 0
					//	data3_reg <= 0;		// under reset data3 register will be 0
						data4_reg <= 0;		// under reset data4 register will be 0	
						data5_reg <= 0;		// under reset data5 register will be 0
						data6_reg <= 0;		// under reset data6 register will be 0
						data7_reg <= 0;		// under reset data7 register will be 0
						data8_reg <= 0;		// under reset data8 register will be 0
						data9_reg <= 0;		// under reset data9 register will be 0
						data10_reg<= 0;		// under reset data10 register will be 0
						data11_reg<= 0;		// under reset data11 register will be 0
					end
                    else if(!dmactive)
                    begin
                        						data4_reg <= 0;		// under reset data4 register will be 0	
						data5_reg <= 0;		// under reset data5 register will be 0
						data6_reg <= 0;		// under reset data6 register will be 0
						data7_reg <= 0;		// under reset data7 register will be 0
						data8_reg <= 0;		// under reset data8 register will be 0
						data9_reg <= 0;		// under reset data9 register will be 0
						data10_reg<= 0;		// under reset data10 register will be 0
						data11_reg<= 0;		// under reset data11 register will be 0

                    end
				else 
					begin
						if(sel && enable && write)
							begin
								if(!busy)
									begin
									/*	if(addr == DATA2_ADDR)
											begin
												data2_reg <= data ;		// writes into data 2 register
											end
										if(addr == DATA3_ADDR)
											begin
												data3_reg <= data ;		// writes into data 3 register
											end */
										if(addr == DATA4_ADDR)
											begin
												data4_reg <= data ;		// writes into data 4 register
											end
										if(addr == DATA5_ADDR)
											begin
												data5_reg <= data ;		// writes into data 5 register
											end
										if(addr == DATA6_ADDR)
											begin
												data6_reg <= data ;		// writes into data 6 register
											end
										if(addr == DATA7_ADDR)
											begin
												data7_reg <= data ;		// writes into data 7 register
											end
										if(addr == DATA8_ADDR)
											begin
												data8_reg <= data ;		// writes into data 8 register
											end
										if(addr == DATA9_ADDR)
											begin
												data9_reg <= data ;		// writes into data 9 register
											end
										if(addr == DATA10_ADDR)
											begin
												data10_reg <= data ;	// writes into data 10 register
											end
										if(addr == DATA11_ADDR)
											begin
												data11_reg <= data ;	// writes into data 11 register
											end
									end
								else
									begin
									/*	if(addr == DATA2_ADDR)
											begin
												data2_reg  <= data2_reg ;
											end
										if(addr == DATA3_ADDR)
											begin
												data3_reg  <= data3_reg ;
											end */
										if(addr == DATA4_ADDR)
											begin
												data4_reg  <= data4_reg ;
											end
										if(addr == DATA5_ADDR)
											begin
												data5_reg  <= data5_reg ;
											end
										if(addr == DATA6_ADDR)
											begin
												data6_reg  <= data6_reg ;
											end
										if(addr == DATA7_ADDR)
											begin
												data7_reg  <= data7_reg ;
											end
										if(addr == DATA8_ADDR)
											begin
												data8_reg  <= data8_reg ;
											end
										if(addr == DATA9_ADDR)
											begin
												data9_reg  <= data9_reg ;
											end
										if(addr == DATA10_ADDR)
											begin
												data10_reg <= data10_reg ;
											end
										if(addr == DATA11_ADDR)
											begin
												data11_reg <= data11_reg ;
											end
									end
							end
					end
			end

endmodule
`endif

/////////////////////////////////////////End of Abstract data registers module /////////////////////////////////////////////

///////////////////////////////////////// Start of Abstract data 0 and data 1 registers ////////////////////////////////////

module data_reg01 
													   #(
													   
		// Parameters declaration for data and address size
		
		parameter 	ADDR_WIDTH = 32						,	// 32 bit address bit
		parameter 	DATA_WIDTH = 32					    ,
        parameter   CORE_DATA_WIDTH = 0          )             // 32 bit data bit)
		
														(
		// inputs of data_reg registers
		
		input 		clock								,	// Clock source signal
		input 		resetn 								,	// Active low Reset signal
		input 		sel 								,	// Select signal coming from APB Master
		input 		enable 								,	// Enable signal coming from APB Master
		input 		write 								,	// Write signal coming from APB Master
		input 		[ADDR_WIDTH-1:0] addr 				,	// Address coming from APB Master
		input		[DATA_WIDTH-1:0] data 				,	// Data coming from APB Master
		
		// inputs coming from Debug Module
		
		input 		busy 								,
		input 		dmactive							,
		input 		transfer_reg						,
		input 		write_reg							,	// write signal from Abstract command register
		input 		[15:0]regno							,
		input       [2:0] aarsize                       ,
        input       [2:0] aamsize                       ,
        input       aampostincrement                    ,
        input       [7:0] cmdtype                       ,


		// inputs coming from Top
		input 		[CORE_DATA_WIDTH-1:0] debug_reg_read_data 			,	// data coming from core
		input 		debug_reg_read_valid				,

        input       [CORE_DATA_WIDTH-1:0]debug_mem_read_data           ,
        input       debug_mem_read_valid                ,
		
		// outputs of data registers
		
		// outputs going to DTM 
		output reg 	[DATA_WIDTH-1:0] data0_reg			,	// Abstract Data 0 register
		output reg 	[DATA_WIDTH-1:0] data1_reg			,	// Abstract Data 1 register
        output reg  [DATA_WIDTH-1:0] data2_reg          ,
        output reg  [DATA_WIDTH-1:0] data3_reg          ,
		
		// outputs going to Top
		output reg 	[CORE_DATA_WIDTH-1:0] debug_reg_write_data			,
		output reg  debug_reg_read_enable				,
		output reg 	debug_reg_write_enable				,
		output reg	 	[15:0]debug_reg_address			,

        output reg  [CORE_DATA_WIDTH-1:0]debug_mem_write_addr          ,
        output reg  [CORE_DATA_WIDTH-1:0]debug_mem_read_addr           ,
        output reg  debug_mem_write_enable              ,
        output reg  debug_mem_read_enable               ,
        output reg  [CORE_DATA_WIDTH-1:0]debug_mem_write_data          ,

        output reg  [(CORE_DATA_WIDTH>>3)-1:0] debug_mem_strobe              

      //  output reg  aampostincr_done            
		
														);

	reg [2:0] aamsize_r;//edited by siddarth
    reg [7:0] cmdtype_r;
    reg       write_reg_r ;
    always@(posedge clock or negedge resetn )
    begin
        if(!resetn )
        begin
            aamsize_r <= 3'd0;
            cmdtype_r <= 8'd0;
            write_reg_r <= 1'b0;
        end
        else if(!dmactive)
        begin
                        aamsize_r <= 3'd0;
            cmdtype_r <= 8'd0;
            write_reg_r <= 1'b0;

        end
        else
        begin
            aamsize_r <= aamsize ;
            cmdtype_r <= cmdtype;
            write_reg_r <= write_reg ;
        end
    end
		// Local parameter declarations for respective address
		
		localparam DATA0_ADDR  = 32'h00000004			;	// localparameter declaration for Data0 register address
		localparam DATA1_ADDR  = 32'h00000005			;	// localparameter declaration for Data1 register address
        localparam DATA2_ADDR  = 32'h00000006			;
        localparam DATA3_ADDR  = 32'h00000007			;
		
		//writing into data 0 and data1 registers
		
		always@(posedge clock or negedge resetn)
			begin
				if(!resetn )
					begin
						data0_reg <= 0;		// under reset data0 register will be 0
						data1_reg <= 0;		// under reset data1 register will be 0
                        data2_reg <= 0;
                        data3_reg <= 0;
                    //    aampostincr_done <= 1'b0;
					end
                    else if (!dmactive)
                    begin
                        						data0_reg <= 0;		// under reset data0 register will be 0
						data1_reg <= 0;		// under reset data1 register will be 0
                        data2_reg <= 0;
                        data3_reg <= 0;

                    end
				else 
					begin
                        // DTM to DM write 
						if(sel && enable && write)
							begin
							/*	if(!busy)
									begin
										if(addr == DATA0_ADDR)
											begin
												data0_reg <= data ;		// writes into data 2 register
											end
										if(addr == DATA1_ADDR)
											begin
												data1_reg <= data ;		// writes into data 2 register
											end
                                        if(addr == DATA2_ADDR)
											begin
												data2_reg <= data ;		// writes into data 2 register
											end
                                        if(addr == DATA3_ADDR)
											begin
												data3_reg <= data ;		// writes into data 3 register
											end


									end
								else 
									begin */
										if(addr == DATA0_ADDR)
											begin
												data0_reg  <= data ;
											end
										else if(addr == DATA1_ADDR)
											begin
												data1_reg  <= data ;
											end
                                        else if(addr == DATA2_ADDR)
											begin
												data2_reg  <= data ;
											end
                                        else if(addr == DATA3_ADDR)
											begin
												data3_reg  <= data ;
											end
								//	end
							end 
						else if(transfer_reg)
							begin
								if(!write_reg)
									begin
										if(debug_reg_read_valid)
											begin
                                                `ifdef ZILLA_64_BIT
                                               // if (CORE_DATA_WIDTH==64)
                                                  //  begin
                                                        if(aarsize == 3'b011)
                                                        begin
                                                        {data1_reg,data0_reg} <= {debug_reg_read_data};
                                                        data2_reg <= data2_reg  ;
                                                        data3_reg <= data3_reg ;
                                                        end
                                                        else if(aarsize == 3'b010)
                                                        begin
                                                        {data1_reg,data0_reg} <= {data1_reg,debug_reg_read_data[31:0]};
                                                        data2_reg <= data2_reg  ;
                                                        data3_reg <= data3_reg ;
                                                        end
                                                   // end
                                                `elsif ZILLA_32_BIT
                                               /* else*/ if((aarsize == 3'b010)/* && (CORE_DATA_WIDTH == 32)*/)
                                                     begin
                                                        data0_reg <= debug_reg_read_data ;
                                                        data1_reg <= data1_reg ;
                                                        data2_reg <= data2_reg  ;
                                                        data3_reg <= data3_reg ;
                                                     end
                                                    else
                                                     begin
                                                    data0_reg <= data0_reg ;
                                                    data1_reg <= data1_reg ;
                                                    data2_reg <= data2_reg  ;
                                                    data3_reg <= data3_reg ;

                                                     end
                                             `endif
											end
										else
											begin
												data0_reg  <= data0_reg ;
												data1_reg  <= data1_reg ;
                                                data2_reg <= data2_reg  ;
                                                data3_reg <= data3_reg ;

											end
									end
							end
                        // Memory access logic FIXME
                        `ifdef ZILLA_64_BIT
                        else if((cmdtype_r == 8'b00000010) /*&& (CORE_DATA_WIDTH == 64)*/)
                            begin
                                if(!write_reg_r)
                                    begin
                                        if(aamsize_r == 3'b010)
                                            begin
                                                if(debug_mem_read_valid)
                                                    begin
                                                        {data1_reg,data0_reg} <= {data1_reg,debug_mem_read_data[31:0]};
                                                        data2_reg <= data2_reg  ;
                                                        data3_reg <= data3_reg ;
                                                    end
                                             end
                                        else if(aamsize_r == 3'b011)
                                            begin
                                                if(debug_mem_read_valid)
                                                    begin
                                                        {data1_reg,data0_reg} <= {debug_mem_read_data};
                                                        data2_reg <= data2_reg  ;
                                                        data3_reg <= data3_reg ;
                                                    end
                                             end
                                        else if(aamsize_r == 3'b001)
                                            begin
                                                if(debug_mem_read_valid)
                                                    begin
                                                        {data1_reg,data0_reg} <= {data1_reg,data0_reg[31:16],debug_mem_read_data[15:0]};
                                                        data2_reg <= data2_reg  ;
                                                        data3_reg <= data3_reg ;
                                                    end
                                             end
                                        else if(aamsize_r == 3'b000)
                                            begin
                                                if(debug_mem_read_valid)
                                                    begin
                                                        {data1_reg,data0_reg} <= {data1_reg,data0_reg[31:08],debug_mem_read_data[7:0]};
                                                        data2_reg <= data2_reg  ;
                                                        data3_reg <= data3_reg ;
                                                    end
                                             end
                                        else
                                            begin
                                                data0_reg <= data0_reg ;
                                                data1_reg <= data1_reg ;
                                                data2_reg <= data2_reg ;
                                                data3_reg <= data3_reg ;
                                            end
                                    end
                                if(aampostincrement && busy)
                                    begin
                                        if(aamsize == 3'b000)
                                            begin
                                                data0_reg <= data0_reg ;
                                                data1_reg <= data1_reg ;
                                                data2_reg <= data2_reg + 1'd1;
                                                data3_reg <= data3_reg ;
                                            end
                                        else if(aamsize == 3'b001)
                                            begin
                                                data0_reg <= data0_reg ;
                                                data1_reg <= data1_reg ;
                                                data2_reg <= data2_reg + 2'd2;
                                                data3_reg <= data3_reg ;
                                            end
                                        else if(aamsize == 3'b010)
                                            begin
                                                data0_reg <= data0_reg ;
                                                data1_reg <= data1_reg ;
                                                data2_reg <= data2_reg + 3'd4 ;
                                                data3_reg <= data3_reg ;
                                            end
                                        else if(aamsize == 3'b011)
                                            begin
                                                data0_reg <= data0_reg ;
                                                data1_reg <= data1_reg ;
                                                data2_reg <= data2_reg + 4'd8 ;
                                                data3_reg <= data3_reg ;
                                            end
                                        else 
                                            begin
                                                data0_reg <= data0_reg ;
                                                data1_reg <= data1_reg ;
                                                data2_reg <= data2_reg ;
                                                data3_reg <= data3_reg ;
                                            end
                                    end
                                end
                           `elsif ZILLA_32_BIT
                           else if((cmdtype_r == 8'b00000010)/* && (CORE_DATA_WIDTH == 32)*/)
                            begin
                                if(!write_reg_r)
                                    begin
                                        if(aamsize_r == 3'b010)
                                            begin
                                                if(debug_mem_read_valid)
                                                    begin
                                                        data0_reg <= debug_mem_read_data;
                                                    end
                                             end
                                        else if(aamsize_r == 3'b001)
                                            begin
                                                if(debug_mem_read_valid)
                                                    begin
                                                        data0_reg <= {data0_reg[31:16],debug_mem_read_data[15:0]};
                                                    end
                                             end
                                        else if(aamsize_r == 3'b000)
                                            begin
                                                if(debug_mem_read_valid)
                                                    begin
                                                        data0_reg <= {data0_reg[31:8],debug_mem_read_data[7:0]};
                                                    end
                                             end
                                        else
                                            begin
                                                data0_reg <= data0_reg ;
                                            end
                                    end
                                if(aampostincrement && busy)
                                    begin
                                        if(aamsize == 3'b000)
                                            begin
                                                data0_reg <= data0_reg ;
                                                data1_reg <= data1_reg + 1'b1;
                                                data2_reg <= data2_reg ;
                                                data3_reg <= data3_reg ;
                                            end
                                        else if(aamsize == 3'b001)
                                            begin
                                                data0_reg <= data0_reg ;
                                                data1_reg <= data1_reg + 2'd2;
                                                data2_reg <= data2_reg ;
                                                data3_reg <= data3_reg ;
                                            end
                                        else if(aamsize == 3'b010)
                                            begin
                                                data0_reg <= data0_reg ;
                                                data1_reg <= data1_reg + 3'd4 ;
                                                data2_reg <= data2_reg ;
                                                data3_reg <= data3_reg ;
                                            end
                                        else 
                                            begin
                                                data0_reg <= data0_reg ;
                                                data1_reg <= data1_reg ;
                                                data2_reg <= data2_reg ;
                                                data3_reg <= data3_reg ;
                                            end
                                    end
                              end
                            `endif
					end
			end
		
		always@(posedge clock or negedge resetn )
			begin
				if(!resetn )
					begin
                        `ifdef ZILLA_64_BIT
						debug_reg_write_data <=  64'b0;
                        `elsif ZILLA_32_BIT
                        debug_reg_write_data <=  32'b0;
                        `endif
						debug_reg_write_enable <= 1'b0;
						debug_reg_read_enable <= 1'b0;
                        debug_reg_address <= 16'b0 ;

					end
                    else if (!dmactive)
                    begin
                                                `ifdef ZILLA_64_BIT
						debug_reg_write_data <=  64'b0;
                        `elsif ZILLA_32_BIT
                        debug_reg_write_data <=  32'b0;
                        `endif
						debug_reg_write_enable <= 1'b0;
						debug_reg_read_enable <= 1'b0;
                        debug_reg_address <= 16'b0 ;

                    end
				else 
					begin
						if(transfer_reg)
							begin
								if(write_reg)
									begin
										//debug_reg_write_enable <= 1'b1;
										debug_reg_read_enable <= 1'b0 ;
                                        debug_reg_address <= regno ;
                                      //  if(CORE_DATA_WIDTH == 64)
                                       // begin
                                      `ifdef ZILLA_64_BIT
                                            if(aarsize == 3'b011)
                                            begin
                                                debug_reg_write_enable <= 1'b1;

												debug_reg_write_data <= {data1_reg,data0_reg} ;
											end
                                            else if(aarsize == 3'b010)
											begin
                                                debug_reg_write_enable <= 1'b1;
												debug_reg_write_data[31:0] <= data0_reg ;
												debug_reg_write_data[63:32] <= 32'b0;
											end
										    else
											begin
												debug_reg_write_data <= debug_reg_write_data ;
                                                debug_reg_write_enable <= 1'b0;

											end
                                      //  end
                                      `elsif ZILLA_32_BIT
                                       /* else */ if(/*(CORE_DATA_WIDTH==32) &&*/ (aarsize == 3'b010))
                                            begin
                                                debug_reg_write_enable <= 1'b1;
												debug_reg_write_data <= data0_reg ;
                                            end
                                        else
                                            begin
                                                debug_reg_write_enable <= 1'b0;
												debug_reg_write_data <= debug_reg_write_data ;
                                            end
                                       `endif
									end
								else 
									begin
                                        `ifdef ZILLA_64_BIT
										debug_reg_write_data <=  64'b0 ;
                                        `elsif ZILLA_32_BIT
                                        debug_reg_write_data <=  32'b0 ;
                                        `endif
										debug_reg_write_enable <= 1'b0;
                                        `ifdef ZILLA_32_BIT
                                        if((aarsize == 3'b010) /*&& (CORE_DATA_WIDTH == 32)*/)
                                        begin
										debug_reg_read_enable <= 1'b1;
                                        debug_reg_address <= regno ;
                                        end
                                        else
                                        begin
                                        debug_reg_read_enable <= 1'b0;
                                        debug_reg_address <= 16'b0 ;
                                        end

                                      //  else if(CORE_DATA_WIDTH == 64)
                                       // begin
                                       `elsif ZILLA_64_BIT
                                            if((aarsize == 3'b010) || (aarsize == 3'b011))
                                            begin
                                            debug_reg_read_enable <= 1'b1;
                                            debug_reg_address <= regno ;
                                            end
                                            else
                                            begin
                                            debug_reg_read_enable <= 1'b0;
                                            debug_reg_address <= 16'b0 ;
                                            end
                                      // end
                                      `endif
									end
							end
						else
							begin
								debug_reg_write_data <= 0;
								debug_reg_write_enable <= 1'b0;
								debug_reg_read_enable <= 1'b0;
                                debug_reg_address <= 16'b0;
							end
					end
			end

            //FIXME Memory debug_mem_write_data
    always@( posedge clock or negedge resetn )
			begin
				if(!resetn  )
					begin
                        `ifdef ZILLA_64_BIT
                        debug_mem_write_addr <= 64'b0 ;
                        debug_mem_read_addr <=  64'b0;
                        debug_mem_write_data <= 64'b0;
                        `elsif ZILLA_32_BIT
                        debug_mem_write_addr <= 64'b0 ;
                        debug_mem_read_addr <=  64'b0;
                        debug_mem_write_data <= 64'b0;
                        `endif
                        debug_mem_write_enable <= 1'b0;
                        debug_mem_read_enable <= 1'b0;
                    end
                    else if (!dmactive)
                    begin
                                                `ifdef ZILLA_64_BIT
                        debug_mem_write_addr <= 64'b0 ;
                        debug_mem_read_addr <=  64'b0;
                        debug_mem_write_data <= 64'b0;
                        `elsif ZILLA_32_BIT
                        debug_mem_write_addr <= 64'b0 ;
                        debug_mem_read_addr <=  64'b0;
                        debug_mem_write_data <= 64'b0;
                        `endif
                        debug_mem_write_enable <= 1'b0;
                        debug_mem_read_enable <= 1'b0;

                    end
                else
                    begin
                        if(cmdtype == 8'b00000010 && busy)
                            begin
                                if(!write_reg)
                                    begin
                                       // debug_mem_read_enable <= 1'b1 ;
                                        debug_mem_write_enable <= 1'b0;
                                        `ifdef ZILLA_64_BIT
                                        debug_mem_write_data <= 64'b0;
                                        debug_mem_write_addr <= 64'b0;
                                        `elsif ZILLA_32_BIT
                                        debug_mem_write_data <= 32'b0;
                                        debug_mem_write_addr <= 32'b0;
                                        `endif
                                        `ifdef ZILLA_64_BIT
                                        //if(CORE_DATA_WIDTH == 64)
                                       // begin
                                        if(aamsize[2:0] <= 3'b011)
                                            begin
                                                debug_mem_read_addr <= {data3_reg,data2_reg};
                                                debug_mem_read_enable <= 1'b1 ;
                                            end
                                        else
                                            begin
                                                debug_mem_read_enable <= 1'b0 ;
                                                debug_mem_read_addr <= 64'b0 ;
                                            end
                                       // end
                                        `elsif ZILLA_32_BIT
                                        //else if(CORE_DATA_WIDTH == 32)
                                        //begin
                                        if(aamsize[2:0] <= 3'b010)
                                            begin
                                                debug_mem_read_addr <= data1_reg;
                                                debug_mem_read_enable <= 1'b1 ;
                                            end
                                        else
                                            begin
                                                debug_mem_read_enable <= 1'b0 ;
                                                debug_mem_read_addr <= 32'b0 ;
                                            end
                                        `endif
                                       // end
                                    end
                                else 
                                    begin
                                        //if(CORE_DATA_WIDTH == 64)
                                      //  begin
                                        `ifdef ZILLA_64_BIT
                                        debug_mem_read_enable <= 1'b0;
                                        debug_mem_read_addr <= 64'b0 ;
                                        if(aamsize == 3'b000)
                                            begin
                                                debug_mem_write_data <= {56'b0,data0_reg[7:0]};
                                                debug_mem_write_enable <= 1'b1;
                                                debug_mem_write_addr <= {data3_reg,data2_reg};
                                            end
                                        else if(aamsize == 3'b001)
                                            begin
                                                debug_mem_write_data <= {48'b0,data0_reg[15:0]};
                                                debug_mem_write_enable <= 1'b1;
                                                debug_mem_write_addr <= {data3_reg,data2_reg};
                                            end
                                        else if(aamsize == 3'b010)
                                            begin
                                                debug_mem_write_data <= {32'b0,data0_reg};
                                                debug_mem_write_enable <= 1'b1;
                                                debug_mem_write_addr <= {data3_reg,data2_reg};
                                            end
                                        else if(aamsize == 3'b011)
                                            begin
                                                debug_mem_write_data <= {data1_reg,data0_reg};
                                                debug_mem_write_enable <= 1'b1;
                                                debug_mem_write_addr <= {data3_reg,data2_reg};
                                            end
                                        else
                                            begin
                                                debug_mem_write_data <= 64'b0;
                                                debug_mem_write_enable <= 1'b0;
                                                debug_mem_write_addr <= 64'b0 ;
                                            end
                                      //  end
                                      `elsif ZILLA_32_BIT
                                     //   if(CORE_DATA_WIDTH == 32)
                                     //   begin
                                        debug_mem_read_enable <= 1'b0;
                                        debug_mem_read_addr <= 32'b0 ;
                                        if(aamsize == 3'b000)
                                            begin
                                                debug_mem_write_data <= {24'b0,data0_reg[7:0]};
                                                debug_mem_write_enable <= 1'b1;
                                                debug_mem_write_addr <= data1_reg;
                                            end
                                        else if(aamsize == 3'b001)
                                            begin
                                                debug_mem_write_data <= {16'b0,data0_reg[15:0]};
                                                debug_mem_write_enable <= 1'b1;
                                                debug_mem_write_addr <= data1_reg;
                                            end
                                        else if(aamsize == 3'b010)
                                            begin
                                                debug_mem_write_data <= {data0_reg};
                                                debug_mem_write_enable <= 1'b1;
                                                debug_mem_write_addr <= data1_reg;
                                            end
                                        else
                                            begin
                                                debug_mem_write_data <= 32'b0;
                                                debug_mem_write_enable <= 1'b0;
                                                debug_mem_write_addr <= 32'b0 ;
                                            end
                                        `endif
                                        //end
                                    end 
                            end
                        else
                            begin
                                `ifdef ZILLA_64_BIT
                                debug_mem_write_addr <=  64'b0;
                                debug_mem_read_addr <=   64'b0 ;
                                `elsif ZILLA_32_BIT
                                debug_mem_write_addr <=  32'b0;
                                debug_mem_read_addr <=   32'b0 ;
                                `endif
                                debug_mem_write_enable <= 1'b0;
                                debug_mem_read_enable <= 1'b0;
                            end
                    end
         end
         
         always@(posedge clock or negedge resetn )
         begin
             if( !resetn)
                 debug_mem_strobe <= 8'b0;
             else if(!dmactive )
                 debug_mem_strobe <= 8'b0;
             else
                 begin
                   //  if(CORE_DATA_WIDTH == 64)
                   //  begin
                     `ifdef ZILLA_64_BIT
                     if(aamsize == 3'b000)
                     begin
                         debug_mem_strobe <= 8'b00000001;
                        end
                     else if(aamsize == 3'b001)
                     begin
                         debug_mem_strobe <= 8'b00000011;
                     end
                     else if(aamsize == 3'b010)
                        begin
                         debug_mem_strobe <= 8'b00001111;
                     end
                    else if(aamsize == 3'b011)
                        begin
                         debug_mem_strobe <= 8'b11111111;
                     end
                    else
                        begin
                         debug_mem_strobe <= 8'b0;
                     end
                 //  end
                    `elsif ZILLA_32_BIT
                 //  else if(CORE_DATA_WIDTH == 32)
                    //   begin
                     if(aamsize == 3'b000)
                     begin
                         debug_mem_strobe <= 4'b0001;
                        end
                     else if(aamsize == 3'b001)
                     begin
                         debug_mem_strobe <= 4'b0011;
                     end
                     else if(aamsize == 3'b010)
                        begin
                         debug_mem_strobe <= 4'b1111;
                     end
                     else
                        begin
                         debug_mem_strobe <= 4'b0;
                     end
                  // end

                `endif
                end
         end


		
endmodule

///////////////////////////////////////// End of Abstract data 0 and data 1 registers //////////////////////////////////////
