.include "standard.inc"

	.text

_mulx_u64:
	push {r4, r5, r6, r8, r9, lr}

	multizero r4, r5, r9
	mov r8, #0x40

	sub sp, #0x30

	str r2, [sp, #40]
	str r3, [sp, #44]
	str r0, [sp, #24]
	str r1, [sp, #28]

	add r2, sp, #0x20
	mov r0, sp
	add r1, sp, #0x10

	ldr r6, [sp, #72]
	str r4, [sp, #16]
	str r5, [sp, #20]
	str r4, [sp, #32]
	str r5, [sp, #36]

	bl uint128_t_operator_multiply

	add r2, sp, #0x20
	mov r1, sp
	add r0, sp, #0x10

	str r4, [sp, #32]
	str r5, [sp, #36]
	str r8, [sp, #40]
	str r9, [sp, #44]

	bl uint128_t_operator_shiftRight

	add r0, sp, #0x10
	bl uint128_t_operator_cast_uint64_t
	stm r6, {r0-r1}

	mov r0, sp
	bl uint128_t_operator_cast_uint64_t
	add sp, #0x30
	pop {r4, r5, r6, r8, r9, pc}





_mulx_u32:
	umull r0, r1, r0, r1
	str r1, [r2]
	bx lr
