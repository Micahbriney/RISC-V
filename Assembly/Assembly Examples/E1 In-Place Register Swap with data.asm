#-------------------------------------------------------------------------------------------------
#-
#- INPLACE SWAP OF TWO REGISTERS
#- This program swaps in one register with the data in another register.
#- The program utilized only the two registers to perform this
#- 
#-------------------------------------------------------------------------------------------------
.data
mem_data:	.word	0xFFFFFFFF, 0x11111111	#Original data stored in Mem

.text

init:		la		s0, mem_data		#Load address of mem_data into s0. Mem_data pointer.
			lw		t0,	0(s0)			#Load data from pointer s0
			lw		t1, 4(s0)			#Load second word from pointer s0
	
swap:		xor		t0, t0, t1			#Toggle all bits, First step of 'in-place' swap
			xor		t1, t1, t0			#Toggle all bits again. t1 is now in t0
			xor		t0, t0, t1			#Toggle all bits once more. t0 is now what t0 was originally
