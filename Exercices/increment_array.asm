.data
#declaration array
array: .word 5,11,2,1
#size array
size: .word 4
#increment_number
increment_number: .word 1

.text
#on charge les adresses dans les registres
la t0, array
la t1, size
la t2 increment_number

lw t3, 0(t1) #on recupere la valeur de size par l'adresse
lw t4, 0(t2) #on recupere la valeur de increment number par l'adresse

slli t3, t3, 2 #set l'adresse de size sur 32 bit
add t5, t0, t3 #déterminer l'adresse de fin du tableau

for:
beq  t0, t5, end_for # la fin?
lw   s2, 0(t0)       #array[i]
add  s2, s2, t4      # array[i] += 1
sw   s2, 0(t0)       #stocke le calcul
addi t0, t0, 4       # mot suivant
j for

end_for:
mv a0, t0 #copie de array dans a0 pour l'afficher à la fin
li a7, 1 #print array

ecall

