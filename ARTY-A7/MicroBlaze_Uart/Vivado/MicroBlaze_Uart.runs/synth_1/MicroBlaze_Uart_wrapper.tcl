# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
namespace eval ::optrace {
  variable script "D:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.runs/synth_1/MicroBlaze_Uart_wrapper.tcl"
  variable category "vivado_synth"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
OPTRACE "synth_1" START { ROLLUP_AUTO }
set_param chipscope.maxJobs 4
OPTRACE "Creating in-memory project" START { }
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.cache/wt [current_project]
set_property parent.project_path D:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:arty-a7-100:part0:1.1 [current_project]
set_property ip_repo_paths c:/Users/vybha/Documents/AT472-BU-98000-r0p1-00rel0 [current_project]
update_ip_catalog
set_property ip_output_repo d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
OPTRACE "Creating in-memory project" END { }
OPTRACE "Adding files" START { }
read_verilog -library xil_defaultlib D:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/hdl/MicroBlaze_Uart_wrapper.v
add_files D:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/MicroBlaze_Uart.bd
set_property used_in_implementation false [get_files -all d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_microblaze_0_0/MicroBlaze_Uart_microblaze_0_0.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_microblaze_0_0/MicroBlaze_Uart_microblaze_0_0_ooc_debug.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_microblaze_0_0/MicroBlaze_Uart_microblaze_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_dlmb_v10_0/MicroBlaze_Uart_dlmb_v10_0_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_ilmb_v10_0/MicroBlaze_Uart_ilmb_v10_0_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_dlmb_bram_if_cntlr_0/MicroBlaze_Uart_dlmb_bram_if_cntlr_0_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_ilmb_bram_if_cntlr_0/MicroBlaze_Uart_ilmb_bram_if_cntlr_0_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_lmb_bram_0/MicroBlaze_Uart_lmb_bram_0_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_xbar_0/MicroBlaze_Uart_xbar_0_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_microblaze_0_axi_intc_0/MicroBlaze_Uart_microblaze_0_axi_intc_0.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_microblaze_0_axi_intc_0/MicroBlaze_Uart_microblaze_0_axi_intc_0_clocks.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_microblaze_0_axi_intc_0/MicroBlaze_Uart_microblaze_0_axi_intc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_mdm_1_0/MicroBlaze_Uart_mdm_1_0.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_mdm_1_0/MicroBlaze_Uart_mdm_1_0_ooc_trace.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_clk_wiz_1_0/MicroBlaze_Uart_clk_wiz_1_0_board.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_clk_wiz_1_0/MicroBlaze_Uart_clk_wiz_1_0.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_clk_wiz_1_0/MicroBlaze_Uart_clk_wiz_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_rst_clk_wiz_1_100M_0/MicroBlaze_Uart_rst_clk_wiz_1_100M_0_board.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_rst_clk_wiz_1_100M_0/MicroBlaze_Uart_rst_clk_wiz_1_100M_0.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_rst_clk_wiz_1_100M_0/MicroBlaze_Uart_rst_clk_wiz_1_100M_0_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_axi_uartlite_0_0/MicroBlaze_Uart_axi_uartlite_0_0_board.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_axi_uartlite_0_0/MicroBlaze_Uart_axi_uartlite_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_axi_uartlite_0_0/MicroBlaze_Uart_axi_uartlite_0_0.xdc]
set_property used_in_implementation false [get_files -all D:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/MicroBlaze_Uart_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/sources_1/bd/MicroBlaze_Uart/ip/MicroBlaze_Uart_microblaze_0_0/data/mb_bootloop_le.elf]

OPTRACE "Adding files" END { }
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/constrs_2/new/constraint.xdc
set_property used_in_implementation false [get_files D:/FPGA_Projects/MicroBlaze_Uart/MicroBlaze_Uart.srcs/constrs_2/new/constraint.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

OPTRACE "synth_design" START { }
synth_design -top MicroBlaze_Uart_wrapper -part xc7a100tcsg324-1
OPTRACE "synth_design" END { }


OPTRACE "write_checkpoint" START { CHECKPOINT }
# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef MicroBlaze_Uart_wrapper.dcp
OPTRACE "write_checkpoint" END { }
OPTRACE "synth reports" START { REPORT }
create_report "synth_1_synth_report_utilization_0" "report_utilization -file MicroBlaze_Uart_wrapper_utilization_synth.rpt -pb MicroBlaze_Uart_wrapper_utilization_synth.pb"
OPTRACE "synth reports" END { }
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
OPTRACE "synth_1" END { }