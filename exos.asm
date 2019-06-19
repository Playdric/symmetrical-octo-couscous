#-----------------------------------------------------------------------------
# EXERCICE : Rechercher un entier passé en paramètre dans un tableau d'entier

# Obj : convention d'appel, comparaison, accès m
#-----------------------------------------------------------------------------

.data
tab: .word 1,2,3,4 # tableau avec valeurs
size: .word 4      # taille du tableau
nb: .word 2	   # nb à trouver

.text
#charger les Adresses des data :  
la t0, tab 	   # charger l'adresse de tab
la t1, size	   # charger l'adresse de la taille du tableau
la a1, nb	   # charger l'adresse du nombre à trouver

#récupérer les valeurs mises dans les adresses : 

# /!\ lw a1, tab --> pas possible de faire ça car tab et a1 sont sur 32 bites
lw t2, 0(t0)	   # fct qui va stocker la valeur qui est à l'adresse de t0
lw t3, 0(t1)	   # fct a2 -> Load word tab[0] dans register t0 (à adresse de size)
lw s4, 0(a1)	   # valeur contenue à l'adresse de nb à trouver

li a0, 0	   # initialisation à 0

slli t3, t3, 2
add t4, t0, t3     # on copie l'adresse de tab

#boucler sur tab
for:
	sub s4, t4, t0   # soustraire les 2 registres

	beq t3, zero, end_for # i < size ? 
	beq t4, t2, find # si nombre entier trouvé alors jump à find
	
	lw  a4, 0(t0) # charger la valeur courante à chaque passage de boucle
	
	addi t0, t0, 4 # current = tab + i
	
	j for # jump : passer à la valeur suivante
	
find:
	mv a0, t4
	li a7, 1
	ecall

end_for:
        #mv a0, t4
	li a7, 1 #sortie d'un entier dans a7
	ecall
