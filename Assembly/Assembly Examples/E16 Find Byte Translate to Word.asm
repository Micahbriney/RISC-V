#-----------------------------------------------------------------------
# Subroutine: byte_to_word
#
# This subroutine finds translates contiguous unsigned byte data
# starting at the value in x10 to word data starting at the address in
# x20. Register x11 holds the number if values to translate.
#
# Tweaked registers: none
#----------------------------------------------------------------------
byte_to_word:
store: 		addi	sp,sp,-16		# room for 4 regs
		sw	x11,0(sp)		# push 4 regs
		sw	x20,4(sp)
		sw	x21,8(sp)
		sw	x10,12(sp)
init:						# nothing to init
check:		beq	x11,x0,restore		# quit if loop count is zero
loop: 		lbu	x21,0(x10)		# get hald data at x10
		sw	x21,0(x20)		# store data as word x20
admin: 		addi	x10,x10,1		# incr addr by number of bytes
		addi	x20,x20,4		# incr addr by word number of byte
		addi	x11,x11,-1		# decr loop count
		bne	x11,x0,loop		# do it again
restore: 	lw	x11,0(sp)		# pop 4 pushed regs
		lw	x20,4(sp)
		lw	x21,8(sp)
		lw	x10,12(sp)
		addi	sp,sp,16		# readjust stack pointer
done:		ret				# come on up to the house

#-----------------------------------------------------------------------
# Subroutine: byte_to_word
#
# This subroutine finds translates contiguous unsigned byte data
# starting at the value in x10 to word data starting at the address in
# x20. Register x11 holds the number if values to translate.
#
# Tweaked registers: none
#----------------------------------------------------------------------
byte_to_word:
store: 		addi	sp,sp,-16		# room for 4 regs
		sw	x11,0(sp)		# push 4 regs
		sw	x20,4(sp)
		sw	x21,8(sp)
		sw	x10,12(sp)
init:						# nothing to init
loop:		beq	x11,x0,restore		# quit if loop count is zero
		lbu	x21,0(x10)		# get hald data at x10
		sw	x21,0(x20)		# store data as word x20
admin: 		addi	x10,x10,1		# incr addr by number of bytes
		addi	x20,x20,4		# incr addr by word number of byte
		addi	x11,x11,-1		# decr loop count
		j	loop			# do it again
restore: 	lw	x11,0(sp)		# pop 4 pushed regs
		lw	x20,4(sp)
		lw	x21,8(sp)
		lw	x10,12(sp)
		addi	sp,sp,16		# readjust stack pointer
done:		ret				# come on up to the house