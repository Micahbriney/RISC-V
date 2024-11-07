#-----------------------------------------------------------------------
# Subroutine:		bcd_2x
#
# This subroutine multiplies the two digit BCD value in x10 by two and
# stores the result in x10.
#
# Tweaked registers:		x10, x21, x15, x25
#----------------------------------------------------------------------
bcd_2x:
init:		mv	x10,x0		# clear x10
		mv	x21,x20		# copy x 20
		mv	x15,x0		# clear carry value
ones:		andi	x21,x21,0xF	# mask low nib
		add	x21,x21,x21	# 2x low nib
		slti	x25,x21,0x0A	# check is < 10
		beq	x25,x0,fix_1s	# branch if not
		j	done_1		# jump if < 10
fix_1s:		addi	x21,x21,-10	# adjust 1's sum
		addi	x15,x15,0x10	# store carry
done_1:		add	x10,x10,x21	# accumulate 1's value
tens:		mv	x21,x20		# get copy
		andi	x21,x21, 0xF0	# mask
		add	x21,x21,x21	# 2x tens
		add	x21,x21,x15	# add carry
		slti	x25,x21,0xA0	# see if > 0xA0
		beq	x25,x0,fix_10s	# branch to fix
		j	done_10		# jump to not fix
fix_10s:	addi	x10,x10,0x100	# increment 100's digit
		addi	x21,x21,-0x0A0	# decrement 10's value
done_10:	add	x10,x10,x21	# accumulate 10's res
restore:	ret			# take it home