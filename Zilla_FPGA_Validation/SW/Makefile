# Note: It seems like the riscv64-unknown-elf-gcc can also be used to generate 32bit elf files.
#    e.g. riscv64-unknown-elf-gcc -march=rv32imac -mabi=ilp32 (32bit with no FPU)
#
# Supported architectures are rv32i or rv64i plus standard extensions (a)tomics, (m)ultiplication and division, 
# (f)loat, (d)ouble, or (g)eneral for MAFD
#
# Supported ABIs are ilp32 (32-bit soft-float), ilp32d (32-bit hard-float), ilp32f (32-bit with single-precision
# in registers and double in memory, niche use only), lp64 lp64f lp64d (same but with 64-bit long and pointers).

# riscv64-unknown-elf- can target both 32-bit and 64-bit systems. It will support the most common -march/-mabi
# options, which can be seen by using the --print-multi-lib flag on either cross-compiler
#
# Command : riscv64-unknown-elf-gcc --print-multi-lib
#
# $@ stands for target     (e.g. main.o)
# $^ stands for dependency (e.g. main.c)
# $< stands for the first prerequisite
# Note: This is just for information
#
# Make file variable setting
#
# 1. Lazy set      : e.g. NAME  = value. This is normal setting of a variable. If "value" contains other variables
#                                            then the values of those variables are recursively expanded at the point
#                                            at which the variable is used
# 2. Immediate set : e.g. NAME := value. The variables of "value" are expanded and assigned at the time of declaration
#
# 3. Lazy set if absent : e.g. set NAME ?= value. Same as lazy set but values assigned only if value is not assigned earlier.
#
# 4. Append : e.g. NAME += value. Append the value to existing value
#
#    32-bit ISA - Base & Extension instruction sets
#    ----------------------------------------------
#    rv32i	Base instruction sets	
#    rv32m	extensions for multiply devide	
#    rv32a	extension for atomic operations	
#    rv32f	single-precision floating point	
#    rv32d	double-precision floating point	
#    rv32g	general for MAFD	
#    Note: There are more of this. This is just few examples

# TODO: SPIKE args for 32 & 64 bit
# 
# 
# NOTE: ZILLA supports only ISA "im".

# Python executable
$PYTHON = python3

# Start and stop addresses for instruction memory and data memory alongwith instruction width (step) and data width (step) in bytes
BIN_INST_START = 0
BIN_INST_STOP  = 163839
BIN_INST_STEP  = 4
BIN_DATA_START = 163840
BIN_DATA_STOP  = 294911
BIN_DATA_STEP  = 4

# Make file related variables 
MAKE           = make
# Current working directory (folder from where make commmand issued)
MAKE_DIR       = $(PWD)
# Absolute path of Makefile
MAKE_PATH     := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

# Default is 64bit
XLEN ?= 32

# Use Custom Toolchain for Zilla (1 = use custom toolchain, 0 = Do not use custom toolchain
CUST_TOOL ?= 0

# Paths being used in this Makefile (Note: you may make changes according to your path)

# Note: riscv64im toolchain configured with --with-arch=rv64im --with-abi=lp64

ifeq (${CUST_TOOL}, 0)# If NOT using Custom toolchain (zilla) for RISC-V
  ifeq (${XLEN}, 64) # 64-bit
    RISCV_TOOLCHAIN   = /opt/riscv64im
  else ifeq (${XLEN}, 32) # 32-bit
    RISCV_TOOLCHAIN   = /opt/riscv
  else # Default 64-bit
    RISCV_TOOLCHAIN   = /opt/riscv64im
  endif
else # If USING Custom toolchain (zilla) for RISC-V
  ifeq (${XLEN}, 64) # 64-bit
    RISCV_TOOLCHAIN   = /opt/riscv64im-cust
  else ifeq (${XLEN}, 32)
    RISCV_TOOLCHAIN   = /opt/riscv
  else # Default 64-bit
    RISCV_TOOLCHAIN   = /opt/riscv64im-cust
  endif
endif

# Firmware related paths
RISCV_BSP_PATH      = $(MAKE_PATH)/bsp
RISCV_ISA_PATH      = $(MAKE_PATH)/sdk/lib
RISCV_PROGRAMS_PATH = $(MAKE_PATH)/programs
RISCV_INCLUDE_PATH  = $(MAKE_PATH)/include

# List test programs (will give only directory names including basefolder as first item in the list)
# Note: The mindepth and maxdepth have to be 1 to avoid listing any other directories
LIST_DIRS := $(notdir $(shell find '$(MAKE_PATH)/programs/' -maxdepth 1 -mindepth 1 -type d))
TEST_DIRS  = $(sort $(LIST_DIRS))
#${shell find $(MAKE_PATH)/programs/ -type d -print}

# Name of test program
TEST                ?= hello_world

# XLEN dependent variables 
ifeq (${XLEN}, 64) # 64-bit
  PK_EXE_PATH        = $(RISCV_TOOLCHAIN)/riscv64-unknown-elf/bin
  RISCV              = $(RISCV_TOOLCHAIN)
  RISCV_TOOL_PREFIX  = $(RISCV)/bin/riscv64-unknown-elf-
  ARCH              ?= -march=rv64im
  ABI               ?= -mabi=lp64
else ifeq (${XLEN}, 32) # 32-bit
  PK_EXE_PATH        = $(RISCV_TOOLCHAIN)/riscv32-unknown-elf/bin
  RISCV              = $(RISCV_TOOLCHAIN)
  RISCV_TOOL_PREFIX  = $(RISCV)/bin/riscv32-unknown-elf-
  ARCH              ?= -march=rv32im
  ABI               ?= -mabi=ilp32
else # Default 64-bit
  PK_EXE_PATH        = $(RISCV_TOOLCHAIN)/riscv64-unknown-elf/bin
  RISCV              = $(RISCV_TOOLCHAIN)
  RISCV_TOOL_PREFIX  = $(RISCV)/bin/riscv64-unknown-elf-
  ARCH              ?= -march=rv64im
  ABI               ?= -mabi=lp64
endif

# GCC toolchain binaries
RISCV_GCC            = $(RISCV_TOOL_PREFIX)gcc
RISCV_LD             = $(RISCV_TOOL_PREFIX)ld
RISCV_READELF        = $(RISCV_TOOL_PREFIX)readelf
RISCV_OBJDUMP        = $(RISCV_TOOL_PREFIX)objdump
RISCV_AR             = $(RISCV_TOOL_PREFIX)ar
RISCV_OBJCOPY        = $(RISCV_TOOL_PREFIX)objcopy

# XLEN dependent linker scripts selection
ifeq (${XLEN}, 64) # 64-bit
# linker script
LNK_SCRIPT          = zilla_linker.ld
else ifeq (${XLEN}, 32) # 32-bit
# linker script
LNK_SCRIPT          = zilla_linker.ld
else
# linker script
LNK_SCRIPT          = zilla_linker.ld
endif

# name for the final output elf file and map file
OUT_ELF_NAME        = $(TEST).elf
OUT_MAP_NAME        = $(TEST).map
OUT_HEX_NAME_INST   = $(TEST)-inst.hex
OUT_HEX_NAME_DATA   = $(TEST)-data.hex
OUT_BIN_NAME        = $(TEST).bin

# Imperas simulator
IMPERAS_BIN_PATH    = /home/sgeuser15/Desktop/ZILLA_NEW/Imperas/imperas-riscv-tests/riscv-ovpsim/bin
IMPERAS_EXE_NAME    = $(IMPERAS_BIN_PATH)/Linux64/riscvOVPsim.exe

# Use Spike argument for gcc
# To take care of #ifdef for C programs
$SPIKE_RUN         ?= 0
$IMPERAS           ?= 0

# C flag for enabling printf statements in test programs for viewing in simulators
ifeq (${SPIKE_RUN}, 0) # No SPIKE
SPIKE_IFDEF_GCC_ARG = -USPIKE_RUN
else ifeq (${SPIKE_RUN}, 1) # SPIKE SIMULATION
SPIKE_IFDEF_GCC_ARG = -DSPIKE_RUN
else ifeq (${SPIKE_RUN}, 2) # IMPERAS SIMULATION
SPIKE_IFDEF_GCC_ARG = -DSPIKE_RUN
else # No SPIKE
SPIKE_IFDEF_GCC_ARG = -USPIKE_RUN
endif


ifeq (${AES}, 192) # No SPIKE
AES_IFDEF_GCC_ARG = -Daes_192
else ifeq (${AES}, 128) 
AES_IFDEF_GCC_ARG = -Daes_128
else ifeq (${AES}, 256) 
AES_IFDEF_GCC_ARG = -Daes_256
else # No SPIKE
AES_IFDEF_GCC_ARG = -Daes_256
endif

# C flags with ARCH, ABI and other flags
TEST_CFLAG          = $(ARCH) $(ABI) -Wall -O0 -static -pedantic -nostdlib $(SPIKE_IFDEF_GCC_ARG) $(AES_IFDEF_GCC_ARG) -I$(RISCV_INCLUDE_PATH)
TEST_PATH           = $(RISCV_PROGRAMS_PATH)/$(TEST)
TEST_SRC            = $(TEST_PATH)/$(TEST).c

# BSP related variables
BSP_CFLAG           = $(ARCH) $(ABI) -Wall -O0 -g -static -pedantic -nostdlib $(SPIKE_IFDEF_GCC_ARG) 
BSP_OBJ_DIR         = $(RISCV_BSP_PATH)
BSP_SRC             = $(RISCV_BSP_PATH)/zilla_startup.c 
BSP_OBJ             = $(RISCV_BSP_PATH)/zilla_startup.o 

# ISA static lib variables
ISA_CFLAG           = $(ARCH) $(ABI) -Wall -O0 -g -static -pedantic -nostdlib $(SPIKE_IFDEF_GCC_ARG)
ISA_OBJ_DIR         = $(RISCV_ISA_PATH)
ISA_SRC             = $(RISCV_ISA_PATH)/printf.c $(RISCV_ISA_PATH)/random.c
ISA_OBJ             = $(RISCV_ISA_PATH)/printf.o $(RISCV_ISA_PATH)/random.o
 

# linker script, map file (original linker script)
LDFLAG              = -nostartfiles -T$(RISCV_BSP_PATH)/$(LNK_SCRIPT) -Wl,-Map=$(TEST_PATH)/$(OUT_MAP_NAME)
# Note: The use of -nostartfiles will generate the elf based on linkerspcript, else main() function at 0x0 address

# static lib path and libname
LIBNAME_BSP         = libbsp-lib.a
LIBNAME_ISA         = libisa-lib.a
LIBFLAG             = -L$(RISCV_BSP_PATH) -lbsp-lib -L$(RISCV_ISA_PATH) -lisa-lib

# simulation related
SPIKE_EXE_PATH      = $(RISCV_TOOLCHAIN)/bin
SPIKE_ARGS          =--isa=RV$(XLEN)IM

# Default target
single: output $(TEST_PATH)/$(OUT_HEX_NAME_INST) $(TEST_PATH)/$(OUT_HEX_NAME_DATA)
ifeq (${SPIKE_RUN}, 1)# Spike simulation
	@echo ""
	@echo Simulating $(OUT_ELF_NAME) using spike...
	@echo ""
	$(SPIKE_EXE_PATH)/spike $(SPIKE_ARGS) $(PK_EXE_PATH)/pk $(TEST_PATH)/$(OUT_ELF_NAME)
	@echo ""
	@echo End of spike simulation!
	@echo ""
else ifeq (${SPIKE_RUN}, 2)# Imperas simulation
	@echo ""
	@echo Simulating $(OUT_ELF_NAME) using imperas...
	@echo ""
	$(IMPERAS_EXE_NAME) --program $(TEST_PATH)/$(OUT_ELF_NAME) --variant RV$(XLEN)I --override riscvOVPsim/cpu/add_Extensions=M
	@echo ""
	@echo End of imperas simulation!
	@echo ""
else
	@echo ""
	@echo "Skipping riscv simulation..."
	@echo
endif

all: 
	for dir_name in $(TEST_DIRS) ; do \
        make -C $(MAKE_PATH) TEST=$$dir_name  XLEN=$(XLEN) ; \
        done

$(TEST_PATH)/$(OUT_HEX_NAME_INST): $(TEST_PATH)/$(OUT_BIN_NAME) $(RISCV_BSP_PATH)/makehex.py
	chmod +x $(RISCV_BSP_PATH)/makehex.py
	$(PYTHON) $(RISCV_BSP_PATH)/makehex.py $< $(BIN_INST_START) $(BIN_INST_STOP) $(BIN_INST_STEP) > $@

$(TEST_PATH)/$(OUT_HEX_NAME_DATA): $(TEST_PATH)/$(OUT_BIN_NAME) $(RISCV_BSP_PATH)/makehex.py
	chmod +x $(RISCV_BSP_PATH)/makehex.py
	$(PYTHON) $(RISCV_BSP_PATH)/makehex.py $< $(BIN_DATA_START) $(BIN_DATA_STOP) $(BIN_DATA_STEP) > $@


$(TEST_PATH)/$(OUT_BIN_NAME): $(TEST_PATH)/$(OUT_ELF_NAME)
	$(RISCV_OBJCOPY) -O binary $< $@
	chmod -x $@

output: bsp_lib isa_lib $(TEST).o
	$(RISCV_GCC) $(TEST_PATH)/$(TEST).o $(LDFLAG) $(LIBFLAG) -o $(TEST_PATH)/$(OUT_ELF_NAME)

	$(RISCV_OBJCOPY) -O binary $(TEST_PATH)/$(OUT_ELF_NAME) $(TEST_PATH)/$(OUT_BIN_NAME)
	$(RISCV_OBJDUMP) -d $(TEST_PATH)/$(OUT_ELF_NAME) > $(TEST_PATH)/$(TEST).objdump

$(TEST).o:
ifeq (${SPIKE_RUN},0)
	
ifeq (${TEST},addition)
	@echo "[Make] Generating I-type and U-Type test header"
	chmod +x $(TEST_PATH)/$(TEST).py
	$(PYTHON) $(TEST_PATH)/$(TEST).py $(RISCV_INCLUDE_PATH)/ui_test.h #$(TEST_CNT)
endif

ifeq (${TEST},custom)
	@echo "[Make] Generating I-type and U-Type test header"
	chmod +x $(TEST_PATH)/$(TEST).py
	$(PYTHON) $(TEST_PATH)/$(TEST).py $(RISCV_INCLUDE_PATH)/ui_cust_test.h $(TEST_CNT)
endif

ifeq (${TEST},and_op)
	@echo "[Make] Generating I-type and U-Type test header"
	chmod +x $(TEST_PATH)/$(TEST).py
	$(PYTHON) $(TEST_PATH)/$(TEST).py $(RISCV_INCLUDE_PATH)/ui_and_test.h $(TEST_CNT)
endif

ifeq (${TEST},or_op)
	@echo "[Make] Generating I-type and U-Type test header"
	chmod +x $(TEST_PATH)/$(TEST).py
	$(PYTHON) $(TEST_PATH)/$(TEST).py $(RISCV_INCLUDE_PATH)/ui_or_test.h $(TEST_CNT)
endif

ifeq (${TEST},xor_op)
	@echo "[Make] Generating I-type and U-Type test header"
	chmod +x $(TEST_PATH)/$(TEST).py
	$(PYTHON) $(TEST_PATH)/$(TEST).py $(RISCV_INCLUDE_PATH)/ui_xor_test.h $(TEST_CNT)
endif

ifeq (${TEST},srl_op)
	@echo "[Make] Generating I-type and U-Type test header"
	chmod +x $(TEST_PATH)/$(TEST).py
	$(PYTHON) $(TEST_PATH)/$(TEST).py $(RISCV_INCLUDE_PATH)/ui_srl_test.h $(TEST_CNT)
endif

ifeq (${TEST},slt_op)
	@echo "[Make] Generating I-type and U-Type test header"
	chmod +x $(TEST_PATH)/$(TEST).py
	$(PYTHON) $(TEST_PATH)/$(TEST).py $(RISCV_INCLUDE_PATH)/ui_slt_test.h $(TEST_CNT)
endif

ifeq (${TEST},shift_op)
	@echo "[Make] Generating I-type and U-Type test header"
	chmod +x $(TEST_PATH)/$(TEST).py
	$(PYTHON) $(TEST_PATH)/$(TEST).py $(RISCV_INCLUDE_PATH)/ui_shift_test.h $(TEST_CNT)
endif

ifeq (${TEST},sra_op)
	@echo "[Make] Generating I-type and U-Type test header"
	chmod +x $(TEST_PATH)/$(TEST).py
	$(PYTHON) $(TEST_PATH)/$(TEST).py $(RISCV_INCLUDE_PATH)/ui_sra_test.h $(TEST_CNT)
endif

ifeq (${TEST},sanity_isa_1)
	@echo "[Make] Generating I-type and U-Type test header"
	chmod +x $(TEST_PATH)/$(TEST).py
	$(PYTHON) $(TEST_PATH)/$(TEST).py $(RISCV_INCLUDE_PATH)/ui_sanity_isa_1.h $(TEST_CNT)
endif

ifeq (${TEST},load_store_1)
	@echo "[Make] Generating I-type and U-Type test header"
	chmod +x $(TEST_PATH)/$(TEST).py
	$(PYTHON) $(TEST_PATH)/$(TEST).py $(RISCV_INCLUDE_PATH)/ui_load_store_1_test.h $(TEST_CNT)
endif
ifeq (${TEST},load_store_2)
	@echo "[Make] Generating I-type and U-Type test header"
	chmod +x $(TEST_PATH)/$(TEST).py
	$(PYTHON) $(TEST_PATH)/$(TEST).py $(RISCV_INCLUDE_PATH)/ui_load_store_2_test.h $(TEST_CNT)
endif

ifeq (${TEST},load_store_3)
	@echo "[Make] Generating I-type and U-Type test header"
	chmod +x $(TEST_PATH)/$(TEST).py
	$(PYTHON) $(TEST_PATH)/$(TEST).py $(RISCV_INCLUDE_PATH)/ui_load_store_3_test.h $(TEST_CNT)
endif

ifeq (${TEST},lui)
	@echo "[Make] Generating I-type and U-Type test header"
	chmod +x $(TEST_PATH)/$(TEST).py
	$(PYTHON) $(TEST_PATH)/$(TEST).py $(RISCV_INCLUDE_PATH)/ui_lui_test.h $(TEST_CNT)
endif

ifeq (${TEST},auipc)
	@echo "[Make] Generating I-type and U-Type test header"
	chmod +x $(TEST_PATH)/$(TEST).py
	$(PYTHON) $(TEST_PATH)/$(TEST).py $(RISCV_INCLUDE_PATH)/ui_auipc_test.h $(TEST_CNT)
endif



endif
	$(RISCV_GCC) $(TEST_SRC) -c $(TEST_CFLAG) -o $(TEST_PATH)/$(TEST).o

isa_lib: $(ISA_OBJ) 
	$(RISCV_AR) rcs $(RISCV_ISA_PATH)/$(LIBNAME_ISA) $(ISA_OBJ)

$(ISA_OBJ_DIR)/%.o : $(ISA_OBJ_DIR)/%.c
	$(RISCV_GCC) $(ISA_CFLAG) -c $< -o $@

bsp_lib: $(BSP_OBJ) 
	$(RISCV_AR) rcs $(RISCV_BSP_PATH)/$(LIBNAME_BSP) $(BSP_OBJ)

$(BSP_OBJ_DIR)/%.o : $(BSP_OBJ_DIR)/%.c
	$(RISCV_GCC) $(BSP_CFLAG) -c $< -o $@
	
$(BSP_OBJ_DIR)/%.o : $(BSP_OBJ_DIR)/%.S
	$(RISCV_GCC) $(BSP_CFLAG) -c $< -o $@

symbols: 
	$(RISCV_READELF) -s $(TEST_PATH)/$(OUT_ELF_NAME)

headers: 
	$(RISCV_READELF) -h $(TEST_PATH)/$(OUT_ELF_NAME)

disassembly: 
	$(RISCV_OBJDUMP) -d $(TEST_PATH)/$(OUT_ELF_NAME)

simulate: 
	$(SPIKE_EXE_PATH)/spike $(SPIKE_ARGS) $(PK_EXE_PATH)/pk $(TEST_PATH)/$(OUT_ELF_NAME)

clean: 
	rm -rf $(BSP_OBJ) $(RISCV_BSP_PATH)/$(LIBNAME_BSP)
	rm -rf $(ISA_OBJ) $(RISCV_ISA_PATH)/$(LIBNAME_ISA)
	for dir_name in $(TEST_DIRS) ; do \
        rm -rf $(MAKE_PATH)/programs/$$dir_name/$$dir_name.o ; \
        rm -rf $(MAKE_PATH)/programs/$$dir_name/$$dir_name.elf ; \
        rm -rf $(MAKE_PATH)/programs/$$dir_name/$$dir_name.map ; \
        rm -rf $(MAKE_PATH)/programs/$$dir_name/$$dir_name.bin ; \
        rm -rf $(MAKE_PATH)/programs/$$dir_name/$$dir_name.hex ; \
        rm -rf $(MAKE_PATH)/programs/$$dir_name/$$dir_name-inst.hex ; \
        rm -rf $(MAKE_PATH)/programs/$$dir_name/$$dir_name-data.hex ; \
        rm -rf $(MAKE_PATH)/programs/$$dir_name/$$dir_name.objdump ; \
        rm -rf $(MAKE_PATH)/programs/$$dir_name/pc_monitor.txt; \
        done

vars:
	@echo "   make variables:"
	@echo "   MAKE                 = $(MAKE)"
	@echo "   MAKE_DIR             = $(MAKE_DIR)"
	@echo "   MAKE_PATH            = $(MAKE_PATH)"
	@echo "   MAKEFILE_LIST        = $(MAKEFILE_LIST)"
	@echo "   XLEN                 = $(XLEN)"
	@echo "   RISCV_TOOLCHAIN      = $(RISCV_TOOLCHAIN)"
	@echo "   RISCV_BSP_PATH       = $(RISCV_BSP_PATH)"
	@echo "   RISCV_PROGRAMS_PATH  = $(RISCV_PROGRAMS_PATH)"
	@echo "   TEST                 = $(TEST)"
	@echo "   SPIKE_EXE_PATH       = $(SPIKE_EXE_PATH)"
	@echo "   PK_EXE_PATH          = $(PK_EXE_PATH)"
	@echo "   SPIKE_ARGS           = $(SPIKE_ARGS)"
	@echo "   RISCV                = $(RISCV)"
	@echo "   RISCV_TOOL_PREFIX    = $(RISCV_TOOL_PREFIX)"
	@echo "   RISCV_GCC            = $(RISCV_GCC)"
	@echo "   RISCV_LD             = $(RISCV_LD)"
	@echo "   RISCV_READELF        = $(RISCV_READELF)"
	@echo "   RISCV_OBJDUMP        = $(RISCV_OBJDUMP)"
	@echo "   ARCH                 = $(ARCH)"
	@echo "   ABI                  = $(ABI)"
	@echo "   LNK_SCRIPT           = $(LNK_SCRIPT)"
	@echo "   OUT_ELF_NAME         = $(OUT_ELF_NAME)"
	@echo "   OUT_MAP_NAME         = $(OUT_MAP_NAME)"
	@echo "   TEST_CFLAG           = $(TEST_CFLAG)"
	@echo "   LDFLAG               = $(LDFLAG)"
	@echo "   BSP_CFLAG            = $(BSP_CFLAG)"
	@echo "   BSP_OBJ_DIR          = $(BSP_OBJ_DIR)"
	@echo "   BSP_SRC              = $(BSP_SRC)"
	@echo "   BSP_OBJ              = $(BSP_OBJ)"
	@echo "   ISA_CFLAG            = $(ISA_CFLAG)"
	@echo "   ISA_OBJ_DIR          = $(ISA_OBJ_DIR)"
	@echo "   ISA_SRC              = $(ISA_SRC)"
	@echo "   ISA_OBJ              = $(ISA_OBJ)"
	@echo "   LIBNAME_BSP          = $(LIBNAME_BSP)"
	@echo "   LIBNAME_ISA          = $(LIBNAME_ISA)"
	@echo "   LIBFLAG              = $(LIBFLAG)"
	@echo "   CUST_TOOL            = $(CUST_TOOL)"

