/*
**
*******************************************************************************
**
** Test program for Logical AND
**
*******************************************************************************
*/

#include <stdint.h> 

#define TEST_COUNT     (5)    /*!< Test count */

int main(void)
{
   volatile int testnumber   = 1;
   uint32_t init[4]={0x123, 0x234, 0x345, 0x456}, length=4;
   
   init_by_array(init, length);

/*********************************** And Test uint8_t ********************************************/


	for(testnumber = 1; testnumber <= TEST_COUNT; testnumber++)
	{
#ifdef SPIKE_RUN






#else 	
 		uint8_t op1, op2; 
		uint8_t res; 
		op1 = genrand_int32(); 
		op2 = genrand_int32(); 
		res = op1 & op2; 
		printf_("OP1 = %lu   OP2 = %lu    Result = %lu\n\r",op1,op2,res); 
		
#endif
	}

/**************************************************************************************************/

/*********************************** And Test uint16_t ********************************************/   


  	for(testnumber = 1; testnumber <= TEST_COUNT; testnumber++)
	{
#ifdef SPIKE_RUN






#else 
 		uint16_t op1, op2; 
		uint16_t res; 
		op1 = genrand_int32(); 
		op2 = genrand_int32(); 
		res = op1 & op2; 
		printf_("OP1 = %lu   OP2 = %lu    Result = %lu\n\r",op1,op2,res);  

#endif
	}

/**************************************************************************************************/

/*********************************** And Test uint32_t ********************************************/   


  	for(testnumber = 1; testnumber <= TEST_COUNT; testnumber++)
	{
 		uint32_t op1, op2; 
		uint32_t res; 
		op1 = genrand_int32(); 
		op2 = genrand_int32(); 
		res = op1 & op2; 
		printf_("OP1 = %lu   OP2 = %lu    Result = %lu\n\r",op1,op2,res); 	
    }

/**************************************************************************************************/ 

/*********************************** And Test 8 & 16 ********************************************/   


  	for(testnumber = 1; testnumber <= TEST_COUNT; testnumber++)
	{
 		uint8_t  op1;
        	uint16_t op2;
		uint16_t res; 
		op1 = genrand_int32(); 
		op2 = genrand_int32(); 
		res = op1 & op2; 
		printf_("OP1 = %lu   OP2 = %lu    Result = %lu\n\r",op1,op2,res); 	
    }

/**************************************************************************************************/

/*********************************** And Test 8 & 32 ********************************************/   


  	for(testnumber = 1; testnumber <= TEST_COUNT; testnumber++)
	{
 		uint8_t op1;
        	uint32_t op2; 
		uint32_t res; 
		op1 = genrand_int32(); 
		op2 = genrand_int32(); 
		res = op1 & op2; 
		printf_("OP1 = %lu   OP2 = %lu    Result = %lu\n\r",op1,op2,res); 	
    }

/**************************************************************************************************/ 

/*********************************** And Test 16 & 8 ********************************************/   


  	for(testnumber = 1; testnumber <= TEST_COUNT; testnumber++)
	{
 		uint16_t op1;
        	uint8_t  op2; 
		uint16_t res; 
		op1 = genrand_int32(); 
		op2 = genrand_int32(); 
		res = op1 & op2; 
		printf_("OP1 = %lu   OP2 = %lu    Result = %lu\n\r",op1,op2,res); 
    }

/**************************************************************************************************/ 

 /*********************************** And Test 16 & 32 ********************************************/   


  	for(testnumber = 1; testnumber <= TEST_COUNT; testnumber++)
	{
 		uint16_t op1;
        	uint32_t op2; 
		uint32_t res; 
		op1 = genrand_int32(); 
		op2 = genrand_int32(); 
		res = op1 & op2; 
		printf_("OP1 = %lu   OP2 = %lu    Result = %lu\n\r",op1,op2,res); 
    }

/**************************************************************************************************/ 

/*********************************** And Test 32 & 8 ********************************************/   


  	for(testnumber = 1; testnumber <= TEST_COUNT; testnumber++)
	{
 		uint32_t op1;
        	uint8_t  op2; 
		uint32_t res; 
		op1 = genrand_int32(); 
		op2 = genrand_int32(); 
		res = op1 & op2; 
		printf_("OP1 = %lu   OP2 = %lu    Result = %lu\n\r",op1,op2,res); 	
    }

/**************************************************************************************************/ 

/*********************************** And Test 32 & 16 ********************************************/   


  	for(testnumber = 1; testnumber <= TEST_COUNT; testnumber++)
	{
 		uint32_t op1;
        	uint16_t op2; 
		uint32_t res; 
		op1 = genrand_int32(); 
		op2 = genrand_int32(); 
		res = op1 & op2; 
		printf_("OP1 = %lu   OP2 = %lu    Result = %lu\n\r",op1,op2,res); 
    }

/**************************************************************************************************/

return 0;
}

