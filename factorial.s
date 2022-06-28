.data
n: .word 8

.text
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial
    
    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result
    
    addi a0, x0, 10
    ecall # Exit
	
 factorial:
    addi t1 a0 0 # Initialize t1 to n
    addi t2 x0 1 # Initialize t2 to 1 (not 0 since we need to multiply)
    
    # loop
    fact:
    beq t1 x0 final # if t1 which is our control reaches 0, we go to final
    mul  t2 t2 t1 # multiplying value of t2 by t1 and storing in t2
    addi t1 t1 -1 # decrementing t1 which acts as our control
    j fact # go back to loop
    
final:
    addi a0 t2 0 # copy t2 to a0
    jr ra # return to main