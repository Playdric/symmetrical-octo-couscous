.text
# On met 4 dans t0
li t0, 4
# On met 5 dans t1
li t1, 5
# On met l'addition de t0 et t1 dans t2
add t2, t0, t1
# On met 1 dans a7
li a7, 1
# On met t2 dans a0
mv a0, t2
# On affiche
ecall
