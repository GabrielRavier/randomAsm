__popcountsi2:
	lis 9, 0x5555
	srwi 10, 3, 1
	ori 9, 0x5555
	and 9, 10, 9

	lis 10, 0x3333
	subf 3, 9, 3
	ori 10, 0x3333
	srwi 9, 3, 2
	and 9, 10
	and 10, 3, 10
	add 9, 10

	srwi 10, 9, 4
	add 9, 10, 9
	lis 10, 0xF0F
	ori 10, 0xF0F
	and 9, 10

	srwi 10, 9, 16
	add 9, 10, 9

	srwi 10, 9, 8
	add 3, 10, 9

	rlwinm 3, 0, 26, 31
	blr





__popcountdi2:
	slwi 5, 3, 31
	srwi 10, 4, 1
	lis 7, 0x5555
	srwi 6, 3, 1
	ori 7, 0x5555
	or 10, 5, 10
	and 8, 6, 7
	subfc 9, 4
	subfe 8, 3

	lis 5, 0x3333
	slwi 0, 8, 30
	srwi 4, 9, 2
	ori 5, 0x3333
	srwi 3, 8, 2
	or 4, 0, 4

	and 6, 3, 5
	and 10, 8, 5
	and 7, 4, 5
	and 11, 9, 5
	addc 9, 7, 11
	adde 8, 6, 10

	slwi 7, 8, 28
	srwi 11, 9, 4
	srwi 10, 8, 4
	or 11, 7, 11
	addc 11, 9
	adde 10, 8

	lis 8, 0xF0F
	ori 8, 0xF0F
	and 9, 10, 8
	and 8, 11, 8

	add 9, 8

	srwi 10, 9, 16
	add 9, 10, 9

	srwi 10, 9, 8
	add 3, 10, 9

	rlwinm 3, 25, 21
	blr
