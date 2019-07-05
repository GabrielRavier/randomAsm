	.text

_mulx_u64:
	mulhu a5, a0, a1
	mul a0, a1
	sd a5, 0(a2)
	ret





_mulx_u32:
	slli a0, 32
	slli a1, 32
	srli a1, 32
	srli a0, 32
	mul a0, a1

	srli a5, a0, 32
	sw a5, 0(a2)

	sext.w a0
	ret
