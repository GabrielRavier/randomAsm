	.text

__paritysi2:
	.irp lsrAmount #16, #8
		eor r0, lsr \lsrAmount
	.endr

	ldr r3, .u6996
	eor r0, lsr #4

	and r0, #0xF
	asr r0, r3, r0

	and r0, #1
	bx lr

.u6996:
	.word 0x6996





__paritydi2:
	push {r4, lr}

	eor r0, r1
	bl __paritysi2

	pop {r4, pc}
