.data
#declaration array
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

