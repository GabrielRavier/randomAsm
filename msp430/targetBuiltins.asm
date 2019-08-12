delay_cycles_0:
	pushm.w #1, r4
	mov.w r1, r4
	popm.w #1, r4
	ret





delay_cycles_1:
	pushm.w #1, r4
	mov.w r1, r4

	nop

	popm.w #1, r4
	ret





delay_cycles_2:
	pushm.w #1, r4
	mov.w r1, r4

	jmp .+2

	popm.w #1, r4
	ret





delay_cycles_16:
	pushm.w #1, r4
	mov.w r1, r4

	pushm.a #1, r13
	mov.w #2, r13

.loop:
	sub.w #1, r13
	jne .loop

	popm.a #1, r13
	nop





delay_cycles_262144:
	pushm.w #1, r4
	mov.w r1, r4

	pushm.a #2, r13
	mov.w #0x9246, r13
	mov.w #0, r14

.loop:
	sub.w #1, r13
	subc.w #0, r14
	jne .loop

	tst.w r13
	jne .loop

	popm.a #2, r13
	jmp .+2
	jmp .+2
	jmp .+2
	nop

	popm.w #1, r4
	ret
