.data

array: .word 1, 3, 2, 10, 5
size: .word 5
number: .word 10

.text

# Array & Size
la t0, array
lw t1, size
lw t5, number

# Current value
lw t3, 0(t0)

# Counter aka current position
li t4, 0

# If iterator equals wanted value end program
# Else increment
loop: beq t3, t5, end
j increment

# Increment counter & go to next elements
increment: addi t4, t4, 1
addi t0, t0, 4
lw t3, 0(t0)
j loop

# Display wanted value position
end:mv a0, t4
li a7, 1
ecall
