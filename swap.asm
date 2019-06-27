# Change Order in array

# Pierre Piron
# 4A MOC

# Goal
# Input: 1 2 3 4
# Output: 2 1 4 3

# PSEUDO CODE
# itemTmp = NULL
# index = 1
# while (index + 1) < size
	# itemTmp = source[i]
	# source[i] = source[i+1]
	# source[i + 1] = itemTmp
	# index = index + 2
# print source

.data

source: .word 1, 2, 3, 4
size: .word 4

.text
la a0, source # adress source
lw t0, size # size

			# ??
li t1, 0 # index

# loop
for:
	beq t1, t0, end_for # interrupt for loop
	lw t2, 0(a0) # load source[index]
	lw t3, 4(a0) # load current source[index+1]
	mv t5, t2 # load next item 
	sw t3, 0(a0) # save item +1 in source[index]
	sw t5 4(a0) # save current item in source[index + 1]
	
	addi t1, t1, 2 # increment index
	addi a0, a0, 8 # set source to source +2
	j for # continue loop
end_for:
