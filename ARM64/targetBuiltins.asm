get_fpcr:
	mrs x0, fpcr
	ret





set_fpcr:
	msr fpcr, x0
	ret





get_fpsr:
	mrs x0, fpsr
	ret





set_fpsr:
	msr fpsr, x0
	ret
