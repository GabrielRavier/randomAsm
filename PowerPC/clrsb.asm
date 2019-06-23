__clrsbsi2:
	cmpwi 0, 3, 0
	blt- 0, .lt
	bne- 0, .doClz

.ret7:
	li 3, 7
	blr

.lt:
	nor 3
	extsb. 3
	beq+ 0, .ret7

.doClz:
	cntlzw 3
	addi 3, -1
	blr





__clrsbdi2:
	srawi. 9, 3, 8
	beq- 0, .eq

	cmpwi 7, 9, -1
	beq- 7, .eq2
	blt- 0, .doNor

.finish:
	rlwinm 9, 0, 0xFF
	li 10, 0
	cntlzw 3, 9
	add 3, 10
	addi 3, -1
	blr

.eq2:
	nor 3

.eq:
	rlwinm 9, 3, 0, 0xFF
	li 3, 0xF

	cmpwi 7, 9, 0
	beqlr+ 7

	li 10, 8
	cntlzw 3, 9
	add 3, 10
	addi 3, -1
	blr

.doNor:
	nor 9
	b .finish
