`define ZILLA_32_BIT 
`timescale 1ns / 1ps
module priority_resolve
(
input               zic_clk                     ,
input               zic_rst                     ,
input               wdt_reset_i                 ,
input       [47:0]  int_pending_i               ,
input 		[7:0] 	int0_lp_i			        ,//interrupt level priority value
input 		[7:0] 	int1_lp_i			        ,
input 		[7:0] 	int2_lp_i			        ,
input 		[7:0] 	int3_lp_i			        ,
input 		[7:0] 	int4_lp_i			        ,
input 		[7:0] 	int5_lp_i			        ,
input 		[7:0] 	int6_lp_i			        ,
input 		[7:0] 	int7_lp_i			        ,
input 		[7:0] 	int8_lp_i			        ,
input 		[7:0] 	int9_lp_i			        ,
input 		[7:0] 	int10_lp_i			        ,
input 		[7:0] 	int11_lp_i			        ,
input 		[7:0] 	int12_lp_i			        ,
input 		[7:0] 	int13_lp_i			        ,
input 		[7:0] 	int14_lp_i			        ,
input 		[7:0] 	int15_lp_i			        ,
input 		[7:0] 	int16_lp_i			        ,
input 		[7:0] 	int17_lp_i			        ,
input 		[7:0] 	int18_lp_i			        ,
input 		[7:0] 	int19_lp_i			        ,
input 		[7:0] 	int20_lp_i			        ,
input 		[7:0] 	int21_lp_i			        ,
input 		[7:0] 	int22_lp_i			        ,
input 		[7:0] 	int23_lp_i			        ,
input 		[7:0] 	int24_lp_i			        ,
input 		[7:0] 	int25_lp_i			        ,
input 		[7:0] 	int26_lp_i			        ,
input 		[7:0] 	int27_lp_i			        ,
input 		[7:0] 	int28_lp_i			        ,
input 		[7:0] 	int29_lp_i			        ,
input 		[7:0] 	int30_lp_i			        ,
input 		[7:0] 	int31_lp_i			        ,
input 		[7:0] 	int32_lp_i			        ,
input 		[7:0] 	int33_lp_i			        ,
input 		[7:0] 	int34_lp_i			        ,
input 		[7:0] 	int35_lp_i			        ,
input 		[7:0] 	int36_lp_i			        ,
input 		[7:0] 	int37_lp_i			        ,
input 		[7:0] 	int38_lp_i			        ,
input 		[7:0] 	int39_lp_i			        ,
input 		[7:0] 	int40_lp_i			        ,
input 		[7:0] 	int41_lp_i			        ,
input 		[7:0] 	int42_lp_i			        ,
input 		[7:0] 	int43_lp_i			        ,
input 		[7:0] 	int44_lp_i			        ,
input 		[7:0] 	int45_lp_i			        ,
input 		[7:0] 	int46_lp_i			        ,
input 		[7:0] 	int47_lp_i			        ,
output reg	[7:0] 	interrupt_id_o		        ,
output reg 	[7:0]   highest_pending_lvl_pr_o    ,
output reg          highest_pending_lvl_pr_valid

);
localparam IRQ_ID_0	    =	8'd16;	
localparam IRQ_ID_1	    =	8'd17;	
localparam IRQ_ID_2	    =	8'd18;	
localparam IRQ_ID_3	    =	8'd19;	
localparam IRQ_ID_4	    =	8'd20;	
localparam IRQ_ID_5	    =	8'd21;	
localparam IRQ_ID_6	    =	8'd22;	
localparam IRQ_ID_7	    =	8'd23;	
localparam IRQ_ID_8	    =	8'd24;	
localparam IRQ_ID_9	    =	8'd25;	
localparam IRQ_ID_10	=	8'd26;	
localparam IRQ_ID_11	=   8'd27;
localparam IRQ_ID_12	=   8'd28;
localparam IRQ_ID_13	=   8'd29;
localparam IRQ_ID_14	=   8'd30;
localparam IRQ_ID_15	=   8'd31;
localparam IRQ_ID_16	=   8'd32;
localparam IRQ_ID_17	=   8'd33;
localparam IRQ_ID_18	=   8'd34;
localparam IRQ_ID_19	=   8'd35;
localparam IRQ_ID_20	=   8'd36;
localparam IRQ_ID_21	=   8'd37;
localparam IRQ_ID_22	=   8'd38;
localparam IRQ_ID_23	=   8'd39;
localparam IRQ_ID_24	=   8'd40;
localparam IRQ_ID_25	=   8'd41;
localparam IRQ_ID_26	=   8'd42;
localparam IRQ_ID_27	=   8'd43;
localparam IRQ_ID_28	=   8'd44;
localparam IRQ_ID_29	=   8'd45;
localparam IRQ_ID_30	=   8'd46;
localparam IRQ_ID_31	=   8'd47;
localparam IRQ_ID_32	=   8'd48;
localparam IRQ_ID_33	=   8'd49;
localparam IRQ_ID_34	=   8'd50;
localparam IRQ_ID_35	=   8'd51;
localparam IRQ_ID_36	=   8'd52;
localparam IRQ_ID_37	=   8'd53;
localparam IRQ_ID_38	=   8'd54;
localparam IRQ_ID_39	=   8'd55;
localparam IRQ_ID_40	=   8'd56;
localparam IRQ_ID_41	=   8'd57;
localparam IRQ_ID_42	=   8'd58;
localparam IRQ_ID_43	=   8'd59;
localparam IRQ_ID_44	=   8'd60;
localparam IRQ_ID_45	=   8'd61;
localparam IRQ_ID_46	=   8'd62;
localparam IRQ_ID_47	=   8'd63;

wire [7:0] 	int0_lp_w		     ;	//interrupt level priority value
wire [7:0] 	int1_lp_w		     ;	
wire [7:0] 	int2_lp_w		     ;	
wire [7:0] 	int3_lp_w		     ;	
wire [7:0] 	int4_lp_w		     ;	
wire [7:0] 	int5_lp_w		     ;	
wire [7:0] 	int6_lp_w		     ;	
wire [7:0] 	int7_lp_w		     ;	
wire [7:0] 	int8_lp_w		     ;	
wire [7:0] 	int9_lp_w		     ;	
wire [7:0] 	int10_lp_w		     ;	
wire [7:0] 	int11_lp_w		     ;	
wire [7:0] 	int12_lp_w		     ;	
wire [7:0] 	int13_lp_w		     ;	
wire [7:0] 	int14_lp_w		     ;	
wire [7:0] 	int15_lp_w		     ;	
wire [7:0] 	int16_lp_w		     ;	
wire [7:0] 	int17_lp_w		     ;	
wire [7:0] 	int18_lp_w		     ;	
wire [7:0] 	int19_lp_w		     ;	
wire [7:0] 	int20_lp_w		     ;	
wire [7:0] 	int21_lp_w		     ;	
wire [7:0] 	int22_lp_w		     ;	
wire [7:0] 	int23_lp_w		     ;	
wire [7:0] 	int24_lp_w		     ;	
wire [7:0] 	int25_lp_w		     ;	
wire [7:0] 	int26_lp_w		     ;	
wire [7:0] 	int27_lp_w		     ;	
wire [7:0] 	int28_lp_w		     ;	
wire [7:0] 	int29_lp_w		     ;	
wire [7:0] 	int30_lp_w		     ;	
wire [7:0] 	int31_lp_w		     ;	
wire [7:0] 	int32_lp_w		     ;	
wire [7:0] 	int33_lp_w		     ;	
wire [7:0] 	int34_lp_w		     ;	
wire [7:0] 	int35_lp_w		     ;	
wire [7:0] 	int36_lp_w		     ;	
wire [7:0] 	int37_lp_w		     ;	
wire [7:0] 	int38_lp_w		     ;	
wire [7:0] 	int39_lp_w		     ;	
wire [7:0] 	int40_lp_w		     ;	
wire [7:0] 	int41_lp_w		     ;	
wire [7:0] 	int42_lp_w		     ;	
wire [7:0] 	int43_lp_w		     ;	
wire [7:0] 	int44_lp_w		     ;	
wire [7:0] 	int45_lp_w		     ;	
wire [7:0] 	int46_lp_w		     ;	
wire [7:0] 	int47_lp_w		     ;	

wire [7:0]  stage0_0             ;
wire [7:0]  stage0_1             ;
wire [7:0]  stage0_2             ;
wire [7:0]  stage0_3             ;
wire [7:0]  stage0_4             ;
wire [7:0]  stage0_5             ;
wire [7:0]  stage0_6             ;
wire [7:0]  stage0_7             ;
wire [7:0]  stage0_8             ;
wire [7:0]  stage0_9             ;
wire [7:0]  stage0_10            ;
wire [7:0]  stage0_11            ;
wire [7:0]  stage0_12            ;
wire [7:0]  stage0_13            ;
wire [7:0]  stage0_14            ;
wire [7:0]  stage0_15            ;
wire [7:0]  stage0_16            ;
wire [7:0]  stage0_17            ;
wire [7:0]  stage0_18            ;
wire [7:0]  stage0_19            ;
wire [7:0]  stage0_20            ;
wire [7:0]  stage0_21            ;
wire [7:0]  stage0_22            ;
wire [7:0]  stage0_23            ;
wire [7:0]  stage1_0             ;
wire [7:0]  stage1_1             ;
wire [7:0]  stage1_2             ;
wire [7:0]  stage1_3             ;
wire [7:0]  stage1_4             ;
wire [7:0]  stage1_5             ;
wire [7:0]  stage1_6             ;
wire [7:0]  stage1_7             ;
wire [7:0]  stage1_8             ;
wire [7:0]  stage1_9             ;
wire [7:0]  stage1_10            ;
wire [7:0]  stage1_11            ;
wire [7:0]  stage2_0             ;
wire [7:0]  stage2_1             ;
wire [7:0]  stage2_2             ;
wire [7:0]  stage2_3             ;
wire [7:0]  stage2_4             ;
wire [7:0]  stage2_5             ;
wire [7:0]  stage3_0             ;
wire [7:0]  stage3_1             ;
wire [7:0]  stage3_2             ;
wire [7:0]  stage4_0             ;
wire [7:0]  stage5_0             ;

wire [7:0] stage_id0_0          ;
wire [7:0] stage_id0_1          ;
wire [7:0] stage_id0_2          ;
wire [7:0] stage_id0_3          ;
wire [7:0] stage_id0_4          ;
wire [7:0] stage_id0_5          ;
wire [7:0] stage_id0_6          ;
wire [7:0] stage_id0_7          ;
wire [7:0] stage_id0_8          ;
wire [7:0] stage_id0_9          ;
wire [7:0] stage_id0_10         ;
wire [7:0] stage_id0_11         ;
wire [7:0] stage_id0_12         ;
wire [7:0] stage_id0_13         ;
wire [7:0] stage_id0_14         ;
wire [7:0] stage_id0_15         ;
wire [7:0] stage_id0_16         ;
wire [7:0] stage_id0_17         ;
wire [7:0] stage_id0_18         ;
wire [7:0] stage_id0_19         ;
wire [7:0] stage_id0_20         ;
wire [7:0] stage_id0_21         ;
wire [7:0] stage_id0_22         ;
wire [7:0] stage_id0_23         ;
wire [7:0] stage_id1_0          ;
wire [7:0] stage_id1_1          ;
wire [7:0] stage_id1_2          ;
wire [7:0] stage_id1_3          ;
wire [7:0] stage_id1_4          ;
wire [7:0] stage_id1_5          ;
wire [7:0] stage_id1_6          ;
wire [7:0] stage_id1_7          ;
wire [7:0] stage_id1_8          ;
wire [7:0] stage_id1_9          ;
wire [7:0] stage_id1_10         ;
wire [7:0] stage_id1_11         ;
wire [7:0] stage_id2_0          ;
wire [7:0] stage_id2_1          ;
wire [7:0] stage_id2_2          ;
wire [7:0] stage_id2_3          ;
wire [7:0] stage_id2_4          ;
wire [7:0] stage_id2_5          ;
wire [7:0] stage_id3_0          ;
wire [7:0] stage_id3_1          ;
wire [7:0] stage_id3_2          ;
wire [7:0] stage_id4_0          ;
wire [7:0] stage_id5_0          ;

assign int0_lp_w    =int_pending_i[0 ] ? int0_lp_i  : 8'd0;	
assign int1_lp_w    =int_pending_i[1 ] ? int1_lp_i  : 8'd0;	
assign int2_lp_w    =int_pending_i[2 ] ? int2_lp_i  : 8'd0;	
assign int3_lp_w    =int_pending_i[3 ] ? int3_lp_i  : 8'd0;	
assign int4_lp_w    =int_pending_i[4 ] ? int4_lp_i  : 8'd0;	
assign int5_lp_w    =int_pending_i[5 ] ? int5_lp_i  : 8'd0;	
assign int6_lp_w    =int_pending_i[6 ] ? int6_lp_i  : 8'd0;	
assign int7_lp_w    =int_pending_i[7 ] ? int7_lp_i  : 8'd0;	
assign int8_lp_w    =int_pending_i[8 ] ? int8_lp_i  : 8'd0;	
assign int9_lp_w    =int_pending_i[9 ] ? int9_lp_i  : 8'd0;	
assign int10_lp_w	=int_pending_i[10] ? int10_lp_i : 8'd0;
assign int11_lp_w	=int_pending_i[11] ? int11_lp_i : 8'd0;
assign int12_lp_w	=int_pending_i[12] ? int12_lp_i : 8'd0;
assign int13_lp_w	=int_pending_i[13] ? int13_lp_i : 8'd0;
assign int14_lp_w	=int_pending_i[14] ? int14_lp_i : 8'd0;
assign int15_lp_w	=int_pending_i[15] ? int15_lp_i : 8'd0;
assign int16_lp_w	=int_pending_i[16] ? int16_lp_i : 8'd0;
assign int17_lp_w	=int_pending_i[17] ? int17_lp_i : 8'd0;
assign int18_lp_w	=int_pending_i[18] ? int18_lp_i : 8'd0;
assign int19_lp_w	=int_pending_i[19] ? int19_lp_i : 8'd0;
assign int20_lp_w	=int_pending_i[20] ? int20_lp_i : 8'd0;
assign int21_lp_w	=int_pending_i[21] ? int21_lp_i : 8'd0;
assign int22_lp_w	=int_pending_i[22] ? int22_lp_i : 8'd0;
assign int23_lp_w	=int_pending_i[23] ? int23_lp_i : 8'd0;
assign int24_lp_w	=int_pending_i[24] ? int24_lp_i : 8'd0;
assign int25_lp_w	=int_pending_i[25] ? int25_lp_i : 8'd0;
assign int26_lp_w	=int_pending_i[26] ? int26_lp_i : 8'd0;
assign int27_lp_w	=int_pending_i[27] ? int27_lp_i : 8'd0;
assign int28_lp_w	=int_pending_i[28] ? int28_lp_i : 8'd0;
assign int29_lp_w	=int_pending_i[29] ? int29_lp_i : 8'd0;
assign int30_lp_w	=int_pending_i[30] ? int30_lp_i : 8'd0;
assign int31_lp_w	=int_pending_i[31] ? int31_lp_i : 8'd0;
assign int32_lp_w	=int_pending_i[32] ? int32_lp_i : 8'd0;
assign int33_lp_w	=int_pending_i[33] ? int33_lp_i : 8'd0;
assign int34_lp_w	=int_pending_i[34] ? int34_lp_i : 8'd0;
assign int35_lp_w	=int_pending_i[35] ? int35_lp_i : 8'd0;
assign int36_lp_w	=int_pending_i[36] ? int36_lp_i : 8'd0;
assign int37_lp_w	=int_pending_i[37] ? int37_lp_i : 8'd0;
assign int38_lp_w	=int_pending_i[38] ? int38_lp_i : 8'd0;
assign int39_lp_w	=int_pending_i[39] ? int39_lp_i : 8'd0;
assign int40_lp_w	=int_pending_i[40] ? int40_lp_i : 8'd0;
assign int41_lp_w	=int_pending_i[41] ? int41_lp_i : 8'd0;
assign int42_lp_w	=int_pending_i[42] ? int42_lp_i : 8'd0;
assign int43_lp_w	=int_pending_i[43] ? int43_lp_i : 8'd0;
assign int44_lp_w	=int_pending_i[44] ? int44_lp_i : 8'd0;
assign int45_lp_w	=int_pending_i[45] ? int45_lp_i : 8'd0;
assign int46_lp_w	=int_pending_i[46] ? int46_lp_i : 8'd0;
assign int47_lp_w	=int_pending_i[47] ? int47_lp_i : 8'd0;

lvl_pr_compare st0_int0_int1_comp//stage 0
(
.val_in_1	(int0_lp_w  ),
.val_in_2	(int1_lp_w  ),
.val1_id    (IRQ_ID_0   ),
.val2_id    (IRQ_ID_1   ),
.out_id     (stage_id0_0),
.val_out	(stage0_0   )
);
lvl_pr_compare st0_int2_int3_comp//stage 0
(
.val_in_1	(int2_lp_w  ),
.val_in_2	(int3_lp_w  ),
.val1_id    (IRQ_ID_2   ),
.val2_id    (IRQ_ID_3   ),
.out_id     (stage_id0_1),
.val_out	(stage0_1   )
);

lvl_pr_compare st0_int4_int5_comp//stage 0
(
.val_in_1	(int4_lp_w  ),
.val_in_2	(int5_lp_w  ),
.val1_id    (IRQ_ID_4   ),
.val2_id    (IRQ_ID_5   ),
.out_id     (stage_id0_2),
.val_out	(stage0_2   )
);
lvl_pr_compare st0_int6_int7_comp//stage 0
(
.val_in_1	(int6_lp_w  ),
.val_in_2	(int7_lp_w  ),
.val1_id    (IRQ_ID_6   ),
.val2_id    (IRQ_ID_7   ),
.out_id     (stage_id0_3),
.val_out	(stage0_3   )
);


lvl_pr_compare st0_int8_int9_comp//stage 0
(
.val_in_1	(int8_lp_w  ),
.val_in_2	(int9_lp_w  ),
.val1_id    (IRQ_ID_8   ),
.val2_id    (IRQ_ID_9   ),
.out_id     (stage_id0_4),
.val_out	(stage0_4   )
);
lvl_pr_compare st0_int10_int11_comp//stage 0
(
.val_in_1	(int10_lp_w  ),
.val_in_2	(int11_lp_w  ),
.val1_id    (IRQ_ID_10   ),
.val2_id    (IRQ_ID_11   ),
.out_id     (stage_id0_5 ),
.val_out	(stage0_5    )
);

lvl_pr_compare st0_int12_int13_comp//stage 0
(
.val_in_1	(int12_lp_w  ),
.val_in_2	(int13_lp_w  ),
.val1_id    (IRQ_ID_12   ),
.val2_id    (IRQ_ID_13   ),
.out_id     (stage_id0_6 ),
.val_out	(stage0_6    )
);
lvl_pr_compare st0_int14_int15_comp//stage 0
(
.val_in_1	(int14_lp_w  ),
.val_in_2	(int15_lp_w  ),
.val1_id    (IRQ_ID_14   ),
.val2_id    (IRQ_ID_15   ),
.out_id     (stage_id0_7 ),
.val_out	(stage0_7    )
);

lvl_pr_compare st0_int16_int17_comp//stage 0
(
.val_in_1	(int16_lp_w  ),
.val_in_2	(int17_lp_w  ),
.val1_id    (IRQ_ID_16   ),
.val2_id    (IRQ_ID_17   ),
.out_id     (stage_id0_8 ),
.val_out	(stage0_8    )
);
lvl_pr_compare st0_int18_int19_comp//stage 0
(
.val_in_1	(int18_lp_w  ),
.val_in_2	(int19_lp_w  ),
.val1_id    (IRQ_ID_18   ),
.val2_id    (IRQ_ID_19   ),
.out_id     (stage_id0_9 ),
.val_out	(stage0_9    )
);

lvl_pr_compare st0_int20_int21_comp//stage 0
(
.val_in_1	(int20_lp_w  ),
.val_in_2	(int21_lp_w  ),
.val1_id    (IRQ_ID_20   ),
.val2_id    (IRQ_ID_21   ),
.out_id     (stage_id0_10),
.val_out	(stage0_10   )
);
lvl_pr_compare st0_int22_int23_comp//stage 0
(
.val_in_1	(int22_lp_w  ),
.val_in_2	(int23_lp_w  ),
.val1_id    (IRQ_ID_22   ),
.val2_id    (IRQ_ID_23   ),
.out_id     (stage_id0_11),
.val_out	(stage0_11   )
);


lvl_pr_compare st0_int24_int25_comp//stage 0
(
.val_in_1	(int24_lp_w  ),
.val_in_2	(int25_lp_w  ),
.val1_id    (IRQ_ID_24   ),
.val2_id    (IRQ_ID_25   ),
.out_id     (stage_id0_12),
.val_out	(stage0_12   )
);
lvl_pr_compare st0_int26_int27_comp//stage 0
(
.val_in_1	(int26_lp_w  ),
.val_in_2	(int27_lp_w  ),
.val1_id    (IRQ_ID_26   ),
.val2_id    (IRQ_ID_27   ),
.out_id     (stage_id0_13),
.val_out	(stage0_13   )
);


lvl_pr_compare st0_int28_int29_comp//stage 0
(
.val_in_1	(int28_lp_w  ),
.val_in_2	(int29_lp_w  ),
.val1_id    (IRQ_ID_28   ),
.val2_id    (IRQ_ID_29   ),
.out_id     (stage_id0_14),
.val_out	(stage0_14   )
);
lvl_pr_compare st0_int30_int31_comp//stage 0
(
.val_in_1	(int30_lp_w  ),
.val_in_2	(int31_lp_w  ),
.val1_id    (IRQ_ID_30   ),
.val2_id    (IRQ_ID_31   ),
.out_id     (stage_id0_15),
.val_out	(stage0_15   )
);


lvl_pr_compare st0_int32_int33_comp//stage 0
(
.val_in_1	(int32_lp_w  ),
.val_in_2	(int33_lp_w  ),
.val1_id    (IRQ_ID_32   ),
.val2_id    (IRQ_ID_33   ),
.out_id     (stage_id0_16),
.val_out	(stage0_16   )
);
lvl_pr_compare st0_int34_int35_comp//stage 0
(
.val_in_1	(int34_lp_w  ),
.val_in_2	(int35_lp_w  ),
.val1_id    (IRQ_ID_34   ),
.val2_id    (IRQ_ID_35   ),
.out_id     (stage_id0_17),
.val_out	(stage0_17   )
);



lvl_pr_compare st0_int36_int37_comp//stage 0
(
.val_in_1	(int36_lp_w  ),
.val_in_2	(int37_lp_w  ),
.val1_id    (IRQ_ID_36   ),
.val2_id    (IRQ_ID_37   ),
.out_id     (stage_id0_18),
.val_out	(stage0_18   )
);
lvl_pr_compare st0_int38_int39_comp//stage 0
(
.val_in_1	(int38_lp_w  ),
.val_in_2	(int39_lp_w  ),
.val1_id    (IRQ_ID_38   ),
.val2_id    (IRQ_ID_39   ),
.out_id     (stage_id0_19),
.val_out	(stage0_19   )
);


lvl_pr_compare st0_int40_int41_comp//stage 0
(
.val_in_1	(int40_lp_w  ),
.val_in_2	(int41_lp_w  ),
.val1_id    (IRQ_ID_40   ),
.val2_id    (IRQ_ID_41   ),
.out_id     (stage_id0_20),
.val_out	(stage0_20   )
);
lvl_pr_compare st0_int42_int43_comp//stage 0
(
.val_in_1	(int42_lp_w  ),
.val_in_2	(int43_lp_w  ),
.val1_id    (IRQ_ID_42   ),
.val2_id    (IRQ_ID_43   ),
.out_id     (stage_id0_21),
.val_out	(stage0_21   )
);

lvl_pr_compare st0_int44_int45_comp//stage 0
(
.val_in_1	(int44_lp_w  ),
.val_in_2	(int45_lp_w  ),
.val1_id    (IRQ_ID_44   ),
.val2_id    (IRQ_ID_45   ),
.out_id     (stage_id0_22),
.val_out	(stage0_22   )
);
lvl_pr_compare st0_int46_int47_comp//stage 0
(
.val_in_1	(int46_lp_w  ),
.val_in_2	(int47_lp_w  ),
.val1_id    (IRQ_ID_46   ),
.val2_id    (IRQ_ID_47   ),
.out_id     (stage_id0_23),
.val_out	(stage0_23   )
);
///////////////////////////////////////////////////////
//
//		stage 1
//
////////////////////////////////////////////////////////
lvl_pr_compare st1_int0_int1_comp//stage 1
(
.val_in_1	(stage0_0     ),
.val_in_2	(stage0_1     ),
.val1_id    (stage_id0_0  ),
.val2_id    (stage_id0_1  ),
.out_id     (stage_id1_0  ),
.val_out	(stage1_0     )
);


lvl_pr_compare st1_int2_int3_comp//stage 1
(
.val_in_1	(stage0_2     ),
.val_in_2	(stage0_3     ),
.val1_id    (stage_id0_2  ),
.val2_id    (stage_id0_3  ),
.out_id     (stage_id1_1  ),
.val_out	(stage1_1     )
);

lvl_pr_compare st1_int4_int5_comp//stage 1
(
.val_in_1	(stage0_4     ),
.val_in_2	(stage0_5     ),
.val1_id    (stage_id0_4  ),
.val2_id    (stage_id0_5  ),
.out_id     (stage_id1_2  ),
.val_out	(stage1_2     )
);

lvl_pr_compare st1_int6_int7_comp//stage 1
(
.val_in_1	(stage0_6     ),
.val_in_2	(stage0_7     ),
.val1_id    (stage_id0_6  ),
.val2_id    (stage_id0_7  ),
.out_id     (stage_id1_3  ),
.val_out	(stage1_3     )
);

lvl_pr_compare st1_int8_int9_comp//stage 1
(
.val_in_1	(stage0_8     ),
.val_in_2	(stage0_9     ),
.val1_id    (stage_id0_8  ),
.val2_id    (stage_id0_9  ),
.out_id     (stage_id1_4  ),
.val_out	(stage1_4     )
);


lvl_pr_compare st1_int10_int11_comp//stage 1
(
.val_in_1	(stage0_10),
.val_in_2	(stage0_11),
.val1_id    (stage_id0_10  ),
.val2_id    (stage_id0_11  ),
.out_id     (stage_id1_5),
.val_out	(stage1_5)
);

lvl_pr_compare st1_int12_int13_comp//stage 1
(
.val_in_1	(stage0_12),
.val_in_2	(stage0_13),
.val1_id    (stage_id0_12  ),
.val2_id    (stage_id0_13  ),
.out_id     (stage_id1_6),
.val_out	(stage1_6)
);

lvl_pr_compare st1_int14_int15_comp//stage 1
(
.val_in_1	(stage0_14),
.val_in_2	(stage0_15),
.val1_id    (stage_id0_14  ),
.val2_id    (stage_id0_15  ),
.out_id     (stage_id1_7),
.val_out	(stage1_7)
);

lvl_pr_compare st1_int16_int17_comp//stage 1
(
.val_in_1	(stage0_16),
.val_in_2	(stage0_17),
.val1_id    (stage_id0_16  ),
.val2_id    (stage_id0_17  ),
.out_id     (stage_id1_8),
.val_out	(stage1_8)
);

lvl_pr_compare st1_int18_int19_comp//stage 1
(
.val_in_1	(stage0_18),
.val_in_2	(stage0_19),
.val1_id    (stage_id0_18  ),
.val2_id    (stage_id0_19  ),
.out_id     (stage_id1_9),
.val_out	(stage1_9)
);

lvl_pr_compare st1_int20_int21_comp//stage 1
(
.val_in_1	(stage0_20),
.val_in_2	(stage0_21),
.val1_id    (stage_id0_20  ),
.val2_id    (stage_id0_21  ),
.out_id     (stage_id1_10),
.val_out	(stage1_10)
);

lvl_pr_compare st1_int22_int23_comp//stage 1
(
.val_in_1	(stage0_22),
.val_in_2	(stage0_23),
.val1_id    (stage_id0_22  ),
.val2_id    (stage_id0_23  ),
.out_id     (stage_id1_11),
.val_out	(stage1_11)
);

////////////////////////////////////////////////////////
//
//
lvl_pr_compare st2_int0_int1_comp//stage 2
(
.val_in_1	(stage1_0       ),
.val_in_2	(stage1_1       ),
.val1_id    (stage_id1_0    ),
.val2_id    (stage_id1_1    ),
.out_id     (stage_id2_0    ),
.val_out	(stage2_0       )
);
lvl_pr_compare st2_int2_int3_comp//stage 2
(
.val_in_1	(stage1_2),
.val_in_2	(stage1_3),
.val1_id    (stage_id1_2  ),
.val2_id    (stage_id1_3  ),
.out_id     (stage_id2_1),
.val_out	(stage2_1)
);
lvl_pr_compare st2_int4_int5_comp//stage 2
(
.val_in_1	(stage1_4),
.val_in_2	(stage1_5),
.val1_id    (stage_id1_4  ),
.val2_id    (stage_id1_5  ),
.out_id     (stage_id2_2),
.val_out	(stage2_2)
);
lvl_pr_compare st2_int6_int7_comp//stage 2
(
.val_in_1	(stage1_6),
.val_in_2	(stage1_7),
.val1_id    (stage_id1_6  ),
.val2_id    (stage_id1_7  ),
.out_id     (stage_id2_3),
.val_out	(stage2_3)
);

lvl_pr_compare st2_int8_int9_comp//stage 2
(
.val_in_1	(stage1_8),
.val_in_2	(stage1_9),
.val1_id    (stage_id1_8  ),
.val2_id    (stage_id1_9 ),
.out_id     (stage_id2_4),
.val_out	(stage2_4)
);

lvl_pr_compare st2_int10_int11_comp//stage 2
(
.val_in_1	(stage1_10),
.val_in_2	(stage1_11),
.val1_id    (stage_id1_10  ),
.val2_id    (stage_id1_11  ),
.out_id     (stage_id2_5),
.val_out	(stage2_5)
);

////////////////////////////////////////////////////////////////////////
//		stage 3
////////////////////////////////////////////////////////////////////////

lvl_pr_compare st3_int0_int1_comp//stage 3
(
.val_in_1	(stage2_0),
.val_in_2	(stage2_1),
.val1_id    (stage_id2_0  ),
.val2_id    (stage_id2_1  ),
.out_id     (stage_id3_0),
.val_out	(stage3_0)
);
lvl_pr_compare st3_int2_int3_comp//stage 3
(
.val_in_1	(stage2_2),
.val_in_2	(stage2_3),
.val1_id    (stage_id2_2  ),
.val2_id    (stage_id2_3  ),
.out_id     (stage_id3_1),
.val_out	(stage3_1)
);

lvl_pr_compare st3_int4_int5_comp//stage 3
(
.val_in_1	(stage2_4       ),
.val_in_2	(stage2_5       ),
.val1_id    (stage_id2_4    ),
.val2_id    (stage_id2_5    ),
.out_id     (stage_id3_2    ),
.val_out	(stage3_2       )
);


/////////////////////////////////////////////////////////////////////////
//		stage 4
////////////////////////////////////////////////////////////////////////
lvl_pr_compare st4_int0_int1_comp//stage 4
(
.val_in_1	(stage3_0       ),
.val_in_2	(stage3_1       ),
.val1_id    (stage_id3_0    ),
.val2_id    (stage_id3_1    ),
.out_id     (stage_id4_0    ),
.val_out	(stage4_0       )
);

//////////////////////////////////////////////////////////////
//		stage 5
//////////////////////////////////////////////////////////////
lvl_pr_compare st5_int0_int1_comp//stage 5
(
.val_in_1	(stage4_0       ),
.val_in_2	(stage3_2       ),
.val1_id    (stage_id4_0    ),
.val2_id    (stage_id3_2    ),
.out_id     (stage_id5_0    ) ,
.val_out	(stage5_0       )
);



always@(posedge zic_clk or negedge zic_rst)
begin
	if(!zic_rst)
	begin	
		highest_pending_lvl_pr_o     <= 8'd0	    ;
        	interrupt_id_o               <= 8'd0        ;
		highest_pending_lvl_pr_valid <= 1'b0        ;

	end
	else
	begin
		highest_pending_lvl_pr_o     <= stage5_0    ;
        	interrupt_id_o               <= stage_id5_0 ;
		highest_pending_lvl_pr_valid <= 1'b1	    ;

	end
end


endmodule



module lvl_pr_compare
(
input       [7:0] val_in_1    ,
input       [7:0] val_in_2    ,
input       [7:0] val1_id     ,
input       [7:0] val2_id     ,
output reg  [7:0] out_id      ,
output reg  [7:0] val_out

);

always@(*)
begin
	if(val_in_1[7:5] == val_in_2[7:5])
	begin
		if(val_in_1[4:2] == val_in_2[4:2])
		begin
			val_out = val_in_1;
            		out_id  = val1_id ;
		end
		else if(val_in_1[4:2] > val_in_2[4:2])
		begin
			val_out = val_in_1;
            		out_id  = val1_id ;
		end
		else
		begin
			val_out = val_in_2;
            out_id  = val2_id ;
		end

	end
	else if(val_in_1[7:5] > val_in_2[7:5])
	begin
			val_out = val_in_1;
            out_id  = val1_id ;
	end
	else
	begin
			val_out = val_in_2;
            out_id  = val2_id ;
	end
end
endmodule


