// Copyright © 2021 Vivartan Technologies., All rights reserved.
// 
// All works published under Zilla_Gen_0 by the Vivartan Technologies. 
// is copyrighted by the Association and ownership of all right, title and interest
// in and to the works remains with Vivartan Technologies.
// 
// No works or documents published under Zilla_Gen_0 by Vivartan Technologies. may be reproduced,
// transmitted or copied without the express written permission of Vivartan Technologies.
// will be considered as a violations of Copyright Act and it may lead to legal action.


/*
**
*******************************************************************************
**
** Header file for irq and sorting related functions and variables
**
** You need to include this header file in your test program if you are
** performing irq operation or required some of the functionalities in this header file
**
** Usage : #include "irq_api.h"
*******************************************************************************
*/

#ifndef IRQ_API_H
#define IRQ_API_H

#include "print.h"    // Mailbox print library  
#include "mailbox.h"  // Linker symbols library 
#include "stdio.h"   //in c 
#include "stdlib.h"

#define FUNC_COUNT (48)    // total function count in irq_remap (48 represents 48 Interrupt )

// prototype declaration
void sqrt_op(void);
void and_op(void);
void or_op(void);
void xor_op(void);
void add_op(void);
void sub_op(void);
void mul_op(void);
void div_op(void);
void rem_op(void);
void sll_op(void);
void srl_op(void);
void cgt_op(void);
void cgte_op(void);
void clt_op(void);
void clte_op(void);
void ceq_op(void);
void cneq_op(void);
void bubble_sort(void);
void selection_sort(void);
void insertion_sort(void);
void shell_sort(void);
void gnome_sort(void);
int generate_random_func(void);
void irq_remap_default(void);
void irq_remap(int intr_no , void (*func_ptr_local)(void) , char *ptr );


void (*func_ptr[FUNC_COUNT]) (void) = {[0 ... FUNC_COUNT-1] = NULL}; // function pointer array intialized with NULL 

 

// Function   : irq_remap_default(void)
// 
// Description: calling this function will intialize func_ptr array with and_op base address , i.e all IRQ are remaped with and_op ( make sure irq_remap_flag is set ) 
// 
// Parameters : nil
//  Return    : nil 
// 
// Examples of Usage: irq_remap_default();
  
void irq_remap_default(void){

    for(int i= 0 ; i < FUNC_COUNT ; i++){
            func_ptr[i] = and_op ;
    }
   
}


// Function   : void irq_remap(int intr_no , void (*func_ptr_local)(void) , char *func_name_ptr )
//
// Description: remapping of function based on interrupt num passed
//
// Parameters : 1) intr_no - interrupt number to be remapped
//              2) (*func_ptr)() - function to be remapped
//              3) *func_name_ptr - string specifying name of the function
//
// Return    : nil 
//
// Examples of Usage: irq_remap(0 , or_op , "Or operation");
//                     interrupt 0 is remmaped with or_op function 
  
void irq_remap(int intr_no , void (*func_ptr_local)(void) , char *func_name_ptr ){
    
    func_ptr[intr_no] = func_ptr_local ; 
    z_printf("Interrupt %d is re-mapped with %s function\n",intr_no , func_name_ptr); 
}


int generate_random_func(void)
{
 uint8_t random_num = (uint8_t)generate_random_num(MAILBOX1);
 random_num = random_num % 22 ;
    switch(random_num)
    {
		case 0 : and_op();
				break;
		case 1 : or_op();
				break; 
		case 2 : xor_op();
                break;
		case 3 : add_op();
                break;
		case 4 : sub_op();
                break;
		case 5 : mul_op();
                break;
		case 6 : div_op();
                break;
		case 7 : rem_op();
                break;
		case 8 : sll_op();
                break;
		case 9 : srl_op();
                break;
		case 10 : cgt_op();
                break;
		case 11 : cgte_op();
                break;
		case 12 : clt_op();
                break;
		case 13 : clte_op();
                break;
		case 14 : ceq_op();
                break;
		case 15 : cneq_op();
                break;
		case 16 : sqrt_op();
                break;
		case 17 : selection_sort();
                break;
		case 18 : insertion_sort();
                break;
		case 19 : shell_sort();
                break;
		case 20 : gnome_sort();
                break;
        case 21 :bubble_sort();
                break;
	 }

return 0;
}

/////////////////////// AND OPERATION  ////////////////////////////////////////////////////
void and_op(void) 
{ 

 z_printf("AND operation : Begin\n");   
 int c;
 uint8_t a = (uint8_t)generate_random_num(MAILBOX1);
 uint8_t b = (uint8_t)generate_random_num(MAILBOX1);
 c = a & b;
 z_printf("AND opeartion is performed. OPERAND1 %d OPERAND2 %d RESULT %d\n",a,b,c); 	 
} 


/////////////////////// OR OPERATION  ////////////////////////////////////////////////////
void or_op(void)
{
 z_printf("OR operation : Begin\n");  
 int c;
 uint8_t a = (uint8_t)generate_random_num(MAILBOX1);
 uint8_t b = (uint8_t)generate_random_num(MAILBOX1);
 c = a | b;
 z_printf("OR opeartion is performed. OPERAND1 %d OPERAND2 %d RESULT %d\n",a,b,c); 	 
} 


/////////////////////// XOR OPERATION  ////////////////////////////////////////////////////
void xor_op(void)
{ 
 z_printf("XOR operation : Begin\n");  
 int c;
 uint8_t a = (uint8_t)generate_random_num(MAILBOX1);
 uint8_t b = (uint8_t)generate_random_num(MAILBOX1);
 c = a ^ b;
 z_printf("XOR opeartion is performed. OPERAND1 %d OPERAND2 %d RESULT %d\n",a,b,c); 	 
} 

      
/////////////////////// ADD OPERATION  ////////////////////////////////////////////////////
void add_op()  
{
 z_printf("ADD operation : Begin\n");
 int c;
 uint8_t a = (uint8_t)generate_random_num(MAILBOX1);
 uint8_t b = (uint8_t)generate_random_num(MAILBOX1);
 c = a + b;
 z_printf("ADD opeartion is performed. OPERAND1 %d OPERAND2 %d RESULT %d\n",a,b,c); 	 
} 


/////////////////////// AND OPERATION  ////////////////////////////////////////////////////
void sub_op(void)
{ 
 z_printf("SUB operation : Begin\n");
 int c;
 uint8_t a = (uint8_t)generate_random_num(MAILBOX1);
 uint8_t b = (uint8_t)generate_random_num(MAILBOX1);
 c = a - b;
 z_printf("SUB opeartion is performed. OPERAND1 %d OPERAND2 %d RESULT %d\n",a,b,c); 	 
} 


/////////////////////// MUL OPERATION  ////////////////////////////////////////////////////
void mul_op(void)
{ 
 z_printf("MUL operation : Begin\n");
 int c;
 uint8_t a = (uint8_t)generate_random_num(MAILBOX1);
 uint8_t b = (uint8_t)generate_random_num(MAILBOX1);
 c = a * b;
 z_printf("MUL opeartion is performed. OPERAND1 %d OPERAND2 %d RESULT %d\n",a,b,c); 	 
} 


/////////////////////// DIV OPERATION  ////////////////////////////////////////////////////
void div_op(void)
{ 
 z_printf("DIV operation : Begin\n");
 int c;
 uint8_t a = (uint8_t)generate_random_num(MAILBOX1);
 uint8_t b = (uint8_t)generate_random_num(MAILBOX1);
 c = a / b;
 z_printf("DIV opeartion is performed. OPERAND1 %d OPERAND2 %d RESULT %d\n",a,b,c); 	 
} 


/////////////////////// REM OPERATION  ////////////////////////////////////////////////////
void rem_op(void)
{ 
 z_printf("REM operation : Begin\n");
 int c;
 uint8_t a = (uint8_t)generate_random_num(MAILBOX1);
 uint8_t b = (uint8_t)generate_random_num(MAILBOX1);
 c = a % b;
 z_printf("REM opeartion is performed. OPERAND1 %d OPERAND2 %d RESULT %d\n",a,b,c); 	 
} 


/////////////////////// SLL OPERATION  ////////////////////////////////////////////////////
void sll_op(void)
{ 
 z_printf("SLL operation : Begin\n");
 int c;
 uint8_t a = (uint8_t)generate_random_num(MAILBOX1);
 uint8_t b = (uint8_t)generate_random_num(MAILBOX1);
 c = a << b;
 z_printf("SLL opeartion is performed. OPERAND1 %d OPERAND2 %d RESULT %d\n",a,b,c); 	 
} 


/////////////////////// SRL OPERATION  ////////////////////////////////////////////////////
void srl_op(void)
{ 
 z_printf("SRL operation : Begin\n");
 int c;
 uint8_t a = (uint8_t)generate_random_num(MAILBOX1);
 uint8_t b = (uint8_t)generate_random_num(MAILBOX1);
 c = a >> b;
 z_printf("SRL opeartion is performed. OPERAND1 %d OPERAND2 %d RESULT %d\n",a,b,c); 	 
} 


/////////////////////// CGT OPERATION  ////////////////////////////////////////////////////
void cgt_op(void)
{ 
 z_printf("CGT operation : Begin\n");
 int c;
 uint8_t a = (uint8_t)generate_random_num(MAILBOX1);
 uint8_t b = (uint8_t)generate_random_num(MAILBOX1);
    if (a>b)
    {
        c=1;
        z_printf("CGT opeartion is performed. OPERAND1 %d OPERAND2 %d RESULT 1\n",a,b);
    }
    else 
    {
        c=0;
        z_printf("CGT opeartion is performed. OPERAND1 %d OPERAND2 %d RESULT 0\n",a,b); 
    }
}


/////////////////////// CLT OPERATION  ////////////////////////////////////////////////////
void cgte_op(void)
{ 
 z_printf("CGTE operation : Begin\n");
 int c;
 uint8_t a = (uint8_t)generate_random_num(MAILBOX1);
 uint8_t b = (uint8_t)generate_random_num(MAILBOX1);
    if (a>=b)
    {
        c=1;
        z_printf("CGTE opeartion is performed. OPERAND1 %d OPERAND2 %d RESULT 1\n",a,b);
    }
    else
    {
        c=0;
        z_printf("CGTE opeartion is performed. OPERAND1 %d OPERAND2 %d RESULT 0\n",a,b); 
    }
}


/////////////////////// CLT OPERATION  ////////////////////////////////////////////////////
void clt_op(void)
{
 z_printf("CLT operation : Begin\n");
 int c;
 uint8_t a = (uint8_t)generate_random_num(MAILBOX1);
 uint8_t b = (uint8_t)generate_random_num(MAILBOX1);
    if (a<b)
    {
        c=1;
        z_printf("CLT opeartion is performed. OPERAND1 %d OPERAND2 %d RESULT 1\n",a,b);
    }
    else 
    {
        c=0;
        z_printf("CLT opeartion is performed. OPERAND1 %d OPERAND2 %d RESULT 0\n",a,b);
    }
}


/////////////////////// CLTE OPERATION  ////////////////////////////////////////////////////
void clte_op(void)
{ 
 z_printf("CLTE operation : Begin\n");
 int c;
 uint8_t a = (uint8_t)generate_random_num(MAILBOX1);
 uint8_t b = (uint8_t)generate_random_num(MAILBOX1);
    if (a<=b)
    {
        c=1;
        z_printf("CLTE opeartion is performed. OPERAND1 %d OPERAND2 %d RESULT 1\n",a,b);
    }
    else
    {
        c=0;
        z_printf("CLTE opeartion is performed. OPERAND1 %d OPERAND2 %d RESULT 0\n",a,b); 
    }
}


/////////////////////// CEQ OPERATION  ////////////////////////////////////////////////////
void ceq_op(void)
{
 z_printf("CEQ operation : Begin\n");
 int c;
 uint8_t a = (uint8_t)generate_random_num(MAILBOX1);
 uint8_t b = (uint8_t)generate_random_num(MAILBOX1);
    if (a==b)
    {
        c=1;
        z_printf("CEQ opeartion is performed. OPERAND1 %d OPERAND2 %d RESULT 1\n",a,b);
    }
    else
    {
        c=0;
        z_printf("CEQ opeartion is performed. OPERAND1 %d OPERAND2 %d RESULT 0\n",a,b); 
    }
}


/////////////////////// CNEQ OPERATION  ////////////////////////////////////////////////////
void cneq_op(void)
{ 
 z_printf("CNEQ operation : Begin\n");
 int c;
 uint8_t a = (uint8_t)generate_random_num(MAILBOX1);
 uint8_t b = (uint8_t)generate_random_num(MAILBOX1);
    if (a!=b)
    { 
        c=1;
        z_printf("CNEQ opeartion is performed. OPERAND1 %d OPERAND2 %d RESULT 1\n",a,b);
    }
    else 
    {    
        c=0;
        z_printf("CNEQ opeartion is performed. OPERAND1 %d OPERAND2 %d RESULT 0\n",a,b); 
    }    
}


/////////////////////// BUBBLE_SORT_ALGORITHM OPERATION  ////////////////////////////////////////////////////
// Bubble Sort in C is a sorting algorithm where we repeatedly iterate through the array 
// and swap adjacent elements that are  unordered.
 
   
void bubble_sort(void)
{  
    z_printf("BUBBLE SORT : Begin\n");

    int a_size = 15;      //Array size 15
    int rand_array[a_size];
    int r;
    int i,j,temp;

    for(r=0; r<a_size; r++)
    {
        rand_array[r] = (uint8_t)generate_random_num(MAILBOX1);
    }

    for(i=a_size-2; i>=0; i--)        //
    {
      for(j=0;j<=i;j++)
            {

            if(rand_array[j] > rand_array[j+1])
                {
                temp            = rand_array[j];
                rand_array[j]   = rand_array[j+1];
                rand_array[j+1] = temp;
                }
            }
   }
   for (r=0;r<a_size; r++)
   {
       z_printf("Sorted array elements using bubble sort is %d\n",rand_array[r]);
   }
   
   z_printf("Bubble sort Algorithm is performed\n");
}


/////////////////////// SELECTION_SORT_ALGORITHM OPERATION  ////////////////////////////////////////////////////

//This sorting algorithm, iterates through the array and finds the smallest number in the array 
//and swaps it with the first element 
//if it is smaller than the first element;Next, it goes on to the second element and so on until all elements are sorted.

void selection_sort(void)
{
    z_printf("SELECTION SORT : Begin\n");
    uint8_t a_size = 15;
    uint8_t rand_array[a_size];
    uint8_t r,i,j;
    uint8_t temp,min;

    for(r=0; r<a_size; r++)
    {
        rand_array[r] = (uint8_t)generate_random_num(MAILBOX1);
    }
    
    for(i=0; i<a_size-1; i++)
    {
        //finding minimum element in unsorted array
        min = i ;
        for(j=i+1; j<a_size; j++)
        {
            if(rand_array[j] < rand_array[min])
            {
                min = j;
            }
        }
        //swapping the found minimum element with the first element in unsorted array
        temp            = rand_array[min];
        rand_array[min] = rand_array[i];
        rand_array[i]   = temp;
    }
    for (r=0;r<a_size; r++)
    {
        z_printf("Sorted array elements using Selection sort is %d\n",rand_array[r]);
    }
   
    z_printf("Selection Sort Algorithm is performed\n");
}


/////////////////////// INSERTION_SORT ALGORITHM OPERATION  ////////////////////////////////////////////////////

//Insertion sort in c is the simple sorting algorithm that virtually splits the given array into sorted and unsorted parts
//then the values from the unsorted parts are picked and placed at the correct position in the sorted part.

void insertion_sort(void)
{
    uint8_t a_size = 15; 
    uint8_t rand_array[a_size];
    uint8_t r;
    uint8_t i,j,temp;

   for(r=0; r<a_size; r++)
    {
        rand_array[r] = (uint8_t)generate_random_num(MAILBOX1);
    }

    for (i = 1 ; i <= a_size - 1; i++)
    {
	    j = i;
            while ( j > 0 && rand_array[j-1] > rand_array[j])
            {	        
                temp            = rand_array[j];
                rand_array[j]   = rand_array[j-1];
                rand_array[j-1] = temp;
                j--;
            }
    }
    for (r=0; r<a_size; r++)
    {
        z_printf("Sorted array elements using Insertion sort is %d\n",rand_array[r]);
    }   
   z_printf("Insertion sort Algorithm is performed\n");

}

/////////////////////// SHELL_SORT ALGORITHM OPERATION  ////////////////////////////////////////////////////
//Initialize the gap size in array.
//Divide the array into subarrays of equal gap size.
//Apply insertion sort on the subarrays.
//Repeat the above steps until the gap size becomes 0 resulting into a sorted array


void shell_sort(void)
{
    z_printf("SHELL SORT : Begin\n");
    uint8_t a_size = 15; 
    uint8_t rand_array[a_size];
    uint8_t r;
    uint8_t i,j,temp;

    for(r=0; r<a_size; r=r+1)
    {
        rand_array[r] = (uint8_t)generate_random_num(MAILBOX1);
    }

    for(i=a_size-1 ; i>=1; i--)
    {
        for(j=0; j<a_size-1; j=j+1)
        {
            if(rand_array[j] > rand_array[j+1])
            {
                temp            = rand_array[j];
                rand_array[j]   = rand_array[j+1];
                rand_array[j+1] = temp;
            }
        }
    }  

    for (r=0; r<a_size; r=r+1)
    {
        z_printf("Sorted array elements using Shell sort is %d\n",rand_array[r]);
    }
   
    z_printf("Shell sort Algorithm is performed\n");

}


/////////////////////// GNOME_SORT ALGORITHM OPERATION  ////////////////////////////////////////////////////
void gnome_sort(void)
{
    z_printf("GNOME SORT : Begin\n");
    uint8_t a_size = 15;  
    uint8_t rand_array[a_size];
    uint8_t i = 0;
    uint8_t temp;
    uint8_t r;

    for(r=0; r<a_size; r=r+1)
    {
        rand_array[r] = (uint8_t)generate_random_num(MAILBOX1);
    }

    while(i<a_size)
    {
        if(i==0 || rand_array[i-1] <= rand_array[i])
        {
            i++;
        }
        else 
        {
            temp            = rand_array[i-1];
            rand_array[i-1] = rand_array[i];
            rand_array[i]   = temp;
            i               = i-1;
        }
    }

    for (r=0;r<a_size; r=r+1)
    {
        z_printf("Sorted array elements using Gnome sort is %d\n",rand_array[r]);
    }
   
    z_printf("Gnome sort Algorithm is performed\n");

}

/////////////////////// SQUARE ROOT OPERATION  ////////////////////////////////////////////////////
void sqrt_op(void)
{
z_printf("SQUARE ROOT operation : Begin\n");
uint16_t rand_array[] = {1,4,9,16,25,36,49,64,81,100,121,144,169,196,225,256,289,324,361,400,441};
uint16_t temp=0, sqrt,n;
uint8_t random = (uint8_t)generate_random_num(MAILBOX1);
random = random % 21 ;
n=rand_array[random];

// store the half of the given number
sqrt = n / 2;

// Iterate until sqrt is different of temp, that is updated on the loop
while(sqrt != temp)
{
temp = sqrt;
sqrt = ( n/temp + temp) / 2;
}
z_printf("The square root of '%d' is '%d'\n", n, sqrt);
}


#endif

