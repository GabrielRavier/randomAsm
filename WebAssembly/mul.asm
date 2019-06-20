__mulddi3:
	local.get 0
	local.get 2

	i64.const 0xFFFFFFFF
	i64.and

	local.tee 3
	local.get 1

	i64.const 0xFFFFFFFF
	i64.and

	local.tee 4
	i64.mul

	local.tee 5
	i64.const 32
	i64.shr_u

	local.get 3
	local.get 1
	i64.const 32
	i64.shr_u

	local.tee 1
	i64.mul
	i64.add

	local.tee 3
	i64.const 32
	i64.shr_u

	local.get 2
	i64.const 32
	i64.shr_u

	local.tee 2
	local.get 1
	i64.mul
	i64.add

	local.get 3
	i64.const 0xFFFFFFFF
	i64.and

	local.get 2
	local.get 4
	i64.mul
	i64.add

	local.tee 2
	i64.const 32
	i64.shr_u
	i64.add
	i64.store 8

	local.get 0
	local.get 2
	i64.const 32
	i64.shl

	local.get 5
	i64.const 0xFFFFFFFF
	i64.and
	i64.or
	i64.store 0
	end_function





__multi3:
	global.get __stack_pointer
	i32.const 16
	i32.sub

	local.tee 5
	global.set __stack_pointer

	local.get 5
	local.get 1
	local.get 3
	call __mulddi3

	local.get 5
	i32.const 8
	i32.add
	i64.load 0
	local.set 6

	local.get 0
	local.get 5
	i64.load 0
	i64.store 0

	local.get 0
	local.get 6
	local.get 4
	local.get 1
	i64.mul

	local.get 2
	local.get 3
	i64.mul
	i64.add
	i64.add

	i64.store 8
	local.get 5
	i32.const 16
	i32.add
	global.set __stack_pointer
	end_function
