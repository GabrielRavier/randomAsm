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
