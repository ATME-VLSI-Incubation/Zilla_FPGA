//machine hardware performance counter
//mhpmcounter


module mhpm_counter_top
#(
parameter CSR_ADDR_WIDTH    = 0,
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
input 		csr_clk				,
input 		csr_rst				,
input       wdt_reset_i         ,
input 		csr_write_enable		,
input 	[CSR_ADDR_WIDTH-1:0] 	csr_write_addr			,
input   [DATA_WIDTH-1:0] 	csr_write_data			,
input 	[DATA_WIDTH-1:0]	mhpm_counter_csr_inhibit_bit	,
output  [DATA_WIDTH-1:0] 	mhpm_counter3_o			,
output  [DATA_WIDTH-1:0] 	mhpm_counter4_o			,
output  [DATA_WIDTH-1:0] 	mhpm_counter5_o			,
output  [DATA_WIDTH-1:0] 	mhpm_counter6_o			,
output  [DATA_WIDTH-1:0] 	mhpm_counter7_o			,
output  [DATA_WIDTH-1:0] 	mhpm_counter8_o			,
output  [DATA_WIDTH-1:0] 	mhpm_counter9_o			,
output  [DATA_WIDTH-1:0] 	mhpm_counter10_o		,
output  [DATA_WIDTH-1:0] 	mhpm_counter11_o		,
output  [DATA_WIDTH-1:0] 	mhpm_counter12_o		,
output  [DATA_WIDTH-1:0] 	mhpm_counter13_o		,
output  [DATA_WIDTH-1:0] 	mhpm_counter14_o		,
output  [DATA_WIDTH-1:0] 	mhpm_counter15_o		,
output  [DATA_WIDTH-1:0] 	mhpm_counter16_o		,
output  [DATA_WIDTH-1:0] 	mhpm_counter17_o		,
output  [DATA_WIDTH-1:0] 	mhpm_counter18_o		,
output  [DATA_WIDTH-1:0] 	mhpm_counter19_o		,
output  [DATA_WIDTH-1:0] 	mhpm_counter20_o		,
output  [DATA_WIDTH-1:0] 	mhpm_counter21_o		,
output  [DATA_WIDTH-1:0] 	mhpm_counter22_o		,
output  [DATA_WIDTH-1:0] 	mhpm_counter23_o		,
output  [DATA_WIDTH-1:0] 	mhpm_counter24_o		,
output  [DATA_WIDTH-1:0] 	mhpm_counter25_o		,
output  [DATA_WIDTH-1:0] 	mhpm_counter26_o		,
output  [DATA_WIDTH-1:0] 	mhpm_counter27_o		,
output  [DATA_WIDTH-1:0] 	mhpm_counter28_o		,
output  [DATA_WIDTH-1:0] 	mhpm_counter29_o		,
output  [DATA_WIDTH-1:0] 	mhpm_counter30_o		,
output  [DATA_WIDTH-1:0] 	mhpm_counter31_o	    ,
output [DATA_WIDTH-1:0] mhpm_event3_o ,     
output [DATA_WIDTH-1:0] mhpm_event4_o ,
output [DATA_WIDTH-1:0] mhpm_event5_o ,
output [DATA_WIDTH-1:0] mhpm_event6_o ,
output [DATA_WIDTH-1:0] mhpm_event7_o ,
output [DATA_WIDTH-1:0] mhpm_event8_o ,
output [DATA_WIDTH-1:0] mhpm_event9_o ,
output [DATA_WIDTH-1:0] mhpm_event10_o,
output [DATA_WIDTH-1:0] mhpm_event11_o,
output [DATA_WIDTH-1:0] mhpm_event12_o,
output [DATA_WIDTH-1:0] mhpm_event13_o,
output [DATA_WIDTH-1:0] mhpm_event14_o,
output [DATA_WIDTH-1:0] mhpm_event15_o,
output [DATA_WIDTH-1:0] mhpm_event16_o,
output [DATA_WIDTH-1:0] mhpm_event17_o,
output [DATA_WIDTH-1:0] mhpm_event18_o,
output [DATA_WIDTH-1:0] mhpm_event19_o,
output [DATA_WIDTH-1:0] mhpm_event20_o,
output [DATA_WIDTH-1:0] mhpm_event21_o,
output [DATA_WIDTH-1:0] mhpm_event22_o,
output [DATA_WIDTH-1:0] mhpm_event23_o,
output [DATA_WIDTH-1:0] mhpm_event24_o,
output [DATA_WIDTH-1:0] mhpm_event25_o,
output [DATA_WIDTH-1:0] mhpm_event26_o,
output [DATA_WIDTH-1:0] mhpm_event27_o,
output [DATA_WIDTH-1:0] mhpm_event28_o,
output [DATA_WIDTH-1:0] mhpm_event29_o,
output [DATA_WIDTH-1:0] mhpm_event30_o,
output [DATA_WIDTH-1:0] mhpm_event31_o,
input           dbg_csr_write_en_i      ,
input [CSR_ADDR_WIDTH-1:0]    dbg_csr_addr_i          ,
input [DATA_WIDTH-1:0]    dbg_csr_write_data_i    ,
input           debug_mode_valid_i      ,
input           dbg_ndm_reset_i         ,
input           dbg_hart_reset_i     


);
mhpm_counter_csr#(.MHPM_COUNTER(12'hb03),
  		  .MHPM_EVENT  (12'h323),
      .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter3_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event3			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[3]	),
.mhpm_counter_o				(mhpm_counter3_o			),
.mhpm_event_o               (mhpm_event3_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);

mhpm_counter_csr#(.MHPM_COUNTER(12'hb04),
  		  .MHPM_EVENT  (12'h324),
      .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter4_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event4			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[4]	),
.mhpm_counter_o				(mhpm_counter4_o			),
.mhpm_event_o               (mhpm_event4_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


mhpm_counter_csr#(.MHPM_COUNTER(12'hb05),
   		  .MHPM_EVENT  (12'h325),
      .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter5_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event5			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[5]		),
.mhpm_counter_o				(mhpm_counter5_o			),
.mhpm_event_o               (mhpm_event5_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


mhpm_counter_csr#(.MHPM_COUNTER(12'hb06),
  		  .MHPM_EVENT  (12'h326),
      .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter6_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[6]	),
.mhpm_counter_o				(mhpm_counter6_o			),
.mhpm_event_o               (mhpm_event6_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


mhpm_counter_csr#(.MHPM_COUNTER(12'hb07),
    		  .MHPM_EVENT  (12'h327),
          .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter7_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[7]	),
.mhpm_counter_o				(mhpm_counter7_o			),
.mhpm_event_o               (mhpm_event7_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


mhpm_counter_csr#(.MHPM_COUNTER(12'hb08),
  		  .MHPM_EVENT  (12'h328),
      .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter8_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[8]	),
.mhpm_counter_o				(mhpm_counter8_o			),
.mhpm_event_o               (mhpm_event8_o),.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


mhpm_counter_csr#(.MHPM_COUNTER(12'hb09),
  		  .MHPM_EVENT  (12'h329),
      .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter9_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[9]	),
.mhpm_counter_o				(mhpm_counter9_o			),
.mhpm_event_o               (mhpm_event9_o),.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


mhpm_counter_csr#(.MHPM_COUNTER(12'hb0a),
  		  .MHPM_EVENT  (12'h32a),
      .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter10_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[10]	),
.mhpm_counter_o				(mhpm_counter10_o			),
.mhpm_event_o               (mhpm_event10_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


mhpm_counter_csr#(.MHPM_COUNTER(12'hb0b),
  		  .MHPM_EVENT  (12'h32b),
      .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter11_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[11]	),
.mhpm_counter_o				(mhpm_counter11_o			),
.mhpm_event_o               (mhpm_event11_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


mhpm_counter_csr#(.MHPM_COUNTER(12'hb0c),
  		  .MHPM_EVENT  (12'h32c),
      .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter12_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[12]	),
.mhpm_counter_o				(mhpm_counter12_o			),
.mhpm_event_o               (mhpm_event12_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


mhpm_counter_csr#(.MHPM_COUNTER(12'hb0d),
  		  .MHPM_EVENT  (12'h32d),
      .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter13_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[13]	),
.mhpm_counter_o				(mhpm_counter13_o			),
.mhpm_event_o               (mhpm_event13_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


mhpm_counter_csr#(.MHPM_COUNTER(12'hb0e),
  		  .MHPM_EVENT  (12'h32e),
      .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter14_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[14]	),
.mhpm_counter_o				(mhpm_counter14_o			),
.mhpm_event_o               (mhpm_event14_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


mhpm_counter_csr#(.MHPM_COUNTER(12'hb0f),
  		  .MHPM_EVENT  (12'h32f),
      .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter15_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[15]	),
.mhpm_counter_o				(mhpm_counter15_o			),
.mhpm_event_o               (mhpm_event15_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


mhpm_counter_csr#(.MHPM_COUNTER(12'hb10),
  		  .MHPM_EVENT  (12'h330),
      .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter16_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[16]	),
.mhpm_counter_o				(mhpm_counter16_o			),
.mhpm_event_o               (mhpm_event16_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


mhpm_counter_csr#(.MHPM_COUNTER(12'hb11),
  	          .MHPM_EVENT  (12'h331),
          .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter17_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[17]	),
.mhpm_counter_o				(mhpm_counter17_o			),
.mhpm_event_o               (mhpm_event17_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


mhpm_counter_csr#(.MHPM_COUNTER(12'hb12),
  		  .MHPM_EVENT  (12'h332),
      .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter18_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[18]	),
.mhpm_counter_o				(mhpm_counter18_o			),
.mhpm_event_o               (mhpm_event18_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


mhpm_counter_csr#(.MHPM_COUNTER(12'hb13),
  		  .MHPM_EVENT  (12'h333),
      .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter19_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[19]	),
.mhpm_counter_o				(mhpm_counter19_o			),
.mhpm_event_o               (mhpm_event19_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


mhpm_counter_csr#(.MHPM_COUNTER(12'hb14),
  		  .MHPM_EVENT  (12'h334),
      .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter20_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[20]	),
.mhpm_counter_o				(mhpm_counter20_o			),
.mhpm_event_o               (mhpm_event20_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


mhpm_counter_csr#(.MHPM_COUNTER(12'hb15),
  		  .MHPM_EVENT  (12'h335),
      .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter21_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[21]	),
.mhpm_counter_o				(mhpm_counter21_o			),
.mhpm_event_o               (mhpm_event21_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


mhpm_counter_csr#(.MHPM_COUNTER(12'hb16),
  		  .MHPM_EVENT  (12'h336),
      .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter22_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[22]	),
.mhpm_counter_o				(mhpm_counter22_o			),
.mhpm_event_o               (mhpm_event22_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


mhpm_counter_csr#(.MHPM_COUNTER(12'hb17),
  		  .MHPM_EVENT  (12'h337),
      .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter23_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[23]	),
.mhpm_counter_o				(mhpm_counter23_o			),
.mhpm_event_o               (mhpm_event23_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


mhpm_counter_csr#(.MHPM_COUNTER(12'hb18),
  		  .MHPM_EVENT  (12'h338),
      .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter24_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[24]	),
.mhpm_counter_o				(mhpm_counter24_o			),
.mhpm_event_o               (mhpm_event24_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


mhpm_counter_csr#(.MHPM_COUNTER(12'hb19),
  		  .MHPM_EVENT  (12'h339),
      .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter25_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[25]	),
.mhpm_counter_o				(mhpm_counter25_o			),
.mhpm_event_o               (mhpm_event25_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


mhpm_counter_csr#(.MHPM_COUNTER(12'hb1a),
  		  .MHPM_EVENT  (12'h33a),
      .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter26_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[26]	),
.mhpm_counter_o				(mhpm_counter26_o			),
.mhpm_event_o               (mhpm_event26_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


mhpm_counter_csr#(.MHPM_COUNTER(12'hb1b),
  		  .MHPM_EVENT  (12'h33b),
      .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter27_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[27]	),
.mhpm_counter_o				(mhpm_counter27_o			),
.mhpm_event_o               (mhpm_event27_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


mhpm_counter_csr#(.MHPM_COUNTER(12'hb1c),
  		  .MHPM_EVENT  (12'h33c),
      .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter28_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[28]	),
.mhpm_counter_o				(mhpm_counter28_o			),
.mhpm_event_o               (mhpm_event28_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


mhpm_counter_csr#(.MHPM_COUNTER(12'hb1d),
  		  .MHPM_EVENT  (12'h33d),
      .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter29_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[29]	),
.mhpm_counter_o				(mhpm_counter29_o			),
.mhpm_event_o               (mhpm_event29_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


mhpm_counter_csr#(.MHPM_COUNTER(12'hb1e),
  		  .MHPM_EVENT  (12'h33e),
      .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter30_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[30]	),
.mhpm_counter_o				(mhpm_counter30_o			),
.mhpm_event_o               (mhpm_event30_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )


);


mhpm_counter_csr#(.MHPM_COUNTER(12'hb1f),
  		  .MHPM_EVENT  (12'h33f),
      .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
.PC_WIDTH          (PC_WIDTH          )
)
 mhpm_counter31_inst
(
.csr_clk				(csr_clk			),
.csr_rst				(csr_rst			),
.wdt_reset_i            (wdt_reset_i        ),
.csr_write_enable			(csr_write_enable		),
.csr_write_addr				(csr_write_addr			),
.csr_write_data				(csr_write_data			),
//.mhpm_event				(mhpm_event			),
.mhpm_counter_csr_inhibit_bit		(mhpm_counter_csr_inhibit_bit[31]	),
.mhpm_counter_o				(mhpm_counter31_o			),
.mhpm_event_o               (mhpm_event31_o),
.dbg_csr_write_en_i      (dbg_csr_write_en_i    ),
.dbg_csr_addr_i          (dbg_csr_addr_i        ),
.dbg_csr_write_data_i    (dbg_csr_write_data_i  ),
.debug_mode_valid_i      (debug_mode_valid_i    ),
.dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
.dbg_hart_reset_i        (dbg_hart_reset_i      )

);



endmodule

module mhpm_counter_csr#(parameter MHPM_COUNTER = 0,
			 parameter MHPM_EVENT = 0,
         parameter CSR_ADDR_WIDTH    = 0,
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)
(
input 			csr_clk				,
input 			csr_rst				,
input           wdt_reset_i         ,
input 			csr_write_enable		,
input 	   [CSR_ADDR_WIDTH-1:0] 	csr_write_addr			,
input      [DATA_WIDTH-1:0] 	csr_write_data			,
//input 	   [DATA_WIDTH-1:0]	mhpm_event			,
input 			mhpm_counter_csr_inhibit_bit	,
output  [DATA_WIDTH-1:0] 	mhpm_counter_o		,
output  [DATA_WIDTH-1:0]  mhpm_event_o    ,
input           dbg_csr_write_en_i      ,
input [CSR_ADDR_WIDTH-1:0]    dbg_csr_addr_i          ,
input [DATA_WIDTH-1:0]    dbg_csr_write_data_i    ,
input           debug_mode_valid_i      ,
input           dbg_ndm_reset_i         ,
input           dbg_hart_reset_i           
);


//localparam MCYCLE = 12'hb00;
localparam RST_VAL = 0;
reg [DATA_WIDTH-1:0] mhpm_counter_r;
reg [DATA_WIDTH-1:0] mhpm_event;//323
//reg [DATA_WIDTH-1:0] mhpm_counter_r1;
always@(posedge csr_clk or negedge csr_rst )
begin
	if(!csr_rst )
	begin
		mhpm_event <= RST_VAL;
	end
    else if(dbg_ndm_reset_i | dbg_hart_reset_i | wdt_reset_i)
    begin
        		mhpm_event <= RST_VAL;

    end
	else
	begin
        if(debug_mode_valid_i && dbg_csr_write_en_i && (dbg_csr_addr_i == MHPM_EVENT))
        begin
            mhpm_event <= dbg_csr_write_data_i ;
        end
		else if(csr_write_enable && (csr_write_addr == MHPM_EVENT))
		begin
			mhpm_event <= csr_write_data;
		end
	end
end



always@(posedge csr_clk or negedge csr_rst )
begin
	if(!csr_rst )
	begin
		mhpm_counter_r <= RST_VAL;
	end
    else if(dbg_ndm_reset_i | dbg_hart_reset_i | wdt_reset_i )
    begin
        		mhpm_counter_r <= RST_VAL;

    end
	else
	begin
        if(debug_mode_valid_i && dbg_csr_write_en_i && (dbg_csr_addr_i == MHPM_EVENT))
        begin
             mhpm_counter_r <= dbg_csr_write_data_i ;
        end

		else if(csr_write_enable && (csr_write_addr == MHPM_COUNTER))
			begin
				mhpm_counter_r <= csr_write_data;
			end
		else
			begin
				if(!mhpm_counter_csr_inhibit_bit && (mhpm_event != 0) && (!debug_mode_valid_i))
				begin
					mhpm_counter_r <= mhpm_counter_r + {{DATA_WIDTH-1{1'b0}},1'b1} ;
				end
				else
				begin
					mhpm_counter_r <= mhpm_counter_r ;
				end
			end
	end
end
	
/*always@(posedge csr_clk or negedge csr_rst)
begin
	if(!csr_rst)
	begin
		mhpm_counter_r1 <= RST_VAL;
	end
	else
	begin
		if(csr_write_enable && (csr_write_addr == MHPM_COUNTER))
			begin
				mhpm_counter_r1 <= csr_write_data;
			end
		else
			begin
				if(!mhpm_counter_csr_inhibit_bit && (mhpm_event != 0) )
				begin
					mhpm_counter_r1 <= mhpm_counter_r ;
				end
			end
	end
end*/
	
       //assign mhpm_counter_o = (!mhpm_counter_csr_inhibit_bit && (mhpm_event != 0)) ? mhpm_counter_r : mhpm_counter_r1 ;
	assign mhpm_counter_o = mhpm_counter_r;
    assign mhpm_event_o = mhpm_event;
endmodule

