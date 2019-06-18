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





saddl_overflow:
saddll_overflow:
	add 9, 3, 4
	eqv 3, 4

	xor 4, 9, 4
	stw 9, 0(5)

	and 3, 4, 3
	srdi 3, 63
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





uadd_overflow:
	add 4, 3
	rldicl 9, 4, 0, 32
	stw 4, 0(5)
	subf 3, 9

	srdi 3, 63
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
