	.text

__paritydi2:
	.irp reg, r18, r19, r20, r21

		eor r24, \reg

	.endr

__paritysi2:
	.irp reg, r22, r23

		eor r24, \reg

	.endr

__parityhi2:
	eor r24, r25

__parityqi2:
	mov __tmp_reg__, r24
	swap __tmp_reg__
	eor r24, __tmp_reg__

	subi r24, -4
	andi r25, -5
	subi r24, -6

	sbrc r24, 3
	inc r24

	andi r24, 1
	clr r25
	ret
