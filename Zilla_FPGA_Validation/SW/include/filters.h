#ifndef FILTERS_H
#define FILTERS_H



#define SIG_LENGTH 200
#define IMP_RSP_LENGTH 29

#define PI 26353584  //3.141592
#define TWO_PI 52707168 //6.283184
#define CUT_OFF_FREQ 1677722 //1677722 //0.2

/* Cut off frequency is normalised and must be between 0 and 0.5
 * where 0.5 is the nyquist frequency
 * Here, the signal was sampled at 48kHz, nyquist frequency = 24kHz
 * i.e 24kHz ------> 0.5
 * 10kHz -------> 0.2 (10/24 * 0.5) */


long long int actual_result[1083] __attribute((section(".results"))) = {0,};
#include "testcordic.h"
  
 /* test case status */
	volatile int testtypenum  = 0;
   	long long int num_of_elements_memdump = 1083;

  
      int iterations = 16;
      int sins,coss;
      int testnumber = 1;



extern long int InputSignal_f32_1kHz_15kHz[SIG_LENGTH];
long int  Impulse_response[IMP_RSP_LENGTH];
long int  Output_signal[SIG_LENGTH-IMP_RSP_LENGTH];
int i;




//Q-format multiplication function
 long long int qformat_multiplication(long int operand1, long int operand2)
{
     long long int result;
     

  result = operand1 * operand2;
  result = result /pow(2,23); 

  return result;
}

//Q-format division function
 long long int qformat_division(long int operand1, long int operand2)
{
     long int result;
   

  result =(operand1 << 23) / operand2;
  return result;
}

//Radian to degree conversions
long int radian_to_degree(long int radian_value)
 {
     long int degree_value;
     degree_value = (radian_value * 180)/PI;
    
     while(degree_value<0 || degree_value>360)
     {
         if(degree_value>360)
             degree_value = degree_value - 360;
         else
             degree_value = degree_value + 360;
     }
      
     return degree_value;
 }

//Converting decimal values to Q-format
 long int qformat_cordic(long int cordic_value)
 {
     
  long long int q_value;
  long int result;
  q_value = cordic_value * pow(2,23);
  result = (q_value/10000)+1;

  return result;
 
 }

//sinc function = (sin(2*pi*cutoff_freq *(i-filter_length/2)) /(i-filter_length/2) )

long int sinc_function(i,two_pi,cutoff_freq,filter_length)
{
  
    long int a,b;
    long int radian_sinc,degree_sinc,sine_q,sine_value;
   

     a = qformat_multiplication(TWO_PI,CUT_OFF_FREQ);
     b = (i- IMP_RSP_LENGTH/2)*pow(2,23);
     radian_sinc = qformat_multiplication(a,b);
     degree_sinc = radian_to_degree(radian_sinc);
     CORDIC_SIN_COS_TEST_C(MAILBOX1,degree_sinc,iterations,testnumber,&sins,&coss,1);
     sine_value = data[(degree_sinc*3)+1];
     sine_q = qformat_cordic(sine_value);
     Impulse_response[i] = qformat_division(sine_q,b); //result of sinc function
     
     return Impulse_response[i];
}

//Hamming window = (0.54-0.46*cos(2*PI*i/filter_length))

long int Hamming_window(i,two_pi,cutoff_freq,filter_length)
{
     long int a,b,c,d,e;
     long int window_degree,window_radian,cosine_value,cos_q;
    
     a = i*pow(2,23);
     b = qformat_multiplication(TWO_PI,a);
     c = IMP_RSP_LENGTH*pow(2,23);
     window_radian = qformat_division(b,c);
     window_degree = radian_to_degree(window_radian);
     CORDIC_SIN_COS_TEST_C(MAILBOX1,window_degree,iterations,testnumber,&sins,&coss,1);
     cosine_value = data[(window_degree*3)+2];
     cos_q = qformat_cordic(cosine_value);
     d = qformat_multiplication(3858760,cos_q); // 0.46*cos((2*PI*i/filter_length))
     e = 4529848 - d;
     Impulse_response[i] = qformat_multiplication(Impulse_response[i],e);

    return Impulse_response[i];

}


//Hanning window = (0.50-0.50*cos(2*PI*i/filter_length))


 long int Hanning_window(iteration,two_pi,cutoff_freq,filter_length)
{
     long int a,b,c,d,e;
     long int window_degree,window_radian,cosine_value,cos_q;
    
     a = i*pow(2,23);
     b = qformat_multiplication(TWO_PI,a);
     c = IMP_RSP_LENGTH*pow(2,23);
     window_radian = qformat_division(b,c);
     window_degree = radian_to_degree(window_radian);
     CORDIC_SIN_COS_TEST_C(MAILBOX1,window_degree,iterations,testnumber,&sins,&coss,1);
     cosine_value = data[(window_degree*3)+2];
     cos_q = qformat_cordic(cosine_value);
     d = qformat_multiplication(4194296,cos_q); // 0.5*cos((2*PI*i/filter_length))
     e = 4194296 - d;
     Impulse_response[i] = qformat_multiplication(Impulse_response[i],e);
     
     return Impulse_response[i];

}


long int convolution(filter_length,input_signal_length)
{
     long int qformat_mul;
      int j;

// Convolve the input signal and the impulse response (filter kernel)
 for(j=IMP_RSP_LENGTH;j<SIG_LENGTH;j++)
    {
             
      for(i=0;i<IMP_RSP_LENGTH;i++)
          {
            qformat_mul= qformat_multiplication(InputSignal_f32_1kHz_15kHz[j-i],Impulse_response[i]);
            Output_signal[j] = Output_signal[j] + qformat_mul;
          }
      }
  return 0;
}


#endif
