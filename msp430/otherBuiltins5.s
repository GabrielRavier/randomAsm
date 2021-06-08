	.text

trap:
	pushm.w #1, r4
	mov.w r1, r4
	call #abort
