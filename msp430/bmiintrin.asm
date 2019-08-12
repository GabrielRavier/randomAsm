	.text

.macro bicAndMov reg1, reg2

	bic.w \reg1, \reg2
	mov.w \reg2, \reg1

.endm

__andn_u32:
	pushm.w #1, r4
	mov.w r1, r4

	bicAndMov r12, r14
	bicAndMov r13, r15

	popm.w #1, r4
	ret





__blsi_u32:
	pushm.w #1, r10
	pushm.w #1, r4
	mov.w r1, r4
	mov.w r12, r10
	mov.w r13, r11

	.irp reg, r14, r15

		mov.b #0, \reg

	.endr

	sub r10, r14
	subc r11, r15

	mov.w r14, r12
	and.w r10, r12

	mov.w r15, r13
	and.w r11, r13

	popm.w #1, r4
	popm.w #1, r10
	ret





__blsmsk_u32:
	pushm.w #1, r4
	mov.w r1, r4

	mov.w r12, r15
	add #-1, r15

	mov.w r13, r14
	addc #-1, r14

	xor.w r15, r12
	xor.w r14, r13

	popm.w #1, r4
	ret





__blsr_u32:
	pushm.w #1, r4
	mov.w r1, r4

	mov.w r12, r15
	add #-1, r15

	mov.w r13, r14
	addc #-1, r14

	and.w r15, r12
	and.w r14, r13

	popm.w #1, r4
	ret
