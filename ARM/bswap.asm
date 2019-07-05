#include "common.inc"

	.text
	defFunc bswap16
	defFunc bswap32
	defFunc bswap64

bswap16:
	lsr r3, r0, #8
	orr r0, r3, r0, lsl #8

	lsl r0, #16
	lsr r0, #16
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
	lsr r1, #8
	lsr r3, #8
	bic r3, #0xFF00
	bic r1, #0xFF00
	eor r1, r0, ror #8
	eor r0, r3, r2, ror #8
	bx lr
