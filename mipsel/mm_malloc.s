	.text

_mm_malloc:
	li $2, 1
	beq $5, $2, .jmpMalloc
	xori $3, $5, 2

	addiu $sp, -0x28
	li $2, 4
	move $6, $4
	movz $5, $2, $3
	sw $31,	36($sp)
	jal posix_memalign
	addiu $4, $sp, 0x18

	lw $3, 24($sp)
	lw $31, 36($sp)
	addiu $sp, 0x28
	movn $3, $0, $2
	j $31
	move $2, $3

.jmpMalloc:
	j malloc
	nop





_mm_free:
	j free
	nop
