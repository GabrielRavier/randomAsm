	.text

currentAddress:
	push r29

	inSP r30
	subi16 r30, 0xFDFD

	ld16 r24, Z, 0

	bswap16 r24, r25

	pop r29
	ret
