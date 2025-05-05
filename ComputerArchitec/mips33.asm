.data
str: .word 0:10 
cmsp: .asciiz ", "
nl: .asciiz "\n"
.text

li $v0, 8
la $a0, str
li $a1, 11
syscall

la $t0, str
la $t2, nl
loop:
	lb $t1, ($t0)
	beq $t1,$t2, end
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, cmsp
	syscall
	
	addi $t0, $t0, 1
	j loop
	
end:
	li $v0, 10
	 syscall
	