	.text

cargf:
	mov r3, r1
	mov r1, r0
	mov r0, r3
	b atan2f





cargl:
	push {r4, r5}
	mov r4, r2
	mov r5, r3
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, r5
	pop {r4, r5}
	b atan2l





carg:
	push {r4, r5}
	mov r4, r2
	mov r5, r3
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, r5
	pop {r4, r5}
	b atan2





cimagf:
	mov r0, r1
	bx lr





cimagl:
cimag:
	mov r0, r2
	mov r1, r3
	bx lr





conjf:
	add r2, #0x80000000
	str r1, [r0]
	str r2, [r0, #4]
	bx lr





conjl:
conj:
	sub sp, #8
	push {r4, r5}
	add r1, sp, #4
	stmib r1, {r2, r3}
	ldr r2, [sp, #20]
	ldrd r4, [sp, #8]
	strd r4, [sp]
	ldr r1, [sp, #16]
	add r2, #0x80000000
	pop {r4, r5}

	str r1, [r0, #8]
	str r2, [r0, #12]
	add sp, #8
	bx lr





copysignf:
	bfi r0, #0, #0x1F
	bx lr





copysignl:
copysign:
	lsr ip, r3, #0x1F
	bfi r1, ip, #0x1F, #1
	bx lr





cprojf:
	str r1, [r0]
	str r2, [r0, #4]
	bx lr





cprojl:
cproj:
	sub sp, #8
	push {r4, r5}

	add r1, sp, #4
	stmib r1, {r2-r3}
	ldrd r2, [sp, #16]
	strd r2, [r0, #8]
	ldrd r4, [sp, #8]
	strd r4, [r0]

	pop {r4, r5}
	add sp, #8
	bx lr





crealf:
creall:
creal:
	bx lr





fmaxf:
	push {r4, r5, r6, lr}
	mov r4, r0
	mov r5, r1
	bl __aeabi_fcmpge

	cmp r0, #0
	moveq r4, r5

	mov r0, r4
	pop {r4, r5, r6, pc}





fmaxl:
fmax:
	push {r4, r5, r6, r7, r8, lr}

	mov r4, r0
	mov r5, r1
	mov r6, r2
	mov r7, r3
	bl __aeabi_dcmpge

	cmp r0, #0
	moveq r4, r6
	moveq r5, r7

	mov r0, r4
	mov r1, r5
	pop {r4, r5, r6, r7, r8, pc}





fminf:
	push {r4, r5, r6, lr}
	mov r4, r0
	mov r5, r1
	bl __aeabi_fcmple

	cmp r0, #0
	moveq r4, r5

	mov r0, r4
	pop {r4, r5, r6, pc}





fminl:
fmin:
	push {r4, r5, r6, r7, r8, lr}

	mov128 r4, r0
	bl __aeabi_dcmple

	cmp r0, #0
	moveq r4, r6
	moveq r5, r7

	mov r0, r4
	mov r1, r5
	pop {r4, r5, r6, r7, r8, pc}





imaxabs:
llabs:
	asr r3, r1, #31
	eor r0, r3
	eor r1, r3

	subs r0, r3
	sbc r1, r3
	bx lr
