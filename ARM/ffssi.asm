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
