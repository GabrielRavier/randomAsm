__parityhi2:
	pushm.w #1, r4
	mov.w r1, r4

	mov.w r12, r13
	rrum.w #4, r13
	rrum.w #4, r13
	xor.w r13, r12

	mov.w r12, r13
	rrum.w #4, r13
	xor.w r12, r13

	mov.w #0x6996, r12
	and.b #0xF, r13
	call #__mspabi_srai

	and.b #1, r12
	popm.w #1, r4
	ret





__paritysi2:
	pushm.w #2, r10
	pushm.w #1, r4
	mov.w r1, r4

	mov.w r12, r10
	mov.w r13, r9

	mov.b #16, r14
	call #__mspabi_srll
	xor.w r12, r10
	xor.w r13, r9

	mov.w r10, r12
	mov.w r9, r13
	call #__mspabi_srll_8
	xor.w r12, r10

	mov.w r10, r12
	xor.w r9, r13
	call #__mspabi_srll_4
	mov.w r10, r13
	xor.w r12, r13

	mov.w #0x6996, r12
	and.b #0xF, r13
	call #__mspabi_srai

	and.b #1, r12
	popm.w #1, r4
	popm.w #2, r10
	ret





__paritydi2:
	pushm.w #1, r4
	mov.w r1, r4

	xor.w r14, r12
	xor.w r15, r13
	call #__paritysi2

	popm.w #1, r4
	ret
