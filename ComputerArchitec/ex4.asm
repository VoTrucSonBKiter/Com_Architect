#Exercise4
.data
f_result: .asciiz "F ="
g_result: .asciiz "G ="
space : .asciiz "    "
remainder: .asciiz " remainder "
.text
main:  
	li $v0, 5
	syscall
	move $t1, $v0
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	li $v0, 5
	syscall
	move $t3, $v0
	
	li $v0, 5
	syscall
	move $t4, $v0
	
	#calculate F
	mult $t1, $t1
	mflo $t5
	add $t5, $t5, $t2
	sub $t6, $t3, $t4
	mult $t5, $t6
	mflo $t5
	
	#print F
	li $v0, 4
	la $a0, f_result
	syscall
	
	li $v0, 1
	move $a0, $t5
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	#calculate G
	sub $t5, $t3, $t1
	add $t1, $t1, 1
	add $t2, $t2, 2
	sub $t3, $t3, 3
	mult $t1, $t2
	mflo $t6
	mult $t3, $t6
	mflo $t6
	div $t6, $t5
	mflo $t5
	mfhi $t6
	
	#print G
	li $v0, 4
	la $a0, g_result
	syscall
	
	li $v0, 1
	move $a0, $t5
	syscall
	
	
	li $v0, 4
	la $a0, remainder
	syscall
	
	li $v0, 1
	move $a0, $t6
	syscall