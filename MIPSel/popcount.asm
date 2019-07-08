__popcountsi2:
	li $3, 0x55550000
	srl $2, $4, 1
	addiu $3, 0x5555
	and $3, $2, $3
	subu $4, $3

	li $2, 0x33330000
	addiu $2, 0x3333
	srl $3, $4, 2
	and $3, $2
	and $4, $2
	addu $4, $3, $4

	srl $3, $4, 4
	li $2, 0xF0F0000
	addu $3, $4
	addiu $2, 0xF0F
	and $2, $3, $2

	srl $3, $2, 16
	addu $2, $3

	srl $3, $2, 8
	addu $2, $3, $2

	j $31
	andi $2, 0x3F





__popcountdi2:
	sll $6, $5, 0x1F
	srl $2, $4, 1

	li $3, 0x55550000
	addiu $3, 0x5555

	or $2, $6, $2
	and $2, $3

	srl $6, $5, 1
	subu $2, $4, $2
	and $3, $6, $3
	subu $5, $3
	sltu $4, $2
	subu $4, $5, $4

	sll $3, $5, 30
	srl $6, $2, 2

	li $5, 0x33330000
	addiu $5, 0x3333

	or $6, $3, $6
	and $6, $5

	srl $3, $4, 2
	and $2, $5
	addu $2, $6, $2
	and $3, $5
	and $4, $5

	sltu $6, $2, $6
	addu $4, $3, $4
	addu $5, $6, $4

	sll $4, $5, 28
	srl $3, $2, 4
	or $3, $4, $3
	addu $2, $3, $2
	srl $6, $5, 4
	sltu $4, $2, $3
	addu $3, $6, $5

	li $6, 0xF0F0000
	addiu $6, 0xF0F
	addu $3, $4, $3
	and $3, $6
	and $2, $6

	addu $2, $3, $2

	srl $3, $2, 16
	addu $2, $3

	srl $3, $2, 8
	addu $2, $3, $2

	j $31
	andi $2, 0x7F
