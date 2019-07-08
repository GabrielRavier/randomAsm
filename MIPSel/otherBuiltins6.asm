clz:
clzl:
	addiu $sp, -0x20
	sw $31, 28($sp)

	jal __clzsi2
	nop

	lw $31, 28($sp)
	nop

	j $31
	addiu $sp, 0x20





ctz:
ctzl:
	addiu $sp, -0x20
	sw $31, 28($sp)

	jal __ctzsi2
	nop

	lw $31, 28($sp)
	nop

	j $31
	addiu $sp, 0x20





clrsb:
clrsbl:
	addiu $sp, -0x20
	sw $31, 28($sp)

	jal __clrsbsi2
	nop

	lw $31, 28($sp)
	nop

	j $31
	addiu $sp, 0x20





popcount:
popcountl:
	addiu $sp, -0x20
	sw $31, 28($sp)

	jal __popcountsi2
	nop

	lw $31, 28($sp)
	nop

	j $31
	addiu $sp, 0x20





parity:
parityl:
	addiu $sp, -0x20
	sw $31, 28($sp)

	jal __paritysi2
	nop

	lw $31, 28($sp)
	nop

	j $31
	addiu $sp, 0x20





clzll:
	addiu $sp, -0x20
	sw $31, 28($sp)

	jal __clzdi2
	nop

	lw $31, 28($sp)
	nop

	j $31
	addiu $sp, 0x20





ctzll:
	addiu $sp, -0x20
	sw $31, 28($sp)

	jal __ctzdi2
	nop

	lw $31, 28($sp)
	nop

	j $31
	addiu $sp, 0x20





clrsbll:
	addiu $sp, -0x20
	sw $31, 28($sp)

	jal __clrsbdi2
	nop

	lw $31, 28($sp)
	nop

	j $31
	addiu $sp, 0x20





popcountll:
	addiu $sp, -0x20
	sw $31, 28($sp)

	jal __popcountdi2
	nop

	lw $31, 28($sp)
	nop

	j $31
	addiu $sp, 0x20





parityll:
	addiu $sp, -0x20
	sw $31, 28($sp)

	jal __paritydi2
	nop

	lw $31, 28($sp)
	nop

	j $31
	addiu $sp, 0x20
