	.text

cimagf:
	mov r0, r1
	bx lr





cimagl:
cimag:
	multiMov "r0, r2", "r1, r3"
	bx lr





conjf:
	add r2, #0x80000000
	multiStr "r2, [r0, #4]", "r1, [r0]"
	bx lr





conjl:
conj:
	sub sp, #8
	push {r4, r5}
	add ip, sp, #4
	stmib ip, {r2, r3}
	multiLdr "r3, [sp, #20]", "r2, [sp, #16]"
	add r3, #0x80000000
	add r5, sp, #8
	ldmia r5, {r4-r5}

	str r2, [r0, #8]
	stm r0, {r4-r5}
	pop {r4, r5}
	str r3, [r0, #12]
	add sp, #8
	bx lr





copysignf:
	and r1, #0x80000000
	bic r0, #0x80000000
	orr r0, r1
	bx lr





copysignl:
copysign:
	push {r4, r5}
	bic r1, #0x80000000
	and r3, #0x80000000
	orr r5, r1, r3
	mov r1, r5
	pop {r4, r5}
	bx lr





cprojf:
	multiStr "r1, [r0]", "r2, [r0, #4]"
	str r1, [r0]
	str r2, [r0, #4]
	bx lr





cprojl:
cproj:
	sub sp, #8
	push {r4, r5}

	add r5, sp, #0x10
	ldmia r5, {r4-r5}

	add ip, sp, #4
	stmib ip, {r2-r3}
	multiStr "r4, [r0, #8]", "r5, [r0, #12]"
	add r3, sp, #8
	ldmia r3, {r2-r3}

	pop {r4, r5}
	stm r0, {r2-r3}
	add sp, #8
	bx lr





fmaxf:
	push {r4, r5, r6, lr}
	multiMov "r4, r0", "r5, r1"
	bl __aeabi_fcmpge

	cmp r0, #0
	moveq r4, r5

	mov r0, r4
	pop {r4, r5, r6, pc}





fmaxl:
fmax:
	push {r4, r5, r6, r7, r8, lr}

	multiMov "r4, r0", "r5, r1", "r6, r2", "r7, r3"
	bl __aeabi_dcmpge

	cmp r0, #0
	moveq r4, r6
	moveq r5, r7

	multiMov "r0, r4", "r1, r5"
	pop {r4, r5, r6, r7, r8, pc}





fminf:
	push {r4, r5, r6, lr}
	multiMov "r4, r0", "r5, r1"
	bl __aeabi_fcmple

	cmp r0, #0
	moveq r4, r5

	mov r0, r4
	pop {r4, r5, r6, pc}





fminl:
fmin:
	push {r4, r5, r6, r7, r8, lr}

	multiMov "r4, r0", "r5, r1", "r6, r2", "r7, r3"
	bl __aeabi_dcmple

	cmp r0, #0
	moveq r4, r6
	moveq r5, r7

	multiMov "r0, r4", "r1, r5"
	pop {r4, r5, r6, r7, r8, pc}





imaxabs:
llabs:
	asr r3, r1, #31
	eor r0, r3

	subs r0, r3
	eor r1, r3
	sbc r1, r3
	bx lr
