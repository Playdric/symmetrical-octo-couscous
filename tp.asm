#Florian Mazuy 4MOC
#
#tro tro tro fort
#EZ

.data # On declare un segment pour les donnees
 
#const int array[] = {1,2,3,4}
array: .word 1,2,3,4
# const int size = 4
size:  .word  4
 
 
.text
 
la t0, array # On charge @ de array
la t1, size  # On charge @ de la taille du tableau
 
lw t4, 0(t1) # on recupere la valeur a @ de size
 
li a0, 0 # somme
#li t3, 0 # i
 
slli t4, t4, 2
add t5, t0, t4 # on copie @ de asrray

for:
    sub s4, t5, t0
    beq s4, zero, end_for # i < size ? 
    lw s2, 0(t0)
    add a0, a0, s2 # sum += array[i]
    addi t0, t0, 4 # current = array + i
    j for          # continue
end_for:
 

li a7, 1
ecall