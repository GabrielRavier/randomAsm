	.text

__popcountsi2:
	ldr r3, .u55555555
	ldr r2, .u33333333
	and r3, r0, lsr #1
	sub r0, r3

	and r3, r2, r0, lsr #2
	and r0, r2
	add r3, r0

	ldr r0, .uF0F0F0F
	add r3, lsr #4
	and r0, r3

	add r0, lsr #16
	add r0, lsr #8
	and r0, #0x3F
	bx lr

.u55555555:
	.word 0x555555555

.u33333333:
	.word 0x33333333

.uF0F0F0F:
	.word 0xF0F0F0F





__popcountdi2:
	lsr r3, r0, #1
	ldr r2, .u55555555
	orr r3, r1, lsl #31
	and r3, r2
	subs r0, r3
	and r2, r1, lsr #1
	sbc r1, r2

	lsr r3, r0, #2
	ldr r2, .u33333333
	orr r3, r1, lsl #30
	and r0, r2
	and r3, r2
	adds r3, r0
	and r0, r2, r1, lsr #2
	and r1, r2
	adc r1, r0, r1

	lsr r2, r3, #4
	orr r2, r1, lsl #28
	adds r3, r2, r3

	ldr r2, .uF0F0F0F
	adc r0, r1
	and r0, r2
	and r3, r2

	add r0, r3
	add r0, lsr #16
	add r0, lsr #8
	and r0, #0x7F
	bx lr

.u55555555:
	.word 0x555555555

.u33333333:
	.word 0x33333333

.uF0F0F0F:
	.word 0xF0F0F0F
