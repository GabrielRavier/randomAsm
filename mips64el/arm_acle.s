.include "standard.inc"

	.text

START_FUNC __ror
	andi $5, 0x1F
	subu $2, $0, $5
	sll $2, $4, $2
	srl $5, $4, $5
	j $31
	or $2, $5
END_FUNC __ror





START_FUNC __rorll
	andi $5, 0x3F
	subu $2, $0, $5
	dsll $2, $4, $2
	dsrl $5, $4, $5
	j $31
	or $2, $5
END_FUNC __rorll





START_FUNC __rev16
	daddiu $sp, -0x10
	sd $28, 0($sp)

	lui $28, %hi(%neg(%gp_rel(__rev16)))
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(__rev16)))

	ld $25, %call16(__bswapsi2)($28)
	sd $31, 8($sp)

	jalr $25
	nop

	ld $31, 8($sp)
	sll $3, $2, 0x10
	srl $2, 0x10
	ld $28,	($sp)
	or $2, $3

	j $31
	daddiu $sp, 0x10
END_FUNC __rev16





START_FUNC __rev16ll
	daddiu $sp, -0x20
	sd $28, 0x10($sp)

	lui $28, %hi(%neg(%gp_rel(__rev16ll)))
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(__rev16ll)))

	ld $25, %call16(__bswapsi2)($28)
	sd $31, 0x18($sp)
	sd $16, 8($sp)
	move $16, $4

	jalr $25
	dsra $4, 0x20

	ld $25, %call16(__bswapsi2)($28)
	sll $4, $16, 0

	jalr $25
	move $16, $2

	sll $3, $2, 0x10
	srl $2, 0x10
	sll $5, $16, 0x10
	srl $4, $16, 0x10

	or $2, $3, $2
	ld $31, 0x18($sp)
	or $4, $5, $4

	dsll $2, 0x20
	dsll $3, $4, 0x20
	dsrl $2, 0x20

	ld $28, 0x16($sp)
	ld $16, 8($sp)
	or $2, $3, $2

	j $31
	daddiu $sp, 0x20
END_FUNC __rev16ll
