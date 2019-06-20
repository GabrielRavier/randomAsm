__loop_ffsqi2:
.loop:
	inc r26
	lsr r24
	brcc .loop

	mov r24, r26
	clr r25
	ret
