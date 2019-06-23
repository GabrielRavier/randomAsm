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
	lsr __tmp_reg__
	adc r24, __zero_reg__
	lsr __tmp_reg__
	adc r24, __zero_reg__
	lsr __tmp_reg__
	adc r24, __zero_reg__
	lsr __tmp_reg__
	adc r24, __zero_reg__
	lsr __tmp_reg__
	adc r24, __zero_reg__
	lsr __tmp_reg__
	adc r24, __zero_reg__
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
	movw r22, r18
	movw r24, r20
	call __popcountsi2
	jmp __popcounthi2_tail
