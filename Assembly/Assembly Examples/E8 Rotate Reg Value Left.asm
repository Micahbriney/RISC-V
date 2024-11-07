#---------------------------------------------------------------------------
# Subroutine: rot_left
#
# This routine performs a rotate left on the value in x10 by rotating
# x10 by the value provided x11. The value in x11 must be [0,32].
#
# Tweaked Registers: x25, x30, x10
#---------------------------------------------------------------------------
rot_left:
init:		li	x25,32		# 32 is the length of registers
		sub	x25,x25,x11	# get the complement of 32
		mv	x30,x10		# copy x10 to working register
		sll	x10,x10,x11	# shift the lower bits left
		srl	x30,x30,x25	# shift the upper bits right
		or	x10,x30,x10	# glue the results together
done:		ret			# go home, all the way home