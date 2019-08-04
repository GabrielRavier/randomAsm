.include "standard.inc"

	.bss

uint128_0:
	.zero 16

	.data

uint128_1:
	.quad 0, 1

	.text

.macro instr128 addr, reg1, reg2, reg3, reg4, instr
	\instr \reg1, [\addr]
	\instr \reg2, [\addr, #4]
	\instr \reg3, [\addr, #8]
	\instr \reg4, [\addr, #12]
.endm

.macro ldr128 addr, reg1, reg2, reg3, reg4
	instr128 \addr, \reg1, \reg2, \reg3, \reg4, ldr
.endm

.macro str128 addr, reg1, reg2, reg3, reg4
	instr128 \addr, \reg1, \reg2, \reg3, \reg4, str
.endm

uint128_t_constructor_default:
	push {r4, r5}

	multiZero r4, r5

	stm r0, {r4-r5}
	multiStr "r4, [r0, #8]", "r5, [r0, #12]"

	pop {r4, r5}
	bx lr





uint128_t_constructor:
	push {r4, r5}
	add r3, r1, #8
	ldmia r3, {r2-r3}
	ldmia r1, {r4-r5}
	stm r0, {r4-r5}
	pop {r4, r5}

	multiStr "r2, [r0, #8]", "r3, [r0, #12]"
	bx lr





uint128_t_constructor_uint128_t_double_ref:
	ldmia r1, {r2-r3}
	stm r0, {r2-r3}

	cmp r0, r1
	add r3, r1, #8
	ldmia r3, {r2-r3}
	multiStr "r2, [r0, #8]", "r3, [r0, #12]"
	bxeq lr

	multiZero r2, r3
	stm r1, {r2-r3}
	multiStr "r2, [r1, #8]", "r3, [r1, #12]"
	bx lr





uint128_t_operator_equal:
	push {r4, r5}
	add r3, r1, #8

	ldmia r3, {r2-r3}
	ldmia r1, {r4-r5}
	stm r0, {r4-r5}
	pop {r4, r5}

	multiStr "r2, [r0, #8]", "r3, [r0, #12]"
	bx lr





uint128_t_operator_equal_const_uint128_t_double_ref:
	cmp r0, r1
	bxeq lr

	push {r4, r5}
	ldmia r1, {r2-r3}
	multiZero r4, r5
	stm r0, {r2-r3}

	add r3, r1, #8
	ldmia r3, {r2-r3}
	multiStr "r2, [r0, #8]", "r3, [r0, #12]"
	stm r1, {r4-r5}
	multiStr "r4, [r1, #8]", "r5, [r1, #12]"

	pop {r4, r5}
	bx lr





uint128_t_operator_cast_bool:
	ldr r1, [r0, #12
	ldm r0, {r2, r3, ip}
	orr r2, ip
	orr r3, r1
	orrs r3, r2, r3

	movEqNe r0, #0, #1
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
	multiLdr "lr, [r2, #8]", "r5, [r2, #12"], "r4, [r1, #8]"
	and ip, r5
	and r4, lr
	multiLdr "r5, [r2]", "lr, [r1]", "r2, [r2, #4]", "r1, [r1, #4]"
	and lr, r5
	and r1, r2

	str128 r0, lr, r1, r4, ip
	pop {r4, r5, pc}





uint128_t_operator_and_equal:
	multiLdr "ip, [r1, #4]", "r2, [r0, #4]"
	push {r4, r5, lr}
	and r2, ip
	ldr r5, [r1]
	str r2, [r0, #4]

	multiLdr "r4, [r1, #8]", "lr, [r1, #12]", "ip, [r0]", "r1, [r0, #8]", "r1, [r0, #12]"

	and ip, r5
	and r1, r4
	and r2, lr

	multiStr "ip, [r0]", "r1, [r0, #8]", "r2, [r0, #12]"
	pop {r4, r5, pc}





uint128_t_operator_or:
	ldr ip, [r1, #12]
	push {r4, r5, lr}
	multiLdr "lr, [r2, #8]", "r5, [r2, #12]", "r4, [r1, #8]"

	orr ip, r5
	orr r4, lr

	multiLdr "r5, [r2]", "lr, [r1]", "r2, [r2, #4]", "r1, [r1, #4]"

	orr lr, r5
	orr r1, r2

	str128 r0, lr, r1, r4, ip

	pop {r4, r5, pc}





uint128_t_operator_or_equal:
	multiLdr "ip, [r1, #4]", "r2, [r0, #4]"
	push {r4, r5, lr}
	orr r2, ip

	ldr r5, [r1]
	str r2, [r0, #4]

	multiLdr "r4, [r1, #8]", "lr, [r1, #12]", "ip, [r0]", "r1, [r0, #8]", "r2, [r0, #12]"

	orr ip, r5
	orr r1, r4
	orr r2, lr

	multiStr "ip, [r0]", "r1, [r0, #8]", "r2, [r0, #12]"
	pop {r4, r5, pc}





uint128_t_operator_xor:
	ldr ip, [r1, #12]
	push {r4, r5, lr}
	multiLdr "lr, [r2, #8]", "r5, [r2, #12]", "r4, [r1, #8]"

	eor ip, r5
	eor r4, lr

	multiLdr "r5, [r2]", "lr, [r1]", "r2, [r2, #4]", "r1, [r1, #4]"

	eor lr, r5
	eor r1, r2

	str128 r0, lr, r1, r4, ip
	pop {r4, r5, pc}





uint128_t_operator_xor_equal:
	multiLdr "ip, [r1, #4]", "r2, [r0, #4]"
	push {r4, r5, lr}

	eor r2, ip
	ldr r5, [r1]
	str r2, [r0, #4]
	multiLdr "r4, [r1, #8]", "lr, [r1, #12]", "ip, [r0]", "r1, [r0, #8]", "r2, [r0, #12]"

	eor ip, r5
	eor r1, r4
	eor r2, lr

	multiStr "ip, [r0]", "r1, [r0, #8]", "r2, [r0, #12]"
	pop {r4, r5, pc}





uint128_t_operator_not:
	ldr128 r1, ip, r1, r2, r3
	str lr, [sp, #-4]!

	mvn ip
	mvn lr, r2
	mvn r1
	mvn r2, r3

	str128 r0, ip, r1, lr, r2
	ldr pc, [sp], #4





uint128_t_operator_shiftLeft:
	multiLdr "r3, [r2, #4]", "ip, [r2]"
	push {r4, r5, r6, r7, r8, lr}

	add r7, r2, #8
	ldmia r7, {r6-r7}

	orrs r3, ip, r3
	movEqNe r3, #0, #1

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
	multiLdr "r1, [r1, #12]", "r4, [r3]", "r5, [r3, #4]"
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
	multiStr "r2, [r8, #8]", "r3, [r8, #12]"

	mov r0, r8
	pop {r4, r5, r6, r7, r8, pc}

.doShifts:
	subs r4, r6, #0x41
	sbc r5, r7, #0

	cmp r5, #0
	cmpeq r4, #0x3E
	bhi .handle0

	multiZero r0, r1
	multiLdr "r2, [r3, #12]", "ip, [r3, #8]"
	sub lr, r6, #0x40

	lsl r3, r2, lr
	sub r6, #0x60
	orr r3, ip, lsl r6
	rsb r2, lr, #0x20
	orr r3, ip, lsr r2

	lsl ip, lr
	str128 r8, ip, r3, r0, r1
	b .return

.pUint128_0:
	.word uint128_0





.macro makeOperatorEqual funcName, funcNameEq

\funcNameEq:
	push {r4, lr}
	mov r4, r0
	sub sp, #0x10

	multiMov "r2, r1", "r0, sp", "r1, r4"
	bl \funcName

	multiMov "r1, sp", "r0, r4"
	bl uint128_t_operator_equal_const_uint128_t_double_ref

	mov r0, r4
	add sp, #0x10
	pop {r4, pc}

.endm

	makeOperatorEqual uint128_t_operator_shiftLeft, uint128_t_operator_shiftLeft_equal





uint128_t_operator_shiftRight:
	multiLdr "r3, [r2, #4]", "ip, [r2]"

	push {r4, r5, r6, r7, r8, r9, r0, lr]

	add r10, r2, #8
	ldmia r10, {r9-r10}

	orrs r3, ip, r3
	movEqNe r3, #0, #1

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

	multiLdr "r0, [r3, #4]", "r2, [r1, #8]", "r4, [r3]", "r1, [r1, #12]"

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

	str128 r8, ip, r6, r2, r1
	b .return

.doConstruct:
	bl uint128_t_constructor
	b .return

.handleStuff:
	multiZero r0, r1
	stm r8, {r0-r1}
	mov r0, r8
	ldmia r3, {r2-r3}
	multiStr "r2, [r8, #8]", "r3, [r8, #12]"
	pop {r4, r5, r6, r7, r8, r9, r10, pc}

.doShifts:
	subs r4, r9, #0x41
	sbc r5, r10, #0

	cmp r5, #0
	cmpeq r4, #0x3E
	bhi .handle0

	ldm r3, {r2, ip}
	multiZero r0, r1
	sub lr, r9, #0x40

	lsr r3, r2, lr
	rsb r2, lr, #0x20
	orr r3, ip, lsl r2
	sub r6, r9, #0x60
	orr r3, ip, lsr r6

	lsr ip, lr
	stm r8, {r0-r1}
	multiStr "r3, [r8, #8]", "ip, [r8, #12]"
	b .return

.pUint128_0:
	.word uint128_0





	makeOperatorEqual uint128_t_operator_shiftRight, uint128_t_operator_shiftRight_equal





uint128_t_operator_exclamation_mark:
	ldr r1, [r0, #12]
	ldm r0, {r2, r3, ip}
	orr r2, ip
	orr r3, r1
	orrs r3, r2, r3

	movEqNe r0, #1, #0
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
	movEqNe r0, #1, #0

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
	movHiLs r0, #1, #0
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





.macro makeCompareEqual funcName, funcNameEq

\funcNameEq:
	push {r4, r5, r6, lr}
	multiMov "r5, r0", "r6, r1"

	bl \funcName
	multiMov "r1, r6", "r4, r0", "r0, r5"

	bl uint128_t_operator_equal_equal
	orr r0, r4, r0

	and r0, #0xFF
	pop {r4, r5, r6, pc}

.endm

	makeCompareEqual uint128_t_operator_above, uint128_t_operator_above_equal
	makeCompareEqual uint128_t_operator_below, uint128_t_operator_below_equal





uint128_t_operator_plus:
	multiLdr "r3, [r1]", "ip, [r2]"

	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add r9, r1, #8
	ldmia r9, {r8-r9}

	multiLdr "r6, [r1, #4]", "lr, [r2, #4]"

	adds r10, r3, ip
	adc fp, r6, lr
	add r3, r2, #8

	ldmia r3, {r2-r3}
	adds r6, r8, r3
	adcs r7, r9, r3

	movCcCs r2, #0, #1

	adds r4, r10, r2
	adc r5, fp, #0

	multiStr "r6, [r0, #8]", "r7, [r0, #12]"
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

	movCcCs lr, #0, #1

	multiLdr "r2, [r1]", "r3, [r0]", "r1, [r1, #4]"
	adds r10, r3, r2
	ldr r3, [r0, #4]

	multiStr "r8, [r0, #8]", "r9, [r0, #12]"

	adc fp, r3, r1
	adds r6, r10, lr
	adc r7, fp, #0
	stm r0, {r6-r7}
	pop {r4, r5, r6, r7, r8, r9, r10, fp, pc}





uint128_t_operator_minus:
	multiLdr "ip, [r1]", "r3, [r2]"

	push {r4, r5, r6, r7, r8, r9, fp, lr}
	add r7, r1, #8

	ldmia r7, {r6-r7}
	multiLdr "lr, [r1, #4]", "r1, [r2, #4]"
	subs r8, ip, r3
	sbc r9, lr, r1
	add ip, r2, #8

	ldmia ip, {fp-ip}
	cmp ip, r7
	cmpeq fp, r6
	movHiLs r1, #1, #0

	subs r4, r8, r1
	sbc r5, r9, #0

	subs r2, r6, fp
	sbc r3, r7, ip

	stm r0, {r4-r5}
	multiStr "r2, [r0, #8]", "r3, [r0, #12]"
	pop {r4, r5, r6, r7, r8, r9, fp, pc}





	makeOperatorEqual uint128_t_operator_minus, uint128_t_operator_minus_equal





uint128_t_operator_multiply:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	multiLdr "r5, [r1, #8]", "lr, [r2, #8]", "ip, [r2, #12]"

	umull r6, r7, r5, lr
	umull r8, r9, r5, ip

	sub sp, #44
	str ip, [sp, #4]
	ldr ip, [r1, #12]
	str lr, [sp, #24]
	umull r10, fp, ip, lr

	multiMov "lr, r8", "ip, r7", "r3, #0"
	multiStr "r6, [sp, #16]", "r7, [sp, #20]"

	mov r6, r10
	str r9, [sp, #28]
	multiLdr "r10, [sp, #4]", "r9, [r1, #12]"
	adds ip, lr, ip
	umull r7, r8, r9, r10

	ldr lr, [r1]
	mov r10, r7
	ldr r7, [sp, #24]
	str fp, [sp, #32]
	mov fp, r8
	umull r8, r9, lr, r7

	ldr r4, [r2]
	multiStr "r8, [sp, #8]", "r9, [sp, #12]"
	umull r7, r8, r5, r4

	adc lr, r3, r3
	adds r6, ip

	multiMov "ip, r7", "r9, r8", "r8, fp"

	multiLdr "fp, [r2, #4]", "r2, [sp, #28]"

	adc lr, r3, lr
	adds ip, r2

	mov r2, fp
	mul r2, r5, r2

	multiLdr "r5, [r1, #12]", "r7, [sp, #8]"
	mul r5, r4, r5

	mov r4, r5
	adc r5, r3, r3

	ldr fp, [sp, #4]
	adds ip, r10

	ldr r10, [r1]
	str r7, [sp, #36]
	mul fp, r10, fp

	multiLdr "r10, [r1, #4]", "r1, [sp, #36]"
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
	str128 r0, ip, r5, r2, r6

	add sp, #44
	pop {r4, r5, r6, r7, r8, r9, r10, fp, pc}





	makeOperatorEqual uint128_t_operator_multiply, uint128_t_operator_multiply_equal





uint128_t_divmod:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr r1, .pUint128_1
	mov r4, r0
	sub sp, #76

	multiMov "r0, r3", "r6, r2", "r5, r3"
	bl uint128_t_operator_equal_equal

	cmp r0, #0
	add r7, r4, #0x10
	movne r1, r6
	bne .handle0

	multiMov "r1, r5", "r0, r6"
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

	multiMov "r1, r6", "r0, r7"
	bl uint128_t_constructor

	mov r0, r4
	add sp, #76
	pop {r4, r5, r6, r7, r8, r9, r10, fp, pc}

.checkBelow:
	multiMov "r1, r5", "r0, r6"
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
	multiZero r6, r7
	mov r1, r10
	add r0, sp, #40
	bl uint128_t_operator_shiftLeft_equal

	mov r1, r10
	add r0, sp, #56
	bl uint128_t_operator_shiftLeft_equal

	add r2, sp, #24
	ldr r1, [sp]
	add r0, sp, #8

	multiStr "r8, [sp, #32]", "r6, [sp, #24]", "r7, [sp, #28]", "r9, [sp, #36]"
	bl uint128_t_operator_shiftRight

	ldr r3, [sp, #16]
	add r0, sp, #24
	and r3, #1

	multiStr "r6, [sp, #24]", "r7, [sp, #28]", "r9, [sp, #36]", "r3, [sp, #32]"
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

	multiMov "r1, [sp, #56]", "r0, r7"
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

	multiMov "r3, r2", "r0, sp", "r2, r1"
	call uint128_t_divmod

	multiMov "r1, sp", "r0, r4"
	call uint128_t_constructor_uint128_t_double_ref

	mov r0, r4
	add sp, #0x20
	pop {r4, pc}





	makeOperatorEqual uint128_t_operator_divide, uint128_t_operator_divide_equal





uint128_t_operator_modulo:
	push {r4, lr}
	mov r4, r0
	sub sp, #0x20

	multiMov "r3, r2", "r0, sp", "r2, r1"
	bl uint128_t_divmod

	mov r0, r4
	add r1, sp, #0x10
	bl uint128_t_constructor_uint128_t_double_ref

	mov r0, r4
	add sp, #0x20
	pop {r4, pc}





	makeOperatorEqual uint128_t_operator_modulo, uint128_t_operator_modulo_equal





.macro makePPMM funcName, callName

\funcName:
	ldr r1, .pUint128_1
	b \callName

.pUint128_1:
	.word uint128_1

.endm

.macro makePPIMMI funcName, callName

\funcName:
	push {r4, r5, r6, lr}
	mov r5, r1
	mov r4, r0

	bl uint128_t_constructor

	mov r0, r5
	bl \callName

	mov r0, r4
	pop {r4, r5, r6, pc}

.endm

	makePPMM uint128_t_operator_plus_plus, uint128_t_operator_plus_equal
	makePPIMMI uint128_t_operator_plus_plus_int, uint128_t_operator_plus_plus
	makePPMM uint128_t_operator_minus_minus, uint128_t_operator_minus_equal
	makePPIMMI uint128_t_operator_minus_minus_int, uint128_t_operator_minus_minus





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

	multiMov "r0, r4", "r1, sp"
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
