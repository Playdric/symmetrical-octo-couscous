# TP
# 1: Mettre dans 2 registres 2 nombres
# 2: Additionner les registres
# 3: Afficher le nombre

# On stocke la première valeur (4) dans un registre (to) avec un load Immediate (li)
li t0, 4

# addi est un ajout immédiat il évite de passer par un stockage de la seconde valeur
# Du coup dans le registre a0 on ajoute to et la valeur 2
addi a0, t0, 2

# Cette ligne me permet de ne pas avoir à définir la seconde valeur et de faire un add comme suit :
# li t1, 2
# add a0, t0, t1 

# avec un load Immediate (li) je fais un appel service (via a7) au service PrintInt (via 1)  
li a7, 1

ecall
