	.text

square:
	mullw 3
	extsw 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
