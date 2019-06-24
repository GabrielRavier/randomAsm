powi:
__powidf2:
	addi sp, -0x10
	sw a0, 8(sp)
	sw a1, 12(sp)
	fld ft1, 8(sp)

	andi a0, a2, 1
	seqz a0
	bnez a0, .skip
	fmv.d ft0, ft1

	addi a0, a2, 1
	li a1, 3
	bgeu a0, a1, .skip2
	j .finish

.skip:
	lui a0, %hi(.one)
	addi a0, %lo(.one)
	fld ft0, 0(a0)

	addi a0, a2, 1
	li a1, 3
	bltu a0, a1, .finish

.skip2:
	li a0, 2
	mv a1, a2
	b .startLoop

.loop:
	addi a3, a1, 1
	bgeu a0, a3, .finish

.startLoop:
	srli a3, a1, 31
	add a1, a3
	srai a1, 1

	andi a3, a1, 1
	seqz a3

	fmul.d ft1
	bnez a3, .loop

	fmul.d ft0, ft1
	j .loop

.finish:
	slti a0, a2, 0
	beqz a0, .return

	lui a0, %hi(.one)
	addi a0, %lo(.one)
	fld ft1, 0(a0)
	fdiv.d ft0, ft1, ft0

.return:
	fsd ft0, 8(sp)
	lw a0, 8(sp)
	lw a1, 12(sp)
	addi sp, 0x10
	ret

.dat:
	.quad 0x3FF0000000000000





powif:
__powisf2:
	fmv.w.x ft1, a0

	andi a0, a1, 1
	seqz a0
	bnez a0, .skip
	fmv.s ft0, ft1

	addi a0, a1, 1
	li a2, 3
	bgeu a0, a2, .skip2
	j .finish

.skip:
	lui a0, %hi(.one)
	addi a0, %lo(.one)
	flw ft0, 0(a0)

	addi a0, a1, 1
	li a2, 3
	bltu a0, a2, .finish

.skip2:
	li a0, 2
	mv a2, a1
	j .startLoop

.loop:
	addi a3, a2, 1
	bgeu a0, a3, .finish

.startLoop:
	srli a3, a2, 31
	add a2, a3
	srai a2, 1

	andi a3, a2, 1
	seqz a3

	fmul.s ft1
	bnez a3, .loop

	fmul.s ft0, ft1
	j .loop

.finish:
	slti a0, a1, 0
	beqz a0, .return

	lui a0, %hi(.one)
	addi a0, %lo(.one)
	flw ft1, 0(a0)
	fdiv.s ft0, ft1, ft0

.return:
	fmv.x.w a0, ft0
	ret

.one:
	.word 0x3F800000
