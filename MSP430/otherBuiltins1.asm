	.text

bzero:
	pushm.w #1, r4
	mov.w r1, r4

	mov.w r13, r14
	mov.b #0, r13
	call #memset

	popm.w #1, r4
	ret





ffsll:
	pushm.w #1, r4
	mov.w r1, r4
	call #__ffsdi2
	popm.w #1, r4
	ret





ffsl:
	pushm.w #1, r4
	mov.w r1, r4
	call #__ffssi2
	popm.w #1, r4
	ret





ffs:
	pushm.w #1, r4
	mov.w r1, r4
	call #__ffshi2
	popm.w #1, r4
	ret





isascii:
	pushm.w #1, r4
	mov.w r1, r4

	mov.b #1, r13

	bit.w #-0x80, r12
	beq .return

	mov.b #0, r13

.return:
	mov.w r13, r12
	popm.w #1, r4
	ret





toascii:
	pushm.w #1, r4
	mov.w r1, r4

	and.b #0x7F, r12
	popm.w #1, r4
	ret
