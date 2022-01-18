set_property SRC_FILE_INFO {cfile:d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_dlmb_bram_if_cntlr_0/MicroBlaze_Uart_dlmb_bram_if_cntlr_0/MicroBlaze_Uart_dlmb_bram_if_cntlr_0_in_context.xdc rfile:../../../MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_dlmb_bram_if_cntlr_0/MicroBlaze_Uart_dlmb_bram_if_cntlr_0/MicroBlaze_Uart_dlmb_bram_if_cntlr_0_in_context.xdc id:1 order:EARLY scoped_inst:MicroBlaze_Uart_i/microblaze_0_local_memory/dlmb_bram_if_cntlr} [current_design]
set_property SRC_FILE_INFO {cfile:d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_ilmb_bram_if_cntlr_0/MicroBlaze_Uart_ilmb_bram_if_cntlr_0/MicroBlaze_Uart_ilmb_bram_if_cntlr_0_in_context.xdc rfile:../../../MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_ilmb_bram_if_cntlr_0/MicroBlaze_Uart_ilmb_bram_if_cntlr_0/MicroBlaze_Uart_ilmb_bram_if_cntlr_0_in_context.xdc id:2 order:EARLY scoped_inst:MicroBlaze_Uart_i/microblaze_0_local_memory/ilmb_bram_if_cntlr} [current_design]
set_property SRC_FILE_INFO {cfile:d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_mdm_1_0/MicroBlaze_Uart_mdm_1_0/MicroBlaze_Uart_mdm_1_0_in_context.xdc rfile:../../../MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_mdm_1_0/MicroBlaze_Uart_mdm_1_0/MicroBlaze_Uart_mdm_1_0_in_context.xdc id:3 order:EARLY scoped_inst:MicroBlaze_Uart_i/mdm_1} [current_design]
set_property SRC_FILE_INFO {cfile:d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_clk_wiz_1_0/MicroBlaze_Uart_clk_wiz_1_0/MicroBlaze_Uart_clk_wiz_1_0_in_context.xdc rfile:../../../MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_clk_wiz_1_0/MicroBlaze_Uart_clk_wiz_1_0/MicroBlaze_Uart_clk_wiz_1_0_in_context.xdc id:4 order:EARLY scoped_inst:MicroBlaze_Uart_i/clk_wiz_1} [current_design]
set_property SRC_FILE_INFO {cfile:D:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/constrs_2/new/constraint.xdc rfile:../../../MicroBlaze_Uart.srcs/constrs_2/new/constraint.xdc id:5} [current_design]
current_instance MicroBlaze_Uart_i/microblaze_0_local_memory/dlmb_bram_if_cntlr
set_property src_info {type:SCOPED_XDC file:1 line:2 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 10.000 [get_ports {}]
current_instance
current_instance MicroBlaze_Uart_i/microblaze_0_local_memory/ilmb_bram_if_cntlr
set_property src_info {type:SCOPED_XDC file:2 line:2 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 10.000 [get_ports {}]
current_instance
current_instance MicroBlaze_Uart_i/mdm_1
set_property src_info {type:SCOPED_XDC file:3 line:2 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 33.333 [get_ports {}]
set_property src_info {type:SCOPED_XDC file:3 line:4 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 33.333 [get_ports {}]
current_instance
current_instance MicroBlaze_Uart_i/clk_wiz_1
set_property src_info {type:SCOPED_XDC file:4 line:1 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 10.000 [get_ports -no_traverse {}]
set_property src_info {type:SCOPED_XDC file:4 line:4 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -source [get_ports clk_in1_p] -edges {1 2 3} -edge_shift {0.000 0.000 0.000} [get_ports {}]
current_instance
set_property src_info {type:XDC file:5 line:1 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN E3 [get_ports diff_clock_rtl_clk_p]
