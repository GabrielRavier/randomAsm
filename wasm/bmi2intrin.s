	.text

_mulx_u64:
	global.get __stack_pointer
	i32.const 16
	i32.sub

	local.tee 3
	global.set __stack_pointer

	local.get 3
	local.get 1
	i64.const 0
	local.get 0
	i64.const 0
	call __multi3

	local.get 2
	local.get 3
	i32.const 8
	i32.add

	i64.load 0
	i64.store 0

	local.get 3
	i64.load 0

	local.set 1
	i32.const 16
	i32.add
	global.set __stack_pointer
	local.get 1
	end_function





_mulx_u32:
	local.get 2
	local.get 1
	i64.extend_i32_u

	local.get 0
	i64.extend_i32_u
	i64.mul

	local.tee 3
	i64.const 32

	i64.shr_u
	i64.store32 0

	local.get 3
	i32.wrap_i64
	end_function
