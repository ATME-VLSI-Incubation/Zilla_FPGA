#ifndef TESTAPI_H
#define TESTAPI_H


////////////////////////////////////////////////////////////////////////
////////////           Prime number or not display          ////////////
///////////////////////////////////////////////////////////////////////

#define PRINT_RESULT_PRIME(rslt_tb,rslt_full,data_input)\
 for(int i=0;i<10;i++)\
   {    if(rslt_tb[i] == rslt_full[i])\
       {\
           if(rslt_tb [i]== 0)\     
       printf("Test/>   Prime : The number = %15d is not a prime number, E-result = %15d, A-result = %15d : Status = [PASS] \n",data_input[i], rslt_full[i], rslt_tb[i]);\
     else\
   	   printf("Test/>   Prime :The number = %15d is a prime number E-result = %15d, A-result = %15d : Status = [PASS] \n", data_input[i],rslt_full[i], rslt_tb[i]);\
   }\
       else\
           printf("Test/>   Prime : E-result = %15d, A-result = %15d : Status = [FAIL] \n",rslt_full[i], rslt_tb[i]);\
   }\
  

/*********************************Prime test cases***************************/
#define RAND_ARR_PRIME(mb,tn)\
                      uint8_t rand_arr[10];\
					  uint8_t *p=rand_arr;\
					  for ( uint8_t i = 0;i<10;i++)\
					  {    rand_arr[i] = (uint8_t)generate_random_num(mb);\
                           actual_result[(tn-1)*20 + i] = rand_arr[i];}\



/*************************************Prime no**********************************/


#define PRIME_NO_TEST_C(mb,rand_arr,rslt_full,tn)\
                      uint8_t rslt_full[10];\
                      uint8_t i,j;\
                      rand_arr[i] = (uint8_t)generate_random_num(mb);\
                      uint8_t data_input [10];\
                      for( j = 0; j<10; j++)\
                      { uint8_t test = rand_arr[j];\
                      data_input[i] = rand_arr[i];\
                      for( int k =2;k <= test/2; k++)\
                      { if (test% k == 0)\
                      {\
                      rslt_full[j] = 0;\ 
                      break;}\
                      else\
                      rslt_full[j] =1;\
                      }\
                      }\
                      for( i=0;i<10;i++)\
                      {actual_result[(tn-1)*20 +(10+i)] = rslt_full[i]; }\

#define PRIME_NO_TEST_SPIKE_C(data_input,rslt_full,rslt_tb,tn)\
                      uint8_t rslt_full[10];\
                      uint8_t rslt_tb[10];\
                      uint8_t data_spike[10];\
                      uint8_t i,j;\
                      uint8_t data_input [10];\
                      for( i=0;i<10;i++)\
                      {  rslt_tb[i] = (uint8_t)data[(tn-1)*20 + (10+i)]; }\
                      for( i=0;i<10;i++)\
                      for( j = 0; j<10; j++)\
                      { uint8_t test = data_input[j];\
                      data_spike[i] = data_input[i];\
                      for( int k =2;k <= test/2; k++)\
                      { if (test% k == 0)\
                      {\
                      rslt_full[j] = 0;\ 
                      break;}\
                      else\
                      rslt_full[j] =1;\
                      }\
                      }\

#endif
