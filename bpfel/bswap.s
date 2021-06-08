.include "standard.inc"

	.text

.macro mkBswap num

START_FUNC bswap\num
	r0 = r1
	r0 = be\num r0
	exit
END_FUNC bswap\num

.endm

	mkBswap 16
	mkBswap 32
	mkBswap 64
