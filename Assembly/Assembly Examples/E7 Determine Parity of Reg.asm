#---------------------------------------------------------------------------
# Subroutine: parity
#
# Determines the parity of the value in x10; returns ‘0’ in x20 if parity
# is even, otherwise returns ‘1’.
#
# Tweaked Registers: x10, x15, x20
#---------------------------------------------------------------------------
parity:
init:		mv	x15,x0		# clear an accumulator
loop:		beq	x10,x0,done	# check to see if were done
		andi	x15,x10,1	# mask LSB
		add	x20,x20,x15	# increment bit count
		srli	x10,x10,1	# shift value right 1 bit
		j loop			# rinse, repeat
done:		andi	x20,x20,1	# clear all but LSB
		ret			# take it home jimmie