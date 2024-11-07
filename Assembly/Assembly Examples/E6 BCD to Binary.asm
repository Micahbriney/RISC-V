#---------------------------------------------------------------------------
# Subroutine: bcd_to_bin
#
# Converts a 3-digit decimal number represented in the lowest three nibbles
# of x10 to the equivalent unsigned binary value and places the result
# in x20.
#
# Tweaked Registers: x15, x20, x21, x22, x23
#---------------------------------------------------------------------------
bcd_to_bin:
init:		mv	x15,x10		# save a copy
		li	x21,0x00000F00	# 100's bit mask
		li	x22,0x000000F0	# 10's bit mask
		li	x23,0x0000000F	# 1's bit mask
		mv	x20,x0		# zero accumulator
t_100:		and	x15,x15,x21	# mask 100's nibble
		srli	x15,x15,8	# shift to lowest position
loop1: 		beqz	x15,t_10	# go to tens if zero
		addi	x20,x20,100	# accumulate 100s
		addi	x15,x15,-1	# decrement loop count
		j	loop1		# do it again
t_10:		mv	x15,x10		# restore original value
		and	x15,x15,x22	# mask 10's nibble
		srli	x15,x15,4	# shift left to right-most position
loop2:		beqz	x15,t_1		# move on if it's zero
		addi	x20,x20,10	# accumulate 10 values
		addi	x15,x15,-1	# decrement loop count
		j	loop2		# do it again
t_1:		mv	x15,x10		# get original value
		and	x15,x15,x23	# mask bits
		add	x20,x20,x15	# add value to accumulator
done:		ret			# take it on home




#---------------------------------------------------------------------------
# Subroutine: bcd_to_bin
#
# Converts a 3-digit decimal number represented in the lowest three nibbles
# of x10 to the equivalent unsigned binary value and places the result
# in x20.
#
# Tweaked Registers: x15, x20, x21
#---------------------------------------------------------------------------
bcd_to_bin:
init:		mv	x15,x10		# save a copy
		li	x21,0x00000F00	# 100's bit mask
		mv	x20,x0		# zero accumulator
t_100:		and	x15,x15,x21	# mask 100's nibble
		srli	x15,x15,8	# shift to lowest position
loop1:		beqz	x15,t_10	# go to tens if zero
		addi	x20,x20,100	# accumulate 100s
		addi	x15,x15,-1	# decrement loop count
		j	loop1		# do it again
t_10:		mv	x15,x10		# restore original value
		srli	x21,x21,4	# shift the mask value to next nibble
		and	x15,x15,x21	# mask 10's nibble
		srli	x15,x15,4	# shift left to right-most position
loop2:		beqz	x15,t_1		# move on if it's zero
		addi	x20,x20,10	# accumulate 10 values
		addi	x15,x15,-1	# decrement loop count
		j	loop2		# do it again
t_1:		mv	x15,x10		# get original value
		srli	x21,x21,4	# shift the mask value to next nibble
		and	x15,x15,x21	# mask bits
		add	x20,x20,x15	# add value to accumulator
done:		ret			# take it on home