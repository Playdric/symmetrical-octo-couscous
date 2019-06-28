.data

array: .word 1,4,12,6 #initialise un tableau avec des valeurs

size: .word 4

max: .word -1000 


.text

la s2, array #on met array dans le registre s0
la s3, size #on met la taille dans le registre s3
la s4, max #on met le max dans le registre s4

lw t4, 0(s3) #on recupere la taille
lw t5, 0(s4) #on recupere le max

li a0, 0 #on initialise

slli t4, t4, 2

add t6, s2, t4

for:
	sub t4, t6, s2 #soustraction de deux registre pour vérifié si on est a la fin du tableau
	beq t4, zero, end_for #si on a finit de parcourir le tableau on quitte la boucle
	lw s1, 0(s2) #on recupere la valeur de array[i]
	
	bgt s1, t5, find_max  #condition if greater (if array[i] > max -> on appel find_max)
	
	addi s2, s2, 4 
	
	j for
	
end_for:
	j end
	
find_max:
	mv t5, s1 #copie la valeur de t1 (array[i]) dans t5 (max)
	j for
	
	
end:
mv a0, t5
li a7, 1
ecall


