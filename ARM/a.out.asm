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
	orr r2, r1, r2, asl #16
	orr r3, r2, r3, asl #24
	str r3, [r0]
	bx lr





N_BADMAG:
	ldrh r3, [r0]
	ldr r0, .dat

	cmp r3, r0
	cmpne r3, #204
	movne r0, #1
	moveq r0, #0

	sub r3, #260
	sub r3, #3

	cmp r3, #1
	movls r0, #0
	andhi r0, #1
	bx lr

.dat:
	dw 0x10B
