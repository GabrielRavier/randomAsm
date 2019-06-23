__paritysi2:
	srwi 9, 3, 16
	xor 3, 9, 3

	srwi 9, 3, 8
	xor 3, 9, 3

	srwi 9, 3, 4
	xor 3, 9, 3

	li 9, 0x6996
	rlwinm 3, 0, 28, 31
	sraw 3, 9, 3

	rlwinm 3, 0, 31, 31
	blr





__paritydi2:
	xor 3, 4, 3
	b __paritysi2
