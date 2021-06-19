.include "standard.inc"

	.text

	make_empty_func complex_flt
	make_empty_func complex_dbl
	make_empty_func complex_ldbl

START_FUNC trap
	brk 1000
END_FUNC trap
