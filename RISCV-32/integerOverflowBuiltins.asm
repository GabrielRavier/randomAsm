sadd_overflow:
saddl_overflow:
	add a3, a0, a1
	sw a3, 0(a2)
	li a2, -1

	slt a1, a2, a1
	slt a0, a2, a0
	slt a2, a3

	xor a2, a0
	xor a0, a1

	seqz a0
	snez a1, a2

	and a0, a1
	ret





saddll_overflow:
	add a2, a0
	sltu a0, a2, a0

	add a5, a1, a3
	li a6, -1
	li t0, 1
	li a7, 1
	bnez a3, .notZ

	add a3, a5, a0
	li a0, 1
	bnez a1, .notZ2

.afterNotZ:
	beqz a3, .return

.afterNotZ2:
	slt t0, a0, a3

.return:
	sw a2, 0(a4)
	sw a3, 4(a4)

	xor a1, a0, t0
	xor a0, a7

	snez a1
	seqz a0
	and a0, a1
	ret

.notZ:
	slt a7, a6, a3
	add a3, a5, a0
	li a0, 1
	beqz a1, .afterNotZ

.notZ2:
	slt a0, a6, a1
	bnez a3, .afterNotZ2
	j .return





uadd_overflow:
uaddl_overflow:
	add a1, a0
	sw a1, 0(a2)
	sltu a0, a1, a0
	ret





uaddll_overflow:
	add a3, a1
	add a2, a0
	sltu a0, a2, a0
	add a3, a0
	beq a3, a1, .return

	sltu a0, a3, a1

.return:
	sw a2, 0(a4)
	sw a3, 4(a4)
	ret
