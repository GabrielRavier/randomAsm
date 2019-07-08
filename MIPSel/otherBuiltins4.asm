abs:
labs:
	bltz $4, .doSub
	mov $2, $4

	j $31
	nop

.doSub:
	j $31
	subu $2, $0, $4





fabs:
	j $31
	abs.d $f0, $f12





isdigit:
	addiu $2, $4, -0x30
	j $31
	sltu $2, 10
