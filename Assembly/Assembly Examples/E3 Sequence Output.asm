#-----------------------------------------------------------------------
# Outputs the following sequence to output port 0xC00000D0:
#
# {…0x1, 0x2, 0x4, 0x8, 0x4, 0x2, 0x1, 0x2…}
#----------------------------------------------------------------------
.text
init:	li	x10,0xC00000D0	# store address in register
	li	x20,0x01	# initial value of sequence
main:	sw	x20,0(x10)	# output first value in sequence (1)
	slli	x20,x20,1	# shift left 1 spot
	sw	x20,0(x10)	# output second value in sequence (2)
	slli	x20,x20,1	# shift left 1 spot
	sw	x20,0(x10)	# output second value in sequence (4)
	slli	x20,x20,1	# shift left 1 spot
	sw	x20,0(x10)	# output second value in sequence (8)
	srli	x20,x20,1	# shift right 1 spot
	sw	x20,0(x10)	# output second value in sequence (4)
	srli	x20,x20,1	# shift right 1 spot
	sw	x20,0(x10)	# output second value in sequence (2)
	srli	x20,x20,1	# shift right 1 spot
	j	main 		# jump to first output ad nasuem