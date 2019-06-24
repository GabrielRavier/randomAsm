1:
	add.w #-1, r14
	add.w r12, r12
	addc.w r13, r12

__mspabi_slll:
	cmp #0, r14
	jnz 1b
	ret




__mspabi_slll_8:
	add.w r12
	addc.w r13

__mspabi_slll_7:
	add.w r12
	addc.w r13

__mspabi_slll_6:
	add.w r12
	addc.w r13

__mspabi_slll_5:
	add.w r12
	addc.w r13

__mspabi_slll_4:
	add.w r12
	addc.w r13

__mspabi_slll_3:
	add.w r12
	addc.w r13

__mspabi_slll_2:
	add.w r12
	addc.w r13

__mspabi_slll_1:
	add.w r12
	addc.w r13

	ret





__ashldi3:
	pushm.w #7, r10
	mov.w r1, r4

	sub.w #2, r1
	mov.w r14, r5
	mov.w r15, r10
	mov.w 16(r4), r9

	bit.w #0x20, r9
	jeq .continue

	mov.b #0, r8
	mov.w r8, r7

	add.w #-0x20, r9
	mov.w r12, r10

	mov.w r9, r14
	mov.w #0, r15
	call #__mspabi_slll

	mov.w r12, r14
	mov.w r13, r15

.finish:
	mov.w r8, r12
	mov.w r7, r13

.return:
	add.w #2, r1

	popm.w #7, r10
	ret

.continue:
	cmp.w #0, r9
	jeq .return

	mov.w r13, r6

	mov.w r9, r14
	mov.w #0, r15

	mov.w r12, -2(r4)
	call #__mspabi_slll

	mov.w r12, r8
	mov.w r13, r7

	mov.w r5, r12
	mov.w r10, r13

	mov.w r9, r14
	mov.w r9, r15
	rpt #15
	rrax.w r15
	call #__mspabi_slll

	mov.w r12, r5
	mov.w r13, r10

	mov.w #0x20, r14
	sub.w r9, r14

	mov.w -2(r4), r11
	mov.w r11, r12
	mov.w r6, r13
	mov.w #0, r15
	call #__mspabi_srll

	mov.w r10, r15
	bis.w r13, r15
	mov.w r5, r14
	bis.w r12, r14
	br #.finish
