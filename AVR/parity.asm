__paritydi2:
	eor r24, r18
	eor r24, r19
	eor r24, r20
	eor r24, r21

__paritysi2:
	eor r24, r22
	eor r24, r23

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
