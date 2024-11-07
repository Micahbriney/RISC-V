#-----------------------------------------------------------------------
# Subroutine:		find_big_5
#
# This subroutine finds the largest of 5 continuous unsigned bytes in
# memory starting at the address store in x10.
#
#
# Tweaked registers:		x10
#----------------------------------------------------------------------
find_big_5:
store:		addi	sp,sp,-12	# room for 3 regs
		sw	x15,0(sp)	# push regs
		sw	x20,4(sp)
		sw	x21,8(sp)
init:		li	x15,5
		mv	x20,x0		# smallest possible
loop:		lbu	x21,0(x10)	# get data
		blt	x21,x20,Admin	# jump if x16>x17
		mv	x20,x21		# store new large
Admin:		addi	x10,x10,1	# incr addr
		addi	x15,x15,-1	# decr loop count
		bne	x15,x0,loop	# do it again
xfer:		mv	x10,x20		# x15 is largest
restore:	lw	x15,0(sp)	# pop regs
		lw	x20,4(sp)
		lw	x21,8(sp)
		addi	sp,sp,12	# readjust stack pointer
done:		ret			# bring it home


#-----------------------------------------------------------------------
# Subroutine:		find_big_5
#
# This subroutine finds the largest of 5 continuous unsigned bytes in
# memory starting at the address store in x10.
#
#
# Tweaked registers:		x10
#----------------------------------------------------------------------
.data					# declare data segment
junk:		.byte	2,45,4,5,6	# make up some data
.text
		la	x10,junk	# load address of data
Find_Big_5:
store:		addi	sp,sp,-12	# room for 3 regs
		sw	x15,0(sp)	# push regs
		sw	x20,4(sp)
		sw	x21,8(sp)
init:		li	x15,5
		mv	x20,x0		# smallest possible
loop:		lbu	x21,0(x10)	# get data
		blt	x21,x20,Admin	# jump if we don’t find new large
		mv	x20,x21		# store new large
Admin:		addi	x10,x10,1	# incr addr
		addi	x15,x15,-1	# decr loop count
		bne	x15,x0,loop	# do it again
xfer:		mv	x10,x20		# x15 is largest
restore:	lw	x15,0(sp)	# pop regs
		lw	x20,4(sp)
		lw	x21,8(sp)
		addi	sp,sp,12	# readjust stack pointer
done:		ret 			# bring it home