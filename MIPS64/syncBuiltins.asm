sync_fetch_and_add_64:
	sync

.loop:
	lld $2, 0($4)
	daddu $1, $2, $5
	scd $1, 0($4)
	beq $1, $0, .loop

	nop
	sync

	j $31
	nop





sync_add_and_fetch_64:
	sync

.loop:
	lld $2, 0($4)
	daddu $1, $2, $5
	scd $1, 0($4)
	beq $1, $0, .loop

	daddu $2, $5
	sync

	j $31
	nop





sync_bool_compare_and_swap_64:
	sync

.loop:
	lld $3, 0($4)
	bne $3, $5, .end

	li $2, 0
	move $1, $6
	scd $1, 0($4)
	beq $1, $0, .loop

	li $2, 1
	sync

.end:
	j $31
	nop





sync_val_compare_and_swap_64:
	sync

.loop:
	lld $2, 0($4)
	bne $2, $5, .end

	move $1, $6
	scd $1, 0($4)
	beq $1, $0, .loop

	nop
	sync

.end:
	j $31
	nop





sync_synchronize:
	sync
	j $31
	nop





sync_lock_test_and_set_64:
.loop:
	lld $2, 0($4)
	move $1, $5
	scd $1, 0($4)
	beq $1, $0, .loop

	nop
	sync

	j $31
	nop
