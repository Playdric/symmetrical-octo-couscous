.data
#declaration array
array: .word 5,11,2,12
#size array
size: .word 4
#largest
largest: .word 0

.text
#on charge les adresses dans les registres
la t0, array
la t1, size
la t2 largest

mv t2, a0 #copie valeur largest dans a0 pour l'afficher à la fin

lw t3, 0(t1) #on recupere la valeure de size par l'adresse

slli t3, t3, 2 #set l'adresse de size sur 32 bit

add t5, t0, t3 #déterminer l'adresse de fin du tableau

for:
beq t0, t5, end_for # i < size ? cursor = fin 
lw s2, 0(t0) # array[i] dans le registre s2
blt a0, s2, if #if largest < array[i], on va dans le if
if: 
 mv a0, s2 #largest = array[i]
end_if:
j for #continue
end_for:

li a7, 1 #print largest

ecall

