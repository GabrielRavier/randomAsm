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





__aeabi_dcmplt:
	str lr, [sp, #-8]!
	bl __aeabi_cdcmple

	movcc r0, #1
	movcs r0, #0
	ldr pc, [sp], #8





__aeabi_fcmplt:
	str lr, [sp, #-8]!

	bl __aeabi_cfcmple

	movcc r0, #1
	movcs r0, #0
	ldr pc, [sp], #8





__aeabi_dcmpge:
	str lr, [sp, #-8]!
	bl __aeabi_cdrcmple
	movls r0, #1
	movhi r0, #0
	ldr pc, [sp], #8





__aeabi_fcmpge:
	str lr, [sp, #-8]!
	bl __aeabi_cfrcmple
	movls r0, #1
	movhi r0, #0
	ldr pc, [sp], #8





__aeabi_dcmple:
	str lr, [sp, #-8]!
	bl __aeabi_cdcmple
	movls r0, #1
	movhi r0, #0
	ldr pc, [sp], #8





__aeabi_fcmple:
	str lr, [sp, #-8]!
	bl __aeabi_cfcmple
	movls r0, #1
	movhi r0, #0
	ldr pc, [sp], #8
