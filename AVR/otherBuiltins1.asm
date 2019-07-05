	.text

bzero:
	movw r20, r22
	ldi r22, 0
	ldi r23, 0
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

	ldi r24, 0
	ldi r25, 0

.return:
	ret





signbit:
signbitf:
signbitl:
	ldi r18, 0
	ldi r19, 0
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
