.data #variables
#create an array[] = {1,2,3,4}
array: .word 1,5,3,4
# size of array = 4
size:  .word  4
#initialize a number max to 0
max: .word  0


.text 
#la means "load address"
la t0, array # Put array in register t0
la t1, size  #Put size in register t1
la s11, max # # Put max in s11
 
#lw means "load word", load from memory 
lw t4, 0(t1) # Get size value 
lw s10, 0(s11) #Get max value in s10
li a0, 0 # initiliaze 0 in register a0
 
# left shift of the contents of register src and stores the shifted value in register dest 
slli t4, t4, 2
#simple addition
add t5, t0, t4

for:
   sub s4, t5, t0 #substract two register
   beq s4, zero, end_for #branch if equal 0 end for
   lw s2, 0(t0) #load word of array, put in s2
   
   bgt s2, s10, swap #branch on greater than. Search the greater and swap
    
   addi t0, t0, 4 # requires an immediate operand than the register and add 
   j for          # continue (jump for)
end_for:
   j end #jump to end
 
swap:
   mv s10, s2 #move s2 in s10
   j for      #jump to for


end:
mv a0, s10 #move s10 in regster a0
li a7, 1 #load immediate 1 in register &7
ecall  #make a request to the supporting execution environement (operating system)