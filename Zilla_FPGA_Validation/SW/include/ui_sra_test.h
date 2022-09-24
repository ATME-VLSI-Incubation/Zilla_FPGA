/*
**
*******************************************************************************
**
** Header file for creating I-Type and U-Type tests
**
** Usage : #include "ui_sra_test.h"
*******************************************************************************
*/

#ifndef UI_SRA_TEST_H
#define UI_SRA_TEST_H

#ifdef SPIKE_RUN
#include "data.h"               /*!< Testbench created data */
#endif


void test_sraiw_u64_ui_type(int k)
{
volatile int testnumber=k; 
#ifndef bit_32
#ifdef SPIKE_RUN
{	TEST_SRAIW_INSN_I_SPIKE(sraiw,op1,34,result,exp_result,testnumber,uint64_t,int64_t);
	SRAIW_PRINT_RESULT_U(testnumber,op1,op2,result,exp_result,uint64_t);} 
	testnumber++;
{	TEST_SRAIW_INSN_I_SPIKE(sraiw,op1,59,result,exp_result,testnumber,uint64_t,int64_t);
	SRAIW_PRINT_RESULT_U(testnumber,op1,op2,result,exp_result,uint64_t);} 
	testnumber++;
{	TEST_SRAIW_INSN_I_SPIKE(sraiw,op1,28,result,exp_result,testnumber,uint64_t,int64_t);
	SRAIW_PRINT_RESULT_U(testnumber,op1,op2,result,exp_result,uint64_t);} 
	testnumber++;
{	TEST_SRAIW_INSN_I_SPIKE(sraiw,op1,19,result,exp_result,testnumber,uint64_t,int64_t);
	SRAIW_PRINT_RESULT_U(testnumber,op1,op2,result,exp_result,uint64_t);} 
	testnumber++;
{	TEST_SRAIW_INSN_I_SPIKE(sraiw,op1,53,result,exp_result,testnumber,uint64_t,int64_t);
	SRAIW_PRINT_RESULT_U(testnumber,op1,op2,result,exp_result,uint64_t);} 
	testnumber++;
#else
{	TEST_SRAIW_INSN_I(MAILBOX1,sraiw,op1,34,result,testnumber,uint64_t,int64_t);}
	testnumber++;
{	TEST_SRAIW_INSN_I(MAILBOX1,sraiw,op1,59,result,testnumber,uint64_t,int64_t);}
	testnumber++;
{	TEST_SRAIW_INSN_I(MAILBOX1,sraiw,op1,28,result,testnumber,uint64_t,int64_t);}
	testnumber++;
{	TEST_SRAIW_INSN_I(MAILBOX1,sraiw,op1,19,result,testnumber,uint64_t,int64_t);}
	testnumber++;
{	TEST_SRAIW_INSN_I(MAILBOX1,sraiw,op1,53,result,testnumber,uint64_t,int64_t);}
	testnumber++;
#endif
#endif
}



void test_sraiw_s64_ui_type(int k)
{
volatile int testnumber=k; 
#ifndef bit_32
#ifdef SPIKE_RUN
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,5,result,exp_result,testnumber,int64_t,int64_t);
	SRAI_PRINT_RESULT_S(testnumber,op1,op2,result,exp_result,int64_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,0,result,exp_result,testnumber,int64_t,int64_t);
	SRAI_PRINT_RESULT_S(testnumber,op1,op2,result,exp_result,int64_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,52,result,exp_result,testnumber,int64_t,int64_t);
	SRAI_PRINT_RESULT_S(testnumber,op1,op2,result,exp_result,int64_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,37,result,exp_result,testnumber,int64_t,int64_t);
	SRAI_PRINT_RESULT_S(testnumber,op1,op2,result,exp_result,int64_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,15,result,exp_result,testnumber,int64_t,int64_t);
	SRAI_PRINT_RESULT_S(testnumber,op1,op2,result,exp_result,int64_t);} 
	testnumber++;
#else
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,5,result,testnumber,int64_t,int64_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,0,result,testnumber,int64_t,int64_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,52,result,testnumber,int64_t,int64_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,37,result,testnumber,int64_t,int64_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,15,result,testnumber,int64_t,int64_t);}
	testnumber++;
#endif
#endif
}



void test_srai_u32_ui_type(int k)
{
volatile int testnumber=k; 
#ifdef SPIKE_RUN
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,18,result,exp_result,testnumber,uint32_t,int32_t );
	SRAI_PRINT_RESULT_U(testnumber,op1,op2,result,exp_result,uint32_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,29,result,exp_result,testnumber,uint32_t,int32_t );
	SRAI_PRINT_RESULT_U(testnumber,op1,op2,result,exp_result,uint32_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,5,result,exp_result,testnumber,uint32_t,int32_t );
	SRAI_PRINT_RESULT_U(testnumber,op1,op2,result,exp_result,uint32_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,16,result,exp_result,testnumber,uint32_t,int32_t );
	SRAI_PRINT_RESULT_U(testnumber,op1,op2,result,exp_result,uint32_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,19,result,exp_result,testnumber,uint32_t,int32_t );
	SRAI_PRINT_RESULT_U(testnumber,op1,op2,result,exp_result,uint32_t);} 
	testnumber++;
#else
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,18,result,testnumber,uint32_t,int32_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,29,result,testnumber,uint32_t,int32_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,5,result,testnumber,uint32_t,int32_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,16,result,testnumber,uint32_t,int32_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,19,result,testnumber,uint32_t,int32_t);}
	testnumber++;
#endif
}



void test_srai_s32_ui_type(int k)
{
volatile int testnumber=k; 
#ifdef SPIKE_RUN
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,0,result,exp_result,testnumber,int32_t,int32_t);
	SRAI_PRINT_RESULT_S(testnumber,op1,op2,result,exp_result,int32_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,23,result,exp_result,testnumber,int32_t,int32_t);
	SRAI_PRINT_RESULT_S(testnumber,op1,op2,result,exp_result,int32_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,7,result,exp_result,testnumber,int32_t,int32_t);
	SRAI_PRINT_RESULT_S(testnumber,op1,op2,result,exp_result,int32_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,14,result,exp_result,testnumber,int32_t,int32_t);
	SRAI_PRINT_RESULT_S(testnumber,op1,op2,result,exp_result,int32_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,0,result,exp_result,testnumber,int32_t,int32_t);
	SRAI_PRINT_RESULT_S(testnumber,op1,op2,result,exp_result,int32_t);} 
	testnumber++;
#else
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,0,result,testnumber,int32_t,int32_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,23,result,testnumber,int32_t,int32_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,7,result,testnumber,int32_t,int32_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,14,result,testnumber,int32_t,int32_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,0,result,testnumber,int32_t,int32_t);}
	testnumber++;
#endif
}



void test_srai_u16_ui_type(int k)
{
volatile int testnumber=k; 
#ifdef SPIKE_RUN
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,24,result,exp_result,testnumber,uint16_t,uint16_t);
	SRAI_PRINT_RESULT_U(testnumber,op1,op2,result,exp_result,uint16_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,4,result,exp_result,testnumber,uint16_t,uint16_t);
	SRAI_PRINT_RESULT_U(testnumber,op1,op2,result,exp_result,uint16_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,31,result,exp_result,testnumber,uint16_t,uint16_t);
	SRAI_PRINT_RESULT_U(testnumber,op1,op2,result,exp_result,uint16_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,0,result,exp_result,testnumber,uint16_t,uint16_t);
	SRAI_PRINT_RESULT_U(testnumber,op1,op2,result,exp_result,uint16_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,25,result,exp_result,testnumber,uint16_t,uint16_t);
	SRAI_PRINT_RESULT_U(testnumber,op1,op2,result,exp_result,uint16_t);} 
	testnumber++;
#else
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,24,result,testnumber,uint16_t,uint16_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,4,result,testnumber,uint16_t,uint16_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,31,result,testnumber,uint16_t,uint16_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,0,result,testnumber,uint16_t,uint16_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,25,result,testnumber,uint16_t,uint16_t);}
	testnumber++;
#endif
}



void test_srai_s16_ui_type(int k)
{
volatile int testnumber=k; 
#ifdef SPIKE_RUN
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,15,result,exp_result,testnumber,int16_t,int16_t);
	SRAI_PRINT_RESULT_S(testnumber,op1,op2,result,exp_result,int16_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,27,result,exp_result,testnumber,int16_t,int16_t);
	SRAI_PRINT_RESULT_S(testnumber,op1,op2,result,exp_result,int16_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,23,result,exp_result,testnumber,int16_t,int16_t);
	SRAI_PRINT_RESULT_S(testnumber,op1,op2,result,exp_result,int16_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,6,result,exp_result,testnumber,int16_t,int16_t);
	SRAI_PRINT_RESULT_S(testnumber,op1,op2,result,exp_result,int16_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,26,result,exp_result,testnumber,int16_t,int16_t);
	SRAI_PRINT_RESULT_S(testnumber,op1,op2,result,exp_result,int16_t);} 
	testnumber++;
#else
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,15,result,testnumber,int16_t,int16_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,27,result,testnumber,int16_t,int16_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,23,result,testnumber,int16_t,int16_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,6,result,testnumber,int16_t,int16_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,26,result,testnumber,int16_t,int16_t);}
	testnumber++;
#endif
}



void test_srai_u8_ui_type(int k)
{
volatile int testnumber=k; 
#ifdef SPIKE_RUN
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,0,result,exp_result,testnumber,uint8_t,uint8_t);
	SRAI_PRINT_RESULT_U(testnumber,op1,op2,result,exp_result,uint8_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,23,result,exp_result,testnumber,uint8_t,uint8_t);
	SRAI_PRINT_RESULT_U(testnumber,op1,op2,result,exp_result,uint8_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,25,result,exp_result,testnumber,uint8_t,uint8_t);
	SRAI_PRINT_RESULT_U(testnumber,op1,op2,result,exp_result,uint8_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,20,result,exp_result,testnumber,uint8_t,uint8_t);
	SRAI_PRINT_RESULT_U(testnumber,op1,op2,result,exp_result,uint8_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,9,result,exp_result,testnumber,uint8_t,uint8_t);
	SRAI_PRINT_RESULT_U(testnumber,op1,op2,result,exp_result,uint8_t);} 
	testnumber++;
#else
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,0,result,testnumber,uint8_t,uint8_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,23,result,testnumber,uint8_t,uint8_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,25,result,testnumber,uint8_t,uint8_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,20,result,testnumber,uint8_t,uint8_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,9,result,testnumber,uint8_t,uint8_t);}
	testnumber++;
#endif
}



void test_srai_s8_ui_type(int k)
{
volatile int testnumber=k; 
#ifdef SPIKE_RUN
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,4,result,exp_result,testnumber,int8_t,int8_t);
	SRAI_PRINT_RESULT_S(testnumber,op1,op2,result,exp_result,int8_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,29,result,exp_result,testnumber,int8_t,int8_t);
	SRAI_PRINT_RESULT_S(testnumber,op1,op2,result,exp_result,int8_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,6,result,exp_result,testnumber,int8_t,int8_t);
	SRAI_PRINT_RESULT_S(testnumber,op1,op2,result,exp_result,int8_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,4,result,exp_result,testnumber,int8_t,int8_t);
	SRAI_PRINT_RESULT_S(testnumber,op1,op2,result,exp_result,int8_t);} 
	testnumber++;
{	TEST_SRAI_INSN_I_SPIKE(srai,op1,2,result,exp_result,testnumber,int8_t,int8_t);
	SRAI_PRINT_RESULT_S(testnumber,op1,op2,result,exp_result,int8_t);} 
	testnumber++;
#else
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,4,result,testnumber,int8_t,int8_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,29,result,testnumber,int8_t,int8_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,6,result,testnumber,int8_t,int8_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,4,result,testnumber,int8_t,int8_t);}
	testnumber++;
{	TEST_SRAI_INSN_I(MAILBOX1,srai,op1,2,result,testnumber,int8_t,int8_t);}
	testnumber++;
#endif
}

#endif /* UI_SRA_TEST_H */
