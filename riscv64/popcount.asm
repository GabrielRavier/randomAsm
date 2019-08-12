	.text

__popcountdi2:
	lui a3, %hi(.u5555555555555555)
	ld a3, %lo(.u5555555555555555)(a3)
	srli a5, a0, 1

	lui a4, %hi(.u3333333333333333)
	ld a4, %lo(.u3333333333333333)(a4)

	and a5, a3
	sub a0, a5

	srli a5, a0, 2
	and a5, a4
	and a0, a4
	add a5, a0

	srli a0, a5, 4
	add a0, a5
	lui a5, %hi(.uF0F0F0F0F0F0F0F)
	ld a5, %lo(.uF0F0F0F0F0F0F0F)(a5)
	and a0, a5

	srli a5, a0, 32
	addw a5, a0

	srliw a0, a5, 16
	addw a0, a5

	srliw a5, a0, 8
	addw a0, a5, a0

	andi a0, 0x7F
	ret

.u5555555555555555:
	.dword 0x5555555555555555

.u3333333333333333:
	.dword 0x3333333333333333

.uF0F0F0F0F0F0F0F:
	.dword 0xF0F0F0F0F0F0F0F
