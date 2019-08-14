	.text

__rold:
	pushm.w #5, r10
	pushm.w #1, r4

	mov.w r1, r4
	mov.w r12, r8
	mov.w r13, r9

	mov.w r14, r10
	and.b #0x1F, r10

	mov.w r10, r14
	mov.w #0, r15
	call #__mspabi_slll

	mov.w r12, r6
	mov.w r13, r7

	mov.w r10, r14
	inv.w r14
	inc.w r14
	and.w #0x1F, r14

	mov.w r8, r12
	mov.w r9, r13
	call #__mspabi_srll

	bis.w r6, r12
	bis.w r7, r13

	popm.w #1, r4
	popm.w #5, r10
	ret





__rord:
	pushm.w #5, r10
	pushm.w #1, r4

	mov.w r1, r4
	mov.w r12, r8
	mov.w r13, r9

	mov.w r14, r10
	and.b #0x1F, r10

	mov.w r10, r14
	mov.w #0, r15
	call #__mspabi_srll

	mov.w r12, r6
	mov.w r13, r7

	mov.w r10, r14
	inv.w r14
	inc.w r14
	and.w #0x1F, r14

	mov.w r8, r12
	mov.w r9, r13
	call #__mspabi_slll

	bis.w r6, r12
	bis.w r7, r13

	popm.w #1, r4
	popm.w #5, r10
	ret





__rolq:
	pushm.w #7, r10

	mov.w r1, r4
	sub.w #8, r1

	mov.w r12, r5
	mov.w r13, r6
	mov.w r14, r7
	mov.w r15, r8

	mov.w 16(r4), r10
	and.b #0x3F, r10

	mov.w r10, @r1
	call #__ashldi3

	mov.w r12, r9
	mov.w r13, -2(r4)
	mov.w r14, -4(r4)
	mov.w r15, -6(r4)

	mov.w r10, r11
	inv.w r11
	inc.w r11
	and.w #0x3F, r11

	mov.w r11, @r1
	mov.w r5, r12
	mov.w r6, r13
	mov.w r7, r14
	mov.w r8, r15
	call #__lshrdi3

	bis.w r9, r12
	bis.w -2(r4), r13
	bis.w -4(r4), r14
	bis.w -6(r4), r15

	add.w #8, r1
	popm.w #7, r10
	ret





__rolq:
	pushm.w #7, r10

	mov.w r1, r4
	sub.w #8, r1

	mov.w r12, r5
	mov.w r13, r6
	mov.w r14, r7
	mov.w r15, r8

	mov.w 16(r4), r10
	and.b #0x3F, r10

	mov.w r10, @r1
	call #__lshrdi3

	mov.w r12, r9
	mov.w r13, -2(r4)
	mov.w r14, -4(r4)
	mov.w r15, -6(r4)

	mov.w r10, r11
	inv.w r11
	inc.w r11
	and.w #0x3F, r11

	mov.w r11, @r1
	mov.w r5, r12
	mov.w r6, r13
	mov.w r7, r14
	mov.w r8, r15
	call #__ashldi3

	bis.w r9, r12
	bis.w -2(r4), r13
	bis.w -4(r4), r14
	bis.w -6(r4), r15

	add.w #8, r1
	popm.w #7, r10
	ret
