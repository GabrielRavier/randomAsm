N_MAGIC:
	local.get 0
	i32.load16_u 0
	end_function





N_MACHTYPE:
	local.get 0
	i32.load8_u 2
	end_function





N_FLAGS:
	local.get 0
	i32.load8_u 3
	end_function





N_SET_INFO:
	local.get 0
	local.get 2

	i32.const 16
	i32.shl

	local.get 1
	i32.or
	local.get 3
	i32.const 24
	i32.shl
	i32.or
	i32.store 0
	end_function





N_BADMAG:
	block
	local.get 0
	i32.load16_u 0
	i32.const -204
	i32.add

	local.tee 0
	i32.const 0xFFFF
	i32.and
	i32.const 0x3F
	i32.gt_u
	br_if 0 # 0: down to return1

	i64.const 0x67FFFFFFFFFFFFFE
	local.get 0
	i64.extend_i32_u
	i64.const 0xFFFF
	i64.and
	i64.shr_u
	i32.wrap_i64
	i32.const 1
	i32.and
	return
	end_block # return1:

	i32.const 1
	end_function
