# Array Swap

# Quentin Brunet
# 4A MOC

# Goal
# Input: 1234
# Output: 2143

.data

source: .word 1, 2, 3, 4
size: .word 4

.text

# PSEUDO CODE ALGO
# item = NULL
# index = 1
# while (index + 1) < size
	# item = source[i]
	# source[i] = source[i+1]
	# source[i + 1] = item
	# index += 2
# print source

la a0, source # address source
lw t0, size # size
li t1, 0 # index

# loop
for:
	beq t1, t0, end_for # interrupt for loop
	lw t2, 0(a0) # load source[index]
	lw t3, 4(a0) # load current source[index+1]
	sw t3, 0(a0) # save item +1 in source[index]
	sw t2, 4(a0) # save current item in source[index + 1]

	addi t1, t1, 2 # increment index
	addi a0, a0, 8 # set source to source +2
	j for # continue loop
end_for:
