# RLE Compressor

# Pierre Piron, Quentin Brunet
# 4A MOC

# Goal
# Input: 123aaabb
# Output: 1112133a2b

.data

source: .word 1, 2, 3, 'a', 'a', 'a', 'b', 'b'
size: .word 8
result: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 # size = twice source array size

.text

# PSEUDO CODE ALGO
# item = NULL
# count = 0
# for each tab item
	# if (curItem == item)
		# increment count
		# continue
	# add item + count -> result
	# set new item and count = 1
# print result

la a0, source # *source
la a1, size # *size
la a3, result # *result
lw t0, 0(a1) # size

lw t1, 0(a0) # item
li t2, 1 # count
mv a2, a0 # *offset

# algo
for:
	slli t3, t0, 2 # calculate size of source in Bytes (8 * 4 octets = 32 octets) 1000 -> 0010 0000
	add t4, a0, t3 # find address of last item of source array
	sub t5, t4, a2 # check if we have reach end of source array
	beq t5, zero, end_for # interrupt for loop
	
	addi a2, a2, 4 # goto next source value
	lw t6, 0(a2) # current item
	
	bne t1, t6, end_if # if current item != item, jump to end_if
	if:
		addi t2, t2, 1 # increment count
		j for # continue for loop
	end_if:
	
	sw t2, 0(a3) # write count to result
	addi a3, a3, 4 # move to next item of result
	sw t1, 0(a3) # write item to result
	addi a3, a3, 4 # move to next item of result
		
	mv t1, t6 # update item
	li t2, 1 # reset count	
	
	j for # continue for loop
end_for:

# print
# TODO

la a0, result
li a7, 4
ecall