#-----------------------------------------------------------------------
# Subroutine:		find_big_uhalf
#
# This subroutine finds the largest of continuous unsigned halfwords
# starting at the data memory address in x10. The number of halfwords
# the subroutine inspects is passed in x11. The largest value is
# passed back to the subroutine in x15.
#
# Tweaked registers:		x15
#----------------------------------------------------------------------
find_big_uhalf:
store:		addi	sp,sp,-16	# room for 4 regs
		sw	x15,0(sp)	# push 4 regs
		sw	x20,4(sp)
		sw	x21,8(sp)
		sw	x11,12(sp)
init:		mv	x20,x0		# smallest possible
loop:		lbu	x21,0(x10)	# get data
		blt	x21,x20,Admin	# jump if we don’t find new large
		mv	x20,x21		# store new large
Admin:		addi	x10,x10,2	# incr addr by halfword	#bytes
		addi	x11,x11,-1	# decr loop count
		bne	x15,x0,loop	# do it again
xfer:		mv	x10,x20		# x15 is largest
restore:	lw	x15,0(sp)	# pop four pushed regs
		lw	x20,4(sp)
		lw	x21,8(sp)
		lw	x11,12(sp)
		addi	sp,sp,16	# readjust stack pointer
done:		ret			# bring it home