	.text

fabsl:
fabs:
	mov ip, %low(#0x7FFFFFFF)
	movt ip, %high(#0x7FFFFFFF)
	and r1, ip, r1
	rts





fabsf:
	lsl r0, #1
	lsr r0, #1
	rts
