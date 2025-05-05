.data
input: .asciiz "Enter a 4-bit binary number: "
result: .asciiz "The decimal value is "
new: .asciiz "\n"
plus: .space 5
.text
.globl main
main:
    li $v0, 4         
    la $a0, input
    syscall
    
    li $v0, 8         # Set the read string system call code
    la $a0, plus    # Load address of buffer for binary input
    li $a1, 6         # Set maximum number of characters to read
    syscall
    
    # Convert input to decimal and print the result
    li $s0, 0         # Initialize sum to zero
    
    lb $t0, plus
    addi $t0, $t0, -48 # Convert ASCII digit to integer
    mul $s0, $s0, 2   # Shift current sum to left
    add $s0, $s0, $t0 # Add current bit to sum
    
    lb $t0, plus+1 
    
    li $v0, 1
    move $a0, $t0
    syscall