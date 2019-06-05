.data # On declare un segment pour les donnees
 
#const int array[] = {1,2,3,4}
array: .word 1,2,3,4
# const int size = 4
size:  .word  4
 
 
.text
 
la t0, array # On charge l'adresse de array dans le registre T0
la t1, size  # On charge l'adresse de size dans le registre T1
 
lw t4, 0(t1) # on recupere la valeur de l'adresse de size (lw => load word)
 
li a0, 0 # # On charge 0 dans le registre a0
#li t3, 0 # i
 
slli t4, t4, 2 #set l'adresse de size sur 32 bit
add t5, t0, t4 # on copie l'adresse de array

for:
    sub s4, t5, t0 # i--
    beq s4, zero, end_for # i < size ? 
    lw s2, 0(t0)
    add a0, a0, s2 # sum += array[i]
    addi t0, t0, 4 # current = array + i
    j for          # continue
end_for:
 

li a7, 1
ecall
