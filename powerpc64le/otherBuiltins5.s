	.text

trap:
	trap

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
