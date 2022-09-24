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
uint8_t op1, op2; \
	                                  uint8_t rslt_full; \
					  uint8_t rslt_tb; \
                                          op1 = (uint8_t)data[(tn-1)*3 + 0]; \
                                          op2 = (uint8_t)data[(tn-1)*3 + 1]; \
                                          rslt_tb = (uint8_t)data[(tn-1)*3 + 2]; \
                                          rslt_full = op1 & op2;
           if(rslt_full == rslt_tb) 
	    printf("OP1 = %lu   OP2 = %lu F-result = %lu, S-result = %lu : Status = [PASS]\n\r", op1, op2, rslt_tb, rslt_full); 
	else 
	    printf("OP1 = %lu   OP2 = %lu F-result = %lu, S-result = %lu : Status = [FAIL]\n\r", op1, op2, rslt_tb, rslt_full);


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

/*************************************** Assembly Test *************************************/

  	for(testnumber = 1; testnumber <= TEST_COUNT; testnumber++)
	{
#ifdef SPIKE_RUN

					uint8_t op1, op2; \
	                                  uint8_t rslt_full; \
                                          uint8_t rslt_tb; \
                                          op1 = (uint8_t)data[(tn-1)*3 + 0]; \
                                          op2 = (uint8_t)data[(tn-1)*3 + 1]; \
                                          rslt_tb = (uint8_t)data[(tn-1)*3 + 2]; \
                                          _AND_TEST_U8_(&op1, &op2, &rslt_full);




#else 
					  uint8_t op1, op2; 
	                                  uint8_t rslt_full; 
                                          op1 = genrand_int32(); 
                                          op2 = genrand_int32();                                           
				          _AND_TEST_U8_(&op1, &op2, &rslt_full); 
		printf_("OP1 = %lu   OP2 = %lu    Result = %lu\n\r",op1,op2,res);  

#endif
	}
					  uint8_t op1, op2; \
	                                  uint8_t rslt_full; \
                                          op1 = (uint8_t)generate_random_num(mb); \
                                          op2 = (uint8_t)generate_random_num(mb); \
				          _AND_TEST_U8_(&op1, &op2, &rslt_full); \
return 0;
}

