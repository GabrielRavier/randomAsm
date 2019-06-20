__aeabi_cmpdf2:
	mov ip, #1

	str ip, [sp, #-4]!

	mov ip, r0, lsl #1
	mvns ip, asr #21
	mov ip, r2, lsl #1
	mvnsne ip, asr #21
	beq .maybeNaN

.testEq:
	add sp, #4
	orrs ip, r1, r0, lsl #1
	orrseq ip, r3, r2, lsl #1
	teqne r0, r2

	teqeq r1, r3
	moveq r0, #0
	bxeq lr

	cmn r0, #0

	teq r0, r2

	cmppl r0, r2
	cmpeq r1, r3

	movcs r0, r2, asr #31
	mvncc r0, r2, asr #31
	orr r0, #1
	bx lr

.maybeNaN:
	mov ip, r0, lsl #1
	mvns ip, asr #21
	bne .maybeNotNaN

	orrs ip, r1, r0, lsl #12
	bne .return

.maybeNotNaN:
	mov ip, r2, lsl #1
	mvns ip, asr #21
	bne .testEq

	orrs ip, r3, r2, lsl #12
	beq .testEq

.return:
	ldr r0, [sp], #4
	bx lr
