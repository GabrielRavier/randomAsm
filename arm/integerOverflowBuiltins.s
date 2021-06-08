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

	mov r2, r4
	mov r3, r5

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
	push {r4, r5}
	adds r4, r0, r2
	ldr ip, [sp, #8]
	adcs r5, r1, r3

	mov r2, r4
	mov r3, r5
	movCcCs r0, #0, #1
	strd r2, [ip]
	pop {r4, r5}
	bx lr
