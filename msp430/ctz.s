	.text

__ctzhi2:
	pushm.w #1, r4
	mov.w r1, r4
	mov.w r12, r13

	bit.w #1, r12
	jne .ret0

	bit.w #2, r12
	jne .ret1

	bit.w #4, r12
	jne .ret2

	bit.w #8, r12
	jne .ret3

	bit.w #0x10, r12
	jne .ret4

	bit.w #0x20, r12
	jne .ret5

	bit.w #0x40, r12
	jne .ret6

	bit.w #0x80, r12
	jne .ret7

	bit.w #0x100, r12
	jne .ret8

	bit.w #0x200, r12
	jne .ret9

	bit.w #0x400, r12
	jne .ret10

	bit.w #0x800, r12
	jne .ret11

	bit.w #0x1000, r12
	jne .ret12

	bit.w #0x2000, r12
	jne .ret13

	bit.w #0x4000, r12
	jne .ret14

	inv r13
	mov.w r13, r12

	rrum.w #1, r12
	rpt #14
	rrax.w r12

	add.w #15, r12

.return:
	popm.w #1, r4
	ret

.ret0:
	mov.b #0, r12
	br #.return

.ret1:
	mov.b #1, r12
	br #.return

.ret2:
	mov.b #2, r12
	br #.return

.ret3:
	mov.b #3, r12
	br #.return

.ret4:
	mov.b #4, r12
	br #.return

.ret5:
	mov.b #5, r12
	br #.return

.ret6:
	mov.b #6, r12
	br #.return

.ret7:
	mov.b #7, r12
	br #.return

.ret8:
	mov.b #8, r12
	br #.return

.ret9:
	mov.b #9, r12
	br #.return

.ret10:
	mov.b #10, r12
	br #.return

.ret11:
	mov.b #11, r12
	br #.return

.ret12:
	mov.b #12, r12
	br #.return

.ret13:
	mov.b #13, r12
	br #.return

.ret14:
	mov.b #14, r12
	br #.return





__ctzsi2:
	pushm.w #4, r10
	mov.w r1, r4

	cmp.w #0, r13
	jne .ne1

	mov.b #24, r6
	mov.b #0, r7
	mov.b #16, r10
	mov.b #0, r8
	mov.w r10, r14

	mov.w #0, r15
	call #__mspabi_srll

	cmp.b #0, r12
	jne .ne2

.eq2:
	mov.w r6, r10
	mov.w r7, r8
	mov.b #8, r14

	mov.w #0, r15
	call #__mspabi_srll

	bit.w #15, r12
	jne .ne3

.eq3:
	mov.b #4, r9
	mov.b #0, r7
	mov.w r9, r14

	mov.w #0, r15
	call #__mspabi_srll

	add r9, r10
	addc r7, r8

	bit.w #3, r12
	jeq .eq1

.eq4:
	mov.b #0, r9
	mov.w r9, r5
	mov.w r9, r14

.finish:
	mov.w #0, r15
	call #__mspabi_srll

	mov.w r12, r14
	mov.w r13, r15

	clrc
	rrc.w r15
	rrc.w r14

	mov.w r14, r6
	and.b #1, r6

	mov.b #0, r7
	mov.b #2, r14
	mov.b #0, r15

	sub r6, r14
	subc r7, r15

	inv.w r12
	and.b #1, r12

	mov.w #0, r13
	sub.w r12, r13

	mov.w r13, r6
	mov.w r13, r7
	rpt #15
	rrax.w r7

	mov.w r14, r12
	and.w r13, r12
	mov.w r15, r6
	and.w r7, r6

	add r9, r10
	mov.w r8, r13
	addc r5, r13

	add r10, r12
	addc r6, r13
	popm.w #7, r10
	ret

.ne1:
	mov.b #8, r6
	mov.b #0, r7
	mov.b #0, r10
	mov.w r10, r8
	mov.b #16, r14

	mov.w #0, r15
	call #__mspabi_srll

	cmp.w #0, r11
	jeq .eq2

.ne2:
	mov.b #0, r14

	mov.w #0 ,r15
	call #__mspabi_srll

	bit.w #15, r12
	jeq .eq3

.ne3:
	mov.b #0, r9
	mov.w r9, r7
	mov.w r9, r14

	mov.w #0, r15
	call #__mspabi_srll

	add r9, r10
	addc r7, r8

	bit.w #3, r12
	jne .eq4

.eq1:
	mov.b #2, r9
	mov.b #0, r5
	mov.w r9, r14
	br #.finish





__ctzdi2:
	pushm.w #3, r10
	pushm.w #1, r4
	mov.w r1, r4

	mov.w r12, r11
	mov.b #1, r12
	mov.w r11, r10
	bis.w r13, r10

	cmp.w #0, r10
	jeq .no0

	mov.b #0, r12

.no0:
	mov.w #0, r10
	sub.w r12, r10

	mov.w r10, r8
	mov.w r10, r9
	rpt #15
	rrax.w r9

	mov.w r10, r12
	and.w r14, r12
	and.w r9, r15
	bic.w r10, r11
	bic.w r9, r13
	bis.w r11, r12
	bis.w r15, r13
	call #__ctzsi2

	and.b #0x20, r10
	bit.w #0x8000, r10
	subc.w r11
	inc.w r11

	add r10, r12
	addc r11, r13
	popm.w #1, r4
	popm.w #3, r10
	ret
