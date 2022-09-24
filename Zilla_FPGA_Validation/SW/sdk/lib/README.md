# Source files for creation of instruction equivalent Custom library 

For now the folder contains some S (asembly) source files which are using custom functions for some operations.
These files will be compiled and included with the final executable when you run the the tests under "programs"
folder.

The Makefile inside "firmware" folder will use these files during compilation.

e.g.

To test the custom library written in assembly, you may run the following test using Makefile in
"firmware" folder.

make TEST=multiple_access SPIKE_RUN=1


# Custom library generation steps

The compilation steps where the custom library involved are as below. These steps explain how the various files are compiled 
together. However, the Makefile in "firmware" folder will do the jobs for you and hence you need not worry about the steps below.
The below details are just for information.

Note: Assume $(firmware) is the environment path for "firmware" folder.

##Generate object file (.o) from assembly file (.s):

riscv64-unknown-elf-gcc -march=rv64im -mabi=lp64 -Wall -O0 -g -static -pedantic -nostdlib -DSPIKE_RUN -c $(firmware)/sdk/lib/multi_acc.S -o $(firmware)/sdk/lib/multi_acc.o

##Generate satic library (.a) from object file (.o):

riscv64-unknown-elf-ar rcs $(firmware)/sdk/lib/libisa-lib.a $(firmware)/sdk/lib/multi_acc.o

##Generate object file (.o) for test program (.c):

riscv64-unknown-elf-gcc $(firmware)/programs/multiple_access/multiple_access.c -c -march=rv64im -mabi=lp64 -Wall -O0 -static -pedantic -nostdlib -DSPIKE_RUN -o $(firmware)/programs/multiple_access/multiple_access.o

##Generate final ELF (.elf) file altogether:

riscv64-unknown-elf-gcc $(firmware)/programs/multiple_access/multiple_access.o -nostartfiles -T$(firmware)/bsp/zilla_gen0.ld -Wl,-Map=$(firmware)/programs/multiple_access/multiple_access.map -L$(firmware)/bsp -lbsp-lib -L$(firmware)/sdk/lib -lisa-lib -o $(firmware)/programs/multiple_access/multiple_access.elf




 
