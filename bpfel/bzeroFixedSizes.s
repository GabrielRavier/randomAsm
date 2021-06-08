.include "standard.inc"

	.text

START_FUNC bzero1
	r2 = 0
	*(u8 *)(r1) = r2
	exit
END_FUNC bzero1





START_FUNC bzero2
	r2 = 0
	*(u8 *)(r1 + 1) = r2
	*(u8 *)(r1) = r2
	exit
END_FUNC bzero2
