	.text

__rotldi3:
	push r16

.loop8:
	cpi r16, 8
	brlo .less8

	subi r16, 8
	mov __tmp_reg__, r25
	mov r25, r24
	mov r24, r23
	mov r23, r22
	mov r22, r21
	mov r21, r20
	mov r20, r19
	mov r19, r18
	mov r18, __tmp_reg__
	rjmp .loop8

.loop:
	lsl64 r18
	adc r18, __zero_reg__

.less8:
	dec r16
	brpl .loop

	pop r16
	ret
