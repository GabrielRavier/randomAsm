.include "standard.inc"

	.text

START_FUNC trap
	brk #1000
END_FUNC trap
