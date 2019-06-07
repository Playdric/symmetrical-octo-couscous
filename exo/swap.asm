.data
array: .word 10,5,3,4
size: .word 4

.text
la t0, array	# array
lw t1, size	# size
li t3, 0	# count

loop:
lw t4, 0(t0)
lw t5, 4(t0)		# array[i++]
beq t3, t1, end_loop	# count == size return
mv t6, t4		# store array[i]
sw t5, 0(t0)		# array[i] = array[i + 1]
sw t6, 4(t0)		# array[i + 1] = stored array[i] 
inc:
addi t3, t3, 2		# count++
addi t0, t0, 8		# array[++i]
j loop

end_loop:
la t0, array	# reset array[0]
li t3, 0	# reset count
li a7, 1	# set print integer

print_loop:
lw t4, (t0) 	#array[i]
beq t3, t1, end # count == size
mv a0, t4	# print
ecall		# systel call
addi t3, t3, 1	# count++
addi t0, t0, 4	# array[++i]
j print_loop
end:
