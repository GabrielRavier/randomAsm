bswap16:
	andi $4, 0xFFFF
	sll $2, $4, 8
	srl $4, 8
	or $2, $4
	j $31
	andi $2, 0xFFFF





bswap32:
__bswapsi2:
	sll $5, $4, 24
	srl $3, $4, 24
	srl $2, $4, 8
	or $3, $5
	andi $2, 0xFF00
	andi $4, 0xFF00
	or $2, $3, $2
	sll $4, 8
	j $31
	or $2, $4





bswap64:
__bswapdi2:
	li $7, 0xFF0000
	and $9, $5, $7

	srl $3, $4, 24
	and $7, $4, $7

	srl $8, $5, 24
	sll $6, $4, 24
	srl $9, 8
	andi $2, $5, 0xFF00
	or $6, $3
	andi $4, 0xFF00

	srl $3, $7, 8
	sll $2, 8
	or $7, $8, $9
	or $3, $6, $3

	sll $4, 8
	or $2, $7, $2

	sll $5, 24
	or $3, $4
	j $31
	or $2, $5, $2
