# Exercice 1
# Méryl VALIER
# 4MOC

# Ici on mets 2 chiffres (2 et 4) dans 2 registres différements (respectivement t0 et t1)
li t0, 2
li t1, 4

# On additionne ces 2 registres dans a0
add a0, t0, t1

# Avec le '1' on print l'integer qui est dans a0
li a7, 1

# On fait notre appel système au kernel linux
ecall