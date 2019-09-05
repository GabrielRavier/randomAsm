.include "standard.inc"

	.text

START_FUNC sadd_overflow
	add w3, w0, w1
	eon w0, w1
	eor w1, w3, w1
	str w3, [x2]
	and w0, w1, w0

	lsr w0, 0x1F
	ret
END_FUNC sadd_overflow





START_FUNC saddl_overflow
START_FUNC saddll_overflow
	add x3, x0, x1
	eon x0, x1
	eor x1, x3, x1
	str x3, [x2]
	and x0, x1, x0

	lsr x0, 0x3F
	ret
END_FUNC saddl_overflow
END_FUNC saddll_overflow





START_FUNC uadd_overflow
	add w1, w0, w1
	str w1, [x2]

	cmp w1, w0
	cset w0, cc
	ret
END_FUNC uadd_overflow





START_FUNC uaddl_overflow
START_FUNC uaddll_overflow
	add x1, x0, x1
	str x1, [x2]

	cmp x1, x0
	cset w0, cc
	ret
END_FUNC uaddl_overflow
END_FUNC uaddll_overflow
