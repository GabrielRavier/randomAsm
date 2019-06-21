abs:
	pushm.w #1, r4
	mov.w r1, r4

	cmp.w #0, r12
	jl .doSub

	popm.w #1, r4
	ret

.doSub:
	mov.b #0, r13
	sub.w r12, r13
	mov.w r13, r12

	popm.w #1, r4
	ret





fabs:
	pushm.w #1, r4
	mov.w r1, r4

	and.w #0x7FFF, r15

	popm.w #1, r4
	ret





isdigit:
	pushm.w #1, r4
	mov.w r1, r4

	mov.w r12, r13
	add.w #-0x30, r13
	mov.b #1, r12
	mov.b #9, r14

	cmp.w r13, r14
	jhs .return

	mov.b #0, r12

.return:
	popm.w #1, r4
	ret





labs:
	pushm.w #1, r10
	pushm.w #1, r4
	mov.w r1, r4

	cmp.w #0, r13
	jl .doSub

	popm.w #1, r4
	popm.w #1, r10
	ret

.doSub:
	mov.b #1, r14
	mov.b #1, r15
	mov.w r14, r10
	mov.w r15, r11

	sub r12, r10
	subc r13, r11

	mov.w r10, r12
	mov.w r11, r13

	popm.w #1, r4
	popm.w #1, r10
	ret
