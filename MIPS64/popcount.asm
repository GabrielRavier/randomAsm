__popcountdi2:
	li $2, 0x55550000
	daddiu $2, 0x5555

	dsll $2, 16
	daddiu $2, 0x555

	dsll $2, 16
	dsrl $5, $4, 1
	daddiu $2, 0x5555
	and $2, $5, $2

	li $5, 0x33330000
	daddiu $5, 0x3333

	dsll $5, 16
	daddiu $5, 0x3333
	dsubu $2, $4, $2

	dsll $5, 16

	li $3, 0xF0F00000
	daddiu $5, 0x3333
	dsrl $4, $2, 2

	daddiu $3, 0xF0F
	and $2, $5
	and $4, $5

	dsll $3, 16
	daddu $4, $2
	daddiu $3, 0xF0F

	dsrl $2, $4, 4
	dsll $3, 16
	daddu $4, $2, $4
	daddiu $3, 0xF0F
	and $3, $4, $3

	dsrl $2, $3, 32
	sll $3, 0
	addu $2, $3, 2

	srl $3, $2, 16
	addu $2, $3

	srl $3, $2, 8
	addu $2, $3, $2

	j $31
	andi $2, 0x7F
