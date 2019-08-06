.include "standard.inc"

	.text

__lshrdi3:
	mov __tmp_reg__, r16

.loop:
	cpi r16, 8
	brlo .check

	subi r16, 8
	mov r18, r19
	mov r19, r20
	mov r20, r21
	mov r21, r22
	mov r22, r23
	mov r23, r24
	mov r24, r25
	mov r25, __tmp_reg__
	rjmp .loop

.doAsr:
	asr __tmp_reg__
	multiRor r25, r24, r23, r22, r21, r20, r19, r18

.check:
	dec r16
	brpl .doAsr

	clr __zero_reg__
	mov r16, __tmp_reg__
	ret
