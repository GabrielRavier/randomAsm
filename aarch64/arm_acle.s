.include "standard.inc"

	.text

START_FUNC __ror
	ror w0, w0, w1
	ret
END_FUNC __ror





START_FUNC __rorll
	ror x0, x0, x1
	ret
END_FUNC __rorll





START_FUNC __rev16
	rev16 w0, w0
	ret
END_FUNC __rev16





START_FUNC __rev16ll
	lsr x0, x0, 32
	rev16 w8, w8
	rev16 w0, w0
	bfi x0, x8, 32, 32
	ret
END_FUNC __rev16ll
