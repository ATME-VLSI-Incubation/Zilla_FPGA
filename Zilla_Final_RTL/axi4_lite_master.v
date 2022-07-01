// AXI4 Lite Matser Read & Write module
// Company: FrenusTech Pvt Ltd
// Domain : RTL Design
// Author : Papu Maharana

`timescale 1ns/1ps 

module axi4_lite_master 
	#(
		  parameter ADDR_WIDTH = 0,
		  parameter DATA_WIDTH = 0,
		  parameter STRB_WIDTH = 0 		  
                  )(
	 
	  // system control ports
	  input                       axi4_lite_clk , // syatem clock signal
	  input                       axi4_lite_rstn, // syatem reset signal: async active low reset
			
	  // write address ports
	  output reg [ADDR_WIDTH-1:0] M_AW_ADDR_OUT , 
	  output reg                  M_AW_VALID_OUT,
	  input                       M_AW_READY_IN ,
			
	  // write data ports
	  output reg [DATA_WIDTH-1:0] M_W_DATA_OUT  ,
	  output reg [STRB_WIDTH-1:0] M_W_STRB_OUT  ,
	  output reg                  M_W_VALID_OUT ,
	  input                       M_W_READY_IN  ,
			
	  // write response ports
	  input      [1:0]            M_B_RESP_IN   ,
	  input                       M_B_VALID_IN  ,
	  output reg                  M_B_READY_OUT ,
			
	  // read address ports
	  output reg [ADDR_WIDTH-1:0] M_AR_ADDR_OUT ,
	  output reg                  M_AR_VALID_OUT,
	  input                       M_AR_READY_IN ,
			
	  // read data ports
	  input      [DATA_WIDTH-1:0] M_R_DATA_IN   ,
	  input      [1:0]            M_R_RESP_IN   ,
	  input                       M_R_VALID_IN  ,
	  output reg                  M_R_READY_OUT ,
			
	  // address, data_in and data_out
	  input                       wr_en_in      ,
	  input                       rd_en_in      ,
	  input      [STRB_WIDTH-1:0] byte_en       ,
	  input      [ADDR_WIDTH-1:0] wr_addr_in    ,
	  input      [ADDR_WIDTH-1:0] rd_addr_in    ,
	  input      [DATA_WIDTH-1:0] m_data_in     ,
	  output     [DATA_WIDTH-1:0] m_data_out    ,
          output          master_read_data_valid ,
	  input [4:0] 			rd 		,
	  output reg [4:0] 		uart_rd		,
	  output 			uart_rd_valid	,
	  output [DATA_WIDTH-1:0] 	uart_data	

          //output reg [1:0] state_r
						   );


	// parameter declaration of states
	localparam  WR_IDLE  =  2'd0 ; // IDLE State for write
	localparam  WR_ADDR  =  2'd1 ; // Master Write Address
	localparam  WR_DATA  =  2'd2 ; // Master Write Data
	localparam  WR_RESP  =  2'd3 ; // Master Write Response

    localparam  RD_IDLE  =  2'd0 ; // IDLE state for read
	localparam  RD_ADDR  =  2'd1 ; // Master Read Address
	localparam  RD_DATA  =  2'd2 ; // Master Read Data
	
	
	reg [1:0] state_w;
       reg [1:0] state_r;
	reg [DATA_WIDTH-1:0] write_data_r;
	reg [DATA_WIDTH-1:0] rd_addr_r;


	always@(posedge axi4_lite_clk or negedge axi4_lite_rstn)
	begin
		if(!axi4_lite_rstn)
		begin
			rd_addr_r <= {DATA_WIDTH{1'b0}};
			uart_rd <= 5'd0;
		end
		else
		begin
			if(rd_en_in)
			begin
				rd_addr_r <= rd_addr_in;
				uart_rd <= rd ;
			end

		end
	end


 /*       assign master_read_data_valid = M_R_VALID_IN ;
        assign M_W_STRB_OUT = byte_en;
always @(posedge axi4_lite_clk or negedge axi4_lite_rstn)
		begin
            if(!axi4_lite_rstn)
            begin
             write_data_r <= {DATA_WIDTH{1'b0}};
         end
             else
             begin
                 write_data_r <= m_data_in;
             end
        end	*/

        /////////////write address///////////////
   /*     always @(posedge axi4_lite_clk or negedge axi4_lite_rstn)
		begin
			if(!axi4_lite_rstn)
            begin
	                M_AW_ADDR_OUT      <= {DATA_WIDTH{1'b0}};
	
	        end
            else
            begin
                if(M_AW_READY_IN && wr_en_in)
                begin
                    M_AW_ADDR_OUT <= wr_addr_in; 
                    M_AW_VALID_OUT <= 1'b1;
                end
                else
                begin
                end

            end
        end*/

//////////////////////////write address////////////////
   /*    always@(*)
       begin
          // if(wr_en_in && M_AW_READY_IN)
          if(wr_en_in)
           begin
                M_AW_ADDR_OUT  = wr_addr_in; 
                M_AW_VALID_OUT = 1'b1;

           end
           else
           begin
                M_AW_ADDR_OUT = {DATA_WIDTH{1'b0}}; 
                M_AW_VALID_OUT = 1'b0;

           end
               
       end*/


        ///////////write data /////////////////////
        always @(posedge axi4_lite_clk or negedge axi4_lite_rstn)
		begin
			if(!axi4_lite_rstn)
            begin
                M_W_DATA_OUT <=   0;
                M_W_STRB_OUT <=   0;
                M_W_VALID_OUT<=   0;
                M_B_READY_OUT <= 0;
		M_AW_ADDR_OUT <= 0;
		M_AW_VALID_OUT = 1'b0;

            end
            else
               
            begin
                 M_B_READY_OUT <= 1'b1;
            if(wr_en_in)
            begin
                M_W_DATA_OUT <=   m_data_in;
                M_W_STRB_OUT <=   byte_en;
                M_W_VALID_OUT<=   1'b1;
		M_AW_ADDR_OUT <= wr_addr_in ;
		M_AW_VALID_OUT = 1'b1;
                //M_B_READY_OUT <= 1'b1;
            end

            else if(M_W_READY_IN)
            begin
                M_W_DATA_OUT <=   0;
                M_W_STRB_OUT <=   0;
                M_W_VALID_OUT<=   0;
		M_AW_VALID_OUT = 1'b0;

            end

            end
        end
/*
       always@(*)
       begin
          // if(rd_en_in && M_AR_READY_IN)
          if(rd_en_in)
           begin
                M_AR_ADDR_OUT  <= rd_addr_in; 
                M_AR_VALID_OUT <= 1'b1;

           end
           else
           begin
                M_AR_ADDR_OUT <= {DATA_WIDTH{1'b0}}; 
                M_AR_VALID_OUT <= 1'b0;

           end
               
       end*/
      /*
always @(posedge axi4_lite_clk or negedge axi4_lite_rstn)
		begin
            if(!axi4_lite_rstn)
            begin
            M_R_READY_OUT  <= 0;
         end
             else
             begin
                // if(rd_en_in && M_AR_READY_IN)
              //  begin
                M_R_READY_OUT <= 1'b1;
            //end
             end
        end	*/


 //assign m_data_out =  M_R_VALID_IN ? M_R_DATA_IN : {DATA_WIDTH{1'b0}};


/*	//===================STATE-MACHINE====================
	//=============== write state logic ================	
	always @(posedge axi4_lite_clk or negedge axi4_lite_rstn)
		begin
			if(!axi4_lite_rstn)
				begin
					state_w <= WR_ADDR;
				end
			else
				begin
					case(state_w)
					/*	WR_IDLE : begin // IDLE state						
									if(wr_en_in)   
										// if start_wr asserted write operation performed
									    // state goes to Master WR_ADDR state
										state_w <= WR_ADDR;												
									else 
										// else state is in IDLE state
										state_w <= WR_IDLE;
												
								  end   // end IDLE*/
										
/*						WR_ADDR : begin // Master WR_ADDR state						
									if(M_AW_READY_IN && M_AW_VALID_OUT) 
										// If awready & awvalid are high handshaking starts
										// pass WR_ADDR to slave memory
										// state goes to Master WR_DATA state
										state_w <= WR_DATA;
											
									else
										// Wait in Master WR_ADDR state 
										// until handshaking starts
										state_w <= WR_ADDR;
												
								  end   // end Master WR_ADDR
										
						WR_DATA : begin // Master WR_DATA state						
									if(M_W_READY_IN && M_W_VALID_OUT)
										// If wready & wvalid are high handshaking starts
									    // pass WR_DATA to slave memory
										// state goes to Master WR_RESP state
										state_w <= WR_RESP;
												
									else
										// Wait in Master WR_DATA state 
										// until handshaking starts
										state_w <= WR_DATA;
												
							      end   // end Master WR_DATA
										
						WR_RESP : begin // Master WR_RESP state						
									if(M_B_VALID_IN && M_B_READY_OUT)
										// If bready & bvalid are high handshaking starts
										begin
                                            if(wr_en_in)
                                            begin
                                                state_w <= WR_DATA;
                                            end
                                            else
                                            begin
											if(M_B_RESP_IN == 2'b00)
												// if response is 'OK' state goes to IDLE state
												state_w <= WR_ADDR;
											else
												// else state goes to Master WR_DATA state
												state_w <= WR_DATA;
                                            end
										end
												 
									else
										// Wait in Master WR_RESP state 
										// until handshaking starts
										state_w <= WR_RESP;
												
								  end   // end Master WR_RESP
																				
						default : begin // default state
									state_w <= WR_ADDR;
								  end   // end default 
					endcase
				end
		end

    */

	//===================STATE-MACHINE====================
	//================ read state logic ================	
	always @(posedge axi4_lite_clk or negedge axi4_lite_rstn)
		begin
			if(!axi4_lite_rstn)
				begin
					state_r <= RD_IDLE;
				end
			else
				begin
					case(state_r)
						RD_IDLE : begin // IDLE state																	
									if(rd_en_in)
										// if start_rd asserted read operation performed
										// state goes to Master RD_ADDR state
										state_r <= RD_ADDR;												
									else 
										// else state is in IDLE state
										state_r <= RD_IDLE;
												
								  end   // end IDLE
															
						RD_ADDR : begin // Master RD_ADDR state						
									if(M_AR_READY_IN && M_AR_VALID_OUT)
										// If arready & arvalid are high handshaking starts
										// pass RD_ADDR to slave memory
										// state goes to Master RD_DATA state
										state_r <= RD_DATA;
										 
									else
										// Wait in Master RD_ADDR state 
										// until handshaking starts
										state_r <= RD_ADDR;
												
								  end   // end Master RD_ADDR
										
						RD_DATA : begin // Master RD_DATA state						
									if(M_R_READY_OUT && M_R_VALID_IN)
										// If rready & rvalid are high handshaking starts
										// pass RD_DATA and RRESP to master 
										// state goes to IDLE state
										begin
											if((M_R_RESP_IN == 2'b00 ) || (M_R_RESP_IN == 2'b01))
												begin
													state_r <= RD_IDLE       ;
												end													
										end												
									else
										// Wait in Master RD_DATA state 
										// until handshaking starts
										state_r <= RD_DATA;
												
								  end   // end Master RD_DATA 
										
						default : begin // default state
									state_r <= RD_IDLE;
								  end   // end default 
					endcase
				end
		end

		
/*	//==============STATE-MACHINE================
	//=========== write output logic ============	
	always @(*)
		begin
			M_AW_VALID_OUT =  1'b0             ; // write address valid
            		M_AW_ADDR_OUT  = {ADDR_WIDTH{1'b0}}; 
			M_W_DATA_OUT   = {DATA_WIDTH{1'b0}}; // write data
			M_W_VALID_OUT  =  1'b0             ; // write data valid
			M_B_READY_OUT  =  1'b0             ; // write response ready
							
			case(state_w)
				WR_ADDR : begin // Master WR_ADDR state
                        if(wr_en_in)
                        begin
							M_AW_VALID_OUT = 1'b1      ;
                            M_AW_ADDR_OUT  = wr_addr_in;
                        end
				          end   // end Master WR_ADDR
										
				WR_DATA : begin // Master WR_DATA state
							M_W_VALID_OUT = 1'b1     ;
							M_W_DATA_OUT  = write_data_r;

				          end   // end Master WR_DATA
										 
				WR_RESP : begin // Master WR_RESP state
							M_B_READY_OUT = 1'b1;
				          end   // end Master WR_RESP
																  
				default : begin
							M_AW_VALID_OUT =  1'b0             ; // write address valid
                            				M_AW_ADDR_OUT  = {ADDR_WIDTH{1'b0}}; 
							M_W_DATA_OUT   = {DATA_WIDTH{1'b0}}; // write data
							M_W_VALID_OUT  =  1'b0             ; // write data valid
							M_B_READY_OUT  =  1'b0             ; // write response ready
						  end
			endcase
		end*/


    //==============STATE-MACHINE================
	//=========== read output logic =============	
	always @(*)
		begin
		    		case(state_r)	
				RD_IDLE: 
				begin
					M_AR_ADDR_OUT  = {ADDR_WIDTH{1'b0}}; // read address
					M_AR_VALID_OUT =  1'b0             ; // read address valid
					M_R_READY_OUT  =  1'b0             ; // read		

				end				
				RD_ADDR : 
				begin // Master RD_ADDR state
                            	
					M_AR_VALID_OUT = 1'b1      ;
					M_AR_ADDR_OUT  = rd_addr_r;
                          
				end   // end Master RD_ADDR
										
				RD_DATA : 
				begin // Master RD_DATA state
							
					M_R_READY_OUT = 1'b1;
				          
				end   // end Master RD_DATA
						  
				default : 
				begin
							M_AR_ADDR_OUT  = {ADDR_WIDTH{1'b0}}; // read address
							M_AR_VALID_OUT =  1'b0             ; // read address valid
							M_R_READY_OUT  =  1'b0             ; // read data ready
				end
			endcase
		end

        assign m_data_out = M_R_VALID_IN ? M_R_DATA_IN: {DATA_WIDTH{1'b0}};
	assign uart_data = M_R_VALID_IN ? M_R_DATA_IN : {DATA_WIDTH{1'b0}};
	assign uart_rd_valid = M_R_VALID_IN ;

endmodule

