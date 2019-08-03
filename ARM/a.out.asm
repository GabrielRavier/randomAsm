	.text

N_MAGIC:
	ldrh r0, [r0]
	bx lr





N_MACHTYPE:
	ldrb r0, [r0, #2]
	bx lr





N_FLAGS:
	ldrb r0, [r0, #3]
	bx lr





N_SET_INFO:
	orr r2, r1, r2, lsl #16
	orr r3, r2, r3, lsl #24
	str r3, [r0]
	bx lr





N_BADMAG:
	ldrh r3, [r0]
	movw r2, #0x10B
	sub r0, r3, #0x104

	cmp r3, r2
	cmpne r3, #0xCC
	sub r0, #3
	movne r3, #1
	moveq r3, #0

	cmp r0, #1
	movls r0, #0
	andhi r0, r3, #1
	bx lr
