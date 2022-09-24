// Copyright © 2021 Vivartan Technologies., All rights reserved.
// 
// All works published under Zilla_Gen_0 by the Vivartan Technologies. 
// is copyrighted by the Association and ownership of all right, title and interest
// in and to the works remains with Vivartan Technologies.
// 
// No works or documents published under Zilla_Gen_0 by Vivartan Technologies. may be reproduced,
// transmitted or copied without the express written permission of Vivartan Technologies.
// will be considered as a violations of Copyright Act and it may lead to legal action.


/*
**
*******************************************************************************
**
** Header file for mailbox related functions and variables
**
** You need to include this header file in your test program if you are
** using mailboxes
**
** Usage : #include "mailbox.h"
*******************************************************************************
*/




#ifndef MAILBOX_H
#define MAILBOX_H

#define MAILBOX_BASE (&__mailbox1__)                       /*!< The structure start is &__mailbox1__ */
#define MAILBOX      ((MAILBOX_Type *) MAILBOX_BASE)       /*!< Mailbox structure base address */
#define SET_FLAG     0xDEADBEEF                            /*!< Mailbox set flag */  
#define UNSET_FLAG   0x11223344                            /*!< Mailbox unset flag */  
volatile uint64_t error_cnt = 0;                           /*!< Used to Log Error Count at different functions */

/* This structure enables us to read from any mailbox */
typedef struct {                                           /*!< MAILBOX Structure      */
  volatile uint64_t       MAILBOX1_MSG;                    /*!< Mailbox1 message       */
  volatile uint64_t       MAILBOX2_MSG;                    /*!< Mailbox2 message       */
  volatile unsigned char  PRINT_MAILBOX_MSG [256];         /*!< Print mailbox message  */
  volatile uint64_t       MAILBOX1_FLG;                    /*!< Mailbox flag           */  
  volatile uint64_t       MAILBOX2_FLG;                    /*!< Mailbox flag           */  
} MAILBOX_Type;
/* Note: array size values can't be replaced by the linker script "len" symbols
   which are treated as dynamic values and not as constants. So, size of arrays
   are hardcoded as 256 here */ 

/* Enumerated datatypes */
typedef enum _mailbox_type {                               /*!< Mailbox type           */
				MAILBOX1 = 0,              /*!< Mailbox1               */
				MAILBOX2                   /*!< Mailbox2               */
} MailboxType;

typedef enum _mailbox_cmd  {               /*!< Mailbox command        */
				REQ_RAND = 0xEEAAEEAA,     /*!< Request random command */
				IRQ_GEN_0  = 0x00AA0000,     
				IRQ_GEN_1  = 0x00AA0001,     
				IRQ_GEN_2  = 0x00AA0002,     
				IRQ_GEN_3  = 0x00AA0003, 
				IRQ_GEN_4  = 0x00AA0004,     
				IRQ_GEN_5  = 0x00AA0005,     
				IRQ_GEN_6  = 0x00AA0006,     
				IRQ_GEN_7  = 0x00AA0007, 
				IRQ_GEN_8  = 0x00AA0008,     
				IRQ_GEN_9  = 0x00AA0009,     
				IRQ_GEN_10 = 0x00AA000A,     
				IRQ_GEN_11 = 0x00AA000B, 
				IRQ_GEN_12 = 0x00AA000C,     
				IRQ_GEN_13 = 0x00AA000D,     
				IRQ_GEN_14 = 0x00AA000E,     
				IRQ_GEN_15 = 0x00AA000F, 
				IRQ_GEN_16 = 0x00AA0010,     
				IRQ_GEN_17 = 0x00AA0011,     
				IRQ_GEN_18 = 0x00AA0012,     
				IRQ_GEN_19 = 0x00AA0013, 
				IRQ_GEN_20 = 0x00AA0014,     
				IRQ_GEN_21 = 0x00AA0015,     
				IRQ_GEN_22 = 0x00AA0016,     
				IRQ_GEN_23 = 0x00AA0017, 
				IRQ_GEN_24 = 0x00AA0018,     
				IRQ_GEN_25 = 0x00AA0019,     
				IRQ_GEN_26 = 0x00AA001A,     
				IRQ_GEN_27 = 0x00AA001B,
				IRQ_GEN_28 = 0x00AA001C,     
				IRQ_GEN_29 = 0x00AA001D, 
				IRQ_GEN_30 = 0x00AA001E,     
				IRQ_GEN_31 = 0x00AA001F,     
				IRQ_GEN_32 = 0x00AA0020,     
				IRQ_GEN_33 = 0x00AA0021, 
				IRQ_GEN_34 = 0x00AA0022,     
				IRQ_GEN_35 = 0x00AA0023,     
				IRQ_GEN_36 = 0x00AA0024,     
				IRQ_GEN_37 = 0x00AA0025, 
				IRQ_GEN_38 = 0x00AA0026,     
				IRQ_GEN_39 = 0x00AA0027,     
				IRQ_GEN_40 = 0x00AA0028,     
				IRQ_GEN_41 = 0x00AA0029, 
				IRQ_GEN_42 = 0x00AA002A,     
				IRQ_GEN_43 = 0x00AA002B,     
				IRQ_GEN_44 = 0x00AA002C,     
				IRQ_GEN_45 = 0x00AA002D,
				IRQ_GEN_46 = 0x00AA002E,     
			

                IRQ_GEN_RAND1 = 0x00AA0030,
                IRQ_GEN_RAND2 = 0x00AA0031,
                IRQ_GEN_RAND3 = 0x00AA0032,
                IRQ_GEN_RAND4 = 0x00AA0033,
                IRQ_GEN_RAND5 = 0x00AA0034,
                
                 
                WDT_1 = 0x00AA0035,
                WDT_2 = 0x00AA0036,
                WDT_3 = 0x00AA0037,


                
				IRQ_GEN_L1 = 0x00BB0001,
				IRQ_GEN_L2 = 0x00BB0002,
				IRQ_GEN_L3 = 0x00BB0003,
				IRQ_GEN_L4 = 0x00BB0004,
				IRQ_GEN_L5 = 0x00BB0005,
                IRQ_GEN_L6 = 0x00BB0006,
                IRQ_GEN_L7 = 0x00BB0007,
            
			    IRQ_GEN_P1 = 0x00BB0008,
				IRQ_GEN_P2 = 0x00BB0009,
				IRQ_GEN_P3 = 0x00BB000A,
				IRQ_GEN_P4 = 0x00BB000B,
				IRQ_GEN_P5 = 0x00BB000C,
                IRQ_GEN_P6 = 0x00BB000D,
                IRQ_GEN_P7 = 0x00BB000E,
                
                IRQ_GEN_T1 = 0x00CC0001,
                IRQ_GEN_T2 = 0x00CC0002,
                IRQ_GEN_T3 = 0x00CC0003,
                IRQ_GEN_T4 = 0x00CC0004,
                IRQ_GEN_T5 = 0x00CC0005,
                IRQ_GEN_T6 = 0x00CC0006,
                IRQ_GEN_T7 = 0x00CC0007,
                IRQ_GEN_T8 = 0x00CC0008,
                IRQ_GEN_T9 = 0x00CC0009,
                IRQ_GEN_T10 = 0x00CC000A,
                IRQ_GEN_T11 = 0x00CC000B,
                IRQ_GEN_T12 = 0x00CC000C,
                IRQ_GEN_T13 = 0x00CC000D,
                IRQ_GEN_T14 = 0x00CC000E,
                              
                 DE_IRQ_0    = 0x00DD0000,
                 DE_IRQ_1    = 0x00DD0001,
                 DE_IRQ_2    = 0x00DD0002,
                 DE_IRQ_3    = 0x00DD0003,
                 DE_IRQ_4    = 0x00DD0004,
                 DE_IRQ_5    = 0x00DD0005,
                 DE_IRQ_6    = 0x00DD0006,
                 DE_IRQ_7    = 0x00DD0007,
                 DE_IRQ_8    = 0x00DD0008,
                 DE_IRQ_9    = 0x00DD0009,
                 DE_IRQ_10   = 0x00DD0010,
                 DE_IRQ_11   = 0x00DD0011,
                 DE_IRQ_12   = 0x00DD0012,
                 DE_IRQ_13   = 0x00DD0013,
                 DE_IRQ_14   = 0x00DD0014,
                 DE_IRQ_15   = 0x00DD0015,
                 DE_IRQ_16   = 0x00DD0016,
                 DE_IRQ_17   = 0x00DD0017,
                 DE_IRQ_18   = 0x00DD0018,
                 DE_IRQ_19   = 0x00DD0019,
                 DE_IRQ_20   = 0x00DD0020,
                 DE_IRQ_21   = 0x00DD0021,
                 DE_IRQ_22   = 0x00DD0022,
                 DE_IRQ_23   = 0x00DD0023,
                 DE_IRQ_24   = 0x00DD0024,
                 DE_IRQ_25   = 0x00DD0025,
                 DE_IRQ_26   = 0x00DD0026,
                 DE_IRQ_27   = 0x00DD0027,
                 DE_IRQ_28   = 0x00DD0028,
                 DE_IRQ_29   = 0x00DD0029,
                 DE_IRQ_30   = 0x00DD0030,
                 DE_IRQ_31   = 0x00DD0031,
                 DE_IRQ_32   = 0x00DD0032,
                 DE_IRQ_33   = 0x00DD0033,
                 DE_IRQ_34   = 0x00DD0034,
                 DE_IRQ_35   = 0x00DD0035,
                 DE_IRQ_36   = 0x00DD0036,
                 DE_IRQ_37   = 0x00DD0037,
                 DE_IRQ_38   = 0x00DD0038,
                 DE_IRQ_39   = 0x00DD0039,
                 DE_IRQ_40   = 0x00DD0040,
                 DE_IRQ_41   = 0x00DD0041,
                 DE_IRQ_42   = 0x00DD0042,
                 DE_IRQ_43   = 0x00DD0043,
                 DE_IRQ_44   = 0x00DD0044,
                 DE_IRQ_45   = 0x00DD0045,
                 DE_IRQ_46   = 0x00DD0046,
                 DE_IRQ_47   = 0x00DD0047,

                 E_BREAK =  0x00DD0048, 
                

               
    			END_SIM  = 0xEEAAAAEE,     /*!< End simulation command */
				MEM_DUMP = 0xA0A0A0A0,      /*!< Memory Dump command */
} MailboxCMD;

typedef uint64_t MailboxFLAG;                              /*!< Mailbox flag           */
typedef uint64_t MailboxRAND;                              /*!< Mailbox random         */
typedef uint64_t MailboxREAD;                              /*!< Mailbox read           */
typedef uint64_t MailboxIRQ;                              /*!< Mailbox read           */

/* Functions */

/* Send requiest to mailbox
   arguments : mt - mailbox type
               cmd - command
   return    : none */

void mailbox_send_request(MailboxType mt, MailboxCMD cmd)
{
 //    int r0;
  //csr_asm_rs(csrrsi,r0,768,8); // Enable Mstatus mie bit (write to mstatus_csr) : need to be enabled to accept interrupt requests

  //GEN_INT(IRQ_GEN_21);
   // GEN_INT(IRQ_GEN_21);
   // asm volatile ("mul	a5,a6,a5") ; 
    //asm volatile ("div	a7,a6,a5") ;
	switch(mt)
	{
    //asm volatile ("mul	a5,a6,a5") ;              
    //asm volatile ("div	a7,a6,a5") ;
		case MAILBOX1: MAILBOX->MAILBOX1_MSG = cmd; break;
		case MAILBOX2: MAILBOX->MAILBOX2_MSG = cmd; break;
		default: break;
	}
}

/* Set flag for mailbox
   arguments : mt - mailbox type
   return    : none */
void mailbox_set_flag(MailboxType mt)
{
	switch(mt)
	{
		case MAILBOX1: MAILBOX->MAILBOX1_FLG = SET_FLAG; break;
		case MAILBOX2: MAILBOX->MAILBOX2_FLG = SET_FLAG; break;
		default: break;
	}
}

/* Unset flag for mailbox
   arguments : mt - mailbox type
   return    : none */
void mailbox_unset_flag(MailboxType mt)
{
	switch(mt)
	{
		case MAILBOX1: MAILBOX->MAILBOX1_FLG = UNSET_FLAG; break;
		case MAILBOX2: MAILBOX->MAILBOX2_FLG = UNSET_FLAG; break;
		default: break;
	}
}

/* Read mailbox flag
   arguments : mt - mailbox type
   return    : MailboxFLAG */
MailboxFLAG mailbox_read_flag(MailboxType mt)
{
	MailboxFLAG flg = (MailboxFLAG) -1;

	switch(mt)
	{

       
		case MAILBOX1: flg = (MailboxFLAG) MAILBOX->MAILBOX1_FLG; break;
		case MAILBOX2: flg = (MailboxFLAG) MAILBOX->MAILBOX2_FLG; break;
		default: break;
	}

	return flg;
}

/* Wait until mailbox flag unset
   arguments : mt - mailbox type
   return    : none */
void wait_until_flag_unset(MailboxType mt)
{
	if(mt == MAILBOX1)
	{
		while(MAILBOX->MAILBOX1_FLG != UNSET_FLAG);
	}
	else if(mt == MAILBOX2)
	{
		while(MAILBOX->MAILBOX2_FLG != UNSET_FLAG);
	}
}

/* Read mailbox value
   arguments : mt - mailbox type
   return    : MailboxREAD type value */
MailboxREAD mailbox_read_value(MailboxType mt)
{
	MailboxREAD val = (MailboxREAD) 0;

	switch(mt)
	{
		case MAILBOX1: val = (MailboxREAD) MAILBOX->MAILBOX1_MSG; break;
		case MAILBOX2: val = (MailboxREAD) MAILBOX->MAILBOX2_MSG; break;
		default: break;
	}

	return val;
}

/* Generate random number
   arguments : mt - mailbox type
   return    : MailboxRAND type random number */
MailboxRAND generate_random_num(MailboxType mt)
{
	mailbox_send_request(mt, REQ_RAND);
	mailbox_set_flag(mt);
	wait_until_flag_unset(mt);
	return (mailbox_read_value(mt));
}


#define csr_asm_rs(inst,rd,imm,imm1)\
        asm volatile (#inst "    %[z], "#imm", "#imm1"\n\t"  : [z] "=r" (rd) ) ;


void generate_IRQ(MailboxType mt, MailboxCMD id)
{
       mailbox_send_request(mt, id);
}
void deassert_IRQ(MailboxType mt, MailboxCMD id)
{
	mailbox_send_request(mt, id);
}
 
void test(void)
{
asm volatile ("lbu	a5, 0(a0)") ;              
asm volatile ("lbu	a6,0(a1)")  ;    
asm volatile (" and	a7,a6,a5") ;   
asm volatile (" sb	a7,0(a2)") ; 
asm volatile ("add  a0, x0, a7")  ; 
}


MailboxRAND read_exception_num(MailboxType mt)
{
	mailbox_set_flag(mt);
	wait_until_flag_unset(mt);
	return (mailbox_read_value(mt));
}

MailboxRAND generate_random(MailboxType mt, MailboxCMD id)
{
     mailbox_send_request(mt, id);
     mailbox_set_flag(mt);
	wait_until_flag_unset(mt);
	return (mailbox_read_value(mt));

}





#endif /* MAILBOX_H */

