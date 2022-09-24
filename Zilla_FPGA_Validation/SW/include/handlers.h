// Copyright © 2021 Vivartan Technologies., All rights reserved.
// 
// All works published under Zilla_Gen_0 by the Vivartan Technologies. 
// is copyrighted by the Association and ownership of all right, title and interest
// in and to the works remains with Vivartan Technologies.
// 
// No works or documents published under Zilla_Gen_0 by Vivartan Technologies. may be reproduced,
// transmitted or copied without the express written permission of Vivartan Technologies.
// will be considered as a violations of Copyright Act and it may lead to legal action.

void machine_timer_irq 			        (void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void machine_external_irq 		        (void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void Exception_handler_irq              (void) __attribute__ ((weak,   interrupt));


void irq_0_handler 							    	(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_1_handler							    	(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_2_handler 							    	(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_3_handler 							    	(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_4_handler							    	(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_5_handler 							    	(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_6_handler 							    	(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_7_handler							    	(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_8_handler							    	(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_9_handler							    	(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_10_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler") ));
void irq_11_handler 							 	(void) __attribute__ ((weak,   interrupt, alias("Default_Handler") ));
void irq_12_handler						            (void) __attribute__ ((weak,   interrupt, alias("Default_Handler") ));
void irq_13_handler							        (void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_14_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_15_handler							    	(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_16_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_17_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_18_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_19_handler							    	(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_20_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_21_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_22_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_23_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_24_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_25_handler							        (void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_26_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_27_handler							     	(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_28_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_29_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_30_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_31_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_32_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_33_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_34_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_35_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler") ));
void irq_36_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_37_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_38_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_39_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_40_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_41_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_42_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_43_handler							    	(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_44_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));
void irq_45_handler                                 (void) __attribute__ ((weak,   interrupt, alias("Default_Handler") ));
void irq_46_handler 								(void) __attribute__ ((weak,   interrupt, alias("Default_Handler")));



 __attribute__(( weak, naked))void Default_Handler(void)
{
// saying : do some displays
// we can check : Nesting : attribute parallely 
	while(1);

}


void No_irq_handler(void){

	while(1);
}


void Exception_handler_irq(void)
{

	while(1);


}
void machine_software_irq(void)
{

      while(1);       //reading mcause register and saving that on a register
                              //comparing mcause and then deciding the three interrupts
}



