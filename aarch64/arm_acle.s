.include "standard.inc"

	.text

START_FUNC __ror
	ror w0, w1
	ret
END_FUNC __ror





START_FUNC __rorll
	ror x0, x1
	ret
END_FUNC __rorll





START_FUNC __rev16
	rev w0
	ror w0, 0x10
	ret
END_FUNC __rev16





START_FUNC __rev16ll
	rev w1, w0
	lsr x0, 0x20

	rev w0
	ror w1, 0x10
	ror w0, 0x10

	orr x0, x1, x0, lsl 0x20
	ret
END_FUNC __rev16ll
