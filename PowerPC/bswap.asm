bswap16:
	rlwinm 10, 3, 8, 16, 23
	rlwinm 9, 3, 8, 24, 31
	or 9, 10
	rlwinm 3, 9, 0, 0xFFFF
	blr





bswap32:
	rlwinm 9, 3, 8, 0xFFFFFFFF
	rlwimi 9, 3, 24, 0, 7
	rlwimi 9, 3, 24, 16, 23
	mr 3, 9
	blr





bswap64:
	rlwinm 9, 4, 8, 0xFFFFFFFF
	rlwinm 10, 3, 8, 0xFFFFFFFF
	rlwimi 9, 4, 24, 0, 7
	rlwimi 10, 3, 24, 0, 7
	rlwimi 9, 4, 24, 16, 23
	rlwimi 10, 3, 24, 16, 23
	mr 4, 10
	mr 3, 9
	blr
