bswap16:
	eor r25, r24
	eor r24, r25
	eor r25, r24
	ret





bswap32:
__bswapsi2:
	eor r22, r25
	eor r25, r22
	eor r22, r25

	eor r23, r24
	eor r24, r23
	eor r23, r24
	ret





bswap64:
__bswapdi2:
	eor r18, r25
	eor r25, r18
	eor r18, r25

	eor r19, r24
	eor r24, r19
	eor r19, r24

	eor r20, r23
	eor r23, r20
	eor r20, r23

	eor r21, r22
	eor r22, r21
	eor r21, r22
	ret
