.include "standard.inc"

	.text

__rold:
	multiPush r16, r17
	andi r20, 0x1F
	clr r21

	mov32 r16, r22
	mov r0, r20
	rjmp .startLoop

.loop:
	lsl32 r16

.startLoop:
	dec r0
	brpl .loop

	neg r21
	neg r20
	sbc r21, __zero_reg__
	andi r20, 0x1F
	rjmp .startLoop2

.loop2:
	lsr r25
	ror r24
	ror r23
	ror r22

.startLoop2:
	dec r20
	brpl .loop2

	or32 r22, r18
	multiPop r17, r16
	ret





__rord:
	multiPush r16, r17
	andi r20, 0x1F
	clr r21

	mov32 r16, r22
	mov r0, r20
	rjmp .startLoop

.loop:
	lsr32 r16

.startLoop:
	dec r0
	brpl .loop

	neg r21
	neg r20
	sbc r21, __zero_reg__
	andi r20, 0x1F
	rjmp .startLoop2

.loop2:
	lsl r25
	rol r24
	rol r23
	rol r22

.startLoop2:
	dec r20
	brpl .loop2

	or32 r22, r18
	multiPop r17, r16
	ret





__rolq:
	multiPush r16, r17

	andi r16, 0x3F
	clr r17
	call __rotldi3

	multiPop r17, r16
	ret





__rorq:
	multiPush r16, r17

	movw r30, r16
	andi r30, 0x3F
	clr r31
	ldi16 r16, 0x40
	sub16 r16, r30
	call __rotldi3

	multiPop r17, r16
	ret
