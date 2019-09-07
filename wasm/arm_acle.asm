.include "standard.inc"

	.text

START_FUNC __ror
	local.get 0
	local.get 1
	i32.rotr
	end_function
END_FUNC __ror




START_FUNC __rorll
	block
	local.get 1
	i32.const 0x3F
	i32.and

	local.tee 1
	i32.eqz
	br_if 0

	local.get 0
	local.get 1
	i64.extend_i32_u
	i64.rotr
	local.set 0
	end_block

	local.get 0
	end_function
END_FUNC __rorll





START_FUNC __rev16
	local.get 0
	i32.const 0x18
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
	i32.const 0x18
	i32.shr_u
	i32.or
	i32.or

	i32.const 0x10
	i32.rotl
	end_function
END_FUNC __rev16





START_FUNC __rev16ll
	local.get 0
	i64.const 0x20
	i64.shr_u
	i32.wrap_i64

	local.tee 1
	i32.const 0x18
	i32.shl

	local.get 1
	i32.const 8
	i32.shl

	i32.const 0xFF0000
	i32.and
	i32.or

	local.get 0
	i64.const 0x28
	i64.shr_u
	i32.wrap_i64

	i32.const 0xFF00
	i32.and

	local.get 0
	i64.const 0x38
	i64.shr_u
	i32.wrap_i64
	i32.or
	i32.or

	i32.const 0x10
	i32.rotl
	i64.extend_i32_u

	i64.const 0x20
	i64.shl

	local.get 0
	i32.wrap_i64

	local.tee 1
	i32.const 0x18
	i32.shl

	local.get 1
	i32.const 8
	i32.shl

	i32.const 0xFF0000
	i32.and
	i32.or

	local.get 1
	i32.const 8
	i32.shr_u

	i32.const 0xFF00
	i32.and

	local.get 1
	i32.const 0x18
	i32.shr_u
	i32.or
	i32.or

	i32.const 0x10
	i32.rotl
	i64.extend_i32_u
	i64.or
	end_function
END_FUNC __rev16ll
