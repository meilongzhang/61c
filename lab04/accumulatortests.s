.import lotsofaccumulators.s

.data
inputarray: .word 0,1,2,3,4,5,6,7,0

TestPassed: .asciiz "Test Passed!"
TestFailed: .asciiz "Test Failed!"

.text
# Tests if the given implementation of accumulate is correct.
#Input: a0 contains a pointer to the version of accumulate in question. See lotsofaccumulators.s for more details
#
#
#
#The main function currently runs a simple test that checks if accumulator works on the given input array. All versions of accumulate should pass this.
#Modify the test so that you can catch the bugs in four of the five solutions!
main:
    la a0 inputarray
   
    addi t2, x0, 5
    addi s0, x0, 4
    addi sp, sp, -8
    sw s0, 0(sp)
    sw t2, 4(sp)
    jal accumulatorone
    lw t1, 0(sp)
    lw t2, 4(sp)
    addi t3, x0, 5
    addi sp, sp, 8
    bne s0, t1, Fail
    bne t2, t3, Fail

    
    li t0 0
    beq a0 t0 Pass

Fail:
    la a0 TestFailed
    jal print_string
    j End
Pass:
    la a0 TestPassed
    jal print_string
End:
    jal exit

print_int:
	mv a1 a0
    li a0 1
    ecall
    jr ra
    
print_string:
	mv a1 a0
    li a0 4
    ecall
    jr ra
    
exit:
    li a0 10
    ecall