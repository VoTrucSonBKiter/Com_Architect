# Exercise3
.data
number: .half 1, 2, 5, 8, 12, 44, 3, 9, 0, 10
commaspace: .asciiz ", "
newline: .half 
.text

la $s0, number
lhu $t0, 0($s0)
lhu $t1, 2($s0)
lhu $t2, 4($s0)
lhu $t3, 6($s0)
lhu $t4, 8($s0)
lhu $t5, 10($s0)
lhu $t6, 12($s0)
lhu $t7, 14($s0)
lhu $t8, 16($s0)
lhu $t9, 18($s0)

move $a0, $t9
move $a1, $t8
move $a2, $t7
move $a3, $t6
move $t9, $t5
move $t8, $t4
move $t7, $t3
move $t6, $t2
move $t5, $t1
move $t4, $t0
move $t3, $zero
move $t2, $zero
move $t1, $zero
move $t0, $zero

li $v0, 1
move $a0, $a0
syscall

li $v0, 4
la $a0, commaspace
syscall

li $v0, 1
move $a0, $a1
syscall

li $v0, 4
la $a0, commaspace
syscall

li $v0, 1
move $a0, $a2
syscall

li $v0, 4
la $a0, commaspace
syscall

li $v0, 1
move $a0, $a3
syscall

li $v0, 4
la $a0, commaspace
syscall

li $v0, 1
move $a0, $t9
syscall

li $v0, 4
la $a0, commaspace
syscall

li $v0, 1
move $a0, $t8
syscall

li $v0, 4
la $a0, commaspace
syscall

li $v0, 1
move $a0, $t7
syscall

li $v0, 4
la $a0, commaspace
syscall

li $v0, 1
move $a0, $t6
syscall

li $v0, 4
la $a0, commaspace
syscall

li $v0, 1
move $a0, $t5
syscall
li $v0, 4
la $a0, commaspace
syscall
li $v0, 1
move $a0, $t4
syscall