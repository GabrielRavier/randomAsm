	.text

abs:
labs:
	srawi 9, 3, 0x1F
	xor 3, 9, 3

	subf 3, 9, 3
	blr





isdigit:
	addi 3, -0x30

	subfic 3, 9
	li 3, 0
	adde 3
	blr
