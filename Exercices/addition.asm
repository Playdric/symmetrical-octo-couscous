.text
# On stock 10 dans s1
li s1, 10
# On stock 10 dans s2
li s2, 10

# On met dans le registre a0 le resultat 
# de l'addition des registres t0 et t1
add a0, s1, s2

# On met dans le registre a7 
# la valeur 1 correspondant au PrintInt
li a7, 1

# On fait notre appel système au kernel
ecall