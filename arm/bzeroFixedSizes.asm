	.text

.macro mk124BZero instr, num

bzero\num:
	mov r3, #0
	\instr r3, [r0]
	bx lr

.endm

	mk124BZero strb, 1
	mk124BZero strh, 2
	mk124BZero str, 4
