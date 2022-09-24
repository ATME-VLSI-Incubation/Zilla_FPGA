/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////                                                                                                                     //////
//////                                       CSR                                                                           //////
//////                                                                                                                     //////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//


#ifndef CSR_H
#define CSR_H

//Macro Definition for min and max value for 64 bit
#define UINT64_MIN 0 

#define UINT64_MAX 0xFFFFFFFFFFFFFFFF


//Macro defination for exp read/write on respective CSR register
#define MASK_MVENDORID      0
#define MASK_MARCHID        0
#define MASK_MIMPID         0
#define MASK_MHARTID        0
#define MASK_MSTATUS_1      6144
#define MASK_MSTATUS_2      6280
#define MASK_MISA           8392960
#define MASK_MIE            2184
#define MASK_MTVEC_1        1
#define MASK_MTVEC_2        0xFFFFFFFD
#define MASK_MIP            2184
#define MASK_MINSTATUS      0
#define MASK_MCOUNTINHIBIT  0
#define MASK_MZICBASE       0
#define MASK_MSCRATCH       0
#define MASK_MEPC           0
#define MASK_MTVAL          0
     
#endif

