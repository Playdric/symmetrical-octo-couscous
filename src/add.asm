# V0.1
#li t0, 22
#li t1, 12

#add t2, t0, t1
#mv a0, t2
#li a7, 1
#ecall

# V0.2
#li t0, 22
#li t1, 12

#add a0, t0, t1
#li a7, 1
#ecall

# V0.3
li t0, 22

addi a0, t0, 12
li a7, 1
ecall