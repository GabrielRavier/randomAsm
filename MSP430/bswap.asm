bswap16:
	pushm.w #1, r4
	mov.w r1, r4

	mov.w r12, r13

	rpt #8
	rlax.w r13

	rrum.w #4, r12
	rrum.w #4, r12

	bis.w r13, r12

	popm.w #1, r4
	ret





bswap32:
__bswapsi2:
	pushm.w #4, r10
	pushm.w #1, r4
	mov.w r1, r4

	mov.w r12, r8
	mov.w r13, r9

	mov.b #24, r14
	call #__mspabi_srll
	mov.w r12, r10
	mov.w r13, r7

	mov.w r8, r12
	mov.w r9, r13
	mov.b #24, r14
	call #__mspabi_srll
	bis.w r12, r10
	bis.w r13, r7

	mov.w r8, r12
	mov.w r9, r13
	call #__mspabi_srll_8
	and.w #-0x100, r12

	bis.w r12, r10

	mov.w r8, r12
	mov.w r9, r13
	call #__mspabi_slll_8
	and.W #0xFF, r12

	mov.w r10, r12
	bis.w r7, r13

	popm.w #1, r4
	popm.w #4, r10
	ret





bswap64:
__bswapdi2:
	pushm.w #7, r10
	mov.w r1, r4

	sub.w #8, r1
	mov.w r12, r7
	mov.w r13, r8
	mov.w r14, r9
	mov.w r15, r10

	mov.w #__lshrdi3, r5
	mov.w #56, @r1
	call r5

	mov.w r12, -2(r4)
	mov.w r13, r6
	mov.w r14, -4(r4)
	mov.w r15, -6(r4)

	mov.w r7, r12
	mov.w r8, r13
	mov.w r9, r14
	mov.w r10, r15
	call #__ashldi3

	bis.w -2(r4), r12
	mov.w r12, -2(r4)
	bis.w r13, r5
	bis.w -4(r4), r14
	mov.w r14, -4(r4)
	bis.w -6(r4), r15
	mov.w r15, -6(r4)

	mov.w #40, @r1
	mov.w r7, r12
	mov.w r8, r13
	mov.w r9, r14
	mov.w r10, r15
	call r5
	and.w #-0x100, r12

	bis.w -2(r4), r12
	mov.w r12, -2(r4)

	mov.w #24, @r1
	mov.w r7, r12
	mov.w r8, r13
	mov.w r9, r14
	mov.w r10, r15
	call r5
	and #0xFF, r13

	bis.w r13, r6

	mov.w #8, @r1
	mov.w r7, r12
	mov.w r8, r13
	mov.w r9, r14
	mov.w r10, r15
	call r5
	and.w #-0x100, r13

	bis.w r13, r6

	mov.w r7, r12
	mov.w r8, r13
	mov.w r9, r14
	mov.w r10, r15
	call #__ashldi3
	mov.b r14, r5

	bis.w -4(r4), r5

	mov.w #24, @r1
	mov.w r7, r12
	mov.w r8, r13
	mov.w r9, r14
	mov.w r10, r15
	call #__ashldi3
	and.w #-0x100, r14

	bis.w r14, r5

	mov.w #40, @r1
	mov.w r7, r12
	mov.w r8, r13
	mov.w r9, r14
	mov.w r10, r15
	call #__ashldi3
	and.w #0xFF, r15

	mov.w -2(r4), r12
	mov.w r6, r13
	mov.w r5, r14
	bis.w -6(r4), r15
	add.w #8, r1

	popm.w #7, r10
	ret
