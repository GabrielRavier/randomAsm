.include "standard.inc"

	.text

START_FUNC sync_fetch_and_add_32
	ldaddal w1, w0, [x0]
	ret
END_FUNC sync_fetch_and_add_32




START_FUNC sync_add_and_fetch_32
	ldaddal w1, w0, [x0]
	add w0, w0, w1
	ret
END_FUNC sync_add_and_fetch_32





START_FUNC sync_bool_compare_and_swap_32
	mov w3, w1
	casal w3, w2, [x0]

	cmp w3, w1
	cset w0, eq
	ret
END_FUNC sync_bool_compare_and_swap_32





START_FUNC sync_val_compare_and_swap_32
	casal w1, w2, [x0]
	mov w0, w1
	ret
END_FUNC sync_val_compare_and_swap_32





START_FUNC sync_synchronize
	dmb ish
	ret
END_FUNC sync_synchronize





START_FUNC sync_lock_test_and_set_32
	swpa w1, w0, [x0]
	ret
END_FUNC sync_lock_test_and_set_32





START_FUNC sync_lock_release_32
	stlr wzr, [x0]
	ret
END_FUNC sync_lock_release_32
