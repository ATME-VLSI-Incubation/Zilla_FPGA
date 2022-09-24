// Copyright © 2021 Vivartan Technologies., All rights reserved.
// 
// All works published under Zilla_Gen_0 by the Vivartan Technologies. 
// is copyrighted by the Association and ownership of all right, title and interest
// in and to the works remains with Vivartan Technologies.
// 
// No works or documents published under Zilla_Gen_0 by Vivartan Technologies. may be reproduced,
// transmitted or copied without the express written permission of Vivartan Technologies.
// will be considered as a violations of Copyright Act and it may lead to legal action.


#ifndef TRAPAPI_H
#define TRAPAPI_H

#include "print.h"    /* Mailbox print library  */
#include "mailbox.h"  /* Linker symbols library */
#include "stdio.h"  //in c 
#include "testmacro.h"
#include "irq_api.h"

#define csr_asm_rs(inst,rd,imm,imm1)\
        asm volatile (#inst "    %[z], "#imm", "#imm1"\n\t"  : [z] "=r" (rd) ) ;


#define store_asm(inst,rs2,imm,rs1)\
        asm volatile (#inst "    %[z], "#imm"(%[x])\n\t"  :  : [z] "r" (rs2) , [x] "r" (rs1)) ;

#define csr_asm_rs_rd(inst,rd,imm,rs)\
        asm volatile (#inst "    %[z], "#imm", %[x] \n\t"  : [z] "=r" (rd) : [x] "r" (rs) ) ;

#define TRAP_ENTRY asm volatile("addi sp, sp, -144");  \
                   asm volatile("sd x1,  0(sp) ");     \
                   asm volatile("sd x5,  8(sp) ");     \
                   asm volatile("sd x6,  16(sp) ");    \
                   asm volatile("sd x7,  24(sp)");     \
                   asm volatile("sd x10, 32(sp)");     \
                   asm volatile("sd x11, 40(sp)");     \
                   asm volatile("sd x12, 48(sp)");     \
                   asm volatile("sd x13, 56(sp)");     \
                   asm volatile("sd x14, 64(sp)");     \
                   asm volatile("sd x15, 72(sp)");     \
                   asm volatile("sd x16, 80(sp)");     \
                   asm volatile("sd x17, 88(sp)");     \
                   asm volatile("sd x28, 96(sp)");     \
                   asm volatile("sd x29, 104(sp)");    \
                   asm volatile("sd x30, 112(sp)");    \
                   asm volatile("sd x31, 120(sp)");    \
                   asm volatile("csrrsi a6,834,0");    \
                   asm volatile("sd a6,128(sp) ");     \
                   asm volatile("csrrsi a5,833,0");    \
                   asm volatile("sd a5,136(sp) ");     \
                   asm volatile("csrrsi x0,768,8");   //Global Interrupt Enable -- MSTATUS REGISTER : 0x300


// Macro for TRAP EXIT
#define TRAP_EXIT  asm volatile("csrrci x0,768,8");     \
                   asm volatile("ld a6, 128(sp)");      \
                   asm volatile("csrrw a0, mcause, a6");  \
                   asm volatile("ld a5, 136(sp)");      \
                   asm volatile("csrrw a0, mepc, a5");  \
                   asm volatile("ld x1,  0(sp) ");      \
                   asm volatile("ld x5,  8(sp) ");      \
                   asm volatile("ld x6,  16(sp) ");     \
                   asm volatile("ld x7,  24(sp)");      \
                   asm volatile("ld x10, 32(sp)");      \
                   asm volatile("ld x11, 40(sp)");      \
                   asm volatile("ld x12, 48(sp)");      \
                   asm volatile("ld x13, 56(sp)");      \
                   asm volatile("ld x14, 64(sp)");      \
                   asm volatile("ld x15, 72(sp)");      \
                   asm volatile("ld x16, 80(sp)");      \
                   asm volatile("ld x17, 88(sp)");      \
                   asm volatile("ld x28, 96(sp)");      \
                   asm volatile("ld x29, 104(sp)");     \
                   asm volatile("ld x30, 112(sp)");     \
                   asm volatile("ld x31, 120(sp)");     \
                   asm volatile("addi sp, sp, 144");    \
                   asm volatile("mret");

//Load : opcode ,rd, offset(rs1) : rs1+immediate is address
//Immediate value - can be made unaligned to cause exception
#define GEN_INT(INT_NO)\
             irq_asserted = 0;\
             generate_IRQ(MAILBOX1, INT_NO);\
             while(irq_asserted != 1);

#define INT_DESCENDING \
  GEN_INT(IRQ_GEN_46);\
  GEN_INT(IRQ_GEN_45);\
  GEN_INT(IRQ_GEN_44);\
  GEN_INT(IRQ_GEN_43); \
  GEN_INT(IRQ_GEN_42);\
  GEN_INT(IRQ_GEN_41);\
  GEN_INT(IRQ_GEN_40);\
  GEN_INT(IRQ_GEN_39);\
  GEN_INT(IRQ_GEN_38);\
  GEN_INT(IRQ_GEN_37);\
  GEN_INT(IRQ_GEN_36);\
  GEN_INT(IRQ_GEN_35);\
  GEN_INT(IRQ_GEN_34);\
  GEN_INT(IRQ_GEN_33);\
  GEN_INT(IRQ_GEN_32);\
  GEN_INT(IRQ_GEN_31);\
  GEN_INT(IRQ_GEN_30);\
  GEN_INT(IRQ_GEN_29);\
  GEN_INT(IRQ_GEN_28);\
  GEN_INT(IRQ_GEN_27);\
  GEN_INT(IRQ_GEN_26);\
  GEN_INT(IRQ_GEN_25);\
  GEN_INT(IRQ_GEN_24);\
  GEN_INT(IRQ_GEN_23);\
  GEN_INT(IRQ_GEN_22);\
  GEN_INT(IRQ_GEN_21);\
  GEN_INT(IRQ_GEN_20);\
  GEN_INT(IRQ_GEN_19);\
  GEN_INT(IRQ_GEN_18);\
  GEN_INT(IRQ_GEN_17);\
  GEN_INT(IRQ_GEN_16);\
  GEN_INT(IRQ_GEN_15);\
  GEN_INT(IRQ_GEN_14);\
  GEN_INT(IRQ_GEN_13);\
  GEN_INT(IRQ_GEN_12);\
  GEN_INT(IRQ_GEN_11);\
  GEN_INT(IRQ_GEN_10);\
  GEN_INT(IRQ_GEN_9);\
  GEN_INT(IRQ_GEN_8);\
  GEN_INT(IRQ_GEN_7);\
  GEN_INT(IRQ_GEN_6);\
  GEN_INT(IRQ_GEN_5);\
  GEN_INT(IRQ_GEN_4);\
  GEN_INT(IRQ_GEN_3);\
  GEN_INT(IRQ_GEN_2);\
  GEN_INT(IRQ_GEN_1);\
  GEN_INT(IRQ_GEN_0);

#define INT_ASCENDING\
  GEN_INT(IRQ_GEN_0);\
  GEN_INT(IRQ_GEN_1);\
  GEN_INT(IRQ_GEN_2);\
  GEN_INT(IRQ_GEN_3);\
  GEN_INT(IRQ_GEN_4);\
  GEN_INT(IRQ_GEN_5);\
  GEN_INT(IRQ_GEN_6);\
  GEN_INT(IRQ_GEN_7);\
  GEN_INT(IRQ_GEN_8);\
  GEN_INT(IRQ_GEN_9);\
  GEN_INT(IRQ_GEN_10);\
  GEN_INT(IRQ_GEN_11);\
  GEN_INT(IRQ_GEN_12);\
  GEN_INT(IRQ_GEN_13);\
  GEN_INT(IRQ_GEN_14);\
  GEN_INT(IRQ_GEN_15);\
  GEN_INT(IRQ_GEN_16);\
  GEN_INT(IRQ_GEN_17);\
  GEN_INT(IRQ_GEN_18);\
  GEN_INT(IRQ_GEN_19);\
  GEN_INT(IRQ_GEN_20);\
  GEN_INT(IRQ_GEN_21);\
  GEN_INT(IRQ_GEN_22);\
  GEN_INT(IRQ_GEN_23);\
  GEN_INT(IRQ_GEN_24);\
  GEN_INT(IRQ_GEN_25);\
  GEN_INT(IRQ_GEN_26);\
  GEN_INT(IRQ_GEN_27);\
  GEN_INT(IRQ_GEN_28);\
  GEN_INT(IRQ_GEN_29);\
  GEN_INT(IRQ_GEN_30);\
  GEN_INT(IRQ_GEN_31);\
  GEN_INT(IRQ_GEN_32);\
  GEN_INT(IRQ_GEN_33);\
  GEN_INT(IRQ_GEN_34);\
  GEN_INT(IRQ_GEN_35);\
  GEN_INT(IRQ_GEN_36);\
  GEN_INT(IRQ_GEN_37);\
  GEN_INT(IRQ_GEN_38);\
  GEN_INT(IRQ_GEN_39);\
  GEN_INT(IRQ_GEN_40);\
  GEN_INT(IRQ_GEN_41);\
  GEN_INT(IRQ_GEN_42);\
  GEN_INT(IRQ_GEN_43);\
  GEN_INT(IRQ_GEN_44);\
  GEN_INT(IRQ_GEN_45);\
  GEN_INT(IRQ_GEN_46);
  

//Macro to generate interrupt during exception execution
#define GEN_INT_EXP(INT_NO)\
             irq_asserted = 0;\
             exp_intr_flag = 1;\
             generate_IRQ(MAILBOX1, INT_NO);\
             while(irq_asserted != 1);\
             exp_intr_flag = 0 ;

#define MISALIGN_LOAD_WORD  \
                   asm volatile("lw a4, 121(sp)");      \
                   asm volatile("lb a4, 125(sp)");      \
                   asm volatile("lw a4, 124(sp)");      \
                   asm volatile("ld a4,  0(sp) ");      \
                   asm volatile("ld a4,  8(sp) ");      \

#define MISALIGN_LOAD_HALFWORD  \
                   asm volatile("lh a4, 121(sp)");      \
                   asm volatile("lb a4, 123(sp)");      \
                   asm volatile("lh a4, 124(sp)");      \
                   asm volatile("ld a4,  0(sp) ");      \
                   asm volatile("ld a4,  8(sp) ");      \

#define MISALIGN_LOAD_DOUBLEWORD  \
                   asm volatile("ld a4, 124(sp)");      \
                   asm volatile("lb a4, 132(sp)");      \
                   asm volatile("ld a4,  0(sp) ");      \
                   asm volatile("ld a4,  8(sp) ");      \

#define MISALIGN_STORE_WORD  \
                   asm volatile("sw a4, 121(a3)");      \
                   asm volatile("sb a4, 125(a3)");      \
  
#define MISALIGN_STORE_HALFWORD  \
                   asm volatile("ld a4, 120(sp)");      \
                   asm volatile("sh a4, 121(sp)");      \
                   asm volatile("sd a4, 120(sp)");      \
                   asm volatile("sb a4, 123(a3)");      \
                 
#define MISALIGN_STORE_DOUBLEWORD  \
                   asm volatile("sb a4, 132(a3)");      \
                   asm volatile("sd a4, 133(a3)");      \
                
#define ILLEGAL_INSTRUCTION \
                   asm volatile("FENCE");
                  
#define ECALL_EXCEPTION \
                   asm volatile("ECALL");

#define EBREAK_EXCEPTION \
                  asm volatile("EBREAK");

#define INST_MISALIGNED_EXCEPTION \
                  asm volatile("jal ra,13730");

// asm volatile("sd,a4,262144(a2)");
#define MEMORY_OUT_OF_BOUND \
                {uint64_t op1 , op2 ;\
                op2 = 0x50018 ;\
                op1 = 10 ;\
                asm volatile ("lb %[z], 0( %[x] ) \n\t" :  [z] "=r" (op1) : [x] "r" (op2) ); }\

#define MEMORY_OUT_MISALIGNED\
                {uint64_t op1 , op2 ;\
                op2 = 0x50017 ;\
                op1 = 10 ;\
                asm volatile ("ld %[z], 0( %[x] ) \n\t" :  [z] "=r" (op1) : [x] "r" (op2) ); }\

// Macro to generate Nested exception scenarios
#define NESTED_EXCEPTION \
            rand_nested_flag = 0;\
            nested_exception = 1;\
            RAND_EXCEP_GEN;\
            nested_exception = 0 ;

// Macro to generate Random Nested Exception Scenarios
#define RAND_NESTED_EXCEPTION \
            rand_nested_flag = 1;\
            nested_exception = 1;\
            RAND_EXCEP_GEN;\
            nested_exception = 0;

// Macro used when interrupt comes during exception execution
#define INT_GENERATION \
             exp_intr_flag = 1;\
             RAND_EXCEP_GEN;\
             exp_intr_flag = 0 ;

//Macro to generate random exception 
#define RAND_EXCEP_GEN\
       random = (uint8_t)generate_random_num(MAILBOX1);\
       random = random % 11; \
       switch(random){\
            case 0: MISALIGN_LOAD_HALFWORD;\
                    z_printf("Misaligned Load  half word exception is completed\n");\
                    break;\
            case 1: MISALIGN_LOAD_WORD;\
                    z_printf("Misaligned Load word exception is completed \n");\
                    break;\
            case 2: MISALIGN_LOAD_DOUBLEWORD;\
                    z_printf("Misaligned Load  double word exception is completed \n");\
                    break;\
            case 3: MISALIGN_STORE_HALFWORD;\
                    z_printf("Misaligned Store half word exception is completed \n");\
                    break;\
            case 4: MISALIGN_STORE_WORD;\
                    z_printf("Misaligned Store word exception is completed\n");\
                    break;\
            case 5: MISALIGN_STORE_DOUBLEWORD;\
                    z_printf("Misaligned Store double word exception is completed \n");\
                    break;\
            case 6: ILLEGAL_INSTRUCTION;\
                    z_printf("Illegal instruction exception is completed \n");\
                    break;\
            case 7: ECALL_EXCEPTION;\
                    z_printf("E-Call exception is completed \n");\
                    break;\
            case 8: INST_MISALIGNED_EXCEPTION; \
                    z_printf("Instruction Misalgined exception is completed \n");\
                    break;\
            case 9: MEMORY_OUT_OF_BOUND; \
                    z_printf("Memory out of bound exception is completed \n");\
                    break;\
            default:EBREAK_EXCEPTION;\
                    z_printf("E-break exception is completed \n");\
                    break;\
       }\

// MACRO to check exception needs to be generated inside ISR
// if YES random excpeiton will be generated
#define IF_EXCEPTION\
      if(exp_intr_flag == 1){\
      z_printf("Exception occured inside ISR");\
      exp_intr_flag = 0 ;\
      RAND_EXCEP_GEN;\
      z_printf("Exception Excecution Finished , Resuming ISR") ;\
  }\

// macro to generate ISR function , if irq_remap flag is set function will be generated based 
// on function pointer other wise random function will get generated
#define FUNCTION_GENERATOR(intr_no)\
          if(irq_remap_flag){\
            (*func_ptr[intr_no]) () ; }\
          else\
           { generate_random_func(); }\

#define csr_asm_rs(inst,rd,imm,imm1)\
        asm volatile (#inst "    %[z], "#imm", "#imm1"\n\t"  : [z] "=r" (rd) ) ;

#define NIL (100)          // any value other than the exception id
#define NESTED_COUNT (20)  //Nested random exception count

uint8_t random = NIL ; 
volatile int irq_asserted ;  // Flag gives status of interrupt 
uint8_t exception_id = NIL ; //variable to hold excpeiton id   
int nested_exception = 0 ;   // flag is set to high for nested excpeiton test cases 
int rand_nested_flag = 0;    // glag set high for random nested excpeiton test cases 
int exp_intr_flag = 0 ;      // flag is set high indicates excpetion happend while excecuting interrupt
int irq_remap_flag = 0;      // irq_remap flag set high to remap functions 

__attribute__((naked)) void Exception_handler_irq(void)
{ 
 // Context Saving 
 TRAP_ENTRY;
 exception_id =  read_exception_num(MAILBOX1);
 z_printf("\nException %d is Triggered\n" , exception_id );

 if(exception_id == 0)
     z_printf("Instruction  misalign exception \n");
 else if(exception_id == 2)
     z_printf("Illegeal instruction exception \n");
 else if(exception_id == 3){
     z_printf("Breakpoint exception \n");
 }
 else if(exception_id == 4)        /// write it here check for e break ID and there write a exit sequencce
     z_printf("Load address misalign exception \n");
 else if(exception_id == 6)
     z_printf("store address misalign exception \n");
 else if(exception_id == 11)
     z_printf("E-CALL in M mode exception \n");
 else if(exception_id == 24)
     z_printf("Memory out of bound exception\n");
 else 
     z_printf("Unknown exception is triggered\n");


 if(!rand_nested_flag){
     if(nested_exception == 1){
         nested_exception++;
         MISALIGN_LOAD_HALFWORD;
         z_printf("Misaligned Load half word exception is completed: entering into Context restoration \n");
     }
     else if(nested_exception == 2){
         nested_exception++;
         MISALIGN_LOAD_WORD;
         z_printf("Misaligned Load word exception is completed: entering into Context restoration \n");
     }
     else if(nested_exception == 3){
         nested_exception++;
          MISALIGN_LOAD_DOUBLEWORD;
         z_printf("Misaligned Load double word exception is completed: entering into Context restoration \n");
     }
     else if(nested_exception == 4){
          nested_exception++;
          MISALIGN_STORE_HALFWORD;
          z_printf("Misaligned Store halfword exception is completed: entering into Context restoration \n");
     }
     else if(nested_exception == 5){
         nested_exception++;
         MISALIGN_STORE_WORD;
         z_printf("Misaligned Store word exception is completed: entering into Context restoration \n");
     }
     else if(nested_exception == 6){
         nested_exception++;
         MISALIGN_STORE_DOUBLEWORD;
         z_printf("Misaligned Store double word exception is completed: entering into Context restoration \n");
     }
     else if(nested_exception == 7){
         nested_exception++;
         ILLEGAL_INSTRUCTION;
         z_printf("Illegal Instruction exception is completed: entering into Context restoration \n");
     }
     else if(nested_exception == 8){
         nested_exception++;
         EBREAK_EXCEPTION;
         z_printf("Ebreak exception is completed: entering into Context restoration \n");
     }
     else if(nested_exception == 9){
         nested_exception++;
         ECALL_EXCEPTION;
         z_printf("Ecall exception is completed: entering into Context restoration \n");
     }
     else if(nested_exception == 10){
         nested_exception++;
         INST_MISALIGNED_EXCEPTION;
         z_printf("Instruction Misaligned exception is completed: entering into Context restoration \n");
     }
     else if(nested_exception == 11){
         nested_exception++;
         MEMORY_OUT_OF_BOUND;
         z_printf("Memory out of bound exception is completed: entering into context restoration \n");
     }
     
     else{
          if(exp_intr_flag == 1){
             generate_IRQ(MAILBOX1, IRQ_GEN_RAND1);
             z_printf("Interrupt Came , But Serving Exception\n");
            }
             generate_random_func() ;
       }
 }


 if(rand_nested_flag){
     while(nested_exception++ <= NESTED_COUNT){
            RAND_EXCEP_GEN;
     }
  }
  
  exception_id = NIL ;

  TRAP_EXIT; //Context restoration

} 


__attribute__((naked)) void irq_0_handler(void)
{ 
  TRAP_ENTRY; // Context Saving 
  irq_asserted = 1 ; //Flag enabling 
  z_printf("IRQ handler 0 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  FUNCTION_GENERATOR(0) ; // Generate random function
  deassert_IRQ(MAILBOX2,DE_IRQ_0);  //De-Assert Interrupt
  z_printf("IRQ handler 0 finished \n");
  TRAP_EXIT; //Context restoration  

} 
__attribute__((naked)) void irq_1_handler(void)
{
  // Context Saving 
  TRAP_ENTRY;
  irq_asserted = 1;
  z_printf("IRQ handler 1 entered \n");
  // Generate Random function 
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  FUNCTION_GENERATOR(1) ; 
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_1);
  z_printf("IRQ handler 1 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_2_handler(void)
{
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 2 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(2);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_2);
  z_printf("IRQ handler 2 finished \n");
  //Context restoration 
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_3_handler(void)
{    
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 3 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(3);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_3);
  z_printf("IRQ handler 3 finished \n");
 //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_4_handler(void)
{  
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 4 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(4);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_4);
  z_printf("IRQ handler 4 finished \n");
  //Context restoration 
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_5_handler(void)
{  
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 5 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(5);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_5);
  z_printf("IRQ handler 5 finished \n");
  //Context restoration 
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_6_handler(void)
{  
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 6 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(6);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_6);
  z_printf("IRQ handler 6 finished \n");
  TRAP_EXIT; //Context restoration  
 
} 
__attribute__((naked)) void irq_7_handler(void)
{  
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 7 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(7);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_7);
  z_printf("IRQ handler 7 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_8_handler(void)
{  
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 8 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(8);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_8);
  z_printf("IRQ handler 8 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_9_handler(void)
{  
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 9 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(9);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_9);
  z_printf("IRQ handler 9 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_10_handler(void)
{ 
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 10 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(10);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_10);
  //Context restoration  
  z_printf("IRQ handler 10 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_11_handler(void)
{ 
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 11 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(11);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_11);
  z_printf("IRQ handler 11 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_12_handler(void)
{  
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 12 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(12);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_12);
  z_printf("IRQ handler 12 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_13_handler(void)
{  
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 13 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(13);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_13);
  z_printf("IRQ handler 13 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_14_handler(void)
{  
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 14 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(14);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_14);
  z_printf("IRQ handler 14 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_15_handler(void)
{  
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 15 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(15);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_15);
  z_printf("IRQ handler 15 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_16_handler(void)
{ 
  // Context Saving 
  TRAP_ENTRY; 
  // Bubble Sort
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 16 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(16);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_16);
  z_printf("IRQ handler 16 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_17_handler(void)
{  
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 17 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(17);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_17);
  z_printf("IRQ handler 17 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_18_handler(void)
{  
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 18 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(18);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_18);
  z_printf("IRQ handler 18 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_19_handler(void)
{  
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 19 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(19);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_19);
  z_printf("IRQ handler 19 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_20_handler(void)
{  
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 20 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(20);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_20);
  z_printf("IRQ handler 20 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_21_handler(void)
{  
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 21 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(21);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_21);
  z_printf("IRQ handler 21 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_22_handler(void)
{ 
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 22 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(22);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_22);
  z_printf("IRQ handler 22 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_23_handler(void)
{  
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 23 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(23);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_23);
  z_printf("IRQ handler 23 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_24_handler(void)
{ 
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 24 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(24);    //De-Assert Interrupt
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_24);
  z_printf("IRQ handler 24 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_25_handler(void)
{ 
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 25 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(25);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_25);
  z_printf("IRQ handler 25 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_26_handler(void)
{  
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 26 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(26);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_26);
  z_printf("IRQ handler 26 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_27_handler(void)
{  
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 27 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(27);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_27);
  z_printf("IRQ handler 27 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_28_handler(void)
{  
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 28 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(28);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_28);
  z_printf("IRQ handler 28 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_29_handler(void)
{ 
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 29 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(29);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_29);
  z_printf("IRQ handler 29 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_30_handler(void)
{  
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 30 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(30);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_30);
  z_printf("IRQ handler 30 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_31_handler(void)
{ 
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 31 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(31);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_31);
  z_printf("IRQ handler 31 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_32_handler(void)
{ 
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 32 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(32);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_32);
  z_printf("IRQ handler 32 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_33_handler(void)
{ 
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  // Bubble Sort
  z_printf("IRQ handler 33 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(33);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_33);
  z_printf("IRQ handler 33 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_34_handler(void)
{ 
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 34 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(34);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_34);
  z_printf("IRQ handler 34 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_35_handler(void)
{ 
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 35 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(35);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_35);
  z_printf("IRQ handler 35 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_36_handler(void)
{ 
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 36 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(36);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_36);
  z_printf("IRQ handler 36 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_37_handler(void)
{ 
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 37 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(37);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_37);
  z_printf("IRQ handler 37 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_38_handler(void)
{ 
  // Context Saving 
  TRAP_ENTRY;

  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 38 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(38);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_38);
  z_printf("IRQ handler 38 finished \n");

  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_39_handler(void)
{ 
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 39 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(39);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_39);
  z_printf("IRQ handler 39 finished \n");
  //Context restoration  
  TRAP_EXIT; 
}

__attribute__((naked)) void irq_40_handler(void)
{ 
   // Context Saving
  TRAP_ENTRY;
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 40 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(40);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_40);
  z_printf("IRQ handler 40 finished  \n");
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_41_handler(void)
{ 
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 41 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(41);    
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_41);
  z_printf("IRQ handler 41 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 

__attribute__((naked)) void irq_42_handler(void)
{ 
  // Context Saving  
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 42 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(42);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_42);
  z_printf("IRQ handler 42 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 

__attribute__((naked)) void irq_43_handler(void)
{ 

  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 43 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(43);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_43);
  z_printf("IRQ handler 43 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_44_handler(void)
{ 

  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 44 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(44);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_44);
  z_printf("IRQ handler 44 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 
__attribute__((naked)) void irq_45_handler(void)
{ 
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 45 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(45);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_45);
  z_printf("IRQ handler 45 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 


__attribute__((naked)) void irq_46_handler(void)
{ 
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 46 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  // Generate Random function 
  FUNCTION_GENERATOR(46);
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_46);
  z_printf("IRQ handler 46 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 



__attribute__((naked)) void irq_47_handler(void)
{ 
  // Context Saving 
  TRAP_ENTRY; 
  irq_asserted = 1 ; //Flag enabling  
  z_printf("IRQ handler 47 entered \n");
  IF_EXCEPTION; // Testcase - Exception comes while executing interrupt
  
  //De-Assert Interrupt
  deassert_IRQ(MAILBOX2,DE_IRQ_47);
  z_printf("IRQ handler 47 finished \n");
  //Context restoration  
  TRAP_EXIT; 
} 

#endif
