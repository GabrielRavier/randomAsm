sadd_overflow:
	daddu $4, $5
	sll $3, $4, 0
	move $2, $3

	xor $2, $4, $2
	sw $3, 0($6)

	j $31
	sltu $2, $0, $2
