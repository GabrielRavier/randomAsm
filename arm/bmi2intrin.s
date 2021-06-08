.include "standard.inc"

	.text

_mulx_u64:
	push {r4, r5, r6, lr}
	multiZero r4, r5
	sub sp, #0x30

	strd r2, [sp, #0x28]
	add r2, sp, #0x20
	strd r0, [sp, #0x18]
	mov r0, sp
	add r1, sp, #0x10

	ldr r6, [sp, #0x40]
	strd r4, [sp, #0x10]
	strd r4, [sp, #0x20]
	bl uint128_t_operator_multiply

	add r2, sp, #0x20
	mov r1, sp
	add r0, sp, #0x10

	strd r4, [sp, #0x20]
	mov r4, #0x40
	mov r5, #0
	strd r4, [sp, #0x28]
	bl uint128_t_operator_shiftRight

	add r0, sp, #0x10
	bl uint128_t_operator_cast_uint64_t
	strd r0, [r6]

	mov r0, sp
	bl uint128_t_operator_cast_uint64_t
	add sp, #0x30
	pop {r4, r5, r6, pc}





_mulx_u32:
	umull r0, r1, r0, r1
	str r1, [r2]
	bx lr
