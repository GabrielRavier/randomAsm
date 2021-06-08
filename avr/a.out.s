.include "standard.inc"

	.text

N_MAGIC:
	movw r30, r24
	ld16 r24, Z, 0
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

	ldi16 r22, 0

	movw r30, r24
	st32 Z, 0, r20
	ret





N_BADMAG:
	movw r30, r24

	ld32 r20, Z, 0

	multiClr r22, r23
	mov32 r24, r20

	subi16 r24, 0x107
	multiSbcZR r26, r27

	sbiw r24, 2
	multiCpcZR r26, r27
	brlo .ret0

	cpi r20, 0xB
	ldi r31, 1
	cpc r21, r31
	multiCpcZR r22, r23
	breq .ret0

	ldi r24, 1
	cpi r20, 0xCC
	multiCpcZR r21, r22, r23
	breq .ret0

	ret

.ret0:
	ldi r24, 0
	ret
