	.text

__aeabi_cmpsf2:
__aeabi_nesf2:
__aeabi_eqsf2:
	mov ip, #1
	str ip, [sp, #-4]!

	mov r2, r0, lsl #1
	mov r3, r1, lsl #1
	mvns ip, r2, asr #24
	mvnsne ip, r3, asr #24
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

	.irp args, "r0, r2", "r1, r3"
		teqne \args
	.endr

	moveq r0, #0
	bxeq lr

	cmn r0, #0

	teq r0, r2

	cmppl r0, r2
	cmpeq r1, r3

	.irp instr, movcs, mvncc
		\instr r0, r2, asr #31
	.endr

	orr r0, #1
	bx lr

.macro checkNaNPart reg, bneDest
	mov ip, \reg, lsl #1
	mvns ip, asr #21
	bne \bneDest
.endm

.maybeNaN:
	checkNaNPart r0, .maybeNotNaN

	orrs ip, r1, r0, lsl #12
	bne .return

.maybeNotNaN:
	checkNaNPart r2, .testEq

	orrs ip, r3, r2, lsl #12
	beq .testEq

.return:
	ldr r0, [sp], #4
	bx lr





.macro mkCmpWrapper funcName, funcCalled, cond1, cond2
\funcName:
	str lr, [sp, #-8]!
	bl \funcCalled

	mov\cond1 r0, #1
	mov\cond2 r0, #0
	ldr pc, [sp], #8
.endm

.macro mkCmpCcCsWrapper funcName, funcCalled
	mkCmpWrapper \funcName, \funcCalled, cc, cs
.endm

.macro mkCmpLsHiWrapper funcName, funcCalled
	mkCmpWrapper \funcName, \funcCalled, ls, hi
.endm

.macro mkCmpEqNeWrapper funcName, funcCalled
	mkCmpWrapper \funcName, \funcCalled, eq, ne
.endm

	mkCmpCcCsWrapper __aeabi_dcmplt, __aeabi_cdcmple
	mkCmpCcCsWrapper __aeabi_fcmplt, __aeabi_cfcmple

	mkCmpLsHiWrapper __aeabi_dcmpge, __aeabi_cdrcmple
	mkCmpLsHiWrapper __aeabi_fcmpge, __aeabi_cfrcmple

	mkCmpLsHiWrapper __aeabi_dcmple, __aeabi_cdcmple
	mkCmpLsHiWrapper __aeabi_fcmple, __aeabi_cfcmple

	mkCmpCcCsWrapper __aeabi_dcmpgt, __aeabi_cdrcmple

	mkCmpEqNeWrapper __aeabi_dcmpeq, __aeabi_cdcmple





__unorddf2:
__aeabi_dcmpun:
	mov ip, r1, lsl #1
	mvns ip, asr #21
	bne .ne

	orrs ip, r0, r1, lsl #12
	bne .unordered

.ne:
	mov ip, r3, lsl #1
	mvns ip, asr #21
	bne .ordered

	orrs ip, r2, r3, lsl #12
	bne .unordered

.ordered:
	mov r0, #0
	bx lr

.unordered:
	mov r0, #1
	bx lr
