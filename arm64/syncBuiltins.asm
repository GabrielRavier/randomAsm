	.text

sync_fetch_and_add_64:
	ldaddal x1, x2, [x0]

	mov x0, x2
	ret





sync_fetch_and_add_64:
	ldaddal x1, x3, [x0]
	add x2, x3, x1

	mov x0, x2
	ret





sync_bool_compare_and_swap_64:
	mov x3, x1
	casal x3, x2, [x0]

	cmp x3, x1
	cset w0, eq
	ret





sync_val_compare_and_swap_64:
	mov x3, x1
	casal x3, x2, [x0]

	mov x0, x3
	ret





sync_synchronize:
	dmb ish
	ret





sync_lock_test_and_set_64:
	swpa x1, x2, [x0]
	
	mov x0, x2
	ret
