.include "standard.inc"

	.text

START_FUNC __ror
	mov r2, #0x1F
	and r1, r2
	
	mov r2, #0
	sub r2, r1
	lsr r1, r0, r1
	lsl r0, r2

	orr r0, r1
	rts
END_FUNC __ror





START_FUNC __rorll
	mov r19, #0x3F
	mov r17, %low(#-1)
	and r2, r19
	movt r17, %high(#-1)

	lsl r3, r1, #1
	eor r18, r2, r17
	lsl r18, r3, r18
	lsr ip, r0, r2
	lsr r16, r1, r2

	mov r3, #0x20
	orr ip, r18, ip
	and r20, r2, r3

	mov r18, #0
	movne ip, r16
	movne r16, r18
	sub r2, r18, r2

	and r2, r19
	eor r17, r2, r17
	lsr r19, r0, #1
	lsr r17, r19, r17
	lsl r1, r2
	lsl r0, r2

	orr r1, r17, r1
	and r2, r3
	movne r1, r0
	movne r0, r18

	orr r0, ip
	orr r1, r16
	rts
END_FUNC __rorll





START_FUNC __rev16
	mov r1, %low(__bswapsi2)
	strd lr, [sp], #-1
	movt r1, %high(__bswapsi2)
	jalr r1

	lsl r1, r0, #0x10
	lsr r0, #0x10

	orr r0, r1
	ldrd lr, [sp, #1]
	add sp, #8
	rts
END_FUNC __rev16





START_FUNC __rev16ll
	strd r4, [sp], #-3
	mov r5, %low(__bswapsi2)
	strd lr, [sp, #1]
	str r6, [sp, #5]
	movt r5, %high(__bswapsi2)

	mov r6, r0
	mov r0, r1
	jalr r5

	mov r4, r0
	mov r0, r6
	jalr r5

	lsl r1, r4, #0x10
	lsr r2, r0, #0x10
	lsl r4, #0x10
	lsr r0, #0x10

	orr r1, r4
	orr r0, r2, r0
	ldrd r4, [sp, #3]
	ldr r6, [sp, #5]
	ldrd lr, [sp, #1]
	add sp, #0x18
	rts
END_FUNC __rev16ll
