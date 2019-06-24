bswap16:
	local.get 0
	i32.const 24
	i32.shl

	local.get 0
	i32.const 8
	i32.shl
	i32.or

	i32.const 16
	i32.shr_u
	end_function





bswap32:
	local.get 0
	i32.const 24
	i32.shl

	local.get 0
	i32.const 8
	i32.shl
	i32.const 0xFF0000
	i32.and
	i32.or

	local.get 0
	i32.const 8
	i32.shr_u
	i32.const 0xFF00
	i32.and

	local.get 0
	i32.const 24
	i32.shr_u
	i32.or
	i32.or
	end_function





bswap64:
	local.get 0
	i64.const 56
	i64.shl

	local.get 0
	i64.const 40
	i64.shl

	i64.const 0xFF000000000000
	i64.and
	i64.or

	local.get 0
	i64.const 24
	i64.shl

	i64.const 0xFF0000000000
	i64.and

	local.get 0
	i64.const 8
	i64.shl

	i64.const 0xFF00000000
	i64.and
	i64.or
	i64.or

	local.get 0
	i64.const 8
	i64.shr_u

	i64.const 0xFF000000
	i64.and

	local.get 0
	i64.const 24
	i64.shr_u

	i64.const 0xFF0000
	i64.and
	i64.or

	local.get 0
	i64.const 40
	i64.shr_u

	i64.const 0xFF00
	i64.and

	local.get 0
	i64.const 0x38
	i64.shr_u
	i64.or
	i64.or
	i64.or
	end_function
