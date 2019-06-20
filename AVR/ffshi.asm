__ffshi2:
	clr r26
	cpse r24, __zero_reg__

.doJmp:
	jmp __loop_ffsqi2

	ldi r26, 8
	or r24, r25
	brne .doJmp

	ret
