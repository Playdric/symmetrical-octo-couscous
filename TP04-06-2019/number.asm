.text
#on charge 1 dans le registre t0 et t1
li t0, 1
li t1, 1
#on additione ces registres
add a0, t0, t1
#on l'affiche
li a7, 1
#appel système
ecall

