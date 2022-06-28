.data
.word 2, 4, 6, 8
n: .word 5 # change this to get different fib series

.text
main:
    add t0, x0, x0 
    addi t1, x0, 1
    la t3, n # I believe this is like a control unit that controls the number of members in the series we are printing. The n is controlled by programmer
    lw t3, 0(t3) # Loads value of n into first word of t3
    addi t3, t3, -1 # subtract -1 so that we can get the required number of iterations

# creating a new label to print 0 at the beginning
print:
  addi a0, x0, 1
  addi a1, t0, 0
  ecall
  
  # newline
  addi a1, x0, '\n'
  addi a0, x0, 11
  ecall
  
  #jump to fib
  j fib
    
fib:
    beq t3, x0, finish # comparison statement
    add t2, t1, t0
    mv t0, t1 # copy register 
    
    addi a0, x0, 1
    addi a1, t0, 0
    ecall # print integer using ecall
    
    # print newline
    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall
    
    mv t1, t2 # copy register
    addi t3, t3, -1 # reduce the counter to indicate completion of one iteration
    j fib # execute fib again
    
finish:   
    addi a0, x0, 10
    ecall # terminate ecall