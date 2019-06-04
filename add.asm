#Put 4 in register t0
li t0, 4 

#adds an immediate value to the register in plus of what is stocked in t0 
addi a0, t0, 2

#give instruction that something append in a7 register
li a7, 1

#diplay result
ecall