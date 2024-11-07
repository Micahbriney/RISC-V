#---------------------------------------------------------------------------
# Program: switch input monitor
#
# The program moves monitors the switches associated with the system. There
# are 16 switches, which the program reads and then outs a value to the LEDs
# according to: value 0, 1, 2, 3, none; the corresponding outputs are
# a set of four LEDs starting from the right and moving to the left. The c
# default value is all LEDs off.
#
# Tweaked Registers: x15, x16, x20, x30, x31
#---------------------------------------------------------------------------
init:		li	x30,0xc0000040	# put switch input port address in reg
		li	x31,0xc0000080	# put LED output port address in reg
		li	x15,0x00000007	# mask for switches
		mv	x20,x0		# clear counter register for input compares
main:		li	x16,0x0000000F	# start value to output
		mv	x20,x0		# clear counter register for input compares
		lw	x10,0(x30)	# get input data
		and	x10,x10,x15	# mask off lower 3 bits
chk_0:		bne	x10,x20,chk_1	# check input for 0
		sw	x16,0(x31)	# output to LEDS
		j	main
chk_1:		addi	x20,x20,1	# increment check count
		bne	x10,x20,chk_2	# check input for 1
		slli	x16,x16,4	# value to output
		sw	x16,0(x31)	# output to LEDS
		j	main
chk_2:		addi	x20,x20,1	# increment check count
		bne	x10,x20,chk_3	# check input for 2
		slli	x16,x16,8	# value to output
		sw	x16,0(x31)	# output to LEDS
		j	main
chk_3:		addi	x20,x20,1	# increment check count
		bne	x10,x20,default	# check input for 3
		slli	x16,x16,12	# value to output
		sw	x16,0(x31)	# output to LEDS
		j	main
default:	sw	x0,0(x31)
		j	main
		
		
#---------------------------------------------------------------------------
# Program: switch input monitor
#
# The program moves monitors the switches associated with the system. There
# are 16 switches, which the program reads and then outs a value to the LEDs
# according to: value 0, 1, 2, 3, none; the corresponding outputs are
# a set of four LEDs starting from the right and moving to the left. The c
# default value is all LEDs off.
#
# Tweaked Registers: x15, x16, x20, x21, x30, x31
#---------------------------------------------------------------------------
init:		li	x30,0xc0000040	# put switch output port address in register
		li	x31,0xc0000080	# put LED output port address in register
		li	x15,0x00000007	# mask for switches
		mv	x20,x0		# clear counter register for input compares
		li	x21,4		# the end count
main:		li	x16,0x0000000F	# start value to output
		mv	x20,x0		# clear counter register for input compares
		lw	x10,0(x30)	# get input data
		and	x10,x10,x15	# mask off lower 3 bits
check:		bne	x10,x20,not_eq	# check input for 0
		sw	x16,0(x31)	# output to LEDS
		j	main
not_eq:		addi	x20,x20,1	# increment compare count
		beq	x20,x21,default	# do default if count is 4
		slli	x16,x16,4	# count != 4, shift output val
		j	check		# look for next number
default:	sw	x0,0(x31)
		j	main