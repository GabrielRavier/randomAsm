	.text

__rold:
	rlwinm 4, 0, 27, 0x1F
	neg 9, 4

	rlwinm 9, 0, 27, 0x1F
	srw 9, 3, 9
	slw 3, 4

	or 3, 9, 3
	blr





__rord:
	rlwinm 4, 0, 27, 0x1F
	neg 9, 4

	rlwinm 9, 0, 27, 0x1F
	slw 9, 3, 9
	srw 3, 4

	or 3, 9, 3
	blr





__rolq:
	rlwinm 5, 0, 26, 0x1F
	neg 9, 5

	rlwinm 9, 0, 26, 0x1F
	addic. 10, 9, -0x20
	blt 0, .lt

	addic. 8, 5, -0x20
	srw 10, 3, 10
	li 9, 0
	blt 0, .ret

.ret2:
	slw 3, 4, 8
	li 4, 0

	or 3, 9, 3
	or 4, 10, 4
	blr

.lt:
	subfic 10, 9, 0x1F
	slwi 8, 3, 1
	slw 8, 10
	srw 10, 4, 9

	or 10, 8, 10
	srw 9, 3, 9

	addic. 8, 5, -0x20
	bge 0, .ret2

.ret:
	srwi 7, 4, 1
	subfic 8, 5, 0x1F

	srw 8, 7, 8
	slw 3, 5

	or 3, 8, 3
	slw 4, 5

	or 3, 9, 3
	or 4, 10, 4
	blr





__rorq:
	rlwinm 5, 0, 26, 0x1F
	neg 9, 5

	rlwinm 9, 0, 26, 0x1F
	addic. 10, 9, -0x20
	blt 0, .lt

	addic. 8, 5, -0x20
	slw 10, 4, 10
	li 9, 0
	blt 0, .ret

.ret2:
	slw 4, 3, 8
	li 3, 0

	or 3, 10, 3
	or 4, 9, 4
	blr

.lt:
	subfic 10, 9, 0x1F
	srwi 8, 4, 1
	srw 8, 10
	slw 10, 3, 9

	or 10, 8, 10
	slw 9, 4, 9

	addic. 8, 5, -0x20
	bge 0, .ret2

.ret:
	slwi 7, 3, 1
	subfic 8, 5, 0x1F

	slw 8, 7, 8
	srw 4, 5

	or 4, 8, 4
	srw 3, 5

	or 3, 10, 3
	or 4, 9, 4
	blr
