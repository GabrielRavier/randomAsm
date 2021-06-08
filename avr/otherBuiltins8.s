.include "standard.inc"

	.text

isfinite:
	multiPush r12, r13, r14, r15, r28
	mov32 r12, r22

	clt
	bld r15, 7

	ldi r28, 1
	ldi32 r18, 0x7F7FFFFFF

	mov32 r22, r12
	call __unordsf2

	cpse r24, __zero_reg__
	rjmp .return

	ldi32 r18, 0x7F7FFFFF
	mov32 r22, r12
	call __gtsf2

	cp __zero_reg__, r24
	brge .ret0

.return:
	ldi16 r24, 1
	eor r24, r28
	multiPop r28, r15, r14, r13, r12
	ret

.ret0:
	ldi r28, 0
	rjmp .return





isnormal:
	multiPush r12, r13, r14, r15, r28, r29
	mov32 r12, r22

	clt
	bld r15, 7

	ldi r28, 1
	ldi32 r18, 0x7F7FFFFF
	mov32 r22, r12
	call __unordsf2

	cpse r24, __zero_reg__
	rjmp .l6

	ldi32 r18, 0x7F7FFFFF
	mov32 r22, r12
	call __gtsf2

	cp __zero_reg__, r24
	brge .got0

.continue:
	ldi r24, 1
	eor r28, r24

	ldi r29, 1
	ldi016 r18
	ldi16 r20, 0x80
	mov32 r22, r12
	call __unordsf2

	cpse r24, __zero_reg__
	rjmp .return

	ldi32 r18, 0x800000
	mov32 r22, r12
	call __ltsf2

	mov r29, r24
	rol r29
	clr r29
	rol r29

.return:
	ldi16 r24, 1
	eor r24, r29
	and r24, r28
	multiPop r29, r28, r15, r14, r13, r12
	ret

.got0:
	ldi r28, 0
	rjmp .continue





isint_sign:
	multiPush r8, r9, r10, r11, r12, r13, r14, r15
	mov32 r8, r22
	mov32 r12, r22

	clt
	bld r15, 7

	ldi32 r18, 0x7F7FFFFF
	mov32 r22, r12
	call __unordsf2

	cpse r24, __zero_reg__
	rjmp .ret0

	ldi32 r18, 0x7F7FFFFF
	mov32 r22, r12
	call __lesf2

	cp __zero_reg__, r24
	brge .ret0

	sbrc r11, 7
	rjmp .retMin1

	ldi16 r24, 1

.return:
	multiPop r15, r14, r13, r12, r11, r10, r9, r8
	ret

.ret0:
	ldi016 r24
	rjmp .return

.retMin1:
	ldi16 r24, -1
	rjmp .return





fpclassify:
	multiPush r12, r13, r14, r15
	mov32 r12, r22

	clt
	bld r15, 7

	mov32 r18, r12
	mov32 r22, r12
	call __unordsf2

	cpse r24, __zero_reg__
	rjmp .ret0

	ldi32 r18, 0x7F7FFFFF
	mov32 r22, r12
	call __gtsf2

	cp __zero_reg__, r24
	brlt .ret1

	ldi32 r18, 0x800000

	mov32 r22, r12
	call __gesf2

	sbrc r24, 7
	rjmp .continue

	ldi16 r24, 4

.return:
	multiPop r15, r14, r13, r12
	ret

.ret1:
	ldi16 r24, 1
	rjmp .return

.continue:
	ldi16 r18, 0
	mov32 r22, r12
	mov r20, r18
	call __eqfs2

	tst r24
	breq .ret2

	ldi16 r24, 3
	rjmp .return

.ret2:
	ldi16 r24, 2
	rjmp .return

.ret0:
	ldi16 r24, 0
	rjmp .return
