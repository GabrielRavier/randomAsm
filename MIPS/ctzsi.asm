__ctzsi2:
	andi $2, $4, 0xFFFF
	bne $2, $0, .ne
	move $3, $0

	li $3, 0x10
	srl $4, $3
	andi $2, $4, 0xFF

	li $6, 0x18
	bne $2, $0, .ne2
	li $5, 0x10

.eq:
	li $3, 8
	srl $4, $3
	andi $2, $4, 0xF
	bne $2, $0, .ne3
	move $5, $6

	li $3, 4

.eq2:
	srl $4, $3
	li $2, 4

	andi $3, $4, 3
	beq $3, $0, .return2
	addu $5, $2, $5

.return:
	move $3, $0
	srl $3, $4, $3
	andi $2, $3, 3
	andi $3, 1

	li $6, 2
	srl $2, 1
	xori $3, 1
	subu $2, $6, $2
	move $7, $0
	subu $3, $0, $3
	and $3, $2, $3
	addu $2, $5, $7

	j $31
	addu $2, $3, $2

.ne:
	srl $4, $3
	andi $2, $4, 0xFF
	li $6, 8
	beq $2, $0, .eq
	move $5, $0

.ne2:
	move $3, $0
	srl $4, $3
	andi $2, $4, 0xF
	beq $2, $0, .eq2

	li $3, 4

.ne3:
	move $3, $0
	srl $4, $3
	move $2, $0

	andi $3, $4, 0x3
	bne $3, $0, .return

	addu $5, $2, $5

.return2:
	li $3, 2
	srl $3, $4, $3
	andi $2, $3, 0x3
	andi $3, 1

	li $6, 2
	srl $2, 1
	xori $3, 1
	subu $2, $6, $2

	li $7, 2
	subu $3, $0, $3
	and $3, $2, $3
	addu $2, $5, $7

	j $31
	addu $2, $3, $2
