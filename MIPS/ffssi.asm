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
