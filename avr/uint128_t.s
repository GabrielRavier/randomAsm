.include "standard.inc"

	.bss

uint128_0:
	.zero 16

	.data

uint128_1:
	.quad 0, 1

	.text

uint128_t_constructor_default:
	movw r30, r24
	st Z, __zero_reg__
	multiStdZR Z+1, Z+2, Z+3, Z+4, Z+5, Z+6, Z+7, Z+8, Z+9, Z+10, Z+11, Z+12, Z+13, Z+14, Z+15
	ret





uint128_t_constructor:
uint128_t_operator_equal:
	movw r30, r24
	movw r28, r22

	.irp reg, r23, r22, r21, r20, r19, r18, r25

		ld \reg, X
		adiw r26, 1

	.endr

	ld r24, X

	st Z, r23
	std Z+1, r22
	std Z+2, r21
	std Z+3, r20
	std Z+4, r19
	std Z+5, r18
	std Z+6, r25
	std Z+7, r24

	.irp reg, r23, r22, r21, r20, r19, r18, r25, r24

		adiw r26, 1
		ld \reg, X

	.endr

	std Z+8, r23
	std Z+9, r22
	std Z+10, r21
	std Z+11, r20
	std Z+12, r19
	std Z+13, r18
	std Z+14, r25
	std Z+15, r24
	ret





uint128_t_constructor_uint128_t_double_ref:
	movw r26, r24
	movw r30, r22

	ld r23, Z
	ldd r22, Z+1
	ldd r21, Z+2
	ldd r20, Z+3
	ldd r19, Z+4
	ldd r18, Z+5
	ldd r25, Z+6
	ldd r24, Z+7

	.irp reg, r23, r22, r21, r20, r19, r18, r25, r26

		st X, \reg
		adiw r26, 1

	.endr

	ldd r23, Z+8
	ldd r22, Z+9
	ldd r21, Z+10
	ldd r20, Z+11
	ldd r19, Z+12
	ldd r18, Z+13
	ldd r25, Z+14
	ldd r24, Z+15

	.irp reg, r23, r22, r21, r20, r19, r18, r25, r24

		st X, \reg
		adiw r26, 1

	.endr

	cp r30, r26
	cpc r31, r27
	breq .return

	st Z, __zero_reg__
	multiStdZR Z+1, Z+2, Z+3, Z+4, Z+5, Z+6, Z+7, Z+8, Z+9, Z+10, Z+11, Z+12, Z+13, Z+14, Z+15

.return:
	ret





uint128_t_operator_equal_const_uint128_t_double_ref:
	movw r26, r24
	movw r30, r22

	cp r24, r22
	cpc r25, r23
	brne .+2
	rjmp .return

	ld r23, Z
	ldd r22, Z+1
	ldd r21, Z+2
	ldd r20, Z+3
	ldd r19, Z+4
	ldd r18, Z+5
	ldd r25, Z+6
	ldd r24, Z+7

	.irp reg, r23, r22, r21, r20, r19, r18, r25

		st X, \reg
		adiw r26, 1

	.endr

	st X, r24

	ldd r23, Z+8
	ldd r22, Z+9
	ldd r21, Z+10
	ldd r20, Z+11
	ldd r19, Z+12
	ldd r18, Z+13
	ldd r25, Z+14
	ldd r24, Z+15

	adiw r26, 2

	.irp reg, r23, r22, r21, r20, r19, r18, r25

		st X, \reg
		adiw r26, 1

	.endr

	st X, r24
	sbiw r26, 15

	st Z, __zero_reg__
	multiStdZR Z+1, Z+2, Z+3, Z+4, Z+5, Z+6, Z+7, Z+8, Z+9, Z+10, z+11, Z+12, Z+13, Z+14, Z+15

.return:
	movw r24, r26
	ret





.macro doBoolIter reg, offset1, offset2

	ldd \reg, Z+\offset1
	ldd r24, Z+\offset2
	or \reg, r24

.endm

uint128_t_operator_cast_bool:
	movw r30, r24

	ld r18, Z
	ldd r24, Z+8
	or r18, r24

	doBoolIter r19, 1, 9
	doBoolIter r20, 2, 10
	doBoolIter r21, 3, 11
	doBoolIter r22, 4, 12
	doBoolIter r23, 5, 13

	ldd r27, Z+6
	ldd r24, Z+14
	ldd r26, Z+7
	ldd r25, Z+15
	ldi r30, lo8(1)
	or r24, r27
	or r25, r26

	ldi r26, 0
	call __cmpdi2_s8
	breq .ret0

	mov r24, r30
	ret

.ret0:
	ldi r30, 0
	mov r24, r30
	ret





uint128_t_operator_cast_uint8_t:
	movw r30, r24
	ldd r24, Z+8
	ret





uint128_t_operator_cast_uint16_t:
	movw r30, r24
	ldd r24, Z+8
	ldd r25, Z+9
	ret





uint128_t_operator_cast_uint32_t:
	movw r30, r24
	ldd r22, Z+8
	ldd r23, Z+9
	ldd r24, Z+10
	ldd r25, Z+11
	ret





uint128_t_operator_cast_uint64_t:
	movw r30, r24
	ldd r18, Z+8
	ldd r19, Z+9
	ldd r20, Z+10
	ldd r21, Z+11
	ldd r22, Z+12
	ldd r23, Z+13
	ldd r24, Z+14
	ldd r25, Z+15
	ret





.macro doBinOpIterMaker instr, reg1, offset, reg2

	ldd \reg1, Y+\offset
	adiw r26, 1
	ld \reg2, X
	instr \reg1, \reg2

.endm

.macro doBinOpIter instr, reg, offset

	doBinOpIterMaker \instr, \reg, \offset, r24

.endm

.macro doBinOpIter2 instr, reg, offset

	doBinOpIterMaker \instr, \reg, \offset, r17

.endm

.macro binOpBuilder funcName, instr

\funcName:
	multiPush r10, r11, r12, r13, r14, r15, r16, r17, r28, r29

	movw r30, r24
	movw r28, r22
	movw r26, r20

	ldd r23, Y+8
	adiw r26, 8
	ld r24, X
	\instr r23, r24

	doBinOpIter \instr, r22, 9
	doBinOpIter \instr, r21, 10
	doBinOpIter \instr, r20, 11
	doBinOpIter \instr, r19, 12
	doBinOpIter \instr, r18, 13
	doBinOpIter \instr, r25, 14
	doBinOpIter \instr, r17, 15

	sbiw r16, 15
	ld r11, Y
	ld r17, X
	\instr r11, r17

	doBinOpIter2 \instr, r12, 1
	doBinOpIter2 \instr, r13, 2
	doBinOpIter2 \instr, r14, 3
	doBinOpIter2 \instr, r15, 4
	doBinOpIter2 \instr, r16, 5

	ldd r10, Y+6
	adiw r26, 1
	ld r17, X
	\instr r17, r10

	doBinOpIterMaker \instr, r28, 7, r26

	st Z, r11
	std Z+1, r12
	std Z+2, r13
	std Z+3, r14
	std Z+4, r15
	std Z+5, r16
	std Z+6, r17
	std Z+7, r26
	std Z+8, r23
	std Z+9, r22
	std Z+10, r21
	std Z+11, r20
	std Z+12, r19
	std Z+13, r18
	std Z+14, r25
	std Z+15, r24

	movw r24, r30
	multiPop r29, r28, r17, r16, r15, r14, r13, r12, r11, r10
	ret

.endm

.macro makeOperatorEqual funcName, funcNameWithEq

\funcNameWithEq:
	multiPush r16, r17, r28, r29

	doSPProlog 0x10

	movw r16, r24
	movw r20, r22
	movw r22, r24
	movw r24, r28
	adiw r24, 1
	call \funcName

	movw r22, r28
	subi r22, -1
	sbci r23, -1
	movw r24, r16
	call uint128_t_operator_equal_const_uint128_t_double_ref

	movw r24, r16

	doSPEpilog 0x10

	pop r29
	pop r28
	pop r17
	pop r16
	ret

.endm

	binOpBuilder uint128_t_operator_and, and
	makeOperatorEqual uint128_t_operator_and, uint128_t_operator_and_equal
	binOpBuilder uint128_t_operator_or, or
	makeOperatorEqual uint128_t_operator_or, uint128_t_operator_or_equal
	binOpBuilder uint128_t_operator_xor, eor
	makeOperatorEqual uint128_t_operator_xor, uint128_t_operator_xor_equal





uint128_t_operator_not:
	multiPush r13, r14, r15, r16, r17, r28, r29

	movw r30, r24
	movw r26, r22

	adiw r26, 8
	ld r23, X
	com r23

	.irp reg, r22, r21, r20, r19, r18, r25, r24

		adiw r26, 1
		ld \reg, X
		com \reg

	.endr

	sbiw r26, 15
	ld r13, X
	com r13

	.irp reg, r14, r15, r16, r17, r29, r26

		adiw r26, 1
		ld \reg, X
		com \reg

	.endr

	st Z, r13
	std Z+1, r14
	std Z+2, r15
	std Z+3, r16
	std Z+4, r17
	std Z+5, r29
	std Z+6, r28
	std Z+7, r26
	std Z+8, r23
	std Z+9, r22
	std Z+10, r21
	std Z+11, r20
	std Z+12, r19
	std Z+13, r18
	std Z+14, r25
	std Z+15, r24

	movw r24, r30
	multiPop r29, r28, r17, r16, r15, r14, r13
	ret





uint128_t_operator_shiftLeft:
	multiPush r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r28, r29

	doSPProlog 0xE

	std Y+14, r25
	std Y+13, r24
	movw r14, r22
	movw r30, r20

	ld r18, Z
	ldd r19, Z+1
	ldd r20, Z+2
	ldd r21, Z+3
	ldd r22, Z+4
	ldd r23, Z+5
	ldd r24, Z+6
	ldd r25, Z+7
	ldi r26, 0
	call __cmpdi2_s8

	breq .+2
	rjmp .ret0

	ldd r2, Z+8
	ldd r3, Z+9
	ldd r4, Z+10
	ldd r5, Z+11
	ldd r6, Z+12
	ldd r7, Z+13
	ldd r8, Z+14
	ldd r9, Z+15

	ldi r26, lo8(0x7F)
	call __cmpdi2_s8
	breq .+4
	brlo .+2
	rjmp .ret0

	movw r18, r2
	movw r20, r4
	movw r22, r6
	movw r24, r4
	ldi r26, lo8(0x40)
	call __cmpdi2_s8
	brne .+2
	rjmp .ldSt

	movw r18, r2
	movw r20, r4
	movw r22, r6
	movw r24, r8
	ldi r26, 0
	call __cmpdi2_s8
	brne .+2
	rjmp .doCnst

	movw r18, r2
	movw r20, r4
	movw r22, r6
	movw r24, r8
	ldi r26, lo8(0x3F)
	call __cmpdi2_s8
	breq .+2
	brsh .+2
	rjmp .doShl

	movw r18, r2
	movw r20, r4
	movw r22, r6
	movw r24, r8
	ldi r26, lo8(-0x41)
	call __adddi3_s8

	ldi r26, lo8(0x3E)
	call __cmpdi2_s8
	breq .+2
	brsh .ret0

	movw r16, r2
	subi r16, 0x40
	sbc r17, __zero_reg__
	movw r30, r14

	ldd r18, Y+8
	ldd r19, Y+9
	ldd r20, Y+10
	ldd r21, Y+11
	ldd r22, Y+12
	ldd r23, Y+13
	ldd r24, Y+14
	ldd r25, Y+15
	call __ashldi3

	ldd r30, Y+13
	ldd r31, Y+14

	st Z, r18
	std Z+1, r19
	std Z+2, r20
	std Z+3, r21
	std Z+4, r22
	std Z+5, r23
	std Z+6, r24
	std Z+7, r25

.do0:
	std Z+8, __zero_reg__
	std Z+9, __zero_reg__
	std Z+10, __zero_reg__
	std Z+11, __zero_reg__
	std Z+12, __zero_reg__
	std Z+13, __zero_reg__
	std Z+14, __zero_reg__
	std Z+15, __zero_reg__

	movw r24, r30
	rjmp .return

.ret0:
	ldi r22, lo8(uint128_0)
	ldi r23, hi8(uint128_0)
	ldd r24, Y+13
	ldd r25, Y+14
	call uint128_t_constructor

	ldd r24, Y+13
	ldd r25, Y+14

.return:
	doSPEpilog 0xE

	multiPop r29, r28, r17, r16, r15, r14, r13, r12, r11, r10, r9, r8, r7, r6, r5, r4, r3, r2
	ret

.doShl:
	.irp offset, 1, 2, 3, 4, 5, 6

		movw r30, r14
		ldd r31, Z+(\offset + 7)
		std Y+\offset, r31

	.endr

	movw r30, r14
	ldd r27, Z+14
	ldd r26, Z+15

	ld r18, Z
	ldd r19, Z+1
	ldd r20, Z+2
	ldd r21, Z+3
	ldd r22, Z+4
	ldd r23, Z+5
	ldd r24, Z+6
	ldd r25, Z+7
	mov r16, r2
	call __ashldi3

	std Y+7, r18
	std Y+8, r19
	std Y+9, r20
	std Y+10, r21
	std Y+11, r22
	std Y+12, r23

	mov r31, r24
	mov r30, r25
	ldi r16, lo8(0x40)
	ldi r17, 0
	sub r16, r2
	sbc r17, r3

	ldd r18, Y+1
	ldd r19, Y+2
	ldd r20, Y+3
	ldd r21, Y+4
	ldd r22, Y+5
	ldd r23, Y+6

	mov r24, r27
	mov r25, r26
	call __lshrdi3

	movw r10, r18
	movw r12, r20
	movw r14, r22
	movw r16, r24

	ldd r18, Y+7
	ldd r19, Y+8
	ldd r20, Y+9
	ldd r21, Y+10
	ldd r22, Y+11
	ldd r23, Y+12

	mov r24, r31
	mov r25, r30
	call __adddi3

	ldd r30, Y+13
	ldd r31, Y+14

	st Z, r18
	std Z+1, r19
	std Z+2, r20
	std Z+3, r21
	std Z+4, r22
	std Z+5, r23
	std Z+6, r24
	std Z+7, r25

	ldd r18, Y+1
	ldd r19, Y+2
	ldd r20, Y+3
	ldd r21, Y+4
	ldd r22, Y+5
	ldd r23, Y+6

	mov r24, r27
	mov r25, r26
	mov r16, r2
	call __ashldi3

	std Z+8, r18
	std Z+9, r19
	std Z+10, r20
	std Z+11, r21
	std Z+12, r22
	std Z+13, r23
	std Z+14, r24
	std Z+15, r25
	movw r24, r30
	rjmp .return

.ldSt:
	movw r30, r14
	ldd r23, Z+8
	ldd r22, Z+9
	ldd r21, Z+10
	ldd r20, Z+11
	ldd r19, Z+12
	ldd r18, Z+13
	ldd r25, Z+14
	ldd r24, Z+15
	ldd r30, Y+13
	ldd r31, Y+14

	st Z, r23
	std Z+1, r22
	std Z+2, r21
	std Z+3, r20
	std Z+4, r19
	std Z+5, r18
	std Z+6, r17
	std Z+7, r16
	rjmp .do0

.doCnst:
	movw r22, r14
	ldd r24, Y+13
	ldd r25, Y+14
	call uint128_t_constructor

	ldd r24, Y+13
	ldd r25, Y+14
	rjmp .return





	makeOperatorEqual uint128_t_operator_shiftLeft, uint128_t_operator_shiftLeft_equal





uint128_t_operator_shiftRight:
	multiPush r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r28, r29

	doSPProlog 0xE

	std Y+14, r25
	std Y+13, r24
	movw r14, r22
	movw r30, r20

	ld r18, Z
	ldd r19, Z+1
	ldd r20, Z+2
	ldd r21, Z+3
	ldd r22, Z+4
	ldd r23, Z+5
	ldd r24, Z+6
	ldd r25, Z+7
	ldi r26, 0
	call __cmpdi2_s8

	breq .+2
	rjmp .ret0

	ldd r2, Z+8
	ldd r3, Z+9
	ldd r4, Z+10
	ldd r5, Z+11
	ldd r6, Z+12
	ldd r7, Z+13
	ldd r8, Z+14
	ldd r9, Z+15

	ldi r26, lo8(0x7F)
	call __cmpdi2_s8
	breq .+4
	brlo .+2
	rjmp .ret0

	movw r18, r2
	movw r20, r4
	movw r22, r6
	movw r24, r4
	ldi r26, lo8(0x40)
	call __cmpdi2_s8
	brne .+2
	rjmp .ldSt

	movw r18, r2
	movw r20, r4
	movw r22, r6
	movw r24, r8
	ldi r26, 0
	call __cmpdi2_s8
	brne .+2
	rjmp .doCnst

	movw r18, r2
	movw r20, r4
	movw r22, r6
	movw r24, r8
	ldi r26, lo8(0x3F)
	call __cmpdi2_s8
	breq .+2
	brsh .+2
	rjmp .doShl

	movw r18, r2
	movw r20, r4
	movw r22, r6
	movw r24, r8
	ldi r26, lo8(-0x41)
	call __adddi3_s8

	ldi r26, lo8(0x3E)
	call __cmpdi2_s8
	breq .+2
	brsh .ret0

	movw r16, r2
	subi r16, 0x40
	sbc r17, __zero_reg__
	movw r30, r14

	ldd r18, Y+8
	ldd r19, Y+9
	ldd r20, Y+10
	ldd r21, Y+11
	ldd r22, Y+12
	ldd r23, Y+13
	ldd r24, Y+14
	ldd r25, Y+15
	call __lshrdi3

	ldd r30, Y+13
	ldd r31, Y+14

	st Z, r18
	std Z+1, r19
	std Z+2, r20
	std Z+3, r21
	std Z+4, r22
	std Z+5, r23
	std Z+6, r24
	std Z+7, r25

.do0:
	multiStdZR Z+8, Z+9, Z+10, Z+11, Z+12, Z+13, Z+14, Z+15

	movw r24, r30
	rjmp .return

.ret0:
	ldi r22, lo8(uint128_0)
	ldi r23, hi8(uint128_0)
	ldd r24, Y+13
	ldd r25, Y+14
	call uint128_t_constructor

	ldd r24, Y+13
	ldd r25, Y+14

.return:
	doSPEpilog 0xE

	multiPop r29, r28, r17, r16, r15, r14, r13, r12, r11, r10, r9, r8, r7, r6, r5, r4, r3, r2
	ret

.doShl:
	.irp offset, 1, 2, 3, 4, 5, 6

		movw r30, r14
		ldd r31, Z+(\offset + 7)
		std Y+\offset, r31

	.endr

	movw r30, r14
	ldd r27, Z+14
	ldd r26, Z+15

	ld r18, Z
	ldd r19, Z+1
	ldd r20, Z+2
	ldd r21, Z+3
	ldd r22, Z+4
	ldd r23, Z+5
	ldd r24, Z+6
	ldd r25, Z+7
	mov r16, r2
	call __lshrdi3

	std Y+7, r18
	std Y+8, r19
	std Y+9, r20
	std Y+10, r21
	std Y+11, r22
	std Y+12, r23

	mov r31, r24
	mov r30, r25
	ldi r16, lo8(0x40)
	ldi r17, 0
	sub r16, r2
	sbc r17, r3

	ldd r18, Y+1
	ldd r19, Y+2
	ldd r20, Y+3
	ldd r21, Y+4
	ldd r22, Y+5
	ldd r23, Y+6

	mov r24, r27
	mov r25, r26
	call __ashldi3

	movw r10, r18
	movw r12, r20
	movw r14, r22
	movw r16, r24

	ldd r18, Y+7
	ldd r19, Y+8
	ldd r20, Y+9
	ldd r21, Y+10
	ldd r22, Y+11
	ldd r23, Y+12

	mov r24, r31
	mov r25, r30
	call __adddi3

	ldd r30, Y+13
	ldd r31, Y+14

	st Z, r18
	std Z+1, r19
	std Z+2, r20
	std Z+3, r21
	std Z+4, r22
	std Z+5, r23
	std Z+6, r24
	std Z+7, r25

	ldd r18, Y+1
	ldd r19, Y+2
	ldd r20, Y+3
	ldd r21, Y+4
	ldd r22, Y+5
	ldd r23, Y+6

	mov r24, r27
	mov r25, r26
	mov r16, r2
	call __lshrdi3

	std Z+8, r18
	std Z+9, r19
	std Z+10, r20
	std Z+11, r21
	std Z+12, r22
	std Z+13, r23
	std Z+14, r24
	std Z+15, r25
	movw r24, r30
	rjmp .return

.ldSt:
	movw r30, r14
	ldd r23, Z+8
	ldd r22, Z+9
	ldd r21, Z+10
	ldd r20, Z+11
	ldd r19, Z+12
	ldd r18, Z+13
	ldd r25, Z+14
	ldd r24, Z+15
	ldd r30, Y+13
	ldd r31, Y+14

	st Z, r23
	std Z+1, r22
	std Z+2, r21
	std Z+3, r20
	std Z+4, r19
	std Z+5, r18
	std Z+6, r17
	std Z+7, r16
	rjmp .do0

.doCnst:
	movw r22, r14
	ldd r24, Y+13
	ldd r25, Y+14
	call uint128_t_constructor

	ldd r24, Y+13
	ldd r25, Y+14
	rjmp .return





	makeOperatorEqual uint128_t_operator_shiftRight, uint128_t_operator_shiftRight_equal





uint128_t_operator_exclamation_mark:
	movw r30, r24

	ld r18, Z
	ldd r19, Z+1
	ldd r20, Z+2
	ldd r21, Z+3
	ldd r22, Z+4
	ldd r23, Z+5
	ldd r24, Z+6
	ldd r25, Z+7
	ldi r26, 0
	call __cmpdi2_s8
	brne .ret0

	ldi r27, lo8(1)
	ldd r18, Z+8
	ldd r19, Z+9
	ldd r20, Z+10
	ldd r21, Z+11
	ldd r22, Z+12
	ldd r23, Z+13
	ldd r24, Z+14
	ldd r25, Z+15
	call __cmpdi2_s8
	breq .return

.ret0:
	ldi r27, 0

.return:
	mov r24, r27
	ret





uint128_t_operator_and_and:
	multiPush r28, r29
	movw r28, r22

	call uint128_t_operator_cast_bool
	cpse r24, __zero_reg__
	rjmp .continue

	ldi r24, 0
	multiPop r29, r28
	ret

.continue:
	movw r24, r28
	multiPop r29, r28
	jmp uint128_t_operator_cast_bool





uint128_t_operator_or_or:
	multiPush r28, r29
	movw r28, r22

	call uint128_t_operator_cast_bool
	tst r24
	breq .continue

	multiPop r29, r28
	ret

.continue:
	movw r24, r28
	multiPop r29, r28
	jmp uint128_t_operator_cast_bool





uint128_t_operator_equal_equal:
	multiPush r10, r11, r12, r13, r14, r15, r16, r17, r28
	movw r30, r24
	movw r26, r22

	ld r18, Z
	ldd r19, Z+1
	ldd r20, Z+2
	ldd r21, Z+3
	ldd r22, Z+4
	ldd r23, Z+5

	.irp reg, r10, r11, r12, r13, r14, r15, r16, r17

		ld \reg, X
		adiw r26, 1

	.endr

	ldd r24, Z+6
	ldd r25, Z+7
	call __cmpdi2
	breq .continue

.ret0:
	ldi r28, 0

.return:
	mov r24, r28
	multiPop r28, r17, r16, r15, r14, r13, r12, r11, r10
	ret

.continue:
	ldi r28, lo8(1)
	ldd r18, Z+8
	ldd r19, Z+9
	ldd r20, Z+10
	ldd r21, Z+11
	ldd r22, Z+12
	ldd r23, Z+13

	.irp reg, r10, r11, r12, r13, r14, r15, r16

		ld \reg, X
		adiw r26, 1

	.endr

	ld r17, X

	ldd r24, Z+14
	ldd r25, Z+15
	call __cmpdi2
	brne .ret0
	rjmp .return





uint128_t_operator_not_equal:
	call uint128_t_operator_equal_equal
	ldi r25, lo8(1)
	eor r24, r25
	ret





uint128_t_operator_above:
	multiPush r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r28, r29

	doSPProlog 9

	movw r30, r24
	movw r26, r22

	ld r3, Z
	ldd r4, Z+1
	ldd r5, Z+2
	ldd r6, Z+3
	ldd r7, Z+4
	ldd r8, Z+5
	ldd r9, Z+6
	ldd r24, Z+7

	std Y+9, r24

	.irp offset, 8, 1, 2, 3, 4, 5, 6

		ld r24, X
		std Y+\offset, r24
		adiw r26, 1

	.endr

	ld r2, X
	sbiw r26, 7

	mov r18, r3
	mov r19, r4
	mov r20, r5
	mov r21, r6
	mov r22, r7
	mov r23, r8
	mov r24, r9

	ldd r25, Y+9
	ldd r10, Y+8
	ldd r11, Y+1
	ldd r12, Y+2
	ldd r13, Y+3
	ldd r14, Y+4
	ldd r15, Y+5
	ldd r16, Y+6

	mov r17, r2
	call __cmpdi2
	breq .eq

	ldi r24, lo8(1)
	std Y+7, r24
	mov r18, r3
	mov r19, r4
	mov r20, r5
	mov r21, r6
	mov r22, r7
	mov r23, r8
	mov r24, r9
	mov r17, r2
	call __cmpdi2
	breq .+2
	brsh .+2
	rjmp .doStd

.return:
	ldd r24, Y+7
	doSPEpilog 9

	multiPop r29, r28, r17, r16, r15, r14, r13, r12, r11, r10, r9, r8, r7, r6, r5, r4, r3, r2
	ret

.continue:
	ldi r24, lo8(1)
	std Y+7, r24

	ldd r18, Z+8
	ldd r19, Z+9
	ldd r20, Z+10
	ldd r21, Z+11
	ldd r22, Z+12
	ldd r23, Z+13

	adiw r26, 8
	ld r18, X

	.irp reg, r10, r11, r12, r13, r14, r15, r16, r17

		adiw r26, 1
		ld \reg, X

	.endr

	ldd r24, Z+14
	ldd r25, Z+15
	call __cmpdi2
	breq .+2
	brsh .return

.doStd:
	std Y+7, __zero_reg__
	rjmp .return





uint128_t_operator_below:
	multiPush r16, r17, r28, r29
	movw r28, r24
	movw r16, r22

	call uint128_t_operator_equal_equal
	tst r24
	breq .continue

	ldi r24, 0
	multiPop r29, r28, r17, r16
	ret

.continue:
	movw r22, r16
	movw r24, r28
	call uint128_t_operator_above
	ldi r25, lo8(1)
	eor r24, r25

	multiPop r29, r28, r17, r16
	ret





.macro makeComparisonEqual funcName, calledName

\funcName:
	call \calledName
	ldi r25, lo8(1)
	eor r24, r25
	ret

.endm

	makeComparisonEqual uint128_t_operator_above_equal, uint128_t_operator_below
	makeComparisonEqual uint128_t_operator_below_equal, uint128_t_operator_above





uint128_t_operator_plus:
	multiPush r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r28, r29

	doSPProlog 0xF

	std Y+15, r25
	std Y+14, r24
	movw r26, r22
	movw r30, r20

	adiw r26, 8
	ld r6, X

	.irp reg, r7, r8, r9

		adiw r26, 1
		ld \reg, X

	.endr

	.irp offset, 1, 2, 3, 4

		adiw r26, 1
		ld r24, X
		std Y+\offset, r24

	.endr

	movw r18, r6
	movw r20, r8

	ldd r22, Y+1
	ldd r23, Y+2
	ldd r24, Y+3
	ldd r25, Y+4

	ldd r10, Y+8
	ldd r11, Y+9
	ldd r12, Y+10
	ldd r13, Y+11
	ldd r14, Y+12
	ldd r15, Y+13
	ldd r16, Y+14
	ldd r17, Y+15
	call __adddi3

	std Y+5, r18
	std Y+6, r19
	std Y+7, r20
	std Y+8, r21
	movw r2, r22
	movw r4, r24

	.irp reg, r18, r19, r20, r21, r22, r23, r24

		ld \reg, X
		adiw r26, 1

	.endr

	ld r25, X

	ld r10, Z
	ldd r11, Z+1
	ldd r12, Z+2
	ldd r13, Z+3
	ldd r14, Z+4
	ldd r15, Z+5
	ldd r16, Z+6
	ldd r17, Z+7
	call __adddi3

	std Y+9, r18
	std Y+10, r19
	std Y+11, r20
	std Y+12, r21

	mov r27, r22
	mov r26, r23
	mov r31, r24

	std Y+13, r25
	ldi r30, lo8(1)
	movw r18, r6
	movw r20, r8

	ldd r22, Y+1
	ldd r23, Y+2
	ldd r24, Y+3
	ldd r25, Y+4
	ldd r10, Y+5
	ldd r11, Y+6
	ldd r12, Y+7
	ldd r13, Y+8
	movw r14, r2
	movw r16, r4
	call __cmpdi2
	breq .+2
	brsh .skipRet0

	ldi r30, 0

.skipRet0:
	ldd r18, Y+9
	ldd r19, Y+10
	ldd r20, Y+11
	ldd r21, Y+12

	mov r22, r27
	mov r23, r26
	mov r24, r31

	ldd r25, Y+13
	mov r10, r30
	multiZero r11, r12, r13, r14, r15
	multiLdi0 r16, r17
	call __adddi3

	ldd r30, Y+14
	ldd r31, Y+15

	st Z, r18
	std Z+1, r19
	std Z+2, r20
	std Z+3, r21
	std Z+4, r22
	std Z+5, r23
	std Z+6, r24
	std Z+7, r25

	.irp offset, 5, 6, 7, 8

		ldd r24, Y+\offset
		std Z+(\offset + 3), r24

	.endr

	std Z+12, r2
	std Z+13, r3
	std Z+14, r4
	std Z+15, r5

	movw r24, r30
	doSPEpilog 0xF

	multiPop r29, r28, r17, r16, r15, r14, r13, r12, r11, r10, r9, r8, r7, r6, r5, r4, r3, r2
	ret





	makeOperatorEqual uint128_t_operator_plus, uint128_t_operator_plus_equal





uint128_t_operator_minus:
	multiPush r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r28, r29

	doSPProlog 0xF

	std Y+15, r25
	std Y+14, r24
	movw r26, r22
	movw r30, r20

	adiw r26, 8
	ld r6, X

	.irp reg, r7, r8, r9

		adiw r26, 1
		ld \reg, X

	.endr

	.irp offset, 1, 2, 3, 4

		adiw r26, 1
		ld r24, X
		std Y+\offset, r24

	.endr

	movw r18, r6
	movw r20, r8

	ldd r22, Y+1
	ldd r23, Y+2
	ldd r24, Y+3
	ldd r25, Y+4

	ldd r10, Y+8
	ldd r11, Y+9
	ldd r12, Y+10
	ldd r13, Y+11
	ldd r14, Y+12
	ldd r15, Y+13
	ldd r16, Y+14
	ldd r17, Y+15
	call __subdi3

	std Y+5, r18
	std Y+6, r19
	std Y+7, r20
	std Y+8, r21
	movw r2, r22
	movw r4, r24

	.irp reg, r18, r19, r20, r21, r22, r23, r24

		ld \reg, X
		adiw r26, 1

	.endr

	ld r25, X

	ld r10, Z
	ldd r11, Z+1
	ldd r12, Z+2
	ldd r13, Z+3
	ldd r14, Z+4
	ldd r15, Z+5
	ldd r16, Z+6
	ldd r17, Z+7
	call __subdi3

	std Y+9, r18
	std Y+10, r19
	std Y+11, r20
	std Y+12, r21

	mov r27, r22
	mov r26, r23
	mov r31, r24

	std Y+13, r25
	ldi r30, lo8(1)
	movw r18, r6
	movw r20, r8

	ldd r22, Y+1
	ldd r23, Y+2
	ldd r24, Y+3
	ldd r25, Y+4
	ldd r10, Y+5
	ldd r11, Y+6
	ldd r12, Y+7
	ldd r13, Y+8
	movw r14, r2
	movw r16, r4
	call __cmpdi2
	breq .+2
	brsh .skipRet0

	ldi r30, 0

.skipRet0:
	ldd r18, Y+9
	ldd r19, Y+10
	ldd r20, Y+11
	ldd r21, Y+12

	mov r22, r27
	mov r23, r26
	mov r24, r31

	ldd r25, Y+13
	mov r10, r30
	multiZero r11, r12, r13, r14, r15
	multiLdi0 r16, r17
	call __adddi3

	ldd r30, Y+14
	ldd r31, Y+15

	st Z, r18
	std Z+1, r19
	std Z+2, r20
	std Z+3, r21
	std Z+4, r22
	std Z+5, r23
	std Z+6, r24
	std Z+7, r25

	.irp offset, 5, 6, 7, 8

		ldd r24, Y+\offset
		std Z+(\offset + 3), r24

	.endr

	std Z+12, r2
	std Z+13, r3
	std Z+14, r4
	std Z+15, r5

	movw r24, r30
	doSPEpilog 0xF

	multiPop r29, r28, r17, r16, r15, r14, r13, r12, r11, r10, r9, r8, r7, r6, r5, r4, r3, r2
	ret





	makeOperatorEqual uint128_t_operator_minus, uint128_t_operator_minus_equal





uint128_t_operator_multiply:
	multiPush r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r28, r29

	doSPProlog 0x56

	movw r2, r24
	movw r26, r22
	movw r30, r20

	ld r24, X
	std Y+13, r24

	.irp offset, 14, 15, 16, 17, 57, 58, 59, 60

		adiw t26, 1
		ld r24, X
		std Y+\offset, r24

	.endr

	.irp reg, r4, r5, r6, r7, r22, r23

		adiw r26, 1
		ld \reg, X

	.endr

	movw r18, r4
	movw r20, r6

	.irp reg, r24, r25

		adiw r26, 1
		ld \reg, X

	.endr

	ldi r16, lo8(0x20)
	call __lshrdi3

	std Y+17, r18
	std Y+18, r19
	std Y+19, r20
	std Y+20, r21
	std Y+21, r22
	std Y+22, r23
	std Y+23, r24
	std Y+24, r25

	.irp offset, 0, 1, 2, 3

		.if offset == 0
			ld r24, Z
		.else
			ldd r24, Z+\offset
		.endif

		std Y+(\offset + 25), r24

	.endr

	.irp offset, 4, 5, 6

		ldd r24, Z+\offset
		std Y+(\offset + 57), r24

	.endr

	ldd r24, Z+7
	adiw r28, 1
	std Y+63, r24
	sbiw r28, 1

	.irp offset, 1, 2, 3, 4

		ldd r24, Z+(\offset + 7)
		std Y+\offset, r24

	.endr

	ldd r22, Z+12
	ldd r23, Z+13

	ldd r18, Y+1
	ldd r19, Y+2
	ldd r20, Y+3
	mov r21, r24

	ldd r24, Z+14
	ldd r25, Z+15
	call __lshrdi3

	std Y+29, r18
	std Y+30, r19
	std Y+31, r20
	std Y+32, r21
	std Y+33, r22
	std Y+34, r23
	std Y+35, r24
	std Y+36, r25

	ldd r10, Y+1
	ldd r11, Y+2
	ldd r12, Y+3
	ldd r13, Y+4

	multiZero r14, r15
	multiLdi0 r16, r17

	movw r18, r4
	movw r20, r6

	multiLdi0 r22, r23, r24, r25
	call __muldi3

	std Y+41, r18
	std Y+42, r19
	std Y+43, r20
	std Y+44, r21

	std Y+5, r22
	std Y+6, r23
	std Y+7, r24
	std Y+8, r25

	ldd r18, Y+17
	ldd r19, Y+18
	ldd r20, Y+19
	ldd r21, Y+20
	ldd r22, Y+21
	ldd r23, Y+22
	ldd r24, Y+23
	ldd r25, Y+24
	call __muldi3

	std Y+9, r18
	std Y+10, r19
	std Y+11, r20
	std Y+12, r21
	std Y+37, r22
	std Y+38, r23
	std Y+39, r24
	std Y+40, r25

	ldd r18, Y+13
	ldd r19, Y+14
	ldd r20, Y+15
	ldd r21, Y+16

	multiLdi0 r22, r23, r24, r25
	call __muldi3

	std Y+45, r18
	std Y+46, r19
	std Y+47, r20
	std Y+48, r21

	adiw r28, 69-63
	std Y+63, r22

	.irp reg, r23, r24, r25

		adiw r28, 1
		std Y+63, \reg

	.endr

	sbiw r28, 72-63

	ldd r10, Y+29
	ldd r11, Y+30
	ldd r12, Y+31
	ldd r13, Y+32
	ldd r14, Y+33
	ldd r15, Y+34
	ldd r16, Y+35
	ldd r17, Y+36

	movw r18, r4
	movw r20, r6

	multiLdi0 r22, r23, r24, r25
	call __muldi3

	movw r8, r18
	adiw r28, 86-63
	std Y+63, r20

	sbiw r28, 1
	std Y+63, r21

	sbiw r28, (85 - 63) - (73 - 63)
	std Y+63, r22

	.irp reg, r23, r24, r25

		adiw r28, 1
		std Y+63, \reg

	.endr

	sbiw r28, 76-63

	ldd r18, Y+17
	ldd r19, Y+18
	ldd r20, Y+19
	ldd r21, Y+20
	ldd r22, Y+21
	ldd r23, Y+22
	ldd r24, Y+23
	ldd r25, Y+24
	call __muldi3

	std Y+49, r18
	std Y+50, r19
	std Y+51, r20
	std Y+52, r21

	adiw r28, 77-63
	std Y+63, r22

	.irp reg, r23, r24, r25

		adiw r28, 1
		std Y+63, \reg

	.endr

	sbiw r28, 80-63

	ldd r10, Y+25
	ldd r11, Y+26
	ldd r12, Y+27
	ldd r13, Y+28

	multiZero r14, r15
	multiLdi0 r16, r17

	movw r18, r4
	movw r20, r6

	multiLdi0 r22, r23, r24, r25
	call __muldi3

	std Y+53, r18
	std Y+54, r19
	std Y+55, r20
	std Y+56, r21

	adiw r28, 81-63
	std Y+63, r22

	.irp reg, r23, r24, r25

		adiw r28, 1
		std Y+63, \reg

	.endr

	sbiw r28, 84-63

	ldd r18, Y+41
	ldd r19, Y+42
	ldd r20, Y+43
	ldd r21, Y+44

	ldd r22, Y+5
	ldd r23, Y+6
	ldd r24, Y+7
	ldd r25, Y+8

	ldi r16, lo8(0x20)
	call __lshrdi3

	movw r10, r18
	movw r12, r20
	movw r14, r22
	movw r18, r8

	adiw r28, 86-63
	ldd r20, Y+63

	sbiw r28, 1
	ldd r21, Y+63
	sbiw r28, 85-63

	multiLdi0 r22, r23, r24, r25
	call __adddi3

	movw r10, r18
	movw r12, r20
	movw r14, r22
	movw r16, r24

	ldd r18, Y+9
	ldd r19, Y+10
	ldd r20, Y+11
	ldd r21, Y+12

	multiLdi0 r22, r23, r24, r25
	call __adddi3

	std Y+5, r18
	std Y+6, r19
	std Y+7, r20
	std Y+8, r21

	adiw r28, 65-63
	std Y+63, r22

	.irp reg, r23, r24, r25

		adiw r28, 1
		std Y+63, \reg

	.endr

	movw r18, r8
	adiw r28, (86 - 63) - (68 - 63)
	ldd r20, Y+63

	sbiw r28, 1
	ldd r21, Y+63

	sbiw r28, (85 - 63) - (73 - 63)
	ldd r22, Y+63

	.irp reg, r23, r24, r25

		adiw r28, 1
		std Y+63, \reg

	.endr

	sbiw r28, 76-63

	ldi r16, lo8(0x20)
	call __lshrdi3

	movw r10, r18
	movw r12, r20
	movw r14, r22
	movw r16, r24

	ldd r18, Y+53
	ldd r19, Y+54
	ldd r20, Y+55
	ldd r21, Y+56

	multiLdi0 r22, r23, r24, r25
	call __adddi3

	ldd r10, Y+49
	ldd r11, Y+50
	ldd r12, Y+51
	ldd r13, Y+52

	multiZero r14, r15
	multiLdi0 r16, r17
	call __adddi3

	movw r8, r18
	adiw r28, 74-63
	std Y+63, r20

	sbiw r28, 1
	std Y+63, r21
	sbiw r28, 73-63

	mov r27, r22
	mov r26, r23
	mov r31, r24
	mov r32, r25

	ldd r18, Y+9
	ldd r19, Y+10
	ldd r20, Y+11
	ldd r21, Y+12

	ldd r22, Y+37
	ldd r23, Y+38
	ldd r24, Y+39
	ldd r25, Y+40

	ldi r16, lo8(0x20)
	call __lshrdi3

	movw r10, r18
	movw r12, r20
	movw r14, r22
	movw r16, r24
	movw r18, r8

	adiw r28, 74-63
	ldd r20, Y+63

	sbiw r28, 1
	ldd r21, Y+63
	sbiw r28, 73-63

	mov r22, r27
	mov r23, r26
	mov r24, r31
	mov r25, r30
	call __adddi3

	movw r10, r18
	movw r12, r20
	movw r14, r22
	movw r16, r24

	ldd r18, Y+45
	ldd r19, Y+46
	ldd r20, Y+47
	ldd r21, Y+48

	multiLdi0 r22, r23, r24, r25
	call __adddi3

	std Y+9, r18
	std Y+10, r19
	std Y+11, r20
	std Y+12, r21

	std Y+37, r22
	std Y+38, r23
	std Y+39, r24
	std Y+40, r25

	ldd r18, Y+25
	ldd r19, Y+26
	ldd r20, Y+27
	ldd r21, Y+28

	ldd r22, Y+61
	ldd r23, Y+62
	ldd r24, Y+63

	adiw r28, 1
	ldd r25, Y+63
	sbiw r28, 1

	ldi r16, lo8(0x20)
	call __lshrdi3

	movw r10, r4
	movw r12, r6

	multiZero r14, r15
	multiLdi0 r16, r17
	call __muldi3

	mov r27, r18
	mov r26, r19
	mov r31, r20
	mov r30, r21

	ldd r18, Y+53
	ldd r19, Y+54
	ldd r20, Y+55
	ldd r21, Y+56

	adiw r28, 81-63
	ldd r22, Y+63

	.irp reg, r23, r24, r25

		adiw r28, 1
		std Y+63, \reg

	.endr

	sbiw r28, 84-63

	ldi r16, lo8(0x20)
	call __lshrdi3

	movw r10, r18
	movw r12, r20
	movw r14, r22
	movw r16, r24

	mov r18, r27
	mov r19, r26
	mov r20, r31
	mov r21, r30

	multiLdi0 r22, r23, r24, r25
	call __adddi3

	movw r4, r18
	movw r6, r20
	movw r8, r22

	std Y+54, r24
	std Y+55, r25

	ldd r10, Y+25
	ldd r11, Y+26
	ldd r12, Y+27
	ldd r13, Y+28

	multiZero r14, r15
	multiLdi0 r16, r17

	ldd r18, Y+17
	ldd r19, Y+18
	ldd r20, Y+19
	ldd r21, Y+20
	ldd r22, Y+21
	ldd r23, Y+22
	ldd r24, Y+23
	ldd r25, Y+24
	call __muldi3

	movw r10, r18
	movw r12, r20
	movw r18, r4
	movw r20, r6
	movw r22, r8

	ldd r24, Y+54
	ldd r23, Y+53
	call __adddi3

	movw r8, r18
	std Y+18, r20
	std Y+19, r21

	mov r27, r22
	mov r26, r23
	mov r31, r24
	mov r30, r25

	ldd r18, Y+49
	ldd r19, Y+50
	ldd r20, Y+51
	ldd r21, Y+52

	adiw r28, 77-63
	ldd r22, Y+63

	.irp reg, r23, r24, r25

		adiw r28, 1
		std Y+63, \reg

	.endr

	sbiw r28, 80-63

	ldi r16, lo8(0x20)
	call __lshrdi3

	movw r10, r18
	movw r12, r20
	movw r14, r22
	movw r16, r8

	ldd r20, Y+18
	ldd r21, Y+17

	mov r22, r27
	mov r23, r26
	mov r24, r31
	mov r25, r30
	call __adddi3

	movw r4, r18
	movw r6, r20
	movw r8, r22

	std Y+18, r24
	std Y+19, r25

	ldd r10, Y+29
	ldd r11, Y+30
	ldd r12, Y+31
	ldd r13, Y+32
	ldd r14, Y+33
	ldd r15, Y+34
	ldd r16, Y+35
	ldd r17, Y+36

	ldd r18, Y+13
	ldd r19, Y+14
	ldd r20, Y+15
	ldd r21, Y+16

	multiLdi0 r22, r23, r24, r25
	call __muldi3

	movw r10, r18
	movw r12, r20
	movw r18, r4
	movw r20, r6
	movw r22, r8

	ldd r24, Y+18
	ldd r25, Y+17

	multiZero r14, r15
	multiLdi0 r16, r17
	call __adddi3

	movw r8, r18

	std Y+18, r20
	std Y+17, r21

	mov r27, r22
	mov r26, r23
	mov r31, r24
	mov r30, r25

	ldd r18, Y+45
	ldd r19, Y+46
	ldd r20, Y+47
	ldd r21, Y+48

	adiw r28, 69-63
	ldd r22, Y+63

	adiw r28, 1
	ldd r23, Y+63

	adiw r28, 1
	ldd r24, Y+63

	adiw r28, 1
	ldd r25, Y+63
	sbiw r28, 72-63

	ldi r26, lo8(0x20)
	call __lshrdi3

	movw r10, r18
	movw r12, r20
	movw r14, r22
	movw r16, r24
	movw r18, r8

	ldd r20, Y+18
	ldd r21, Y+17

	mov r22, r27
	mov r23, r26
	mov r24, r31
	mov r25, r30
	call __adddi3

	movw r4, r18
	movw r6, r20
	movw r8, r22

	std Y+18, r24
	std Y+17, r25

	ldd r18, Y+13
	ldd r19, Y+14
	ldd r20, Y+15
	ldd r21, Y+16

	ldd r22, Y+57
	ldd r23, Y+58
	ldd r24, Y+59
	ldd r25, Y+60

	ldi r16, lo8(0x20)
	call __lshrdi3

	ldd r10, Y+1
	ldd r11, Y+2
	ldd r12, Y+3
	ldd r13, Y+4

	multiZero r14, r15
	multiLdi0 r16, r17
	call __muldi3

	multiLdi0 r22, r23, r24, r25

	movw r10, r4
	movw r12, r6
	movw r14, r8

	ldd r16, Y+18
	ldd r17, Y+17
	call __adddi3

	movw r4, r18
	movw r6, r20
	movw r8, r22

	std Y+2, r24
	std Y+1, r25

	ldd r18, Y+5
	ldd r19, Y+6
	ldd r20, Y+7
	ldd r21, Y+8

	adiw r28, 65-63
	ldd r22, Y+63

	.irp reg, r23, r24, r25

		adiw r28, 1
		std Y+63, \reg

	.endr

	sbiw r28, 68-63

	ldi r16, lo8(0x20)
	call __lshrdi3

	ldd r10, Y+9
	ldd r11, Y+10
	ldd r12, Y+11
	ldd r13, Y+12

	ldd r14, Y+37
	ldd r15, Y+38
	ldd r16, Y+39
	ldd r17, Y+40
	call __adddi3

	mov r27, r18
	mov r26, r19
	mov r31, r20
	mov r30, r21

	ldi r16, lo8(0x20)
	call __lshrdi3

	movw r10, r4
	movw r12, r6
	movw r14, r8

	ldd r16, Y+2
	ldd r17, Y+1
	call __adddi3

	multiLdi0 r22, r23, r24, r25

	ldi r16, lo8(0x20)
	call __ashldi3

	or r27, r18
	or r28, r19
	or r20, r31
	or r21, r30

	movw r30, r2
	st Z, r27
	std Z+1, r26
	std Z+2, r20
	std Z+3, r21
	std Z+4, r22
	std Z+5, r23
	std Z+6, r24
	std Z+7, r25

	ldd r18, Y+5
	ldd r19, Y+6
	ldd r20, Y+7
	ldd r21, Y+8

	multiLdi0 r22, r23, r24, r25
	call __ashldi3

	ldd r31, Y+41
	or r18, r31

	ldd r30, Y+40
	or r19, r30

	ldd r31, Y+43
	or r20, r31

	ldd r30, Y+44
	or r21, r30

	movw r30, r2
	std Z+8, r18
	std Z+9, r19
	std Z+10, r20
	std Z+11, r21
	std Z+12, r22
	std Z+13, r23
	std Z+14, r24
	std Z+15, r25

	movw r24, r2
	doSPEpilog 0x40

	multiPop r29, r28, r17, r16, r15, r14, r13, r12, r11, r10, r9, r8, r7, r6, r5, r4, r3, r2
	ret





	makeOperatorEqual uint128_t_operator_multiply, uint128_t_operator_multiply_equal





uint128_t_divmod:
	multiPush r11, r12, r13, r14, r15, r16, r17, r28, r29

	doSPProlog 0x40

	movw r12, r24
	movw r14, r20
	movw r16, r18

	ldi r22, lo8(uint128_1)
	ldi r23, hi8(uint128_1)
	movw r24, r18
	call uint128_t_operator_equal_equal

	cpse r24, __zero_reg__
	rjmp .doMov

	movw r22, r16
	movw r24, r14
	call uint128_t_operator_equal_equal

	cpse r24, __zero_reg__
	rjmp .do1

	ldi r22, lo8(uint128_0)
	ldi r23, hi8(uint128_0)

	movw r24, r14
	call uint128_t_operator_equal_equal

	tst r24
	breq .checkBelow

.do0:
	ldi r22, lo8(uint128_0)
	ldi r23, hi8(uint128_0)
	movw r24, r12
	call uint128_t_constructor

	movw r22, r14
	movw r24, r12
	adiw r24, 0x10
	call uint128_t_constructor

.return:
	movw r24, r12

	doSPEpilog 0x40

	multiPop r29, r28, r17, r16, r15, r14, r13, r12, r11
	ret

.do1:
	ldi r22, lo8(uint128_1)
	ldi r23, hi8(uint128_1)

.doCnst:
	movw r24, r12
	call uint128_t_constructor

	ldi r22, lo8(uint128_0)
	ldi r23, hi8(uint128_0)
	movw r24, r12
	adiw r24, 0x10
	call uint128_t_constructor
	rjmp .return

.doMov:
	movw r22, r14
	rjmp .doCnst

.checkBelow:
	movw r22, r16
	movw r24, r14
	call uint128_t_operator_below

	cpse r24, __zero_reg__
	rjmp .do0

	ldi r22, lo8(uint128_0)
	ldi r23, hi8(uint128_0)

	movw r24, r28
	adiw r24, 1
	call uint128_t_constructor

	ldi r22, lo8(uint128_0)
	ldi r23, hi8(uint128_0)

	movw r24, r28
	adiw r24, 0x11
	call uint128_t_constructor

	movw r24, r14
	call uint128_t_bits

	mov r11, r24
	cpse r24, __zero_reg__
	rjmp .do12
	rjmp .doMoves

.checkAboveEqual:
	movw r22, r16
	movw r24, r28
	adiw r24, 0x11
	call uint128_t_operator_above_equal

	cpse r24, __zero_reg__
	rjmp .doMinusEqual

.doDec:
	dec r11
	tst r11
	brne .+2
	rjmp .doMoves

.do12:
	ldi r22, lo8(uint128_1)
	ldi r23, hi8(uint128_1)

	movw r24, r28
	adiw r24, 1
	call uint128_t_operator_shiftLeft_equal

	ldi r22, lo8(uint128_1)
	ldi r23, hi8(uint128_1)

	movw r24, r28
	adiw r24, 1
	call uint128_t_operator_shiftLeft_equal

	multiStdZR Z+33, Z+34, Z+35, Z+36, Z+37, Z+38, Z+39, Z+40

	mov r18, r11
	ldi r19, 0

	subi r18, 1
	sbc r19, __zero_reg__

	std Y+41, r18
	std Y+42, r19
	multiStdZR Y+43, Y+44, Y+45, Y+46, Y+47, Y+48

	movw r20, r28
	subi r20, -0x21
	sbci r21, -1

	movw r22, r14
	movw r24, r28
	adiw r24, 0x31
	call uint128_t_operator_shiftRight

	ldd r24, Z+57
	andi r24, lo8(1)

	multiStdZR Y+33, Y+34, Y+35, Y+36, Y+37, Y+38, Y+39, Y+40
	std Y+41, r24
	multiStdZR Y+42, Y+43, Y+44, Y+45, Y+46, Y+47, Y+48

	movw r24, r28
	adiw r24, 0x21
	call uint128_t_operator_cast_bool

	tst r24
	brne .+2
	rjmp .checkAboveEqual

	movw r24, r28
	adiw r24, 0x11
	call uint128_t_operator_plus_plus

	movw r22, r16
	movw r24, r28
	adiw r24, 0x11
	call uint128_t_operator_above_equal

	tst r24
	brne .+2
	rjmp .doDec

.doMinusEqual:
	movw r22, r16
	movw r24, r28
	adiw r24, 0x11
	call uint128_t_operator_minus_equal

	movw r24, r28
	adiw r24, 1
	call uint128_t_operator_plus_plus

	dec r11
	cpse r11, __zero_reg__
	rjmp .do12

.doMoves:
	movw r22, r28
	subi r22, -1
	sbci r23, -1
	movw r24, r12
	call uint128_t_constructor_uint128_t_double_ref

	movw r22, r28
	subi r22, -0x11
	sbci r23, -1

	movw r24, r12
	adiw r24, 0x10
	call uint128_t_constructor_uint128_t_double_ref
	rjmp .return





uint128_t_operator_divide:
	multiPush r16, r17, r28, r29

	doSPProlog 0x20

	movw r16, r24
	movw r18, r20
	movw r20, r22
	movw r24, r30
	adiw r24, 1
	call uint128_t_divmod

	movw r22, r28
	subi r22, -1
	sbci r23, -1
	movw r24, r16
	call uint128_t_constructor_uint128_t_double_ref

	movw r24, r16
	doSPEpilog 0x20

	multiPop r29, r28, r17, r16
	ret





	makeOperatorEqual uint128_t_operator_divide, uint128_t_operator_divide_equal





uint128_t_operator_modulo:
	multiPush r16, r17, r28, r29

	doSPProlog 0x20

	movw r16, r24
	movw r18, r20
	movw r20, r22
	movw r24, r30
	adiw r24, 1
	call uint128_t_divmod

	movw r22, r28
	subi r22, -0x11
	sbci r23, -1
	movw r24, r16
	call uint128_t_constructor_uint128_t_double_ref

	movw r24, r16

	doSPEpilog 0x20

	multiPop r29, r28, r17, r16
	ret





	makeOperatorEqual uint128_t_operator_modulo, uint128_t_operator_modulo_equal





.macro makePPMM funcName, calledName

\funcName:
	ldi r22, lo8(uint128_1)
	ldi r23, hi8(uint128_1)
	call \calledName

.endm

.macro makePPIMMI funcName, calledName

\funcName:
	multiPush r16, r17, r28, r29

	movw r28, r24
	movw r16, r22
	call uint128_t_constructor

	movw r24, r16
	call \calledName

	movw r24, r28
	multiPop r29, r28, r17, r16
	ret

.endm

	makePPMM uint128_t_operator_plus_plus, uint128_t_operator_plus_equal
	makePPIMMI uint128_t_operator_plus_plus_int, uint128_t_operator_plus_plus
	makePPMM uint128_t_operator_minus_minus, uint128_t_operator_minus_equal
	makePPIMMI uint128_t_operator_minus_minus_int, uint128_t_operator_minus_minus





uint128_t_operator_single_plus:
	multiPush r28, r29
	movw r28, r24

	call uint128_t_constructor

	movw r24, r28
	multiPop r29, r28
	ret





uint128_t_operator_single_minus:
	multiPush r16, r17, r28, r29

	doSPProlog 0x10

	movw r16, r24
	movw r24, r28
	adiw r24, 1
	call uint128_t_operator_not

	ldi r20, lo8(uint128_1)
	ldi r21, hi8(uint128_1)
	movw r22, r28
	subi r22, -1
	sbci r23, -1
	movw r24, r16
	call uint128_t_operator_plus

	movw r24, r16
	doSPEpilog 0x10

	multiPop r29, r28, r17, r16
	ret





uint128_t_upper:
	ret





uint128_t_lower:
	adiw r24, 8
	ret





uint128_t_bits:
	multiPush r13, r14, r15, r16, r17, r28, r29
	movw r30, r24

	ld r13, Z
	ldd r14, Z+1
	ldd r15, Z+2
	ldd r16, Z+3
	ldd r17, Z+4
	ldd r29, Z+5
	ldd r28, Z+6
	ldd r27, Z+7

	mov r18, r13
	mov r19, r14
	mov r20, r15
	mov r21, r16
	mov r22, r17
	mov r23, r29
	mov r24, r28
	mov r25, r27
	ldi r26, 0
	call __cmpdi2_s8
	brne .doUpper

	ldd r14, Z+8
	ldd r15, Z+9
	ldd r16, Z+10
	ldd r17, Z+11
	ldd r29, Z+12
	ldd r28, Z+13
	ldd r27, Z+14
	ldd r30, Z+15

	movw r18, r14
	movw r20, r16
	mov r22, r29
	mov r23, r28
	mov r24, r27
	mov r25, r30
	ldi r26, 0
	call __cmpdi2_s8
	breq .ret0

	call __clzdi2

	ldi r25, lo8(0x40)

.finish:
	sub r25, r24
	mov r24, r25

.return:
	multiPop r29, r28, r17, r16, r15, r14, r13
	ret

.ret0:
	ldi r24, 0
	rjmp .return

.doUpper:
	call __clzdi2
	rjmp .finish
