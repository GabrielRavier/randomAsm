	.text

bswap16:
	bswap16 r25, r24
	ret





bswap32:
__bswapsi2:
	bswap32 r22, r23, r24, r25
	ret





bswap64:
__bswapdi2:
	bswap64 r18, r19, r20, r21, r22, r23, r24, r25
	ret
