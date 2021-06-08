	.text

__mspabi_mpyll:
__mspabi_mpyll_hw:
__muldi3:
	pushm.w #5, r10
	pushm.w #1, r4
	mov.w r1, r4
	sub.w #0x20, r1

	mov.w r8, -8(r4)
	mov.w r9, -6(r4)
	mov.w r10, -4(r4)
	mov.w r11, -2(r4)

	mov.w r12, -16(r4)
	mov.w r13, -14(r4)
	mov.w r14, -12(r4)
	mov.w r15, -10(r4)

	mov.w -8(r4), -24(r4)
	mov.w -6(r4), -22(r4)
	mov.w -16(r4), -20(r4)
	mov.w -14(r4), -18(r4)
	mov.w -16(r4), r14
	mov.w -14(r4), r15
	mov.w -8(r4), r12
	mov.w -6(r4), r13
	call #__muldsi3

	mov.w r12, r8
	mov.w r13, r9
	mov.w r14, r10
	mov.w r15, r11

	mov.w -20(r4), r12
	mov.w -18(r4), r13
	mov.w -4(r4), r6
	mov.w -2(r4), r7

	push.w sr
	dint
	nop
	mov.w r12, &0x140
	mov.w r13, &0x142
	mov.w r6, &0x150
	mov.w r7, &0x152
	mov.w &0x154, r12
	mov.w &0x156, r13
	mov.w &0x158, r14
	mov.w &0x15A, r15
	pop.w sr

	mov.w r12, -32(r4)
	mov.w r13, -30(r4)
	mov.w -12(r4), r12
	mov.w -10(r4), r13
	mov.w -24(r4), r6
	mov.w -22(r4), r7

	push.w sr
	dint
	nop
	mov.w r12, &0x140
	mov.w r13, &0x142
	mov.w r6, &0x150
	mov.w r7, &0x152
	mov.w &0x154, r12
	mov.w &0x156, r13
	mov.w &0x158, r14
	mov.w &0x15A, r15
	pop.w sr

	mov.w r12, -8(r4)
	mov.w r13, -6(r4)
	mov.w -32(r4), r12
	mov.w -30(r4), r13

	add -8(r4), r12
	addc -6(r4), r13
	add r12, r10
	addc r13, r11

	mov.w r8, r12
	mov.w r9, r13
	mov.w r10, r14
	mov.w r11, r15

	add.w #0x20, r1
	popm.w #1, r4
	popm.w #5, r10
	ret





__muldsi3:
	pushm.w #7, r10
	mov.w r1, r4
	sub.w #28, r1

	mov.w r12, r10
	mov.w r13, -12(r4)
	mov.w r14, r5
	mov.w r15, -18(r4)

	mov.w r12, r6
	mov.b #0, r7
	mov.w r14, r8
	mov.w r7, r9
	mov.w r7, r13

	push.w sr
	dint
	nop
	mov.w r12, &0x140
	mov.w r13, &0x142
	mov.w r6, &0x150
	mov.w r7, &0x152
	mov.w &0x154, r12
	mov.w &0x156, r13
	mov.w &0x158, r14
	mov.w &0x15A, r15
	pop.w sr

	mov.w r12, -8(r4)
	mov.w r13, -6(r4)
	mov.w r14, -4(r4)
	mov.w r15, -2(r4)

	mov.b #0x10, r14
	call #__mspabi_srll

	mov.w r12, -16(r4)
	mov.w r13, -14(r4)

	mov.w r10, r12
	mov.w -12(r4), r13
	mov.b #0x10, r14
	call #__mspabi_srll

	mov.w r12, -12(r4)
	mov.w r13, -10(r4)

	push.w sr
	dint
	nop
	mov.w r8, &0x140
	mov.w r9, &0x142
	mov.w r12, &0x150
	mov.w r13, &0x152
	mov.w &0x154, r8
	mov.w &0x156, r9
	mov.w &0x158, r10
	mov.w &0x15A, r11
	pop.w sr

	mov.w -16(r4), r13
	mov.w -14(r4), r14

	add r8, r13
	addc r9, r14

	mov.w r13, -16(r4)
	mov.w r14, -14(r4)

	mov.w -8(r4), r10

	mov.w r13, r12
	mov.w r14, r13
	mov.b #0x10, r14
	call #__mspabi_slll

	add r12, r10
	addc r7, r13

	mov.w r10, r12
	mov.b #0x10, r14
	call #__mspabi_srll

	mov.w r12, -8(r4)
	mov.w r13, -6(r4)

	mov.w r5, r12
	mov.w -18(r4), r13
	mov.b #0x10, r14
	call #__mspabi_srll

	mov.w r12, r8
	mov.w r13, r9
	mov.w r6, r12
	mov.w r7, r13

	push.w sr
	dint
	nop
	mov.w r12, &0x140
	mov.w r13, &0x142
	mov.w r8, &0x150
	mov.w r9, &0x152
	mov.w &0x154, r12
	mov.w &0x156, r13
	mov.w &0x158, r14
	mov.w &0x15A, r15
	pop.w sr

	mov.w r12, -28(r4)
	mov.w r13, -26(r4)
	mov.w r14, -24(r4)
	mov.w r15, -22(r4)

	mov.w -8(r4), r6
	mov.w -6(r4), r7

	add -28(r4), r6
	addc -26(r4), r7

	mov.b #0, r5
	mov.w r5, r11
	mov.w r10, r5
	mov.w r6, r12
	mov.w r7, r13
	mov.b #0x10, r14
	mov.w r11, -20(r4)
	call #__mspabi_slll

	add r12, r5
	mov.w -20(r4), r11
	addc r11, r13
	mov.w r13, -8(r4)

	mov.w -16(r4), r12
	mov.w -14(r4), r13
	mov.b #0x10, r14
	call #__mspabi_srll

	mov.w -12(r4), r14
	mov.w -10(r4), r15

	push.w sr
	dint
	nop
	mov.w r8, &0x140
	mov.w r9, &0x142
	mov.w r14, &0x150
	mov.w r15, &0x152
	mov.w &0x154, r8
	mov.w &0x156, r9
	mov.w &0x158, r10
	mov.w &0x15A, r11
	pop.w sr

	add r12, r8
	addc r13 r9

	mov.w r6, r12
	mov.w r7, r13
	mov.b #0x10, r14
	call #__mspabi_srll

	mov.w r8, r14
	add r12, r14
	addc r9, r13
	mov.w r13, r15

	mov.w r5, r12
	mov.w -8(r4), r13

	add.w #28, r1
	popm.w #7, r10
	ret
