	.text

abs:
	srawi 9, 3, 0x1F
	xor 3, 9, 3
	subf 3, 9, 3

	extsw 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





ceil:
	frip 1
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





fabs:
	fabs 1
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





floor:
	frim 1
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





isdigit:
	addi 3, -0x30
	rldicl 3, 0, 0x20
	subifc 3, 9
	srdi 3, 0x3F

	xori 3, 1
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





labs:
	sradi 9, 3, 0x3F
	xor 3, 9, 3

	subf 3, 9, 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0x





sqrt:
	fsqrt 1
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
