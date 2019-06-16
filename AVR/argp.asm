__argp_usage:
	lds r22, __iob+4
	lds r23, __iob+5
	ldi r20, lo8(262)
	ldi r21, hi8(262)
	rcall __argp_state_help
	ret





__option_is_short:
	mov r30, r24
	mov r31, r25

	ldd r18, Z+6
	sbrc r24, 3
	rjmp .ret0

	ldd r24, Z+2
	ldd r25, Z+3

	mov r18, r24
	mov r19, r25

	subi r18, lo8(1)
	sbci r19, hi8(1)

	cpi r18, 0xFF
	cpc r19, __zero_reg__
	brlo .continue

.ret0:
	ldi r24, lo8(0)
	ldi r25, hi8(0)
	ret

.continue:
	rcall isprint
	ldi r18, lo8(1)
	ldi r19, hi8(1)
	sbiw r24, 0
	brne .return

	ldi r18, lo8(0)
	ldi r19, lo8(0)

.return:
	mov r24, r18
	mov r25, r19
	ret





__option_is_end:
	mov r30, r24
	mov r31, r25
	ldd r24, Z+2
	ldd r25, Z+3
	sbiw r24, 0
	brne .ret0

	ld r24, Z
	ldd r25, Z+1
	sbiw r24, 0
	breq .continue

.ret0:
	ldi r18, lo8(0)
	ldi r19, hi8(0)

.return:
	mov r24, r18
	mov r25, r19
	ret

.continue:
	ldd r24, Z+8
	ldd r25, Z+9
	sbiw r24, 0
	brne .ret0

	ldi r18, lo8(1)
	ldi r19, hi8(1)

	ldd r24, Z+10
	ldd r25, Z+11
	sbiw r24, 0
	breq .l10
	rjmp .l14
