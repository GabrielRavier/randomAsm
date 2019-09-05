.include "standard.inc"

	.text

START_FUNC sadd_overflow
	toS32 r2
	toS32 r1
	r1 += r2

	r2 = r1
	toS32 r2

	r0 = 1
	if r2 != r1
		goto .LSreturn

	r0 = 0

.LSreturn:
	*(u32 *)(r3) = r1
	exit
END_FUNC sadd_overflow





START_FUNC saddl_overflow
START_FUNC saddll_overflow
	r4 = 1
	r6 = 1
	if r2 s>= 0
		goto .LSLr61

	r6 = 0

.LSLr61:
	r5 = 1
	if r5 s>= 0
		goto .LSLr51

	r5 = 0

.LSLr51:
	r1 += r2

	r0 = 1
	if r5 == r6
		goto .LSLr01

	r0 = 0

.LSLr01:
	r2 = 1

	if r1 s>=0
		goto .LSLr21

	r2 = 0

.LSLr21:
	if r5 != r2
		goto .LSLr41

	r4 = 0

.LSLr41:
	*(u64 *)(r3) = r1
	r0 &= r4
	ret
END_FUNC saddl_overflow
END_FUNC saddll_overflow





START_FUNC uadd_overflow
	to32 r2
	to32 r1
	r1 += r2
	r2 = r1
	to32 r2

	r0 = 1
	if r2 != r1
		goto .LUr01

	r0 = 0

.LUr01:
	*(u32 *)(r3) = r1
	exit
END_FUNC uadd_overflow





START_FUNC uaddl_overflow
START_FUNC uaddll_overflow
	r4 = r1
	r4 += r2

	r0 = 1
	if r4 < r1
		goto .LULr01

	r0 = 0

.LULr01:
	*(u64 *)(r3) = r4
	exit
END_FUNC uaddl_overflow
END_FUNC uaddll_overflow
