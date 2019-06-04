.data

.text
#stocker un nombre (5) dans le registe a2
li a2, 5
#stocker un nombre (10) dans le registe a3
li a3, 10
#additionner les 2 nombres stockés (a2 + a3) dans le registre t2 (sert de résultat)
add t2, a2 ,a3
#charger la valeur finale dans le registre a0
mv a0, t2
#mettre dans a7, le service 1 pour dire qu'on veut un entier
li a7, 1

ecall