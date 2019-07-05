	.text

abs:
labs:
	cmp r0, #0
	rsblt r0, #0
	bx lr





fabs:
	bic r3, r1, #0x80000000
	mov r1, r3
	bx lr





isdigit:
	sub r0, #0x30
	cmp r0, #9
	movhi r0, #0
	movls r0, #1
	bx lr
