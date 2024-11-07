#--------------------------------------------------------------------------------------------------
#
# 
#--------------------------------------------------------------------------------------------------
.data
#datavalues:	.word	0x11111111, 0x22222222, 0x55555555, 0xAAAAAAAA, 0xFFFFFFFF
.text
init:		li	t0,0xC0000004	#Switch port
		li	t1,0xC000000A	#LED port 
loop:		xori	t0,t0,-1	#1's compliment
		xori	t1,t1,-1	#

#-----------------------------------------------------------------------
# Read in data from the port connected to the switches, compliment
# the data, then output the data to the port connected to the LEDs.
# The port addresses for the I/O is listed in the code.
#-----------------------------------------------------------------------
.text					# we’re in the text segment
init:		li	x10,0xC0000004	# input port for switches
		li	x11,0xC000000A	# output port for LEDs
main:		lw	x15,0(x10)	# input data from switches port to x15
		xori	x15,x15,-1	# compliment data
		sw	x15,0(x11)	# output data to LED port
		j	main		# do it again
		
#-----------------------------------------------------------------------
# Read in data from the port connected to the switches, compliment
# the data, then output the data to the port connected to the LEDs.
# The port addresses for the I/O is listed in the code.
#-----------------------------------------------------------------------
.text					# we’re in the text segment
init:		li	x10,0xC0000004	# input port for switches
		li	x11,0xC000000A	# output port for LEDs
main:		lw	x15,0(x10)	# input data from switches port to x15
		not	x15,x15		# compliment data
		sw	x15,0(x11)	# output data to LED port
		j	main		# do it again