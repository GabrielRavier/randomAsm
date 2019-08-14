	.text

__rold:
	andi a1, 0x1F
	subw a5, zero, a1
	sllw a1, a0, a1
	srlw a0, a5
	or a0, a1, a0

	sext.w a0
	ret





__rord:
	andi a1, 0x1F
	subw a5, zero, a1
	srlw a1, a0, a1
	sllw a0, a5
	or a0, a1, a0

	sext.w a0
	ret





__rolq:
	andi a1, 0x3F
	subw a5, zero, a1
	sll a1, a0, a1
	srl a0, a5
	or a0, a1
	ret





__rorq:
	andi a1, 0x3F
	subw a5, zero, a1
	srl a1, a0, a1
	sll a0, a5
	or a0, a1
	ret
