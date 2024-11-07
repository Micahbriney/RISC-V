#-----------------------------------------------------------------------
# Subroutine: Cnt_incr
#
# This subroutine goes to a specific address in memory and counts
# how many pieces of data are both non-zero and increasing. The count
# is returned in x12.
#
#
# Tweaked registers: x10,x11,x12,x15
#----------------------------------------------------------------------
#.data
#junk: .byte -6, -2, 1, 1, 3, 8, 8
#
#.text
# la x15,junk
Cnt_incr:
init:		mv	x12,x0		# counter reg
		lb	x10,0(x15)	# get first piece of data
		beq	x10,x0,done	# quit if data=0
		addi	x15,x15,1	# increment address
		addi	x12,x12,1	# increment counter
loop:		lb	x11,0(x15)	# get more data
		beq	x11,x0,done	# quit if data=0
		ble	x11,x10,done	# quit if not greater than
admin:		mv	x10,x11		# store last data
		addi	x15,x15,1	# incr address
		addi	x12,x12,1	# incr counter
		j	loop		# do it again
done:		ret			# take it home