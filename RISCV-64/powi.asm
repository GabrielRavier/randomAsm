	.text

powi:
__powidf2:
	lui a2, %hi(.one)
	fmv.d fa5, fa0
	fld fa0, %lo(.one)(a2)
	mv a5, a0

.loop:
	srliw a4, a5, 31
	addw a4, a5
	andi a3, a5, 1
	sraiw a5, a4, 1
	beqz a3, .skipMul

	fmul.d fa0, fa5

.skipMul:
	beqz a5, .finish

	fmul.d fa5
	j .loop

.finish:
	bltz a0, .retRecip
	ret

.retRecip:
	fld fa5, %lo(.one)(a2)
	fdiv.d fa0, fa5, fa0
	ret

.one:
	.word 0, 0x3FF00000





powif:
__powisf2:
	lui a2, %hi(.one)
	fmv.s fa5, fa0
	flw fa0, %lo(.one)(a2)
	mv a5, a0

.loop:
	srliw a4, a5, 31
	addw a4, a5
	andi a3, a5, 1
	sraiw a5, a4, 1
	beqz a3, .skipMul

	fmul.s fa0, fa5

.skipMul:
	beqz a5, .finish

	fmul.s fa5
	j .loop

.finish:
	bltz a0, .retRecip
	ret

.retRecip:
	flw fa5, %lo(.one)(a2)
	fdiv.s fa0, fa5, fa0
	ret

.one:
	.word 0x3F800000
