#val max dans tableau
.data
tab: .word 1,8,3,4,5 # creation du tableau 
size: .word 5    
maxVal: .word 0	   #valeur maximale

.text
#charger les Adresses des data :  
la t0, tab 	   
la t1, size	   
la a1, maxVal	  

#récupérer les valeurs mises dans les adresses : 
lw t2, 0(t8)	   #  stocke la valeur qui est à l'adresse de t5
lw t3, 0(t9)	   # fct a1 -> Load word tab[0] dans register t6 (à adresse de size)
lw s4, 0(a1)	   # valeur contenue à l'adresse de nb à trouver

li a0, 0	   # initialisation à 0

slli t3, t3, 2
add t4, t5, t3     # on copie l'adresse du tableau

#boucler sur tab
for:
	sub s5, t4, t8   		# soustraire les 2 registres
	lw  s8, 0(t8) 			# charger la valeur courante à chaque passage de boucle

	beq s5, zero, end_for 	# i < size ?
	
	bgt s8, s4, find_max 		# jump si s8 (array[i] = maxVal)
	
	addi t8, t8, 4 			# current = tab + i
	
	j for 				# jump : passer à la valeur suivante
	
find_max:
	mv s4, s8			# changer la valeur de maxVal si: s8 (array[i]) > s4 (maxVal)
	j for				# continuer de boucler
	
end_for:
	mv a0, s4
	li a7, 1
	ecall
