/*
**
*******************************************************************************
**
** Header file for including print mailboxes.
** 
** Memory address inside RAM will be written by C code,
** The test bench polls the adddress location and ensures
** That it prints the message dropped in mailbox into terminal
**
** You need to include this header file in your test program if you are
** using print mailbox features.
**
** Usage : #include "print.h"
*******************************************************************************
*/

#ifndef PRINT_H
#define PRINT_H

#include <stdarg.h>                          /*!< for printf implementation */
#include "linker.h"                          /*!< Linker symbols library    */

/* OUTPORT refers to mailbox to which messages need to be pushed */
#define OUTPORT (&__mailbox_print__)

/* Function declaration */
char *z_convert(uint64_t num, uint64_t base);

/* print single character */
void print_chr(char ch)
{
	*((volatile char*)OUTPORT) = ch;
}

/* print string (stream of characters until '\0') */
void print_str(const char *p)
{
	int i = 0;
	while (*p != 0) {
		*((volatile char*)OUTPORT+i) = *(p++);
		i++;}
	
}


/* Puts string (out of formatted data) into mailbox. This is used by "z_printf" function
   Arguments:
       m - pointer to mailbox
       s - pointer to string out of formatted string
   Returns nothing.
*/
char* z_puts (char* m, char* s)
{
	while(*s != '\0')
	*(m++) = *(s++);

	return m;
}

/* Converts decimal, octal and hexadecimal numbers into string. This is used by "z_printf" function
   Arguments:
       num  - decimal/octal/hexadecimal number to be converted
       base - base of number system
   Returns pointer to static array containing string equivalent of numbers
*/
char *z_convert(uint64_t num, uint64_t base) 
{ 
	static char Representation[]= "0123456789ABCDEF";
	static char buffer[50]; 
	char *ptr; 
	
	ptr = &buffer[49]; 
	*ptr = '\0'; 
	
	do 
	{ 
		*--ptr = Representation[num%base]; 
		num /= base; 
	}while(num != 0); 
	
	return(ptr);
}


/* mailbox z_printf function prints formatted string into mailbox. Here we are using Ellipsis
   (...) which allows the function to accept an indeterminate number of arguments. We will
   read the formatted string and replace the format specifiers with the characters corresponding
   values of parameters (variables) passed.

   Currently supported format specifiers are : %c %d %s %x %o %x
   Note: %x and %X both will display in upper case

   WARNING!!!!: the max number of arguments (formatted string) is only 4 under spike simulator.
   This could be because of ellipsis limitations on number of arguments. But you may use 1 to 4
   arguments as of now. Providing more than 4 arguments will result in segfault error in spike.
   */
void z_printf(char* format,...) 
{ 
	static uint32_t function_call_count = 0;
	function_call_count++;

	char *traverse = 0;             /* pointer for traversing formatted string */
	int64_t     si = 0;             /* holds signed integer/character values for conversion into characters */ 
	int64_t     ui = 0;             /* holds unsigned signed integer values for conversion into characters */   
	char        *s = 0;             /* holds string value for conversion into characters */

	uint64_t mailbox_len = (uint64_t)&__mailbox_print_len__;             /* len */
        char *mailbox_p  = (char *) OUTPORT;                  /* start pointer */
	char *mailbox_ep = (char *) OUTPORT + mailbox_len-1;  /* end pointer */
	*mailbox_ep = '\0';

#ifdef SPIKE_RUN
	printf("z_printf/> Function call count (decimal) = %d\n", function_call_count);
	printf("z_printf/> Print Mailbox Len             = 0x%x\n", mailbox_len);
	printf("z_printf/> Print Mailbox Start Pointer   = 0x%p\n", mailbox_p);
	printf("z_printf/> Print Mailbox End Pointer     = 0x%p\n", mailbox_ep); 
#endif

	/* Create a pointer to hold the function arguments using "va_list" macro from stdarg.h */
	va_list arg; 
        
        /* Points "arg" to the first un-named argument, assumes that "format" is the last named argument */
	va_start(arg, format); 
        
        /* Note: "format" contains the formatted string (including format specifiers as characters) */

        /* Iterate through all values of "format", display characters and display characters converted out of format specifier */
	for(traverse = format; (*traverse != '\0') && (mailbox_p <= mailbox_ep); traverse++) 
	{ 	
		if( mailbox_p > mailbox_ep)
		{
#ifdef SPIKE_RUN
			printf("z_printf/> print mailbox overflow! part of the message will not be printed!\n");
			printf("z_printf/> Print Mailbox Current Pointer   = 0x%p\n", (void *)mailbox_p);
#endif
			/* Close argument list to necessary clean-up */
			va_end(arg); 

			/* stop writing */
			return;
		}
                /* If the character is not '%' */
		while( *traverse != '%' ) 
		{      

#ifdef SPIKE_RUN
			//printf("z_printf/> Current Character and index : *traverse[0x%p] = %d\n", mailbox_p, *traverse);
#endif     
			if(( mailbox_p > mailbox_ep) || (*traverse == '\0'))
			{
#ifdef SPIKE_RUN
				printf("z_printf/> print mailbox overflow / NULL character!\n");
				printf("z_printf/> Print Mailbox Current Pointer   = 0x%p\n", mailbox_p);
				printf("z_printf/> Current character : ASCII Value = %c : %d\n", *traverse, *traverse);
#endif

				/* Close argument list to necessary clean-up */
				va_end(arg); 

				/* stop writing */
				return;
			}

			*(mailbox_p++) = *traverse;           /* Print the characters, as is */ 
			traverse++;                           /* point next */
		} 

		/* Pointer is pointing to '%' now, we need the format (c, d, s, etc) so point next */
		traverse++; 

		if(*traverse == '\0') /* Null character */
		{
#ifdef SPIKE_RUN
				printf("z_printf/> NULL character!\n");
				printf("z_printf/> Current character : ASCII Value = %c : %d\n", *traverse, *traverse);
#endif

				/* Close argument list to necessary clean-up */
				va_end(arg); 

				/* stop writing */
				return;	
		}
		
		/* Fetching and executing arguments */
		switch(*traverse) 
		{ 			
			case 'c' : /* Character argument */
			{
				si = va_arg(arg,int);          /* fetch character argument and store in i */
				*(mailbox_p++) = si;           /* print char */
				break;
			}
			
			case 'd' : /* Decimal/Integer argument */
			{
				si = va_arg(arg, int);         /* fetch decimal/integer argument and store in i */
				if(si<0)                       /* If negative number, */
				{ 
					si = -si;              /* Convert into positive for number conversion */
					*(mailbox_p++) = '-';  /* print -ve sign */
				} 
				mailbox_p = z_puts(mailbox_p, z_convert(si,10));  /* convert and print string */
				break;
			}
			case 'u' : /* Decimal/Integer argument */
			{
				ui = va_arg(arg, unsigned int);         /* fetch decimal/integer argument and store in i */
				mailbox_p = z_puts(mailbox_p, z_convert(ui,10));  /* convert and print string */
				break;
			}

            case 'l' : /* Decimal/Integer argument */
			{
				ui = va_arg(arg, unsigned long int);         /* fetch decimal/integer argument and store in i */
				mailbox_p = z_puts(mailbox_p, z_convert(ui,10));  /* convert and print string */
				break;
			}



			case 'o': /* Octal argument */
			{
				ui = va_arg(arg,unsigned int);
				mailbox_p = z_puts(mailbox_p, z_convert(ui,8));  /* convert and print string */
				break;
			}
			
			case 's': /* String argument */		
			{
				s = va_arg(arg,char *);
				mailbox_p = z_puts(mailbox_p, s);  /* print string */
				break;
			}

			case 'X': /* Hexadecimal argument */
			case 'x': /* Hexadecimal argument */
			{
				ui = va_arg(arg,uint64_t);
				mailbox_p = z_puts(mailbox_p, z_convert(ui,16));  /* convert and print string */
				break;
			}
		
			default : /* Default */
			{
				/* Do nothing */
				break;
			}
		}	
	} 
	
	/* Close argument list to necessary clean-up */
	va_end(arg); 
} 

#endif /* PRINT_H */
