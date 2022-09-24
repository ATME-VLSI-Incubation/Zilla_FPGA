
#ifndef WDT_H
#define WDT_H




#include <stdio.h>              /*!< Standard IO            */
#include <limits.h>             /*!< Datatype limit         */
#include <stdint.h>             /*!< Standarad Integer type */
#include "print.h"              /*!< Mailbox print library  */




// Structure to define the watch dog timer input registers 
typedef struct {
  uint32_t WDT_CTRL  ; //Control register                    offset:0x0810
 uint32_t WDT_TIMEOUT ; //Timeout register                   offset:0x0814
 uint32_t WDT_SERVICE ; // Service word register             offset:0x0818
}WDT_t;

//Address pointer for starting address of WDT input register 
#define WDT ((volatile WDT_t*) 0x00810)

int value = 0;

void delay()
{
    for(int i = 0; i< 1000;i++)
    i++;

}
//Counter starts decrementing after reset at timeout value until enable is high(test case 1-3) 

// Interrupt is  triggered 16 cycles before reset

void test_case_1()
{
       WDT -> WDT_TIMEOUT = 0x000F; 
       WDT -> WDT_CTRL = 0x0140;
       WDT -> WDT_CTRL = 0x0144;
       WDT -> WDT_CTRL = 0x0000;
}

// Interrupt is  triggered 32 cycles before reset
void test_case_2()
{
       WDT -> WDT_TIMEOUT = 0x001F; 
       WDT -> WDT_CTRL = 0x0180;
       WDT -> WDT_CTRL = 0x0184;
       WDT -> WDT_CTRL = 0x0000;
}


// Interrupt is  triggered 64 cycles before reset
void test_case_3()
{
       WDT -> WDT_TIMEOUT = 0x003F; 
       WDT -> WDT_CTRL = 0x01C0;
       WDT -> WDT_CTRL = 0x01C4;
       WDT -> WDT_CTRL = 0x0000;

}


//Counter decrements as long ad enable is high, and timeout value is written otherwise
//hence counter stays at timeout value and doesn't decrement as protect is high

void test_case_4()
{
     WDT -> WDT_TIMEOUT = 0x000F;
     WDT -> WDT_CTRL = 0x0144;
     WDT -> WDT_CTRL = 0x0000;
     WDT -> WDT_CTRL = 0x0142;
     WDT -> WDT_CTRL = 0x0000;
}


void test_case_5()
{
     WDT -> WDT_TIMEOUT = 0x001F;
     WDT -> WDT_CTRL = 0x0184;
     WDT -> WDT_CTRL = 0x0000;
     WDT -> WDT_CTRL = 0x0182;
     WDT -> WDT_CTRL = 0x0000;
}

void test_case_6()
{
     WDT -> WDT_TIMEOUT = 0x003F;
     WDT -> WDT_CTRL = 0x01C4;
     WDT -> WDT_CTRL = 0x0000;
     WDT -> WDT_CTRL = 0x01C2;
     WDT -> WDT_CTRL = 0x0000;
}


//Counter decrements after 2 clock pulses when enable is high
//Interrupt is triggered 16 clock pulses before reset 
void test_case_7()
{
       WDT -> WDT_TIMEOUT = 0x0010; 
       WDT -> WDT_CTRL = 0x0140;
       WDT -> WDT_CTRL = 0x0144;
 }

//Interrupt is triggered 32 clock pulses before reset 

void test_case_8()
{
       WDT -> WDT_TIMEOUT = 0x0020; 
       WDT -> WDT_CTRL = 0x0180;
       WDT -> WDT_CTRL = 0x0184;
}

//Interrupt is triggered 64 clock pulses before reset 

void test_case_9()
{
       WDT -> WDT_TIMEOUT = 0x0040; 
       WDT -> WDT_CTRL = 0x01C0;
       WDT -> WDT_CTRL = 0x01C4;
}


//Random number between (0x00 , 0x10)   for time out register to check if interrupt is triggered 16 cycles before reset
void test_case_10()
{
       uint32_t random_number = generate_random(MAILBOX1,WDT_1);

       WDT -> WDT_TIMEOUT =random_number; 
       WDT -> WDT_CTRL = 0x0140;
       WDT -> WDT_CTRL = 0x0144;
       WDT -> WDT_CTRL = 0x0000;

}

//Random number between (0x11 , 0x20)  for time out register to check if interrupt is triggered 32 cycles before reset

void test_case_11()
{
       uint32_t random_number = generate_random(MAILBOX1,WDT_2);

       WDT -> WDT_TIMEOUT = random_number; 
       WDT -> WDT_CTRL = 0x0180;
       WDT -> WDT_CTRL = 0x0184;
       WDT -> WDT_CTRL = 0x0000;

}

//Random number between  (0x21 , 0x40)  for time out register to check if interrupt is triggered 64 cycles before reset

void test_case_12()
{
       uint32_t random_number = generate_random(MAILBOX1,WDT_3);

       WDT -> WDT_TIMEOUT = random_number; 
       WDT -> WDT_CTRL = 0x01C0;
       WDT -> WDT_CTRL = 0x01C4;
       WDT -> WDT_CTRL = 0x0000;

}


//Test case 13 to 15 writes 32 bit random numbers to timeout register
//Checks if interrupt is being triggerred before 16,32 and 64 cycles respectively.

void test_case_13()
{
       WDT -> WDT_TIMEOUT = (uint32_t)generate_random_num(MAILBOX1);
       WDT -> WDT_CTRL = 0x0140;
       WDT -> WDT_CTRL = 0x0144;
       WDT -> WDT_CTRL = 0x0000;
}


void test_case_14()
{
       WDT -> WDT_TIMEOUT = (uint32_t)generate_random_num(MAILBOX1);
       WDT -> WDT_CTRL = 0x0180;
       WDT -> WDT_CTRL = 0x0184;
       WDT -> WDT_CTRL = 0x0000;
}


void test_case_15()
{
       WDT -> WDT_TIMEOUT = (uint32_t)generate_random_num(MAILBOX1);
       WDT -> WDT_CTRL = 0x01C0;
       WDT -> WDT_CTRL = 0x01C4;
       WDT -> WDT_CTRL = 0x0000;
}

// Test case 16 - 18 Accessing service word registers
// resetting counter values from timeout register to avoid counter decrementing to zero

//reset counter register to FF by accessing service word
void test_case_16()
{
    
    WDT -> WDT_TIMEOUT = 0x00FF;
    WDT -> WDT_CTRL = 0x0140;
    WDT -> WDT_CTRL = 0x0144;
    WDT -> WDT_SERVICE = 0x5555;
    WDT -> WDT_SERVICE = 0xAAAA;
} 

//reset counter register to random 32 bit by accessing service word
void test_case_17()
{
    
    WDT -> WDT_TIMEOUT = (uint32_t)generate_random_num(MAILBOX1);
    WDT -> WDT_CTRL = 0x0140;
    WDT -> WDT_CTRL = 0x0144;
    WDT -> WDT_SERVICE = 0x5555;
    WDT -> WDT_SERVICE = 0xAAAA;
}    

//reset counter register to random 32 bit by accessing service word, thrice
void test_case_18()
{
    
    for(int i=0;i<3;i++)
    {
    WDT -> WDT_TIMEOUT = (uint32_t)generate_random_num(MAILBOX1);
    WDT -> WDT_CTRL = 0x0140;
    WDT -> WDT_CTRL = 0x0144;
    WDT -> WDT_SERVICE = 0x5555;
    WDT -> WDT_SERVICE = 0xAAAA;
    }
    
} 

//service word cases for interrupt coming before 32 cycles of reset
//reset counter register to FF by accessing service word 
void test_case_19()
{
    
    WDT -> WDT_TIMEOUT = 0x00FF;
    WDT -> WDT_CTRL = 0x0180;
    WDT -> WDT_CTRL = 0x0184;
    WDT -> WDT_SERVICE = 0x5555;
    WDT -> WDT_SERVICE = 0xAAAA;
} 

//reset counter register to random 32 bit by accessing service word
void test_case_20()
{
    
    WDT -> WDT_TIMEOUT = (uint32_t)generate_random_num(MAILBOX1);
    WDT -> WDT_CTRL = 0x0180;
    WDT -> WDT_CTRL = 0x0184;
    WDT -> WDT_SERVICE = 0x5555;
    WDT -> WDT_SERVICE = 0xAAAA;
}    

//reset counter register to random 32 bit by accessing service word, thrice
void test_case_21()
{
    
    for(int i=0;i<3;i++)
    {
    WDT -> WDT_TIMEOUT = (uint32_t)generate_random_num(MAILBOX1);
    WDT -> WDT_CTRL = 0x0180;
    WDT -> WDT_CTRL = 0x0184;
    WDT -> WDT_SERVICE = 0x5555;
    WDT -> WDT_SERVICE = 0xAAAA;
    }
    
}   

//service word cases for interrupt coming before 64 cycles of reset
//reset counter register to FF by accessing service word 
void test_case_22()
{
    
    WDT -> WDT_TIMEOUT = 0x00FF;
    WDT -> WDT_CTRL = 0x01C0;
    WDT -> WDT_CTRL = 0x01C4;
    WDT -> WDT_SERVICE = 0x5555;
    WDT -> WDT_SERVICE = 0xAAAA;
} 

//reset counter register to random 32 bit by accessing service word
void test_case_23()
{
    
    WDT -> WDT_TIMEOUT = (uint32_t)generate_random_num(MAILBOX1);
    WDT -> WDT_CTRL = 0x01C0;
    WDT -> WDT_CTRL = 0x01C4;
    WDT -> WDT_SERVICE = 0x5555;
    WDT -> WDT_SERVICE = 0xAAAA;
}    

//reset counter register to random 32 bit by accessing service word, thrice
void test_case_24()
{
    
    for(int i=0;i<3;i++)
    {
    WDT -> WDT_TIMEOUT = (uint32_t)generate_random_num(MAILBOX1);
    WDT -> WDT_CTRL = 0x01C0;
    WDT -> WDT_CTRL = 0x01C4;
    WDT -> WDT_SERVICE = 0x5555;
    WDT -> WDT_SERVICE = 0xAAAA;
    }
    
}  


//Enable and protect high(test case 25-27)

// The WDT MODULE with interrupt select = 2'b01 is enabled and cannot be disabled without first clearing the WDT_PROTECT bit 
// which takes two writesto the CONTROL register. 
void test_case_25()
{
    
    WDT -> WDT_TIMEOUT = (uint8_t)generate_random_num(MAILBOX1);
    WDT -> WDT_CTRL = 0x0140;
    WDT -> WDT_CTRL = 0x0146;

    delay();
    WDT -> WDT_CTRL = 0x0000; // makes protect bit low
    WDT -> WDT_CTRL = 0x0000; //makes enable bit low

}  


// The WDT MODULE is enabled  with interrupt select = 2'b10 and cannot be disabled without first clearing the WDT_PROTECT bit 
// which takes two writesto the CONTROL register. 
void test_case_26()
{
    
    WDT -> WDT_TIMEOUT = (uint8_t)generate_random_num(MAILBOX1);
    WDT -> WDT_CTRL = 0x0180;
    WDT -> WDT_CTRL = 0x0186;
    delay();
    WDT -> WDT_CTRL = 0x0000; // makes protect bit low
    WDT -> WDT_CTRL = 0x0000; //makes enable bit low

}  

// The WDT MODULE is enabled  with interrupt select = 2'b11 and cannot be disabled without first clearing the WDT_PROTECT bit 
// which takes two writesto the CONTROL register. 
void test_case_27()
{
    
    WDT -> WDT_TIMEOUT = (uint8_t)generate_random_num(MAILBOX1);
    WDT -> WDT_CTRL = 0x01C0;
    WDT -> WDT_CTRL = 0x01C6;
    delay();
    WDT -> WDT_CTRL = 0x0000; // makes protect bit low
    WDT -> WDT_CTRL = 0x0000; //makes enable bit low

}  



/********LOCK TEST CASES*********/

//Enable the WDT to reset at timeout value; after reset, lock is made high
//hence counter stays at timeout value and doesn't decrement
void test_case_28()

{
         WDT -> WDT_TIMEOUT = 0x000F;
         WDT -> WDT_CTRL = 0x0144;
         WDT -> WDT_CTRL = 0x0000;
         WDT -> WDT_CTRL = 0x0141;
         WDT -> WDT_CTRL = 0x0000; 
}


void test_case_29()
{
         WDT -> WDT_TIMEOUT = 0x0020;
         WDT -> WDT_CTRL = 0x0184;
         WDT -> WDT_CTRL = 0x0000;
         WDT -> WDT_CTRL = 0x0181;
         WDT -> WDT_CTRL = 0x0000; 
}

void test_case_30()
{
         WDT -> WDT_TIMEOUT = 0x0040;
         WDT -> WDT_CTRL = 0x01C4;
         WDT -> WDT_CTRL = 0x0000;
         WDT -> WDT_CTRL = 0x01C1;
         WDT -> WDT_CTRL = 0x0000; 
}


//Enable,lock and protect high(test case 31-33)
//Most protected, least control: The WDT MODULE is always enabled and no changes can be made to the control bits.

void test_case_31()
{
    
    WDT -> WDT_TIMEOUT = (uint8_t)generate_random_num(MAILBOX1);
    WDT -> WDT_CTRL = 0x0140;
    WDT -> WDT_CTRL = 0x0147;
    delay();
    WDT -> WDT_CTRL = 0x0000; //Control register value will be 0x0007 as no changes can be made 
}  

void test_case_32()
{
    WDT -> WDT_TIMEOUT = (uint8_t)generate_random_num(MAILBOX1);
    WDT -> WDT_CTRL = 0x0180;
    WDT -> WDT_CTRL = 0x0187;
    delay();
    WDT -> WDT_CTRL = 0x0000; //Control register value will be 0x0007 as no changes can be made 

   
}

void test_case_33()
{
    WDT -> WDT_TIMEOUT = (uint8_t)generate_random_num(MAILBOX1);
    WDT -> WDT_CTRL = 0x01C0;
    WDT -> WDT_CTRL = 0x01C7;
    delay();
    WDT -> WDT_CTRL = 0x0000; //Control register value will be 0x0007 as no changes can be made 

}



void test_case_34()
{
    
    WDT -> WDT_TIMEOUT = (uint8_t)generate_random_num(MAILBOX1);
    WDT -> WDT_CTRL = 0x0140;
    WDT -> WDT_CTRL = 0x0143;
    delay();
    WDT -> WDT_CTRL = 0x0000; //Control register value will be 0x0003 as no changes can be made 
}  

void test_case_35()
{
    WDT -> WDT_TIMEOUT = (uint8_t)generate_random_num(MAILBOX1);
    WDT -> WDT_CTRL = 0x0180;
    WDT -> WDT_CTRL = 0x0183;
    delay();
    WDT -> WDT_CTRL = 0x0000; //Control register value will be 0x0003 as no changes can be made 

   
}

void test_case_36()
{
    WDT -> WDT_TIMEOUT = (uint8_t)generate_random_num(MAILBOX1);
    WDT -> WDT_CTRL = 0x01C0;
    WDT -> WDT_CTRL = 0x01C3;
    delay();
    WDT -> WDT_CTRL = 0x0000; //Control register value will be 0x0003 as no changes can be made 

}




#endif
