	.text

__aeabi_dmul:
	push {r4, r5, r6, lr}

	mov ip, #0xFF
	orr ip, #0x700
	andsne r5, ip, r2 lsr #20
	ands r4, ip, r0, lsr #20

	.irp reg, r4, r5
		teqne \reg, ip
	.endr

	bleq .ls

	add r4, r5

	eor r6, r0, r2

	.irp reg, r0, r2
		bic \reg, ip, lsl #21
	.endr

	orrs r5, r1, r0, lsl #12
	orrsne r5, r3, r2, lsl #12

	.irp reg, r0, r2
		orr \reg, #0x100000
	.endr

	beq .l1

	umull ip, lr, r1, r3
	mov r5, #0
	umlal lr, r5, r0, r3
	and r3, r6, #0x80000000
	umlal lr, r5, r1, r2
	mov r6, #0
	umlal r5, r6, r0, r2

	teq ip, #0
	orrne lr, #1

	sub r4, #0xFF
	cmp r6, #0x200
	sbc r4, #0x300
	bcs .skip

	movs lr, lsl #1
	adcs r5
	adc r6

.skip:
	orr r0, r3, r6, lsl #11
	orr r0, r5, lsr #21
	mov r1, r5, lsl #21
	orr r1, lr, lsr #21
	mov lr, lsl #11

	subs ip, r4, #253
	cmphi ip, #0x700
	bhi .u

	cmp lr, #0x80000000
	movseq lr, r1, lsr #1
	adcs r1, #0
	adc r0, r4, lsl #20
	pop {r4, r5, r6, pc}

.l1:
	and r6, #0x80000000
	orr r1, r6, r0
	orr r1, r3
	eor r0, r2
	subs r4, ip, lsr #1
	rsbsgt r5, r4, ip
	orrgt r1, r0, r4, lsl #20
	popgt {r4, r5, r6, pc}

	orr r1, r0, #0x10000
	mov lr, #0
	subs r4, #1

.u:
	bgt .o

	cmn r4, #54
	movle r1, #0
	bicle r1, r0, #0x7FFFFFFF
	pople {r4, r5, r6}

	rsb r4, #0
	subs r4, #32
	bge .l2

	adds r4, #12
	bgt .l12

	add r4, #20
	rsb r5, r4, #32
	lsl r3, r1, r5
	lsr r1, r1, r4
	orr r1, r0, lsl r5

	and r2, r0, #0x80000000
	bic r0, #0x80000000
	adds r1, r3, lsr #31
	adc r0, r2, r0, lsr r4
	orrs lr, r3, lsl #1
	biceq r1, r3, lsr #31
	pop {r4, r5, r6, pc}

.l12:
	rsb r4, #12
	rsb r5, r4, #32
	lsl r3, r1, r4
	lsr r1, r1, r5
	orr r1, r0, lsl r4

	bic r0, #0x7FFFFFFF
	adds r1, r3, lsr #31
	adc r0, #0
	orrs lr, r3, lsl #1
	biceq r1, r3, lsr #31
	pop {r4, r5, r6}

l2:
	rsb r5, r4, #32
	orr lr, r1, lsl r5
	lsr r3, r1, r4
	orr r3, r0, lsl r5
	lsr r1, r0, r4

	bic r0, #0x7FFFFFFF
	bic r1, r0, lsr r4

	add r1, r3, lsr #31
	orrs lr, r3, lsl #1
	biceq r1, r3, lsr #31
	pop {r4, r5, r6, pc}

.d:
	teq r4, #0
	bne .l22

	and r6, r0, #0x80000000

.l13:
	movs r1, lsl #1
	adc r0
	tst r0, #0x100000
	subeq r4, #1
	beq .l13

	orr r0, r6
	teq r5, #0
	bxne lr

.l22:
	and r6, r2, #0x80000000

.l3:
	movs r3, lsl #1
	adc r2
	tst r2, #0x100000
	subeq r5, #1
	beq .l3

	orr r2, r6
	bx lr

.s:
	teq r4, ip
	and r5, ip, r2, lsr #20
	teqne r5, ip
	beq .l14

	orrs r6, r1, r0, lsl #1
	orrsne r6, r3, r2, lsl #1
	bne .d

.z:
	eor r0, r2
	and r0, #0x80000000
	mov r1, #0
	pop {r4, r5, r6, pc}

.l14:
	orrs r6, r1, r0, lsl #1
	moveq r1, r3
	moveq r0, r2
	orrsne r6, r3, r2, lsl #1
	beq .n

	teq r4, ip
	bne .l15

	orrs r6, r1, r0, lsl #12
	bne .n

.l15:
	teq r5, ip
	bne .i

	orrs r6, r3, r2, lsl #12
	movne r1, r3
	movne r0, r2
	bne .n

.i:
	eor r0, r2

.o:
	and r0, #0x80000000

	.irp val, #0x7F000000, #0xF00000
		orr r0, \val
	.endr

	mov r1, #0
	pop {r4, r5, r6, pc}

.n:
	.irp val, #0x7F000000, #0xF80000
		orr r0, \val
	.endr

	pop {r4, r5, r6, pc}





__aeabi_fmul:
	mov ip, #0xFF
	ands r2, ip, r0, lsr #23
	andsne r3, ip, r1, lsr #23

	.irp reg, r2, r3
		teqne \reg, ip
	.endr

	beq .s

	add r2, r3
	eor ip, r0, r1
	movs r0, lsl #9
	movsne r1, lsl #9
	beq .l1

	mov r1, #0x8000000

	.irp reg, r0, r1
		orr \reg, r3, \reg, lsr #5
	.endr

	umull r3, r1, r0, r1

	and r0, ip, #0x80000000

	cmp r1, #0x800000
	movcc r1, lsl #1
	orrcc r1, r3, lsr #31
	movcc r3, lsl #1

	orr r0, r1

	sbc r2, #127
	cmp r2, #253
	bhi .u

	cmp r3, #0x80000000
	adc r0, r2, lsl #23
	biceq r0, #1
	bx lr

.l1:
	teq r0, #0
	and ip, #0x80000000
	moveq r1, lsr #9
	orr r0, ip, r0, lsr #9
	orr r1, lsr #9
	subs r2, #127
	rsbsgt r3, r2, #255
	orrgt r0, r2, lsl #23
	bxgt lr

	orr r0, #0x800000
	mov r3, #0
	subs r2, #1

.u:
	bgt .o

	cmn r2, #25
	bicle r0, #0x7FFFFFFF
	bxle lr

	rsb r2, #0
	movs r1, r0, lsl #1
	lsr r1, r2
	rsb r2, #32
	lsl ip, r0, r2
	movs r0, r1, rrx
	adc r0, #0
	orrs r3, ip, lsl #1
	biceq r0, ip, lsr #31
	bx lr

.d:
	teq r2, #0
	and ip, r0, #0x80000000

.l12:
	moveq r0, lsl #1
	tsteq r0, #0x800000
	subeq r2, #1
	beq .l12

	orr r0, ip
	teq r3, #0
	and ip, r1, #0x80000000

.l2:
	moveq r1, lsl #1
	tsteq r1, #0x800000
	beq .l2

	orr r1, ip
	b .x

.s:
	and r3, ip, r1, lsr #23
	teq r2, ip
	teqne r3, ip
	beq .l13

	bics ip, r0, #0x80000000
	bicsne ip, r1, #0x80000000
	bne .d

.z:
	eor r0, r1
	bic r0, #0x7FFFFFFF
	bx lr

.l13:
	teq r0, #0
	teqne r0, #0x80000000
	moveq r0, r1

	.irp val, #0, #0x80000000
		teqne r1, \val
	.endr

	beq .n

	teq r2, ip
	bne .l14

	movs r2, r0, lsl #9
	bne .n

.l14:
	teq r3, ip
	bne .i

	movs r3, r1, lsl #9
	movne r0, r1
	bne .n

.i:
	eor r0, r1

.o:
	and r0, #0x80000000

	.irp val, #0x7F000000, #0x800000
		orr r0, \val
	.endr

	bx lr

.n:
	.irp val, #0x7F000000, #0xC00000
		orr r0, \val
	.endr

	bx lr
