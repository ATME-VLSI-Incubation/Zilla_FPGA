
?
=Use of init.tcl in %s is deprecated. Please use %s_init.tcl 
656*common2;
'/home/sgeuser30/.Xilinx/Vivado/init.tcl2default:default2
Vivado2default:defaultZ17-1460h px? 
x
Sourcing tcl script '%s'
201*common2;
'/home/sgeuser30/.Xilinx/Vivado/init.tcl2default:defaultZ17-201h px? 
>
Refreshing IP repositories
234*coregenZ19-234h px? 
G
"No user IP repositories specified
1154*coregenZ19-1704h px? 
?
"Loaded Vivado IP repository '%s'.
1332*coregen2Q
=/srv3-vol03/tools01/Xilinx/install_main/Vivado/2020.1/data/ip2default:defaultZ19-2313h px? 
?
Command: %s
53*	vivadotcl2O
;synth_design -top shared_bram_wrapper -part xc7z020clg400-12default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7z0202default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7z0202default:defaultZ17-349h px? 
V
Loading part %s157*device2#
xc7z020clg400-12default:defaultZ21-403h px? 
?
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
42default:defaultZ8-7079h px? 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px? 
^
#Helper process launched with PID %s4824*oasys2
6472default:defaultZ8-7075h px? 
?
%s*synth2?
?Starting RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:08 . Memory (MB): peak = 2265.125 ; gain = 34.805 ; free physical = 63762 ; free virtual = 287162
2default:defaulth px? 
?
synthesizing module '%s'%s4497*oasys2'
shared_bram_wrapper2default:default2
 2default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/hdl/shared_bram_wrapper.v2default:default2
122default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2
IOBUF2default:default2
 2default:default2i
S/srv3-vol03/tools01/Xilinx/install_main/Vivado/2020.1/scripts/rt/data/unisim_comp.v2default:default2
362382default:default8@Z8-6157h px? 
[
%s
*synth2C
/	Parameter DRIVE bound to: 12 - type: integer 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter IBUF_LOW_PWR bound to: TRUE - type: string 
2default:defaulth p
x
? 
d
%s
*synth2L
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter SLEW bound to: SLOW - type: string 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
IOBUF2default:default2
 2default:default2
12default:default2
12default:default2i
S/srv3-vol03/tools01/Xilinx/install_main/Vivado/2020.1/scripts/rt/data/unisim_comp.v2default:default2
362382default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
shared_bram2default:default2
 2default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
18992default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2,
shared_bram_axi_gpio_0_32default:default2
 2default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_axi_gpio_0_3_stub.v2default:default2
62default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2,
shared_bram_axi_gpio_0_32default:default2
 2default:default2
22default:default2
12default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_axi_gpio_0_3_stub.v2default:default2
62default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys24
 shared_bram_axi_interconnect_0_12default:default2
 2default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
35332default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2,
m00_couplers_imp_12W1KYX2default:default2
 2default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
122default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2,
m00_couplers_imp_12W1KYX2default:default2
 2default:default2
32default:default2
12default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
122default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2+
m01_couplers_imp_5J9RSN2default:default2
 2default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
4022default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2+
m01_couplers_imp_5J9RSN2default:default2
 2default:default2
42default:default2
12default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
4022default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2+
s00_couplers_imp_QOHGU12default:default2
 2default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
13572default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2+
s00_couplers_imp_QOHGU12default:default2
 2default:default2
52default:default2
12default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
13572default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2&
shared_bram_xbar_12default:default2
 2default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_xbar_1_stub.v2default:default2
62default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2&
shared_bram_xbar_12default:default2
 2default:default2
62default:default2
12default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_xbar_1_stub.v2default:default2
62default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys24
 shared_bram_axi_interconnect_0_12default:default2
 2default:default2
72default:default2
12default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
35332default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2,
shared_bram_axi_gpio_0_22default:default2
 2default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_axi_gpio_0_2_stub.v2default:default2
62default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2,
shared_bram_axi_gpio_0_22default:default2
 2default:default2
82default:default2
12default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_axi_gpio_0_2_stub.v2default:default2
62default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys21
shared_bram_axi_bram_ctrl_0_02default:default2
 2default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_axi_bram_ctrl_0_0_stub.v2default:default2
62default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys21
shared_bram_axi_bram_ctrl_0_02default:default2
 2default:default2
92default:default2
12default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_axi_bram_ctrl_0_0_stub.v2default:default2
62default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2/
shared_bram_blk_mem_gen_0_02default:default2
 2default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_blk_mem_gen_0_0_stub.v2default:default2
62default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2/
shared_bram_blk_mem_gen_0_02default:default2
 2default:default2
102default:default2
12default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_blk_mem_gen_0_0_stub.v2default:default2
62default:default8@Z8-6155h px? 
?
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
	rsta_busy2default:default2/
shared_bram_blk_mem_gen_0_02default:default2%
SharedBlockMemory2default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
23612default:default8@Z8-7071h px? 
?
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2%
SharedBlockMemory2default:default2/
shared_bram_blk_mem_gen_0_02default:default2
82default:default2
72default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
23612default:default8@Z8-7023h px? 
?
synthesizing module '%s'%s4497*oasys24
 shared_bram_axi_interconnect_0_02default:default2
 2default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
27342default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2+
m00_couplers_imp_TRJDIH2default:default2
 2default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
1442default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2+
m00_couplers_imp_TRJDIH2default:default2
 2default:default2
112default:default2
12default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
1442default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2,
s00_couplers_imp_11JA7UH2default:default2
 2default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
7822default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2)
shared_bram_auto_pc_02default:default2
 2default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_auto_pc_0_stub.v2default:default2
62default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2)
shared_bram_auto_pc_02default:default2
 2default:default2
122default:default2
12default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_auto_pc_0_stub.v2default:default2
62default:default8@Z8-6155h px? 
?
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2"
m_axi_awregion2default:default2)
shared_bram_auto_pc_02default:default2
auto_pc2default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
10052default:default8@Z8-7071h px? 
?
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2"
m_axi_arregion2default:default2)
shared_bram_auto_pc_02default:default2
auto_pc2default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
10052default:default8@Z8-7071h px? 
?
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
auto_pc2default:default2)
shared_bram_auto_pc_02default:default2
562default:default2
542default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
10052default:default8@Z8-7023h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2,
s00_couplers_imp_11JA7UH2default:default2
 2default:default2
132default:default2
12default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
7822default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2+
s01_couplers_imp_6TVE7B2default:default2
 2default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
15032default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2)
shared_bram_auto_pc_12default:default2
 2default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_auto_pc_1_stub.v2default:default2
62default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2)
shared_bram_auto_pc_12default:default2
 2default:default2
142default:default2
12default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_auto_pc_1_stub.v2default:default2
62default:default8@Z8-6155h px? 
?
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2"
m_axi_awregion2default:default2)
shared_bram_auto_pc_12default:default2
auto_pc2default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
18182default:default8@Z8-7071h px? 
?
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2"
m_axi_arregion2default:default2)
shared_bram_auto_pc_12default:default2
auto_pc2default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
18182default:default8@Z8-7071h px? 
?
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
auto_pc2default:default2)
shared_bram_auto_pc_12default:default2
792default:default2
772default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
18182default:default8@Z8-7023h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2+
s01_couplers_imp_6TVE7B2default:default2
 2default:default2
152default:default2
12default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
15032default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2&
shared_bram_xbar_02default:default2
 2default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_xbar_0_stub.v2default:default2
62default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2&
shared_bram_xbar_02default:default2
 2default:default2
162default:default2
12default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_xbar_0_stub.v2default:default2
62default:default8@Z8-6155h px? 
?
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2"
m_axi_awregion2default:default2&
shared_bram_xbar_02default:default2
xbar2default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
34562default:default8@Z8-7071h px? 
?
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
m_axi_awqos2default:default2&
shared_bram_xbar_02default:default2
xbar2default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
34562default:default8@Z8-7071h px? 
?
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2"
m_axi_arregion2default:default2&
shared_bram_xbar_02default:default2
xbar2default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
34562default:default8@Z8-7071h px? 
?
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
m_axi_arqos2default:default2&
shared_bram_xbar_02default:default2
xbar2default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
34562default:default8@Z8-7071h px? 
?
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
xbar2default:default2&
shared_bram_xbar_02default:default2
782default:default2
742default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
34562default:default8@Z8-7023h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys24
 shared_bram_axi_interconnect_0_02default:default2
 2default:default2
172default:default2
12default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
27342default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys24
 shared_bram_axi_interconnect_0_22default:default2
 2default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
40132default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2,
s00_couplers_imp_1OE3URC2default:default2
 2default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
10622default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2)
shared_bram_auto_pc_22default:default2
 2default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_auto_pc_2_stub.v2default:default2
62default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2)
shared_bram_auto_pc_22default:default2
 2default:default2
182default:default2
12default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_auto_pc_2_stub.v2default:default2
62default:default8@Z8-6155h px? 
?
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2 
m_axi_awprot2default:default2)
shared_bram_auto_pc_22default:default2
auto_pc2default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
12972default:default8@Z8-7071h px? 
?
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2 
m_axi_arprot2default:default2)
shared_bram_auto_pc_22default:default2
auto_pc2default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
12972default:default8@Z8-7071h px? 
?
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
auto_pc2default:default2)
shared_bram_auto_pc_22default:default2
592default:default2
572default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
12972default:default8@Z8-7023h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2,
s00_couplers_imp_1OE3URC2default:default2
 2default:default2
192default:default2
12default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
10622default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys24
 shared_bram_axi_interconnect_0_22default:default2
 2default:default2
202default:default2
12default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
40132default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2'
shared_bram_mdm_1_02default:default2
 2default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_mdm_1_0_stub.v2default:default2
62default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2'
shared_bram_mdm_1_02default:default2
 2default:default2
212default:default2
12default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_mdm_1_0_stub.v2default:default2
62default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2.
shared_bram_microblaze_0_02default:default2
 2default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_microblaze_0_0_stub.v2default:default2
62default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2.
shared_bram_microblaze_0_02default:default2
 2default:default2
222default:default2
12default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_microblaze_0_0_stub.v2default:default2
62default:default8@Z8-6155h px? 
?
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2!
Interrupt_Ack2default:default2.
shared_bram_microblaze_0_02default:default2 
microblaze_02default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
25452default:default8@Z8-7071h px? 
?
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2 
microblaze_02default:default2.
shared_bram_microblaze_0_02default:default2
522default:default2
512default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
25452default:default8@Z8-7023h px? 
?
synthesizing module '%s'%s4497*oasys28
$microblaze_0_local_memory_imp_Q82XC52default:default2
 2default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
5482default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys24
 shared_bram_dlmb_bram_if_cntlr_02default:default2
 2default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_dlmb_bram_if_cntlr_0_stub.v2default:default2
62default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys24
 shared_bram_dlmb_bram_if_cntlr_02default:default2
 2default:default2
232default:default2
12default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_dlmb_bram_if_cntlr_0_stub.v2default:default2
62default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2*
shared_bram_dlmb_v10_02default:default2
 2default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_dlmb_v10_0_stub.v2default:default2
62default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2*
shared_bram_dlmb_v10_02default:default2
 2default:default2
242default:default2
12default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_dlmb_v10_0_stub.v2default:default2
62default:default8@Z8-6155h px? 
?
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
LMB_Rst2default:default2*
shared_bram_dlmb_v10_02default:default2
dlmb_v102default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
6942default:default8@Z8-7071h px? 
?
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
dlmb_v102default:default2*
shared_bram_dlmb_v10_02default:default2
252default:default2
242default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
6942default:default8@Z8-7023h px? 
?
synthesizing module '%s'%s4497*oasys24
 shared_bram_ilmb_bram_if_cntlr_02default:default2
 2default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_ilmb_bram_if_cntlr_0_stub.v2default:default2
62default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys24
 shared_bram_ilmb_bram_if_cntlr_02default:default2
 2default:default2
252default:default2
12default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_ilmb_bram_if_cntlr_0_stub.v2default:default2
62default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2*
shared_bram_ilmb_v10_02default:default2
 2default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_ilmb_v10_0_stub.v2default:default2
62default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2*
shared_bram_ilmb_v10_02default:default2
 2default:default2
262default:default2
12default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_ilmb_v10_0_stub.v2default:default2
62default:default8@Z8-6155h px? 
?
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
LMB_Rst2default:default2*
shared_bram_ilmb_v10_02default:default2
ilmb_v102default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
7402default:default8@Z8-7071h px? 
?
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
ilmb_v102default:default2*
shared_bram_ilmb_v10_02default:default2
252default:default2
242default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
7402default:default8@Z8-7023h px? 
?
synthesizing module '%s'%s4497*oasys2*
shared_bram_lmb_bram_02default:default2
 2default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_lmb_bram_0_stub.v2default:default2
62default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2*
shared_bram_lmb_bram_02default:default2
 2default:default2
272default:default2
12default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_lmb_bram_0_stub.v2default:default2
62default:default8@Z8-6155h px? 
?
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
	rsta_busy2default:default2*
shared_bram_lmb_bram_02default:default2
lmb_bram2default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
7652default:default8@Z8-7071h px? 
?
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
	rstb_busy2default:default2*
shared_bram_lmb_bram_02default:default2
lmb_bram2default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
7652default:default8@Z8-7071h px? 
?
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
lmb_bram2default:default2*
shared_bram_lmb_bram_02default:default2
162default:default2
142default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
7652default:default8@Z8-7023h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys28
$microblaze_0_local_memory_imp_Q82XC52default:default2
 2default:default2
282default:default2
12default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
5482default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys26
"shared_bram_processing_system7_0_02default:default2
 2default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_processing_system7_0_0_stub.v2default:default2
62default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys26
"shared_bram_processing_system7_0_02default:default2
 2default:default2
292default:default2
12default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_processing_system7_0_0_stub.v2default:default2
62default:default8@Z8-6155h px? 
?
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2$
USB0_PORT_INDCTL2default:default26
"shared_bram_processing_system7_0_02default:default2(
processing_system7_02default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
26192default:default8@Z8-7071h px? 
?
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2'
USB0_VBUS_PWRSELECT2default:default26
"shared_bram_processing_system7_0_02default:default2(
processing_system7_02default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
26192default:default8@Z8-7071h px? 
?
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2(
processing_system7_02default:default26
"shared_bram_processing_system7_0_02default:default2
1042default:default2
1022default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
26192default:default8@Z8-7023h px? 
?
synthesizing module '%s'%s4497*oasys20
shared_bram_rst_ps7_0_100M_02default:default2
 2default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_rst_ps7_0_100M_0_stub.v2default:default2
62default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys20
shared_bram_rst_ps7_0_100M_02default:default2
 2default:default2
302default:default2
12default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/.Xil/Vivado-38963-compute-srv3.eda.atme.in/realtime/shared_bram_rst_ps7_0_100M_0_stub.v2default:default2
62default:default8@Z8-6155h px? 
?
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2$
peripheral_reset2default:default20
shared_bram_rst_ps7_0_100M_02default:default2"
rst_ps7_0_100M2default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
27222default:default8@Z8-7071h px? 
?
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2"
rst_ps7_0_100M2default:default20
shared_bram_rst_ps7_0_100M_02default:default2
102default:default2
92default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
27222default:default8@Z8-7023h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
shared_bram2default:default2
 2default:default2
312default:default2
12default:default2?
{/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/synth/shared_bram.v2default:default2
18992default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2'
shared_bram_wrapper2default:default2
 2default:default2
322default:default2
12default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/hdl/shared_bram_wrapper.v2default:default2
122default:default8@Z8-6155h px? 
?
%s*synth2?
?Finished RTL Elaboration : Time (s): cpu = 00:00:06 ; elapsed = 00:00:11 . Memory (MB): peak = 2313.035 ; gain = 82.715 ; free physical = 63726 ; free virtual = 287130
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:06 ; elapsed = 00:00:12 . Memory (MB): peak = 2327.875 ; gain = 97.555 ; free physical = 63697 ; free virtual = 287101
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:06 ; elapsed = 00:00:12 . Memory (MB): peak = 2327.875 ; gain = 97.555 ; free physical = 63697 ; free virtual = 287101
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.032default:default2
00:00:00.032default:default2
2335.8122default:default2
0.0002default:default2
636672default:default2
2870732default:defaultZ17-722h px? 
e
-Analyzing %s Unisim elements for replacement
17*netlist2
42default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
>

Processing XDC Constraints
244*projectZ1-262h px? 
=
Initializing timing engine
348*projectZ1-569h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_processing_system7_0_0/shared_bram_processing_system7_0_0/shared_bram_processing_system7_0_0_in_context.xdc2default:default28
"shared_bram_i/processing_system7_0	2default:default8Z20-848h px? 
?
No ports matched '%s'.
584*	planAhead2
 2default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_processing_system7_0_0/shared_bram_processing_system7_0_0/shared_bram_processing_system7_0_0_in_context.xdc2default:default2
22default:default8@Z12-584h px?
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_processing_system7_0_0/shared_bram_processing_system7_0_0/shared_bram_processing_system7_0_0_in_context.xdc2default:default28
"shared_bram_i/processing_system7_0	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_microblaze_0_0/shared_bram_microblaze_0_0/shared_bram_microblaze_0_0_in_context.xdc2default:default20
shared_bram_i/microblaze_0	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_microblaze_0_0/shared_bram_microblaze_0_0/shared_bram_microblaze_0_0_in_context.xdc2default:default20
shared_bram_i/microblaze_0	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_dlmb_v10_0/shared_bram_dlmb_v10_0/shared_bram_ilmb_v10_0_in_context.xdc2default:default2F
0shared_bram_i/microblaze_0_local_memory/dlmb_v10	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_dlmb_v10_0/shared_bram_dlmb_v10_0/shared_bram_ilmb_v10_0_in_context.xdc2default:default2F
0shared_bram_i/microblaze_0_local_memory/dlmb_v10	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_ilmb_v10_0/shared_bram_ilmb_v10_0/shared_bram_ilmb_v10_0_in_context.xdc2default:default2F
0shared_bram_i/microblaze_0_local_memory/ilmb_v10	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_ilmb_v10_0/shared_bram_ilmb_v10_0/shared_bram_ilmb_v10_0_in_context.xdc2default:default2F
0shared_bram_i/microblaze_0_local_memory/ilmb_v10	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_dlmb_bram_if_cntlr_0/shared_bram_dlmb_bram_if_cntlr_0/shared_bram_dlmb_bram_if_cntlr_0_in_context.xdc2default:default2P
:shared_bram_i/microblaze_0_local_memory/dlmb_bram_if_cntlr	2default:default8Z20-848h px? 
?
No ports matched '%s'.
584*	planAhead2
 2default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_dlmb_bram_if_cntlr_0/shared_bram_dlmb_bram_if_cntlr_0/shared_bram_dlmb_bram_if_cntlr_0_in_context.xdc2default:default2
22default:default8@Z12-584h px?
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_dlmb_bram_if_cntlr_0/shared_bram_dlmb_bram_if_cntlr_0/shared_bram_dlmb_bram_if_cntlr_0_in_context.xdc2default:default2P
:shared_bram_i/microblaze_0_local_memory/dlmb_bram_if_cntlr	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_ilmb_bram_if_cntlr_0/shared_bram_ilmb_bram_if_cntlr_0/shared_bram_ilmb_bram_if_cntlr_0_in_context.xdc2default:default2P
:shared_bram_i/microblaze_0_local_memory/ilmb_bram_if_cntlr	2default:default8Z20-848h px? 
?
No ports matched '%s'.
584*	planAhead2
 2default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_ilmb_bram_if_cntlr_0/shared_bram_ilmb_bram_if_cntlr_0/shared_bram_ilmb_bram_if_cntlr_0_in_context.xdc2default:default2
22default:default8@Z12-584h px?
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_ilmb_bram_if_cntlr_0/shared_bram_ilmb_bram_if_cntlr_0/shared_bram_ilmb_bram_if_cntlr_0_in_context.xdc2default:default2P
:shared_bram_i/microblaze_0_local_memory/ilmb_bram_if_cntlr	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_lmb_bram_0/shared_bram_lmb_bram_0/shared_bram_lmb_bram_0_in_context.xdc2default:default2F
0shared_bram_i/microblaze_0_local_memory/lmb_bram	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_lmb_bram_0/shared_bram_lmb_bram_0/shared_bram_lmb_bram_0_in_context.xdc2default:default2F
0shared_bram_i/microblaze_0_local_memory/lmb_bram	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_mdm_1_0/shared_bram_mdm_1_0/shared_bram_mdm_1_0_in_context.xdc2default:default2)
shared_bram_i/mdm_1	2default:default8Z20-848h px? 
?
No ports matched '%s'.
584*	planAhead2
 2default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_mdm_1_0/shared_bram_mdm_1_0/shared_bram_mdm_1_0_in_context.xdc2default:default2
22default:default8@Z12-584h px?
?
No ports matched '%s'.
584*	planAhead2
 2default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_mdm_1_0/shared_bram_mdm_1_0/shared_bram_mdm_1_0_in_context.xdc2default:default2
42default:default8@Z12-584h px?
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_mdm_1_0/shared_bram_mdm_1_0/shared_bram_mdm_1_0_in_context.xdc2default:default2)
shared_bram_i/mdm_1	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_rst_ps7_0_100M_0/shared_bram_rst_ps7_0_100M_0/shared_bram_rst_ps7_0_100M_0_in_context.xdc2default:default22
shared_bram_i/rst_ps7_0_100M	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_rst_ps7_0_100M_0/shared_bram_rst_ps7_0_100M_0/shared_bram_rst_ps7_0_100M_0_in_context.xdc2default:default22
shared_bram_i/rst_ps7_0_100M	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_axi_bram_ctrl_0_0/shared_bram_axi_bram_ctrl_0_0/shared_bram_axi_bram_ctrl_0_0_in_context.xdc2default:default29
#shared_bram_i/SharedBRAM_Controller	2default:default8Z20-848h px? 
?
No ports matched '%s'.
584*	planAhead2
 2default:default2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_axi_bram_ctrl_0_0/shared_bram_axi_bram_ctrl_0_0/shared_bram_axi_bram_ctrl_0_0_in_context.xdc2default:default2
22default:default8@Z12-584h px?
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_axi_bram_ctrl_0_0/shared_bram_axi_bram_ctrl_0_0/shared_bram_axi_bram_ctrl_0_0_in_context.xdc2default:default29
#shared_bram_i/SharedBRAM_Controller	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_blk_mem_gen_0_0/shared_bram_blk_mem_gen_0_0/shared_bram_blk_mem_gen_0_0_in_context.xdc2default:default25
shared_bram_i/SharedBlockMemory	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_blk_mem_gen_0_0/shared_bram_blk_mem_gen_0_0/shared_bram_blk_mem_gen_0_0_in_context.xdc2default:default25
shared_bram_i/SharedBlockMemory	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_xbar_0/shared_bram_xbar_0/shared_bram_xbar_0_in_context.xdc2default:default2A
+shared_bram_i/Shared_BRAM_Interconnect/xbar	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_xbar_0/shared_bram_xbar_0/shared_bram_xbar_0_in_context.xdc2default:default2A
+shared_bram_i/Shared_BRAM_Interconnect/xbar	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_xbar_1/shared_bram_xbar_1/shared_bram_xbar_1_in_context.xdc2default:default2D
.shared_bram_i/MB_Pheripheral_Interconnect/xbar	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_xbar_1/shared_bram_xbar_1/shared_bram_xbar_1_in_context.xdc2default:default2D
.shared_bram_i/MB_Pheripheral_Interconnect/xbar	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_axi_gpio_0_2/shared_bram_axi_gpio_0_2/shared_bram_axi_gpio_0_0_in_context.xdc2default:default2,
shared_bram_i/SWITCHES	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_axi_gpio_0_2/shared_bram_axi_gpio_0_2/shared_bram_axi_gpio_0_0_in_context.xdc2default:default2,
shared_bram_i/SWITCHES	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_axi_gpio_0_3/shared_bram_axi_gpio_0_3/shared_bram_axi_gpio_0_1_in_context.xdc2default:default2(
shared_bram_i/LEDs	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_axi_gpio_0_3/shared_bram_axi_gpio_0_3/shared_bram_axi_gpio_0_1_in_context.xdc2default:default2(
shared_bram_i/LEDs	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_auto_pc_0/shared_bram_auto_pc_0/shared_bram_auto_pc_0_in_context.xdc2default:default2Q
;shared_bram_i/Shared_BRAM_Interconnect/s00_couplers/auto_pc	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_auto_pc_0/shared_bram_auto_pc_0/shared_bram_auto_pc_0_in_context.xdc2default:default2Q
;shared_bram_i/Shared_BRAM_Interconnect/s00_couplers/auto_pc	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_auto_pc_1/shared_bram_auto_pc_1/shared_bram_auto_pc_1_in_context.xdc2default:default2Q
;shared_bram_i/Shared_BRAM_Interconnect/s01_couplers/auto_pc	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_auto_pc_1/shared_bram_auto_pc_1/shared_bram_auto_pc_1_in_context.xdc2default:default2Q
;shared_bram_i/Shared_BRAM_Interconnect/s01_couplers/auto_pc	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_auto_pc_2/shared_bram_auto_pc_2/shared_bram_auto_pc_2_in_context.xdc2default:default2U
?shared_bram_i/Zync_Pheriperal_interconnect/s00_couplers/auto_pc	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.srcs/sources_1/bd/shared_bram/ip/shared_bram_auto_pc_2/shared_bram_auto_pc_2/shared_bram_auto_pc_2_in_context.xdc2default:default2U
?shared_bram_i/Zync_Pheriperal_interconnect/s00_couplers/auto_pc	2default:default8Z20-847h px? 
?
Parsing XDC File [%s]
179*designutils2{
e/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/dont_touch.xdc2default:default8Z20-179h px? 
?
Finished Parsing XDC File [%s]
178*designutils2{
e/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/dont_touch.xdc2default:default8Z20-178h px? 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
2467.6292default:default2
0.0002default:default2
634662default:default2
2868782default:defaultZ17-722h px? 
?
!Unisim Transformation Summary:
%s111*project2k
W  A total of 4 instances were transformed.
  IOBUF => IOBUF (IBUF, OBUFT): 4 instances
2default:defaultZ1-111h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common24
 Constraint Validation Runtime : 2default:default2
00:00:00.172default:default2
00:00:00.032default:default2
2467.6292default:default2
0.0002default:default2
634642default:default2
2868762default:defaultZ17-722h px? 
?
?Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
20.0002default:default23
shared_bram_i/SharedBlockMemory2default:default2
clka2default:default2
10.0002default:defaultZ38-316h px? 
?
?Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
20.0002default:default2D
0shared_bram_i/microblaze_0_local_memory/lmb_bram2default:default2
clka2default:default2
10.0002default:defaultZ38-316h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Constraint Validation : Time (s): cpu = 00:00:14 ; elapsed = 00:00:24 . Memory (MB): peak = 2470.594 ; gain = 240.273 ; free physical = 63283 ; free virtual = 286709
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Loading part: xc7z020clg400-1
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:14 ; elapsed = 00:00:24 . Memory (MB): peak = 2470.594 ; gain = 240.273 ; free physical = 63283 ; free virtual = 286709
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:15 ; elapsed = 00:00:24 . Memory (MB): peak = 2470.594 ; gain = 240.273 ; free physical = 63264 ; free virtual = 286691
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:15 ; elapsed = 00:00:25 . Memory (MB): peak = 2470.594 ; gain = 240.273 ; free physical = 63251 ; free virtual = 286678
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2k
WPart Resources:
DSPs: 220 (col length:60)
BRAMs: 280 (col length: RAMB18 60 RAMB36 30)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:16 ; elapsed = 00:00:26 . Memory (MB): peak = 2470.594 ; gain = 240.273 ; free physical = 63210 ; free virtual = 286643
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:23 ; elapsed = 00:00:36 . Memory (MB): peak = 2470.594 ; gain = 240.273 ; free physical = 62725 ; free virtual = 286176
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Timing Optimization : Time (s): cpu = 00:00:23 ; elapsed = 00:00:36 . Memory (MB): peak = 2470.594 ; gain = 240.273 ; free physical = 62723 ; free virtual = 286175
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Technology Mapping : Time (s): cpu = 00:00:23 ; elapsed = 00:00:36 . Memory (MB): peak = 2470.594 ; gain = 240.273 ; free physical = 62714 ; free virtual = 286166
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished IO Insertion : Time (s): cpu = 00:00:26 ; elapsed = 00:00:39 . Memory (MB): peak = 2470.594 ; gain = 240.273 ; free physical = 62844 ; free virtual = 286301
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:00:26 ; elapsed = 00:00:39 . Memory (MB): peak = 2470.594 ; gain = 240.273 ; free physical = 62844 ; free virtual = 286301
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:26 ; elapsed = 00:00:39 . Memory (MB): peak = 2470.594 ; gain = 240.273 ; free physical = 62843 ; free virtual = 286300
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:00:26 ; elapsed = 00:00:39 . Memory (MB): peak = 2470.594 ; gain = 240.273 ; free physical = 62843 ; free virtual = 286300
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:26 ; elapsed = 00:00:39 . Memory (MB): peak = 2470.594 ; gain = 240.273 ; free physical = 62842 ; free virtual = 286299
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Nets : Time (s): cpu = 00:00:26 ; elapsed = 00:00:39 . Memory (MB): peak = 2470.594 ; gain = 240.273 ; free physical = 62842 ; free virtual = 286299
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
d
%s
*synth2L
8+------+-----------------------------------+----------+
2default:defaulth p
x
? 
d
%s
*synth2L
8|      |BlackBox name                      |Instances |
2default:defaulth p
x
? 
d
%s
*synth2L
8+------+-----------------------------------+----------+
2default:defaulth p
x
? 
d
%s
*synth2L
8|1     |shared_bram_xbar_1                 |         1|
2default:defaulth p
x
? 
d
%s
*synth2L
8|2     |shared_bram_xbar_0                 |         1|
2default:defaulth p
x
? 
d
%s
*synth2L
8|3     |shared_bram_auto_pc_0              |         1|
2default:defaulth p
x
? 
d
%s
*synth2L
8|4     |shared_bram_auto_pc_1              |         1|
2default:defaulth p
x
? 
d
%s
*synth2L
8|5     |shared_bram_auto_pc_2              |         1|
2default:defaulth p
x
? 
d
%s
*synth2L
8|6     |shared_bram_axi_gpio_0_3           |         1|
2default:defaulth p
x
? 
d
%s
*synth2L
8|7     |shared_bram_axi_gpio_0_2           |         1|
2default:defaulth p
x
? 
d
%s
*synth2L
8|8     |shared_bram_axi_bram_ctrl_0_0      |         1|
2default:defaulth p
x
? 
d
%s
*synth2L
8|9     |shared_bram_blk_mem_gen_0_0        |         1|
2default:defaulth p
x
? 
d
%s
*synth2L
8|10    |shared_bram_mdm_1_0                |         1|
2default:defaulth p
x
? 
d
%s
*synth2L
8|11    |shared_bram_microblaze_0_0         |         1|
2default:defaulth p
x
? 
d
%s
*synth2L
8|12    |shared_bram_processing_system7_0_0 |         1|
2default:defaulth p
x
? 
d
%s
*synth2L
8|13    |shared_bram_rst_ps7_0_100M_0       |         1|
2default:defaulth p
x
? 
d
%s
*synth2L
8|14    |shared_bram_dlmb_bram_if_cntlr_0   |         1|
2default:defaulth p
x
? 
d
%s
*synth2L
8|15    |shared_bram_dlmb_v10_0             |         1|
2default:defaulth p
x
? 
d
%s
*synth2L
8|16    |shared_bram_ilmb_bram_if_cntlr_0   |         1|
2default:defaulth p
x
? 
d
%s
*synth2L
8|17    |shared_bram_ilmb_v10_0             |         1|
2default:defaulth p
x
? 
d
%s
*synth2L
8|18    |shared_bram_lmb_bram_0             |         1|
2default:defaulth p
x
? 
d
%s
*synth2L
8+------+-----------------------------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
^
%s*synth2F
2+------+---------------------------------+------+
2default:defaulth px? 
^
%s*synth2F
2|      |Cell                             |Count |
2default:defaulth px? 
^
%s*synth2F
2+------+---------------------------------+------+
2default:defaulth px? 
^
%s*synth2F
2|1     |shared_bram_auto_pc              |     3|
2default:defaulth px? 
^
%s*synth2F
2|4     |shared_bram_axi_bram_ctrl_0      |     1|
2default:defaulth px? 
^
%s*synth2F
2|5     |shared_bram_axi_gpio_0           |     2|
2default:defaulth px? 
^
%s*synth2F
2|7     |shared_bram_blk_mem_gen_0        |     1|
2default:defaulth px? 
^
%s*synth2F
2|8     |shared_bram_dlmb_bram_if_cntlr   |     1|
2default:defaulth px? 
^
%s*synth2F
2|9     |shared_bram_dlmb_v10             |     1|
2default:defaulth px? 
^
%s*synth2F
2|10    |shared_bram_ilmb_bram_if_cntlr   |     1|
2default:defaulth px? 
^
%s*synth2F
2|11    |shared_bram_ilmb_v10             |     1|
2default:defaulth px? 
^
%s*synth2F
2|12    |shared_bram_lmb_bram             |     1|
2default:defaulth px? 
^
%s*synth2F
2|13    |shared_bram_mdm_1                |     1|
2default:defaulth px? 
^
%s*synth2F
2|14    |shared_bram_microblaze_0         |     1|
2default:defaulth px? 
^
%s*synth2F
2|15    |shared_bram_processing_system7_0 |     1|
2default:defaulth px? 
^
%s*synth2F
2|16    |shared_bram_rst_ps7_0_100M       |     1|
2default:defaulth px? 
^
%s*synth2F
2|17    |shared_bram_xbar                 |     2|
2default:defaulth px? 
^
%s*synth2F
2|19    |IBUF                             |     2|
2default:defaulth px? 
^
%s*synth2F
2|20    |IOBUF                            |     4|
2default:defaulth px? 
^
%s*synth2F
2+------+---------------------------------+------+
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:00:26 ; elapsed = 00:00:39 . Memory (MB): peak = 2470.594 ; gain = 240.273 ; free physical = 62842 ; free virtual = 286299
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 0 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
?Synthesis Optimization Runtime : Time (s): cpu = 00:00:23 ; elapsed = 00:00:34 . Memory (MB): peak = 2470.594 ; gain = 97.555 ; free physical = 62894 ; free virtual = 286351
2default:defaulth p
x
? 
?
%s
*synth2?
?Synthesis Optimization Complete : Time (s): cpu = 00:00:26 ; elapsed = 00:00:39 . Memory (MB): peak = 2470.594 ; gain = 240.273 ; free physical = 62894 ; free virtual = 286351
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.022default:default2
00:00:00.022default:default2
2470.5942default:default2
0.0002default:default2
629632default:default2
2864202default:defaultZ17-722h px? 
e
-Analyzing %s Unisim elements for replacement
17*netlist2
42default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:00.012default:default2
2470.5942default:default2
0.0002default:default2
628772default:default2
2863352default:defaultZ17-722h px? 
?
!Unisim Transformation Summary:
%s111*project2k
W  A total of 4 instances were transformed.
  IOBUF => IOBUF (IBUF, OBUFT): 4 instances
2default:defaultZ1-111h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
832default:default2
382default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
synth_design: 2default:default2
00:00:392default:default2
00:00:532default:default2
2470.5942default:default2
242.4182default:default2
630032default:default2
2864612default:defaultZ17-722h px? 
K
"No constraints selected for write.1103*constraintsZ18-5210h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2?
n/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/synth_1/shared_bram_wrapper.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2?
|Executing : report_utilization -file shared_bram_wrapper_utilization_synth.rpt -pb shared_bram_wrapper_utilization_synth.pb
2default:defaulth px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Mon Oct 25 20:09:27 20212default:defaultZ17-206h px? 


End Record