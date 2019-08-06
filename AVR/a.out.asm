.include "standard.inc"

	.text

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

	ldi016 r22

	movw r30, r24
	st Z, r20
	std Z+1, r21
	std Z+2, r22
	std Z+3, r23
	ret





N_BADMAG:
	movw r30, r24

	ld r20, Z
	multiLdd "r21, Z+1", "r22, Z+2", "r23, Z+3"

	multiClr r22, r23
	multiMovw "r26, r22", "r24, r20"

	subi r24, 7
	sbci r25, 1
	multiSbcZR r26, r27

	sbiw r24, 2
	multiCpcZR r26, r27
	brlo .ret0

	cpi r20, 0xB
	ldi r31, 1
	cpc r21, r31
	multiCpcZR r22, r23
	breq .ret0

	ldi r24, lo8(1)
	cpi r20, 0xCC
	multiCpcZR r21, r22, r23
	breq .ret0

	ret

.ret0:
	ldi r24, 0
	ret
