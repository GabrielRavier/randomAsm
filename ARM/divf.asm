	.text

__aeabi_ddiv:
	push {r4, r5, r6, pc}

	mov ip, #0xFF
	orr ip, #0x700
	ands r3, ip, xh, lsr #20
	andsne r5, ip, yh, lsr #20

	.irp reg, r4, r5
		teqne \reg, ip
	.endr
	bleq .s

	sub r4, r5

	eor lr, xh, yh

	orrs r5, yl, yh, lsl #12
	mov xh, lsl #12
	beq .l1

	mov yh, lsl #12
	mov r5, #0x10000000
	orr yh, r5, yh, lsr #4
	orr yh, yl, lsr #24
	mov yl, lsl #8
	orr r5, xh, lsr #4
	orr r5, xl, lsr #24
	mov r6, xl, lsl #8

	and xh, lr, #0x80000000

	cmp r5, yh
	cmpeq r6, yl
	adc r4, #253
	add r4, #0x300
	bcs .l12

	movs yh, lsr #1
	mov yl, rrx

.l12:
	subs r6, yl
	sbc r5, yh
	movs yh, lsr #1
	mov yl, rrx
	mov xl, #0x100000
	mov ip, #0x80000

.l13:
	subs lr, r6, yl
	sbcs lr, r5, yh
	subcs r6, yl
	movcs r5, lr
	orrcs xl, ip
	movs yh, lsr #1
	mov yl, rrx
	subs lr, r6, yl
	sbcs lr, r5, yh
	subcs r6, yl
	movcs r5, lr
	orrcs xl, ip, lsr #1
	movs yh, lsr #1
	mov yl, rrx
	subs lr, r6, yl
	sbcs lr, r5, yh
	subcs r6, yl
	movcs r5, lr
	orrcs xl, ip, lsr #2
	movs yh, lsr #1
	mov yl, rrx
	subs lr, r6, yl
	sbcs lr, r5, yh
	subcs r6, yl
	movcs r5, lr
	orrcs xl, ip, lsr #3

	orrs lr, r5, r6
	beq .l2

	mov r5, lsl #4
	orr r5, r6, lsr #28
	mov r6, lsl #4
	mov yh, lsl #3
	orr yh, yl, lsr #29
	mov yl, lsl #3
	movs ip, lsr #4
	bne .l13

	tst xh, #0x100000
	bne .l3

	orr xh, xl
	mov xl, #0
	mov ip, #0x80000000
	b .l13

.l2:
	tst xh, #0x100000
	orreq xh, xl
	moveq xl, #0

.l3:
	subs ip, r4, #253
	cmphi ip, #0x700
	bhi __aeabi_dmul.u

	subs ip, r5, yh
	subseq ip, r6, yl
	movseq ip, xl, lsr #1

	adcs xl, #0
	adc xh, r4, lsl #20
	pop {r4, r5, r6, pc}

.l1:
	and lr, #0x80000000
	orr xh, lr, xh, lsr #12
	adds r4, ip, lsr #1
	rsbsgt r5, r4, ip
	orrgt xh, r4, lsl #20
	popgt {r4, r5, r6, pc}

	orr xh, #0x100000
	mov lr, #0
	subs r4, #1
	b __aeabi_dmul.u

.u:
	orr lr, r5, r6
	b __aeabi_dmul.u

.s:
	and r5, ip, yh, lsr #20
	teq r4, ip
	teqeq r5, ip
	beq __aeabi_dmul.n

	teq r4, ip
	bne .l14

	orrs r4, xl, xh, lsl #12
	bne __aeabi_dmul.n

	teq r5, ip
	bne __aeabi_dmul.i

	mov xl, yl
	mov xh, yh
	b __aeabi_dmul.n

.l14:
	teq r5, ip
	bne .l22

	orrs r5, yl, yh, lsl #12
	beq __aeabi_dmul.z

	mov xl, yl
	mov xh, yh

.l22:
	orrs r6, xl, xh, lsl #1
	orrsne r6, yl, yh, lsl #1
	bne __aeabi_dmul.d

	orrs r4, xl, xh, lsl #1
	bne __aeabi_dmul.i

	orrs r5, yl, yh, lsl #1
	bne __aeabi_dmul.z
	b __aeabi_dmul.n





__aeabi_fdiv:
	mov ip, #0xFF
	ands r2, ip, r0, lsr #23
	andsne r3, ip, r1, lsr #23
	teqne r2, ip
	teqne r3, ip
	beq .s

.x:
	sub r2, r3

	eor ip, r0, r1

	movs r1, lsl #9
	mov r0, lsl #9
	beq .l1

	mov r3, #0x10000000
	orr r1, r3, r1, lsr #4
	orr r3, r0, lsr #4

	and r0, ip, #0x80000000

	cmp r3, r1
	movcc r3, lsl #1
	adc r2, #125

	mov ip, #0x800000

.l12:
	cmp r3, r1
	subcs r3, r1
	orrcs r0, ip

	cmp r3, r1, lsr #1
	subcs r3, r1, lsr #1
	orrcs r0, ip, lsr #1

	cmp r3, r1, lsr #2
	subcs r3, r1, lsr #2
	orrcs r0, ip, lsr #2

	cmp r3, r1, lsr #3
	subcs r3, r1, lsr #3
	orrcs r0, ip, lsr #3

	movs r3, lsl #4
	movsne ip, lsr #4
	bne .l12

	cmp r2, #253
	bhi __aeabi_fmul.u

	cmp r3, r1
	adc r0, r2, lsl #23
	biceq r0, #1
	bx lr

.l1:
	and ip, #0x80000000
	orr r0, ip, r0, lsr #9
	adds r2, #127
	rsbsgt r3, r2, #255
	orrgt r0, r2, lsl #23
	bxgt lr

	orr r0, #0x800000
	mov r3, #0
	subs r2, #1
	b __aeabi_fmul.u

.d:
	teq r2, #0
	and ip, r0, #0x80000000

.l13:
	moveq r0, lsl #1
	tsteq r0, #0x800000
	subeq r2, #1
	beq .l13

	orr r0, ip
	teq r3, #0
	and ip, r1, #0x80000000

.l2:
	moveq r1, lsl #1
	tsteq r1, #0x800000
	subeq r3, #1
	beq .l2

	orr r1, ip
	b .x

.s:
	and r3, ip, r1, lsr #23
	teq r2, ip
	bne .l14

	movs r2, r0, lsl #9
	bne __aeabi_fmul.n

	teq r3, ip
	bne __aeabi_fmul.i

	mov r0, r1
	b __aeabi_fmul.n

.l14:
	teq r3, ip
	bne .l22

	movs r3, r1, lsl #9
	beq __aeabi_fmul.z

	mov r0, r1
	b __aeabi_fmul.n

.l22:
	bics ip, r0, #0x80000000
	bicsne ip, r1, #0x80000000
	bne .d

	bics r2, r0, #0x80000000
	bne __aeabi_fmul.i

	bics r3, r1, #0x80000000
	bne __aeabi_fmul.z
	b __aeabi_fmul.n
