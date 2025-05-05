.data
	binary_i: .space 5
.text
main: 
	li $v0, 5
	syscall
	move $t0, $v0
	add $s2, $s2, 2
	add $s0, $s0, $zero
	loop:
		div $t0, $s2
		add $s0, $s0, 1
		mflo $t0
		beq $t0, $zero, break
		j loop
		break: 
			li $v0, 1
			move $a0, $s0
			syscall
			li $v0, 10
			syscall