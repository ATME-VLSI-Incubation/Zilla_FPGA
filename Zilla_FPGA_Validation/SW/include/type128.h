/*
**
*******************************************************************************
**
** Header file for handling datatype of 128 bits
** 
** Note: The use of 128bit width signed and unsigned variables might be needed
** in some cases. But the printf function under spike simulator is not able to
** print 128bit variables properly and hence this header file allows one to 
** display both hex and decimal format of 128bit width varaibles
**
** Another thing is that uint128_t is NOT available and we need to define
** the typedef to provide this. Similar is the case with int128_t
**
** You need to include this header file in your test program if you are
** using print mailbox features.
**
** Usage : #include "type128.h"
*******************************************************************************
*/

#ifndef TYPE128_H
#define TYPE128_H

#include <stdarg.h>                          /*!< for printf implementation */

typedef __uint128_t uint128_t;
typedef __int128_t int128_t;


/* Converts decimal, octal and hexadecimal numbers into string. This is used by "print_128_hex" function
   Arguments:
       num  - decimal/octal/hexadecimal number to be converted
       base - base of number system
   Returns pointer to static array containing string equivalent of numbers
*/
char *type128_convert(uint128_t num, uint128_t base) 
{ 
	static char Representation[]= "0123456789ABCDEF";
	static char buffer2[50]; 
	char *ptr; 
	
	ptr = &buffer2[49]; 
	*ptr = '\0'; 
	
	do 
	{ 
		*--ptr = Representation[num%base]; 
		num /= base; 
	}while(num != 0); 
	
	return(ptr);
}

/* Prints the hex value of the 128-bit width variable
   Arguments:
       num  - 128 bit width variable
   Returns none
*/
void print_128_hex(uint128_t num)
{
	printf(type128_convert(num, 16));
}

/* Prints the dec value of the 128-bit width variable
   Arguments:
       num  - 128 bit width variable
   Returns none
*/
void print_128_dec(uint128_t num)
{
	printf(type128_convert(num, 10));
}

#endif /* TYPE128_H */
