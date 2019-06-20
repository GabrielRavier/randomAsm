__aeabi_cmpsf2:
__aeabi_nesf2:
__aeabi_eqsf2:
	mov ip, #1
	str ip, [sp, #-4]!

	mov r2, r0, lsl #1
	mov r3, r1, lsl #1
	mvns ip, r2, asr #24
	mvnsne p, r3, asr #24
	beq .lookForNaN

.compare:
	add sp, #4
	orrs ip, r2, r3, lsr #1
	teqne r0, r1
	subspl r0, r2, r3
	movhi r0, r1, asr #31
	mvnlo r0, r1, asr #31
	orrne r0, #1
	bx lr

.lookForNaN:
	mvns ip, r2, asr #24
	bne .maybeNaN

	movs ip, r0, lsl #9
	bne .return

.maybeNaN:
	mvns ip, r3, asr #24
	bne .compare

	movs ip, r1, lsl #9
	beq .compare

.return:
	ldr r0, [sp], #4
	bx lr
