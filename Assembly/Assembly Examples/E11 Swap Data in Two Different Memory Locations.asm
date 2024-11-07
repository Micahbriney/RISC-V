#-----------------------------------------------------------------------
# Subroutine: mem_word_swap
#
# Swap data in the memory location specified by the contents of
# registers x20 & x21 (x20 & x21 thus contain memory address values).
#
# Tweaked registers: x30,x31
#----------------------------------------------------------------------
.text
mem_word_swap:
init:		lw	x30,0(x20)	# get data from memory
		lw	x31,0(x21)
		xor	x30,x30,x31	# the classic xor in-place data swap
		xor	x31,x31,x30
		xor	x30,x30,x31
		sw	x30,0(x20)	# store the data back at the addresses
		sw	x31,0(x21)	# the data was obtained from
		ret			# take on home