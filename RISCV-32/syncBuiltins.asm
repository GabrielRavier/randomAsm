sync_fetch_and_add_32:
	amoadd.w.arql a0, a1, (a0)
	ret





sync_add_and_fetch_32:
	amoadd.w.arql a0, a1, (a0)
	add a0, a1
	ret





sync_bool_compare_and_swap_32:
.loop:
	lr.w.aqrl a3, (a0)
	bne a3, a1, .end

	sc.w.aqrl a4, a2, (a0)
	bnez a4, .loop

.end:
	xor a0, a3, a1
	seqz a0
	ret





sync_val_compare_and_swap_32:
.loop:
	lr.w.aqrl a3, (a0)
	bne a3, a1, .end

	sc.w.aqrl a4, a2, (a0)
	bnez a4, .loop

.end:
	mv a0, a3
	ret
