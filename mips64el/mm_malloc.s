	.text

_mm_malloc:
	daddiu $sp, -0x20
	sd $28, 16($sp)
	lui $28, %hi(%neg(%gp_rel(_mm_malloc)))
	daddu $28, $25

	li $2, 1
	sd $31, 24($sp)
	beq $5, $2, .jmpMalloc
	daddiu $28, %lo(%neg(%gp_rel(_mm_malloc)))

	daddiu $2, $5, -2
	ld $25, %call16(posix_memalign)($28)
	li $3, -3
	and $2, $3
	li $3, 8
	move $6, $4
	movz $5, $3, $2

	jalr $25
	move $4, $sp

	ld $3, 0($sp)
	movn $3, $0, $2
	move $2, $3
	ld $31, 24($sp)

.return
	ld $28, 16($sp)
	j $31
	daddiu $sp, 0x20

.jmpMalloc:
	ld $25, %call16(malloc)($28)
	jalr $25
	nop

	b .return
	ld $31, 24($sp)





_mm_free:
	daddiu $sp, -0x10
	sd $28, 0($sp)
	lui $28, %hi(%neg(%gp_rel(_mm_free)))
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(_mm_free)))

	ld $25, %call16(free)($28)
	sd $31, 8($sp)
	jalr $25
	nop

	ld $31, 8($sp)
	ld $28, 0($sp)
	j $31
	daddiu $sp, 0x10
