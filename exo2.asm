
# Incrémenter un tableau par un entier N.
.data
intTab: .word 1, 2, 3, 4 , 5
failledMsg: .string "Ce nombre n'est pas dans le tableau"

.text 
#li t0, 0 # Itérrateur i 
li t1, 9 # Nb à chercher
li t2, 3 # Length du tab
la s0, intTab #je stocke dans s0 l'adresse dee mon tableau

for :
	lw t3, 0(s0) # t3 est l'itérateur de mon tableau
	
	
	addi s0, s0, 4 # increment de l'Itérateur t3
	
	addi t3, t3, 1 # increment du rang dans le tableau
	
	beq t3, t2, endForFailled # si l'itérateur est égale à la longueur du tableau je me redirige vers "endForFailled"
	
	j for # Jump pour reboucler
	
endForFailled:
	li a7, 4 #affiche le texte
	la a0, failledMsg  #affiche le texte
	j end # Jump pour End
end:
	ecall # End
	
