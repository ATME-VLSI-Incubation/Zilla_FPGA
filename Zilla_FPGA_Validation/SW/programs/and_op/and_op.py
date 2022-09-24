#!/usr/bin/env python3
#
# This script generates header file for I-Type and U-Type tests
from sys import argv
import random

dest_file  = argv[1]               #dest file
#test_count = argv[2]               #test count

rnd_list = []

f= open(dest_file,"w+")

f.write("/*\r\n")
f.write("**\r\n")
f.write("*******************************************************************************\r\n")
f.write("**\r\n")
f.write("** Header file for creating I-Type and U-Type tests\r\n")
f.write("**\r\n")
f.write("** Usage : #include \"ui_and_test.h\"\r\n")
f.write("*******************************************************************************\r\n")
f.write("*/\r\n")
f.write("\r\n")

f.write("#ifndef UI_AND_TEST_H\r\n")
f.write("#define UI_AND_TEST_H\r\n")
f.write("\r\n")

f.write("#ifdef SPIKE_RUN\r\n")
f.write("#include \"data.h\"               /*!< Testbench created data */\r\n")
f.write("#endif\r\n")


#f.write("#define TEST_COUNT     (%d) /*!< Test count             */\r\n" % int(test_count))
f.write("\r\n")
f.write("\r\n")


f.write("int test_ui_and_type(int num)\r\n")
f.write("{\r\n")

f.write ("volatile int testnumber=num; \r\n")

f.write("#ifdef SPIKE_RUN\r\n")
f.write("	printf(\"\\n------------------------------\");\r\n")
f.write("	printf(\"\\nTest/> Instruction 8 bit: andi\");\r\n")
f.write("	printf(\"\\n------------------------------\\n\");\r\n")
f.write("#endif\r\n")

rnd_list.clear()
for i in range(15):
	rnd_list.append(random.randint(-2047,2048))


f.write("#ifdef SPIKE_RUN\r\n")
for i in range(15):

	f.write("{	TEST_ANDI_INSN_I_SPIKE8(andi, op1, %d, result, exp_result, testnumber);\r\n" % rnd_list[i])
	f.write("	print_test_results_andi_I8(testnumber, op1, op2, result, exp_result);} \r\n")
	f.write("	testnumber++;\r\n")
f.write("#else\r\n")
for i in range(15):
	f.write("{	TEST_ANDI_INSN_I8(MAILBOX1, andi, op1, %d, result, testnumber);}\r\n" % int(rnd_list[i]))
	f.write("	testnumber++;\r\n")
f.write("#endif\r\n")

f.write("#ifdef SPIKE_RUN\r\n")
f.write("	printf(\"\\n------------------------------\");\r\n")
f.write("	printf(\"\\nTest/> Instruction 16 bit: andi\");\r\n")
f.write("	printf(\"\\n------------------------------\\n\");\r\n")
f.write("#endif\r\n")

rnd_list.clear()
for i in range(15):
	rnd_list.append(random.randint(-2047,2048))


f.write("#ifdef SPIKE_RUN\r\n")
for i in range(15):

	f.write("{	TEST_ANDI_INSN_I_SPIKE16(andi, op1, %d, result, exp_result, testnumber);\r\n" % rnd_list[i])
	f.write("	print_test_results_andi_I16(testnumber, op1, op2, result, exp_result);} \r\n")
	f.write("	testnumber++;\r\n")
f.write("#else\r\n")
for i in range(15):
	f.write("{	TEST_ANDI_INSN_I16(MAILBOX1, andi, op1, %d, result, testnumber);}\r\n" % int(rnd_list[i]))
	f.write("	testnumber++;\r\n")
f.write("#endif\r\n")


f.write("#ifdef SPIKE_RUN\r\n")
f.write("	printf(\"\\n------------------------------\");\r\n")
f.write("	printf(\"\\nTest/> Instruction 32 bit: andi\");\r\n")
f.write("	printf(\"\\n------------------------------\\n\");\r\n")
f.write("#endif\r\n")

rnd_list.clear()
for i in range(15):
	rnd_list.append(random.randint(-2047,2048))


f.write("#ifdef SPIKE_RUN\r\n")
for i in range(15):

	f.write("{	TEST_ANDI_INSN_I_SPIKE32(andi, op1, %d, result, exp_result, testnumber);\r\n" % rnd_list[i])
	f.write("	print_test_results_andi_I32(testnumber, op1, op2, result, exp_result);} \r\n")
	f.write("	testnumber++;\r\n")
f.write("#else\r\n")
for i in range(15):
	f.write("{	TEST_ANDI_INSN_I32(MAILBOX1, andi, op1, %d, result, testnumber);}\r\n" % int(rnd_list[i]))
	f.write("	testnumber++;\r\n")
f.write("#endif\r\n")


f.write("#ifdef SPIKE_RUN\r\n")
f.write("	printf(\"\\n------------------------------\");\r\n")
f.write("	printf(\"\\nTest/> Instruction 64 bit: andi\");\r\n")
f.write("	printf(\"\\n------------------------------\\n\");\r\n")
f.write("#endif\r\n")

rnd_list.clear()
for i in range(15):
	rnd_list.append(random.randint(-2047,2048))

f.write("#ifdef SPIKE_RUN\r\n")
for i in range(15):

	f.write("{	TEST_ANDI_INSN_I_SPIKE64(andi, op1, %d, result, exp_result, testnumber);\r\n" % rnd_list[i])
	f.write("	print_test_results_andi_I64(testnumber, op1, op2, result, exp_result);} \r\n")
	f.write("	testnumber++;\r\n")
f.write("#else\r\n")
for i in range(15):
	f.write("{	TEST_ANDI_INSN_I64(MAILBOX1, andi, op1, %d, result, testnumber);}\r\n" % int(rnd_list[i]))
	f.write("	testnumber++;\r\n")
f.write("#endif\r\n")
f.write("\r\n")
f.write("\r\n")


f.write("return testnumber;")



f.write("}\r\n")
f.write("\r\n")

f.write("#endif /* UI_AND_TEST_H */\r\n")

f.close() 
