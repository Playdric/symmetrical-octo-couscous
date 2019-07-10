# Swap 2 par 2 sur un tableau pair

.data 
    values: .word 8, 5, 25, 72
    size: .word 4
    count: .word 0

.text
    la t0, values # Load adress de values[]
    lw t1, size  # Load word de size
    lw t2, count  # Load word de count
  
for:
    lw s3, 0(t0) # values[i]
    lw s4, 4(t0) # values[i+1]
    sw s4, 0(t0) # values[i]= values[i+1]
    sw s3, 4(t0) # values[i+1]= values[i]

    addi t0, t0, 8 # Se déplacer de 8 octets pour avoir values[i+2]
    addi t2, t2, 2 # On incrémente +2 le count
    beq t1, t2, stopFor # On check si on est arrivé Ã  la fin de la liste
    j for 

stopFor:
    j stop 

stop:
    mv a0, s3 # Dans s3 se trouvera la derniere valeur du tableau swapé (ici 25)
    li a7, 1 # Indique que sera retournÃ© un entier
    ecall