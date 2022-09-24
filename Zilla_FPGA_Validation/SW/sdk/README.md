# Software Development Kit and Tool Chain

For now we are using off the shelf RISC V GNU GCC Compiler, Later inorder to accomodate custom instruction extention we will have to udpdate the compiler. Till then steps to be followed to setup RISC V IM GCC 32 and 64 is explained below. 

## Steps to Setup GCC Tool Chain

$ cd /build

$ git clone --recursive https://github.com/riscv/riscv-gnu-toolchain

Cloning into 'riscv-gnu-toolchain'...

Submodule 'qemu' (https://git.qemu.org/git/qemu.git) registered for path 'qemu'

Submodule 'riscv-binutils' (https://github.com/riscv/riscv-binutils-gdb.git) registered for path 'riscv-binutils'

Submodule 'riscv-dejagnu' (https://github.com/riscv/riscv-dejagnu.git) registered for path 'riscv-dejagnu'

Submodule 'riscv-gcc' (https://github.com/riscv/riscv-gcc.git) registered for path 'riscv-gcc'

Submodule 'riscv-gdb' (https://github.com/riscv/riscv-binutils-gdb.git) registered for path 'riscv-gdb'

Submodule 'riscv-glibc' (https://github.com/riscv/riscv-glibc.git) registered for path 'riscv-glibc'

Submodule 'riscv-newlib' (git://sourceware.org/git/newlib-cygwin.git) registered for path 'riscv-newlib'

Submodule path 'riscv-binutils': checked out 'f35674005e609660f5f45005a9e095541ca4c5fe'

Submodule path 'riscv-dejagnu': checked out '4ea498a8e1fafeb568530d84db1880066478c86b'

Submodule path 'riscv-gcc': checked out '03cb20e5433cd8e65af6a1a6baaf3fe4c72785f6'

Submodule path 'riscv-gdb': checked out '5da071ef0965b8054310d8dde9975037b0467311'

Submodule path 'riscv-glibc': checked out '9826b03b747b841f5fc6de2054bf1ef3f5c4bdf3'

Submodule path 'riscv-newlib': checked out '415fdd4279b85eeec9d54775ce13c5c412451e08'


$ cd /build/riscv-gnu-toolchain/

$ git log 
commit b715e4f01b43efef487166f75d5d85d3c33fa7ef (HEAD -> master, origin/master, origin/HEAD)

Author: Kito Cheng 

Date:   Thu Apr 22 23:32:35 2021 +0800

    Bump riscv-binutils
        
$ cd riscv-binutils

$ git log

commit f35674005e609660f5f45005a9e095541ca4c5fe (HEAD, origin/riscv-binutils-2.36.1, origin/HEAD, riscv-binutils-2.36.1)

Author: Nick Clifton 

Date:   Sat Feb 6 09:12:37 2021 +0000

    This is 2.36.1 release
    
### Step 2 

Next we configure our build in a separate sub directory to produce a toolchain for a 32-bit RISC-V core (RV32IM), Same can be followed for 64-bit RISC-V core (RV64IM):

RV32I: Base Integer Instruction Set

M: Instructions that multiply and divide values held in two integer registers

$ cd /build/riscv-gnu-toolchain/

$ mkdir build; cd build

$ ../configure --help | grep abi

  --with-abi=lp64d        Sets the base RISC-V ABI, defaults to lp64d
  

$ ../configure --prefix=/opt/riscv32 --with-arch=rv32im --with-abi=ilp32

checking for gcc... gcc

config.status: creating Makefile

config.status: creating scripts/wrapper/awk/awk

config.status: creating scripts/wrapper/sed/sed

### Step 3

Note that ilp32 specifies that int, long, and pointers are all 32-bits

After configure is complete, we can make our code. Note that make also performs an install into the path specified by --prefix: /opt/riscv32.

$ make

$ ls

build-binutils-newlib    build-gcc-newlib-stage2  build-newlib       config.log     install-newlib-nano  scripts

build-gcc-newlib-stage1  build-gdb-newlib         build-newlib-nano  config.status  Makefile             stamps
