set_property SRC_FILE_INFO {cfile:d:/FPGA_Projects/arty_uart_calculator/arty_uart_calculator.srcs/sources_1/bd/arty_uart_calculator/ip/arty_uart_calculator_dlmb_bram_if_cntlr_0/arty_uart_calculator_dlmb_bram_if_cntlr_0/arty_uart_calculator_dlmb_bram_if_cntlr_0_in_context.xdc rfile:../../../arty_uart_calculator.srcs/sources_1/bd/arty_uart_calculator/ip/arty_uart_calculator_dlmb_bram_if_cntlr_0/arty_uart_calculator_dlmb_bram_if_cntlr_0/arty_uart_calculator_dlmb_bram_if_cntlr_0_in_context.xdc id:1 order:EARLY scoped_inst:arty_uart_calculator_i/microblaze_0_local_memory/dlmb_bram_if_cntlr} [current_design]
set_property SRC_FILE_INFO {cfile:d:/FPGA_Projects/arty_uart_calculator/arty_uart_calculator.srcs/sources_1/bd/arty_uart_calculator/ip/arty_uart_calculator_ilmb_bram_if_cntlr_0/arty_uart_calculator_ilmb_bram_if_cntlr_0/arty_uart_calculator_ilmb_bram_if_cntlr_0_in_context.xdc rfile:../../../arty_uart_calculator.srcs/sources_1/bd/arty_uart_calculator/ip/arty_uart_calculator_ilmb_bram_if_cntlr_0/arty_uart_calculator_ilmb_bram_if_cntlr_0/arty_uart_calculator_ilmb_bram_if_cntlr_0_in_context.xdc id:2 order:EARLY scoped_inst:arty_uart_calculator_i/microblaze_0_local_memory/ilmb_bram_if_cntlr} [current_design]
set_property SRC_FILE_INFO {cfile:d:/FPGA_Projects/arty_uart_calculator/arty_uart_calculator.srcs/sources_1/bd/arty_uart_calculator/ip/arty_uart_calculator_mdm_1_0/arty_uart_calculator_mdm_1_0/arty_uart_calculator_mdm_1_0_in_context.xdc rfile:../../../arty_uart_calculator.srcs/sources_1/bd/arty_uart_calculator/ip/arty_uart_calculator_mdm_1_0/arty_uart_calculator_mdm_1_0/arty_uart_calculator_mdm_1_0_in_context.xdc id:3 order:EARLY scoped_inst:arty_uart_calculator_i/mdm_1} [current_design]
set_property SRC_FILE_INFO {cfile:d:/FPGA_Projects/arty_uart_calculator/arty_uart_calculator.srcs/sources_1/bd/arty_uart_calculator/ip/arty_uart_calculator_clk_wiz_1_0/arty_uart_calculator_clk_wiz_1_0/arty_uart_calculator_clk_wiz_1_0_in_context.xdc rfile:../../../arty_uart_calculator.srcs/sources_1/bd/arty_uart_calculator/ip/arty_uart_calculator_clk_wiz_1_0/arty_uart_calculator_clk_wiz_1_0/arty_uart_calculator_clk_wiz_1_0_in_context.xdc id:4 order:EARLY scoped_inst:arty_uart_calculator_i/clk_wiz_1} [current_design]
set_property SRC_FILE_INFO {cfile:D:/FPGA_Projects/arty_uart_calculator/arty_uart_calculator.srcs/constrs_3/new/constraint.xdc rfile:../../../arty_uart_calculator.srcs/constrs_3/new/constraint.xdc id:5} [current_design]
current_instance arty_uart_calculator_i/microblaze_0_local_memory/dlmb_bram_if_cntlr
set_property src_info {type:SCOPED_XDC file:1 line:2 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 10.000 [get_ports {}]
current_instance
current_instance arty_uart_calculator_i/microblaze_0_local_memory/ilmb_bram_if_cntlr
set_property src_info {type:SCOPED_XDC file:2 line:2 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 10.000 [get_ports {}]
current_instance
current_instance arty_uart_calculator_i/mdm_1
set_property src_info {type:SCOPED_XDC file:3 line:2 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 33.333 [get_ports {}]
set_property src_info {type:SCOPED_XDC file:3 line:4 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 33.333 [get_ports {}]
current_instance
current_instance arty_uart_calculator_i/clk_wiz_1
set_property src_info {type:SCOPED_XDC file:4 line:1 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 10.000 [get_ports -no_traverse {}]
set_property src_info {type:SCOPED_XDC file:4 line:4 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -source [get_ports clk_in1_p] -edges {1 2 3} -edge_shift {0.000 0.000 0.000} [get_ports {}]
current_instance
set_property src_info {type:XDC file:5 line:1 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN E3 [get_ports diff_clock_rtl_clk_p]
