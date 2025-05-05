.data
eight: .float 8.0
ten: .float 10.0
array: .float 1000.0
.text
lwc1 $f31, eight
l.s $f2, array
lwc1 $f3, eight
lwc1 $f4, ten
loop:
li $v0, 2
mov.s $f1, $f0
syscall

s.s $f2, array
add.s $f2, $f2, $f31

c.eq.s $f3, $f4
bc1f loop
j end

end: li $v0, 10
syscall