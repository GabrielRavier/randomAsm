	.text

bcmp:
	b memcmp





bzero:
	mov r2, r1
	mov r1, #0
	b memset





ffs:
ffsl:
	cmp r0, #0
	rbit r3, r0
	clz r3
	mvneq r3, #0

	add r0, r3, #1
	bx lr





ffsll:
	push {r4, lr}
	bl __ffsdi2
	asr r1, r0, #0x1F
	pop {r4, pc}





isascii:
	bics r3, r0, #0x7F
	movEqNe r0, #1, #0
	bx lr





signbitf:
	push {r4, lr}
	mov r1, #0
	bl __aeabi_fcmplt

	adds r0, #0
	movne r0, #1
	pop {r4, pc}





signbit:
signbitl:
	push {r4, lr}
	multiZero r2, r3
	bl __aeabi_dcmplt

	adds r0, #0
	movne r0, #1
	pop {r4, pc}





toascii:
	and r0, #0x7F
	bx lr
