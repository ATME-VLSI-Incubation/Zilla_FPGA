
Q
Command: %s
53*	vivadotcl2 
place_design2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7z0202default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7z0202default:defaultZ17-349h px? 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
place_design2default:defaultZ4-22h px? 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
U

Starting %s Task
103*constraints2
Placer2default:defaultZ18-103h px? 
}
BMultithreading enabled for place_design using a maximum of %s CPUs12*	placeflow2
82default:defaultZ30-611h px? 
v

Phase %s%s
101*constraints2
1 2default:default2)
Placer Initialization2default:defaultZ18-101h px? 
?

Phase %s%s
101*constraints2
1.1 2default:default29
%Placer Initialization Netlist Sorting2default:defaultZ18-101h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
3328.4572default:default2
0.0002default:default2
593482default:default2
2829722default:defaultZ17-722h px? 
[
FPhase 1.1 Placer Initialization Netlist Sorting | Checksum: 136fbc5dc
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.03 ; elapsed = 00:00:00.05 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 59348 ; free virtual = 2829722default:defaulth px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
3328.4572default:default2
0.0002default:default2
593482default:default2
2829722default:defaultZ17-722h px? 
?

Phase %s%s
101*constraints2
1.2 2default:default2F
2IO Placement/ Clock Placement/ Build Placer Device2default:defaultZ18-101h px? 
h
SPhase 1.2 IO Placement/ Clock Placement/ Build Placer Device | Checksum: 1032b4474
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:02 ; elapsed = 00:00:01 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 59286 ; free virtual = 2829142default:defaulth px? 
}

Phase %s%s
101*constraints2
1.3 2default:default2.
Build Placer Netlist Model2default:defaultZ18-101h px? 
P
;Phase 1.3 Build Placer Netlist Model | Checksum: 11822813b
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:05 ; elapsed = 00:00:03 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 59255 ; free virtual = 2828842default:defaulth px? 
z

Phase %s%s
101*constraints2
1.4 2default:default2+
Constrain Clocks/Macros2default:defaultZ18-101h px? 
M
8Phase 1.4 Constrain Clocks/Macros | Checksum: 11822813b
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:05 ; elapsed = 00:00:03 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 59254 ; free virtual = 2828842default:defaulth px? 
I
4Phase 1 Placer Initialization | Checksum: 11822813b
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:05 ; elapsed = 00:00:03 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 59253 ; free virtual = 2828832default:defaulth px? 
q

Phase %s%s
101*constraints2
2 2default:default2$
Global Placement2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
2.1 2default:default2!
Floorplanning2default:defaultZ18-101h px? 
C
.Phase 2.1 Floorplanning | Checksum: 1936d8fc7
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:07 ; elapsed = 00:00:03 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 59225 ; free virtual = 2828552default:defaulth px? 
x

Phase %s%s
101*constraints2
2.2 2default:default2)
Global Placement Core2default:defaultZ18-101h px? 
?

Phase %s%s
101*constraints2
2.2.1 2default:default20
Physical Synthesis In Placer2default:defaultZ18-101h px? 
?
FFound %s LUTNM shape to break, %s LUT instances to create LUTNM shape
553*physynth2
02default:default2
1632default:defaultZ32-1035h px? 
?
YBreak lutnm for timing: one critical %s, two critical %s, total %s, new lutff created %s
561*physynth2
02default:default2
02default:default2
02default:default2
02default:defaultZ32-1044h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
762default:default2!
nets or cells2default:default2
02default:default2
cell2default:default2
762default:default2
cells2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
K
)No high fanout nets found in the design.
65*physynthZ32-65h px? 
?
$Optimized %s %s. Created %s new %s.
216*physynth2
02default:default2
net2default:default2
02default:default2
instance2default:defaultZ32-232h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
?
0No setup violation found.  %s was not performed.344*physynth2-
DSP Register Optimization2default:defaultZ32-670h px? 
?
0No setup violation found.  %s was not performed.344*physynth2;
'Shift Register to Pipeline Optimization2default:defaultZ32-670h px? 
?
0No setup violation found.  %s was not performed.344*physynth2/
Shift Register Optimization2default:defaultZ32-670h px? 
?
0No setup violation found.  %s was not performed.344*physynth2.
BRAM Register Optimization2default:defaultZ32-670h px? 
?
0No setup violation found.  %s was not performed.344*physynth2.
URAM Register Optimization2default:defaultZ32-670h px? 
R
.No candidate nets found for HD net replication521*physynthZ32-949h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
3328.4572default:default2
0.0002default:default2
590542default:default2
2826932default:defaultZ17-722h px? 
B
-
Summary of Physical Synthesis Optimizations
*commonh px? 
B
-============================================
*commonh px? 


*commonh px? 


*commonh px? 
?
?-----------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px? 
?
?|  Optimization                                     |  Added Cells  |  Removed Cells  |  Optimized Cells/Nets  |  Dont Touch  |  Iterations  |  Elapsed   |
-----------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px? 
?
?|  LUT Combining                                    |            0  |             76  |                    76  |           0  |           1  |  00:00:00  |
|  Very High Fanout                                 |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  DSP Register                                     |            0  |              0  |                     0  |           0  |           0  |  00:00:00  |
|  Shift Register to Pipeline                       |            0  |              0  |                     0  |           0  |           0  |  00:00:00  |
|  Shift Register                                   |            0  |              0  |                     0  |           0  |           0  |  00:00:00  |
|  BRAM Register                                    |            0  |              0  |                     0  |           0  |           0  |  00:00:00  |
|  URAM Register                                    |            0  |              0  |                     0  |           0  |           0  |  00:00:00  |
|  Dynamic/Static Region Interface Net Replication  |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Total                                            |            0  |             76  |                    76  |           0  |           3  |  00:00:00  |
-----------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px? 


*commonh px? 


*commonh px? 
T
?Phase 2.2.1 Physical Synthesis In Placer | Checksum: 23e93d680
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:22 ; elapsed = 00:00:09 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 59039 ; free virtual = 2826782default:defaulth px? 
K
6Phase 2.2 Global Placement Core | Checksum: 16ba78cfa
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:22 ; elapsed = 00:00:09 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 59031 ; free virtual = 2826702default:defaulth px? 
D
/Phase 2 Global Placement | Checksum: 16ba78cfa
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:22 ; elapsed = 00:00:09 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 59030 ; free virtual = 2826702default:defaulth px? 
q

Phase %s%s
101*constraints2
3 2default:default2$
Detail Placement2default:defaultZ18-101h px? 
}

Phase %s%s
101*constraints2
3.1 2default:default2.
Commit Multi Column Macros2default:defaultZ18-101h px? 
P
;Phase 3.1 Commit Multi Column Macros | Checksum: 1b1f85ba8
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:23 ; elapsed = 00:00:09 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 59022 ; free virtual = 2826622default:defaulth px? 


Phase %s%s
101*constraints2
3.2 2default:default20
Commit Most Macros & LUTRAMs2default:defaultZ18-101h px? 
R
=Phase 3.2 Commit Most Macros & LUTRAMs | Checksum: 2199fa933
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:25 ; elapsed = 00:00:10 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 59003 ; free virtual = 2826442default:defaulth px? 
y

Phase %s%s
101*constraints2
3.3 2default:default2*
Area Swap Optimization2default:defaultZ18-101h px? 
L
7Phase 3.3 Area Swap Optimization | Checksum: 17e1cf213
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:25 ; elapsed = 00:00:10 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 59001 ; free virtual = 2826432default:defaulth px? 
?

Phase %s%s
101*constraints2
3.4 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px? 
T
?Phase 3.4 Pipeline Register Optimization | Checksum: 1e7982ffe
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:25 ; elapsed = 00:00:10 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 59001 ; free virtual = 2826422default:defaulth px? 


Phase %s%s
101*constraints2
3.5 2default:default20
Small Shape Detail Placement2default:defaultZ18-101h px? 
R
=Phase 3.5 Small Shape Detail Placement | Checksum: 19e84c9e7
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:28 ; elapsed = 00:00:12 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 58913 ; free virtual = 2825572default:defaulth px? 
u

Phase %s%s
101*constraints2
3.6 2default:default2&
Re-assign LUT pins2default:defaultZ18-101h px? 
H
3Phase 3.6 Re-assign LUT pins | Checksum: 1f76fad94
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:28 ; elapsed = 00:00:13 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 58903 ; free virtual = 2825482default:defaulth px? 
?

Phase %s%s
101*constraints2
3.7 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px? 
T
?Phase 3.7 Pipeline Register Optimization | Checksum: 27e2f8868
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:28 ; elapsed = 00:00:13 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 58902 ; free virtual = 2825472default:defaulth px? 
D
/Phase 3 Detail Placement | Checksum: 27e2f8868
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:28 ; elapsed = 00:00:13 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 58900 ; free virtual = 2825452default:defaulth px? 
?

Phase %s%s
101*constraints2
4 2default:default2<
(Post Placement Optimization and Clean-Up2default:defaultZ18-101h px? 
{

Phase %s%s
101*constraints2
4.1 2default:default2,
Post Commit Optimization2default:defaultZ18-101h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
?

Phase %s%s
101*constraints2
4.1.1 2default:default2/
Post Placement Optimization2default:defaultZ18-101h px? 
V
APost Placement Optimization Initialization | Checksum: 1edc650b9
*commonh px? 
u

Phase %s%s
101*constraints2
4.1.1.1 2default:default2"
BUFG Insertion2default:defaultZ18-101h px? 
a

Starting %s Task
103*constraints2&
Physical Synthesis2default:defaultZ18-103h px? 
?

Phase %s%s
101*constraints2
1 2default:default25
!Physical Synthesis Initialization2default:defaultZ18-101h px? 
?
EMultithreading enabled for phys_opt_design using a maximum of %s CPUs380*physynth2
82default:defaultZ32-721h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
1.4792default:default2
0.0002default:defaultZ32-619h px? 
U
@Phase 1 Physical Synthesis Initialization | Checksum: 1c9c1ba49
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.79 ; elapsed = 00:00:00.20 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 58850 ; free virtual = 2824972default:defaulth px? 
?
?BUFG insertion identified %s candidate nets. Inserted BUFG: %s, Replicated BUFG Driver: %s, Skipped due to Placement/Routing Conflicts: %s, Skipped due to Timing Degradation: %s, Skipped due to Illegal Netlist: %s.43*	placeflow2
02default:default2
02default:default2
02default:default2
02default:default2
02default:default2
02default:defaultZ46-56h px? 
J
5Ending Physical Synthesis Task | Checksum: 1d1206e8c
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.82 ; elapsed = 00:00:00.23 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 58847 ; free virtual = 2824942default:defaulth px? 
H
3Phase 4.1.1.1 BUFG Insertion | Checksum: 1edc650b9
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:32 ; elapsed = 00:00:14 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 58845 ; free virtual = 2824922default:defaulth px? 
?
hPost Placement Timing Summary WNS=%s. For the most accurate timing information please run report_timing.610*place2
1.4792default:defaultZ30-746h px? 
S
>Phase 4.1.1 Post Placement Optimization | Checksum: 1fdd10464
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:33 ; elapsed = 00:00:14 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 58842 ; free virtual = 2824902default:defaulth px? 
N
9Phase 4.1 Post Commit Optimization | Checksum: 1fdd10464
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:33 ; elapsed = 00:00:14 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 58839 ; free virtual = 2824872default:defaulth px? 
y

Phase %s%s
101*constraints2
4.2 2default:default2*
Post Placement Cleanup2default:defaultZ18-101h px? 
L
7Phase 4.2 Post Placement Cleanup | Checksum: 1fdd10464
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:33 ; elapsed = 00:00:14 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 58837 ; free virtual = 2824862default:defaulth px? 
s

Phase %s%s
101*constraints2
4.3 2default:default2$
Placer Reporting2default:defaultZ18-101h px? 
F
1Phase 4.3 Placer Reporting | Checksum: 1fdd10464
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:33 ; elapsed = 00:00:14 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 58834 ; free virtual = 2824832default:defaulth px? 
z

Phase %s%s
101*constraints2
4.4 2default:default2+
Final Placement Cleanup2default:defaultZ18-101h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
3328.4572default:default2
0.0002default:default2
588342default:default2
2824832default:defaultZ17-722h px? 
M
8Phase 4.4 Final Placement Cleanup | Checksum: 1c54ce52b
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:33 ; elapsed = 00:00:15 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 58833 ; free virtual = 2824812default:defaulth px? 
\
GPhase 4 Post Placement Optimization and Clean-Up | Checksum: 1c54ce52b
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:33 ; elapsed = 00:00:15 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 58831 ; free virtual = 2824792default:defaulth px? 
=
(Ending Placer Task | Checksum: ec73a10d
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:33 ; elapsed = 00:00:15 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 58830 ; free virtual = 2824782default:defaulth px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
932default:default2
02default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
place_design2default:defaultZ4-42h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
place_design: 2default:default2
00:00:372default:default2
00:00:212default:default2
3328.4572default:default2
0.0002default:default2
588452default:default2
2824932default:defaultZ17-722h px? 
H
&Writing timing data to binary archive.266*timingZ38-480h px? 
D
Writing placer database...
1603*designutilsZ20-1893h px? 
=
Writing XDEF routing.
211*designutilsZ20-211h px? 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px? 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2)
Write XDEF Complete: 2default:default2
00:00:022default:default2
00:00:00.472default:default2
3328.4572default:default2
0.0002default:default2
588072default:default2
2824672default:defaultZ17-722h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2?
t/home/sgeuser30/Desktop/vybhav/FPGA/shared_memory/shared_bram/shared_bram.runs/impl_1/shared_bram_wrapper_placed.dcp2default:defaultZ17-1381h px? 
n
%s4*runtcl2R
>Executing : report_io -file shared_bram_wrapper_io_placed.rpt
2default:defaulth px? 
?
?report_io: Time (s): cpu = 00:00:00.13 ; elapsed = 00:00:00.29 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 58731 ; free virtual = 282388
*commonh px? 
?
%s4*runtcl2?
~Executing : report_utilization -file shared_bram_wrapper_utilization_placed.rpt -pb shared_bram_wrapper_utilization_placed.pb
2default:defaulth px? 
?
%s4*runtcl2o
[Executing : report_control_sets -verbose -file shared_bram_wrapper_control_sets_placed.rpt
2default:defaulth px? 
?
?report_control_sets: Time (s): cpu = 00:00:00.07 ; elapsed = 00:00:00.20 . Memory (MB): peak = 3328.457 ; gain = 0.000 ; free physical = 58721 ; free virtual = 282379
*commonh px? 


End Record