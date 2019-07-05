	.text

cimagf:
	mv a0, a1
	ret





cimagl:
	lw a2, 28(a1)
	sw a2, 12(a0)

	lw a2, 24(a1)
	sw a2, 8(a0)

	lw a2, 20(a1)
	sw a2, 4(a0)

	lw a1, 16(a1)
	sw a1, 0(a0)

	ret





cimag:
	addi sp, -0x10
	fld ft0, 8(a0)
	fsd ft0, 8(sp)

	lw a0, 8(sp)
	lw a1, 12(sp)

	addi sp, 0x10
	ret





conjf:
	lui a2, 0x80000
	xor a1, a2
	ret





conjl:
	lw a6, 28(a1)
	lw a7, 4(a1)
	lw t0, 0(a1)
	lw a5, 12(a1)
	lw a2, 8(a1)
	lw a3, 20(a1)
	lw a4, 16(a1)
	lw a1, 24(a1)

	sw a1, 24(a0)
	sw a4, 16(a0)
	sw a3, 20(a0)
	sw a2, 8(a0)
	sw a5, 12(a0)
	sw t0, 0(a0)
	sw a7, 4(a0)

	lui a1, 0x80000
	xor a1, a6, a1
	sw a1, 28(a0)
	ret





conj:
	fld ft0, 8(a1)
	fld ft1, 0(a1)

	fsd ft1, 0(a0)
	fneg.d ft0
	fsd ft0, 8(a0)
	ret





copysignf:
	fmv.w.x ft0, a1
	fmv.w.x ft1, a0

	fsgnj.s ft0, ft1, ft0
	fmv.x.w a0, ft0
	ret





copysignl:
	lw a3, 8(a1)
	sw a3, 8(a0)

	lw a3, 4(a1)
	sw a3, 4(a0)

	lw a3, 0(a1)
	sw a3, 0(a0)

	lw a2, 12(a2)
	lui a3, 0x80000
	and a2, a3
	addi a3, -1

	lw a1, 12(a1)
	and a1, a3
	or a1, a2
	sw a1, 12(a0)
	ret





copysign:
	addi sp, -0x10
	sw a2, 8(sp)
	sw a3, 12(sp)
	fld ft0, 8(sp)
	sw a0, 8(sp)
	sw a1, 12(sp)
	fld ft1, 8(sp)

	fsgnj.d ft0, ft1, ft0
	fsd ft0, 8(sp)
	lw a0, 8(sp)
	lw a1, 12(sp)
	addi sp, 0x10
	ret





crealf:
	ret





creall:
	lw a2, 12(a1)
	sw a2, 12(a0)

	lw a2, 8(a1)
	sw a1, 8(a0)

	lw a2, 4(a1)
	sw a2, 4(a0)

	lw a1, 0(a1)
	sw a1, 0(a0)
	ret





creal:
	addi sp, -0x10
	fld ft0, 0(a0)
	fsd ft0, 8(sp)

	lw a0, 8(sp)
	lw a1, 12(sp)
	addi sp, 0x10
	ret





fmaf:
	fmv.w.x ft0, a2
	fmv.w.x ft1, a1
	fmv.w.x ft2, a0

	fmadd.s ft0, ft2, ft1, ft0
	fmv.x.w a0, ft0
	ret





fmaxf:
	fmv.w.x ft0, a1
	fmv.w.x ft1, a0
	fmax.s ft0, ft1, ft0
	fmv.w.x a0, ft0
	ret





fmax:
	addi sp, -0x10
	sw a2, 8(sp)
	sw a3, 12(sp)
	fld ft0, 8(sp)
	sw a0, 8(sp)
	sw a1, 12(sp)
	fld ft1, 8(sp)

	fmax.d ft0, ft1, ft0
	fsd ft0, 8(sp)
	lw a0, 8(sp)
	lw a1, 12(sp)
	addi sp, 0x10
	ret





fma:
	addi sp, -0x10
	sw a4, 8(sp)
	sw a5, 12(sp)
	fld ft0, 8(sp)
	sw a2, 8(sp)
	sw a3, 12(sp)
	fld ft1, 8(sp)
	sw a0, 8(sp)
	sw a1, 12(sp)
	fld ft2, 8(sp)

	fmadd.d ft0, ft2, ft1, ft0

	fsd ft0, 8(sp)
	lw a0, 8(sp)
	lw a1, 12(sp)
	addi sp, 0x10
	ret





fminf:
	fmv.w.x ft0, a1
	fmv.w.x ft1, a0

	fmin.s ft0, ft1, ft0
	fmv.x.w a0, ft0
	ret





fmin:
	addi sp, -0x10
	sw a2, 8(sp)
	sw a3, 12(sp)
	fld ft0, 8(sp)
	sw a0, 8(sp)
	sw a1, 12(sp)
	fld ft1, 8(sp)

	fmin.d ft0, ft1, ft0

	fsd ft0, 8(sp)
	lw a0, 8(sp)
	lw a1, 12(sp)
	addi sp, 0x10
	ret





llabs:
	mv a2, a0
	bltz a1, .doNeg

	mv a0, a2
	ret

.doNeg:
	neg a0, a2
	snez a2
	add a1, a2
	neg a1
	ret
