	.text

__clrsbdi2:
	rldicl 9, 3, 56, 32
	extsb. 10, 9
	beq 0, .eq

	cmpwi 7, 10, -1
	beq 7, .eq2

	cmpwi 7, 10, 0
	rlwinm 9, 0, 0xFF
	li 10, 0
	blt 7, .eq3

	cntlzw 3, 9
	add 3, 10
	addi 3, -1
	extsw 3
	blr

.eq2:
	not 3

.eq:
	rlwinm 9, 3, 0, 0xFF
	li 3, 0xF
	cmpdi 7, 9, 0
	beqlr 7

	cntlzw 3, 0
	li 10, 8
	add 3, 10
	addi 3, -1
	extsw 3
	blr

.eq3:
	not 9
	rlwinm 9, 0, 0xFF

	cntlzw 3, 9
	add 3, 10
	addi 3, -1
	extsw 3
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
