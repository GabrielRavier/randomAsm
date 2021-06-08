	.text

__ctzdi2:
	clr r3, r0
	lsr r3, #5
	rsb r2, r3, #0

	sub r3, #1
	and r3, r0
	and r1, r2
	orr r1, r3, r1
	rsb r0, r1, #0

	and r1, r0
	clz r1

	and r0, r2, #0x20
	rsb r1, #0x1F
	add r0, r1
	bx lr
