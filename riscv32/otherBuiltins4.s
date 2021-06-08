	.text

abs:
labs:
	srai a1, a0, 31
	add a0, a1
	xor a0, a1
	ret





fabs:
	lui a2, 0x80000
	addi a2, -1
	and a1, a2
	ret





sqrt:
	addi sp, -0x10
	sw a0, 8(sp)
	sw a1, 12(sp)
	fld ft0, 8(sp)

	fsqrt.d ft0
	fsd ft0, 8(sp)
	lw a0, 8(sp)
	lw a1, 12(sp)
	addi sp, 0x10
	ret
