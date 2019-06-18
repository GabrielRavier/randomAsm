sadd_overflow:
	pushm.w #1, r4
	mov.w r1, r4

	mov.b #0, r11
	mov.w r12, r15
	add.w r13, r15

	cmp r11, r13
	jl .larger

	cmp.w r12, r15
	jl .ret1

.return:
	mov.w r15, @r14
	mov.b r11, r12
	popm.w #1, r4
	ret

.larger:
	cmp.w r15, r12
	jge .return

.ret1:
	mov.b #1, r11
	br #.return
