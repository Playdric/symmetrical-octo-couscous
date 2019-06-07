.data
#const int array[] = {1,2,3,4}
array: .word 1,5,3,4
# const int size = 4
size:  .word  4
# const int number = 2
numberMax: .word  0


.text 

la t0, array 	# On charge @ de array
la t1, size  # On charge @ de la taille du tableau
la s11, numberMax # On charge @ du nombre maximum
 
lw t4, 0(t1) # on recupere la valeur a @ de size
lw s10, 0(s11) # on recupere la valeur a @ de numberMax
li a0, 0 # init
 
slli t4, t4, 2
add t5, t0, t4

for:
   sub s4, t5, t0 # soustraction de deux regsitre
   beq s4, zero, end_for # i < size ?
   lw s2, 0(t0) #Array[i]
   
   bgt s2, s10, swap_max # stop la boucle si array [i] = number
    
   addi t0, t0, 4 # current = array + i
   j for          # continue
    
    
    
    
end_for:
   j end
 
swap_max:
   mv s10, s2 # copie s2 dans s10
   j for          # continue the loop


end:
mv a0, s10 # copie s10 dans a0
li a7, 1
ecall