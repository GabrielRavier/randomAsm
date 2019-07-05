	.text

__ffsdi2:
	push r28
	push r29

	in r28, __SP_L__
	in r29, __SP_H__
	sbiw r28, 8
	in __tmp_reg__, __SREG__
	cli

	out __SP_H__, r29
	out __SREG__, __tmp_reg__
	out __SP_L__, r28

	std Y+1, r18
	std Y+2, r19
	std Y+3, r20
	std Y+4, r21
	std Y+5, r22
	std Y+6, r23
	std Y+7, r24
	std Y+8, r25

	ldd r24, Y+1
	ldd r25, Y+2
	ldd r26, Y+3
	ldd r27, Y+4

	sbiw r24, 0
	cpc r26, __zero_reg__
	cpc r27, __zero_reg__
	brne .ne

	ldd r22, Y+5
	ldd r23, Y+6
	ldd r24, Y+7
	ldd r25, Y+8

	cp r22, __zero_reg__
	cpc r23, __zero_reg__
	cpc r24, __zero_reg__
	cpc r25, __zero_reg__
	brne .ne2

.return:
	adiw r28, 8
	in __tmp_reg__, __SREG__
	cli

	out __SP_H__, r29
	out __SREG__, __tmp_reg__
	out __SP_L__, r28
	pop r29
	pop r28
	ret

.ne:
	call __ctzhi2
	adiw r24, 1
	movw r22, r24
	lsl r25
	sbc r24
	sbc r25
	rjmp .return

.ne2:
	movw r24, r22
	call __ctzhi2
	adiw r24, 0x21
	movw r22, r24
	ldi r24, 0
	ldi r25, 0
	rjmp .return





__ffssi2:
	clr r26
	tst r22
	brne .toLoop

	subi r26, -8
	or r22, r23
	brne .toLoop

	subi r26, -8
	or r22, r24
	brne .toLoop

	subi r26, -8
	or r22, r25
	brne .toLoop
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
