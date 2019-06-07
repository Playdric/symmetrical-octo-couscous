.data
#const int array[] = {1,2,3,4}
array: .word 1,2,3,4
# const int size = 4
size:  .word  4
# const int number = 2
number: .word  6

numberError: .word  404 #Message d'erreur

.text 

la t0, array 	# On charge @ de array
la t1, size  # On charge @ de la taille du tableau
la s11, number # On charge @ du nombre à chercher
la s9, numberError # On charge @ du nombre à afficher en cas d'erreur
 
lw t4, 0(t1) # on recupere la valeur a @ de size
lw s10, 0(s11) # on recupere la valeur a @ de number
lw s8, 0(s9) # on recupere la valeur a @ de numberError
li a0, 0 # init
 
slli t4, t4, 2
add t5, t0, t4

for:
   sub s4, t5, t0 # soustraction de deux regsitre
   lw s2, 0(t0) #Array[i]
   
   beq s10, s2, show_number # stop la boucle si array [i] = number
   
   beq s4, zero, end_for # i < size ?
   
    
   addi t0, t0, 4 # current = array + i
   j for          # continue
    
    
    
    
end_for:
   mv a0, s8 # copie s8 dans a0
   j end
 
show_number:
   mv a0, s10 # copie s10 dans a0


end:
li a7, 1
ecall