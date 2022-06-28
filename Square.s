.globl square

.data
n: .word -1

.text
main:
    la t0 n
    lw a0 0(t0)
    jal ra square

    addi a1 a0 0
    addi a0 x0 1
    ecall # Print Result

    addi a0 x0 10
    ecall # Exit

# this is our function
square:
    addi t1 a0 0
    blt t1 x0 z # if t1 is lesser than 0, jump to zero, else, multiply to find square
    mul t2 t1 t1 # multiply to find square
    addi a0 t2 0 # set a0 to the square of the number that was input
    jr ra
    
z: 
	addi a0 x0 0 # output zero if number is negative
    jr ra # return to main