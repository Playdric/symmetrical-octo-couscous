# Trouver le maximum d'un tableau de nombre

.data 
    values: .word 8, 5, 25, 72, 43
    size: .word 5
    count: .word 0

.text
    la t0, values # Load adress de values[]
    lw t1, size  # Load word de size
    lw t2, count  # Load word de count

for:
    addi t0, t0, 4 # Se déplacer de 4 octets pour avoir values[i+1]
    lw s3, 0(t0) # Array[1]
    bgt s3, s2, setMax  ## si s3 > s2, trigger setMax
    addi t2, t2, 1 # On incrémente +1 le count
    beq t1, t2, stopFor # On check si on est arrivé à la fin de la liste
    j for # on continue la boucle

stopFor:
    j stop # On stop la boucle for

setMax:
    mv s2, s3 # On charge dans l'adresse de retour la nouvelle valeur max
    j for

stop:
    mv a0, s2 # Move dans a0 la valeur max a retourner
    li a7, 1 # Indique que sera retourné un entier
    ecall