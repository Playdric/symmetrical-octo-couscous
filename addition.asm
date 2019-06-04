# 1. Mettre dans 2 reg 2 nombres
# 2. Additionner ces registres
# 3. Afficher le nombre
#

.text
# On met dans le registre t0 la valeur 23
li t0, 23
# On met dans le registre t1 la valeur 19
li t1, 19

# On met dans le registre a0 le resultat 
# de l'addition des registres t0 et t1
add a0, t0, t1

# On met dans le registre a7 
# la valeur 1 correspondant au PrintInt
li a7, 1

# On fait notre appel système au kernel
ecall
