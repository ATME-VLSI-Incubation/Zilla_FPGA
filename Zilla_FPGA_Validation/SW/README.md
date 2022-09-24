# FIRMWARE

This folder contains sdk, bsp, include, programs and a Makefile. The Makefile is used to run the test programs
inside the folder "programs" with subfolders targetting each test. As of now only one "hello_world"
test is written which simply outputs "\nHello world - from Zilla\n" when run using spike and pk.

## Directory Structure:

```
RISCV-Gen1
          ├─.....
          ├─.....
          ├─VERIFICATION
               ├─firmware
                  ├──bsp               # contains board support package files
                  ├──include           # contains header files for use with test programs
                  ├──programs          # contains test programs in subfolders (e.g.hello_world)
                  ├──sdk               # contains readme explaining tool chain installation
                  ├──Makefile          # makefile used to build the firmware from the test programs
                  └──README.md         # this file

```

## Files in this Directory

#### [bsp](https://github.com/siddarth96/RISCV-Gen1/tree/main/VERIFICATION/firmware/bsp)
This contains board support packages. It includes a linker script, startup_code, vector_table, a Makefile.

#### [include](https://github.com/siddarth96/RISCV-Gen1/tree/main/VERIFICATION/firmware/include)
This contains header files for use with test programs.

#### [programs](https://github.com/siddarth96/RISCV-Gen1/tree/main/VERIFICATION/firmware/programs)
This contains subfolders with name corresponding to test name.

#### [Makefile](https://github.com/siddarth96/RISCV-Gen1/tree/main/VERIFICATION/firmware/Makefile)
This make file is used to create elf executable for riscv.

## Pre-Requisites

#### GNU Make

GNU Make is a tool which controls the generation of executables and other non-source files of a program from the program's source files

## Steps to Run tests

Open a terminal window. Change directory to "firmware". Then simply give command "make" with options for TEST, XLEN and SPIKE_RUN.

e.g. make TEST=hello_world XLEN=64 SPIKE_RUN=1
     where, TEST parameter tells which test program to run. Here the test program "hello_world.c" at location
     "firmware/programs/hello_world/hello_world.c" will be used. The parameter XLEN tells if its 64bit or 32bit.
     Here in this case it is XLEN=64, i.e. 64-bit. The parameter SPIKE_RUN=1 indicates simulate program using
     spike simulator and by default (in the absence SPIKE_RUN argument) SPIKE_RUN will be 0 ). When the SPIKE_RUN=1, 
     a preprocessor symbol "SPIKE_RUN" will be defined and used at the time of C compilation processs. This symbol
     decides if printf statements need to be used or not in C programs with conditional compilation.

###### Example

To run the simple "general" test, give the command as below,

    cd firmware
    make TEST=general XLEN=64

Note: More options need to be implemened at later stage and this is minimal working code

###### More Examples

Command example 1: make
		   This will take the default values for arguments as below,
		   TEST=hello_world XLEN=64 SPIKE_RUN=0.
		   This example "hello_world" will not use printf and also, will not simulate using spike or imperas.

Command example 2: make TEST=general XLEN=64 SPIKE_RUN=1
		   This example "general" will use printf and also, will simulate using spike since the SPIKE_RUN=1 here.

Command example 3: make TEST=general XLEN=64 SPIKE_RUN=2
		   This example "general" will use printf and also, will simulate using imperas since the SPIKE_RUN=2 here.

Command example 4: make all
		   This example will search all test cases and build elf, bin, hex files for all
		   available test programs. The TEST argument has no effect if "all" target used.
		   You may use XLEN and SPIKE_RUN parameters if needed. 
		   By default, XLEN=64 and SPIKE_RUN=0

Command example 5: make clean
		   This example will clean all .elf, .bin, hex, .o, .a files for all available test programs.
		   The TEST, XLEN, SPIKE_RUN arguments has no effect if "clean" target used.


