# EXERCICE : Rechercher un entier passé en paramètre dans un tableau d'entier
# Obj : convention d'appel, comparaison, accès m

.data
tab: .word 1,2,3,4 #tableau avec les valuers
size: .word 4
nb: .word 2

.text
la t0, tab # On charge l'adresse de tab
la t1, size  # On charge l'adresse de la taille du tableau
la t2, nb #on charge le nombre à trouver


# /!\ lw a1, tab --> pas possible de faire ça car tab et a1 sont sur 32 bites
lw a1, 0(t0) #fct qui va stocker la valeur qui est à l'adresse de t0
lw a2, 0(t1) #fct a2 -> Load word tab[0] dans register t0 (à adresse de size)

li a0, 0 

slli t1, t1, 2
add t4, t0, t1 # on copie l'adresse de tab

#boucler sur tab
for:
	sub s4, t4, t0

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
