__paritydi2:
	daddiu $sp, -0x10
	sd $28, 0($sp)
	lui $28, %hi(%neg(%gp_rel(__paritydi2)
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(__paritydi2)

	dsra $2, $4, 32
	ld $25, %call16(__paritysi2)($28)
	sll $4, 0

	sd $31, 8($sp)
	jalr $25
	xor $4, $2, $4

	ld $31, 8($sp)
	ld $28, 0($sp)
	j $31
	daddiu $sp, 0x10





__paritysi2:
	srl $2, $4, 16
	xor $4, $2, $4

	srl $2, $4, 8
	xor $4, $2, $4

	srl $2, $4, 4
	xor $4, $2, $4
	andi $4, 0xF

	li $2, 0x6996
	sra $2, $4

	j $31
	andi $2, 1
