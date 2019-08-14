	.text

__rold:
	mov r2, #0x1F
	and r1, r2

	mov r2, #0
	sub r2, r1
	lsl r1, r0, r1
	lsr r0, r2
	orr r0, r1
	rts





__rord:
	mov r2, #0x1F
	and r1, r2

	mov r2, #0
	sub r2, r1
	lsr r1, r0, r1
	lsl r0, r2
	orr r0, r1
	rts





__rolq:
	mov r19, #0x3F
	mov r17, %low(#-1)
	and r2, r19

	movt r17, %high(#-1)
	lsr r3, r0, #1
	eor r18, r2, r17
	lsr r18, r3, r18
	lsl ip, r1, r2
	lsl r16, r0, r2

	mov r3, #0x20
	orr ip, r18, ip
	and r20, r2, r3

	mov r18, #0
	movne ip, r16
	movne r16, r18
	sub r2, r18, r2

	and r2, r19
	eor r17, r2, r17
	lsl r19, r1, #1
	lsl r17, r19, r17
	lsr r0, r2

	lsr r1, r2
	orr r0, r17, r0
	and r2, r3
	movne r0, r1
	movne r1, r18

	orr r1, ip
	orr r0, r16
	rts





__rorq:
	mov r19, #0x3F
	mov r17, %low(#-1)
	and r2, r19

	movt r17, %high(#-1)
	lsl r3, r0, #1
	eor r18, r2, r17
	lsl r18, r3, r18
	lsr ip, r1, r2
	lsr r16, r0, r2

	mov r3, #0x20
	orr ip, r18, ip
	and r20, r2, r3

	mov r18, #0
	movne ip, r16
	movne r16, r18
	sub r2, r18, r2

	and r2, r19
	eor r17, r2, r17
	lsr r19, r1, #1
	lsr r17, r19, r17
	lsl r1? r2
	lsl r0, r2

	orr r1, r17, r1
	and r2, r3
	movne r1, r0
	movne r0, r18

	orr r0, ip
	orr r1, r16
	rts
