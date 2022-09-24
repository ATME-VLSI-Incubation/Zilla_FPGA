/*
**
*******************************************************************************
**
** Header file for creating I-Type and U-Type tests
**
** Usage : #include "ui_and_test.h"
*******************************************************************************
*/

#ifndef UI_AND_TEST_H
#define UI_AND_TEST_H

#ifdef SPIKE_RUN
#include "data.h"               /*!< Testbench created data */
#endif


int test_ui_and_type(int num)
{
volatile int testnumber=num; 
#ifdef SPIKE_RUN
	printf("\n------------------------------");
	printf("\nTest/> Instruction 8 bit: andi");
	printf("\n------------------------------\n");
#endif
#ifdef SPIKE_RUN
{	TEST_ANDI_INSN_I_SPIKE8(andi, op1, -51, result, exp_result, testnumber);
	print_test_results_andi_I8(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE8(andi, op1, -924, result, exp_result, testnumber);
	print_test_results_andi_I8(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE8(andi, op1, 1379, result, exp_result, testnumber);
	print_test_results_andi_I8(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE8(andi, op1, -2019, result, exp_result, testnumber);
	print_test_results_andi_I8(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE8(andi, op1, 1130, result, exp_result, testnumber);
	print_test_results_andi_I8(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE8(andi, op1, -137, result, exp_result, testnumber);
	print_test_results_andi_I8(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE8(andi, op1, -272, result, exp_result, testnumber);
	print_test_results_andi_I8(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE8(andi, op1, 292, result, exp_result, testnumber);
	print_test_results_andi_I8(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE8(andi, op1, 88, result, exp_result, testnumber);
	print_test_results_andi_I8(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE8(andi, op1, -716, result, exp_result, testnumber);
	print_test_results_andi_I8(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE8(andi, op1, -1807, result, exp_result, testnumber);
	print_test_results_andi_I8(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE8(andi, op1, 410, result, exp_result, testnumber);
	print_test_results_andi_I8(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE8(andi, op1, 261, result, exp_result, testnumber);
	print_test_results_andi_I8(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE8(andi, op1, 534, result, exp_result, testnumber);
	print_test_results_andi_I8(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE8(andi, op1, -393, result, exp_result, testnumber);
	print_test_results_andi_I8(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
#else
{	TEST_ANDI_INSN_I8(MAILBOX1, andi, op1, -51, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I8(MAILBOX1, andi, op1, -924, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I8(MAILBOX1, andi, op1, 1379, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I8(MAILBOX1, andi, op1, -2019, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I8(MAILBOX1, andi, op1, 1130, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I8(MAILBOX1, andi, op1, -137, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I8(MAILBOX1, andi, op1, -272, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I8(MAILBOX1, andi, op1, 292, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I8(MAILBOX1, andi, op1, 88, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I8(MAILBOX1, andi, op1, -716, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I8(MAILBOX1, andi, op1, -1807, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I8(MAILBOX1, andi, op1, 410, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I8(MAILBOX1, andi, op1, 261, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I8(MAILBOX1, andi, op1, 534, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I8(MAILBOX1, andi, op1, -393, result, testnumber);}
	testnumber++;
#endif
#ifdef SPIKE_RUN
	printf("\n------------------------------");
	printf("\nTest/> Instruction 16 bit: andi");
	printf("\n------------------------------\n");
#endif
#ifdef SPIKE_RUN
{	TEST_ANDI_INSN_I_SPIKE16(andi, op1, 2027, result, exp_result, testnumber);
	print_test_results_andi_I16(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE16(andi, op1, 1610, result, exp_result, testnumber);
	print_test_results_andi_I16(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE16(andi, op1, 883, result, exp_result, testnumber);
	print_test_results_andi_I16(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE16(andi, op1, 172, result, exp_result, testnumber);
	print_test_results_andi_I16(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE16(andi, op1, -457, result, exp_result, testnumber);
	print_test_results_andi_I16(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE16(andi, op1, 556, result, exp_result, testnumber);
	print_test_results_andi_I16(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE16(andi, op1, -1039, result, exp_result, testnumber);
	print_test_results_andi_I16(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE16(andi, op1, -1685, result, exp_result, testnumber);
	print_test_results_andi_I16(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE16(andi, op1, -1467, result, exp_result, testnumber);
	print_test_results_andi_I16(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE16(andi, op1, -537, result, exp_result, testnumber);
	print_test_results_andi_I16(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE16(andi, op1, -443, result, exp_result, testnumber);
	print_test_results_andi_I16(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE16(andi, op1, -1084, result, exp_result, testnumber);
	print_test_results_andi_I16(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE16(andi, op1, -178, result, exp_result, testnumber);
	print_test_results_andi_I16(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE16(andi, op1, -2019, result, exp_result, testnumber);
	print_test_results_andi_I16(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE16(andi, op1, -1699, result, exp_result, testnumber);
	print_test_results_andi_I16(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
#else
{	TEST_ANDI_INSN_I16(MAILBOX1, andi, op1, 2027, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I16(MAILBOX1, andi, op1, 1610, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I16(MAILBOX1, andi, op1, 883, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I16(MAILBOX1, andi, op1, 172, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I16(MAILBOX1, andi, op1, -457, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I16(MAILBOX1, andi, op1, 556, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I16(MAILBOX1, andi, op1, -1039, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I16(MAILBOX1, andi, op1, -1685, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I16(MAILBOX1, andi, op1, -1467, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I16(MAILBOX1, andi, op1, -537, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I16(MAILBOX1, andi, op1, -443, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I16(MAILBOX1, andi, op1, -1084, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I16(MAILBOX1, andi, op1, -178, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I16(MAILBOX1, andi, op1, -2019, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I16(MAILBOX1, andi, op1, -1699, result, testnumber);}
	testnumber++;
#endif
#ifdef SPIKE_RUN
	printf("\n------------------------------");
	printf("\nTest/> Instruction 32 bit: andi");
	printf("\n------------------------------\n");
#endif
#ifdef SPIKE_RUN
{	TEST_ANDI_INSN_I_SPIKE32(andi, op1, 1081, result, exp_result, testnumber);
	print_test_results_andi_I32(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE32(andi, op1, -1063, result, exp_result, testnumber);
	print_test_results_andi_I32(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE32(andi, op1, -71, result, exp_result, testnumber);
	print_test_results_andi_I32(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE32(andi, op1, -1292, result, exp_result, testnumber);
	print_test_results_andi_I32(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE32(andi, op1, -59, result, exp_result, testnumber);
	print_test_results_andi_I32(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE32(andi, op1, -138, result, exp_result, testnumber);
	print_test_results_andi_I32(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE32(andi, op1, 771, result, exp_result, testnumber);
	print_test_results_andi_I32(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE32(andi, op1, 1892, result, exp_result, testnumber);
	print_test_results_andi_I32(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE32(andi, op1, -622, result, exp_result, testnumber);
	print_test_results_andi_I32(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE32(andi, op1, -748, result, exp_result, testnumber);
	print_test_results_andi_I32(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE32(andi, op1, -1694, result, exp_result, testnumber);
	print_test_results_andi_I32(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE32(andi, op1, -1529, result, exp_result, testnumber);
	print_test_results_andi_I32(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE32(andi, op1, -1322, result, exp_result, testnumber);
	print_test_results_andi_I32(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE32(andi, op1, -1359, result, exp_result, testnumber);
	print_test_results_andi_I32(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE32(andi, op1, -240, result, exp_result, testnumber);
	print_test_results_andi_I32(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
#else
{	TEST_ANDI_INSN_I32(MAILBOX1, andi, op1, 1081, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I32(MAILBOX1, andi, op1, -1063, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I32(MAILBOX1, andi, op1, -71, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I32(MAILBOX1, andi, op1, -1292, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I32(MAILBOX1, andi, op1, -59, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I32(MAILBOX1, andi, op1, -138, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I32(MAILBOX1, andi, op1, 771, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I32(MAILBOX1, andi, op1, 1892, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I32(MAILBOX1, andi, op1, -622, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I32(MAILBOX1, andi, op1, -748, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I32(MAILBOX1, andi, op1, -1694, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I32(MAILBOX1, andi, op1, -1529, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I32(MAILBOX1, andi, op1, -1322, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I32(MAILBOX1, andi, op1, -1359, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I32(MAILBOX1, andi, op1, -240, result, testnumber);}
	testnumber++;
#endif
#ifdef SPIKE_RUN
	printf("\n------------------------------");
	printf("\nTest/> Instruction 64 bit: andi");
	printf("\n------------------------------\n");
#endif
#ifdef SPIKE_RUN
{	TEST_ANDI_INSN_I_SPIKE64(andi, op1, 1958, result, exp_result, testnumber);
	print_test_results_andi_I64(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE64(andi, op1, 163, result, exp_result, testnumber);
	print_test_results_andi_I64(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE64(andi, op1, -129, result, exp_result, testnumber);
	print_test_results_andi_I64(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE64(andi, op1, 1356, result, exp_result, testnumber);
	print_test_results_andi_I64(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE64(andi, op1, -560, result, exp_result, testnumber);
	print_test_results_andi_I64(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE64(andi, op1, 515, result, exp_result, testnumber);
	print_test_results_andi_I64(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE64(andi, op1, -1703, result, exp_result, testnumber);
	print_test_results_andi_I64(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE64(andi, op1, 540, result, exp_result, testnumber);
	print_test_results_andi_I64(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE64(andi, op1, -1837, result, exp_result, testnumber);
	print_test_results_andi_I64(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE64(andi, op1, -323, result, exp_result, testnumber);
	print_test_results_andi_I64(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE64(andi, op1, 81, result, exp_result, testnumber);
	print_test_results_andi_I64(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE64(andi, op1, -803, result, exp_result, testnumber);
	print_test_results_andi_I64(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE64(andi, op1, 1144, result, exp_result, testnumber);
	print_test_results_andi_I64(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE64(andi, op1, 520, result, exp_result, testnumber);
	print_test_results_andi_I64(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
{	TEST_ANDI_INSN_I_SPIKE64(andi, op1, -675, result, exp_result, testnumber);
	print_test_results_andi_I64(testnumber, op1, op2, result, exp_result);} 
	testnumber++;
#else
{	TEST_ANDI_INSN_I64(MAILBOX1, andi, op1, 1958, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I64(MAILBOX1, andi, op1, 163, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I64(MAILBOX1, andi, op1, -129, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I64(MAILBOX1, andi, op1, 1356, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I64(MAILBOX1, andi, op1, -560, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I64(MAILBOX1, andi, op1, 515, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I64(MAILBOX1, andi, op1, -1703, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I64(MAILBOX1, andi, op1, 540, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I64(MAILBOX1, andi, op1, -1837, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I64(MAILBOX1, andi, op1, -323, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I64(MAILBOX1, andi, op1, 81, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I64(MAILBOX1, andi, op1, -803, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I64(MAILBOX1, andi, op1, 1144, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I64(MAILBOX1, andi, op1, 520, result, testnumber);}
	testnumber++;
{	TEST_ANDI_INSN_I64(MAILBOX1, andi, op1, -675, result, testnumber);}
	testnumber++;
#endif


return testnumber;}

#endif /* UI_AND_TEST_H */
