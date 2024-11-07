#---------------------------------------------------------------------------
# Program: led bouncer
#
# The program moves a single LED back and forth on an assumed 16 LED
# display. The LED output port is 0xC0000080
#
# Tweaked Registers: x10, x15, x16, x30
#---------------------------------------------------------------------------
init:		li	x30,0xc0000080	# put output port address in register
		li	x10,1		# initialize LED bounce register
		li	x15,15		# x15 used as counter register
loop:		mv	x16,x0		# clear counter register
left:		sw	x10,0(x30)	# output current LED value
		slli	x10,x10,1	# shift LED left one bit position
		addi	x16,x16,1	# increment bounce count
		bne	x16,x15,left	# check loop (goes 15) times
		mv	x16,x0		# init bounce count
right:		sw 	x10,0(x30)	# output current LED value
		srli	x10,x10,1	# shift right one bit position
		addi	x16,x16,1	# increment loop count
		bne	x16,x15,right	# branch to inner loop if loop not 15
		j 	loop		# done with right, go to left