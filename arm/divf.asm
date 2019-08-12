	.text

__aeabi_ddiv:
	push {r4, r5, r6, pc}

	mov ip, #0xFF
	orr ip, #0x700
	ands r3, ip, r0, lsr #20
	andsne r5, ip, r2, lsr #20

	.irp reg, r4, r5
		teqne \reg, ip
	.endr
	bleq .s

	sub r4, r5

	eor lr, r0, r2

	orrs r5, r3, r2, lsl #12
	mov r0, lsl #12
	beq .l1

	multiMov "r2, lsl #12", "r5, #0x10000000"
	orr r2, r5, r2, lsr #4
	orr r2, r3, lsr #24
	mov r3, lsl #8
	orr r5, r0, lsr #4
	orr r5, r1, lsr #24
	mov r6, r1, lsl #8

	and r0, lr, #0x80000000

	cmp r5, r2
	cmpeq r6, r3
	adc r4, #253
	add r4, #0x300
	bcs .l12

	movs r2, lsr #1
	mov r3, rrx

.l12:
	subs r6, r3
	sbc r5, r2
	movs r2, lsr #1
	multiMov "r3, rrx", "r1, #0x100000", "ip, #0x80000"

.l13:
	subs lr, r6, r3
	sbcs lr, r5, r2
	subcs r6, r3
	movcs r5, lr
	orrcs r1, ip

	.rept 3
		movs r2, lsr #1
		mov r3, rrx
		subs lr, r6, r3
		sbcs lr, r5, r2
		subcs r6, r3
		movcs r5, lr
		orrcs r1, ip, lsr #1
	.endr

	orrs lr, r5, r6
	beq .l2

	mov r5, lsl #4
	orr r5, r6, lsr #28
	multiMov "r6, lsl #4", "r2, lsl #3"
	orr r2, r3, lsr #29
	mov r3, lsl #3
	movs ip, lsr #4
	bne .l13

	tst r0, #0x100000
	bne .l3

	orr r0, r1
	multiMov "r1, #0", "ip, #0x80000000"
	b .l13

.l2:
	tst r0, #0x100000
	orreq r0, r1
	moveq r1, #0

.l3:
	subs ip, r4, #253
	cmphi ip, #0x700
	bhi __aeabi_dmul.u

	subs ip, r5, r2
	subseq ip, r6, r3
	movseq ip, r1, lsr #1

	adcs r1, #0
	adc r0, r4, lsl #20
	pop {r4, r5, r6, pc}

.l1:
	and lr, #0x80000000
	orr r0, lr, r0, lsr #12
	adds r4, ip, lsr #1
	rsbsgt r5, r4, ip
	orrgt r0, r4, lsl #20
	popgt {r4, r5, r6, pc}

	orr r0, #0x100000
	mov lr, #0
	subs r4, #1
	b __aeabi_dmul.u

.u:
	orr lr, r5, r6
	b __aeabi_dmul.u

.s:
	and r5, ip, r2, lsr #20
	teq r4, ip
	teqeq r5, ip
	beq __aeabi_dmul.n

	teq r4, ip
	bne .l14

	orrs r4, r1, r0, lsl #12
	bne __aeabi_dmul.n

	teq r5, ip
	bne __aeabi_dmul.i

	mov r1, r3
	mov r0, r2
	b __aeabi_dmul.n

.l14:
	teq r5, ip
	bne .l22

	orrs r5, r3, r2, lsl #12
	beq __aeabi_dmul.z

	mov r1, r3
	mov r0, r2

.l22:
	orrs r6, r1, r0, lsl #1
	orrsne r6, r3, r2, lsl #1
	bne __aeabi_dmul.d

	orrs r4, r1, r0, lsl #1
	bne __aeabi_dmul.i

	orrs r5, r3, r2, lsl #1
	bne __aeabi_dmul.z
	b __aeabi_dmul.n





__aeabi_fdiv:
	mov ip, #0xFF
	ands r2, ip, r0, lsr #23
	andsne r3, ip, r1, lsr #23

	.irp reg, r2, r3
		teqne \reg, ip
	.endr

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
