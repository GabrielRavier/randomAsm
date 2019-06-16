N_MAGIC:
	mov r30, r24
	mov r31, r25
	ld r24, Z
	ldd r25, Z+1
	ret





N_MACHTYPE:
	mov r30, r24
	mov r31, r25
	ldd r24, Z+2
	ret





N_FLAGS:
	mov r30, r24
	mov r31, r25
	ldd r24, Z+3
	ret





N_SET_INFO:
	mov r20, r22
	mov r21, r23

	ldi r22, lo8(0)
	ldi r23, hi8(0)

	mov r30, r24
	mov r31, r25
	st Z, r20
	std Z+1, r21
	std Z+2, r22
	std Z+3, r23
	ret





N_BADMAG:
	mov r30, r24
	mov r31, r25

	ld r20, Z
	ldd r21, Z+1
	ldd r22, Z+2
	ldd r23, Z+3

	andi r22, hlo8(0xFFFF)
	andi r23, hhi8(0xFFFF)

	mov r27, r21
	mov r26, r20
	mov r25, r19
	mov r24, r18

	subi r24, lo8(263)
	sbci r25, hi8(263)
	sbci r26, hlo8(263)
	sbci r27, hhi8(263)

	cpi r24, lo8(2)
	cpc r25, __zero_reg__
	cpc r26, __zero_reg__
	cpc r27, __zero_reg__
	brlo .ret0

	cpi r20, lo8(0x10B)
	ldi r31, hi8(0x10B)
	cpc r21, r31
	ldi r31, hlo8(0x10B)
	cpc r22, r31
	ldi r31, hhi8(0x10B)
	cpc r23, r31
	breq .ret0

	ldi r24, lo8(1)
	cpi r20, lo8(0xCC)
	cpc r21, __zero_reg__
	cpc r22, __zero_reg__
	cpc r23, __zero_reg__
	breq .ret0

	ret

.ret0:
	ldi r24, lo8(0)
	ret
