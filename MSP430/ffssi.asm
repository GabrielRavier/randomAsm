__ffssi2:
	pushm.w #1, r4
	mov.w r1, r4

	bis.w r12, r13
	cmp.w #0, r13
	jeq .eq

	call #__ctzhi2
	add.w #1, r12

	bit.w #0x8000, r12
	subc.w r13
	inv.w r13

	popm.w #1, r4
	ret

.eq:
	mov.w r13, r12

	bit.w #0x8000, r12
	subc.w r13
	inv.w r13

	popm.w #1, r4
	ret
