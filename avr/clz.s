.include "standard.inc"

	.text

__clzhi2:
	clr r26
	tst r25
	brne .continue

	subi r28, -8
	or r25, r24
	brne .continue

	ldi r24, 0x10
	ret

.continue:
	cpi r25, 0x10
	brsh .noSwap

	subi r26, -3
	swap r25

.loop:
	inc r26

.noSwap:
	lsl r25
	brcc .loop

	mov r24, r26
	clr r25
	ret





__clzsi2:
	call __clzhi2
	sbrs r24, 4
	ret

	movw r24, r22
	call __clzhi2

	subi r24, -0x10
	ret





__clzdi2:
	call __clzsi2
	sbrs r24, 5
	ret

	mov32 r22, r18
	call __clzsi2

	subi r24, -0x20
	ret
