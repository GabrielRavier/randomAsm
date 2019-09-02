.include "standard.inc"

	.text

bswap16:
	rev16 r0
	uxth r0
	bx lr





bswap32:
	rev r0
	bx lr





bswap64:
	rev r3, r0
	rev r0, r1
	mov r1, r3
	bx lr
