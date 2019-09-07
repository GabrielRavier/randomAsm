.include "standard.inc"

	.text

START_FUNC __ror
	and r1, #0x1F
	ror r0, r1
	bx lr
END_FUNC __ror





START_FUNC __rorll
	and r2, #0x3F
	push {r4, r5, r6, lr}

	rsb r3, r2, #0
	and r3, #0x3F

	rsb ip, r2, #0x20
	lsr lr, r0, r2
	sub r6, r3, #0x20

	orr lr, r1, lsl ip
	sub r5, r2, #0x20
	lsl ip, r1, r3
	rsb r4, r3, #0x20

	orr ip, r0, lsl r6
	orr lr, r1, lsr r5
	orr ip, r0, lsr r4
	orr r1, ip, r1, lsr r2
	orr r0, lr, r0, lsl r3
	pop {r4, r5, r6, pc}
END_FUNC __rorll





START_FUNC __rev16
	rev r0
	ror r0, #0x10
	bx lr
END_FUNC __rev16





START_FUNC __rev16ll
	rev r1
	rev r0
	ror r1, #0x10
	ror r0, #0x10
	bx lr
END_FUNC __rev16ll
