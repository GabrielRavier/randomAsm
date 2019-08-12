	.text

sync_fetch_and_add_32:
	sync

.loop:
	lwarx 9, 0, 3
	add 10, 9, 4
	stwcx. 10, 0, 3
	bne- 0, .loop

	isync

	mr 3, 9
	blr





sync_add_and_fetch_32:
	sync
	mr 9, 3

.loop:
	lwarx 3, 0, 9
	add 3, 4
	stwcx. 3, 0, 9
	bne- 0, .loop

	isync
	blr





sync_bool_compare_and_swap_32:
	sync

.loop:
	lwarx 9, 0, 3
	cmpw 0, 9, 4
	bne- 0, .end

	stwcx. 5, 0, 3
	bne- 0, .loop

.end:
	isync

	mfcr 3
	rlwinm 3, 1
	blr





sync_val_compare_and_swap_32:
	sync

.loop:
	lwarx 9, 0, 3
	cmpw 0, 9, 4
	bne- 0, .end

	stwcx. 5, 0, 3
	bne- 0, .loop

.end:
	isync

	mr 3, 9
	blr





sync_synchronize:
	sync
	blr





sync_lock_test_and_set_32:
.loop:
	lwarx 9, 0, 3
	stwcx. 4, 0, 3
	bne- 0, .loop

	isync

	mr 3, 9
	blr
