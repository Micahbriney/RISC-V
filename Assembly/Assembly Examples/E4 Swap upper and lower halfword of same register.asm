#-----------------------------------------------------------------------
# Subroutine: Big_swap
#
# This subroutine swaps the upper two bytes with the lower two bytes
# in register x20.
#
# Tweaked Registers: x10, x15, x20, x21
#----------------------------------------------------------------------
Big_swap:
init:		li	x20,0x0000FFFF	# lower bit mask
		li	x21,0xFFFF0000	# upper bit mask
		mv	x15,x10		# make a copy
upper:		slli	x15,x15,16	# move lower 2 bytes 16 bits to left
		and	x15,x15,x21	# clear lower 16 bits
lower:		srli	x10,x10,16	# move upper 2 bits 16 bits to right
		and	x10,x10,x20	# clear upper 16 bits
glue:		or	x10,x15,x10	# tack two results together
done: 		ret			# take it on home


#-----------------------------------------------------------------------
# Subroutine: Big_swap
#
# This subroutine swaps the upper two bytes with the lower two bytes
# in register x20.
#
# Tweaked Registers: x10, x15
#----------------------------------------------------------------------
Big_swap:
init:		mv	x15,x10		# make a copy
upper:		slli	x15,x15,16	# move lower 2 bytes 16 bits to left
lower:		srli	x10,x10,16	# move upper 2 bits 16 bits to right
glue:		or	x10,x15,x10	# tack two results together
done:		ret			# take it on home

