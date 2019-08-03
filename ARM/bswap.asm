.include "standard.inc"

	.text

bswap16:
	lsr r3, r0, #8
	orr r0, r3, r0, lsl #8

	clrUpper16 r0
	bx lr





bswap32:
	eor r3, r0, ror #16
	lsr r3, #8
	bic r3, #0xFF00

	eor r0, r3, r0, ror #8
	bx lr





bswap64:
	mov r2, r1
	eor r1, r0, r0, ror #16
	eor r3, r2, r2, ror #16

	.irp reg, r1, r3
	lsr \reg, #8
	.endr

	.irp reg, r1, r3
	bic \reg, #0xFF00
	.endr

	eor r1, r0, ror #8
	eor r0, r3, r2, ror #8
	bx lr
