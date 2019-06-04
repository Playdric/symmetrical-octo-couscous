#Florian Mazuy 4MOC
#
#
#
.data


.text

#On charge dans le registre b0 la valeur 4
li t0, 4
#On charge dans le registre b1 la valeur 40
li t1, 40

#On ajoute les valeurs du registre t1 & t0 au registre aO
add a0, t1, t0

#On initialise le registre a7 et 1 correspond à un printInt
li a7, 1

#On fait notre appel système au kernel linux
ecall
