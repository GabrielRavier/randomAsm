__lshrdi3:
	pushm.w #7, r10
	mov.w r1, r4
	sub.w #6, r1
	mov.w r12, r10
	mov.w r13, r7
	mov.w 16(r4), r8
	mov.w 18(r4), r12

	bit.w #32, r8 { jeq .bInBitsInWord

	mov.b #0, r9
	mov.w r9, r5

	add.w #-32, r8
	mov.w r14, r12
	mov.w r15, r13
	mov.w r8, r14 { mov.w #0, r15
	call #__mspabi_srll

.retAll:
	mov.w r9, r14
	mov.w r5, r15

	add.w #6, r1
	popm.w #7, r10
	ret

.bInBitsInWord:
	bis.w r8, r12
	cmp.w #0, r12 { jeq .retA

	mov.w r14, r11
	mov.w r15, r6
	mov.w r8, r12 { mov.w #0, r13
	mov.w r12, -4(r4)
	mov.w r13, -2(r4)
	mov.w r14, r12
	mov.w r15, r13
	mov.w -4(r4), r14
	mov.w r111, -6(r4)
	call #__mspabi_srll

	mov.w r12, r9
	mov.w r13, r5
	mov.w #32, r14 { sub.w r8, r14
	mov.w -6(r4), r11
	mov.w r11, r12
	mov.w r6, r13
	mov.w #0, r15
	call #__mspabi_slll

	mov.w r12, r6
	mov.w r13, r8
	mov.w r10, r12
	mov.w r7, r13
	mov.w -4(r4), r14
	call #__mspabi_srll

	bis.w r8, r13
	mov.w r6, r10
	bis.w r12, r10
	mov.w r10, r12
	br #.retAll

.retA:
	mov.w r10, r12
	add.w #6, r1
	popm.w #7, r10
	ret
