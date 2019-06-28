.data # segment pour les données
# const int array[] = {1,2,3,4};
array: .word 1,2,3,4
# const int size = 4;
size: .word 4

.text # zone de code
la t0, array # charge l'adresse de l'array
la t1, size # pareil pour la taille de l'array

li t2, 0 # somme
li t3, 0 # i

lw t4, 0(t1) # size 
add t5, t0, zero # copie de l'adresse de l'array 

for: 
	slli t6, t3, 2 # i fois 2
	sub s4, t3, t4
	beq s4, zero, end_for # i < size 
	add s1, t5, t6 # current = array + i 
	lw s2, 0(s1) # val = *current
	add t2, t2, s2 # sum += array[i]
	addi t3, t3, 1 # i + 1
	j for # continue
end_for:

mv a0, t2
li a7, 1

ecall