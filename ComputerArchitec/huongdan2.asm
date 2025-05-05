.data
zero: .float 0.0
one: .float 1.0
two: .float 2.0
three: .float 3.0
four: .float 4.0
seven: .float 7.0
.text
main:
lwc1 $f0, seven
li $v0, 6
		syscall
		mov.s $f1, $f0

		li $v0, 6
		syscall
		mov.s $f2, $f0
		
		mul.s $f1, $f1, $f0
		add.s $f1, $f1, $f2
		
		lwc1 $f31,  zero
		lwc1 $f30,  one
		lwc1 $f29,  two
		lwc1 $f28,  three
		lwc1 $f27,  four
		
		c:
		c.eq.s $f1, $f31
		bc1f c1
		j main
		
		c1:
		c.eq.s $f1, $f30
		bc1f c2
		j main
		
		c2:
		c.eq.s $f1, $f29
		bc1f c3
		j main
		
		c3:
		c.eq.s $f1, $f28
		bc1f c4
		j main
		
		c4:
		c.eq.s $f1, $f27
		bc1f end
		j main
end:
li $v0, 10
syscall