################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
ELFSIZE += \
MicroBlaze_Uart_Gpio.elf.size \


# All Target
all: MicroBlaze_Uart_Gpio.elf secondary-outputs

# Tool invocations
MicroBlaze_Uart_Gpio.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MicroBlaze gcc linker'
	mb-gcc -Wl,-T -Wl,../src/lscript.ld -LD:/FPGA_Projects/Workspace/MicroBlaze_Uart_Gpio_wrapper/export/MicroBlaze_Uart_Gpio_wrapper/sw/MicroBlaze_Uart_Gpio_wrapper/domain_microblaze_0/bsplib/lib -mlittle-endian -mcpu=v11.0 -mxl-soft-mul -Wl,--no-relax -Wl,--gc-sections -o "MicroBlaze_Uart_Gpio.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

MicroBlaze_Uart_Gpio.elf.size: MicroBlaze_Uart_Gpio.elf
	@echo 'Invoking: MicroBlaze Print Size'
	mb-size MicroBlaze_Uart_Gpio.elf  |tee "MicroBlaze_Uart_Gpio.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(S_UPPER_DEPS)$(C_DEPS)$(ELFSIZE) MicroBlaze_Uart_Gpio.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE)

.PHONY: all clean dependents

-include ../makefile.targets
