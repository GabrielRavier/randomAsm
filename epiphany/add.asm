.include "standard.inc"

	.text

START_FUNC add8
	add r0, r1, r0
	lsl r0, #24
	lsr r0, #24
	rts
END_FUNC add8





START_FUNC add8s
	add r0, r1, r0
	lsl r0, #24
	asr r0, #24
	rts
END_FUNC add8s





START_FUNC add16
	add r0, r1, r0
	movt r0, 0
	rts
END_FUNC add16





START_FUNC add16s
	add r0, r1, r0
	lsl r0, #16
	asr r0, #16
	rts
END_FUNC add16s





START_FUNC add32
START_FUNC add32s
	add r0, r1
	rts
END_FUNC add32
END_FUNC add32s





START_FUNC add64
START_FUNC add64s
	add r0, r2
	mov ip, #0
	mov r2, #1
	movgteu ip, r2
	add r1, r3
	add r1, ip, r1
	rts
END_FUNC add64
END_FUNC add64s
