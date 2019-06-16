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
	mov r31, r20
	clr r31
	ldi r30, lo8(0)
	or r22, r30
	or r23, r31

	mov r21, r18
	clr r21
	ldi r20, lo8(0)
	or r22, r20
	or r23, r21

	mov r18, r22
	mov r19, r23
	ldi r20, lo8(0)
	ldi r21, lo8(0)

	mov r30, r24
	mov r31, r25
	st Z, r18
	std Z+1, r19
	std Z+2, r20
	std Z+3, r21
	ret





N_BADMAG:
	mov r30, r24
	mov r31, r25

	ld r28, Z
	ldd r19, Z+1
	ldd r20, Z+2
	ldd r21, Z+3

	andi r20, hlo8(0xFFFF)
	andi r21, hhi8(0xFFFF)

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

	cpi r18, lo8(0x10B)
	ldi r31, hi8(0x10B)
	cpc r19, r31
	ldi r31, hlo8(0x10B)
	cpc r20, r31
	ldi r31, hhi8(0x10B)
	cpc r21, r31
	breq .ret0

	ldi r24, lo8(1)
	cpi r18, lo8(0xCC)
	cpc r19, __zero_reg__
	cpc r20, __zero_reg__
	cpc r21, __zero_reg__
	breq .ret0

	ret

.ret0:
	ldi r24, lo8(0)
	ret
