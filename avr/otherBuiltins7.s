.include "standard.inc"

	.text

isgreater:
	multiPush r28, r29
	ldi16 r28, 1
	call __gtsf2

	cp __zero_reg__, r24
	brge .ret0

	movw r24, r28
	multiPop r29, r28
	ret

.ret0:
	ldi16 r28, 0
	movw r24, r28
	multiPop r29, r28
	ret





isgreater:
	multiPush r28, r29
	ldi16 r28, 1
	call __gesf2

	sbrc r24, 7
	rjmp .ret0

	movw r24, r28
	multiPop r29, r28
	ret

.ret0:
	ldi16 r28, 0
	movw r24, r28
	multiPop r29, r28
	ret





isgreater:
	multiPush r28, r29
	ldi16 r28, 1
	call __ltsf2

	sbrc r24, 7
	rjmp .return

	ldi16 r28, 0

.return:
	movw r24, r28
	multiPop r29, r28
	ret





islessequal:
	multiPush r28, r29
	ldi16 r28, 1
	call __lesf2

	cp __zero_reg__, r24
	brge .return

	ldi16 r28, 0

.return:
	movw r24, r28
	multiPop r29, r28
	ret





islessgreater:
	multiPush r28, r29
	ldi16 r28, 1
	call __nesf2

	cpse r24, __zero_reg__
	rjmp .return

	ldi16 r28, 0

.return:
	movw r24, r28
	multiPop r29, r28
	ret





isunordered:
	multiPush r28, r29
	ldi16 r28, 1
	call __unordsf2

	cpse r24, __zero_reg__
	rjmp .return

	ldi16 r28, 0

.return:
	movw r24, r28
	multiPop r29, r28
	ret
