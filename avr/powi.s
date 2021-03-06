.include "standard.inc"

	.text

powi:
powif:
powil:
__powisf2:
	multiPush r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r28, r29

	mov32 r8, r22
	movw r4, r10
	movw r6, r20
	mov32 r12, r18

	multiLdi0 r16, r17
	ldi16 r28, 0x803F
	rjmp .startLoop

.loop:
	asr r15
	multiRor r14, r13, r12

	cp r12, __zero_reg__
	multiCpcZR r13, r14, r15
	breq .endLoop

	mov32 r18, r8
	mov32 r22, r8
	call __mulsf3

	mov32 r8, r22

.startLoop:
	sbrs r12, 0
	rjmp .skipMul

	mov32 r18, r8
	movw r22, r16

	mov r24, r29
	mov r25, r28
	call __mulsf3

	movw r16, r22
	mov r29, r24
	mov r28, r25

.skipMul:
	sbrs r15, 7
	rjmp .loop

	ldi r24, -1
	sub r12, r24

	.irp reg, r13, r14, r15

		sbc \reg, r24

	.endr

	rjmp .loop

.endLoop:
	sbrc r7, 7
	rjmp .doDiv

	mov r20, r17
	movw r18, r28

.return:
	mov r22, r16
	mov r23, r20
	mov r24, r19
	mov r25, r18

	multiPop r29, r28, r17, r16, r15, r14, r13, r12, r11, r10, r9, r8, r7, r6, r5, r4
	ret

.doDiv:
	movw r18, r16
	mov r20, r29
	mov r21, r28

	multiLdi0 r22, r23
	ldi16 r24, 0x3F80
	call __divsf3

	mov r16, r22
	mov r20, r23
	mov r10, r24
	mov r18, r25
	rjmp .return
