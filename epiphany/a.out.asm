	.text

N_MAGIC:
	ldrh r0, [r0]
	rts





N_MACHTYPE:
	ldrb r0, [r0, #2]
	rts





N_FLAGS:
	ldrb r0, [r0, #3]
	rts





N_SET_INFO:
	lsl r2, #24
	movt r1, 0
	lsr r2, #24
	lsl r3, #24
	lsl r2, #16
	orr r1, r3, r1
	orr r2, r1
	str r2, [r0]
	rts





N_BADMAG:
	ldrh r1, [r0]
	mov r2, #1
	sub r0, r1, #0x10B
	movne r0, r2
	
	sub r3, r1, #0xCC
	movne r3, r2
	
	and r0, r3
	add r1, #-0x107
	sub r3, r1, #1
	mov r1, #0
	movgtu r1, r2
	
	and r0, r1, r0
	rts