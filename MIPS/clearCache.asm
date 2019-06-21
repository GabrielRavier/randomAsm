clear_cache:
	subu $6, $5, $4
	li $7, 3
	move $5, $4
	j syscall
	li $4, 0x1033
