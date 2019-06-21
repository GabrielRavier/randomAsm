clear_cache:
	daddiu $sp, -0x10
	sd $28, 0($sp)
	lui $28, %hi(%neg(%gp_rel(clear_cache)))
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(clear_cache)))

	ld $25, %call16(syscall)($28)
	dsubu $6, $5, $4

	li $7, 3
	move $5, $4
	sd $31, 8($sp)

	jalr $25
	li $4, 0x144D

	ld $31, 8($sp)
	ld $28, 0($sp)
	j $31
	daddiu $sp, 0x10
