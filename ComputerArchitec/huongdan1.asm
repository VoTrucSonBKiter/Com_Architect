.data
three: .float 3.0
.text
lwc1 $f31, three
mov.s $f1, $f31
mtc1 $t1, $f1

li $v0, 1
move $a0, $t1
syscall
