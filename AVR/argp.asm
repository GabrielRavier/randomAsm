.include "standard.inc"

	.text

__argp_usage:
	lds r22, __iob+4
	lds r23, __iob+5
	ldi r20, lo8(6)
	ldi r21, hi8(1)
	jmp __argp_state_help





__option_is_short:
	movw r30, r24

	ld16 r20, Z, 6

	movw r18, r20
	andi r18, 8
	clr r19

	sbrc r20, 3
	rjmp .ret0

	ld16 r24, Z, 2

	movw r20, r24
	subi r20, 1
	sbc r21, __zero_reg__

	cpi r20, -1
	cpc r21, __zero_reg__
	brsh .return

	call isprint

	ldi r21, lo8(1)
	ldi r20, 0

	or r24, r25
	breq .finish

	mov r18, r21
	mov r19, r20

.return:
	movw r24, r18
	ret

.ret0:
	multiLdi0 r18, r19
	movw r24, r18
	ret

.finish:
	ldi r21, 0
	mov r18, r21
	mov r19, r20
	rjmp .return





__option_is_end:
	movw r30, r24

	ld16 r24, Z, 2
	sbiw r24, 0
	brne .ret0

	ld16 r18, Z, 0
	or r18, r19
	breq .continue

.return:
	ret

.ret0:
	ldi016 r24
	ret

.continue:
	ld16 r18, Z, 8
	or r18, r19
	brne .return

	ldi r19, lo8(1)
	ldi r18, 0

	ld16 r24, Z, 10
	or r24, r25
	breq .skip

	ldi r19, 0

.skip:
	mov r24, r19
	mov r25, r18
	ret
