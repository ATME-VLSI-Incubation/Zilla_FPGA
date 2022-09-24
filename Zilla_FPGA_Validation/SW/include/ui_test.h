/*
**
*******************************************************************************
**
** Header file for creating I-Type and U-Type tests
**
** Usage : #include "ui_test.h"
*******************************************************************************
*/

#ifndef UI_TEST_H
#define UI_TEST_H

#ifdef SPIKE_RUN
#include "data.h"               /*!< Testbench created data */
#endif


void test_ui_type(void)
{
#ifdef SPIKE_RUN
	printf("\n------------------------------");
	printf("\nTest/> Instruction 64 bit: addi");
	printf("\n------------------------------\n");
#endif
volatile int testnumber=1; 
#ifdef SPIKE_RUN
{	TEST_ADDI_INSN_I_SPIKE(addi, op1, 20, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDI_INSN_I_SPIKE(addi, op1, 49, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDI_INSN_I_SPIKE(addi, op1, 50, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDI_INSN_I_SPIKE(addi, op1, 21, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDI_INSN_I_SPIKE(addi, op1, 37, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDI_INSN_I_SPIKE(addi, op1, 41, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDI_INSN_I_SPIKE(addi, op1, 47, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDI_INSN_I_SPIKE(addi, op1, 23, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDI_INSN_I_SPIKE(addi, op1, 30, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDI_INSN_I_SPIKE(addi, op1, 0, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDI_INSN_I_SPIKE(addi, op1, 12, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDI_INSN_I_SPIKE(addi, op1, 25, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDI_INSN_I_SPIKE(addi, op1, 63, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDI_INSN_I_SPIKE(addi, op1, 6, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDI_INSN_I_SPIKE(addi, op1, 25, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
#else
{	TEST_ADDI_INSN_I(MAILBOX1, addi, op1, 20, result, testnumber);}
	testnumber++;
{	TEST_ADDI_INSN_I(MAILBOX1, addi, op1, 49, result, testnumber);}
	testnumber++;
{	TEST_ADDI_INSN_I(MAILBOX1, addi, op1, 50, result, testnumber);}
	testnumber++;
{	TEST_ADDI_INSN_I(MAILBOX1, addi, op1, 21, result, testnumber);}
	testnumber++;
{	TEST_ADDI_INSN_I(MAILBOX1, addi, op1, 37, result, testnumber);}
	testnumber++;
{	TEST_ADDI_INSN_I(MAILBOX1, addi, op1, 41, result, testnumber);}
	testnumber++;
{	TEST_ADDI_INSN_I(MAILBOX1, addi, op1, 47, result, testnumber);}
	testnumber++;
{	TEST_ADDI_INSN_I(MAILBOX1, addi, op1, 23, result, testnumber);}
	testnumber++;
{	TEST_ADDI_INSN_I(MAILBOX1, addi, op1, 30, result, testnumber);}
	testnumber++;
{	TEST_ADDI_INSN_I(MAILBOX1, addi, op1, 0, result, testnumber);}
	testnumber++;
{	TEST_ADDI_INSN_I(MAILBOX1, addi, op1, 12, result, testnumber);}
	testnumber++;
{	TEST_ADDI_INSN_I(MAILBOX1, addi, op1, 25, result, testnumber);}
	testnumber++;
{	TEST_ADDI_INSN_I(MAILBOX1, addi, op1, 63, result, testnumber);}
	testnumber++;
{	TEST_ADDI_INSN_I(MAILBOX1, addi, op1, 6, result, testnumber);}
	testnumber++;
{	TEST_ADDI_INSN_I(MAILBOX1, addi, op1, 25, result, testnumber);}
	testnumber++;
#endif
#ifdef SPIKE_RUN
	printf("\n------------------------------");
	printf("\nTest/> Instruction 32 bit: addiw");
	printf("\n------------------------------\n");
#endif
#ifdef SPIKE_RUN
{	TEST_ADDIW_INSN_I_SPIKE(addi, op1, 28, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDIW_INSN_I_SPIKE(addi, op1, 29, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDIW_INSN_I_SPIKE(addi, op1, 4, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDIW_INSN_I_SPIKE(addi, op1, 14, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDIW_INSN_I_SPIKE(addi, op1, 21, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDIW_INSN_I_SPIKE(addi, op1, 7, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDIW_INSN_I_SPIKE(addi, op1, 4, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDIW_INSN_I_SPIKE(addi, op1, 20, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDIW_INSN_I_SPIKE(addi, op1, 12, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDIW_INSN_I_SPIKE(addi, op1, 30, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDIW_INSN_I_SPIKE(addi, op1, 23, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDIW_INSN_I_SPIKE(addi, op1, 3, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDIW_INSN_I_SPIKE(addi, op1, 20, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDIW_INSN_I_SPIKE(addi, op1, 3, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ADDIW_INSN_I_SPIKE(addi, op1, 28, result, exp_result, testnumber);
	print_test_results_I(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
#else
{	TEST_ADDIW_INSN_I(MAILBOX1, addi, op1, 28, result, testnumber);}
	testnumber++;
{	TEST_ADDIW_INSN_I(MAILBOX1, addi, op1, 29, result, testnumber);}
	testnumber++;
{	TEST_ADDIW_INSN_I(MAILBOX1, addi, op1, 4, result, testnumber);}
	testnumber++;
{	TEST_ADDIW_INSN_I(MAILBOX1, addi, op1, 14, result, testnumber);}
	testnumber++;
{	TEST_ADDIW_INSN_I(MAILBOX1, addi, op1, 21, result, testnumber);}
	testnumber++;
{	TEST_ADDIW_INSN_I(MAILBOX1, addi, op1, 7, result, testnumber);}
	testnumber++;
{	TEST_ADDIW_INSN_I(MAILBOX1, addi, op1, 4, result, testnumber);}
	testnumber++;
{	TEST_ADDIW_INSN_I(MAILBOX1, addi, op1, 20, result, testnumber);}
	testnumber++;
{	TEST_ADDIW_INSN_I(MAILBOX1, addi, op1, 12, result, testnumber);}
	testnumber++;
{	TEST_ADDIW_INSN_I(MAILBOX1, addi, op1, 30, result, testnumber);}
	testnumber++;
{	TEST_ADDIW_INSN_I(MAILBOX1, addi, op1, 23, result, testnumber);}
	testnumber++;
{	TEST_ADDIW_INSN_I(MAILBOX1, addi, op1, 3, result, testnumber);}
	testnumber++;
{	TEST_ADDIW_INSN_I(MAILBOX1, addi, op1, 20, result, testnumber);}
	testnumber++;
{	TEST_ADDIW_INSN_I(MAILBOX1, addi, op1, 3, result, testnumber);}
	testnumber++;
{	TEST_ADDIW_INSN_I(MAILBOX1, addi, op1, 28, result, testnumber);}
	testnumber++;
#endif
}

#endif /* UI_TEST_H */
