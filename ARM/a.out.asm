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
	str r3, [r0, #0]
	bx lr





N_BADMAG:
	ldrh r3, [r0]
	ldr r2, .dat

	sub r0, r3, #260
	sub r0, #3

	cmp r3, r2
	cmpne r0, #1
	movls r0, #0
	movhi r0, #1
	bxls lr

	subs r0, r3, #204
	movne r0, #1
	bx lr

.dat:
	dw 0x10B
