 #Exercise2
.data
str: .asciiz " "
.text
li $v0, 5 # $v0 = 5
syscall
move $s0, $v0 # $s0 = $v0
li $v0, 5 # $v0 = 5
syscall
move $s1, $v0 # $s1 = $v0

add $s2, $s0, $s1 # s2 = s0 + s1
sub $s3, $s0, $s1 # s3 = s0 - s1

li $v0, 1
move $a0, $s2
syscall

li $v0, 4
la $a0, str
syscall

li $v0, 1
move $a0, $s3
syscall