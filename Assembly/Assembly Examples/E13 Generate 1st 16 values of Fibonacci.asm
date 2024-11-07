#-----------------------------------------------------------------------
# Subroutine: gen_fib_16
#
# Generates the first 16 Fibonacci numbers (starting with 1,1,...) and
# stores the numbers as halfwords in memory starting at the address
# stored in x25.
#
# Tweaked registers: none
#----------------------------------------------------------------------
gen_fib_16:
store:		addi	sp,sp,-20	# adjust sp to save 5 regs
		sw	x20,0(sp)	# save x20
		sw	x21,4(sp)	# save x21
		sw	x25,8(sp)	# save x25
		sw	x15,12(sp)	# save x15
		sw	x16,16(sp)	# save x16
init:		li	x20,14		# load loop count
		li	x21,1		# load initial fib number
		sh	x21,0(x25)	# store first two fib numbers
		sh	x21,2(x25)
		addi	x25,x25,4	# adjust the pointer forward
loop:		beq	x20,x0,done	# done yet?
		lhu	x15,-4(x25)	# get two previous values
		lhu	x16,-2(x25)
		add	x15,x15,x16	# add two previous value
		sh	x15,0(x25)	# store result of addition
		addi	x20,x20,-1	# loop admin: decrement loop count
		addi	x25,x25,2	# increment pointer forward
		j	loop		# repeat, rinse
restore:
		lw	x20,0(sp)	# restore x20
		lw	x21,4(sp)	# restore x21
		lw	x25,8(sp)	# restore x25
		lw	x15,12(sp)	# restore x15
		lw	x16,16(sp)	# restore x16
		addi	sp,sp,20	# adjust sp to back to original value
done:		ret