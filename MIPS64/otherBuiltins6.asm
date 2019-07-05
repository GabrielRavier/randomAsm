	.text

clz:
	j $31
	clz $2, $4





ctz:
	subu $2, $0, $4
	and $4, $2, $4
	clz $4

	li $2, 31
	j $31
	subu $2, $4





clrsb:
clrsbl:
clrsbll:
	daddiu $sp, -0x10
	sd $28, 0($sp)
	lui $28, %hi(%neg(%gp_rel(clrsb)
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(clrsb)
	ld $25, %call16(__clrsbdi2)($28)
	sd $31, 8($sp)

	jalr $25
	nop

	ld $31, 8($sp)
	ld $28, 0($sp)
	addiu $2, -0x20
	j $31
	daddiu $sp, 0x10





popcount:
	daddiu $sp, -0x10
	sd $28, 0($sp)
	lui $28, %hi(%neg(%gp_rel(popcount)
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(popcount)
	ld $25, %call16(__popcountdi2)($28)
	sd $31, 8($sp)

	jalr $25
	dext $4, 0, 32

	ld $31, 8($sp)
	ld $28, 0($sp)
	j $31
	daddiu $sp, 0x10





parity:
	daddiu $sp, -0x10
	sd $28, 0($sp)
	lui $28, %hi(%neg(%gp_rel(parity)
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(parity)
	ld $25, %call16(__paritydi2)($28)
	sd $31, 8($sp)

	jalr $25
	dext $4, 0, 32

	ld $31, 8($sp)
	ld $28, 0($sp)
	j $31
	daddiu $sp, 0x10





clzl:
clzll:
	j $31
	dclz $2, $4





ctzl:
ctzll:
	dsubu $2, $0, $4
	and $4, $2, $4
	dclz $4

	li $2, 0x3F
	j $31
	subu $2, $4





popcountl:
popcountll:
	daddiu $sp, -0x10
	sd $28, 0($sp)
	lui $28, %hi(%neg(%gp_rel(popcountl)
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(popcountl)
	ld $25, %call16(__popcountdi2)($28)
	sd $31, 8($sp)

	jalr $25
	nop

	ld $31, 8($sp)
	ld $28, 0($sp)
	j $31
	daddiu $sp, 0x10





parityl:
parityll:
	daddiu $sp, -0x10
	sd $28, 0($sp)
	lui $28, %hi(%neg(%gp_rel(parityl)
	daddu $28, $25
	daddiu $28, %lo(%neg(%gp_rel(parityl)
	ld $25, %call16(__paritydi2)($28)
	sd $31, 8($sp)

	jalr $25
	nop

	ld $31, 8($sp)
	ld $28, 0($sp)
	j $31
	daddiu $sp, 0x10
