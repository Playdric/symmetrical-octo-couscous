# trouve l'array 
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
	sub t4, t6, s2 # vérifie si on est a la fin du tableau
	lw s1, 0(s2) #recupere array[i]
	
	beq t5, s1, copie_value #condition if 
	
	beq t4, zero, end_for  # fin de condition if
	
	addi s2, s2, 4  # ajoute 4 a S2
	
	j for
	
end_for:
	j end
	
copie_value:
	mv a0, t5
	
end:
li a7, 1
ecall
.data
#vcreate array
array: .word 5,11,2,1
#size array
size: .word 4
#largest
largest: .word 0

.text
#on charge les adresses dans les registres
la t0, array
la t1, size
la t2 largest

lw t3, 0(t1) #on recupere la valeur de size par l'adresse
lw t4, 0(t2) #on recupere la valeur de largest par l'adresse

slli t3, t3, 2 #set l'adresse de size sur 32 bit
add t5, t0, t3 #déterminer l'adresse de fin du tableau

for:
sub s1, t5, t0 #i--
beq s1, zero, end_for # i < size
lw s2, 0(t0) #array[i]
blt t4, s2, mv_max #i largest < array[i]
addi t0, t0, 4 #decale le curseur
j for
end_for:
j end

mv_max:
mv t4, s2 #largest = array[i]
j for

end:
mv a0, t4 #copie valeur largest dans a0 pour l'afficher à la fin
li a7, 1 #print largest

ecall
