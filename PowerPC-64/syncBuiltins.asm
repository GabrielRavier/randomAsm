sync_fetch_and_add_64:
	sync

.loop:
	ldarx 10, 0, 3
	add 9, 10, 4
	stdcx. 9, 0, 3
	bne 0, .loop

	isync

	mr 3, 10
	blr

	.long 0
	.quad 0





sync_add_and_fetch_64:
	sync

.loop:
	ldarx 9, 0, 3
	add 9, 4
	stdcx. 9, 0, 3
	bne 0, .loop

	isync

	mr 3, 9
	blr

	.long 0
	.quad 0





sync_bool_compare_and_swap_64:
	sync

.loop:
	ldarx 9, 0, 3
	cmpd 0, 9, 4
	bne 0, .end

	stdcx. 5, 0, 3
	bne 0, .loop

.end:
	isync

	mfcr 3, 0x80
	rlwinm 3, 1
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0





sync_val_compare_and_swap_64:
	sync

.loop:
	ldarx 9, 0, 3
	cmpd 0, 9, 4
	bne 0, .end

	stdcx. 5, 0, 3
	bne 0, .loop

.end:
	isync

	mr 3, 9
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
