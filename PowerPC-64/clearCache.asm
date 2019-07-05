	.text

clear_cache:
	addi 4, 31
	rldicr 3, 0, 58
	rldicr 4, 0, 58

	cmpld 7, 3, 4
	bge 7, .afterLoop

	mr 9, 3

.loop:
	dcbf 0, 9
	addi 9, 32
	cmpld 7, 4, 9
	bgt 7, .loop

.afterLoop:
	sync
	cmpld 7, 3, 4
	bge 7, .afterLoop2

.loop2:
	icbi 0, 3
	addi 3, 32
	cmpld 7, 4, 3
	bgt 7, .loop2

.afterLoop2:
	isync
	blr

	.long 0
	.byte 0, 9, 0, 0, 0, 0, 0, 0
