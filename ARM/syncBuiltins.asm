	.text

sync_fetch_and_add_32:
.loop:
	ldrex r3, [r0]
	add r2, r3, r1
	stlex ip, r2, [r0]

	cmp ip, #0
	bne .loop

	dmb ish

	mov r0, r3
	bx lr





sync_add_and_fetch_32:
.loop:
	ldrex r3, [r0]
	add r3, r1
	stlex r2, r3, [r0]

	cmp r2, #0
	bne .loop

	dmb ish

	mov r0, r3
	bx lr





sync_bool_compare_and_swap_32:
.loop:
	ldrex ip, [r0]
	cmp ip, r1
	bne .end

	stlex r3, r2, [r0]
	cmp r3, #0
	bne .loop

.end:
	dmb ish

	moveq r0, #1
	movne r0, #0
	bx lr





sync_val_compare_and_swap_32:
.loop:
	ldrex r3, [r0]
	cmp r3, r1
	bne .end

	stlex ip, r2, [r0]
	cmp ip, #0
	bne .loop

.end:
	dmb ish

	mov r0, r3
	bx lr





sync_synchronize:
	dmb ish
	bx lr





sync_lock_test_and_set_32:
.loop:
	ldrex r3, [r0]
	strex r2, r1, [r0]

	cmp r2, #0
	bne .loop

	dmb ish

	mov r0, r3
	bx lr
