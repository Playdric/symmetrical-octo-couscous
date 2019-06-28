.data 
array: .word 1,2,3,4
size: .word 4
number: .word 3

.text 
la t0, array # charge l'adresse de l'array
la t1, size # pareil pour la taille de l'array
la t2, number # adresse du nombre
lw t2, 0(t2) # charge la valeur du nombre

li t3, 0 # i

lw t4, 0(t1) # size 
#mv t5, t0    # copie de l'adresse de l'array 
slli t4, t4, 2 # size fois 4
add t5, t0, t4 # addr fin

for:
	bge t3, t4, end_for # i < size 
	#lw s2, 0(s1) # val = *current
	
	beq s2, t5, end_for # i = array[i]
	addi t3, t3, 4 # i + 4
	addi t0, t0, 4 # array = array + i  
	la a0, number
	j for
end_for:

ecall