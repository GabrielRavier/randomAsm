	.text

__rold:
	andi $5, 0x1F
	subu $2, $0, $5
	srl $2, $4, $2
	sll $5, $4, $5
	j $31
	or $2, $5





__rord:
	andi $5, 0x1F
	subu $2, $0, $5
	sll $2, $4, $2
	srl $5, $4, $5
	j $31
	or $2, $5





__rolq:
	andi $8, $6, 0x3F
	subu $7, $0, $8
	andi $11, $7, 0x3F
	nor $2, $0, $8

	srl $3, $4, 1
	sll $10, $5, 1

	nor $9, $0, $11
	sll $10, $3
	srl $9, $3, $9
	srl $2, $4, $8
	sll $3, $5, $11

	andi $6, 0x20
	srl $5, $8

	andi $7, 0x20
	sll $4, $11

	or $2, $10, $2
	or $3, $9, $3

	movn $3, $4, $6
	movn $3, $4, $7
	movn $5, $0, $6
	movn $4, $0, $7

	or $3, $5
	j $31
	or $2, $4, $2





__rorq:
	andi $8, $6, 0x3F
	subu $7, $0, $8
	andi $11, $7, 0x3F
	nor $3, $0, $8

	sll $2, $5, 1
	srl $10, $4, 1

	nor $9, $0, $11
	sll $10, $3
	sll $9, $2, $9
	srl $2, $4, $11

	andi $6, 0x20
	sll $4, $8

	andi $7, 0x20
	srl $5, $11

	or $3, $10, $3
	or $2, $9, $2

	movn $3, $4, $6
	movn $2, $5, $7
	movn $4, $0, $6
	movn $5, $0, $7

	or $3, $5, $3
	j $31
	or $2, $4
