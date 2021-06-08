	.text

__popcounthi2:
	call __popcountqi2
	push r24
	mov r24, r25
	call __popcountqi2
	clr r25

__popcounthi2_tail:
	pop __tmp_reg__
	add r24, __tmp_reg__
	ret





__popcountqi2:
	mov __tmp_reg__, r24
	andi r24, 1

	lsr __tmp_reg__

	.rept 6

		lsr __tmp_reg__
		adc r24, __zero_reg__

	.endr

	ret





__popcountsi2:
	call __popcounthi2
	push r24
	movw r24, r22
	call __popcounthi2
	jmp __popcounthi2_tail





__popcountdi2:
	call __popcountsi2
	push r24
	mov32 r22, r18
	call __popcountsi2
	jmp __popcounthi2_tail
