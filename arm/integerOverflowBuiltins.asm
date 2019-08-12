	.text

sadd_overflow:
saddl_overflow:
	adds r1, r0, r1
	str r1, [r2]

	movVcVs r0, #0, #1
	bx lr





saddll_overflow:
	push {r4, r5}
	adds r4, r0, r2
	ldr ip, [sp, #8]

	adcs r5, r1, r3

	multiMov "r2, r4", "r3, r5"

	movVcVs r0, #0, #1
	strd r2, [ip]
	pop {r4, r5}
	bx lr





uadd_overflow:
uaddl_overflow:
	adds r1, r0, r1
	str r1, [r2]

	movCcCs r0, #0, #1
	bx lr





uaddll_overflow:
	str fp, [sp, #-4]!

	adds fp, r0, r2
	adcs ip, r1, r3

	multiMov "r2, fp", "r3, ip"

	ldr r1, [sp, #4]
	movCcCs r0, #0, #1

	stm r1, {r2-r3}
	ldr fp, [sp], #4
	bx lr
