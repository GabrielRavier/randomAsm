__cmpsf2:
__eqsf2:
__nesf2:
__ltsf2:
__lesf2:
	call __fp_cmp
	brcc .return

	ldi r24, 1

.return:
	ret
