sync_fetch_and_add_64:
	mv a5, a0

	fence iorw, ow
	amoadd.d.aq a0, a1, 0(a5)

	ret





sync_add_and_fetch_64:
	fence iorw, ow
	amoadd.d.aq a5, a1, 0(a0)

	add a0, a5, a1
	ret





sync_bool_compare_and_swap_64:
	fence iorw, ow

.loop:
	lr.d.aq a5, 0(a0)
	bne a5, a1, .end

	sc.d.aq a4, a2, 0(a0)
	bnez a4, .loop

.end:

	sub a0, a5, a1

	seqz a0
	ret





sync_val_compare_and_swap_64:
	mv a5, a0

	fence iorw, ow

.loop:
	lr.d.aq a0, 0(a5)
	bne a0, a1, .end

	sc.d.aq a4, a2, 0(a5)
	bnez a4, .loop

.end:
	ret





sync_synchronize:
	fence iorw, iorw
	ret





sync_lock_test_and_set_64:
	mv a5, a1
	amoswap.d.aq a5, 0(a0)

	mv a0, a5
	ret
