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
	andi $5, 0x3F
	subu $2, $0, $5
	dsrl $2, $4, $2
	dsll $5, $4, $5
	j $31
	or $2, $5





__rorq:
	andi $5, 0x3F
	subu $2, $0, $5
	dsll $2, $4, $2
	dsrl $5, $4, $5
	j $31
	or $2, $5
