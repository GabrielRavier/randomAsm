	.text

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

	.irp reg, r0, r2
		uxth \reg
	.endr

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
	uxth r3, r0
	uxth r2, r1

	.irp reg, r0, r1
		lsr \reg, #0x10
	.endr

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
	bx lr
