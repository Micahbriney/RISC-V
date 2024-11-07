#-----------------------------------------------------------------------
# Subroutine: abs_mem
#
# This subroutine multiplies takes the absolute value of signed bytes
# in memory starting at the address in x10, and does this for the number
# of values represented by the count in x11.
#
# Tweaked registers: none
#----------------------------------------------------------------------
#----------- test code ------------------------
#.data
#junk: .byte -3,-5,4,8,-11
#
#.text
# li x11,5
# la x10,junk
#----------- test code ------------------------
abs_mem:
store:		addi	sp,sp,-12	# room on stack
		lw	x10,0(sp)	# push regs
		lw	x11,4(sp)
		lw	x12,8(sp)
init:					# nothing to init
loop:		beq	x11,x0,done	# check if zero
		lb	x20,0(x10)	# load value
		bge	x20,x0,write	# br if > 0
		neg	x20,x20		# change sign
write:		sb	x20,0(x10)	# store value
admin:		addi	x10,x10,1	# incr addr
		addi	x11,x11,-1	# decr loop count
		j	loop		# do again
done:
rstore:		lw	x10,0(sp)	# pop regs
		lw	x11,4(sp)
		lw	x12,8(sp)
		addi	sp,sp,12	# adjust sp
		ret			# bring it home