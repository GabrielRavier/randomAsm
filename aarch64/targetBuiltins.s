.include "standard.inc"

	.text

START_FUNC get_fpcr
	mrs x0, fpcr
	ret
END_FUNC get_fpcr





START_FUNC set_fpcr
	msr fpcr, x0
	ret
END_FUNC set_fpcr





START_FUNC get_fpsr
	mrs x0, fpsr
	ret
END_FUNC get_fpsr





START_FUNC set_fpsr
	msr fpsr, x0
	ret
END_FUNC set_fpsr
