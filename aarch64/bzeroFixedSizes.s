.include "standard.inc"

	.text

START_FUNC bzero1
	strb wzr, [x0]
	ret
END_FUNC bzero1





START_FUNC bzero2
	strh wzr, [x0]
	ret
END_FUNC bzero2





START_FUNC bzero4
	str wzr, [x0]
	ret
END_FUNC bzero4





START_FUNC bzero8
	str xzr, [x0]
	ret
END_FUNC





START_FUNC bzero16
	stp xzr, xzr, [x0]
	ret
END_FUNC





START_FUNC bzero28
	stp xzr, xzr, [x0]
	str xzr, [x0, 16]
	str xzr, [x0, 24]
	ret
END_FUNC





START_FUNC bzero32
	stp xzr, xzr, [x0]
	stp xzr, xzr, [x0, 16]
	ret
END_FUNC





START_FUNC bzero64
	movi v0.4s, 0
	stp q0, q0, [x0]
	stp q0, q0, [x0, 32]
	ret
END_FUNC





START_FUNC bzero128
	movi v0.4s, 0
	stp q0, q0, [x0]
	stp q0, q0, [x0, 32]
	stp q0, q0, [x0, 64]
	stp q0, q0, [x0, 96]
	ret
END_FUNC





START_FUNC bzero256
	movi v0.4s, 0
	stp q0, q0, [x0]
	stp q0, q0, [x0, 32]
	stp q0, q0, [x0, 64]
	stp q0, q0, [x0, 96]
	stp q0, q0, [x0, 128]
	stp q0, q0, [x0, 160]
	stp q0, q0, [x0, 192]
	stp q0, q0, [x0, 224]
	ret
END_FUNC
