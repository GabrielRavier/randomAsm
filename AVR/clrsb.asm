__clrsbhi2:
	sbrc r24, 7
	rjmp .start

.continue:
	cpse r24, __zero_reg__
	rjmp .doClz

	ldi r24, lo8(15)
	ldi r25, 0
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
	cp r22, __zero_reg__
	cpc r23, __zero_reg__
	cpc r24, __zero_reg__
	cpc r25, __zero_reg__
	brne .doClz

	ldi r24, lo8(7)
	ldi r25, 0
	ret

.doClz:
	call __clzsi2
	sbiw r24, 1
	ret

.doNot:
	com r22
	com r23
	com r24
	com r25
	rjmp .continue





__clrsbdi2:
	cpse r25, __zero_reg__
	rjmp .start

	mov r22, r24

.continue:
	cpse r22, __zero_reg__
	rjmp .clzWith8

	ldi r24, lo8(15)
	ldi r25, 0

.start:
	cpi r25, lo8(-1)
	breq .com2

	mov r22, r25
	sbrc r25, 7
	rjmp .com

.r18190:
	ldi r18, 0
	ldi r19, 0

.doClz:
	ldi r23, 0
	ldi r24, 0
	ldi r25, 0
	call __clzsi2

	add r24, r18
	adc r25, r19
	sbiw r24, 1
	ret

.clzWith8:
	ldi r18, lo8(8)
	ldi r19, 0
	rjmp .doClz

.com2:
	mov r22, r24
	com r22
	rjmp .continue

.com:
	com r22
	rjmp .r18190
