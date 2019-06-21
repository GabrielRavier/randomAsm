fabsf:
	lui a1, 0x80000
	addi a1, -1
	and a0, a1
	ret





sqrtf:
	fmv.w.x ft0, a0
	fsqrt.s ft0
	fmv.x.w a0, ft0
	ret
