#!/usr/bin/env python3
#
# This is a python script converts the .bin file created by objcopy into
# .hex file for use by the zilla test bench 
#
# This script requires python3 to execute this file. This is a part of 
# Makefile inside "firmware" folder and should not be used as standalone
# script for zilla project

from sys import argv

binfile = argv[1]               #bin file
start   = int(argv[2])          #start address
stop    = int(argv[3])          #stop address
steps   = int(argv[4])          #step

#print ("start:" + str(start))
#print ("stop :" + str(stop))
#print ("steps:" + str(steps))

with open(binfile, "rb") as f:
    bindata = f.read()

#assert len(bindata) < (stop-start+1)
assert len(bindata) % steps == 0
assert steps == 4 or steps == 8

#print ("len_bindata:" + str(len(bindata)))

for i in range(start, stop, steps):
 
	if (steps == 4) :
		try:
			if ((i+4)   <= stop):
				w = bindata[i-32768 : i+4-32768]
				print("%02x%02x%02x%02x" % (w[3], w[2], w[1], w[0]))
			#else:
				#print("0")
		except:
			fault = 1
			#print("Error")

	elif (steps == 8) :
		#print("i:" + str(steps))
		try:
			if ((i+8) <= stop):
				w = bindata[i-32768 : i+8-32768]
				print("%02x%02x%02x%02x%02x%02x%02x%02x" % (w[7], w[6], w[5], w[4], w[3], w[2], w[1], w[0]))
			#else:
				#print("0")
		except:
			fault = 1
			#print("Error")

