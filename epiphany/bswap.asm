	.text

bswap16:
	movt r0, 0
	lsl r1, r0, #8
	lsr r0, #8
	orr r0, r1, r0
	movt r0, 0
	rts





bswap32:
__bswapsi2:
	mov r1, %low(#0xFF0000)
	lsl r3, r0, #24
	lsr r2, r0, #24

	movt r1, %high(#0xFF0000)
	and r1, r0, r1
	orr r2, r3

	mov r3, #0xFF00
	lsr r1, #8
	and r0, r3
	orr r1, r2, r1
	lsl r0, #8
	orr r0, r1, r0
	rts





bswap64:
__bswapdi2:
	mov r3, %low(#0xFF0000)
	movt r3, %high(#0xFF0000)
	and r17, r3, r1

	mov r2, #0xFF00
	and r16, r2, r1
	lsr r18, r1, #0x18

	lsl ip, r0, #0x18
	lsr r19, r0, #0x18
	and r3, r0
	lsr r17, #8
	and r2, r0
	orr r17, r18, r17

	lsl r16, #8
	orr ip, r19
	lsr r3, #8

	lsl r0, r1, #0x18
	orr r16, r17, r16
	orr r3, ip, r3

	lsl r1, r2, #8
	orr r0, r16
	orr r1, r3, r1
	rts
