ceilf:
	local.get 0
	f32.ceil
	end_function





fabsf:
	local.get 0
	f32.abs
	end_function





fabsl:
	local.get 0
	local.get 2

	i64.const 0x7FFFFFFFFFFFFFFF
	i64.and
	i64.store 0

	local.get 0
	local.get 1
	i64.store 0
	end_function





floorf:
	local.get 0
	f32.floor
	end_function





sqrtf:
	local.get 0
	f32.sqrt
	end_function
