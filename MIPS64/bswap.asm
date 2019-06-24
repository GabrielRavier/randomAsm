bswap16:
	sll $4, 0
	wsbh $2, $4
	j $31
	andi $2, 0xFFFF




bswap32:
	wsbh $2, $4
	j $31
	ror $2, 16





bswap64:
	dsbh $2, $4
	j $31
	dshd $2
