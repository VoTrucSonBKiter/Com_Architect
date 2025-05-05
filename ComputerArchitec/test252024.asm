.data
prompt: .asciiz "Input string: "
result: .asciiz "Answer: "
ask: .asciiz "Do you want to continue (Y for Yes / N for No)"
buffer: .space 100
nl: .ascii "\n"
M: .space 100 
zero: .float 0.0
one: .float 1.0
ip1: .asciiz "Input 1st number: \n"
ip2: .asciiz "Input 2nd number: \n"
ope_choice: .asciiz "Choose your operator: \n"
invalid: .asciiz "Invalid character! \n"
.text


    # Kh?i t?o các bi?n ph? tr?
    

    li $t3, 0    # Bi?n lýu tr? toán h?ng hi?n t?i
    li $t4, 0    # Bi?n lýu tr? toán t? hi?n t?i
    li $t5, 0    # Bi?n lýu tr? toán h?ng trý?c ðó
main:

    # In prompt và nh?n chu?i ð?u vào t? ngý?i dùng
    li $v0, 4
    la $a0, prompt
    syscall

    # Ð?c chu?i ð?u vào t? ngý?i dùng
    li $v0, 8
    la $a0, buffer
    li $a1, 100
    syscall
    li $s0, 65
    lb $s2, 0($a0)
    beq $s0, $s2, sothapphan
    # Tính toán k?t qu? t? chu?i ð?u vào và hi?n th?
    li $v0, 4
    la $a0, result
    syscall

    # G?i hàm tính toán và hi?n th? k?t qu?
    jal calculate
    bne $t1, 0, end_int
    li $v0, 2
    mov.s $f12, $f1
    syscall
    
    j end_cont
end_int:
    move $s4, $t1
    li $v0, 1
    move $a0, $t1
    syscall
    
    end_cont:
    li $v0, 4
    la $a0, nl
    syscall

    li $v0, 4
    la $a0, ask
    syscall
    
    li $v0, 8
    la $a0, buffer
    li $a1, 2
    syscall
    
    li $v0, 4
    la $a0, nl
    syscall
    
    la $t0, buffer
    lb $t6, 0($t0)      # Ð?c k? t? ð?u tiên c?a chu?i
    li $t7, 89
    beq $t6, $t7, main
    li $t7, 78
    beq $t6, $t7, end
    bne $t6, $t7, invalid_output
end:
    # K?t thúc chýõng tr?nh
    li $v0, 10
    syscall
    
invalid_output:
	li $v0, 4
	la $a0, invalid
	syscall
	j end_int
ki_tu_tao_lao:
	li $t7, 11
    beq $t6, $t7, invalid_output
    li $t7, 12
    beq $t6, $t7, invalid_output
    li $t7, 13
    beq $t6, $t7, invalid_output
    li $t7, 14
    beq $t6, $t7, invalid_output
    li $t7, 15
    beq $t6, $t7, invalid_output
    li $t7, 34
    beq $t6, $t7, invalid_output
    li $t7, 35
    beq $t6, $t7, invalid_output
    li $t7, 36
    beq $t6, $t7, invalid_output
    li $t7, 37
    beq $t6, $t7, invalid_output
    li $t7, 38
    beq $t6, $t7, invalid_output
    li $t7, 39
    beq $t6, $t7, invalid_output
    li $t7, 44
    beq $t6, $t7, invalid_output
    li $t7, 58
    beq $t6, $t7, invalid_output
    li $t7, 59
    beq $t6, $t7, invalid_output
    li $t7, 60
    beq $t6, $t7, invalid_output
    li $t7, 61
    beq $t6, $t7, invalid_output
    li $t7, 62
    beq $t6, $t7, invalid_output
    li $t7, 63
    beq $t6, $t7, invalid_output
    li $t7, 64
    beq $t6, $t7, invalid_output
    li $t7, 66
    beq $t6, $t7, invalid_output
    li $t7, 67
    beq $t6, $t7, invalid_output
    li $t7, 68
    beq $t6, $t7, invalid_output
    li $t7, 69
    beq $t6, $t7, invalid_output
    li $t7, 70
    beq $t6, $t7, invalid_output
    li $t7, 71
    beq $t6, $t7, invalid_output
    li $t7, 72
    beq $t6, $t7, invalid_output
    li $t7, 73
    beq $t6, $t7, invalid_output
    li $t7, 74
    beq $t6, $t7, invalid_output
    li $t7, 75
    beq $t6, $t7, invalid_output
    li $t7, 76
    beq $t6, $t7, invalid_output
    li $t7, 78
    beq $t6, $t7, invalid_output
    li $t7, 79
    beq $t6, $t7, invalid_output
    li $t7, 80
    beq $t6, $t7, invalid_output
    li $t7, 81
    beq $t6, $t7, invalid_output
    li $t7, 82
    beq $t6, $t7, invalid_output
    li $t7, 83
    beq $t6, $t7, invalid_output
    li $t7, 84
    beq $t6, $t7, invalid_output
    li $t7, 85
    beq $t6, $t7, invalid_output
    li $t7, 86
    beq $t6, $t7, invalid_output
    li $t7, 87
    beq $t6, $t7, invalid_output
    li $t7, 88
    beq $t6, $t7, invalid_output
    li $t7, 89
    beq $t6, $t7, invalid_output
    li $t7, 90
    beq $t6, $t7, invalid_output
    li $t7, 91
    beq $t6, $t7, invalid_output
    li $t7, 92
    beq $t6, $t7, invalid_output
    li $t7, 93
    beq $t6, $t7, invalid_output
    li $t7, 95
    beq $t6, $t7, invalid_output
    li $t7, 96
    beq $t6, $t7, invalid_output
    li $t7, 97
    beq $t6, $t7, invalid_output
    li $t7, 98
    beq $t6, $t7, invalid_output
    li $t7, 99
    beq $t6, $t7, invalid_output
    li $t7, 100
    beq $t6, $t7, invalid_output
    li $t7, 101
    beq $t6, $t7, invalid_output
    li $t7, 102
    beq $t6, $t7, invalid_output
    li $t7, 103
    beq $t6, $t7, invalid_output
    li $t7, 104
    beq $t6, $t7, invalid_output
    li $t7, 105
    beq $t6, $t7, invalid_output
    li $t7, 106
    beq $t6, $t7, invalid_output
    li $t7, 107
    beq $t6, $t7, invalid_output
    li $t7, 108
    beq $t6, $t7, invalid_output
    li $t7, 109
    beq $t6, $t7, invalid_output
    li $t7, 110
    beq $t6, $t7, invalid_output
    li $t7, 111
    beq $t6, $t7, invalid_output
    li $t7, 112
    beq $t6, $t7, invalid_output
    li $t7, 113
    beq $t6, $t7, invalid_output
    li $t7, 114
    beq $t6, $t7, invalid_output
    li $t7, 115
    beq $t6, $t7, invalid_output
    li $t7, 116
    beq $t6, $t7, invalid_output
    li $t7, 117
    beq $t6, $t7, invalid_output
    li $t7, 118
    beq $t6, $t7, invalid_output
    li $t7, 119
    beq $t6, $t7, invalid_output
    li $t7, 120
    beq $t6, $t7, invalid_output
    li $t7, 121
    beq $t6, $t7, invalid_output
    li $t7, 122
    beq $t6, $t7, invalid_output 
    li $t7, 123
    beq $t6, $t7, invalid_output
    li $t7, 124
    beq $t6, $t7, invalid_output
    li $t7, 125
    beq $t6, $t7, invalid_output
    li $t7, 126
    beq $t6, $t7, invalid_output
    li $t7, 127
    beq $t6, $t7, invalid_output
	j conti
calculate:
li $s1, 1
    # L?y ð?a ch? c?a chu?i ð?u vào
    la $t0, buffer
    li $t1, 0    # Bi?n ð?m cho v?ng l?p
    li $t2, 0    # Bi?n lýu tr? k?t qu?
li $t3, 0    # Bi?n lýu tr? toán h?ng hi?n t?i
    li $t4, 0    # Bi?n lýu tr? toán t? hi?n t?i
    li $t5, 0    # Bi?n lýu tr? toán h?ng trý?c ðó
loop:
    lb $t6, 0($t0)      # Ð?c k? t? ð?u tiên c?a chu?i
    #ki-tu-tao-lao
    j ki_tu_tao_lao
    conti:
    
    #chu_M
    li $t7, 77
    beq $t6, $t7, ans
    li $t7, '\n'
    beq $t6, $t7, end_calculation  # N?u g?p k? t? k?t thúc chu?i th? k?t thúc v?ng l?p

    #kiem tra !
    li $t7, 33
    beq $t6, $t7, fac_check
    #kiem tra ^
    li $t7, 94
    beq $t6, $t7, check_operator
    # Ki?m tra n?u k? t? là toán t? (+, -, *, /)
    li $t7, 43      # +
    beq $t6, $t7, check_operator
    li $t7, 45      # -
    beq $t6, $t7, check_operator
    li $t7, 42      # *
    beq $t6, $t7, check_operator
    li $t7, 47      # /
    beq $t6, $t7, check_operator

    # N?u k? t? không ph?i là toán t?, th?c hi?n x? l? toán h?ng
    # Chuy?n k? t? s? thành s? nguyên và c?p nh?t giá tr? c?a toán h?ng hi?n t?i
    sub $t6, $t6, 48   # Chuy?n k? t? s? sang s? nguyên
    mul $t3, $t3, 10   # D?ch trái toán h?ng hi?n t?i lên m?t ch? s?
    add $t3, $t3, $t6  # C?ng k? t? s? vào toán h?ng hi?n t?i
    addi $t0, $t0, 1
    beq $t4, 94, power
    bne $t4, 0, se_check
    j loop
    ans:
    move $t3, $s4
    addi $t0, $t0, 1
    j loop
fac_check:
factorial:
    li $t6, 1
    li $t7, 1
    addi $t0, $t0, 1
    j factorial1
factorial1:
    mul $t7, $t7, $t6 
    beq $t6, $t3, fac
    add $t6, $t6, 1
    j factorial1
    fac:
    	move $t3, $t7
    	bne $t5, 0, end_loop
    	add $t1, $t1, $t7
    	j loop
se_check:
	lb $t6, 0($t0)      # Ð?c k? t? ð?u tiên c?a chu?i
	li $t7, '\n'
    beq $t6, $t7, end_loop  # N?u g?p k? t? k?t thúc chu?i th? k?t thúc v?ng l?p
    #kiem tra !
    li $t7, 33
    beq $t6, $t7, fac_check
	# Ki?m tra n?u k? t? là toán t? (+, -, *, /)
    li $t7, 43      # +
    beq $t6, $t7, end_loop
    li $t7, 45      # -
    beq $t6, $t7, end_loop
    li $t7, 42      # *
    beq $t6, $t7, end_loop
    li $t7, 47      # /
    beq $t6, $t7, end_loop
    j loop
power:
    li $t7, 1
    move $t6, $s1
    li $t6, 1
    j pow
    pow:
       bne $t1, 0, pow2
       mul $t6, $t6 , $t5
       beq $t7, $t3, pow1
       add $t7, $t7, 1
       j pow
       pow1:
       move $s1, $t6
       move $t1, $t6
       	j loop
       	pow2:
       	mul $t6, $t6 , $s1
       beq $t7, $t3, pow1
       add $t7, $t7, 1
       j pow2

check_operator:
    # N?u k? t? là toán t?, lýu tr? toán t? và toán h?ng trý?c ðó
    move $t5, $t3    # Lýu tr? toán h?ng trý?c ðó
    li $t3, 0        # Ð?t l?i giá tr? c?a toán h?ng hi?n t?i

    # Lýu tr? toán t?
    move $t4, $t6
    addi $t0, $t0, 1
    j loop

end_loop: 
    # Th?c hi?n phép toán cu?i cùng d?a trên toán t? ð? lýu tr?
    li $t6, 43      # Th?c hi?n phép c?ng
    beq $t4, $t6, add_operation
    li $t6, 45      # Th?c hi?n phép tr?
    beq $t4, $t6, subtract_operation
    li $t6, 42      # Th?c hi?n phép nhân
    beq $t4, $t6, multiply_operation
    li $t6, 47      # Th?c hi?n phép chia
    beq $t4, $t6, divide_operation
add_operation:
    bne $t2, 0, add_ope1
    add $t2, $t5, $t3
    move $t1, $t2
    j loop
add_ope1:
    move $t5, $t2
    add $t2, $t5, $t3
    move $t1, $t2
    j loop
subtract_operation:
    bne $t2, 0, sub_ope1
    sub $t2, $t5, $t3
    move $t1, $t2
    j loop
sub_ope1:
    move $t5, $t2
    sub $t2, $t5, $t3
    move $t1, $t2
    j loop
multiply_operation:
    bne $t2, 0, mul_ope1
    mul $t2, $t5, $t3
    move $t1, $t2
    j loop
mul_ope1:
    move $t5, $t2
    mul $t2, $t5, $t3
    move $t1, $t2
    j loop
divide_operation:
    l.s $f3, zero
    c.lt.s $f3, $f2
    bc1t div_ope1
    mtc1 $t5, $f5
    mtc1 $t3, $f3
    div.s $f2, $f5, $f3
    mov.s $f1, $f2
    j loop
div_ope1:
    mtc1 $t3, $f3
    div.s $f2, $f2, $f3
    mov.s $f1, $f2
    j loop
end_calculation:
    jr $ra


sothapphan:
	 # In prompt và nh?n chu?i ð?u vào t? ngý?i dùng
    li $v0, 4
    la $a0, ip1
    syscall
    
    li $v0, 6
    syscall
    
    mov.s $f1, $f0
    
    # Tính toán k?t qu? t? chu?i ð?u vào và hi?n th?
    li $v0, 4
    la $a0, ip2
    syscall
    
    li $v0, 6
    syscall
    
    mov.s $f2, $f0
    
    li $v0, 4
    la $a0, ope_choice
    syscall
    
    li $v0, 8
    la $a0, buffer
    li $a1, 2
    syscall
    
    li $v0, 4
    la $a0, nl
    syscall
    
    la $s0, buffer
    lb $s1, 0($s0)
    #ki-tu-tao-lao
    #j ki_tu_tao_lao
    fl_conti:
    li $t7, 43      # +
    beq $s1, $t7, float_add
    li $t7, 45      # -
    beq $s1, $t7, float_sub
    li $t7, 42      # *
    beq $s1, $t7, float_mul
    li $t7, 47      # /
    beq $s1, $t7, float_div
    li $t7, 94      # ^
    beq $s1, $t7, float_pow
    bne $s1, $t7, invalid_output
    float_add:
    	add.s $f1, $f1, $f2
    	j float_end
    float_sub:
    	sub.s $f1, $f1, $f2
    	j float_end
    float_mul:
    	mul.s $f1, $f1, $f2
    	j float_end
    float_div:
    	div.s $f1, $f1, $f2
    	j float_end
    float_pow:
    	lwc1 $f31, one
    	lwc1 $f30, one
    	lwc1 $f29, one
    	fl_pow:
    		mul.s $f30, $f30, $f1
    		c.eq.s $f31, $f2
    		bc1t float_end1
    		add.s $f31, $f31, $f29
    		j fl_pow
    		float_end1:
    		mov.s $f1, $f30
    		j float_end
    	float_end:
    	mov.s $f12, $f1
    	li $v0, 2
    	syscall
    	
    	lwc1 $f1, zero
    li $v0, 4
    la $a0, nl
    syscall

    li $v0, 4
    la $a0, ask
    syscall
    
        
    li $v0, 8
    la $a0, buffer
    li $a1, 2
    syscall
    
    li $v0, 4
    la $a0, nl
    syscall
    
    la $t0, buffer
    lb $t6, 0($t0)      # Ð?c k? t? ð?u tiên c?a chu?i
    li $t7, 89
    beq $t6, $t7, main
    li $t7, 78
    beq $t6, $t7, end
