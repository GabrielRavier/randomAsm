.include "standard.inc"

	.text

__ffsdi2:
	multiPush r28, r29

	doSPProlog 8

	st64 Y, 1, r18
	ld32 r24, Y, 1

	sbiw r24, 0
	multiCpcZR r26, r27
	brne .ne

	ld32 r22, Y, 5

	cp r22, __zero_reg__
	multiCpcZR r23, r24, r25
	brne .ne2

.return:
	doSPEpilog 8
	multiPop r29, r28
	ret

.ne:
	call __ctzhi2
	adiw r24, 1
	movw r22, r24
	lsl r25
	multiSbc r24, r25
	rjmp .return

.ne2:
	movw r24, r22
	call __ctzhi2
	adiw r24, 0x21
	movw r22, r24
	ldi016 r24
	rjmp .return





__ffssi2:
	clr r26
	tst r22
	brne .toLoop

	.irp reg, r23, r24, r25

		subi r26, -8
		or r22, \reg
		brne .toLoop

	.endr

	ret

.toLoop:
	mov r24, r22
	jmp __loop_ffsqi2





__ffshi2:
	clr r26
	cpse r24, __zero_reg__

.doJmp:
	jmp __loop_ffsqi2

	ldi r26, 8
	or r24, r25
	brne .doJmp

	ret





__loop_ffsqi2:
.loop:
	inc r26
	lsr r24
	brcc .loop

	mov r24, r26
	clr r25
	ret
