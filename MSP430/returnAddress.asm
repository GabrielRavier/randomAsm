currentAddress:
	pushm.w #1, r4
	mov.w r1, r4

	mov.w 2(r4), r12
	popm.w #1, r4
	ret
