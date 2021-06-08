	.text

__ffsdi2:
	cmp r0, #0
	bne .not0

	subs r0, r1, #0
	rsbne r1, r0, #0
	andne r0, r1
	clzne r0
	rsbne r0, #0x40
	bx lr

.not0:
	rsb r1, r0, #0
	and r0, r1
	clz r0
	rsb r0, #0x20
	bx lr
