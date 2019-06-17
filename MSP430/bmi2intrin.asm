_mulx_u64:
	pushm.w #2, r10
	pushm.w #1, r4
	mov.w r1, r4
	sub.w #48, r1
	mov.w 16(r4), r10

	mov.w #0, -32(r4)
	mov.w #0, -30(r4)
	mov.w #0, -28(r4)
	mov.w #0, -26(r4)

	mov.w r12, -24(r4)
	mov.w r13, -22(r4)
	mov.w r14, -20(r4)
	mov.w r15, -18(r4)

	mov.w #0, -16(r4)
	mov.w #0, -14(r4)
	mov.w #0, -12(r4)
	mov.w #0, -10(r4)

	mov.w 8(r4), -8(r4)
	mov.w 10(r4), -6(r4)
	mov.w 12(r4), -4(r4)
	mov.w 14(r4), -2(r4)

	mov.w r4, r14
	add.w #-16, r14

	mov.w r4, r13
	add.w #-32, r13

	mov.w r4, r12
	add.w #-48, r12
	call #uint128_t_operator_multiply

	mov.w #0, -16(r4)
	mov.w #0, -14(r4)
	mov.w #0, -12(r4)
	mov.w #0, -10(r4)

	mov.w #64, -8(r4)
	mov.w #0, -6(r4)
	mov.w #0, -4(r4)
	mov.w #0, -2(r4)

	mov.w r4, r14
	add.w #-16, r14

	mov.w r4, r13
	add.w #-48, r13

	mov.w r4, r12
	add.w #-32, r12
	call #uint128_t_operator_shiftRight

	mov.w #uint128_t_operator_cast_uint64_t, r9
	mov.w r4, r12
	add.w #-32, r12
	call r9

	mov.w r12, @r10
	mov.w r13, 2(r10)
	mov.w r14, 4(r10)
	mov.w r15, 6(r10)

	mov.w r4, r12
	add.w #-48, r12
	call r9

	add.w #48, r1
	popm.w #1, r4
	popm.w #2, r10
	ret





_mulx_u32:
	pushm.w #5, r10
	pushm.w #1, r4
	mov.w r1, r4
	sub.w #10, r1
	mov.w 14(r4), r6

	mov.w r12, r8
	mov.w r13, r9

	push.w sr { dint { nop { mov.w r8, &0x140 { mov.w r9, &0x142 { mov.w r14, &0x150 { mov.w r15, &0x152 { mov.w &0x154, r8 { mov.w &0x156, r9 { mov.w 0x158, r10 { mov.w &0x15A, r11 { pop.w sr

	mov.w r8, -8(r4)
	mov.w r9, -6(r4)
	mov.w r10, -4(r4)
	mov.w r11, -2(r4)

	mov.w #32, @r1
	mov.w r8, r12
	mov.w r9, r13
	mov.w r10, r14
	mov.w r11, r15
	call #__lshrdi3
	mov.w r12, @r6
	mov.w r13, 2(r6)

	mov.w -8(r4), r12
	mov.w -6(r4), r13
	add.w #10, r1
	popm.w #1, r4
	popm.w #5, r10
	ret
