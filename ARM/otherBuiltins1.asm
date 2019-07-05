	.text

bcmp:
	b memcmp





bzero:
	mov r2, r1
	mov r1, #0
	b memset





ffsll:
	push {r4, lr}
	bl __ffsdi2
	pop {r4, pc}





ffsl:
ffs:
	rsb r3, r0, #0
	and r0, r3
	clz r0

	rsb r0, #32
	bx lr





isascii:
	bics r3, r0, #0x7F
	moveq r0, #1
	movne r0, #0
	bx lr





signbit:
signbitl:
	push {r4, lr}
	mov r2, #0
	mov r3, #0
	bl __aeabi_dcmplt

	adds r0, #0
	movne r0, #1
	pop {r4, pc}





signbitf:
	push {r4, lr}
	mov r1, #0
	bl __aeabi_fcmplt

	adds r0, #0
	movne r0, #1
	pop {r4, pc}





toascii:
	and r0, #0x7F
	bx lr
