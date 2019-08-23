	.text

_mm_malloc:
	global.get __stack_pointer
	i32.const 0x10
	i32.sub
	local.tee 2
