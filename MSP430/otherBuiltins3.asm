fabsf:
	pushm.w #1, r4
	mov.w r1, r4
	and.w #0x7FFF, r13
	popm.w #1, r4
	ret





fabsl:
	pushm.w #1, r4
	mov.w r1, r4
	and.w #0x7FFF, r15
	popm.w #1, r4
	ret
