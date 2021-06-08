.include "standard.inc"

	.text

sadd_overflow:
	movw r30, r20

	ldi r21, 0
	movw r18, r24
	add16 r18, r22

	sbrc r23, 7
	rjmp .check

	cmp16 r18, r24
	brlt .ret1

.return:
	st16 Z, 0, r18

	mov r24, r21
	ret

.check:
	cmp16 r24, r18
	brge .return

.ret1:
	ldi r21, lo8(1)
	rjmp .return





saddl_overflow:
	multiPush r12, r13, r14, r15, r16, r17

	ldi r30, 0
	mov32 r12, r22
	add32 r12, r18

	sbrc r21, 7
	rjmp .checks

	cmp32 r12, r22
	brlt .ret1

.return:
	movw r26, r16

	.irp reg, r12, r13, r14

		st X+, \reg

	.endr

	st X, r15
	sbiw r26, 3

	mov r24, r30
	multiPop r17, r16, r15, r14, r13, r12
	ret

.checks:
	cmp32 r22, r12
	brge .return

.ret1:
	ldi r30, lo8(1)
	rjmp .return





saddll_overflow:
	multiPush r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r28, r29

	doSPProlog 0xF

	st64 Y, 1, r18
	movw r30, r8

	std Y+15, __zero_reg__
	call __adddi3

	mov32 r3, r18
	movw r7, r22
	mov r9, r24

	mov r27, r25
	mov64 r18, r10

	ldi r26, 0
	call __cmpdi2_s8
	brlt .rltSigned

	mov32 r18, r3
	movw r22, r7
	mov r24, r9
	mov r25, r27

	ld64 r10, Y, 1
	call __cmpdi2
	brlt .ret1

.return:
	st32 Z, 0, r3
	st32 Z, 5, r7
	std Z+6, r9
	std Z+7, r27

	doSPEpilog 0xF

	multiPop r29, r28, r17, r16, r15, r14, r13, r12, r11, r10, r9, r8, r7, r6, r5, r4, r3, r2
	ret

.rltSigned:
	mov32 r18, r3
	movw r22, r7
	mov r24, r9
	mov r25, r27

	ld64 r10, Y, 1
	call __cmpdi2
	breq .return
	brlt .return

.ret1:
	ldi r24, lo8(1)
	std Y+15, r24
	rjmp .return





uadd_overflow:
	ldi r18, 0
	add16 r22, r24
	cmp16 r22, r24
	brlo .ret1

.return:
	movw r30, r20
	st16 Z, 0, r22

	mov r24, r18
	ret

.ret1:
	ldi r18, lo8(1)
	rjmp .return





uaddl_overflow:
	multiPush r12, r13, r14, r15, r16, r17

	ldi r30, 0
	mov32 r12, r22
	add32 r12, r18
	cmp32 r12, r22
	brlo .ret1

.return:
	movw r26, r16

	.irp reg, r12, r13, r14

		st X+, \reg

	.endr

	st X, r15
	sbiw r26, 3

	mov r24, r30
	multiPop r17, r16, r15, r14, r13, r12
	ret

.ret1:
	ldi r30, lo8(1)
	rjmp .return





uaddll_overflow:
	multiPush r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r28, r29

	doSPProlog 7

	movw r26, r18
	mov r7, r20
	mov r6, r21
	mov r5, r22
	mov r4, r23
	mov r3, r24
	mov r2, r25
	movw r30, r8

	std Y+7, __zero_reg__
	call __adddi3

	movw r8, r18
	st32 Y, 1, r20
	st16 Y, 5, r24

	movw r10, r26
	mov r12, r7
	mov r13, r6
	mov r14, r5
	mov r15, r4
	mov r16, r3
	mov r17, r2
	call __cmpdi2
	brlo .rlo

.return:
	st Z, r8
	std Z+1, r9
	ldd r24, Z+1

	.irp offset, 2, 3, 4, 5, 6, 7

		std Z+\offset, r24
		ldd r24, Z+\offset

	.endr

	doSPEpilog 7

	multiPop r29, r28, r17, r16, r15, r14, r13, r12, r11, r10, r9, r8, r7, r6, r5, r4, r3, r2
	ret

.rlo:
	ldi r24, lo8(1)
	std Y+7, r24
	rjmp .return
