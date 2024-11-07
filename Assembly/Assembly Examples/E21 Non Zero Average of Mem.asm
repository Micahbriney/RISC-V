#-----------------------------------------------------------------------
# Subroutine: nz_avg_64
#
# This subroutine finds the average of 64 non-zero unsigned words in
# memory. The first piece of data must be located at the address in	x10;
# all other data is contiguous. Any zero value does not add to the
# overall number of value being averaged. The final answer is rounded up
# as opposed to being truncated.
#
# Tweaked registers:	x25,	x20,	x11,	x10
#----------------------------------------------------------------------
#-- test code -----------------------------
.data
junk:		.word	1,2,4,8,16,0,32,64,128
.text
		la	x10,junk
#------------------------------------------
nz_avg_64:
init:		mv	x25,x0		# clear accum
		li	x11,64		# set count (8 for test code)
loop:		beq	x11,x0,done	# see if done
		lw	x20,0(x10)	# get data
		beq	x20,x0,admin	# skip if zero
more:		add	x25,x25,x20	# accumulate
		addi	x11,x11,-1	# decr loop count
admin:		addi	x10,x10,4	# advance addr
		j	loop		# rinse, repeat
done:		srli	x11,x25,5	# save lsb
		andi	x11,x11,1	# mask lsb
		srli	x25,x25,6	# take avg
		add	x25,x25,x11	# add 2^-1 bit
		ret			# take it home