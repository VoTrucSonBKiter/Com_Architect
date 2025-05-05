.data
welcome: .asciiz "***: Welcome to BATTLE SHIP! \n"
siri: .asciiz "***: They call me Sirius, the supporter. \n"
again: .asciiz "Place your ship fail! \n "
again1: .asciiz "Invalid! \n"
tenP1: .asciiz "Sirius: Player 1, what can i call you (max 9 characters): \n"
p1: .asciiz "Player1: "
p2: .asciiz "Player2: "
sirius: .asciiz "Sirius: "
player1name: .space 10
player2name: .space 10
chaomung: .asciiz "Sirius: Nice to meet you, "
tenP2: .asciiz "Sirius: How about you, player 2. \n"
str: .asciiz "Player2: You can call me "
Intro: .asciiz "Now, let me tell you some information about BATTLE SHIP \n"
comma: .asciiz ", "
enter: .asciiz "\n"
Intro1: .asciiz "Both of you are competitors \n"
Intro2: .asciiz "You will have 6 ships and 49 blocks for each of you \n"
Intro3: .asciiz "Place the ship carefully, shoot each other and win the game \n"
Intro4: .asciiz "Have fun, both of you :> \n"
prepare: .asciiz "Now, let's prepare for the fight. \n"
prepare1: .asciiz "Place your 4x1 ship, "
prepare2: .asciiz "Place your first 3x1 ship, "
prepare3: .asciiz "Place your second 3x1 ship, "
prepare4: .asciiz "Place your first 2x1 ship, "
prepare5: .asciiz "Place your second 2x1 ship, "
prepare6: .asciiz "Place your third 2x1 ship, "
insert: .asciiz "Please insert row of head, collumn of head, row of tail and collumn of tail. \n"
begin: .asciiz "Now both of you are ready. For each turn, both of you get one shot. \n"
begin1: .asciiz "GOOD LUCK!!! \n"
fight: .asciiz "READYYYYYYYY!!!!!! SHOOTTTTTTTOOOOOO! \n"
fight1: .asciiz "Enter row and collumn of the square you want to shoot, "
miss: .asciiz "You missed. Opponent phase! \n"
ns: .asciiz "HIT !!! \n"
turn: .asciiz "Opponent phase \n "
victory: .asciiz "The victory belong to "
zero: .float 0.0
one: .float 1.0
two: .float 2.0
three: .float 3.0
six: .float 6.0
seven: .float 7.0
fn: .float 49.0
.text
lwc1 $f5, zero
lwc1 $f6, six
lwc1 $f8, three
lwc1 $f9, seven
lwc1 $f13, two
lwc1 $f14, one
# Get player name
li $v0, 4
la $a0, welcome
syscall

li $v0, 4
la $a0, siri

li $v0, 4
la $a0, tenP1
syscall

li $v0, 4
la $a0, p1
syscall

li $v0, 8
la $a0, player1name
li $a1, 10
syscall

li $v0, 4
la $a0, enter
syscall

li $v0, 4
la $a0, chaomung
syscall

li $v0, 4
la $a0, player1name
syscall

li $v0, 4
la $a0, tenP2
syscall

li $v0, 4
la $a0, str
syscall

li $v0, 8
la $a0, player2name
li $a1, 10
syscall

li $v0, 4
la $a0, enter
syscall

li $v0, 4
la $a0, chaomung
syscall

li $v0, 4
la $a0, player2name
syscall

#Introduce the game
li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, Intro
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, Intro1
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, Intro2
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, Intro3
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, Intro4
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, prepare
syscall

j p1_4x1

#Get player 1 ship
# 4x1 ship
p1_4x1:
li $v0, 4
la $a0, enter
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, prepare1
syscall

li $v0, 4
la $a0, player1name
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, insert
syscall

li $v0, 4
la $a0, p1
syscall

li $v0, 6
syscall
mov.s $f1, $f0

li $v0, 6
syscall
mov.s $f2, $f0

li $v0, 6
syscall
mov.s $f3, $f0

li $v0, 6
syscall
mov.s $f4, $f0

j check1_4x1

check1_4x1: 
	#check head row
	c.lt.s $f1, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f1     # Compare if $f1 < 6.0
	bc1t wrong     # Branch if $f1 is not within the range
	c.lt.s $f2, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f2     # Compare if $f1 < 6.0
	bc1t wrong     # Branch if $f1 is not within the range
	c.lt.s $f3, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f3     # Compare if $f1 < 6.0
	bc1t wrong     # Branch if $f1 is not within the range
	c.lt.s $f4, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f4     # Compare if $f1 < 6.0
	bc1t wrong     # Branch if $f1 is not within the range
	j check2_4x1
	wrong:
		li $v0, 4
		la $a0, sirius
		syscall
		li $v0, 4
		la $a0, again
		syscall
		j p1_4x1
	check2_4x1:
		c.eq.s $f1, $f3
		bc1f check2_2_4x1
		j check3_1_4x1
		check2_2_4x1:
		c.eq.s $f2, $f4
		bc1f wrong
		j check3_2_4x1
			
		check3_1_4x1:
			sub.s $f7, $f2, $f4
			abs.s $f7, $f7
			c.eq.s $f7, $f8
			bc1f wrong
			j convert4x1_1
		check3_2_4x1:
			sub.s $f7, $f1, $f3
			abs.s $f7, $f7
			c.eq.s $f7, $f8
			bc1f wrong
			j convert4x1_2
convert4x1_1:
	mul.s $f10, $f1, $f9
	add.s $f10, $f10, $f2
	mul.s $f11, $f1, $f9
	add.s $f11, $f11, $f4
	c.le.s $f10, $f11
	bc1f convert4x1a
	j convert4x1b
	convert4x1a:
		mov.s $f31, $f10
		mov.s $f30, $f11
		j p1_3x1_1
	convert4x1b:
		mov.s $f31, $f11
		mov.s $f30, $f10
		j p1_3x1_1
convert4x1_2:
	mul.s $f10, $f1, $f9
	add.s $f10, $f10, $f2
	mul.s $f11, $f3, $f9
	add.s $f11, $f11, $f4
	c.le.s $f10, $f11
	bc1f convert4x1c
	j convert4x1d
	convert4x1c:
		mov.s $f31, $f10
		mov.s $f30, $f11
		j p1_3x1_1
	convert4x1d:
		mov.s $f31, $f11
		mov.s $f30, $f10
		j p1_3x1_1
p1_3x1_1:
li $v0, 4
la $a0, enter
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, prepare2
syscall

li $v0, 4
la $a0, player1name
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, insert
syscall

li $v0, 4
la $a0, p1
syscall

li $v0, 6
syscall
mov.s $f1, $f0

li $v0, 6
syscall
mov.s $f2, $f0

li $v0, 6
syscall
mov.s $f3, $f0

li $v0, 6
syscall
mov.s $f4, $f0

j check1_3x1_1

check1_3x1_1:
	#check head row
	c.lt.s $f1, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f1     # Compare if $f1 < 6.0
	bc1t wrong1     # Branch if $f1 is not within the range
	c.lt.s $f2, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f2     # Compare if $f1 < 6.0
	bc1t wrong1     # Branch if $f1 is not within the range
	c.lt.s $f3, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f3     # Compare if $f1 < 6.0
	bc1t wrong1     # Branch if $f1 is not within the range
	c.lt.s $f4, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f4     # Compare if $f1 < 6.0
	bc1t wrong1     # Branch if $f1 is not within the range
	j check2_3x1_1
	wrong1:
		li $v0, 4
		la $a0, sirius
		syscall
		li $v0, 4
		la $a0, again
		syscall
		j p1_3x1_1
	check2_3x1_1:
		c.eq.s $f1, $f3
		bc1f check2_2_3x1_1
		j check3_1_3x1_1
		check2_2_3x1_1:
		c.eq.s $f2, $f4
		bc1f wrong1
		j check3_2_3x1_1
			
		check3_1_3x1_1:
			sub.s $f7, $f2, $f4
			abs.s $f7, $f7
			c.eq.s $f7, $f13
			bc1f wrong1
			j convert3x1_1_1
		check3_2_3x1_1:
			sub.s $f7, $f1, $f3
			abs.s $f7, $f7
			c.eq.s $f7, $f13
			bc1f wrong1
			j convert3x1_1_2
convert3x1_1_1:
	mul.s $f10, $f1, $f9
	add.s $f10, $f10, $f2
	mul.s $f11, $f1, $f9
	add.s $f11, $f11, $f4
	c.le.s $f10, $f11
	bc1f convert3x1_1a
	j convert3x1_1b
	convert3x1_1a:
		mov.s $f29, $f10
		mov.s $f28, $f11
		j p1_3x1_2
	convert3x1_1b:
		mov.s $f29, $f11
		mov.s $f28, $f10
		j p1_3x1_2
convert3x1_1_2:
	mul.s $f10, $f1, $f9
	add.s $f10, $f10, $f2
	mul.s $f11, $f3, $f9
	add.s $f11, $f11, $f4
	c.le.s $f10, $f11
	bc1f convert3x1_1c
	j convert3x1_1d
	convert3x1_1c:
		mov.s $f29, $f10
		mov.s $f28, $f11
		j p1_3x1_2
	convert3x1_1d:
		mov.s $f29, $f11
		mov.s $f28, $f10
		j p1_3x1_2
p1_3x1_2:
li $v0, 4
la $a0, enter
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, prepare3
syscall

li $v0, 4
la $a0, player1name
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, insert
syscall

li $v0, 4
la $a0, p1
syscall

li $v0, 6
syscall
mov.s $f1, $f0

li $v0, 6
syscall
mov.s $f2, $f0

li $v0, 6
syscall
mov.s $f3, $f0

li $v0, 6
syscall
mov.s $f4, $f0

j check1_3x1_2

check1_3x1_2:
	#check head row
	c.lt.s $f1, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f1     # Compare if $f1 < 6.0
	bc1t wrong2     # Branch if $f1 is not within the range
	c.lt.s $f2, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f2     # Compare if $f1 < 6.0
	bc1t wrong2     # Branch if $f1 is not within the range
	c.lt.s $f3, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f3     # Compare if $f1 < 6.0
	bc1t wrong2     # Branch if $f1 is not within the range
	c.lt.s $f4, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f4     # Compare if $f1 < 6.0
	bc1t wrong2     # Branch if $f1 is not within the range
	j check2_3x1_2
	wrong2:
		li $v0, 4
		la $a0, sirius
		syscall
		li $v0, 4
		la $a0, again
		syscall
		j p1_3x1_2
	check2_3x1_2:
		c.eq.s $f1, $f3
		bc1f check2_2_3x1_2
		j check3_1_3x1_2
		check2_2_3x1_2:
		c.eq.s $f2, $f4
		bc1f wrong2
		j check3_2_3x1_2
			
		check3_1_3x1_2:
			sub.s $f7, $f2, $f4
			abs.s $f7, $f7
			c.eq.s $f7, $f13
			bc1f wrong2
			j convert3x1_2_1
		check3_2_3x1_2:
			sub.s $f7, $f1, $f3
			abs.s $f7, $f7
			c.eq.s $f7, $f13
			bc1f wrong2
			j convert3x1_2_2
convert3x1_2_1:
	mul.s $f10, $f1, $f9
	add.s $f10, $f10, $f2
	mul.s $f11, $f1, $f9
	add.s $f11, $f11, $f4
	c.le.s $f10, $f11
	bc1f convert3x1_2a
	j convert3x1_2b
	convert3x1_2a:
		mov.s $f27, $f10
		mov.s $f26, $f11
		j p1_2x1_1
	convert3x1_2b:
		mov.s $f27, $f11
		mov.s $f26, $f10
		j p1_2x1_1
convert3x1_2_2:
	mul.s $f10, $f1, $f9
	add.s $f10, $f10, $f2
	mul.s $f11, $f3, $f9
	add.s $f11, $f11, $f4
	c.le.s $f10, $f11
	bc1f convert3x1_2c
	j convert3x1_2d
	convert3x1_2c:
		mov.s $f27, $f10
		mov.s $f26, $f11
		j p1_2x1_1
	convert3x1_2d:
		mov.s $f27, $f11
		mov.s $f26, $f10
		j p1_2x1_1
p1_2x1_1:
li $v0, 4
la $a0, enter
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, prepare4
syscall

li $v0, 4
la $a0, player1name
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, insert
syscall

li $v0, 4
la $a0, p1
syscall

li $v0, 6
syscall
mov.s $f1, $f0

li $v0, 6
syscall
mov.s $f2, $f0

li $v0, 6
syscall
mov.s $f3, $f0

li $v0, 6
syscall
mov.s $f4, $f0

j check1_2x1_1

check1_2x1_1:
	#check head row
	c.lt.s $f1, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f1     # Compare if $f1 < 6.0
	bc1t wrong3     # Branch if $f1 is not within the range
	c.lt.s $f2, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f2     # Compare if $f1 < 6.0
	bc1t wrong3     # Branch if $f1 is not within the range
	c.lt.s $f3, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f3     # Compare if $f1 < 6.0
	bc1t wrong3     # Branch if $f1 is not within the range
	c.lt.s $f4, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f4     # Compare if $f1 < 6.0
	bc1t wrong3     # Branch if $f1 is not within the range
	j check2_2x1_1
	wrong3:
		li $v0, 4
		la $a0, sirius
		syscall
		li $v0, 4
		la $a0, again
		syscall
		j p1_2x1_1
	check2_2x1_1:
		c.eq.s $f1, $f3
		bc1f check2_2_2x1_1
		j check3_1_2x1_1
		check2_2_2x1_1:
		c.eq.s $f2, $f4
		bc1f wrong3
		j check3_2_2x1_1
			
		check3_1_2x1_1:
			sub.s $f7, $f2, $f4
			abs.s $f7, $f7
			c.eq.s $f7, $f14
			bc1f wrong3
			j convert2x1_1_1
		check3_2_2x1_1:
			sub.s $f7, $f1, $f3
			abs.s $f7, $f7
			c.eq.s $f7, $f14
			bc1f wrong3
			j convert2x1_1_2
convert2x1_1_1:
	mul.s $f10, $f1, $f9
	add.s $f10, $f10, $f2
	mul.s $f11, $f1, $f9
	add.s $f11, $f11, $f4
	c.le.s $f10, $f11
	bc1f convert2x1_1a
	j convert2x1_1b
	convert2x1_1a:
		mov.s $f25, $f10
		mov.s $f24, $f11
		j p1_2x1_2
	convert2x1_1b:
		mov.s $f25, $f11
		mov.s $f24, $f10
		j p1_2x1_2
convert2x1_1_2:
	mul.s $f10, $f1, $f9
	add.s $f10, $f10, $f2
	mul.s $f11, $f3, $f9
	add.s $f11, $f11, $f4
	c.le.s $f10, $f11
	bc1f convert2x1_1c
	j convert2x1_1d
	convert2x1_1c:
		mov.s $f25, $f10
		mov.s $f24, $f11
		j p1_2x1_2
	convert2x1_1d:
		mov.s $f25, $f11
		mov.s $f24, $f10
		j p1_2x1_2
p1_2x1_2:
li $v0, 4
la $a0, enter
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, prepare5
syscall

li $v0, 4
la $a0, player1name
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, insert
syscall

li $v0, 4
la $a0, p1
syscall

li $v0, 6
syscall
mov.s $f1, $f0

li $v0, 6
syscall
mov.s $f2, $f0

li $v0, 6
syscall
mov.s $f3, $f0

li $v0, 6
syscall
mov.s $f4, $f0

j check1_2x1_2

check1_2x1_2:
	#check head row
	c.lt.s $f1, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f1     # Compare if $f1 < 6.0
	bc1t wrong4     # Branch if $f1 is not within the range
	c.lt.s $f2, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f2     # Compare if $f1 < 6.0
	bc1t wrong4     # Branch if $f1 is not within the range
	c.lt.s $f3, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f3     # Compare if $f1 < 6.0
	bc1t wrong4     # Branch if $f1 is not within the range
	c.lt.s $f4, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f4     # Compare if $f1 < 6.0
	bc1t wrong4     # Branch if $f1 is not within the range
	j check2_2x1_2
	wrong4:
		li $v0, 4
		la $a0, sirius
		syscall
		li $v0, 4
		la $a0, again
		syscall
		j p1_2x1_2
	check2_2x1_2:
		c.eq.s $f1, $f3
		bc1f check2_2_2x1_2
		j check3_1_2x1_2
		check2_2_2x1_2:
		c.eq.s $f2, $f4
		bc1f wrong4
		j check3_2_2x1_2
			
		check3_1_2x1_2:
			sub.s $f7, $f2, $f4
			abs.s $f7, $f7
			c.eq.s $f7, $f14
			bc1f wrong4
			j convert2x1_2_1
		check3_2_2x1_2:
			sub.s $f7, $f1, $f3
			abs.s $f7, $f7
			c.eq.s $f7, $f14
			bc1f wrong4
			j convert2x1_2_2
convert2x1_2_1:
	mul.s $f10, $f1, $f9
	add.s $f10, $f10, $f2
	mul.s $f11, $f1, $f9
	add.s $f11, $f11, $f4
	c.le.s $f10, $f11
	bc1f convert2x1_2a
	j convert2x1_2b
	convert2x1_2a:
		mov.s $f23, $f10
		mov.s $f22, $f11
		j p1_2x1_3
	convert2x1_2b:
		mov.s $f23, $f11
		mov.s $f22, $f10
		j p1_2x1_3
convert2x1_2_2:
	mul.s $f10, $f1, $f9
	add.s $f10, $f10, $f2
	mul.s $f11, $f3, $f9
	add.s $f11, $f11, $f4
	c.le.s $f10, $f11
	bc1f convert2x1_2c
	j convert2x1_2d
	convert2x1_2c:
		mov.s $f23, $f10
		mov.s $f22, $f11
		j p1_2x1_3
	convert2x1_2d:
		mov.s $f23, $f11
		mov.s $f22, $f10
		j p1_2x1_3
p1_2x1_3:
li $v0, 4
la $a0, enter
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, prepare6
syscall

li $v0, 4
la $a0, player1name
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, insert
syscall

li $v0, 4
la $a0, p1
syscall

li $v0, 6
syscall
mov.s $f1, $f0

li $v0, 6
syscall
mov.s $f2, $f0

li $v0, 6
syscall
mov.s $f3, $f0

li $v0, 6
syscall
mov.s $f4, $f0

j check1_2x1_3

check1_2x1_3:
	#check head row
	c.lt.s $f1, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f1     # Compare if $f1 < 6.0
	bc1t wrong5     # Branch if $f1 is not within the range
	c.lt.s $f2, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f2     # Compare if $f1 < 6.0
	bc1t wrong5     # Branch if $f1 is not within the range
	c.lt.s $f3, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f3     # Compare if $f1 < 6.0
	bc1t wrong5     # Branch if $f1 is not within the range
	c.lt.s $f4, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f4     # Compare if $f1 < 6.0
	bc1t wrong5     # Branch if $f1 is not within the range
	j check2_2x1_3
	wrong5:
		li $v0, 4
		la $a0, sirius
		syscall
		li $v0, 4
		la $a0, again
		syscall
		j p1_2x1_3
	check2_2x1_3:
		c.eq.s $f1, $f3
		bc1f check2_2_2x1_3
		j check3_1_2x1_3
		check2_2_2x1_3:
		c.eq.s $f2, $f4
		bc1f wrong5
		j check3_2_2x1_3
			
		check3_1_2x1_3:
			sub.s $f7, $f2, $f4
			abs.s $f7, $f7
			c.eq.s $f7, $f14
			bc1f wrong5
			j convert2x1_3_1
		check3_2_2x1_3:
			sub.s $f7, $f1, $f3
			abs.s $f7, $f7
			c.eq.s $f7, $f14
			bc1f wrong5
			j convert2x1_3_2
convert2x1_3_1:
	mul.s $f10, $f1, $f9
	add.s $f10, $f10, $f2
	mul.s $f11, $f1, $f9
	add.s $f11, $f11, $f4
	c.le.s $f10, $f11
	bc1f convert2x1_3a
	j convert2x1_3b
	convert2x1_3a:
		mov.s $f21, $f10
		mov.s $f20, $f11
		j p2_4x1
	convert2x1_3b:
		mov.s $f21, $f11
		mov.s $f20, $f10
		j p2_4x1
convert2x1_3_2:
	mul.s $f10, $f1, $f9
	add.s $f10, $f10, $f2
	mul.s $f11, $f3, $f9
	add.s $f11, $f11, $f4
	c.le.s $f10, $f11
	bc1f convert2x1_3c
	j convert2x1_3d
	convert2x1_3c:
		mov.s $f21, $f10
		mov.s $f20, $f11
		j p2_4x1
	convert2x1_3d:
		mov.s $f21, $f11
		mov.s $f20, $f10
		j p2_4x1
p2_4x1:
li $v0, 4
la $a0, enter
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, prepare1
syscall

li $v0, 4
la $a0, player2name
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, insert
syscall

li $v0, 4
la $a0, p2
syscall

li $v0, 6
syscall
mov.s $f1, $f0

li $v0, 6
syscall
mov.s $f2, $f0

li $v0, 6
syscall
mov.s $f3, $f0

li $v0, 6
syscall
mov.s $f4, $f0

j cook1_4x1

cook1_4x1: 
	#check head row
	c.lt.s $f1, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f1     # Compare if $f1 < 6.0
	bc1t wrong6     # Branch if $f1 is not within the range
	c.lt.s $f2, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f2     # Compare if $f1 < 6.0
	bc1t wrong6     # Branch if $f1 is not within the range
	c.lt.s $f3, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f3     # Compare if $f1 < 6.0
	bc1t wrong6     # Branch if $f1 is not within the range
	c.lt.s $f4, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f4     # Compare if $f1 < 6.0
	bc1t wrong6     # Branch if $f1 is not within the range
	j cook2_4x1
	wrong6:
		li $v0, 4
		la $a0, sirius
		syscall
		li $v0, 4
		la $a0, again
		syscall
		j p2_4x1
	cook2_4x1:
		c.eq.s $f1, $f3
		bc1f cook2_2_4x1
		j cook3_1_4x1
		cook2_2_4x1:
		c.eq.s $f2, $f4
		bc1f wrong6
		j cook3_2_4x1
			
		cook3_1_4x1:
			sub.s $f7, $f2, $f4
			abs.s $f7, $f7
			c.eq.s $f7, $f8
			bc1f wrong6
			j tranfer4x1_1
		cook3_2_4x1:
			sub.s $f7, $f1, $f3
			abs.s $f7, $f7
			c.eq.s $f7, $f8
			bc1f wrong6
			j tranfer4x1_2
tranfer4x1_1:
	mul.s $f10, $f1, $f9
	add.s $f10, $f10, $f2
	mul.s $f11, $f1, $f9
	add.s $f11, $f11, $f4
	c.le.s $f10, $f11
	bc1f tranfer4x1a
	j tranfer4x1b
	tranfer4x1a:
		mov.s $f19, $f10
		mov.s $f18, $f11
		j p2_3x1_1
	tranfer4x1b:
		mov.s $f19, $f11
		mov.s $f18, $f10
		j p2_3x1_1
tranfer4x1_2:
	mul.s $f10, $f1, $f9
	add.s $f10, $f10, $f2
	mul.s $f11, $f3, $f9
	add.s $f11, $f11, $f4
	c.le.s $f10, $f11
	bc1f tranfer4x1c
	j tranfer4x1d
	tranfer4x1c:
		mov.s $f19, $f10
		mov.s $f18, $f11
		j p2_3x1_1
	tranfer4x1d:
		mov.s $f19, $f11
		mov.s $f18, $f10
		j p2_3x1_1
p2_3x1_1:
li $v0, 4
la $a0, enter
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, prepare2
syscall

li $v0, 4
la $a0, player2name
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, insert
syscall

li $v0, 4
la $a0, p2
syscall

li $v0, 6
syscall
mov.s $f1, $f0

li $v0, 6
syscall
mov.s $f2, $f0

li $v0, 6
syscall
mov.s $f3, $f0

li $v0, 6
syscall
mov.s $f4, $f0

j cook1_3x1_1

cook1_3x1_1:
	#check head row
	c.lt.s $f1, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f1     # Compare if $f1 < 6.0
	bc1t wrong7     # Branch if $f1 is not within the range
	c.lt.s $f2, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f2     # Compare if $f1 < 6.0
	bc1t wrong7    # Branch if $f1 is not within the range
	c.lt.s $f3, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f3     # Compare if $f1 < 6.0
	bc1t wrong7     # Branch if $f1 is not within the range
	c.lt.s $f4, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f4     # Compare if $f1 < 6.0
	bc1t wrong7     # Branch if $f1 is not within the range
	j cook2_3x1_1
	wrong7:
		li $v0, 4
		la $a0, sirius
		syscall
		li $v0, 4
		la $a0, again
		syscall
		j p2_3x1_1
	cook2_3x1_1:
		c.eq.s $f1, $f3
		bc1f cook2_2_3x1_1
		j cook3_1_3x1_1
		cook2_2_3x1_1:
		c.eq.s $f2, $f4
		bc1f wrong7
		j cook3_2_3x1_1
			
		cook3_1_3x1_1:
			sub.s $f7, $f2, $f4
			abs.s $f7, $f7
			c.eq.s $f7, $f13
			bc1f wrong7
			j tranfer3x1_1_1
		cook3_2_3x1_1:
			sub.s $f7, $f1, $f3
			abs.s $f7, $f7
			c.eq.s $f7, $f13
			bc1f wrong7
			j tranfer3x1_1_2
tranfer3x1_1_1:
	mul.s $f10, $f1, $f9
	add.s $f10, $f10, $f2
	mul.s $f11, $f1, $f9
	add.s $f11, $f11, $f4
	c.le.s $f10, $f11
	bc1f tranfer3x1_1a
	j tranfer3x1_1b
	tranfer3x1_1a:
		mov.s $f17, $f10
		mov.s $f16, $f11
		j p2_3x1_2
	tranfer3x1_1b:
		mov.s $f17, $f11
		mov.s $f16, $f10
		j p2_3x1_2
tranfer3x1_1_2:
	mul.s $f10, $f1, $f9
	add.s $f10, $f10, $f2
	mul.s $f11, $f3, $f9
	add.s $f11, $f11, $f4
	c.le.s $f10, $f11
	bc1f tranfer3x1_1c
	j tranfer3x1_1d
	tranfer3x1_1c:
		mov.s $f17, $f10
		mov.s $f16, $f11
		j p2_3x1_2
	tranfer3x1_1d:
		mov.s $f17, $f11
		mov.s $f16, $f10
		j p2_3x1_2
p2_3x1_2:
li $v0, 4
la $a0, enter
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, prepare3
syscall

li $v0, 4
la $a0, player2name
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, insert
syscall

li $v0, 4
la $a0, p2
syscall

li $v0, 6
syscall
mov.s $f1, $f0

li $v0, 6
syscall
mov.s $f2, $f0

li $v0, 6
syscall
mov.s $f3, $f0

li $v0, 6
syscall
mov.s $f4, $f0

j cook1_3x1_2

cook1_3x1_2:
	#check head row
	c.lt.s $f1, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f1     # Compare if $f1 < 6.0
	bc1t wrong8     # Branch if $f1 is not within the range
	c.lt.s $f2, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f2     # Compare if $f1 < 6.0
	bc1t wrong8     # Branch if $f1 is not within the range
	c.lt.s $f3, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f3     # Compare if $f1 < 6.0
	bc1t wrong8     # Branch if $f1 is not within the range
	c.lt.s $f4, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f4     # Compare if $f1 < 6.0
	bc1t wrong8    # Branch if $f1 is not within the range
	j cook2_3x1_2
	wrong8:
		li $v0, 4
		la $a0, sirius
		syscall
		li $v0, 4
		la $a0, again
		syscall
		j p2_3x1_2
	cook2_3x1_2:
		c.eq.s $f1, $f3
		bc1f cook2_2_3x1_2
		j cook3_1_3x1_2
		cook2_2_3x1_2:
		c.eq.s $f2, $f4
		bc1f wrong8
		j cook3_2_3x1_2
			
		cook3_1_3x1_2:
			sub.s $f7, $f2, $f4
			abs.s $f7, $f7
			c.eq.s $f7, $f13
			bc1f wrong8
			j tranfer3x1_2_1
		cook3_2_3x1_2:
			sub.s $f7, $f1, $f3
			abs.s $f7, $f7
			c.eq.s $f7, $f13
			bc1f wrong8
			j tranfer3x1_2_2
tranfer3x1_2_1:
	mul.s $f10, $f1, $f9
	add.s $f10, $f10, $f2
	mul.s $f11, $f1, $f9
	add.s $f11, $f11, $f4
	c.le.s $f10, $f11
	bc1f tranfer3x1_2a
	j tranfer3x1_2b
	tranfer3x1_2a:
		mov.s $f15, $f10
		mov.s $f14, $f11
		j p2_2x1_1
	tranfer3x1_2b:
		mov.s $f15, $f11
		mov.s $f14, $f10
		j p2_2x1_1
tranfer3x1_2_2:
	mul.s $f10, $f1, $f9
	add.s $f10, $f10, $f2
	mul.s $f11, $f3, $f9
	add.s $f11, $f11, $f4
	c.le.s $f10, $f11
	bc1f tranfer3x1_2c
	j tranfer3x1_2d
	tranfer3x1_2c:
		mov.s $f15, $f10
		mov.s $f14, $f11
		j p2_2x1_1
	tranfer3x1_2d:
		mov.s $f15, $f11
		mov.s $f14, $f10
		j p2_2x1_1
p2_2x1_1:
lwc1 $f7, one
li $v0, 4
la $a0, enter
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, prepare4
syscall

li $v0, 4
la $a0, player2name
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, insert
syscall

li $v0, 4
la $a0, p2
syscall

li $v0, 6
syscall
mov.s $f1, $f0

li $v0, 6
syscall
mov.s $f2, $f0

li $v0, 6
syscall
mov.s $f3, $f0

li $v0, 6
syscall
mov.s $f4, $f0

j cook1_2x1_1

cook1_2x1_1:
	#check head row
	c.lt.s $f1, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f1     # Compare if $f1 < 6.0
	bc1t wrong9     # Branch if $f1 is not within the range
	c.lt.s $f2, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f2     # Compare if $f1 < 6.0
	bc1t wrong9     # Branch if $f1 is not within the range
	c.lt.s $f3, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f3     # Compare if $f1 < 6.0
	bc1t wrong9     # Branch if $f1 is not within the range
	c.lt.s $f4, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f4     # Compare if $f1 < 6.0
	bc1t wrong9     # Branch if $f1 is not within the range
	j cook2_2x1_1
	wrong9:
		li $v0, 4
		la $a0, sirius
		syscall
		li $v0, 4
		la $a0, again
		syscall
		j p2_2x1_1
	cook2_2x1_1:
		c.eq.s $f1, $f3
		bc1f cook2_2_2x1_1
		j cook3_1_2x1_1
		cook2_2_2x1_1:
		c.eq.s $f2, $f4
		bc1f wrong9
		j cook3_2_2x1_1
			
		cook3_1_2x1_1:
			sub.s $f5, $f2, $f4
			abs.s $f5, $f5
			c.eq.s $f5, $f7
			bc1f wrong9
			j tranfer2x1_1_1
		cook3_2_2x1_1:
			sub.s $f5, $f1, $f3
			abs.s $f5, $f5
			c.eq.s $f5, $f7
			bc1f wrong9
			j tranfer2x1_1_2
tranfer2x1_1_1:
	lwc1 $f0, seven
	mul.s $f6, $f1, $f0
	add.s $f6, $f6, $f2
	mul.s $f8, $f1, $f0
	add.s $f8, $f8, $f4
	c.le.s $f6, $f8
	bc1f tranfer2x1_1a
	j tranfer2x1_1b
	tranfer2x1_1a:
		mov.s $f13, $f6
		mov.s $f11, $f8
		j p2_2x1_2
	tranfer2x1_1b:
		mov.s $f13, $f8
		mov.s $f11, $f6
		j p2_2x1_2
tranfer2x1_1_2:
	lwc1 $f0, seven
	mul.s $f6, $f1, $f0
	add.s $f6, $f6, $f2
	mul.s $f6, $f3, $f0
	add.s $f8, $f8, $f4
	c.le.s $f6, $f8
	bc1f tranfer2x1_1c
	j tranfer2x1_1d
	tranfer2x1_1c:
		mov.s $f13, $f6
		mov.s $f11, $f8
		j p2_2x1_2
	tranfer2x1_1d:
		mov.s $f13, $f8
		mov.s $f11, $f6
		j p2_2x1_2
		
p2_2x1_2:
lwc1 $f5, zero
lwc1 $f6, six
li $v0, 4
la $a0, enter
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, prepare5
syscall

li $v0, 4
la $a0, player2name
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, insert
syscall

li $v0, 4
la $a0, p2
syscall

li $v0, 6
syscall
mov.s $f1, $f0

li $v0, 6
syscall
mov.s $f2, $f0

li $v0, 6
syscall
mov.s $f3, $f0

li $v0, 6
syscall
mov.s $f4, $f0

j cook1_2x1_2

cook1_2x1_2:
	#check head row
	c.lt.s $f1, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f1     # Compare if $f1 < 6.0
	bc1t wrong10     # Branch if $f1 is not within the range
	c.lt.s $f2, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f2     # Compare if $f1 < 6.0
	bc1t wrong10     # Branch if $f1 is not within the range
	c.lt.s $f3, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f3     # Compare if $f1 < 6.0
	bc1t wrong10     # Branch if $f1 is not within the range
	c.lt.s $f4, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f4     # Compare if $f1 < 6.0
	bc1t wrong10     # Branch if $f1 is not within the range
	j cook2_2x1_2
	wrong10:
		li $v0, 4
		la $a0, sirius
		syscall
		li $v0, 4
		la $a0, again
		syscall
		j p2_2x1_2
	cook2_2x1_2:
		lwc1 $f5, one
		c.eq.s $f1, $f3
		bc1f cook2_2_2x1_2
		j cook3_1_2x1_2
		cook2_2_2x1_2:
		c.eq.s $f2, $f4
		bc1f wrong10
		j cook3_2_2x1_2
			
		cook3_1_2x1_2:
			sub.s $f6, $f2, $f4
			abs.s $f6, $f6
			c.eq.s $f6, $f5
			bc1f wrong10
			j tranfer2x1_2_1
		cook3_2_2x1_2:
			sub.s $f6, $f1, $f3
			abs.s $f6, $f6
			c.eq.s $f6, $f5
			bc1f wrong10
			j tranfer2x1_2_2
tranfer2x1_2_1:
	lwc1 $f0, seven
	mul.s $f5, $f1, $f0
	add.s $f5, $f5, $f2
	mul.s $f6, $f1, $f0
	add.s $f6, $f6, $f4
	c.le.s $f5, $f6
	bc1f tranfer2x1_2a
	j tranfer2x1_2b
	tranfer2x1_2a:
		mov.s $f10, $f5
		mov.s $f9, $f6
		j p2_2x1_3
	tranfer2x1_2b:
		mov.s $f10, $f6
		mov.s $f9, $f5
		j p2_2x1_3
tranfer2x1_2_2:
	lwc1 $f0, seven
	mul.s $f5, $f1, $f0
	add.s $f5, $f5, $f2
	mul.s $f6, $f3, $f0
	add.s $f6, $f6, $f4
	c.le.s $f5, $f6
	bc1f tranfer2x1_2c
	j tranfer2x1_2d
	tranfer2x1_2c:
		mov.s $f10, $f5
		mov.s $f9, $f6
		j p2_2x1_3
	tranfer2x1_2d:
		mov.s $f10, $f6
		mov.s $f9, $f5
		j p2_2x1_3
p2_2x1_3:
li $v0, 4
la $a0, enter
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, prepare6
syscall

li $v0, 4
la $a0, player2name
syscall

li $v0, 4
la $a0, sirius
syscall

li $v0, 4
la $a0, insert
syscall

li $v0, 4
la $a0, p2
syscall

li $v0, 6
syscall
mov.s $f1, $f0

li $v0, 6
syscall
mov.s $f2, $f0

li $v0, 6
syscall
mov.s $f3, $f0

li $v0, 6
syscall
mov.s $f4, $f0

j cook1_2x1_3

cook1_2x1_3:
	lwc1 $f5, zero
	lwc1 $f6, six
	#check head row
	c.lt.s $f1, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f1     # Compare if $f1 < 6.0
	bc1t wrong11     # Branch if $f1 is not within the range
	c.lt.s $f2, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f2     # Compare if $f1 < 6.0
	bc1t wrong11     # Branch if $f1 is not within the range
	c.lt.s $f3, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f3     # Compare if $f1 < 6.0
	bc1t wrong11    # Branch if $f1 is not within the range
	c.lt.s $f4, $f5     # Compare if 0.0 < $f1
	c.lt.s $f6, $f4     # Compare if $f1 < 6.0
	bc1t wrong11    # Branch if $f1 is not within the range
	j cook2_2x1_3
	wrong11:
		li $v0, 4
		la $a0, sirius
		syscall
		li $v0, 4
		la $a0, again
		syscall
		j p2_2x1_3
	cook2_2x1_3:
		lwc1 $f0, one
		c.eq.s $f1, $f3
		bc1f cook2_2_2x1_3
		j cook3_1_2x1_3
		cook2_2_2x1_3:
		c.eq.s $f2, $f4
		bc1f wrong11
		j cook3_2_2x1_3
			
		cook3_1_2x1_3:
			sub.s $f5, $f2, $f4
			abs.s $f5, $f5
			c.eq.s $f5, $f0
			bc1f wrong11
			j tranfer2x1_3_1
		cook3_2_2x1_3:
			sub.s $f5, $f1, $f3
			abs.s $f5, $f5
			c.eq.s $f5, $f0
			bc1f wrong11
			j tranfer2x1_3_2
tranfer2x1_3_1:
	lwc1 $f0, seven
	mul.s $f5, $f1, $f0
	add.s $f5, $f5, $f2
	mul.s $f6, $f1, $f0
	add.s $f6, $f6, $f4
	c.le.s $f5, $f6
	bc1f tranfer2x1_3a
	j tranfer2x1_3b
	tranfer2x1_3a:
		mov.s $f8, $f5
		mov.s $f7, $f6
		j main
	tranfer2x1_3b:
		mov.s $f8, $f6
		mov.s $f7, $f5
		j main
tranfer2x1_3_2:
	lwc1 $f0, seven
	mul.s $f5, $f1, $f0
	add.s $f5, $f5, $f2
	mul.s $f6, $f3, $f0
	add.s $f6, $f6, $f4
	c.le.s $f5, $f6
	bc1f tranfer2x1_3c
	j tranfer2x1_3d
	tranfer2x1_3c:
		mov.s $f8, $f5
		mov.s $f7, $f6
		j main
	tranfer2x1_3d:
		mov.s $f8, $f6
		mov.s $f7, $f5
		j main		
main:
	li $v0, 4
	la $a0, enter
	syscall

	li $v0,4
	la $a0, sirius
	syscall
	
	li $v0, 4 
	la $a0, begin
	syscall
	
	li $v0,4
	la $a0, sirius
	syscall
	
	li $v0, 4 
	la $a0, begin1
	syscall
	
	j main1
	
	main1:
		lwc1 $f0, fn
		li $v0, 4
		la $a0, enter
		syscall
		
		li $v0, 4
		la $a0, sirius
		syscall
		
		li $v0, 4
		la $a0, fight
		syscall
		
		li $v0, 4
		la $a0, sirius
		syscall
		
		li $v0, 4
		la $a0, fight1
		syscall
		
		li $v0, 4
		la $a0, player1name
		syscall
		
		li $v0, 4
		la $a0, p1
		syscall
		
		li $v0, 6
		syscall
		mov.s $f1, $f0

		li $v0, 6
		syscall
		mov.s $f2, $f0
		
		j checkp1
		
		checkp1:
			lwc1 $f5, zero
			lwc1 $f6, six
			#check head row
			c.lt.s $f1, $f5     # Compare if 0.0 < $f1
			c.lt.s $f6, $f1     # Compare if $f1 < 6.0
			bc1t wrong12     # Branch if $f1 is not within the range
			c.lt.s $f2, $f5     # Compare if 0.0 < $f1
			c.lt.s $f6, $f2     # Compare if $f1 < 6.0
			bc1t wrong12     # Branch if $f1 is not within the range
	
			j cvt1
		wrong12:
			li $v0, 4
			la $a0, sirius
			syscall
			li $v0, 4
			la $a0, again1
			syscall
			j main1
		cvt1:
			lwc1 $f0, seven
			mul.s $f1, $f1, $f0
			add.s $f1, $f1, $f2
			j check1_1
		
		check1_1:
			c.eq.s $f1, $f19
			bc1f c
			j hit
			c:
			c.eq.s $f1, $f18
			bc1f c1
			j hit1
			c1:
			c.eq.s $f1, $f17
			bc1f c2
			j hit2
			c2:
			c.eq.s $f1, $f16
			bc1f c3
			j hit3
			c3:
			c.eq.s $f1, $f15
			bc1f c4
			j hit4
			c4:
			c.eq.s $f1, $f14
			bc1f c5
			j hit5
			c5:
			c.eq.s $f1, $f13
			bc1f c6
			j hit6
			c6:
			c.eq.s $f1, $f11
			bc1f c7
			j hit7
			c7:
			c.eq.s $f1, $f10
			bc1f c8
			j hit8
			c8:
			c.eq.s $f1, $f9
			bc1f c9
			j hit9
			c9:
			c.eq.s $f1, $f8
			bc1f c10
			j hit10
			c10:
			c.eq.s $f1, $f7
			bc1f gg
			j hit11
			gg:
			c.eq.s $f7, $f0
			bc1f miss1
			j totalcheck1
		miss1:
			li $v0, 4
			la $a0, sirius
			syscall
			
			li $v0, 4
			la $a0, miss
			syscall
			
			j totalcheck1
		hit:
			li $v0, 4
			la $a0, ns
			syscall
			
			lwc1 $f19, fn
			
			j main2
		hit1:
			li $v0, 4
			la $a0, ns
			syscall
			
			lwc1 $f18, fn
			
			j main2
		hit2:
			li $v0, 4
			la $a0, ns
			syscall
			
			lwc1 $f17, fn
			
			j main2	
		hit3:
			li $v0, 4
			la $a0, ns
			syscall
			
			lwc1 $f16, fn
			
			j main2	
		hit4:
			li $v0, 4
			la $a0, ns
			syscall
			
			lwc1 $f15, fn
			
			j main2	
		hit5:
			li $v0, 4
			la $a0, ns
			syscall
			
			lwc1 $f14, fn
			
			j main2	
		hit6:
			li $v0, 4
			la $a0, ns
			syscall
			
			lwc1 $f13, fn
			
			j main2	
		hit7:
			li $v0, 4
			la $a0, ns
			syscall
			
			lwc1 $f11, fn
			
			j main2	
		hit8:
			li $v0, 4
			la $a0, ns
			syscall
			
			lwc1 $f10, fn
			
			j main2	
		hit9:
			li $v0, 4
			la $a0, ns
			syscall
			
			lwc1 $f9, fn
			
			j main2	
		hit10:
			li $v0, 4
			la $a0, ns
			syscall
			
			lwc1 $f8, fn
			
			j main2	
		hit11:
			li $v0, 4
			la $a0, ns
			syscall
			
			lwc1 $f7, fn
			
			j main2	
		totalcheck1:
			c.eq.s $f19, $f18
			bc1f main2
			j e
			e:
			c.eq.s $f18, $f17
			bc1f main2
			j e1
			e1:
			c.eq.s $f17, $f16
			bc1f main2
			j e2
			e2:
			c.eq.s $f16, $f15
			bc1f main2
			j e3
			e3:
			c.eq.s $f15, $f14
			bc1f main2
			j e4
			e4:
			c.eq.s $f14, $f13
			bc1f main2
			j e5
			e5:
			c.eq.s $f13, $f11
			bc1f main2
			j e6
			e6:
			c.eq.s $f11, $f10
			bc1f main2
			j e7
			e7:
			c.eq.s $f10, $f9
			bc1f main2
			j e8
			e8:
			c.eq.s $f9, $f8
			bc1f main2
			j e9
			e9:
			c.eq.s $f8, $f7
			bc1f main2
			j end1
	main2: 
		li $v0, 4
		la $a0, sirius
		syscall
		
		li $v0, 4
		la $a0, fight
		syscall
		
		li $v0, 4
		la $a0, sirius
		syscall
		
		li $v0, 4
		la $a0, fight1
		syscall
		
		li $v0, 4
		la $a0, player2name
		syscall
		
		li $v0, 4
		la $a0, p2
		syscall
		
		li $v0, 6
		syscall
		mov.s $f1, $f0

		li $v0, 6
		syscall
		mov.s $f2, $f0
		
		j checkp2
		
		checkp2:
			lwc1 $f5, zero
			lwc1 $f6, six
			#check head row
			c.lt.s $f1, $f5     # Compare if 0.0 < $f1
			c.lt.s $f6, $f1     # Compare if $f1 < 6.0
			bc1t wrong13     # Branch if $f1 is not within the range
			c.lt.s $f2, $f5     # Compare if 0.0 < $f1
			c.lt.s $f6, $f2     # Compare if $f1 < 6.0
			bc1t wrong13     # Branch if $f1 is not within the range
	
			j cvt2
		wrong13:
			li $v0, 4
			la $a0, sirius
			syscall
			li $v0, 4
			la $a0, again1
			syscall
			j main2
		cvt2:
			lwc1 $f0, seven
			mul.s $f1, $f1, $f0
			add.s $f1, $f1, $f2
			j check2_1
		
		check2_1:
			c.eq.s $f1, $f31
			bc1f C
			j hitt
			C:
			c.eq.s $f1, $f30
			bc1f C1
			j hitt1
			C1:
			c.eq.s $f1, $f29
			bc1f C2
			j hitt2
			C2:
			c.eq.s $f1, $f28
			bc1f C3
			j hitt3
			C3:
			c.eq.s $f1, $f27
			bc1f C4
			j hitt4
			C4:
			c.eq.s $f1, $f26
			bc1f C5
			j hitt5
			C5:
			c.eq.s $f1, $f25
			bc1f C6
			j hitt6
			C6:
			c.eq.s $f1, $f24
			bc1f C7
			j hitt7
			C7:
			c.eq.s $f1, $f23
			bc1f C8
			j hitt8
			C8:
			c.eq.s $f1, $f22
			bc1f C9
			j hitt9
			C9:
			c.eq.s $f1, $f21
			bc1f C10
			j hitt10
			C10:
			c.eq.s $f1, $f20
			bc1f GG
			j hitt11
			GG:
			c.eq.s $f20, $f0
			bc1f miss2
			j totalcheck2
		miss2:
			li $v0, 4
			la $a0, sirius
			syscall
			
			li $v0, 4
			la $a0, miss
			syscall
			
			j totalcheck2
		hitt:
			li $v0, 4
			la $a0, ns
			syscall
			
			lwc1 $f31, fn
			
			j main1
		hitt1:
			li $v0, 4
			la $a0, ns
			syscall
			
			lwc1 $f30, fn
			
			j main1
		hitt2:
			li $v0, 4
			la $a0, ns
			syscall
			
			lwc1 $f29, fn
			
			j main1	
		hitt3:
			li $v0, 4
			la $a0, ns
			syscall
			
			lwc1 $f28, fn
			
			j main1	
		hitt4:
			li $v0, 4
			la $a0, ns
			syscall
			
			lwc1 $f27, fn
			
			j main1	
		hitt5:
			li $v0, 4
			la $a0, ns
			syscall
			
			lwc1 $f26, fn
			
			j main1	
		hitt6:
			li $v0, 4
			la $a0, ns
			syscall
			
			lwc1 $f25, fn
			
			j main1	
		hitt7:
			li $v0, 4
			la $a0, ns
			syscall
			
			lwc1 $f24, fn
			
			j main1	
		hitt8:
			li $v0, 4
			la $a0, ns
			syscall
			
			lwc1 $f23, fn
			
			j main1	
		hitt9:
			li $v0, 4
			la $a0, ns
			syscall
			
			lwc1 $f22, fn
			
			j main1	
		hitt10:
			li $v0, 4
			la $a0, ns
			syscall
			
			lwc1 $f21, fn
			
			j main1	
		hitt11:
			li $v0, 4
			la $a0, ns
			syscall
			
			lwc1 $f20, fn
			
			j main1	
		totalcheck2:
			c.eq.s $f31, $f30
			bc1f main1
			j E
			E:
			c.eq.s $f30, $f29
			bc1f main1
			j E1
			E1:
			c.eq.s $f28, $f29
			bc1f main1
			j E2
			E2:
			c.eq.s $f27, $f28
			bc1f main1
			j E3
			E3:
			c.eq.s $f26, $f27
			bc1f main1
			j E4
			E4:
			c.eq.s $f25, $f26
			bc1f main1
			j E5
			E5:
			c.eq.s $f24, $f25
			bc1f main1
			j E6
			E6:
			c.eq.s $f23, $f24
			bc1f main1
			j E7
			E7:
			c.eq.s $f22, $f23
			bc1f main1
			j E8
			E8:
			c.eq.s $f21, $f22
			bc1f main1
			j E9
			E9:
			c.eq.s $f20, $f21
			bc1f main1
			j end2
	
end1: 
	li $v0, 4
	la $a0, sirius
	syscall
	
	li $v0, 4
	la $a0, victory
	syscall
	
	li $v0, 4
	la $a0, player1name
	syscall
	
	li $v0, 10
	syscall
end2: 
	li $v0, 4
	la $a0, sirius
	syscall
	
	li $v0, 4
	la $a0, victory
	syscall
	
	li $v0, 4
	la $a0, player2name
	syscall
	
	li $v0, 10
	syscall
