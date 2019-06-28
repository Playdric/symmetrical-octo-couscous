.data

array: .word 1,4,12,6,18 #initialise un tableau avec des valeurs

size: .word 5

number: .word 12 #on cherche le nombre 12


.text

la s2, array #on met array dans le registre s0
la s3, size #on met la taille dans le registre s3
la s4, number #on met le nombre a rechercher dans le registre s4

lw t4, 0(s3) #on recupere la taille
lw t5, 0(s4) #on recupere le nombre

li a0, 0 #on initialise

slli t4, t4, 2

add t6, s2, t4 

for:
	sub t4, t6, s2 #soustraction de deux registre pour vérifié si on est a la fin du tableau
	lw s1, 0(s2) #on recupere la valeur de array[i]
	
	beq t5, s1, copie_value #condition if ==
	
	beq t4, zero, end_for #si on a finit de parcourir le tableau on quitte la boucle
	
	addi s2, s2, 4 
	
	j for
	
end_for:
	j end #quitte la boucle
	
copie_value:
	mv a0, t5 #copie la value de a0 dans le registre t5
	
end:
li a7, 1
ecall


