sadd_overflow:
saddl_overflow:
	adds r1, r0, r1
	str r1, [r2]

	movvs r0, #1
	movvc r0, #0
	bx lr





saddll_overflow:
	push {r4, r5}
	adds r4, r0, r2
	ldr ip, [sp, #8]

	adcs r5, r1, r3

	mov r2, r4
	mov r3, r5

	movvs r0, #1
	movvc r0, #0
	strd r2, [ip]
	pop {r4, r5}
	bx lr





uadd_overflow:
	adds r1, r0, r1
	str r1, [r2]

	movcs r0, #1
	movcc r0, #0
	bx lr
