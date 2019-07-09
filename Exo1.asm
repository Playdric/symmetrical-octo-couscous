.data
intTab: .word 1, 2, 3
failledMsg: .string "Ce nombre n'est pas dans le tableau"

.text 
#li t0, 0 # Itérrateur i 
li t1, 9 # Nb à chercher
li t2, 3 # Length du tab
la s0, intTab #je stocke dans s0 l'adresse dee mon tableau

for :
	lw t3, 0(s0) # t3 est l'itérateur de mon tableau
	
	#sub t2, t0, t1 # t2 vaut la diff des 2
	#seqz t4,t2 # t4 vaut vaut 1 si il y a égalité
	
	#beqz t2, endForMatch #va dans endForMatch si t2 vaut 0
	
	beq t1, t3, endForMatch # si le nb et l'ittérateur sont égaux je fait un endForMatch
	
	addi s0, s0, 4 # increment de l'Itérateur t3
	
	beq t3, t2, endForFailled # si l'itérateur est égale à la longueur du tableau je me redirige vers "endForFailled"
	
	j for # Jump pour reboucler
	
endForMatch:
	mv a0, s0 #stocker l'itérateur
	li a7, 1 #afficher l'itérateur
	j end # Jump pour End
	
endForFailled:
	li a7, 4 #affiche le texte
	la a0, failledMsg  #affiche le texte
	j end # Jump pour End
end:
	ecall # End
	
