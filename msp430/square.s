	.text

square:
	pushm.w #1, r4
	mov.w r1, r4

	push.w sr
	dint
	nop
	mov.w r12, &0x132
	mov.w r12, &0x138
	mov.w &0x13A, r12
	mov.w &0x13C, r12
	pop.w sr

	popm.w #1, r4
	ret
