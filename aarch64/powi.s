.include "standard.inc"

	.text

	make_jump_func powi, __powidf2
	make_jump_func powif, __powisf2
	make_jump_func powil, __powitf2
