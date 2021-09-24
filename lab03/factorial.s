.globl factorial

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

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

factorial:
    # YOUR CODE HERE
    addi a5, x0, 1
    addi a6, x0, 1
    
    multiply:
    	mul a5, a0, a5
        sub a0, a0, a6
        bge a0, a6, multiply
        add a0, x0, a5
        jr ra
        
    
