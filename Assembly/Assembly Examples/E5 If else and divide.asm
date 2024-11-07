#-----------------------------------------------------------------------
# Subroutine: case_construct
#
# This subroutine is an example of a case statement. If the value in x20
# is equal to 64, then the value is divided by 8. If the value in x20 is
# equal to 128, then the value is divided by 32. If neither of those
# tests are true, then the subroutine sets the value of x20 to 0. The
# does the same for the other test.
#
# Tweaked Registers: x10, x20
#----------------------------------------------------------------------
case_construct:
check_64:	li	x10,64			# load value to compare
		bne	x10,x20,check_128	# check to see if equal
		srli	x20,x20,3		# divide by 8 (2^3)
		j	done			# done
check_128:	li	x10,128			# load value to compare
		bne	x10,x20,default		# check to see if equal
		srli	x20,x20,5		# divide by 32 (2^5)
		j	done			# done
default:	mv	x20,x0			# clear register
done:		ret

