__aeabi_lmul:
__aeabi_muldi3:
__muldi3:
#if 1
	push {r4, r5, r6, r7, r8, lr}
	mov r5, r3
	mov r7, r0
	mov r6, r1
	mov r4, r2
	mov r1, r2
	mul r5, r7
	bl __muldsi3

	mla r4, r6, r4, r5
	add r1, r4, r1
	pop {r4, r5, r6, r7, r8, pc}
#elif 0
	push {r4, lr}
	muls r1, r2
	muls r3, r0
	adds r1, r3

	lsrs r3, r0, #16
	lsrs r4, r2, #16
	muls r3, r4
	adds r1, r3

	lsrs r3, r0, #16
	uxth r0
	uxth r2
	muls r3, r2
	muls r4, r0
	muls r0, r2

	movs r2, #0
	adds r3, r4
	adcs r2
	lsls r2, #16
	adds r1, r2

	lsls r2, r3, #16
	lsrs r3, #16
	adds r0, r2
	adcs r1, r3
	pop {r4, pc}
#endif





__muldsi3:
#if ARMv6
	uxth r3, r0
	uxth r2, r1

#if ARM7ve
	lsr r0, #16
	lsr r1, #16

	mul ip, r2, r3
	mul r2, r0, r2
	mul r3, r1, r3
	mul r1, r0

	add r2, ip, lsr #16
	lsr r0, r2, #16
	add r1, r2, lsr #16
	uxtah ip, r0, ip

	add r3, ip, lsr #16
	lsl r0, r3, #16
	add r1, r3, lsr #16
	uxtah r0, ip
#else
	push {r4}
	lsrs r4, r0, #16
	mul r0, r2, r3

	lsrs r1, #16
	mul r2, r4, r2
	mul r3, r1, r3
	add r2, r0, lsr #16

	uxth r0
	mul r1, r4
	add r0, r2, lsl #16
	pop {r4}

	add r3, r0, lsr #16
	uxth r0
	add r1, r2, lsr #16
	add r0, r3, lsl #16
	add r1, r3, lsr #16

#endif
	bx lr

#else
	push {r4, r5, lr}
	ldr lr, .uFFFF

	lsr r5, r0, #16
	and r4, r0, lr
	and r3, r1, lr
	mul ip, r3, r4
	mul r2, r5, r3

	lsr r1, #16
	mul r0, r1, r5
	mul r3, r1, r4
	add r1, r2, ip, lsr #16

	and ip, lr
	add ip, r1, lsl #16
	add r3, ip, lsr #16

	and lr, ip
	add r1, r0, r1, lsr #16
	add r1, r3, lsr #16
	add r0, lr, r3, lsl #16
	pop {r4, r5, pc}

.uFFFF:
	.word 0xFFFF
#endif
