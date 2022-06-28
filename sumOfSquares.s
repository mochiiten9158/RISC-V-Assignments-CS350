.globl sumSquare

.data
n: .word 7

.text
main:
    la t0 n
    lw a0 0(t0)
    jal ra sumSquare

    addi a1 a0 0
    addi a0 x0 1
    ecall # Print Result

    addi a0 x0 10
    ecall # Exit
      
sumSquare:
	addi t1 a0 0 # contains the number n
    addi t4 x0 0 # contains sum, initialize to 0, functions as the accumulator
    
    blt t1 x0 z # if less than 0, return 0
    
    addi t2 x0 1 # initialize t2 to 1
    and t3 t1 t2 # check if the number is even or odd. If even => t3 = 0 , if odd => t3 = 1
    
    beq t3 x0 evenreduction # if t3 is equal to 0 after anding with 1, that is, the number is even, go to even. Else go to odd
    
    odd:
    	blt t1 x0 end # control statement for loop
        
        # assign t1 to a0 so that we can use the square label
        add a0 t1 x0
        
        # square the term
        jal t5 square
        
        #add to the summation register
        add t4 t4 a0
        
        # Decrement t1 by -2
        addi t1 t1 -2
        
        # loop again
        j odd
        
evenreduction:
	# reduce by one as in the series description
	addi t1 t1 -1
    # jump to even
    j even
    
even:
	blt t1 x0 end # control statement for loop
    
    # assign t1 to a0 so that we can use the label square
    add a0 t1 x0
    
    # square the term
    jal t5 square
    
    # add to the summation register
    add t4 t4 a0
    
    # Decrement t1 by -2
    addi t1 t1 -2
        
    # loop again
    j even
    
square:
	mul a0 a0 a0
    jr t5
  
z: 
	addi a0 x0 0 # output zero if number is negative
    jr ra # return to main
    
end:
	add a0 t4 x0 # add to register to print sum
    jr ra