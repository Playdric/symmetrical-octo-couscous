.data
array: .word 10,5,3,4
size: .word 4
search: .word 10

.text
la t0, array	# array
lw t1, size	# size
lw t2, search	# search
li t3, 0	# count

loop:
lw t4, (t0)
beq t3, t1, end_loop	# count == size return
beq t2, t4, print_true	# search == array print founded
addi t3, t3, 1		# count++
addi t0, t0, 4		# array[++i]
j loop

print_true:
li a7, 1	# print integer
li a0, 200	# print "200"
ecall		# call system print
j end

end_loop:
li a7, 1	# print integer 
li a0, 404	# print "404"
ecall		# call system print

end: