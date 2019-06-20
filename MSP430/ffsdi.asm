__ffsdi2:
	pushm.w #1, r10
	pushm.w #1, r4
	mov.w r1, r4

	bis.w r12, r13
	cmp.w #0, r13
	jne .ne

	mov.w r14, r10
	mov.w r14, r12
	mov.w r15, r13

	bis.w r15, r14
	cmp.w #0, r14
	jne .ne2

	popm.w #1, r4
	popm.w #1, r10
	ret

.ne:
	call #__ctzhi2
	add.w #1, r12

	bit.w #0x8000, r12
	subc.w r13
	inv.w r13, r13

	popm.w #1, r4
	popm.w #1, r10
	ret

.ne2:
	call #__ctzhi2
	add.w #0x21, r12
	mov.w #0, r13

	popm.w #1, r4
	popm.w #1, r10
	ret
