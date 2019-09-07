.include "standard.inc"

	.text

START_FUNC __ror
	pushm.w #5, r10
	pushm.w #1, r4
	mov.w r1, r4
	mov32 r12, r8

	mov.w r14, r10
	and.b #0x1F, r10

	mov.w r10, r14
	call #__mspabi_srll

	mov32 r12, r6
	mov32 r8, r12

	mov.w r10, r14
	inv.w r14
	inc.w r14
	and.w #0x1F, r14
	call #__mspabi_slll

	bis32 r6, r12
	popm.w #1, r4
	popm.w #5, r10
	ret
END_FUNC __ror





START_FUNC __rorll
	pushm.w #7, r10
	mov.w r1, r4
	sub.w #8, r1
	mov64 r12, r5

	mov.w 0x10(r4), r10
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
	mov64 r5, r12
	call #__ashldi3

	bis.w r9, r12
	bis.w -2(r4), r13
	bis.w -4(r4), r14
	bis.w -6(r4), r15

	add.w #8, r1
	popm.w #7, r10
	ret
END_FUNC __rorll





START_FUNC __rev16
	pushm.w #1, r4
	mov.w r1, r4

	call #__bswapsi2
	mov.w r12, r14
	mov.w r13, r12
	mov.w r14, r13

	popm.w #1, r4
	ret
END_FUNC __rev16





START_FUNC __rev16ll
	pushm.w #5, r10
	pushm.w #1, r4
	mov.w r1, r4
	sub.w #2, r1
	mov32 r12, r9

	mov.w #0x20, @r1
	call #__lshrdi3

	mov.w #__bswapsi2, r6
	call r6
	mov32 r12, r7
	mov32 r9, r12

	call r6
	mov.w r12, r10
	mov.w r13, r9

	mov.w r8, r12
	mov.w r7, r13
	mov.b #0, r14
	mov.w r14, r15
	call #__ashldi3

	bis32 r9, r12
	add.w #2, r1
	popm.w #1, r4
	popm.w #5, r10
	ret
END_FUNC __rev16ll
