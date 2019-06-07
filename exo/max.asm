.data
array: .word 10,5,3,4,100
size: .word 5

.text
la t0, array	# array
lw t1, size	# size
li t2, -100	# max
li t3, 0	# count

loop:
lw t4, (t0)		# array[i]
beq t3, t1, end_loop	# count == size return
bgt t4, t2, new_max
inc:
addi t3, t3, 1		# count++
addi t0, t0, 4		# array[++i]
j loop

new_max:
mv t2, t4
j inc

end_loop:
li a7, 1	# print integer 
mv a0, t2	# print max
ecall		# call system print

end: