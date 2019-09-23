.include "standard.inc"

	.text

START_FUNC add8
	and w1, 0xFF
	add w0, w1, w0, uxtb
	ret
END_FUNC add8





START_FUNC add8s
	sxtb w1
	add w0, w1, w0, sxtb
	ret
END_FUNC add8s





START_FUNC add16
	and w1, 0xFFFF
	add w0, w1, w0, uxth
	ret
END_FUNC add16





START_FUNC add16s
	sxth w1
	add w0, w1, w0, sxth
	ret
END_FUNC add16s





START_FUNC add32
START_FUNC add32s
	add w0, w1
	ret
END_FUNC add32
END_FUNC add32s





START_FUNC add64
START_FUNC add64s
	add x0, x1
	ret
END_FUNC add64
END_FUNC add64s





START_FUNC add128
START_FUNC add128s
	adds x0, x2
	adc x1, x3
	ret
END_FUNC add128
END_FUNC add128s
