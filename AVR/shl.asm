__ashldi3:
	mov __tmp_reg__, r16

.loop8:
	cpi r16, 8
	brlo .doLast8

	mov r25, r24
	mov r24, r23
	mov r23, r22
	mov r22, r21
	mov r21, r20
	mov r20, r19
	mov r19, r18
	clr r18
	subi r16, 8
	rjmp .loop8

.last8Loop:
	lsl r18
	rol r19
	rol r20
	rol r21
	rol r22
	rol r23
	rol r24
	rol r25

.doLast8:
	dec r16
	brpl .last8Loop

	mov r16, __tmp_reg__
	ret
