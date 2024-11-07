#--------------------------------------------------------------------------------------------
#-
#- Swap data in two contiguious registers
#- This program swaps words (4 Bytes)
#- This program reinforces that RISC-V uses byte size registers
#- When loading to a register you need to offsets of 4 bytes (word) to store contiguious data 
#- since the memory uses 32bits / 4 bytes
#- lw and sw use 4 byte offset
#- 
#--------------------------------------------------------------------------------------------
Swap_Mem:
init:		li	x20,0xCC000000	#Initialize memoory address x20
			li	x21,0xCC000008	#Initialize memoory address x21
			lw	x20,0(x10)		#Initialize register x10 offset 0, writes to memeory
			lw	x21,4(x10)		#Initialize register x10 offset 0 4
			
loop:		lw	x20,0(x10)  	#Load word reads memory address x20 stores into register x10 with 0 register offset
			lw	x21,4(x10)  	#Load word read memeory address x21 stores into register x10 + 4 bytes 
			sw	x21,0(x10)  	#Store word writes register x10 into memeory x21. Data at x10, 0 offset came from x20
			sw	x20,4(x10)  	#Store word writes register x10 into memory x21. Data at x10, 4 offset came from x21
			j	loop			#Inifinate looping
				
done:		ret					#return
