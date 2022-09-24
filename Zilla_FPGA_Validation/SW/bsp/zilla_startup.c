#include<stdint.h>


extern uint32_t  _start_vector;
extern uint32_t  _stored_data;
extern uint32_t  _start_data;
extern uint32_t  _end_data;
extern uint32_t  _start_bss;
extern uint32_t  _end_bss;
extern uint32_t  _end_stack;
extern uint32_t  __heap_start;
extern uint32_t  _global_pointer;

extern void main(void);

#include</home/vybhav/Documents/32_zilla/ZillaRV-Gen0-Verif/VERIFICATION/firmware/include/handlers.h>

 __attribute__((section(".isr_vector"),naked)) __attribute__((optimize ("-O1"))) void  _isr_vector(void)  {
    asm volatile("j Exception_handler_irq");
    
      asm volatile("j No_irq_handler");

	asm volatile("j No_irq_handler");

	asm volatile("j No_irq_handler");

	asm volatile("j machine_software_irq");

  	asm volatile("j No_irq_handler");

	asm volatile("j No_irq_handler");

	asm volatile("j No_irq_handler");

	asm volatile("j machine_timer_irq");

	asm volatile("j No_irq_handler");

	asm volatile("j No_irq_handler");

	asm volatile("j No_irq_handler");

	asm volatile("j machine_external_irq");

	asm volatile("j No_irq_handler");

	asm volatile("j No_irq_handler");

    asm volatile("j No_irq_handler");
    asm volatile("j irq_0_handler");
    asm volatile("j irq_1_handler");
    asm volatile("j irq_2_handler");
    asm volatile("j irq_3_handler");
    asm volatile("j irq_4_handler");
    asm volatile("j irq_5_handler");
    asm volatile("j irq_6_handler");
    asm volatile("j irq_7_handler");
    asm volatile("j irq_8_handler");
    asm volatile("j irq_9_handler");
    asm volatile("j irq_10_handler");
    asm volatile("j irq_11_handler");
    asm volatile("j irq_12_handler");
    asm volatile("j irq_13_handler");
    asm volatile("j irq_14_handler");
    asm volatile("j irq_15_handler");
    asm volatile("j irq_16_handler");
    asm volatile("j irq_17_handler");
    asm volatile("j irq_18_handler");
    asm volatile("j irq_19_handler");
    asm volatile("j irq_20_handler");
    asm volatile("j irq_21_handler");
    asm volatile("j irq_22_handler");
    asm volatile("j irq_23_handler");
    asm volatile("j irq_24_handler");
    asm volatile("j irq_25_handler");
    asm volatile("j irq_26_handler");
    asm volatile("j irq_27_handler");
    asm volatile("j irq_28_handler");
    asm volatile("j irq_29_handler");
    asm volatile("j irq_30_handler");
    asm volatile("j irq_31_handler");
    asm volatile("j irq_32_handler");
    asm volatile("j irq_33_handler");
    asm volatile("j irq_34_handler");
    asm volatile("j irq_35_handler");
    asm volatile("j irq_36_handler");
    asm volatile("j irq_37_handler");
    asm volatile("j irq_38_handler");
    asm volatile("j irq_39_handler");
    asm volatile("j irq_40_handler");
    asm volatile("j irq_41_handler");
    asm volatile("j irq_42_handler");
    asm volatile("j irq_43_handler");
    asm volatile("j irq_44_handler");
    asm volatile("j irq_45_handler");
    asm volatile("j irq_46_handler");	
    asm volatile("j irq_47_handler"); 
 }


 __attribute__((section(".init"),naked)) __attribute__((optimize ("-O1"))) void _reset(void) {
    register uint32_t *src, *dst;
    asm volatile("addi x1, x0,  0");
	asm volatile("addi x2, x0,  0");
	asm volatile("addi x3, x0,  0");
	asm volatile("addi x4, x0,  0");
	asm volatile("addi x5, x0,  0");
	asm volatile("addi x6, x0,  0");
	asm volatile("addi x7, x0,  0");
	asm volatile("addi x8, x0,  0");
	asm volatile("addi x9, x0,  0");
	asm volatile("addi x10, x0, 0");
	asm volatile("addi x11, x0, 0");
	asm volatile("addi x12, x0, 0");
	asm volatile("addi x13, x0, 0");
	asm volatile("addi x14, x0, 0");
	asm volatile("addi x15, x0, 0");
	asm volatile("addi x16, x0, 0");
	asm volatile("addi x17, x0, 0");
	asm volatile("addi x18, x0, 0");
	asm volatile("addi x19, x0, 0");
	asm volatile("addi x20, x0, 0");
	asm volatile("addi x21, x0, 0");
	asm volatile("addi x22, x0, 0");
	asm volatile("addi x23, x0, 0");
	asm volatile("addi x24, x0, 0");
	asm volatile("addi x25, x0, 0");
	asm volatile("addi x26, x0, 0");
	asm volatile("addi x27, x0, 0");
	asm volatile("addi x28, x0, 0");
	asm volatile("addi x29, x0, 0");
	asm volatile("addi x30, x0, 0");
	asm volatile("addi x31, x0, 0");
    asm volatile("la gp, _global_pointer");
    asm volatile("la sp, _end_stack");

    /* Set up vectored interrupt, with IV starting at offset 0x100 */
   // asm volatile("csrw mtvec, %0":: "r"((uint8_t *)(&_start_vector)));


 src = (uint32_t *) &_stored_data;
    dst = (uint32_t *) &_start_data;
    /* Copy the .data section from flash to RAM. */
    while (dst < (uint32_t *)&_end_data) {
        *dst = *src;
        dst++;
        src++;
    }

    /* Initialize the BSS section to 0 */
    dst = &_start_bss;
    while (dst < (uint32_t *)&_end_bss) {
        *dst = 0U;
        dst++;
    }

    /* Run the program! */
    main();

    asm volatile("tail exit");
}

