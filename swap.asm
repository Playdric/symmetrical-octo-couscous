.data

array: .word 1, 9, 2, 10, 5, 21
size: .word 6

.text

# Array & Size
la t0, array
lw t1, size

# Current values
lw t2, 0(t0)
lw t3, 4(t0)

# Counter
li t4, 0

# If iterator equals array size end program
# Else swap
loop: beq t4, t1, end
j swap

swap: sw t2, 4(t0)
sw t3, 0(t0)
j increment

# Increment counter & increment index by 2 & load new item in t2 & t3
increment: addi t4, t4, 2
addi t0, t0, 8
lw t2, 0(t0)
lw t3, 4(t0)
j loop

end: