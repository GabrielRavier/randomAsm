.include "standard.inc"

	.text

START_FUNC sadd_overflow
	adds w1, w0, w1
	str w1, [x2]
	cset w0, vs
	ret
END_FUNC sadd_overflow





START_FUNC saddl_overflow
START_FUNC saddll_overflow
	adds x1, x0, x1
	str x1, [x2]
	cset w0, vs
	ret
END_FUNC saddl_overflow
END_FUNC saddll_overflow





START_FUNC uadd_overflow
	adds w1, w0, w1
	str w1, [x2]
	cset w0, cs
	ret
END_FUNC uadd_overflow





START_FUNC uaddl_overflow
START_FUNC uaddll_overflow
	adds x1, x0, x1
	str x1, [x2]
	cset w0, cs
	ret
END_FUNC uaddl_overflow
END_FUNC uaddll_overflow
