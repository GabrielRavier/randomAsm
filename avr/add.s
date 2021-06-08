.include "standard.inc"

	.text

START_FUNC add8
START_FUNC add8s
	add r24, r22
	ret
END_FUNC add8
END_FUNC add8s





START_FUNC add16
START_FUNC add16s
	add16 r24, r22
	ret
END_FUNC add16
END_FUNC add16s





START_FUNC add32
START_FUNC add32s
	add32 r24, r22
	ret
END_FUNC add32
END_FUNC add32s





START_FUNC add64
START_FUNC add64s
	multiPush r10, r11, r12, r13, r14, r15, r16, r17
	call __adddi3
	multiPop r17, r16, r15, r14, r13, r12, r11, r10
	ret
END_FUNC add64
END_FUNC add64s





START_FUNC __adddi3
	add64 r18, r10
	ret
END_FUNC __adddi3





START_FUNC __adddi3_s8
	clr __tmp_reg__
	sbrc r26, 7
	com __tmp_reg__

	add r18, r26

	.irp reg, r19, r20, r21, r22, r23, r24, r25

		adc \reg, __tmp_reg__

	.endr

	ret
END_FUNC __adddi3_s8
