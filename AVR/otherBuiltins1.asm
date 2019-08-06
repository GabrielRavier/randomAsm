.include "standard.inc"

	.text

bzero:
	movw r20, r22
	multiLdi0 r22, r23
	jmp memset





ffsll:
	call __ffsdi2
	ret





ffsl:
	call __ffssi2
	ret





ffs:
	call __ffshi2
	ret





isascii:
	movw r18, r24
	andi r18, 0x80

	ldi r24, lo8(1)
	ldi r25, 0

	or r18, r19
	breq .return

	multiLdi0 r24, r25

.return:
	ret





signbit:
signbitf:
signbitl:
	multiLdi0 r18, r19
	movw r20, r18
	call __ltsf2

	rol r24
	clr r24
	rol r24
	ret





toascii:
	andi r24, 0x7F
	clr r25
	ret
