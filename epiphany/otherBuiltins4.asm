	.text

isdigit:
	add r0, #-0x30
	sub r1, r0, #9
	mov r1, #1
	mov r0, #0
	movlteu r0, r1
	rts





labs:
	mov r1, #0
	sub r1, r0
	movgt r0, r1
	rts
