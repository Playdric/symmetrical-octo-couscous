.data

array: .word 90, 34, 25, 23, 5
size: .word 5

.text

# Array & Size
la t0, array
lw t1, size

# Next element
lw t2, 4(t0)

# Maximum
lw t3, 0(t0)

# Counter
li t4, 0

# If counter equals array size end program
# If next array element is bigger or equals replace maximum
loop: beq t4, t1, end
bgt t2, t3, replace
j increment

# Replace maximum with next element
replace: mv t3, t2
j increment

# Increment counter & go to next elements
increment: addi t4, t4, 1
addi t0, t0, 4
lw t2, 0(t0)
j loop

# Display maximum
end:mv a0, t3
li a7, 1
ecall