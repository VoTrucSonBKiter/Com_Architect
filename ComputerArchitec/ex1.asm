# Exercise1
.data
output: .asciiz "Hello, "
str: .space 10
newline: .asciiz "!"
.text
 main: 
 	li $v0, 4
 	la $a0, str
 	syscall
 	
 	li $v0, 8
 	la $a0, str
 	li $a1, 20
 	syscall
 	
 	li $v0, 4
 	la $a0, output
 	syscall
 	
 	li $v0, 4
 	la $a0, str
 	syscall
 	
 	li $v0, 4
 	la $a0, newline
 	syscall
 	
 	li $v0, 10
 	syscall