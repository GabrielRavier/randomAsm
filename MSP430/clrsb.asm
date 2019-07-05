	.text

__clrsbhi2:
	pushm.w #1, r4
	mov.w r1, r4

	cmp.w #0, r12
	jl .doInv

.continue:
	cmp.w #0, r12
	jne .doClz

	mov.b #0xF, r12

	popm.w #1, r4
	ret

.doClz:
	call #__clzhi2
	add.w #-1, r12

	popm.w #1, r4
	ret

.doInv:
	inv.w r12
	br #.continue





__clrsbsi2:
	pushm.w #1, r4
	mov.w r1, r4

	cmp.w #0, r13
	jge .noInv

	inv.w r12
	inv.w r13

.noInv:
	mov.w r12, r14
	bis.w r13, r14

	cmp.w #0, r14
	jne .doClz

	mov.b #7, r12

	popm.w #1, r4
	ret

.doClz:
	call #__clzsi2

	add.w #-1, r12

	popm.w #1, r4
	ret





__clrsbdi2:
	pushm.w #1, r10
	pushm.w #1, r4
	mov.w r1, r4

	mov.w r14, r11
	bis.w r15, r14

	cmp.w #0, r14
	jeq .eq1

	cmp.w #-1, r11
	jeq .eq2

.ne:
	mov.w r11, r12

	cmp.w #0, r15
	jl .doInv

	mov.w r15, r13
	mov.b #0, r10

.doClz:
	call #__clzsi2
	mov.w r10, r13
	add.w #-1, r13
	add.w r13, r12

	popm.w #1, r4
	popm.w #1, r10
	ret

.eq2:
	cmp.w #-1, r15
	jne .ne

	inv.w r12
	inv.w r13

.eq1:
	mov.w r12, r14
	bis.w r13, r14

	cmp.w #0, r14
	jne .doClz8

	mov.b #0xF, r12

	popm.w #1, r4
	popm.w #1, r10
	ret

.doClz8:
	mov.b #8, r10
	br #.doClz

.doInv:
	inv.w r12
	mov.w r15, r13
	inv.w r13
	mov.b #0, r10
	br #.doClz
