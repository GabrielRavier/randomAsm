	.text

sync_fetch_and_add_64:
#if ARMv81
	ldaddal x1, x2, [x0]
#else
.loop:
	ldxr x2, [x0]
	add x3, x2, x1
	stlxr w4, x3, [x0]
	cbnz w4, .loop

	dmb ish
#endif

	mov x0, x2
	ret





sync_fetch_and_add_64:
#if ARMv81
	ldaddal x1, x3, [x0]
	add x2, x3, x1
#else
.loop:
	ldxr x2, [x0]
	add x2, x1
	stlxr w3, x2, [x0]
	cbnz w3, .loop

	dmb ish
#endif

	mov x0, x2
	ret





sync_bool_compare_and_swap_64:
#if ARMv81
	mov x3, x1
	casal x3, x2, [x0]

	cmp x3, x1
#else
.loop:
	ldxr x3, [x0]
	cmp x3, x1
	bne .end

	stlxr w4, x2, [x0]
	cbnz w4, .loop

.end:
	dmb ish
#endif

	cset w0, eq
	ret





sync_val_compare_and_swap_64:
#if ARMv81
	mov x3, x1
	casal x3, x2, [x0]
#else
.loop:
	ldxr x3, [x0]
	cmp x3, x1
	bne .end

	stlxr w4, x2, [x0]
	cbnz w4, .loop

.end:
	dmb ish
#endif

	mov x0, x3
	ret





sync_synchronize:
	dmb ish
	ret





sync_lock_test_and_set_64:
#if ARMv81
	swpa x1, x2, [x0]
#else
.loop:
	ldxr x2, [x0]
	stxr w3, x1, [x0]
	cbnz w3, .loop

	dmb ish
#endif

	mov x0, x2
	ret
