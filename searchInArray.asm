.data #variables
#create ane array[] = {1,2,3,4}
array: .word 1,2,3,4
# size of array = 4
size:  .word  4
# const int number = 2
number: .word  2

#Create an error message
numberError: .word  000 #Message d'erreur

.text 

#la means "load address"
la t0, array  # Put array in register t0
la t1, size  # Put size (size array) in register t1
la s11, number # Put number to find in s11
la s9, numberError # Put number which been displayed in case of error in s9

#lw means "load word", load from memory
lw t4, 0(t1) # Get size value 
lw s10, 0(s11) #Get number value
lw s8, 0(s9) #Get numberError value
#li means "load immediate" loads a specific value 
li a0, 0 # initiliaze 0 in register a0
 
# left shift of the contents of register src and stores the shifted value in register dest
slli t4, t4, 2
#simple addition
add t5, t0, t4

for:
   sub s4, t5, t0 # substract two register
   beq s4, zero, end_for # branch if equal 0 en for
   lw s2, 0(t0) #load word of array, put in s2

   beq s10, s2, display_number #if branch equal array[i] = number -> stop loop

   addi t0, t0, 4 # requires an immediate operand than the register 
   j for          #continue for (jump for)
end_for:
   mv a0, s8 # move s8 in register a0
   j end #jump to end 
 
display_number:
   mv a0, s10 # move s10 in a0


end:
li a7, 1 #load immediate 1 in register a7
ecall #make a request to the supporting execution environement (operating system)