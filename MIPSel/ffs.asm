	.text

__ffsdi2:
	addiu $sp, -0x20
	bne $4, $0, .ne
	sw $31, 28($sp)

	bne $5, $0, .ne2
	move $2, $5

	lw $31, 28($sp)
	nop

	j $31
	addiu $sp, 0x20

.ne:
	jal __ctzsi2
	nop

	lw $31, 28(s$p)
	addiu $2, 1

	j $31
	addiu $sp, 0x20

.ne2:
	jal __ctzsi2
	move $4, $5

	lw $31, 28($sp)
	addiu $2, 33

	j $31
	addiu $sp, 0x20





__ffssi2:
	beq $4, $0, .ret0
	nop

	addiu $sp, -0x20
	sw $31, 28($sp)

	jal __ctzsi2
	nop

	lw $31, 28($sp)
	addiu $2, 1

	j $31
	addiu $sp, 0x20

.ret0:
	j $31
	move $2, $0
