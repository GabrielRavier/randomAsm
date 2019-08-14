	.text

__rold:
	and r1, #0x1F
	rsb r1, #0x20
	ror r0, r1
	bx lr





__rord:
	and r1, #0x1F
	ror r0, r1
	bx lr





__rolq:
	and r2, #0x3F
	push {r4, r5, r6, lr}
	rsb r3, r2, #0
	and r3, #0x3F
	sub ip, r2, #0x20
	lsl lr, r1, r2
	rsb r6, r3, #0x20
	orr lr, r0, lsl ip
	rsb r5, r2, #0x20
	lsr ip, r0, r3
	sub r4, r3, #0x20
	orr ip, r1, lsl r6
	orr lr, r0, lsr r5
	orr ip, r1, lsr r4
	orr r0, ip, r0, lsl r2
	orr r1, lr, r1, lsl r3
	pop {r4, r5, r6, pc}





__rorq:
	and r2, #0x3F
	push {r4, r5, r6, lr}
	rsb r3, r2, #0
	and r3, #0x3F
	sub ip, r2, #0x20
	lsr lr, r1, r2
	rsb r6, r3, #0x20
	orr lr, r0, lsl ip
	rsb r5, r2, #0x20
	lsr ip, r0, r3
	sub r4, r3, #0x20
	orr ip, r1, lsl r6
	orr lr, r0, lsr r5
	orr ip, r1, lsr r4
	orr r0, ip, r0, lsr r2
	orr r1, lr, r1, lsl r3
	pop {r4, r5, r6, pc}
