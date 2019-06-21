cimagf:
	pushm.w #1, r4
	mov.w r1, r4

	mov.w r14, r12
	mov.w r15, r13

	popm.w #1, r4
	ret





cimagl:
cimag:
	pushm.w #1, r4
	mov.w r1, r4

	mov.w 12(r4), r12
	mov.w 14(r4), r13
	mov.w 16(r4), r14
	mov.w 18(r4), r15

	popm.w #1, r4
	ret





conjf:
	pushm.w #3, r10
	pushm.w #1, r4
	mov.w r1, r4

	mov.w r12, r8
	mov.w r13, r9
	mov.w r14, r10

	mov.w r15, r11
	add.w #-0x8000, r11

	mov.w r11, r15

	popm.w #1, r4
	popm.w #3, r10
	ret





conjl:
conj:
	pushm.w #1, r4
	mov.w r1, r4

	mov.w 4(r4), @r12
	mov.w 6(r4), 2(r12)
	mov.w 8(r4), 4(r12)
	mov.w 10(r4), 6(r12)
	mov.w 12(r4), 8(r12)
	mov.w 14(r4), 10(r12)
	mov.w 16(r4), 12(r12)

	mov.w 18(r4), r14
	add.w #-0x8000, r14
	mov.w r14, 14(r12)

	popm.w #1, r4
	ret





copysignf:
	pushm.w #1, r4
	mov.w r1, r4

	and.w #0x7FFF, r13
	and.w #-0x8000, r15

	bis.w r15, r13
	popm.w #1, r4
	ret





copysignl:
copysign:
	pushm.w #1, r4
	mov.w r1, r4

	and.w #0x7FFF, r15
	mov.w 10(r4), r11
	and.w #-0x8000, r11

	bis.w r11, r15
	popm.w #1, r4
	ret





cprojf:
	pushm.w #3, r10
	pushm.w #1, r4

	mov.w r1, r4
	mov.w r12, r8
	mov.w r13, r9
	mov.w r14, r10
	mov.w r15, r11

	mov.w r10, r14
	mov.w r11, r15

	popm.w #1, r4
	popm.w #3, r10
	ret





cprojl:
cproj:
	pushm.w #1, r4
	mov.w r1, r4

	mov.w 4(r4), @r12
	mov.w 6(r4), 2(r12)
	mov.w 8(r4), 4(r12)
	mov.w 10(r4), 6(r12)
	mov.w 12(r4), 8(r12)
	mov.w 14(r4), 10(r12)
	mov.w 16(r4), 12(r12)
	mov.w 18(r4), 14(r12)

	popm.w #1, r4
	ret





crealf:
	pushm.w #1, r4
	mov.w r1, r4
	popm.w #1, r4
	ret





creall:
creal:
	pushm.w #1, r4
	mov.w r1, r4

	mov.w 4(r4), r12
	mov.w 6(r4), r13
	mov.w 8(r4), r14
	mov.w 10(r4), r15

	popm.w #1, r4
	ret





imaxabs:
llabs:
	pushm.w #4, r10
	pushm.w #1, r4
	mov.w r1, r4

	mov.w r15, r8
	mov.w r12, r10
	mov.w r13, r11
	mov.w r14, r7

	cmp.w #0, r15
	jl .continue

	mov.w r10, r12
	mov.w r11, r13
	mov.w r7, r14

	popm.w #1, r4
	popm.w #4, r10
	ret

.continue:
	mov.b #0, r9

	mov.w r9, r10
	sub.w r12, r10

	mov.b #1, r7

	cmp.w r9, r10
	jeq .do5

	mov.w r9, r12
	sub.w r13, r12

	mov.b #1, r15

	cmp.w #0, r12
	jeq .do4

.do42:
	mov.w r12, r11
	sub.w r7, r11

	mov.b #1, r13

	cmp.w r11, r12
	jhs .do3

.do32:
	bis.w r13, r15

	mov.w r9, r13
	sub.w r14, r13

	mov.b #1, r12

	cmp.w #0, r13
	jeq .do2

.do22:
	mov.w r13, r7
	sub.w r15, r7

	mov.b #1, r14

	cmp.w r7, r13
	jhs .do1

.do12:
	bis.w r14, r12
	sub.w r8, r9

	mov.w r9, r15
	sub.w r12, r15

.return:
	mov.w r10, r12
	mov.w r11, r13
	mov.w r7, r14

	popm.w #1, r4
	popm.w #4, r10
	ret

.do1:
	mov.b #0, r14
	bis.w r14, r12
	sub.w r8, r9

	mov.w r9, r15
	sub.w r12, r15
	br #.return

.do2:
	mov.w r13, r12

	mov.w r13, r7
	sub.w r15, r7

	mov.b #1, r14

	cmp.w r7, r13
	jlo .do12
	br #.do1

.do3:
	mov.b #0, r13
	bis.w r13, r15

	mov.w r9, r13
	sub.w r14, r13

	mov.b #1, r12

	cmp.w #0, r13
	jne .do22
	br #.do2

.do4:
	mov.w r12, r15

	mov.w r12, r11
	sub.w r7, r11

	mov.b #1, r13

	cmp.w r11, r12
	jlo .do32
	br #.do3

.do5:
	mov.w r10, r7

	mov.w r9, r12
	sub.w r13, r12

	mov.b #1, r15

	cmp.w #0, r12
	jne .do42
	br #.do4
