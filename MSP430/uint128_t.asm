	.bss

uint128_0:
	.zero 16

	.data

uint128_1:
	.quad 0, 1

	.text

uint128_t_constructor_default:
	pushm.w #1, r4
	mov.w r1, r4

	mov.w #0, @r12
	mov.w #0, 2(r12)
	mov.w #0, 4(r12)
	mov.w #0, 6(r12)
	mov.w #0, 8(r12)
	mov.w #0, 10(r12)
	mov.w #0, 12(r12)
	mov.w #0, 14(r12)

	popm.w #1, r4
	ret





uint128_t_constructor:
uint128_t_operator_equal:
	pushm.w #1, r4
	mov.w r1, r4

	mov.w 2(r13), r11
	mov.w 4(r13), r15
	mov.w 6(r13), r14

	mov.w @r13, @r12
	mov.w r11, 2(r12)
	mov.w r15, 4(r12)
	mov.w r14, 6(r12)

	mov.w 10(r13), r11
	mov.w 12(r13), r15
	mov.w 14(r13), r14

	mov.w 8(r13), 8(r12)
	mov.w r11, 10(r12)
	mov.w r15, 12(r12)
	mov.w r14, 14(r12)

	popm.w #1, r4
	ret





uint128_t_constructor_uint128_t_double_ref:
	pushm.w #1, r4
	mov.w r1, r4

	mov.w 2(r13), r11
	mov.w 4(r13), r15
	mov.w 6(r13), r14

	mov.w @r13, @r12
	mov.w r11, 2(r12)
	mov.w r15, 4(r12)
	mov.w r14, 6(r12)

	mov.w 10(r13), r11
	mov.w 12(r13), r15
	mov.w 14(r13), r14

	mov.w 8(r13), 8(r12)
	mov.w r11, 10(r12)
	mov.w r15, 12(r12)
	mov.w r14, 14(r12)

	cmp.w r13, r12
	jeq .return

	mov.w #0, @r13
	mov.w #0, 2(r13)
	mov.w #0, 4(r13)
	mov.w #0, 6(r13)
	mov.w #0, 8(r13)
	mov.w #0, 10(r13)
	mov.w #0, 12(r13)
	mov.w #0, 14(r13)

.return:
	popm.w #1, r4
	ret





uint128_t_operator_equal_const_uint128_t_double_ref:
	pushm.w #1, r4
	mov.w r1, r4

	cmp.w r13, r12
	jeq .return

	mov.w 2(r13), r11
	mov.w 4(r13), r15
	mov.w 6(r13), r14

	mov @r13, @r12
	mov.w r11, 2(r12)
	mov.w r15, 4(r12)
	mov.w r14, 6(r12)

	mov.w 10(r13), r11
	mov.w 12(r13), r15
	mov.w 14(r13), r14

	mov.w 8(r13), 8(r12)
	mov.w r11, 10(r12)
	mov.w r15, 12(r12)
	mov.w r14, 14(r12)

	mov.w #0, @r13
	mov.w #0, 2(r13)
	mov.w #0, 4(r13)
	mov.w #0, 6(r13)
	mov.w #0, 8(r13)
	mov.w #0, 10(r13)
	mov.w #0, 12(r13)
	mov.w #0, 14(r13)

.return:
	popm.w #1, r4
	ret





uint128_t_operator_cast_bool:
	pushm.w #7, r10
	mov.w r1, r4
	sub.w #2, r1

	mov.w @r12, r7
	bis.w 8(r12), r7

	mov.w 2(r12), r13
	bis.w 10(r12), r13

	mov.w 4(r12), r14
	bis.w 12(r12), r14

	mov.w 6(r12), r15
	bis.w 14(r12), r15

	mov.b #0, r11
	mov.w r11, r12
	sub.w r7, r12

	mov.b #1, r9
	cmp.w r11, r12
	jne .skip

	mov.w r12, r9

.skip:
	mov.w r11, r10
	sub.w r13, r10

	mov.b #1, r5
	cmp.w #0, r10
	jne .skip2

	mov.w r10, r5

.skip2:
	mov.w r10, r8
	sub.w r9, r8

	mov.b #1, r9
	cmp.w r8, r10
	jlo .skip3

	mov.b #0, r9

.skip3:
	bis.w r9, r5
	mov.w r11, r6
	sub.w r14, r6

	mov.b #1, r10
	cmp.w #0, r6
	jne .skip4

	mov.w r6, r10

.skip4:
	mov.w r6, r9
	sub.w r5, r9
	mov.b #1, r5

	cmp.w r9, r6
	jlo .skip5

	mov.b #0, r5

.skip5:
	bis.w r5, r10
	sub.w r15, r11
	sub.w r10, r11

	mov.b #0x3F, @r1
	bis.w r7, r12
	:bis.w r8, r13
	bis.w r9, r14
	bis.w r11, r15
	call #__lshrdi3

	add.w #2, r1
	popm.w #7, r10
	ret





uint128_t_operator_cast_uint8_t:
	pushm.w #1, r4
	mov.w r1, r4

	mov.b 8(r12), r12

	popm.w #1, r4
	ret





uint128_t_operator_cast_uint16_t:
	pushm.w #1, r4
	mov.w r1, r4

	mov.w 8(r12), r12

	popm.w #1, r4
	ret





uint128_t_operator_cast_uint32_t:
	pushm.w #1, r4
	mov.w r1, r4

	mov.w 10(r12), r13
	mov.w 8(r12), r12

	popm.w #1, r4
	ret





uint128_t_operator_cast_uint64_t:
	pushm.w #1, r4
	mov.w r1, r4

	mov.w 14(r12), r15
	mov.w 12(r12), r14
	mov.w 10(r12), r13
	mov.w 8(r12), r12

	popm.w #1, r4
	ret





uint128_t_operator_and:
	pushm.w #7, r10
	mov.w r1, r4

	mov.w 8(r13), r8
	and.w 8(r14), r8

	mov.w 10(r13), r9
	and.w 10(r14), r9

	mov.w 12(r13), r10
	and.w 12(r14), r10

	mov.w 14(r13), r11
	and.w 14(r14), r11

	mov.w 2(r13), r5
	and.w 2(r14), r5

	mov.w 4(r13), r6
	and.w 4(r14), r6

	mov.w 6(r13), r7
	and.w 6(r14), r7

	mov.w @r13, r13
	and.w @r14, r13

	mov.w r13, @r12
	mov.w r5, 2(r12)
	mov.w r6, 4(r12)
	mov.w r7, 6(r12)
	mov.w r8, 8(r12)
	mov.w r9, 10(r12)
	mov.w r10, 12(r12)
	mov.w r11, 14(r12)

	popm.w #7, r10
	ret





uint128_t_operator_and_equal:
	pushm.w #1, r10
	pushm.w #1, r4
	mov.w r1, r4

	sub.w #0x10, r1
	mov.w r12, r10
	mov.w r13, r14
	mov.w r12, r13
	mov.w r4, r12

	add.w #-0x10, r12
	call uint128_t_operator_and

	mov.w r4, r13
	add.w #-0x10, r13
	mov.w r10, r12
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mov.w r10, r12
	add.w #0x10, r1
	popm.w #1, r4
	popm.w #1, r10
	ret





uint128_t_operator_or:
	pushm.w #7, r10
	mov.w r1, r4

	mov.w 8(r13), r8
	bis.w 8(r14), r8

	mov.w 10(r13), r9
	bis.w 10(r14), r9

	mov.w 12(r13), r10
	bis.w 12(r14), r10

	mov.w 14(r13), r11
	bis.w 14(r14), r11

	mov.w 2(r13), r5
	bis.w 2(r14), r5

	mov.w 4(r13), r6
	bis.w 4(r14), r6

	mov.w 6(r13), r7
	bis.w 6(r14), r7

	mov.w @r13, r13
	bis.w @r14, r13

	mov.w r13, @r12
	mov.w r5, 2(r12)
	mov.w r6, 4(r12)
	mov.w r7, 6(r12)
	mov.w r8, 8(r12)
	mov.w r9, 10(r12)
	mov.w r10, 12(r12)
	mov.w r11, 14(r12)

	popm.w #7, r10
	ret





uint128_t_operator_or_equal:
	pushm.w #1, r10
	pushm.w #1, r4
	mov.w r1, r4

	sub.w #0x10, r1
	mov.w r12, r10
	mov.w r13, r14
	mov.w r12, r13
	mov.w r4, r12

	add.w #-0x10, r12
	call uint128_t_operator_or

	mov.w r4, r13
	add.w #-0x10, r13
	mov.w r10, r12
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mov.w r10, r12
	add.w #0x10, r1
	popm.w #1, r4
	popm.w #1, r10
	ret





uint128_t_operator_xor:
	pushm.w #7, r10
	mov.w r1, r4

	mov.w 8(r13), r8
	xor.w 8(r14), r8

	mov.w 10(r13), r9
	xor.w 10(r14), r9

	mov.w 12(r13), r10
	xor.w 12(r14), r10

	mov.w 14(r13), r11
	xor.w 14(r14), r11

	mov.w 2(r13), r5
	xor.w 2(r14), r5

	mov.w 4(r13), r6
	xor.w 4(r14), r6

	mov.w 6(r13), r7
	xor.w 6(r14), r7

	mov.w @r13, r13
	xor.w @r14, r13

	mov.w r13, @r12
	mov.w r5, 2(r12)
	mov.w r6, 4(r12)
	mov.w r7, 6(r12)
	mov.w r8, 8(r12)
	mov.w r9, 10(r12)
	mov.w r10, 12(r12)
	mov.w r11, 14(r12)

	popm.w #7, r10
	ret





uint128_t_operator_xor_equal:
	pushm.w #1, r10
	pushm.w #1, r4
	mov.w r1, r4

	sub.w #0x10, r1
	mov.w r12, r10
	mov.w r13, r14
	mov.w r12, r13
	mov.w r4, r12

	add.w #-0x10, r12
	call uint128_t_operator_xor

	mov.w r4, r13
	add.w #-0x10, r13
	mov.w r10, r12
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mov.w r10, r12
	add.w #0x10, r1
	popm.w #1, r4
	popm.w #1, r10
	ret





uint128_t_operator_not:
	pushm.w #5, r10
	pushm.w #1, r4
	mov.w r1, r4

	mov.w 8(r13), r9
	inv.w r9

	mov.w 10(r13), r10
	inv.w r10

	mov.w 12(r13), r11
	inv.w r11

	mov.w 14(r13), r15
	inv.w r15

	mov.w 2(r13), r6
	inv.w r6

	mov.w 4(r13), r7
	inv.w r7

	mov.w 6(r13), r8
	inv.w r8

	mov.w @r13, r13
	inv.w r13

	mov.w r13, @r12
	mov.w r6, 2(r12)
	mov.w r7, 4(r12)
	mov.w r8, 6(r12)
	mov.w r9, 8(r12)
	mov.w r10, 10(r12)
	mov.w r11, 12(r12)
	mov.w r15, 14(r12)

	popm.w #1, r4
	popm.w #5, r10
	ret





uint128_t_operator_shiftLeft:
	pushm.w #7, r10
	mov.w r1, r4
	sub.w #14, r1
	mov.w r12, r10
	mov.w r13, r15

	mov.w @r14, r9
	bis.w 2(r14), r9
	bis.w 4(r14), r9
	bis.w 6(r14), r9

	cmp.w #0, r9
	jne .do0

	mov.w 8(r14), r9
	mov.w 10(r14), r8
	mov.w 12(r14), r7

	cmp.w #0, 14(r14)
	jne .do0

	cmp.w #0, r7
	jne .do0

	cmp.w #0, r8
	jne .do0

	mov.b #0x7F, r14
	cmp.w r9, r14
	jlo .do0

	cmp.w #0x40, r9
	jeq .finish

	cmp.w #0, r9
	jeq .doCnst

	mov.b #0x3F, r12
	cmp.w r9, r12
	jhs .doShls

	mov.w r9, r7
	add.w #-0x41, r7
	mov.b #1, r13

	cmp.w r9, r7
	jlo .skip

	mov.w r8, r13
	cmp.w r9, r7
	jlo .skip

	mov.w r8, r13

.skip:
	mov.b #0, r12
	mov.w r13, r8
	add.w #-1, r8

	mov.b #1, r13
	cmp.w #-1, r8
	jlo .skip2

	mov.w r12, r13

.skip2:
	bis.w r13, r12
	mov.b #0, r13
	add.w #-1, r12
	mov.b #1, r14

	cmp.w #-1, r12
	jlo .skip3

	mov.w r13, r14

.skip3:
	bis.w r14, r13

	cmp.w #1, r13
	jne .do0

	cmp.w #0, r12
	jne .do0

	cmp.w #0, r8
	jne .do0

	mov.b #0x3E, r12
	cmp.w r7, r12
	jlo .do0

	add.w #-0x40, r9
	mov.w r9, @r1
	mov.w 8(r15), r12
	mov.w 10(r15), r13
	mov.w 12(r15), r14
	mov.w 14(r15), r15
	call #__ashldi3

	mov.w r12, @r10
	mov.w r13, 2(r10)
	mov.w r14, 4(r10)
	mov.w r15, 6(r10)
	mov.w r8, 8(r10)
	mov.w r8, 10(r10)
	mov.w r8, 12(r10)
	mov.w r8, 14(r10)

	mov.w r10, r12
	add.w #14, r1
	popm.w #7, r10
	ret

.do0:
	mov.w #uint128_0, r13
	mov.w r10, r12
	call #uint128_t_constructor

.return:
	mov.w r10, r12
	add.w #14, r1
	popm.w #7, r10
	ret

.doShls:
	mov.w 8(r13), -2(r4)
	mov.w 10(r13), -4(r4)
	mov.w 12(r13), -6(r4)
	mov.w 14(r13), -8(r4)

	mov.w #__ashldi3, r7
	mov.w r9, @r1
	mov.w @r13, r12
	mov.w 2(r13), r13
	mov.w 4(r15), r14
	mov.w 6(r15), r15
	call r7

	mov.w r12, -10(r4)
	mov.w r13, r5
	mov.w r14, r6
	mov.w r15, -12(r4)

	mov.b #0x40, r14
	sub.w r9, r14
	mov.w r14, @r1
	mov.w -2(r4), r12
	mov.w -4(r4), r13
	mov.w -6(r4), r14
	mov.w -8(r4), r15
	call #__lshrdi3

	mov.w r15, r11
	add.w -10(r4), r12

	mov.b #1, r15
	cmp.w -10(r4), r12
	jlo .skip4

	mov.w r8, r15

.skip4:
	add.w r5, r13
	mov.b #1, r8
	cmp.w r5, r13
	jlo .skip5

	mov.b #0, r8

.skip5:
	add.w r13, r15
	mov.b #1, r5
	cmp.w r13, r15
	jlo .skip6

	mov.b #0, r5

.skip6:
	bis.w r5, r8
	add.w r6, r14
	mov.b #1, r13
	cmp.w r6, r14
	jlo .skip7

	mov.b #0, r13

.skip7:
	add.w r14, r8
	mov.b #1, r6
	cmp.w r14, r8
	jlo .skip8

	mov.b #0, r6

.skip8:
	bis.w r6, r13
	mov.w -12(r4), r14
	add.w r11, r14

	mov.w r12, @r10
	mov.w r15, 2(r10)
	mov.w r8, 4(r10)
	add.w r14, r13
	mov.w r13, 6(r10)

	mov.w r9, @r1
	mov.w -2(r4), r12
	mov.w -4(r4), r13
	mov.w -6(r4), r14
	mov.w -8(r4), r15
	call r7

	mov.w r12, 8(r10)
	mov.w r13, 10(r10)
	mov.w r14, 12(r10)
	mov.w r15, 14(r10)

	mov.w r10, r12
	add.w #14, r1
	popm.w #7, r10
	ret

.finish:
	mov.w 10(r13), r14
	mov.w 12(r13), r13
	mov.w 14(r15), r12
	mov.w 8(r15), @r10

	mov.w r14, 2(r10)
	mov.w r13, 4(r10)
	mov.w r12, 6(r10)
	mov.w r8, 8(r10)
	mov.w r8, 10(r10)
	mov.w r8, 12(r10)
	mov.w r8, 14(r10)
	br #.return

.doCnst:
	call #uint128_t_constructor
	br #.return





uint128_t_operator_shiftLeft_equal:
	pushm.w #1, r10
	pushm.w #1, r4
	mov.w r1, r4

	sub.w #0x10, r1
	mov.w r12, r10
	mov.w r13, r14
	mov.w r12, r13
	mov.w r4, r12

	add.w #-0x10, r12
	call uint128_t_operator_shiftLeft

	mov.w r4, r13
	add.w #-0x10, r13
	mov.w r10, r12
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mov.w r10, r12
	add.w #0x10, r1
	popm.w #1, r4
	popm.w #1, r10
	ret





uint128_t_operator_shiftRight:
	pushm.w #7, r10
	mov.w r1, r4
	sub.w #14, r1
	mov.w r12, r10
	mov.w r13, r9

	mov.w @r14, r15
	bis.w 2(r14), r15
	bis.w 4(r14), r15
	bis.w 6(r14), r15

	cmp.w #0, r15
	jne .do0

	mov.w 8(r14), r8
	mov.w 10(r14), r7
	mov.w 12(r14), r15

	cmp.w #0, 14(r14)
	jne .do0

	cmp.w #0, r15
	jne .do0

	cmp.w #0, r7
	jne .do0

	mov.b #0x7F, r14
	cmp.w r8, r14
	jlo .do0

	cmp.w #0x40, r8
	jeq .finish

	cmp.w #0, r8
	jeq .doCnst

	mov.b #0x3F, r12
	cmp.w r8, r12
	jhs .doShrs

	mov.w r8, r15
	add.w #-0x41, r15
	mov.b #1, r13

	cmp.w r8, r15
	jlo .skip

	mov.w r7, r13

.skip:
	mov.b #0, r12
	mov.w r13, r7
	add.w #-1, r7

	mov.b #1, r13
	cmp.w #-1, r8
	jlo .skip2

	mov.w r12, r13

.skip2:
	bis.w r13, r12
	mov.b #0, r13
	add.w #-1, r12
	mov.b #1, r14

	cmp.w #-1, r12
	jlo .skip3

	mov.w r13, r14

.skip3:
	bis.w r14, r13

	cmp.w #1, r13
	jne .do0

	cmp.w #0, r12
	jne .do0

	cmp.w #0, r7
	jne .do0

	mov.b #0x3E, r12
	cmp.w r15, r12
	jlo .do0

	add.w #-0x40, r8
	mov.w r8, @r1
	mov.w @r9, r12
	mov.w 2(r9), r13
	mov.w 4(r9), r14
	mov.w 6(r9), r15
	call #__lshrdi3

	mov.w r7, @r10
	mov.w r7, 2(r10)
	mov.w r7, 4(r10)
	mov.w r7, 6(r10)
	mov.w r12, 8(r10)
	mov.w r13, 10(r10)
	mov.w r14, 12(r10)
	mov.w r15, 14(r10)

	mov.w r10, r12
	add.w #14, r1
	popm.w #7, r10
	ret

.do0:
	mov.w #uint128_0, r13
	mov.w r10, r12
	call #uint128_t_constructor

.return:
	mov.w r10, r12
	add.w #14, r1
	popm.w #7, r10
	ret

.doShrs:
	mov.w @r13, -2(r4)
	mov.w 2(r13), -4(r4)
	mov.w 4(r13), -6(r4)
	mov.w 6(r13), -8(r4)

	mov.b #0x40, r14
	sub.w r8, r14
	mov.w r14, @r1
	mov.w -2(r4), r12
	mov.w -4(r4), r13
	mov.w -6(r4), r14
	mov.w -8(r4), r15
	call #__ashldi3

	mov.w r12, -10(r4)
	mov.w r13, r5
	mov.w r14, r6
	mov.w r15, -12(r4)

	mov.w r8, @r1
	mov.w 8(r9), r12
	mov.w 10(r9), r13
	mov.w 12(r9), r14
	mov.w 14(r9), r15
	call #__lshrdi3

	mov.w r15, r11
	mov.w -10(r4), r12
	add.w r12, r9

	mov.b #1, r15
	cmp.w -10(r4), r12
	jlo .skip4

	mov.w r7, r15

.skip4:
	add.w r5, r13
	mov.b #1, r12
	cmp.w r5, r13
	jlo .skip5

	mov.b #0, r12

.skip5:
	mov.w r15, r5
	add.w r13, r5
	mov.b #1, r15
	cmp.w r13, r5
	jlo .skip6

	mov.b #0, r15

.skip6:
	bis.w r15, r12
	add.w r6, r14
	mov.b #1, r7
	cmp.w r6, r14
	jlo .skip7

	mov.b #0, r7

.skip7:
	mov.w r12, r6
	add.w r14, r6
	mov.b #1, r12
	cmp.w r14, r6
	jlo .skip8

	mov.b #0, r12

.skip8:
	bis.w r12, r7
	mov.w -12(r4), r15
	add.w r11, r15
	add.w r15, r7

	mov.w r8, @r1
	mov.w -2(r4), r12
	mov.w -4(r4), r13
	mov.w -6(r4), r14
	mov.w -8(r4), r15
	call #__lshrdi3

	mov.w r12, @r10
	mov.w r13, 2(r10)
	mov.w r14, 4(r10)
	mov.w r15, 6(r10)
	mov.w r9, 8(r10)
	mov.w r5, 10(r10)
	mov.w r6, 12(r10)
	mov.w r7, 14(r10)

	mov.w r10, r12
	add.w #14, r1
	popm.w #7, r10
	ret

.finish:
	mov.w r7, @r12
	mov.w r7, 2(r12)
	mov.w r7, 4(r12)
	mov.w r7, 6(r12)

	mov.w 2(r13), r14
	mov.w 4(r13), r13
	mov.w 6(r9), r12

	mov.w @r9, 8(r10)
	mov.w r14, 10(r10)
	mov.w r13, 12(r10)
	mov.w r12, 14(r10)
	br #.return

.doCnst:
	call #uint128_t_constructor
	br #.return





uint128_t_operator_shiftRight_equal:
	pushm.w #1, r10
	pushm.w #1, r4
	mov.w r1, r4

	sub.w #0x10, r1
	mov.w r12, r10
	mov.w r13, r14
	mov.w r12, r13
	mov.w r4, r12

	add.w #-0x10, r12
	call uint128_t_operator_shiftRight

	mov.w r4, r13
	add.w #-0x10, r13
	mov.w r10, r12
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mov.w r10, r12
	add.w #0x10, r1
	popm.w #1, r4
	popm.w #1, r10
	ret





uint128_t_operator_exclamation_mark:
	pushm.w #1, r4
	mov.w r1, r4

	mov.w @r12, r13
	bis.w 8(r12), r13

	mov.w 2(r12), r11
	bis.w 10(r12), r11

	mov.w 4(r12), r15
	bis.w 12(r12), r15

	mov.w 6(r12), r14
	bis.w 14(r12), r14

	mov.b #1, r12
	bis.w r11, r13
	bis.w r15, r13
	bis.w r14, r13

	cmp.W #0, r13
	jeq .return

	mov.b #0, r12

.return:
	popm.w #1, r4
	ret





uint128_t_operator_and_and:
	pushm.w #2, r10
	pushm.w #1, r4
	mov.w r1, r4
	mov.w r13, r9

	mov #uint128_t_operator_cast_bool, r10
	call r10
	and #0xFF, r12

	cmp.w #0, r12
	jeq .return

	mov.w r9, r12
	call r10
	and #0xFF, r12

.return:
	popm.w #1, r4
	popm.w #2, r10
	ret





uint128_t_operator_or_or:
	pushm.w #2, r10
	pushm.w #1, r4
	mov.w r1, r4
	mov.w r13, r9

	mov #uint128_t_operator_cast_bool, r10
	call r10
	and #0xFF, r12

	cmp.w #0, r12
	jne .return

	mov.w r9, r12
	call r10
	and #0xFF, r12

.return:
	popm.w #1, r4
	popm.w #2, r10
	ret





uint128_t_operator_equal_equal:
	pushm.w #1, r4
	mov.w r1, r4

	cmp.w @r13, @r12
	jeq .continue

.ret0:
	mov.b #0, r12
	popm.w #1, r4
	ret

.continue:
	cmp.w 2(r13), 2(r12)
	jne .l5

	cmp.w 4(r13), 4(r12)
	jne .l5

	cmp.w 6(r13), 6(r12)
	jne .l5

	mov.b #1, r14
	cmp.w 8(r13), 8(r12)
	jeq .continue2

	mov.b #0, r12

.return:
	popm.w #1, r4
	ret

.continue2:
	cmp.w 10(r13), 10(r12)
	jne .ret0

	cmp.w 12(r13), 12(r12)
	jne .ret0

	cmp.w 14(r13), 14(r12)
	jne .ret0

	mov.b #0, r12
	br #.return





uint128_t_operator_not_equal:
	pushm.w #1, r4
	mov.w r1, r4

	call #uint128_t_operator_equal_equal
	xor.b #1, r12

	popm.w #1, r4
	ret





uint128_t_operator_above:
	pushm.w #5, r10
	pushm.w #1, r4
	mov.w r1, r4

	mov.w @r12, r10
	mov.w 2(r12), r8
	mov.w 4(r12), r6
	mov.w 6(r12), r15

	mov.w @r13, r11
	mov.w 2(r13), r9
	mov.w 4(r13), r7
	mov.w 6(r13), r14

	cmp.w r11, r10
	jeq .moreCmp

.check1:
	mov.b #1, r12
	cmp.w r15, r14
	jhs .doCmp

.retAndFF:
	and #0xFF, r12

	popm.w #1, r4
	popm.w #5, r10
	ret

.doCmp:
	cmp.w r14, r15
	jeq .continue

.ret0:
	mov.b #0, r12
	br #.retAndFF

.continue:
	cmp.w r6, r7
	jlo .retAndFF

	cmp.w r7, r6
	jne .ret0

	cmp.w r8, r9
	jlo .retAndFF

	cmp.w r9, r8
	jne .ret0

	cmp.w r10, r11
	jlo .retAndFF

	mov.b #0, r12
	br #.retAndFF

.moreCmp:
	cmp.w r9, r8
	jne .check1

	cmp.w r7, r6
	jne .check1

	cmp.w r14, r15
	jne .check1

	mov.b #1, r14
	cmp.w 14(r12), 14(r13)
	jlo .retR14

	cmp.w 14(r13), 14(r12)
	jeq .moreCmp2

.ret02:
	mov.b #0, r14

.retR14:
	mov.b r14, r12

.return:
	popm.w #1, r4
	popm.w #5, r10
	ret

.moreCmp2:
	cmp.w 12(r12), 12(r13)
	jlo .retR14

	cmp.w 12(r13), 12(r12)
	jne .ret02

	cmp.w 10(r12), 10(r13)
	jlo .retR14

	cmp.w 10(r13), 10(r12)
	jne .ret02

	cmp.w 8(r12), 8(r13)
	jhs .ret02

	mov.b r14, r12
	br #.return





uint128_t_operator_below:
	pushm.w #2, r10
	pushm.w #1, r4
	mov.w r1, r4
	mov.w r12, r10
	mov.w r13, r9

	call uint128_t_operator_equal_equal
	cmp.b #0, r12
	jeq .continue

	mov.b #0, r12

	popm.w #1, r4
	popm.w #2, r10
	ret

.continue:
	mov.w r9, r13
	mov.w r10, r12
	call uint128_t_operator_above
	xor.b #1, r12
	and #0xFF, r12

	popm.w #1, r4
	popm.w #2, r10
	ret





uint128_t_operator_above_equal:
	pushm.w #1, r4
	mov.w r1, r4

	call uint128_t_operator_below
	xor.b #1, r12

	popm.w #1, r4
	ret





uint128_t_operator_below_equal:
	pushm.w #1, r4
	mov.w r1, r4

	call uint128_t_operator_above
	xor.b #1, r12

	popm.w #1, r4
	ret





uint128_t_operator_plus:
	pushm.w #7, r10
	mov.w r1, r4
	sub.w #14, r1

	mov.w 8(r13), -10(r4)
	mov.w 10(r13), -8(r4)
	mov.w 12(r13), -4(r4)
	mov.w 14(r13), r6
	mov.w 10(r14), r9
	mov.w 12(r14), r10
	mov.w 14(r14), r8
	mov.w -10(r4), r15

	add.w 8(r14), r15
	mov.w r15, -12(r4)
	mov.b #1, r15
	cmp.w -10(r4), -12(r4)
	jlo .skip

	mov.b #0, r15

.skip:
	add.w -8(r4), r9
	mov.b #1, r7
	cmp.w -8(r4), r9
	jlo .skip2

	mov.b #0, r7

.skip2:
	add.w r9, r15
	mov.w r15, -6(r4)
	mov.b #1, r15
	cmp.w '9, -6(r4)
	jlo .skip3

	mov.b #0, r15

.skip3:
	bis.w r15, r7
	add.w -4(r4), r10
	mov.b #1, r15
	cmp.w -4(r4), r10
	jlo .skip4

	mov.b #0, r15

.skip4:
	add.w r10, r7
	mov.w r7, -2(r4)
	mov.b #1, r9
	cmp.w r10, r7
	jlo .skip5

	mov.b #0, r9

.skip5:
	bis.w r9, r15
	add.w r6, r8
	add.w r8, r15

	mov.w @r13, r9
	mov.w 2(r13), r5
	mov.w 4(r13), r7
	mov.w 6(r13), -14(r4)
	mov.w 2(r14), r13
	mov.w 4(r14), r10
	mov.w 6(r14), r11
	mov.w r9, r8

	add.w @r14, r8
	mov.b #1, r14
	cmp.w r9, r8
	jlo .skip6

	mov.b #0, r14

.skip6:
	mov.w r5, r9
	add.w r13, r9
	mov.b #1, r13
	cmp.w r5, r9
	jlo .skip7

	mov.b #0, r13

.skip7:
	add.w r9, r14
	mov.b #1, r5
	cmp.w r9, r14
	jlo .skip8

	mov.b #0, r5

.skip8:
	bis.w r5, r13
	add.w r7, r10
	mov.b #1, r9
	cmp.w r7, r10
	jlo .skip9

	mov.b #0, r9

.skip9:
	add.w r10, r13
	mov.b #1, r7
	cmp.w r10, r13
	jlo .skip10

	mov.b #0, r7

.skip10:
	bis.w r7, r9
	add.w -14(r4), r11
	add.w r9, r11
	mov.b #1, r10

	cmp.w r6, r15
	jlo .afterComp

	cmp.w r15, r6
	jeq .continueComp

.comp0:
	mov.b #0, r10

.afterComp:
	add.w r8, r10
	mov.b #1, r7
	cmp.w r8, r10
	jlo .skip11

	mov.b #0, r7

.skip11:
	mov.b #0, r9
	mov.w r7, r8
	add.w r14, r8
	mov.b #1, r7
	cmp.w r14, r8
	jlo .skip12

	mov.w r9, r7

.skip12:
	bis.w r7, r9
	mov.b #0, r14
	add.w r13, r9
	mov.b #1, r7
	cmp.w r13, r9
	jlo .skip13

	mov.w r14, r7

.skip13:
	bis.w r7, r14

	mov.w r10, @r12
	mov.w r8, 2(r12)
	mov.w r9, 4(r12)
	add.w r11, r14

	mov.w r14, 6(r12)
	mov.w -12(r4), 8(r12)
	mov.w -6(r4), 10(r12)
	mov.w -2(r4), 12(r12)
	mov.w r15, 14(r12)

	add.w #14, r1
	popm.w #7, r10
	ret

.continueComp:
	cmp.w -4(r4), -2(r4)
	jlo .afterComp

	cmp.w -2(r4), -4(r4)
	jne .comp0

	cmp.w -8(r4), -6(r4)
	jlo .afterComp

	cmp.w -6(r4), -8(r4)
	jne .comp0

	cmp.w -10(r4), -12(r4)
	jlo .afterComp

	mov.b #0, r10
	br #.afterComp





uint128_t_operator_plus_equal:
	pushm.w #1, r10
	pushm.w #1, r4
	mov.w r1, r4

	sub.w #0x10, r1
	mov.w r12, r10
	mov.w r13, r14
	mov.w r12, r13
	mov.w r4, r12

	add.w #-0x10, r12
	call uint128_t_operator_plus

	mov.w r4, r13
	add.w #-0x10, r13
	mov.w r10, r12
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mov.w r10, r12
	add.w #0x10, r1
	popm.w #1, r4
	popm.w #1, r10
	ret





uint128_t_operator_minus:





uint128_t_operator_minus_equal:
	pushm.w #1, r10
	pushm.w #1, r4
	mov.w r1, r4

	sub.w #0x10, r1
	mov.w r12, r10
	mov.w r13, r14
	mov.w r12, r13
	mov.w r4, r12

	add.w #-0x10, r12
	call uint128_t_operator_minus

	mov.w r4, r13
	add.w #-0x10, r13
	mov.w r10, r12
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mov.w r10, r12
	add.w #0x10, r1
	popm.w #1, r4
	popm.w #1, r10
	ret





uint128_t_operator_multiply:





uint128_t_operator_multiply_equal:
	pushm.w #1, r10
	pushm.w #1, r4
	mov.w r1, r4

	sub.w #0x10, r1
	mov.w r12, r10
	mov.w r13, r14
	mov.w r12, r13
	mov.w r4, r12

	add.w #-0x10, r12
	call uint128_t_operator_multiply

	mov.w r4, r13
	add.w #-0x10, r13
	mov.w r10, r12
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mov.w r10, r12
	add.w #0x10, r1
	popm.w #1, r4
	popm.w #1, r10
	ret





uint128_t_divmod:





uint128_t_operator_divide:





uint128_t_operator_divide_equal:
	pushm.w #1, r10
	pushm.w #1, r4
	mov.w r1, r4

	sub.w #0x10, r1
	mov.w r12, r10
	mov.w r13, r14
	mov.w r12, r13
	mov.w r4, r12

	add.w #-0x10, r12
	call uint128_t_operator_divide

	mov.w r4, r13
	add.w #-0x10, r13
	mov.w r10, r12
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mov.w r10, r12
	add.w #0x10, r1
	popm.w #1, r4
	popm.w #1, r10
	ret





uint128_t_operator_modulo:





uint128_t_operator_modulo_equal:
	pushm.w #1, r10
	pushm.w #1, r4
	mov.w r1, r4

	sub.w #0x10, r1
	mov.w r12, r10
	mov.w r13, r14
	mov.w r12, r13
	mov.w r4, r12

	add.w #-0x10, r12
	call uint128_t_operator_modulo

	mov.w r4, r13
	add.w #-0x10, r13
	mov.w r10, r12
	call uint128_t_operator_equal_const_uint128_t_double_ref

	mov.w r10, r12
	add.w #0x10, r1
	popm.w #1, r4
	popm.w #1, r10
	ret





uint128_t_operator_plus_plus:





uint128_t_operator_plus_plus_int:





uint128_t_operator_minus_minus:





uint128_t_operator_minus_minus_int:





uint128_t_operator_single_plus:





uint128_t_operator_single_minus:





uint128_t_upper:





uint128_t_lower:





uint128_t_bits:
