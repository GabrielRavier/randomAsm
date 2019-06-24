bswap16:
	rlwinm 10, 3, 8, 16, 23
	rlwinm 9, 3, 24, 24, 31
	or 9, 10
	rlwinm 3, 9, 0, 0xFFFF
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





bswap32:
	rotlwi 9, 3, 24
	rlwimi 9, 3, 8, 8, 15
	rlwimi 9, 3, 8, 24, 31
	rldicl 3, 9, 0, 32
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





bswap64:
	srdi 10, 3, 32
	mr 9, 3
	rotlwi 3, 24
	rotlwi 8, 10, 24
	rlwimi 3, 9, 8, 8, 15
	rlwimi 8, 10, 8, 8, 15
	rlwimi 3, 9, 8, 24, 31
	rlwimi 8, 10, 8, 24, 31
	sldi 3, 32
	or 3, 8
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
