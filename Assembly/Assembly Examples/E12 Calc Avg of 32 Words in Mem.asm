#-----------------------------------------------------------------------
# Subroutine: avg_32
#
# Averages 32 words in memory starting at the address in x10. The
# result is stored in x20.
#
# Tweaked registers: x20,x15,x16,x11
#----------------------------------------------------------------------
avg_32:
init:		mv	x20,x0		# clear accumulator
		li	x15,32		# number to sum
		mv	x16,x10		# copy original address
loop:		beq	x15,x0,done	# leave if finished
		lw	x11,0(x10)	# get value from memory
		add	x20,x20,x11	# accumulate
		addi	x15,x15,-1	# decrement loop count
		addi	x10,x10,4	# advance addr to next data
		j	loop		# done with iteration, do again
done:		srli	x20,x20,5	# divide by 32
restore:	mv	x10,x16		# restore original x10 address
		ret			# come on up to the house