	.text

currentAddress:
	push r29

	in r30, __SP_L__
	in r31, __SP_H__
	subi r30, lo8(-3)
	sbci r31, hi8(-3)

	ld r24, Z
	ldd r25, Z+1

	eor r25, r24
	eor r24, r25
	eor r25, r24

	pop r29
	ret
