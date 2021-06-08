	.text

__rold:
	local.get 0
	local.get 1
	i32.rotl
	end_function





__rord:
	local.get 0
	local.get 1
	i32.rotr
	end_function





__rolq:
	local.get 0
	local.get 1
	i32.const 0x3F
	i32.and
	i64.extend_i32_u
	i64.rotl
	end_function





__rorq:
	local.get 0
	local.get 1
	i32.const 0x3F
	i32.and
	i64.extend_i32_u
	i64.rotr
	end_function
