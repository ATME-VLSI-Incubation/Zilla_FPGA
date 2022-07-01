`define ZILLA_32_BIT 
`timescale 1ns / 1ps
//output multiplexer for software read 
//read access through load instruction

module zic_mmr_op_mux
/*#( 
parameter MMR_CTL_ADDR 		= 0 ,			
parameter MMR_ATTR_ADDR		= 0 ,	
parameter MMR_IE_ADDR  		= 0 ,	
parameter MMR_IP_ADDR 		= 0 ,
parameter MMR_EOI_ADDR		= 0 ,	
parameter MMR_ACK_ADDR		= 0 ,	
parameter MMR_CFG_ADDR		= 0 ,	
parameter MMR_INFO_ADDR		= 0 ,	
parameter MMR_NXTP_ADDR		= 0 	
)*/

(
input 	[7 :0] 			zic_ack_int_id_i	,	
input 	[7 :0]   		zic_eoi_i  		, 
input 	[7 :0]   		zic_cfg_i   		,
input 	[31:0] 			zic_info_i  		,
input 	[7 :0]			zic_nxtp_i  		,
input 	[31:0]			irq0_ctrl_i 		,
input 	[31:0]			irq1_ctrl_i 		,
input 	[31:0]			irq2_ctrl_i 		,
input 	[31:0]			irq3_ctrl_i 		,
input 	[31:0]			irq4_ctrl_i 		,
input 	[31:0]			irq5_ctrl_i 		,
input 	[31:0]			irq6_ctrl_i 		,
input 	[31:0]			irq7_ctrl_i 		,
input 	[31:0]			irq8_ctrl_i 		,
input 	[31:0]			irq9_ctrl_i 		,
input 	[31:0]			irq10_ctrl_i		,	
input 	[31:0]			irq11_ctrl_i		,	
input 	[31:0]			irq12_ctrl_i		,	
input 	[31:0]			irq13_ctrl_i		,	
input 	[31:0]			irq14_ctrl_i		,	
input 	[31:0]			irq15_ctrl_i		,	
input 	[31:0]			irq16_ctrl_i		,	
input 	[31:0]			irq17_ctrl_i		,	
input 	[31:0]			irq18_ctrl_i		,	
input 	[31:0]			irq19_ctrl_i		,	
input 	[31:0]			irq20_ctrl_i		,	
input 	[31:0]			irq21_ctrl_i		,	
input 	[31:0]			irq22_ctrl_i		,	
input 	[31:0]			irq23_ctrl_i		,	
input 	[31:0]			irq24_ctrl_i		,	
input 	[31:0]			irq25_ctrl_i		,	
input 	[31:0]			irq26_ctrl_i		,	
input 	[31:0]			irq27_ctrl_i		,	
input 	[31:0]			irq28_ctrl_i		,	
input 	[31:0]			irq29_ctrl_i		,	
input 	[31:0]			irq30_ctrl_i		,	
input 	[31:0]			irq31_ctrl_i		,	
input 	[31:0]			irq32_ctrl_i		,	
input 	[31:0]			irq33_ctrl_i		,	
input 	[31:0]			irq34_ctrl_i		,	
input 	[31:0]			irq35_ctrl_i		,	
input 	[31:0]			irq36_ctrl_i		,	
input 	[31:0]			irq37_ctrl_i		,	
input 	[31:0]			irq38_ctrl_i		,	
input 	[31:0]			irq39_ctrl_i		,	
input 	[31:0]			irq40_ctrl_i		,	
input 	[31:0]			irq41_ctrl_i		,	
input 	[31:0]			irq42_ctrl_i		,	
input 	[31:0]			irq43_ctrl_i		,	
input 	[31:0]			irq44_ctrl_i		,	
input 	[31:0]			irq45_ctrl_i		,	
input 	[31:0]			irq46_ctrl_i		,	
input 	[31:0]			irq47_ctrl_i		,
input 				zic_mmr_read_en_i	,
input 	[15:0] 			zic_mmr_read_addr_i	,
input 				zic_ack_read_valid	,//from program control (processor core)
output  [31 :0] 		zic_mmr_read_data_o	,
output  [7 :0] 			zic_ack_int_id_o	, //to program control(processor core)
input [31:0] 			wdt_counter_i		,
  input [31:0] 			wdt_ctrl_i,
  input [31:0] wdt_timeout_reg_i

);
  
  reg [31:0]  zic_mmr_read_data_r;

assign zic_ack_int_id_o = zic_ack_read_valid ? zic_ack_int_id_i : 0;

always@(*)
begin
case(zic_mmr_read_addr_i[15:0])
16'h1000:zic_mmr_read_data_r = {24'd0,irq0_ctrl_i[7 : 0]};	
16'h1001:zic_mmr_read_data_r = {24'd0,irq0_ctrl_i[15: 8]};      
16'h1002:zic_mmr_read_data_r = {24'd0,irq0_ctrl_i[23:16]};      
16'h1003:zic_mmr_read_data_r = {24'd0,irq0_ctrl_i[31:24]};
16'h1004:zic_mmr_read_data_r = {24'd0,irq1_ctrl_i[7 : 0]};      
16'h1005:zic_mmr_read_data_r = {24'd0,irq1_ctrl_i[15: 8]};      
16'h1006:zic_mmr_read_data_r = {24'd0,irq1_ctrl_i[23:16]};      
16'h1007:zic_mmr_read_data_r = {24'd0,irq1_ctrl_i[31:24]};
16'h1008:zic_mmr_read_data_r = {24'd0,irq2_ctrl_i[7 : 0]};      
16'h1009:zic_mmr_read_data_r = {24'd0,irq2_ctrl_i[15: 8]};      
16'h100A:zic_mmr_read_data_r = {24'd0,irq2_ctrl_i[23:16]};      
16'h100B:zic_mmr_read_data_r = {24'd0,irq2_ctrl_i[31:24]};
16'h100c:zic_mmr_read_data_r = {24'd0,irq3_ctrl_i[7 : 0]};      
16'h100D:zic_mmr_read_data_r = {24'd0,irq3_ctrl_i[15: 8]};      
16'h100E:zic_mmr_read_data_r = {24'd0,irq3_ctrl_i[23:16]};      
16'h100F:zic_mmr_read_data_r = {24'd0,irq3_ctrl_i[31:24]};
16'h1010:zic_mmr_read_data_r = {24'd0,irq4_ctrl_i[7 : 0]};      
16'h1011:zic_mmr_read_data_r = {24'd0,irq4_ctrl_i[15: 8]};      
16'h1012:zic_mmr_read_data_r = {24'd0,irq4_ctrl_i[23:16]};      
16'h1013:zic_mmr_read_data_r = {24'd0,irq4_ctrl_i[31:24]};
16'h1014:zic_mmr_read_data_r = {24'd0,irq5_ctrl_i[7 : 0]};      
16'h1015:zic_mmr_read_data_r = {24'd0,irq5_ctrl_i[15: 8]};      
16'h1016:zic_mmr_read_data_r = {24'd0,irq5_ctrl_i[23:16]};      
16'h1017:zic_mmr_read_data_r = {24'd0,irq5_ctrl_i[31:24]};
16'h1018:zic_mmr_read_data_r = {24'd0,irq6_ctrl_i[7 : 0]};      
16'h1019:zic_mmr_read_data_r = {24'd0,irq6_ctrl_i[15: 8]};      
16'h101A:zic_mmr_read_data_r = {24'd0,irq6_ctrl_i[23:16]};      
16'h101B:zic_mmr_read_data_r = {24'd0,irq6_ctrl_i[31:24]};
16'h101c:zic_mmr_read_data_r = {24'd0,irq7_ctrl_i[7 : 0]};      
16'h101D:zic_mmr_read_data_r = {24'd0,irq7_ctrl_i[15: 8]};      
16'h101E:zic_mmr_read_data_r = {24'd0,irq7_ctrl_i[23:16]};      
16'h101F:zic_mmr_read_data_r = {24'd0,irq7_ctrl_i[31:24]};
16'h1020:zic_mmr_read_data_r = {24'd0,irq8_ctrl_i[7 : 0]};      
16'h1021:zic_mmr_read_data_r = {24'd0,irq8_ctrl_i[15: 8]};      
16'h1022:zic_mmr_read_data_r = {24'd0,irq8_ctrl_i[23:16]};      
16'h1023:zic_mmr_read_data_r = {24'd0,irq8_ctrl_i[31:24]};
16'h1024:zic_mmr_read_data_r = {24'd0,irq9_ctrl_i[7 : 0]};      
16'h1025:zic_mmr_read_data_r = {24'd0,irq9_ctrl_i[15: 8]};      
16'h1026:zic_mmr_read_data_r = {24'd0,irq9_ctrl_i[23:16]};      
16'h1027:zic_mmr_read_data_r = {24'd0,irq9_ctrl_i[31:24]};
16'h1028:zic_mmr_read_data_r = {24'd0,irq10_ctrl_i[7 : 0]};	
16'h1029:zic_mmr_read_data_r = {24'd0,irq10_ctrl_i[15: 8]};	
16'h102A:zic_mmr_read_data_r = {24'd0,irq10_ctrl_i[23:16]};	
16'h102B:zic_mmr_read_data_r = {24'd0,irq10_ctrl_i[31:24]};
16'h102c:zic_mmr_read_data_r = {24'd0,irq11_ctrl_i[7 : 0]};	
16'h102D:zic_mmr_read_data_r = {24'd0,irq11_ctrl_i[15: 8]};	
16'h102E:zic_mmr_read_data_r = {24'd0,irq11_ctrl_i[23:16]};	
16'h102F:zic_mmr_read_data_r = {24'd0,irq11_ctrl_i[31:24]};
16'h1030:zic_mmr_read_data_r = {24'd0,irq12_ctrl_i[7 : 0]};	
16'h1031:zic_mmr_read_data_r = {24'd0,irq12_ctrl_i[15: 8]};	
16'h1032:zic_mmr_read_data_r = {24'd0,irq12_ctrl_i[23:16]};	
16'h1033:zic_mmr_read_data_r = {24'd0,irq12_ctrl_i[31:24]};
16'h1034:zic_mmr_read_data_r = {24'd0,irq13_ctrl_i[7 : 0]};	
16'h1035:zic_mmr_read_data_r = {24'd0,irq13_ctrl_i[15: 8]};	
16'h1036:zic_mmr_read_data_r = {24'd0,irq13_ctrl_i[23:16]};	
16'h1037:zic_mmr_read_data_r = {24'd0,irq13_ctrl_i[31:24]};
16'h1038:zic_mmr_read_data_r = {24'd0,irq14_ctrl_i[7 : 0]};	
16'h1039:zic_mmr_read_data_r = {24'd0,irq14_ctrl_i[15: 8]};	
16'h103A:zic_mmr_read_data_r = {24'd0,irq14_ctrl_i[23:16]};	
16'h103B:zic_mmr_read_data_r = {24'd0,irq14_ctrl_i[31:24]};
16'h103c:zic_mmr_read_data_r = {24'd0,irq15_ctrl_i[7 : 0]};	
16'h103D:zic_mmr_read_data_r = {24'd0,irq15_ctrl_i[15: 8]};	
16'h103E:zic_mmr_read_data_r = {24'd0,irq15_ctrl_i[23:16]};	
16'h103F:zic_mmr_read_data_r = {24'd0,irq15_ctrl_i[31:24]};
16'h1040:zic_mmr_read_data_r = {24'd0,irq16_ctrl_i[7 : 0]};	
16'h1041:zic_mmr_read_data_r = {24'd0,irq16_ctrl_i[15: 8]};	
16'h1042:zic_mmr_read_data_r = {24'd0,irq16_ctrl_i[23:16]};	
16'h1043:zic_mmr_read_data_r = {24'd0,irq16_ctrl_i[31:24]};
16'h1044:zic_mmr_read_data_r = {24'd0,irq17_ctrl_i[7 : 0]};	
16'h1045:zic_mmr_read_data_r = {24'd0,irq17_ctrl_i[15: 8]};	
16'h1046:zic_mmr_read_data_r = {24'd0,irq17_ctrl_i[23:16]};	
16'h1047:zic_mmr_read_data_r = {24'd0,irq17_ctrl_i[31:24]};
16'h1048:zic_mmr_read_data_r = {24'd0,irq18_ctrl_i[7 : 0]};	
16'h1049:zic_mmr_read_data_r = {24'd0,irq18_ctrl_i[15: 8]};	
16'h104A:zic_mmr_read_data_r = {24'd0,irq18_ctrl_i[23:16]};	
16'h104B:zic_mmr_read_data_r = {24'd0,irq18_ctrl_i[31:24]};
16'h104c:zic_mmr_read_data_r = {24'd0,irq19_ctrl_i[7 : 0]};	
16'h104D:zic_mmr_read_data_r = {24'd0,irq19_ctrl_i[15: 8]};	
16'h104E:zic_mmr_read_data_r = {24'd0,irq19_ctrl_i[23:16]};	
16'h104F:zic_mmr_read_data_r = {24'd0,irq19_ctrl_i[31:24]};
16'h1050:zic_mmr_read_data_r = {24'd0,irq20_ctrl_i[7 : 0]};	
16'h1051:zic_mmr_read_data_r = {24'd0,irq20_ctrl_i[15: 8]};	
16'h1052:zic_mmr_read_data_r = {24'd0,irq20_ctrl_i[23:16]};	
16'h1053:zic_mmr_read_data_r = {24'd0,irq20_ctrl_i[31:24]};
16'h1054:zic_mmr_read_data_r = {24'd0,irq21_ctrl_i[7 : 0]};	
16'h1055:zic_mmr_read_data_r = {24'd0,irq21_ctrl_i[15: 8]};	
16'h1056:zic_mmr_read_data_r = {24'd0,irq21_ctrl_i[23:16]};	
16'h1057:zic_mmr_read_data_r = {24'd0,irq21_ctrl_i[31:24]};
16'h1058:zic_mmr_read_data_r = {24'd0,irq22_ctrl_i[7 : 0]};	
16'h1059:zic_mmr_read_data_r = {24'd0,irq22_ctrl_i[15: 8]};	
16'h105A:zic_mmr_read_data_r = {24'd0,irq22_ctrl_i[23:16]};	
16'h105B:zic_mmr_read_data_r = {24'd0,irq22_ctrl_i[31:24]};
16'h105c:zic_mmr_read_data_r = {24'd0,irq23_ctrl_i[7 : 0]};	
16'h105D:zic_mmr_read_data_r = {24'd0,irq23_ctrl_i[15: 8]};	
16'h105E:zic_mmr_read_data_r = {24'd0,irq23_ctrl_i[23:16]};	
16'h105F:zic_mmr_read_data_r = {24'd0,irq23_ctrl_i[31:24]};
16'h1060:zic_mmr_read_data_r = {24'd0,irq24_ctrl_i[7 : 0]};	
16'h1061:zic_mmr_read_data_r = {24'd0,irq24_ctrl_i[15: 8]};	
16'h1062:zic_mmr_read_data_r = {24'd0,irq24_ctrl_i[23:16]};	
16'h1063:zic_mmr_read_data_r = {24'd0,irq24_ctrl_i[31:24]};
16'h1064:zic_mmr_read_data_r = {24'd0,irq25_ctrl_i[7 : 0]};	
16'h1065:zic_mmr_read_data_r = {24'd0,irq25_ctrl_i[15: 8]};	
16'h1066:zic_mmr_read_data_r = {24'd0,irq25_ctrl_i[23:16]};	
16'h1067:zic_mmr_read_data_r = {24'd0,irq25_ctrl_i[31:24]};
16'h1068:zic_mmr_read_data_r = {24'd0,irq26_ctrl_i[7 : 0]};	
16'h1069:zic_mmr_read_data_r = {24'd0,irq26_ctrl_i[15: 8]};	
16'h106A:zic_mmr_read_data_r = {24'd0,irq26_ctrl_i[23:16]};	
16'h106B:zic_mmr_read_data_r = {24'd0,irq26_ctrl_i[31:24]};
16'h106c:zic_mmr_read_data_r = {24'd0,irq27_ctrl_i[7 : 0]};	
16'h106D:zic_mmr_read_data_r = {24'd0,irq27_ctrl_i[15: 8]};	
16'h106E:zic_mmr_read_data_r = {24'd0,irq27_ctrl_i[23:16]};	
16'h106F:zic_mmr_read_data_r = {24'd0,irq27_ctrl_i[31:24]};
16'h1070:zic_mmr_read_data_r = {24'd0,irq28_ctrl_i[7 : 0]};	
16'h1071:zic_mmr_read_data_r = {24'd0,irq28_ctrl_i[15: 8]};	
16'h1072:zic_mmr_read_data_r = {24'd0,irq28_ctrl_i[23:16]};	
16'h1073:zic_mmr_read_data_r = {24'd0,irq28_ctrl_i[31:24]};
16'h1074:zic_mmr_read_data_r = {24'd0,irq29_ctrl_i[7 : 0]};	
16'h1075:zic_mmr_read_data_r = {24'd0,irq29_ctrl_i[15: 8]};	
16'h1076:zic_mmr_read_data_r = {24'd0,irq29_ctrl_i[23:16]};	
16'h1077:zic_mmr_read_data_r = {24'd0,irq29_ctrl_i[31:24]};
16'h1078:zic_mmr_read_data_r = {24'd0,irq30_ctrl_i[7 : 0]};	
16'h1079:zic_mmr_read_data_r = {24'd0,irq30_ctrl_i[15: 8]};	
16'h107A:zic_mmr_read_data_r = {24'd0,irq30_ctrl_i[23:16]};	
16'h107B:zic_mmr_read_data_r = {24'd0,irq30_ctrl_i[31:24]};
16'h107c:zic_mmr_read_data_r = {24'd0,irq31_ctrl_i[7 : 0]};	
16'h107D:zic_mmr_read_data_r = {24'd0,irq31_ctrl_i[15: 8]};	
16'h107E:zic_mmr_read_data_r = {24'd0,irq31_ctrl_i[23:16]};	
16'h107F:zic_mmr_read_data_r = {24'd0,irq31_ctrl_i[31:24]};
16'h1080:zic_mmr_read_data_r = {24'd0,irq32_ctrl_i[7 : 0]};	
16'h1081:zic_mmr_read_data_r = {24'd0,irq32_ctrl_i[15: 8]};	
16'h1082:zic_mmr_read_data_r = {24'd0,irq32_ctrl_i[23:16]};	
16'h1083:zic_mmr_read_data_r = {24'd0,irq32_ctrl_i[31:24]};
16'h1084:zic_mmr_read_data_r = {24'd0,irq33_ctrl_i[7 : 0]};	
16'h1085:zic_mmr_read_data_r = {24'd0,irq33_ctrl_i[15: 8]};	
16'h1086:zic_mmr_read_data_r = {24'd0,irq33_ctrl_i[23:16]};	
16'h1087:zic_mmr_read_data_r = {24'd0,irq33_ctrl_i[31:24]};
16'h1088:zic_mmr_read_data_r = {24'd0,irq34_ctrl_i[7 : 0]};	
16'h1089:zic_mmr_read_data_r = {24'd0,irq34_ctrl_i[15: 8]};	
16'h108A:zic_mmr_read_data_r = {24'd0,irq34_ctrl_i[23:16]};	
16'h108B:zic_mmr_read_data_r = {24'd0,irq34_ctrl_i[31:24]};
16'h108c:zic_mmr_read_data_r = {24'd0,irq35_ctrl_i[7 : 0]};	
16'h108D:zic_mmr_read_data_r = {24'd0,irq35_ctrl_i[15: 8]};	
16'h108E:zic_mmr_read_data_r = {24'd0,irq35_ctrl_i[23:16]};	
16'h108F:zic_mmr_read_data_r = {24'd0,irq35_ctrl_i[31:24]};
16'h1090:zic_mmr_read_data_r = {24'd0,irq36_ctrl_i[7 : 0]};	
16'h1091:zic_mmr_read_data_r = {24'd0,irq36_ctrl_i[15: 8]};	
16'h1092:zic_mmr_read_data_r = {24'd0,irq36_ctrl_i[23:16]};	
16'h1093:zic_mmr_read_data_r = {24'd0,irq36_ctrl_i[31:24]};
16'h1094:zic_mmr_read_data_r = {24'd0,irq37_ctrl_i[7 : 0]};	
16'h1095:zic_mmr_read_data_r = {24'd0,irq37_ctrl_i[15: 8]};	
16'h1096:zic_mmr_read_data_r = {24'd0,irq37_ctrl_i[23:16]};	
16'h1097:zic_mmr_read_data_r = {24'd0,irq37_ctrl_i[31:24]};
16'h1098:zic_mmr_read_data_r = {24'd0,irq38_ctrl_i[7 : 0]};	
16'h1099:zic_mmr_read_data_r = {24'd0,irq38_ctrl_i[15: 8]};	
16'h109A:zic_mmr_read_data_r = {24'd0,irq38_ctrl_i[23:16]};	
16'h109B:zic_mmr_read_data_r = {24'd0,irq38_ctrl_i[31:24]};
16'h109c:zic_mmr_read_data_r = {24'd0,irq39_ctrl_i[7 : 0]};	
16'h109D:zic_mmr_read_data_r = {24'd0,irq39_ctrl_i[15: 8]};	
16'h109E:zic_mmr_read_data_r = {24'd0,irq39_ctrl_i[23:16]};	
16'h109F:zic_mmr_read_data_r = {24'd0,irq39_ctrl_i[31:24]};
16'h10A0:zic_mmr_read_data_r = {24'd0,irq40_ctrl_i[7 : 0]};	
16'h10A1:zic_mmr_read_data_r = {24'd0,irq40_ctrl_i[15: 8]};	
16'h10A2:zic_mmr_read_data_r = {24'd0,irq40_ctrl_i[23:16]};	
16'h10A3:zic_mmr_read_data_r = {24'd0,irq40_ctrl_i[31:24]};
16'h10A4:zic_mmr_read_data_r = {24'd0,irq41_ctrl_i[7 : 0]};	
16'h10A5:zic_mmr_read_data_r = {24'd0,irq41_ctrl_i[15: 8]};	
16'h10A6:zic_mmr_read_data_r = {24'd0,irq41_ctrl_i[23:16]};	
16'h10A7:zic_mmr_read_data_r = {24'd0,irq41_ctrl_i[31:24]};
16'h10A8:zic_mmr_read_data_r = {24'd0,irq42_ctrl_i[7 : 0]};	
16'h10A9:zic_mmr_read_data_r = {24'd0,irq42_ctrl_i[15: 8]};	
16'h10AA:zic_mmr_read_data_r = {24'd0,irq42_ctrl_i[23:16]};	
16'h10AB:zic_mmr_read_data_r = {24'd0,irq42_ctrl_i[31:24]};
16'h10AC:zic_mmr_read_data_r = {24'd0,irq43_ctrl_i[7 : 0]};	
16'h10AD:zic_mmr_read_data_r = {24'd0,irq43_ctrl_i[15: 8]};	
16'h10AE:zic_mmr_read_data_r = {24'd0,irq43_ctrl_i[23:16]};	
16'h10AF:zic_mmr_read_data_r = {24'd0,irq43_ctrl_i[31:24]};
16'h10B0:zic_mmr_read_data_r = {24'd0,irq44_ctrl_i[7 : 0]};	
16'h10B1:zic_mmr_read_data_r = {24'd0,irq44_ctrl_i[15: 8]};	
16'h10B2:zic_mmr_read_data_r = {24'd0,irq44_ctrl_i[23:16]};	
16'h10B3:zic_mmr_read_data_r = {24'd0,irq44_ctrl_i[31:24]};
16'h10B4:zic_mmr_read_data_r = {24'd0,irq45_ctrl_i[7 : 0]};	
16'h10B5:zic_mmr_read_data_r = {24'd0,irq45_ctrl_i[15: 8]};	
16'h10B6:zic_mmr_read_data_r = {24'd0,irq45_ctrl_i[23:16]};	
16'h10B7:zic_mmr_read_data_r = {24'd0,irq45_ctrl_i[31:24]};
16'h10B8:zic_mmr_read_data_r = {24'd0,irq46_ctrl_i[7 : 0]};	
16'h10B9:zic_mmr_read_data_r = {24'd0,irq46_ctrl_i[15: 8]};	
16'h10BA:zic_mmr_read_data_r = {24'd0,irq46_ctrl_i[23:16]};	
16'h10BB:zic_mmr_read_data_r = {24'd0,irq46_ctrl_i[31:24]};
16'h10BC:zic_mmr_read_data_r = {24'd0,irq47_ctrl_i[7 : 0]};	
16'h10BD:zic_mmr_read_data_r = {24'd0,irq47_ctrl_i[15: 8]};	
16'h10BE:zic_mmr_read_data_r = {24'd0,irq47_ctrl_i[23:16]};	
16'h10BF:zic_mmr_read_data_r = {24'd0,irq47_ctrl_i[31:24]};
16'h0000:zic_mmr_read_data_r = {24'd0,zic_cfg_i[7:0]	      };   		
16'h0004:zic_mmr_read_data_r = {zic_info_i		        };  
16'h0800:zic_mmr_read_data_r = {24'd0,zic_nxtp_i[7:0]	        };  	
16'h0804:zic_mmr_read_data_r = {24'd0,zic_ack_int_id_i[7:0]	};	
16'h0808:zic_mmr_read_data_r = {24'd0,zic_eoi_i[7:0]	        };
16'h080c:zic_mmr_read_data_r = wdt_counter_i ;
16'h0810:zic_mmr_read_data_r = wdt_ctrl_i ;
16'h0814:zic_mmr_read_data_r = wdt_timeout_reg_i;
default: zic_mmr_read_data_r = 0 ;	

endcase
end

assign zic_mmr_read_data_o = zic_mmr_read_en_i ? zic_mmr_read_data_r : 0 ;
endmodule
