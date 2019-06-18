sadd_overflow:
	add a1, a0, a1
	sext.w a5, a1
	sub a5, a1, a5
	sw a1, 0(a2)

	snez a0, a5
	ret





saddl_overflow:
saddll_overflow:
	add a5, a0, a1
	xor a0, a1
	not a0
	xor a1, a5, a1
	and a0, a1, a0
	sd a5, 0(a2)

	slti a0, 0
	ret
