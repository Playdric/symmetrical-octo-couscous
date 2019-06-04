.text
# On met 4 dans t0
li t0, 4
# On met 5 dans t1
li t1, 5
# On additionne les 2, le résultat va dans t2
add t2, t0, t1
# On met 1 sans a7 ==> print integer
li a7, 1
# On met t2 dans a0 pour l'afficher
mv a0, t2
# On fait notre appel système au kernel linux
ecall