/*
**
*******************************************************************************
**
** Header file for including custom instruction macros in test programs.
**
** You need to include this header file in your test program if you are
** accessing linker symbols.
** 
** Note: Need to modify
**
** Usage : #include "custom.h"
*******************************************************************************
*/

#ifndef CUSTOM_H
#define CUSTOM_H

#define XSTRING(x) STRING(x)
#define STRING(x) #x

/* R-Type */
#define Z_CGT   "z.cgt     %[z], %[x], %[y]\n\t"
#define Z_CGTE  "z.cgte    %[z], %[x], %[y]\n\t"
#define Z_CGTU  "z.cgtu    %[z], %[x], %[y]\n\t"
#define Z_CGTEU "z.cgteu   %[z], %[x], %[y]\n\t"
#define Z_CLT   "z.clt     %[z], %[x], %[y]\n\t"
#define Z_CLTE  "z.clte    %[z], %[x], %[y]\n\t"
#define Z_CLTU  "z.cltu    %[z], %[x], %[y]\n\t"
#define Z_CLTEU "z.clteu   %[z], %[x], %[y]\n\t"
#define Z_CEQ   "z.ceq     %[z], %[x], %[y]\n\t"
#define Z_CNE   "z.cne     %[z], %[x], %[y]\n\t"
#define Z_ROL   "z.rol     %[z], %[x], %[y]\n\t"
#define Z_ROR   "z.ror     %[z], %[x], %[y]\n\t"

/* I-Type */
#define Z_ROLI(imm)  "z.roli    %[z], %[x], " #imm "\n\t"
#define Z_RORI(imm)  "z.rori    %[z], %[x], " #imm "\n\t"

/* U-Type */
#define Z_MVIR(imm)  "z.mvir    %[z], " #imm "\n\t"
#define Z_MVIRU(imm) "z.mviru   %[z], " #imm "\n\t"

/* Macros for zilla custom instruction testing */
#define MKSTR(s) #s

//////////////////////////////////////////////////////////////////
////            R type  print                             //
//////////////////////////////////////////////////////////////////
#define print_test_results_rol(testnumber, op1, op2, result, exp_result)\
            if(result == exp_result)\
                printf ("Test imm [%3d]   rol %15ld  rol %15ld  : E res = %15ld , A res = %10ld : Status = [PASS]\n", testnumber,op1,op2,result,exp_result);\
                else \
                printf ("Test imm [%3d]   rol %15ld  rol %15ld  : E res = %15ld , A res = %10ld : Status = [FAIL]\n", testnumber,op1,op2,result,exp_result);\

#define print_test_results_rol_u(testnumber, op1, op2, result, exp_result)\
            if(result == exp_result)\
                printf ("Test imm [%3d]   rol_u %15lu  rol_u %15lu  : E res = %15lu , A res = %10lu : Status = [PASS]\n", testnumber,op1,op2,result,exp_result);\
                else \
                printf ("Test imm [%3d]   rol_u %15lu  rol_u %15lu  : E res = %15lu , A res = %10lu : Status = [FAIL]\n", testnumber,op1,op2,result,exp_result);\

#define print_test_results_ror(testnumber, op1, op2, result, exp_result)\
            if(result == exp_result)\
                printf ("Test imm [%3d]   ror %15ld  ror %15ld  : E res = %15ld , A res = %10ld : Status = [PASS]\n", testnumber,op1,op2,result,exp_result);\
                else \
                printf ("Test imm [%3d]   ror %15ld  ror %15ld  : E res = %15ld , A res = %10ld : Status = [FAIL]\n", testnumber,op1,op2,result,exp_result);\

#define print_test_results_ror_u(testnumber, op1, op2, result, exp_result)\
            if(result == exp_result)\
                printf ("Test imm [%3d]   ror_u %15lu  ror_u %15lu  : E res = %15lu , A res = %10lu : Status = [PASS]\n", testnumber,op1,op2,result,exp_result);\
                else \
                printf ("Test imm [%3d]   ror_u %15lu  ror_u %15lu  : E res = %15lu , A res = %10lu : Status = [FAIL]\n", testnumber,op1,op2,result,exp_result);\

#define print_test_results_cgt(testnumber, op1, op2, result, exp_result)\
            if(result == exp_result)\
                printf ("Test imm [%3d]   cgt %15ld  cgt %15ld  : E res = %15ld , A res = %10ld : Status = [PASS]\n", testnumber,op1,op2,result,exp_result);\
                else \
                printf ("Test imm [%3d]   cgt %15ld  cgt %15ld  : E res = %15ld , A res = %10ld : Status = [FAIL]\n", testnumber,op1,op2,result,exp_result);\

 #define print_test_results_cgte(testnumber, op1, op2, result, exp_result)\
            if(result == exp_result)\
                printf ("Test imm [%3d]   cgte %15ld  cgte %15ld  : E res = %15ld , A res = %10ld : Status = [PASS]\n", testnumber,op1,op2,result,exp_result);\
                else \
                printf ("Test imm [%3d]   cgte %15ld  cgte %15ld  : E res = %15ld , A res = %10ld : Status = [FAIL]\n", testnumber,op1,op2,result,exp_result);\                   

#define print_test_results_cgtu(testnumber, op1, op2, result, exp_result)\
            if(result == exp_result)\
                printf ("Test imm [%3d]   cgtu %15lu  cgtu %15lu  : E res = %15lu , A res = %10lu : Status = [PASS]\n", testnumber,op1,op2,result,exp_result);\
                else \
                printf ("Test imm [%3d]   cgtu %15lu  cgtu %15lu  : E res = %15lu , A res = %10lu : Status = [FAIL]\n", testnumber,op1,op2,result,exp_result);\

#define print_test_results_cgteu(testnumber, op1, op2, result, exp_result)\
            if(result == exp_result)\
                printf ("Test imm [%3d]   cgteu %15lu  cgteu %15lu  : E res = %15lu , A res = %10lu : Status = [PASS]\n", testnumber,op1,op2,result,exp_result);\
                else \
                printf ("Test imm [%3d]   cgteu %15lu  cgteu %15lu  : E res = %15lu , A res = %10lu : Status = [FAIL]\n", testnumber,op1,op2,result,exp_result);\

#define print_test_results_clt(testnumber, op1, op2, result, exp_result)\
            if(result == exp_result)\
                printf ("Test imm [%3d]   clt %15ld  clt %15ld  : E res = %15ld , A res = %10ld : Status = [PASS]\n", testnumber,op1,op2,result,exp_result);\
                else \
                printf ("Test imm [%3d]   clt  %15ld  clt %15ld  : E res = %15ld , A res = %10ld : Status = [FAIL]\n", testnumber,op1,op2,result,exp_result);\ 

#define print_test_results_clte(testnumber, op1, op2, result, exp_result)\
            if(result == exp_result)\
                printf ("Test imm [%3d]   clte %15ld  clte %15ld  : E res = %15ld , A res = %10ld : Status = [PASS]\n", testnumber,op1,op2,result,exp_result);\
                else \
                printf ("Test imm [%3d]   clte %15ld  clte %15ld  : E res = %15ld , A res = %10ld : Status = [FAIL]\n", testnumber,op1,op2,result,exp_result);\

#define print_test_results_cltu(testnumber, op1, op2, result, exp_result)\
            if(result == exp_result)\
                printf ("Test imm [%3d]   cltu %15lu  cltu %15lu  : E res = %15lu , A res = %10lu : Status = [PASS]\n", testnumber,op1,op2,result,exp_result);\
                else \
                printf ("Test imm [%3d]   cltu %15lu  cltu %15lu  : E res = %15lu , A res = %10lu : Status = [FAIL]\n", testnumber,op1,op2,result,exp_result);\

#define print_test_results_clteu(testnumber, op1, op2, result, exp_result)\
            if(result == exp_result)\
                printf ("Test imm [%3d]   clteu %15lu  clteu %15lu  : E res = %15lu , A res = %10lu : Status = [PASS]\n", testnumber,op1,op2,result,exp_result);\
                else \
                printf ("Test imm [%3d]   clteu %15lu  clteu %15lu  : E res = %15lu , A res = %10lu : Status = [FAIL]\n", testnumber,op1,op2,result,exp_result);\

#define print_test_results_ceq(testnumber, op1, op2, result, exp_result)\
            if(result == exp_result)\
                printf ("Test imm [%3d]   ceq %15ld  ceq %15ld  : E res = %15ld , A res = %10ld : Status = [PASS]\n", testnumber,op1,op2,result,exp_result);\
                else \
                printf ("Test imm [%3d]   ceq %15ld  ceq %15ld  : E res = %15ld, A res = %10ld : Status = [FAIL]\n", testnumber,op1,op2,result,exp_result);\

#define print_test_results_cne(testnumber, op1, op2, result, exp_result)\
            if(result == exp_result)\
                printf ("Test imm [%3d]   cne %15ld  cne %15ld  : E res = %15lu , A res = %10ld : Status = [PASS]\n", testnumber,op1,op2,result,exp_result);\
                else \
                printf ("Test imm [%3d]   cne %15ld  cne %15ld  : E res = %15lu , A res = %10ld : Status = [FAIL]\n", testnumber,op1,op2,result,exp_result);\




//////////////////////////////////////////////////////////////////
////            I type print                             //
//////////////////////////////////////////////////////////////////

#define print_test_results_roli(testnumber, op1, imm, result, exp_result)\
            if(result == exp_result)\
                printf ("Test imm [%3d]   roli %15lu  imm %15ld  : E res = %15lu , A res = %10lu : Status = [PASS]\n", testnumber,op1,op2,result,exp_result);\
                else \
                printf ("Test imm [%3d]   roli %15lu  imm %15ld  : E res = %15lu , A res = %10lu : Status = [FAIL]\n", testnumber,op1,op2,result,exp_result);\

#define print_test_results_rori(testnumber, op1, imm, result, exp_result)\
            if(result == exp_result)\
                printf ("Test imm [%3d]   rori %15lu  imm %15ld  : E res = %15lu , A res = %10lu : Status = [PASS]\n", testnumber,op1,op2,result,exp_result);\
                else \
                printf ("Test imm [%3d]   rori %15lu  imm %15ld  : E res = %15lu , A res = %10lu : Status = [FAIL]\n", testnumber,op1,op2,result,exp_result);\


//////////////////////////////////////////////////////////////////
////            U type print                             //
//////////////////////////////////////////////////////////////////

#define print_test_results_mvir(testnumber, imm, result, exp_result)\
            if(result == exp_result)\
                printf ("Test imm [%3d]   mvir imm %15d  : E res = %15ld , A res = %10ld : Status = [PASS]\n", testnumber,op1,result,exp_result);\
                else \
                printf ("Test imm [%3d]   mvir imm %15d  : E res = %15ld , A res = %10ld : Status = [FAIL]\n", testnumber,op1,result,exp_result);\

#define print_test_results_mviru(testnumber, imm, result, exp_result)\
            if(result == exp_result)\
                printf ("Test imm [%3d]   mviru imm %15lu  : E res = %15lu , A res = %10lu : Status = [PASS]\n", testnumber,op1,result,exp_result);\
                else \
                printf ("Test imm [%3d]   mviru imm %15lu  : E res = %15lu , A res = %10lu : Status = [FAIL]\n", testnumber,op1,result,exp_result);\




/* Macros for R-Type instruction test */
//8 bit//
#define TEST_CUSTOM_INSN_R8(mb, insn, op1, op2, result, tn) \
		int8_t op1, op2; \
	        int8_t result; \
                op1 = (int8_t)generate_random_num(mb); \
                op2 = (int8_t)generate_random_num(mb); \
 		asm volatile (#insn "     %[z], %[x], %[y]\n\t" : [z] "=r" (result) : [x] "r" (op1), [y] "r" (op2)); \
		actual_result[(tn-1)*3 + 0] = op1; \
                actual_result[(tn-1)*3 + 1] = op2; \
                actual_result[(tn-1)*3 + 2] = result; \

//8 bit unsigned//
#define TEST_CUSTOM_INSN_R8_U(mb, insn, op1, op2, result, tn) \
		uint8_t op1, op2; \
	        uint8_t result; \
                op1 = (uint8_t)generate_random_num(mb); \
                op2 = (uint8_t)generate_random_num(mb); \
 		asm volatile (#insn "     %[z], %[x], %[y]\n\t" : [z] "=r" (result) : [x] "r" (op1), [y] "r" (op2)); \
		actual_result[(tn-1)*3 + 0] = op1; \
                actual_result[(tn-1)*3 + 1] = op2; \
                actual_result[(tn-1)*3 + 2] = result; \

//16 bit//
#define TEST_CUSTOM_INSN_R16(mb, insn, op1, op2, result, tn) \
		int16_t op1, op2; \
	        int16_t result; \
                op1 = (int16_t)generate_random_num(mb); \
                op2 = (int16_t)generate_random_num(mb); \
 		asm volatile (#insn "     %[z], %[x], %[y]\n\t" : [z] "=r" (result) : [x] "r" (op1), [y] "r" (op2)); \
		actual_result[(tn-1)*3 + 0] = op1; \
                actual_result[(tn-1)*3 + 1] = op2; \
                actual_result[(tn-1)*3 + 2] = result; \


//16 bit unsigned//
#define TEST_CUSTOM_INSN_R16_U(mb, insn, op1, op2, result, tn) \
		uint16_t op1, op2; \
	        uint16_t result; \
                op1 = (uint16_t)generate_random_num(mb); \
                op2 = (uint16_t)generate_random_num(mb); \
 		asm volatile (#insn "     %[z], %[x], %[y]\n\t" : [z] "=r" (result) : [x] "r" (op1), [y] "r" (op2)); \
		actual_result[(tn-1)*3 + 0] = op1; \
                actual_result[(tn-1)*3 + 1] = op2; \
                actual_result[(tn-1)*3 + 2] = result; \

//32 bit//
#define TEST_CUSTOM_INSN_R32(mb, insn, op1, op2, result, tn) \
		int32_t op1, op2; \
	        int32_t result; \
                op1 = (int32_t)generate_random_num(mb); \
                op2 = (int32_t)generate_random_num(mb); \
 		asm volatile (#insn "     %[z], %[x], %[y]\n\t" : [z] "=r" (result) : [x] "r" (op1), [y] "r" (op2)); \
		actual_result[(tn-1)*3 + 0] = op1; \
                actual_result[(tn-1)*3 + 1] = op2; \
                actual_result[(tn-1)*3 + 2] = result; \


//32 bit unsigned//
#define TEST_CUSTOM_INSN_R32_U(mb, insn, op1, op2, result, tn) \
		uint32_t op1, op2; \
	        uint32_t result; \
                op1 = (uint32_t)generate_random_num(mb); \
                op2 = (uint32_t)generate_random_num(mb); \
 		asm volatile (#insn "     %[z], %[x], %[y]\n\t" : [z] "=r" (result) : [x] "r" (op1), [y] "r" (op2)); \
		actual_result[(tn-1)*3 + 0] = op1; \
                actual_result[(tn-1)*3 + 1] = op2; \
                actual_result[(tn-1)*3 + 2] = result; \

//64 bit//
#define TEST_CUSTOM_INSN_R(mb, insn, op1, op2, result, tn) \
		int64_t op1, op2; \
	        int64_t result; \
                op1 = (int64_t)generate_random_num(mb); \
                op2 = (int64_t)generate_random_num(mb); \
 		asm volatile (#insn "     %[z], %[x], %[y]\n\t" : [z] "=r" (result) : [x] "r" (op1), [y] "r" (op2)); \
		actual_result[(tn-1)*3 + 0] = op1; \
                actual_result[(tn-1)*3 + 1] = op2; \
                actual_result[(tn-1)*3 + 2] = result; \


//64 bit unsigned//
#define TEST_CUSTOM_INSN_R_U(mb, insn, op1, op2, result, tn) \
		uint64_t op1, op2; \
	        uint64_t result; \
                op1 = (uint64_t)generate_random_num(mb); \
                op2 = (uint64_t)generate_random_num(mb); \
 		asm volatile (#insn "     %[z], %[x], %[y]\n\t" : [z] "=r" (result) : [x] "r" (op1), [y] "r" (op2)); \
		actual_result[(tn-1)*3 + 0] = op1; \
                actual_result[(tn-1)*3 + 1] = op2; \
                actual_result[(tn-1)*3 + 2] = result; \




/* Macros for R-Type instruction test (spike)*/
//8bit//
#define TEST_CUSTOM_INSN_R8_SPIKE(insn, op1, op2, result, exp_result, tn) \
		int8_t op1, op2; \
	        int8_t result; \
		int8_t exp_result; \
                op1        = (int8_t)data[(tn-1)*3 + 0]; \
                op2        = (int8_t)data[(tn-1)*3 + 1]; \
		result     = data[(tn-1)*3 + 2]; \
 		asm volatile (#insn "     %[z], %[x], %[y]\n\t" : [z] "=r" (exp_result) : [x] "r" (op1), [y] "r" (op2));

//8bit unsigned//
#define TEST_CUSTOM_INSN_R8_SPIKE_U(insn, op1, op2, result, exp_result, tn) \
		uint8_t op1, op2; \
	        uint8_t result; \
		uint8_t exp_result; \
                op1        = (uint8_t)data[(tn-1)*3 + 0]; \
                op2        = (uint8_t)data[(tn-1)*3 + 1]; \
		result     = data[(tn-1)*3 + 2]; \
 		asm volatile (#insn "     %[z], %[x], %[y]\n\t" : [z] "=r" (exp_result) : [x] "r" (op1), [y] "r" (op2));

//16 bit//
#define TEST_CUSTOM_INSN_R16_SPIKE(insn, op1, op2, result, exp_result, tn) \
		int16_t op1, op2; \
	        int16_t result; \
		int16_t exp_result; \
                op1        = (int16_t)data[(tn-1)*3 + 0]; \
                op2        = (int16_t)data[(tn-1)*3 + 1]; \
		result     = data[(tn-1)*3 + 2]; \
 		asm volatile (#insn "     %[z], %[x], %[y]\n\t" : [z] "=r" (exp_result) : [x] "r" (op1), [y] "r" (op2));

//16 bit unsigned//
#define TEST_CUSTOM_INSN_R16_SPIKE_U(insn, op1, op2, result, exp_result, tn) \
		uint16_t op1, op2; \
	        uint16_t result; \
		uint16_t exp_result; \
                op1        = (uint16_t)data[(tn-1)*3 + 0]; \
                op2        = (uint16_t)data[(tn-1)*3 + 1]; \
		result     = data[(tn-1)*3 + 2]; \
 		asm volatile (#insn "     %[z], %[x], %[y]\n\t" : [z] "=r" (exp_result) : [x] "r" (op1), [y] "r" (op2));


//32 bit//
#define TEST_CUSTOM_INSN_R32_SPIKE(insn, op1, op2, result, exp_result, tn) \
		int32_t op1, op2; \
	        int32_t result; \
		int32_t exp_result; \
                op1        = (int32_t)data[(tn-1)*3 + 0]; \
                op2        = (int32_t)data[(tn-1)*3 + 1]; \
		result     = data[(tn-1)*3 + 2]; \
 		asm volatile (#insn "     %[z], %[x], %[y]\n\t" : [z] "=r" (exp_result) : [x] "r" (op1), [y] "r" (op2));

//32 bit unsigned//
#define TEST_CUSTOM_INSN_R32_SPIKE_U(insn, op1, op2, result, exp_result, tn) \
		uint32_t op1, op2; \
	        uint32_t result; \
		uint32_t exp_result; \
                op1        = (uint32_t)data[(tn-1)*3 + 0]; \
                op2        = (uint32_t)data[(tn-1)*3 + 1]; \
		result     = data[(tn-1)*3 + 2]; \
 		asm volatile (#insn "     %[z], %[x], %[y]\n\t" : [z] "=r" (exp_result) : [x] "r" (op1), [y] "r" (op2));

//64 bit//
#define TEST_CUSTOM_INSN_R_SPIKE(insn, op1, op2, result, exp_result, tn) \
		int64_t op1, op2; \
	        int64_t result; \
		int64_t exp_result; \
                op1        = (int64_t)data[(tn-1)*3 + 0]; \
                op2        = (int64_t)data[(tn-1)*3 + 1]; \
		result     = data[(tn-1)*3 + 2]; \
 		asm volatile (#insn "     %[z], %[x], %[y]\n\t" : [z] "=r" (exp_result) : [x] "r" (op1), [y] "r" (op2));

//64 bit unsigned//
#define TEST_CUSTOM_INSN_R_SPIKE_U(insn, op1, op2, result, exp_result, tn) \
		uint64_t op1, op2; \
	        uint64_t result; \
		uint64_t exp_result; \
                op1        = (uint64_t)data[(tn-1)*3 + 0]; \
                op2        = (uint64_t)data[(tn-1)*3 + 1]; \
		result     = data[(tn-1)*3 + 2]; \
 		asm volatile (#insn "     %[z], %[x], %[y]\n\t" : [z] "=r" (exp_result) : [x] "r" (op1), [y] "r" (op2));




/* Macros for I-Type instruction test */
//8 bit//


//8 bit//
#define TEST_CUSTOM_INSN_I8(mb, insn, op1, imm, result, tn) \
		uint8_t op1;\
        int32_t op2; \
	        uint8_t result; \
                op1 = (uint8_t)generate_random_num(mb); \
                op2 = imm; \
		asm volatile (#insn "    %[z], %[x], " #imm "\n\t"  : [z] "=r" (result) : [x] "r" (op1) ) ; \
                actual_result[(tn-1)*3 + 0] = op1; \
                actual_result[(tn-1)*3 + 1] = op2; \
                actual_result[(tn-1)*3 + 2] = result;

//16 bit//
#define TEST_CUSTOM_INSN_I16(mb, insn, op1, imm, result, tn) \
		uint16_t op1;\
         int32_t op2; \
	        uint16_t result; \
                op1 = (uint16_t)generate_random_num(mb); \
                op2 = imm; \
		asm volatile (#insn "    %[z], %[x], " #imm "\n\t"  : [z] "=r" (result) : [x] "r" (op1) ) ; \
                actual_result[(tn-1)*3 + 0] = op1; \
                actual_result[(tn-1)*3 + 1] = op2; \
                actual_result[(tn-1)*3 + 2] = result;

//32 bit//
#define TEST_CUSTOM_INSN_I32(mb, insn, op1, imm, result, tn) \
		uint32_t op1;\
         int32_t op2; \
	        uint32_t result; \
                op1 = (uint32_t)generate_random_num(mb); \
                op2 = imm; \
		asm volatile (#insn "    %[z], %[x], " #imm "\n\t"  : [z] "=r" (result) : [x] "r" (op1) ) ; \
                actual_result[(tn-1)*3 + 0] = op1; \
                actual_result[(tn-1)*3 + 1] = op2; \
                actual_result[(tn-1)*3 + 2] = result;

//64 bit//
#define TEST_CUSTOM_INSN_I64(mb, insn, op1, imm, result, tn) \
		uint64_t op1; \
	        int32_t op2; \
            uint64_t result; \
                op1 = (uint64_t)generate_random_num(mb); \
                op2 = imm; \
		asm volatile (#insn "    %[z], %[x], " #imm "\n\t"  : [z] "=r" (result) : [x] "r" (op1) ) ; \
                actual_result[(tn-1)*3 + 0] = op1; \
                actual_result[(tn-1)*3 + 1] = op2; \
                actual_result[(tn-1)*3 + 2] = result;


/* Macros for I-Type instruction test (SPIKE) */

//8 bit//
#define TEST_CUSTOM_INSN_I8_SPIKE(insn, op1, imm, result, exp_result, tn) \
		uint8_t op1;\
         int32_t op2; \
	        uint8_t result; \
		uint8_t exp_result; \
                op1        = data[(tn-1)*3 + 0]; \
                op2        = data[(tn-1)*3 + 1]; \
		result     = data[(tn-1)*3 + 2]; \
		asm volatile (#insn "    %[z], %[x], " #imm "\n\t"  : [z] "=r" (exp_result) : [x] "r" (op1) ) ; 

//16 bit//
#define TEST_CUSTOM_INSN_I16_SPIKE(insn, op1, imm, result, exp_result, tn) \
		uint16_t op1;\
         int32_t op2; \
	        uint16_t result; \
		uint16_t exp_result; \
                op1        = data[(tn-1)*3 + 0]; \
                op2        = data[(tn-1)*3 + 1]; \
		result     = data[(tn-1)*3 + 2]; \
		asm volatile (#insn "    %[z], %[x], " #imm "\n\t"  : [z] "=r" (exp_result) : [x] "r" (op1) ) ; 

//32 bit//
#define TEST_CUSTOM_INSN_I32_SPIKE(insn, op1, imm, result, exp_result, tn) \
		uint32_t op1;\
         int32_t op2; \
	        uint32_t result; \
		uint32_t exp_result; \
                op1        = data[(tn-1)*3 + 0]; \
                op2        = data[(tn-1)*3 + 1]; \
		result     = data[(tn-1)*3 + 2]; \
		asm volatile (#insn "    %[z], %[x], " #imm "\n\t"  : [z] "=r" (exp_result) : [x] "r" (op1) ) ; 

//64 bit//
#define TEST_CUSTOM_INSN_I64_SPIKE(insn, op1, imm, result, exp_result, tn) \
		uint64_t op1; \
         int32_t op2; \
	        uint64_t result; \
		uint64_t exp_result; \
                op1        = data[(tn-1)*3 + 0]; \
                op2        = data[(tn-1)*3 + 1]; \
		result     = data[(tn-1)*3 + 2]; \
		asm volatile (#insn "    %[z], %[x], " #imm "\n\t"  : [z] "=r" (exp_result) : [x] "r" (op1) ) ; 


/* Macros for U-Type instruction test */

//signed Instructions
#define TEST_CUSTOM_INSN_U(insn, imm, result, tn) \
		int64_t op1; \
	        int64_t result; \
                op1 = imm; \
		asm volatile (#insn "    %[z], " #imm "\n\t" : [z] "=r" (result)); \
                actual_result[(tn-1)*3 + 0] = op1; \
                actual_result[(tn-1)*3 + 2] = result;


//unsigned Instructions
#define TEST_CUSTOM_INSN_U_U(insn, imm, result, tn) \
		uint64_t op1; \
	        uint64_t result; \
                op1 = imm; \
		asm volatile (#insn "    %[z], " #imm "\n\t" : [z] "=r" (result)); \
                actual_result[(tn-1)*3 + 0] = op1; \
                actual_result[(tn-1)*3 + 2] = result;



/* Macros for U-Type instruction test (SPIKE) */

//signed instructions
#define TEST_CUSTOM_INSN_U_SPIKE(insn, imm, result, exp_result, tn) \
		int64_t op1; \
	        int64_t result; \
		int64_t exp_result; \
                op1        = data[(tn-1)*3 + 0]; \
		result     = data[(tn-1)*3 + 2]; \
		asm volatile (#insn "    %[z], " #imm "\n\t" : [z] "=r" (exp_result)); \

//unsigned instructions
#define TEST_CUSTOM_INSN_U_SPIKE_U(insn, imm, result, exp_result, tn) \
		uint64_t op1; \
	        uint64_t result; \
		uint64_t exp_result; \
                op1        = data[(tn-1)*3 + 0]; \
		result     = data[(tn-1)*3 + 2]; \
		asm volatile (#insn "    %[z], " #imm "\n\t" : [z] "=r" (exp_result)); \



#endif /* CUSTOM_H */










