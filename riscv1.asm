.text 



#mets les variables dans le registre 
li t0, 12
li t1, 3

#fait l'addition des variables 
add a0 , t0 , t1

# affiche le resultat de l'addition
li a7 , 1
# On fait notre appel système au kernel linux
ecall
