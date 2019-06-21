abs:
	move $2, $4
	slt $3, $2, 0
	subu $4, $0, $4

	j $31
	movn $2, $4, $3





fabs:
	j $31
	abs.d $f0, $f12





isdigit:
	addiu $2, $4, -48
	j $31
	sltu $2, 10





labs:
	dsubu $2, $0, $4
	slt $3, $4, 0

	j $31
	movz $2, $4, $3





sqrt:
	j $31
	sqrt.d $f0, $f12
