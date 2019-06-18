sadd_overflow:
	add 9, 3, 4
	eqv 3, 4

	xor 4, 9, 4
	stw 9, 0(5)

	and 3, 4, 3
	rlwinm 3, 1, 31, 31
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
