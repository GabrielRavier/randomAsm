	.text

__rold:
	rlwinm 4, 0, 27, 0x1F
	rotlw 3, 4
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





__rord:
	rlwinm 4, 0, 27, 0x1F
	subfic 4, 0x20
	rotlw 3, 4
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





__rolq:
	rlwinm 4, 0, 26, 0x1F
	rotlw 3, 4
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





__rorq:
	rlwinm 4, 0, 26, 0x1F
	subfic 4, 0x40
	rotld 3, 4
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
