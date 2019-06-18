sadd_overflow:
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
