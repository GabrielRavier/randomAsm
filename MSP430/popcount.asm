	.text

__popcounthi2:
	pushm.w #1, r4
	mov.w r1, r4

	mov.w #__popcount_tab, r13
	mov.w r12, r14
	and.b #0xFF, r14
	add.w r13, r14

	rrum.w #4, r12
	rrum.w #4, r12
	add.w r12, r13

	mov.b @r13, r12
	mov.b @r14, r14
	add.w r14, r12

	popm.w #1, r4
	ret





__popcountsi2:
	pushm.w #3, r10
	pushm.w #1, r4
	mov.w r1, r4

	mov.w r12, r14
	mov.w r13, r15

	clrc
	rrc.w r15
	rrc.w r14

	mov.w r14, r10
	and.w #0x5555, r10
	mov.w r15, r11
	and.w #0x5555, r11
	mov.w r12, r14
	mov.w r13, r15

	sub r10, r14
	subc r11, r15

	mov.w r14, r12
	mov.w r15, r13

	rrux.w r13
	rrc.w r12
	rrux.w r13
	rrc.w r12

	mov.w r12, r10
	and.w #0x3333, r10
	mov.w r13, r9
	and.w #0x3333, r9
	mov.w r14, r12
	and.w #0x3333, r12
	mov.w r15, r13
	and.w #0x3333, r13

	add r12, r10
	addc r13, r9

	mov.w r10, r12
	mov.w r9, r13
	call #__mspabi_srll_4

	add r10, r12
	addc r13, r9
	mov.w r12, r10
	and.w #0xF0F, r10
	mov.w r9, r8
	and.w #0xF0F, r8

	mov.w r10, r12
	mov.w r8, r13
	mov.b #0x10, r14
	call #__mspabi_srll

	add r12, r10
	addc r8, r13

	mov.w r10, r12
	call #__mspabi_srll_8
	add.w r10, r12

	and.b #0x3F, r12

	popm.w #1, r4
	popm.w #3, r10
	ret





__popcountdi2:
	pushm.w #7, r10
	mov.w r1, r4

	sub.w #12, r1
	mov.w r12, r5
	mov.w r13, r9
	mov.w r14, r6
	mov.w r15, r8

	mov.w #__lshrdi3, r7
	mov.w #1, @r1
	call r7

	and.w #0x5555, r12
	and.w #0x5555, r13
	and.w #0x5555, r14
	and.w #0x5555, r15

	mov.w r5, r10
	sub.w r12, r10

	mov.b #1, r12

	cmp.w r10, r5
	jlo .no0

	mov.b #0, r12

.no0:
	mov.w r9, r5
	sub.w r13, r5

	mov.b #1, r13

	cmp.w r5, r9
	jlo .no02

	mov.b #0, r13

.no02:
	mov.w r5, r9
	sub.w r12, r9

	mov.b #1, r12

	cmp.w r9, r5
	jlo .no03

	mov.b #0, r12

.no03:
	bis.w r12, r13

	mov.w r6, r5
	sub.w r14, r5

	mov.b #1, r12

	cmp.w r5, r6
	jlo .no04

	mov.b #0, r12

.no04:
	mov.w r5, r6
	sub.w r13, r6

	mov.b #1, r13

	cmp.w r6, r5
	jlo .no05

	mov.b #0, r13

.no05:
	bis.w r13, r12
	sub.w r15, r8
	sub.w r12, r8

	mov.w #2, @r1
	mov.w r10, r12
	mov.w r9, r13
	mov.w r6, r14
	mov.w r8, r15
	call r7

	and.w #0x3333, r12
	and.w #0x3333, r13
	and.w #0x3333, r14
	and.w #0x3333, r15
	and.w #0x3333, r10
	and.w #0x3333, r9
	and.w #0x3333, r6
	and.w #0x3333, r8

	add.w r12, r10
	mov.b #1, r11

	cmp.w r12, r10
	jlo .no06

	mov.b #0, r11

.no06:
	mov.w r13, r12
	add.w r9, r12
	mov.b #1, r5

	cmp.w r13, r12
	jlo .no07

	mov.b #0, r5

.no07:
	mov.w r11, r9
	add.w r12, r9
	mov.b #1, r13

	cmp.w r12, r9
	jlo .no08

	mov.b #0, r13

.no08:
	bis.w r13, r5
	add.w r14, r6
	mov.b #1, r12

	cmp.w r14, r6
	jlo .no09

	mov.b #0, r12

.no09:
	add.w r6, r5
	mov.b #1, r13

	cmp.w r6, r5
	jlo .no10

	mov.b #0, r13

.no10:
	bis.w r13, r12
	add.w r15, r8
	add.w r12, r8

	mov.w #4, @r1
	mov.w r10, r12
	mov.w r9, r13
	mov.w r5, r14
	mov.w r8, r15
	call r7

	mov.w r12, r6
	add.w r10, r6
	mov.b #1, r10

	cmp.w r12, r6
	jlo .no011

	mov.b #0, r10

.no011:
	add.w r13, r9
	mov.b #1, r11

	cmp.w r13, r9
	jlo .no012

	mov.b #0, r11

.no012:
	mov.w r10, r12
	add.w r9, r12
	mov.b #1, r13

	cmp.w r9, r12
	jlo .no013

	mov.b #0, r13

.no013:
	bis.w r13, r11
	add.w r14, r5
	mov.b #1, r10

	cmp.w r14, r5
	jlo .no014

	mov.b #0, r10

.no014:
	mov.w r11, r13
	add.w r5, r13
	mov.b #1, r14

	cmp.w r5, r13
	jlo .no015

	mov.b #0, r14

.no015:
	bis.w r14, r10
	add.w r8, r15
	add.w r10, r15

	mov.w r6, r8
	and.w #0xF0F, r8
	mov.w r12, r9
	and.w #0xF0F, r9
	mov.w r13, r10
	and.w #0xF0F, r10
	mov.w r15, r11
	and.w #0xF0F, r11

	mov.w #32, @r1
	mov.w r8, r12
	mov.w r9, r13
	mov.w r10, r14
	mov.w r11, r15
	mov.w r11, -10(r4)
	call r7

	mov.w r12, -8(r4)
	mov.w r13, -6(r4)
	mov.w r14, -4(r4)
	mov.w r15, -2(r4)

	add -8(r4), r8
	addc -6(r4), r9

	mov.w r8, r12
	mov.w r9, r13
	mov.b #0x10, r14
	call #__mspabi_srll

	mov.w r8, r10
	add r12, r10
	addc r9, r13

	mov.w r10, r12
	call #__mspabi_srll_8
	add.w r10, r12

	and.b #0x7F, r12
	add.w #0xC, r1

	popm.w #7, r10
	ret





__popcount_tab:
	.byte 0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4, 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5, 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5, 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6, 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5, 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6, 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6, 3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7, 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5, 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6, 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6, 3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7, 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6, 3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7, 3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7, 4, 5, 5, 6, 5, 6, 6, 7, 5, 6, 6, 7, 6, 7, 7, 8
