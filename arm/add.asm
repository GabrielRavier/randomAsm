.include "standard.inc"

	.text

START_FUNC add8
	add r0, r1
	uxtb r0
	bx lr
END_FUNC add8





START_FUNC add8s
	add r0, r1
	sxtb r0
	bx lr
END_FUNC add8s





START_FUNC add16
	add r0, r1
	uxth r0
	bx lr
END_FUNC add16





START_FUNC add16s
	add r0, r1
	sxth r0
	bx lr
END_FUNC add16s





START_FUNC add32
START_FUNC add32s
	add r0, r1
	bx lr
END_FUNC add32
END_FUNC add32s





START_FUNC add64
START_FUNC add64s
	adds r0, r2
	adc r1, r3
	bx lr
END_FUNC add64
END_FUNC add64s
