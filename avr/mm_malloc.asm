.include "standard.inc"

	.text

_mm_malloc:
	multiPush r28, r29, __zero_reg__, __zero_reg__

	inSP r28

	cpi16 r22, 1
	breq .jmpMalloc

	movw r20, r24
	movw r24, r28
	adiw r24, 1
	call posix_memalign

	or r24, r25
	breq .retPtr

	ldi16 r24, 0
	multiPop __tmp_reg__, __tmp_reg__, r29, r28
	ret

.retPtr:
	ld16 r24, Y, 1
	multiPop __tmp_reg__, __tmp_reg__, r29, r28
	ret

.jmpMalloc:
	multiPop __tmp_reg__, __tmp_reg__, r29, r28
	jmp malloc





_mm_free:
	jmp free
