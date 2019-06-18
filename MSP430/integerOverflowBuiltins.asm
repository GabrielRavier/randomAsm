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





saddl_overflow:
	pushm.w #2, r10
	pushm.w #1, r4
	mov.w r1, r4
	mov.w 8(r4), r10

	mov.b #0, r9
	add r12, r14
	mov.w r13, r11
	addc r15, r11

	cmp.w r9, r15
	jl .larger1

	cmp.w r13, r11
	jl .larger2

	cmp.w r11, r13
	jne .return

	cmp.w r12, r14
	jhs .return

.larger2:
	mov.b #1, r9
	br #.return

.larger1:
	cmp.w r11, r13
	jl .larger2

	cmp.w r13, r11
	jeq .equal

.return:
	mov.w r14, @r10
	mov.w r11, 2(r10)

	mov.b r9, r12
	popm.w #1, r4
	popm.w #2, r10
	ret

.equal:
	cmp.w r14, r12
	jhs .return
	br #.larger2





saddll_overflow:
	pushm.w #7, r10
	mov.w r1, r4
	sub.w #4, r1
	mov.w 18(r4), r9
	mov.w 20(r4), r10
	mov.w 22(r4), -2(r4)
	mov.w 24(r4), r7

	mov.w #0, -4(r4)
	mov.w r12, r6

	add.w 16(r4), r6
	mov.b #1, r8

	cmp.w r12, r6
	jlo .skip1

	mov.w -4(r4), r8

.skip1:
	add.w r13, r9
	mov.b #1, r11

	cmp.w r13, r9
	jlo .skip2

	mov.b #0, r11

.skip2:
	add.w r9, r8
	mov.b #1, r5

	cmp.w r9, r8
	jlo .skip3

	mov.b #0, r5

.skip3:
	bis.w r5, r11
	add.w r14, r10
	mov.b #1, r9

	cmp.w r14, r10
	jlo .skip4

	mov.b #0, r9

.skip4:
	add.w r10, r11
	mov.b #1, r5

	cmp.w r10, r11
	jlo .skip5

	mov.b #0, r5

.skip5:
	bis.w r5, r9
	mov.w -2(r4), r10

	add.w r15, r10
	add.w r9, r10

	cmp.w #0, -2(r4)
	jl .larger

	cmp.w r15, r10
	jl .ret1

	cmp.w r10, r15
	jne .return

	cmp.w r14, r11
	jlo .ret1

	cmp.w r11, r14
	jne .return

	cmp.w r13, r8
	jlo .ret1

	cmp.w r8, r13
	jne .return

	cmp.w r12, r6
	jhs .return

.ret1:
	mov.w #1, -4(r4)
	br #.return

.larger:
	cmp.w r10, r15
	jl .ret1

	cmp.w r15, r10
	jeq .moarChecks

.return:
	mov.w r6, @r7
	mov.w r8, 2(r7)
	mov.w r11, 4(r7)
	mov.w r10, 6(r7)

	mov.w -4(r4), r13
	mov.b r13, r12

	add.w #4, r1
	popm.w #7, r10
	ret

.moarChecks:
	cmp.w r11, r14
	jlo .ret1

	cmp.w r14, r11
	jne .return

	cmp.w r8, r13
	jlo .ret1

	cmp.w r13, r8
	jne .return

	cmp.w r6, r12
	jhs .return

	br #.ret1





uadd_overflow:
	pushm.w #1, r4
	mov.w r1, r4

	mov.b #0, r15
	add.w r12, r13

	cmp.w r12, r13
	jlo .ret1

.return:
	mov.w r13, @r14
	mov.b r15, r12
	popm.w #1, r4
	ret

.ret1:
	mov.b #1, r15
	br #.return
