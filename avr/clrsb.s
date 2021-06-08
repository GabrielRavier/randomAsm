.include "standard.inc"

	.text

__clrsbhi2:
	sbrc r24, 7
	rjmp .start

.continue:
	cpse r24, __zero_reg__
	rjmp .doClz

	ldi16 r24, 0xF
	ret

.doClz:
	mov __tmp_reg__, r24
	lsr r0

	sbc r25
	call __clzhi2
	sbiw r24, 1
	ret

.start:
	com r24
	rjmp .continue





__clrsbsi2:
	sbrc r25, 7
	rjmp .doNot

.continue:
	cpi32 r22, 0
	brne .doClz

	ldi16 r24, 7
	ret

.doClz:
	call __clzsi2
	sbiw r24, 1
	ret

.doNot:
	com32 r22
	rjmp .continue





__clrsbdi2:
	cpse r25, __zero_reg__
	rjmp .start

	mov r22, r24

.continue:
	cpse r22, __zero_reg__
	rjmp .clzWith8

	ldi16 r24, 0xF

.start:
	cpi r25, lo8(-1)
	breq .com2

	mov r22, r25
	sbrc r25, 7
	rjmp .com

.r18190:
	ldi16 r18, 0

.doClz:
	ldi16 r23, 0
	ldi r25, 0
	call __clzsi2

	add16 r24, r18
	sbiw r24, 1
	ret

.clzWith8:
	ldi16 r18, 8
	rjmp .doClz

.com2:
	mov r22, r24
	com r22
	rjmp .continue

.com:
	com r22
	rjmp .r18190
