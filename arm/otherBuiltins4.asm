	.text

abs:
labs:
	.irp instr, cmp, rsblt
		\instr r0, #0
	.endr

	bx lr





fabs:
	bic r1, #0x80000000
	bx lr





isdigit:
	sub r0, #0x30
	cmp r0, #9
	movHiLs r0, #0, #1
	bx lr
