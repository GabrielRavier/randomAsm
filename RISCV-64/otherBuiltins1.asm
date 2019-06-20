bcmp:
	tail memcmp





bzero:
	mv a2, a1
	li a1, 0
	tail memset





isascii:
	andi a0, -0x80
	seqz a0
	ret





signbit:
	fmv.x.d a0, fa0
	slti a0, 0
	ret





signbitf:
	fmv.x.s a0, fa0
	srliw a0, 31
	ret





signbitl:
	slti a0, a1, 0
	ret





toascii:
	andi a0, 0x7F
	ret
