	.text

delay_cycles_0:
	ret





delay_cycles_1:
	nop
	ret





delay_cycles_2:
	rjmp .
	ret





delay_cycles_3:
	rjmp .
	nop
	ret





delay_cycles_4:
	rjmp .
	rjmp .
	ret





delay_cycles_8:
	ldi r24, lo8(2)

.loop:
	dec r24
	brne .loop

	rjmp .
	ret





delay_cycles_32:
	ldi r24, lo8(10)

.loop:
	dec r24
	brne .loop

	rjmp .
	ret





delay_cycles_128:
	ldi r24, lo8(42)

.loop:
	dec r24
	brne .loop

	rjmp .
	ret





delay_cycles_512:
	ldi r24, lo8(-86)

.loop:
	dec r24
	brne .loop

	rjmp .
	ret





delay_cycles_2048:
	ldi r24, lo8(0x1FF)
	ldi r25, hi8(0x1FF)

.loop:
	sbiw r24, 1
	brne .loop

	rjmp .
	nop
	ret





delay_cycles_8192:
	ldi r24, lo8(0x7FF)
	ldi r25, hi8(0x7FF)

.loop:
	sbiw r24, 1
	brne .loop

	rjmp .
	nop
	ret





delay_cycles_32768:
	ldi r24, lo8(0x1FFF)
	ldi r25, hi8(0x1FFF)

.loop:
	sbiw r24, 1
	brne .loop

	rjmp .
	nop
	ret





delay_cycles_131072:
	ldi r24, lo8(0x7FFF)
	ldi r25, hi8(0x7FFF)

.loop:
	sbiw r24, 1
	brne .loop

	rjmp .
	nop
	ret





delay_cycles_524288:
	ldi r18, lo8(0x19999)
	ldi r24, hi8(0x19999)
	ldi r25, hlo8(0x19999)

.loop:
	subi r18, 1
	sbci r24, 0
	sbci r25, 0
	brne .loop

	nop
	ret





delay_cycles_4194304:
	ldi r18, lo8(0xCCCCC)
	ldi r24, hi8(0xCCCCC)
	ldi r25, hlo8(0xCCCCC)

.loop:
	subi r18, 1
	sbci r24, 0
	sbci r25, 0
	brne .loop

	nop
	ret





delay_cycles_4194304:
	ldi r18, lo8(0x666666)
	ldi r24, hi8(0x666666)
	ldi r25, hlo8(0x666666)

.loop:
	subi r18, 1
	sbci r24, 0
	sbci r25, 0
	brne .loop

	ret





delay_cycles_268435456:
	ldi r18, lo8(0x2AAAAAA)
	ldi r19, hi8(0x2AAAAAA)
	ldi r24, hlo8(0x2AAAAAA)
	ldi r25, hhi8(0x2AAAAAA)

.loop:
	subi r18, 1
	sbci r19, 0
	sbci r24, 0
	sbci r25, 0
	brne .loop

	nop
	ret





delay_cycles_268435456:
	ldi r18, lo8(0x15555554)
	ldi r19, hi8(0x15555554)
	ldi r24, hlo8(0x15555554)
	ldi r25, hhi8(0x15555554)

.loop:
	subi r18, 1
	sbci r19, 0
	sbci r24, 0
	sbci r25, 0
	brne .loop

	rjmp .
	rjmp .
	nop
	ret
