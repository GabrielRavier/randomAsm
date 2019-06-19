N_MAGIC:
	movw r30, r24
	ld r24, Z
	ldd r25, Z+1
	ret





N_MACHTYPE:
	movw r30, r24
	ldd r24, Z+2
	ret





N_FLAGS:
	movw r30, r24
	ldd r24, Z+3
	ret





N_SET_INFO:
	movw r20, r22

	ldi r22, 0
	ldi r23, 0

	movw r30, r24
	st Z, r20
	std Z+1, r21
	std Z+2, r22
	std Z+3, r23
	ret





N_BADMAG:
	movw r30, r24

	ld r20, Z
	ldd r21, Z+1
	ldd r22, Z+2
	ldd r23, Z+3

	clr r22
	clr r23

	movw r26, r22
	movw r24, r20

	subi r24, 7
	sbci r25, 1
	sbc r26, __zero_reg__
	sbc r27, __zero_reg__

	sbiw r24, 2
	cpc r26, __zero_reg__
	cpc r27, __zero_reg__
	brlo .ret0

	cpi r20, 0xB
	ldi r31, 1
	cpc r21, r31
	cpc r22, __zero_reg__
	cpc r23, __zero_reg__
	breq .ret0

	ldi r24, lo8(1)
	cpi r20, 0xCC
	cpc r21, __zero_reg__
	cpc r22, __zero_reg__
	cpc r23, __zero_reg__
	breq .ret0

	ret

.ret0:
	ldi r24, 0
	ret
