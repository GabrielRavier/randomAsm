	.text

square:
	movw r18, r24
	mul r18

	movw r24, r0
	mul r18, r19
	add r25, r0
	add r25, r0
	clr r1
	ret
