# WIP - Not working

.data

array: .word 1, 2, 3, 4
size: .word 4

.text

# load array address
la t0, array # array*

# load size address
la t1, size # size*

# read size value
lw t1, 0(t1) # size

# initialize sum to 0
li t2, 0 # sum

# copy array initial address
mv t3, t0 # array*

for:
	# if substraction = 0, stop loop
	beq t3, zero, end_for

	# read array value
	lw t4, 0(t3) # array[i]
	# add array value to sum
	add t2, t2, t4 # sum

	# move array address to next number
	addi t3, t3, 4 # array*

	# goto for label
	#j for
end_for:

# display sum
li a7, 1
ecall
