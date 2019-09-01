	.text

sync_fetch_and_add_32:
	ldaddal w1, w2, [x0]
	mov w0, w2
	ret




sync_fetch_and_add_32:
	ldaddal w1, w3, [x0]
	add w2, w3, w1

	mov w0, w2
	ret





sync_bool_compare_and_swap_32:
	mov w3, w1
	casal w3, w2, [x0]

	cmp w3, w1
	cset w0, eq
	ret





sync_val_compare_and_swap_32:
	mov w3, w1
	casal w3, w2, [x0]

	mov w0, w3
	ret





sync_synchronize:
	dmb ish
	ret





sync_lock_test_and_set_32:
	swpa w1, w2, [x0]
	
	mov w0, w2
	ret





sync_lock_release_32:
	stlr wzr, [x0]
	ret
