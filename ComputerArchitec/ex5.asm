#Exercise5
.data
input: .asciiz "Enter a 4-bit binary number: "
result: .asciiz "The decimal value is "
new: .asciiz "\n"
plus: .space 5
.text
main:
    li $v0, 4         
    la $a0, input
    syscall
    
    li $v0, 8        
    la $a0, plus    # Load address of buffer for binary input
    li $a1, 6         # Set maximum number of characters to read
    syscall
    
    # Convert input to decimal and print the result
    li $s0, 0         # Initialize sum to zero
    
    lb $t0, plus    # Load first character from input string
    addi $t0, $t0, -48 # Convert ASCII digit to integer
    mul $s0, $s0, 2   # Shift current sum to left
    add $s0, $s0, $t0 # Add current bit to sum
    
    lb $t0, plus+1  # Load next character and repeat process
    addi $t0, $t0, -48
    mul $s0, $s0, 2
    add $s0, $s0, $t0
    
    lb $t0, plus+2
    addi $t0, $t0, -48
    mul $s0, $s0, 2
    add $s0, $s0, $t0
    
    lb $t0, plus+3
    addi $t0, $t0, -48
    mul $s0, $s0, 2
    add $s0, $s0, $t0
    
    li $v0, 4
    la $a0, result
    syscall
    
    li $v0, 1
    move $a0, $s0     # Load decimal result into $a0
    syscall           
    
    li $v0, 4
    la $a0, new
    syscall
    
    li $v0, 10
    syscall