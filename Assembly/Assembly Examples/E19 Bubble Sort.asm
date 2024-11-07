#---------------------------------------------------------------
# Subroutine: bbl_sort
#
# This subroutine sorts (bubble sort) 10 words in memory
# starting at the address passed in x10.
#
# Tweaked regsiters: none
#---------------------------------------------------------------
#.data		# test code for simulator
#arr: .word 10,3,5,4,3,8,3,4,7,1
#.text
# la x10,arr
bbl_sort:
store:		addi	sp,sp,-28	# adjust stack pointer
		sw	x10,0(sp)	# save context
 		sw	x11,4(sp)
 		sw	x12,8(sp)
 		sw	x25,12(sp)
 		sw	x26,16(sp)
 		sw	x30,20(sp)
 		sw	ra,24(sp)	# push return address
init:  		li	x25,9		# inside count
 		li	x26,9		# outside count
 		mv	x30,x10		# array start address
loop_out:	beq	x26,x0,done_out	# outer while loop
loop_in:	beq	x25,x0,done_i	# inner while loop
 		call	swap_q		# do swap
 		addi	x25,x25,-1	# decr inner loop count
 		addi	x10,x10		# advance address
		j	loop_in		# keep doing it
done_in:  	addi	x26,x26,-1	# decr outer loop count
 		li	x25,9		# reload inner loop count
 		mv	x10,x30		# reload starting address
		j	loop_out	# jump to outer loop
done_out:
restore:  	lw	x10,0(sp)	# restore context
 		lw	x11,4(sp)
 		lw	x12,8(sp)
 		lw	x25,12(sp)
 		lw	x26,16(sp)
 		lw	x30,20(sp)
 		lw	ra,24(sp)	# restore return address
 		addi	sp,sp,28	# adjust stack
done_1:		ret 			# take it on home
#---------------------------------------------------------------
#---------------------------------------------------------------
# Subroutine: swap_q
#
# This subroutine sorts two words in memory starting at the
# address passed in x10.
#
# Tweaked registers: x11,x12
#---------------------------------------------------------------
swap_q:
 		lw	x11,0(x10)
 		lw	x12,4(x10)
		bge	x11,x12,done_2
 		sw	x11,4(x10)
 		sw	x12,0(x10)
done_2:		ret
#----------------------------------------------------------------