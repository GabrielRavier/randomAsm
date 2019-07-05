	.bss

uint128_0:
	.zero 16

	.data

uint128_1:
	.quad 0, 1

	.text

uint128_t_constructor_default:
	push {r4, r5}

	mov r4, #0
	mov r5, #0

	stm r0, {r4-r5}
	str r4, [r0, #8]
	str r5, [r0, #12]

	pop {r4, r5}
	bx lr





uint128_t_constructor:
	push {r4, r5}
	add r3, r1, #8
	ldmia r3, {r2-r3}
	ldmia r1, {r4-r5}
	stm r0, {r4-r5}
	pop {r4, r5}

	str r2, [r0, #8]
	str r3, [r0, #12]
	bx lr





uint128_t_constructor_uint128_t_double_ref:
	ldmia r1, {r2-r3}
	stm r0, {r2-r3}

	cmp r0, r1
	add r3, r1, #8
	ldmia r3, {r2-r3}
	str r2, [r0, #8]
	str r3, [r0, #12]
	bxeq lr

	mov r2, #0
	mov r3, #0
	stm r1, {r2-r3}
	str r2, [r1, #8]
	str r3, [r1, #12]
	bx lr





uint128_t_operator_equal:
	push {r4, r5}
	add r3, r1, #8

	ldmia r3, {r2-r3}
	ldmia r1, {r4-r5}
	stm r0, {r4-r5}
	pop {r4, r5}

	str r2, [r0, #8]
	str r3, [r0, #12]
	bx lr





uint128_t_operator_equal_const_uint128_t_double_ref:
	cmp r0, r1
	bxeq lr

	push {r4, r5}
	ldmia r1, {r2-r3}
	mov r4, #0
	mov r5, #0
	stm r0, {r2-r3}

	add r3, r1, #8
	ldmia r3, {r2-r3}
	str r2, [r0, #8]
	str r3, [r0, #12]
	stm r1, {r4-r5}
	str r4, [r1, #8]
	str r5, [r1, #12]

	pop {r4, r5}
	bx lr





uint128_t_operator_cast_bool:
	ldr r1, [r0, #12
	ldm r0, {r2, r3, ip}
	orr r2, ip
	orr r3, r1
	orrs r3, r2, r3

	movne r0, #1
	moveq r0, #0
	bx lr





uint128_t_operator_cast_uint8_t:
	ldrb r0, [r0, #8]
	bx lr





uint128_t_operator_cast_uint16_t:
	ldrh r0, [r0, #8]
	bx lr





uint128_t_operator_cast_uint32_t:
	ldr r0, [r0, #8]
	bx lr





uint128_t_operator_cast_uint64_t:
	add r1, r0, #8
	ldmia r1, {r0-r1}
	bx lr





uint128_t_operator_and:
	ldr ip, [r1, #12]
	push {r4, r5, lr}
	ldr lr, [r2, #8]
	ldr r5, [r2, #12]
	ldr r4, [r1, #8]
	and ip, r5
	and r4, lr
	ldr r5, [r2]
	ldr lr, [r1]
	ldr r2, [r2, #4]
	ldr r1, [r1, #4]
	and lr, r5
	and r1, r2

	str r4, [r0, #8]
	str lr, [r0]
	str r1, [r0, #4]
	str ip, [r0, #12]
	pop {r4, r5, pc}





uint128_t_operator_and_equal:
	ldr ip, [r1, #4]
	ldr r2, [r0, #4]
	push {r4, r5, lr}
	and r2, ip
	ldr r5, [r1]
	str r2, [r0, #4]

	ldr r4, [r1, #8]
	ldr lr, [r1, #12]
	ldr ip, [r0]
	ldr r1, [r0, #8]
	ldr r1, [r0, #12]

	and ip, r5
	and r1, r4
	and r2, lr

	str ip, [r0]
	str r1, [r0, #8]
	str r2, [r0, #12]
	pop {r4, r5, pc}





uint128_t_operator_or:
	ldr ip, [r1, #12]
	push {r4, r5, lr}
	ldr lr, [r2, #8]
	ldr r5, [r2, #12]
	ldr r4, [r1, #8]

	orr ip, r5
	orr r4, lr

	ldr r5, [r2]
	ldr lr, [r1]
	ldr r2, [r2, #4]
	ldr r1, [r1, #4]

	orr lr, r5
	orr r1, r2

	str r4, [r0, #8]
	str lr, [r0]
	str r1, [r0, #4]
	str ip, [r0, #12]

	pop {r4, r5, pc}





uint128_t_operator_or_equal:
	ldr ip, [r1, #4]
	ldr r2, [r0, #4]
	push {r4, r5, lr}
	orr r2, ip

	ldr r5, [r1]
	str r2, [r0, #4]

	ldr r4, [r1, #8]
	ldr lr, [r1, #12]
	ldr ip, [r0]
	ldr r1, [r0, #8]
	ldr r2, [r0, #12]

	orr ip, r5
	orr r1, r4
	orr r2, lr

	str ip, [r0]
	str r1, [r0, #8]
	str r2, [r0, #12]
	pop {r4, r5, pc}





uint128_t_operator_xor:
	ldr ip, [r1, #12]
	push {r4, r5, lr}
	ldr lr, [r2, #8]
	ldr r5, [r2, #12]
	ldr r4, [r1, #8]

	eor ip, r5
	eor r4, lr

	ldr r5, [r2]
	ldr lr, [r1]
	ldr r2, [r2, #4]
	ldr r1, [r1, #4]

	eor lr, r5
	eor r1, r2

	str r4, [r0, #8]
	str lr, [r0]
	str r1, [r0, #4]
	str ip, [r0, #12]
	pop {r4, r5, pc}





uint128_t_operator_xor_equal:
	ldr ip, [r1, #4]
	ldr r2, [r0, #4]
	push {r4, r5, lr}

	eor r2, ip
	ldr r5, [r1]
	str r2, [r0, #4]
	ldr r4, [r1, #8]
	ldr lr, [r1, #12]
	ldr ip, [r0]
	ldr r1, [r0, #8]
	ldr r2, [r0, #12]

	eor ip, r5
	eor r1, r4
	eor r2, lr

	str ip, [r0]
	str r1, [r0, #8]
	str r2, [r0, #12]
	pop {r4, r5, pc}





uint128_t_operator_not:
	ldr r2, [r1, #8]
	ldr r3, [r1, #12]
	ldr ip, [r1]
	ldr r1, [r1, #4]
	str lr, [sp, #-4]!

	mvn ip
	mvn lr, r2
	mvn r1
	mvn r2, r3

	str lr, [r0, #8]
	str ip, [r0]
	str r1, [r0, #4]
	str r2, [r0, #12]
	ldr pc, [sp], #4





uint128_t_operator_shiftLeft:
	ldr r3, [r2, #4]
	ldr ip, [r2]
	push {r4, r5, r6, r7, r8, lr}

	add r7, r2, #8
	ldmia r7, {r6-r7}

	orrs r3, ip, r3
	movne r3, #1
	moveq r3, #0

	cmp r7, #0
	cmpeq r6, #0x7F
	orrhi r3, #1

	cmp r3, #0
	mov r8, r0
	beq .continue

.handle0:
	ldr r1, .uint128_0
	mov r0, r8
	bl uint128_t_constructor

.return:
	mov r0, r8
	pop {r4, r5, r6, r7, r8, pc}

.continue:
	cmp r7, #0
	cmpeq r6, #0x40
	mov r3, r1
	beq .handleStuff

	orrs r2, r6, r7
	beq .doConstruct

	cmp r7, #0
	cmpeq r6, #0x3F
	bhi .doShifts

	ldr r2, [r1, #8]
	rsb lr, r6, #0x40
	ldr r1, [r1, #12]
	ldr r4, [r3]
	ldr r5, [r3, #4]
	rsb ip, lr, #0x20

	lsr r0, r2, lr
	orr r0, r1, lsl ip
	sub ip, lr #0x20

	lsl r3, r5, r6
	orr r0, r1, lsr ip
	sub r5, r6, #0x20

	lsl ip, r1, r6
	lsr r1, lr
	lsl lr, r4, r6
	adds r0, lr, r0
	orr r3, r4, lsl r5
	rsb lr, r6, #0x20
	orr ip, r2, lsl r5
	orr r3, r4, lsr lr
	adc r3, r1
	orr ip, r2, lsr lr

	lsl r6, r2, r6
	stm r8, {r0, r3, r6, ip}
	b .return

.doConstruct:
	bl uint128_t_constructor
	b .return

.handleStuff:
	mov r2, #0
	add r1, #8
	ldmia r1, {r0-r1}

	mov r3, #0
	stm r8, {r0-r1}
	str r2, [r8, #8]
	str r3, [r8, #12]

	mov r0, r8
	pop {r4, r5, r6, r7, r8, pc}

.doShifts:
	subs r4, r6, #0x41
	sbc r5, r7, #0

	cmp r5, #0
	cmpeq r4, #0x3E
	bhi .handle0

	mov r0, #0
	mov r1, #0
	ldr r2, [r3, #12]
	ldr ip, [r3, #8]
	sub lr, r6, #0x40

	lsl r3, r2, lr
	sub r6, #0x60
	orr r3, ip, lsl r6
	rsb r2, lr, #0x20
	orr r3, ip, lsr r2

	lsl ip, lr
	str r0, [r8, #8]
	str r1, [r8, #12]
	str r3, [r8, #4]
	str ip, [r8]
	b .return

.pUint128_0:
	.word uint128_0





uint128_t_operator_shiftLeft_equal:
	push {r4, lr}
	mov r4, r0
	sub sp, #0x10

	mov r2, r1
	mov r0, sp
	mov r1, r4
	bl uint128_t_operator_shiftLeft

	mov r1, sp
	mov r0, r4
	bl uint128_t_operator_equal_const_uint128_t_double_ref

	mov r0, r4
	add sp, #0x10
	pop {r4, pc}





uint128_t_operator_shiftRight:
	ldr r3, [r2, #4]
	ldr ip, [r2]

	push {r4, r5, r6, r7, r8, r9, r0, lr]

	add r10, r2, #8
	ldmia r10, {r9-r10}

	orrs r3, ip, r3
	movne r3, #1
	moveq r3, #0

	cmp r10, #0
	cmpeq r9, #0x7F
	orrhi r3, #1

	cmp r3, #0
	mov r8, r0
	beq .continue

.handle0:
	ldr r1, .pUint128_0
	mov r0, r8
	bl uint128_t_constructor

.return:
	mov r0, r8
	pop {r4, r5, r6, r7, r8, r9, r10, pc}

.continue:
	cmp r10, #0
	cmpeq r9, #0x40
	mov r3, r1
	beq .handleStuff

	orrs r2, r9, r10
	beq .doConstruct

	cmp r10, #0
	cmpeq r9, #0x3F
	bhi .doShifts

	ldr r0, [r3, #4]
	ldr r2, [r1, #8]
	ldr r4, [r3]
	ldr r1, [r1, #12]

	rsb r3, r9, #0x40
	rsb r7, r9, #0x20
	sub r5, r3, #0x20

	lsl lr, r0, r3
	lsr r2, r9
	orr r2, r1, lsl r7
	orr lr, r4, lsl r5

	lsr ip, r4, r9
	sub r5, r9, #0x20
	orr r2, r1, lsr r5
	orr ip, r0, lsl r7
	rsb r7, r3, #0x20

	lsl r3, r4, r3
	adds r2, r3
	orr lr, r4, lsr r7

	lsr r1, r9
	adc r1, lr
	orr ip, r0, lsr r5
	lsr r6, r0, r9

	str r1, [r8, #12]
	str r2, [r8, #8]
	str ip, [r8]
	str r6, [r8, #4]
	b .return

.doConstruct:
	bl uint128_t_constructor
	b .return

.handleStuff:
	mov r0, #0
	mov r1, #0
	stm r8, {r0-r1}
	mov r0, r8
	ldmia r3, {r2-r3}
	str r2, [r8, #8]
	str r3, [r8, #12]
	pop {r4, r5, r6, r7, r8, r9, r10, pc}

.doShifts:
	subs r4, r9, #0x41
	sbc r5, r10, #0

	cmp r5, #0
	cmpeq r4, #0x3E
	bhi .handle0

	ldm r3, {r2, ip}
	mov r0, #0
	mov r1, #0
	sub lr, r9, #0x40

	lsr r3, r2, lr
	rsb r2, lr, #0x20
	orr r3, ip, lsl r2
	sub r6, r9, #0x60
	orr r3, ip, lsr r6

	lsr ip, lr
	stm r8, {r0-r1}
	str r3, [r8, #8]
	str ip, [r8, #12]
	b .return

.pUint128_0:
	.word uint128_0





uint128_t_operator_shiftRight_equal:
	push {r4, lr}
	mov r4, r0
	sub sp, #0x10

	mov r2, r1
	mov r0, sp
	mov r1, r4
	bl uint128_t_operator_shiftRight

	mov r1, sp
	mov r0, r4
	bl uint128_t_operator_equal_const_uint128_t_double_ref

	mov r0, r4
	add sp, #0x10
	pop {r4, pc}





uint128_t_operator_exclamation_mark:
	ldr r1, [r0, #12]
	ldm r0, {r2, r3, ip}
	orr r2, ip
	orr r3, r1
	orrs r3, r2, r3

	moveq r0, #1
	movne r0, #0
	bx lr





uint128_t_operator_and_and:
	push {r4, lr}
	mov r4, r1

	bl uint128_t_operator_cast_bool
	cmp r0, #0
	popeq {r4, pc}

	mov r0, r4
	pop {r4, lr}
	b uint128_t_operator_cast_bool





uint128_t_operator_or_or:
	push {r4, lr}
	mov r4, r1

	bl uint128_t_operator_cast_bool
	cmp r0, #0
	popne {r4, pc}

	mov r0, r4
	pop {r4, lr}
	b uint128_t_operator_cast_bool





uint128_t_operator_equal_equal:
	ldmia r1, {r2-r3}
	push {r4, r5}
	ldmia r0, {r4-r5}

	cmp r5, r3
	cmpeq r4, r2
	movne r0, #0
	bne .return

	add r5, r0, #8
	ldmia r5, {r4-r5}
	add r3, r1, #8
	ldmia r3, {r2-r3}

	cmp r5, r3
	cmpeq r4, r2
	moveq r0, #1
	movne r0, #0

.return:
	pop {r4, r5}
	bx lr





uint128_t_operator_not_equal:
	push {r4, r5, r6, r7}
	ldmia r1, {r2-r3}
	ldmia r0, {r6-r7}
	add r5, r0, #8
	ldmia r5, {r4-r5}

	cmp r7, r3
	cmpeq r6, r2
	movne r0, #1
	add r3, r1, #8
	ldmia r3, {r2-r3}
	moveq r0, #0

	cmp r5, r3
	cmpeq r4, r2

	movne r0, #1
	pop {r4, r5, r6, r7}
	bx lr





uint128_t_operator_above:
	ldmia r1, {r2-r3}
	push {r4, r5}
	ldmia r0, {r4-r5}

	cmp r5, r3
	cmpeq r4, r2
	beq .continue

	pop {r4, r5}
	movhi r0, #1
	movls r0, #0
	bx lr

.continue:
	add r5, r0, #8
	ldmia r5, {r4-r5}
	add r3, r1, #8
	ldmia r3, {r2-r3}

	cmp r5, r3
	cmpeq r4, r2
	movhi r0, #1
	pop {r4, r5}
	movls r0, #0
	bx lr





uint128_t_operator_below:
	ldmia r1, {r2-r3}
	push {r4, r5}
	ldmia r0, {r4-r5}

	cmp r5, r3
	cmpeq r4, r2
	beq .continue

	pop {r4, r5}
	movcc r0, #1
	movcs r0, #0
	bx lr

.continue:
	add r5, r0, #8
	ldmia r5, {r4-r5}
	add r3, r1, #8
	ldmia r3, {r2-r3}

	cmp r5, r3
	cmpeq r4, r2
	movcc r0, #1
	pop {r4, r5}
	movcs r0, #0
	bx lr





uint128_t_operator_above_equal:
	push {r4, r5, r6, lr}
	mov r5, r0
	mov r6, r1

	bl uint128_t_operator_above
	mov r1, r6
	mov r4, r0
	mov r0, r5

	bl uint128_t_operator_equal_equal
	orr r0, r4, r0

	and r0, #0xFF
	pop {r4, r5, r6, pc}





uint128_t_operator_below_equal:
	push {r4, r5, r6, lr}
	mov r5, r0
	mov r6, r1

	bl uint128_t_operator_below
	mov r1, r6
	mov r4, r0
	mov r0, r5

	bl uint128_t_operator_equal_equal
	orr r0, r4, r0

	and r0, #0xFF
	pop {r4, r5, r6, pc}





uint128_t_operator_plus:
	ldr r3, [r1]
	ldr ip, [r2]

	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add r9, r1, #8
	ldmia r9, {r8-r9}

	ldr r6, [r1, #4]
	ldr lr, [r2, #4]

	adds r10, r3, ip
	adc fp, r6, lr
	add r3, r2, #8

	ldmia r3, {r2-r3}
	adds r6, r8, r3
	adcs r7, r9, r3

	movcs r2, #1
	movcc r2, #0

	adds r4, r10, r2
	adc r5, fp, #0

	str r6, [r0, #8]
	str r7, [r0, #12]
	stm r0, {r4-r5}
	pop {r4, r5, r6, r7, r8, r9, r10, fp, pc}





uint128_t_operator_plus_equal:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add r3, r1, #8
	ldmia r3, {r2-r3}
	add r5, r0, #8
	ldmia r5, {r4-r5}

	adds r8, r4, r2
	adcs r9, r5, r3

	movcs lr, #1
	movcc lr, "0

	ldr r2, [r1]
	ldr r3, [r0]
	ldr r1, [r1, #4]
	adds r10, r3, r2
	ldr r3, [r0, #4]

	str r8, [r0, #8]
	str r9, [r0, #12]

	adc fp, r3, r1
	adds r6, r10, lr
	adc r7, fp, #0
	stm r0, {r6-r7}
	pop {r4, r5, r6, r7, r8, r9, r10, fp, pc}





uint128_t_operator_minus:
	ldr ip, [r1]
	ldr r3, [r2]

	push {r4, r5, r6, r7, r8, r9, fp, lr}
	add r7, r1, #8

	ldmia r7, {r6-r7}
	ldr lr, [r1, #4]
	ldr r1, [r2, #4]
	subs r8, ip, r3
	sbc r9, lr, r1
	add ip, r2, #8

	ldmia ip, {fp-ip}
	cmp ip, r7
	cmpeq fp, r6
	movhi r1, #1
	movls r1, #0

	subs r4, r8, r1
	sbc r5, r9, #0

	subs r2, r6, fp
	sbc r3, r7, ip

	stm r0, {r4-r5}
	str r2, [r0, #8]
	str r3, [r0, #12]
	pop {r4, r5, r6, r7, r8, r9, fp, pc}





uint128_t_operator_minus_equal:
	push {r4, lr}
	mov r4, r0
	sub sp, #0x10

	mov r2, r1
	mov r0, sp
	mov r1, r4
	bl uint128_t_operator_minus

	mov r1, sp
	mov r0, r4
	bl uint128_t_operator_equal_const_uint128_t_double_ref

	mov r0, r4
	add sp, #0x10
	pop {r4, pc}





uint128_t_operator_multiply:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr r5, [r1, #8]
	ldr lr, [r2, #8]
	ldr ip, [r2, #12]

	umull r6, r7, r5, lr
	umull r8, r9, r5, ip

	sub sp, #44
	str ip, [sp, #4]
	ldr ip, [r1, #12]
	str lr, [sp, #24]
	umull r10, fp, ip, lr

	mov lr, r8
	mov ip, r7
	mov r3, #0
	str r6, [sp, #16]
	str r7, [sp, #20]

	mov r6, r10
	str r9, [sp, #28]
	ldr r10, [sp, #4]
	ldr r9, [r1, #12]
	adds ip, lr, ip
	umull r7, r8, r9, r10

	ldr lr, [r1]
	mov r10, r7
	ldr r7, [sp, #24]
	str fp, [sp, #32]
	mov fp, r8
	umull r8, r9, lr, r7

	ldr r4, [r2]
	str r8, [sp, #8]
	str r9, [sp, #12]
	umull r7, r8, r5, r4

	adc lr, r3, r3
	adds r6, ip

	mov ip, r7
	mov r9, r8
	mov r8, fp

	ldr fp, [r2, #4]
	ldr r2, [sp, #28]

	adc lr, r3, lr
	adds ip, r2

	mov r2, fp
	mul r2, r5, r2

	ldr r5, [r1, #12]
	ldr r7, [sp, #8]
	mul r5, r4, r5

	mov r4, r5
	adc r5, r3, r3

	ldr fp, [sp, #4]
	adds ip, r10

	ldr r10, [r1]
	str r7, [sp, #36]
	mul fp, r10, fp

	ldr r10, [r1, #4]
	ldr r1, [sp, #36]
	adc r5, r3
	adds ip, r1, ip

	ldr r1, [sp, #24]
	adc r5, r3, r5
	adds r2, r9
	adds r2, r4
	mul r1, r10, r1

	ldr r7, [sp, #12]
	adds r8, r2, r8
	adds fp, r8, fp
	adds fp, r7
	adds fp, r1, fp
	adc r5, r3, r5

	ldr r2, [sp, #16]
	adds r5, fp
	str r5, [r0, #4]
	str ip, [r0]
	str r6, [r0, #12]
	str r2, [r0, #8]

	add sp, #44
	pop {r4, r5, r6, r7, r8, r9, r10, fp, pc}





uint128_t_operator_multiply_equal:
	push {r4, lr}
	mov r4, r0
	sub sp, #0x10

	mov r2, r1
	mov r0, sp
	mov r1, r4
	bl uint128_t_operator_multiply

	mov r1, sp
	mov r0, r4
	bl uint128_t_operator_equal_const_uint128_t_double_ref

	mov r0, r4
	add sp, #0x10
	pop {r4, pc}





uint128_t_divmod:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr r1, .pUint128_1
	mov r4, r0
	sub sp, #76

	mov r0, r3
	mov r6, r2
	mov r5, r3
	bl uint128_t_operator_equal_equal

	cmp r0, #0
	add r7, r4, #0x10
	movne r1, r6
	bne .handle0

	mov r1, r5
	mov r0, r6
	bl uint128_t_operator_equal_equal

	cmp r0, #0
	beq .check0

	ldr r1, .pUint128_1

.handle0:
	mov r0, r4
	bl uint128_t_constructor

	mov r0, r7
	ldr r1, .pUint128_0
	bl uint128_t_constructor

.return:
	mov r0, r4
	add sp, #76
	pop {r4, r5, r6, r7, r8, r9, r10, fp, pc}

.check0:
	ldr r1, .pUint128_0
	mov r0, r6
	bl uint128_t_operator_equal_equal

	cmp r0, #0
	beq .checkBelow

.handle02:
	ldr r1, .pUint128_0
	mov r0, r4
	bl uint128_t_constructor

	mov r1, r6
	mov r0, r7
	bl uint128_t_constructor

	mov r0, r4
	add sp, #76
	pop {r4, r5, r6, r7, r8, r9, r10, fp, pc}

.checkBelow:
	mov r1, r5
	mov r0, r6
	bl uint128_t_operator_below

	subs r9, r0, #0
	bne .handle02

	ldr r1, .pUint128_0
	add r0, sp, #40
	bl uint128_t_constructor

	ldr r1, .pUint128_0
	add r0, sp, #56
	call uint128_t_constructor

	mov r0, r6
	bl uint128_t_bits

	cmp r0, #0
	beq .doMoves

	sub r8, r0, #1
	and fp, r8, #0xFF
	sub r0, #2

	ldr r10, .pUint128_1
	sub fp, r0, fp
	stm sp, {r6, r7}
	b .doShifts

.checkAboveEqual:
	mov r1, r5
	add r0, sp, #56
	bl uint128_t_operator_above_equal

	cmp r0, #0
	bne .doSubtract

.doComp:
	cmp r8, fp
	beq .doLdr

.doShifts:
	mov r6, #0
	mov r7, #0
	mov r1, r10
	add r0, sp, #40
	bl uint128_t_operator_shiftLeft_equal

	mov r1, r10
	add r0, sp, #56
	bl uint128_t_operator_shiftLeft_equal

	add r2, sp, #24
	ldr r1, [sp]
	add r0, sp, #8

	str r8, [sp, #32]
	str r6, [sp, #24]
	str r7, [sp, #28]
	str r9, [sp, #36]
	bl uint128_t_operator_shiftRight

	ldr r3, [sp, #16]
	add r0, sp, #24
	and r3, #1

	str r6, [sp, #24]
	str r7, [sp, #28]
	str r9, [sp, #36]
	str r3, [sp, #32]
	bl uint128_t_operator_cast_bool

	cmp r0, #0
	sub r8, #1
	beq .checkAboveEqual

	add r0, sp, #56
	bl uint128_t_operator_plus_plus
	b .checkAboveEqual

.doSubtract:
	mov r1, r5
	add r0, sp, #56
	bl uint128_t_operator_minus_equal

	add r0, sp, #40
	bl uint128_t_operator_plus_plus
	b .doComp

.doLdr:
	ldr r7, [sp, #4]

.doMoves:
	add r1, sp, #40
	mov r0, r4
	bl uint128_t_constructor_uint128_t_double_ref

	mov r1, sp, #56
	mov r0, r7
	bl uint128_t_constructor_uint128_t_double_ref
	b .return

.pUint128_0:
	.word uint128_0

.pUint128_1:
	.word uint128_1





uint128_t_operator_divide:
	push {r4, lr}
	mov r4, r0
	sub sp, #0x20

	mov r3, r2
	mov r0, sp
	mov r2, r1
	call uint128_t_divmod

	mov r1, sp
	mov r0, r4
	call uint128_t_constructor_uint128_t_double_ref

	mov r0, r4
	add sp, #0x20
	pop {r4, pc}





uint128_t_operator_divide_equal:
	push {r4, lr}
	mov r4, r0
	sub sp, #0x10

	mov r2, r1
	mov r0, sp
	mov r1, r4
	bl uint128_t_operator_divide

	mov r1, sp
	mov r0, r4
	bl uint128_t_operator_equal_const_uint128_t_double_ref

	mov r0, r4
	add sp, #0x10
	pop {r4, pc}





uint128_t_operator_modulo:
	push {r4, lr}
	mov r4, r0
	sub sp, #0x20

	mov r3, r2
	mov r0, sp
	mov r2, r1
	bl uint128_t_divmod

	mov r0, r4
	add r1, sp, #0x10
	bl uint128_t_constructor_uint128_t_double_ref

	mov r0, r4
	add sp, #0x20
	pop {r4, pc}





uint128_t_operator_modulo_equal:
	push {r4, lr}
	mov r4, r0
	sub sp, #0x10

	mov r2, r1
	mov r0, sp
	mov r1, r4
	bl uint128_t_operator_modulo

	mov r1, sp
	mov r0, r4
	bl uint128_t_operator_equal_const_uint128_t_double_ref

	mov r0, r4
	add sp, #0x10
	pop {r4, pc}





uint128_t_operator_plus_plus:
	ldr r1, .pUint128_1
	b uint128_t_operator_plus_equal

.pUint128_1:
	.word uint128_1





uint128_t_operator_plus_plus_int:
	push {r4, r5, r6, lr}
	mov r5, r1
	mov r4, r0

	bl uint128_t_constructor

	mov r0, r5
	bl uint128_t_operator_plus_plus

	mov r0, r4
	pop {r4, r5, r6, pc}





uint128_t_operator_minus_minus:
	ldr r1, .pUint128_1
	b uint128_t_operator_minus_equal

.pUint128_1:
	.word uint128_1





uint128_t_operator_minus_minus_int:
	push {r4, r5, r6, lr}
	mov r5, r1
	mov r4, r0

	bl uint128_t_constructor

	mov r0, r5
	bl uint128_t_operator_minus_minus

	mov r0, r4
	pop {r4, r5, r6, pc}





uint128_t_operator_single_plus:
	push {r4, lr}
	mov r4, r0

	bl uint128_t_constructor

	mov r0, r4
	pop {r4, pc}





uint128_t_operator_single_minus:
	push {r4, lr}
	mov r4, r0
	sub sp, #0x10

	mov r0, sp
	bl uint128_t_operator_not

	mov r0, r4
	mov r1, sp
	ldr r2, .pUint128_1
	bl uint128_t_operator_plus

	mov r0, r4
	add sp, #0x10
	pop {r4, pc}





uint128_t_upper:
	bx lr





uint128_t_lower:
	add r0, #8
	bx lr





uint128_t_bits:
	ldmia r0, {r2-r3}
	orrs r1, r2, r3
	bne .continue

	add r1, r0, #8
	ldmia r1, {r0-r1}
	orrs r3, r0, r1
	bne .continue2

	mov r0, #0
	bx lr

.continue:
	cmp r1, #0
	clzeq r0
	clzne r0, r1
	addeq r0, #0x20
	rsb r0, #0x40
	and r0, #0xFF
	bx lr

.continue2:
	cmp r3, #0
	clzeq r2
	clzne r2, r3

	mvn r0, #0x7F
	addeq r2, #0x20
	sub r0, r2
	and r0, #0xFF
	bx lr
