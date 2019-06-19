sadd_overflow:
saddl_overflow:
	local.get 2
	local.get 0
	local.get 1
	i32.add

	local.tee 3
	i32.store 0

	local.get 0
	i32.const -1
	i32.gt_s

	local.tee 0
	local.get 1
	i32.const -1
	i32.gt_s
	i32.eq

	local.get 0
	local.get 3
	i32.const -1
	i32.gt_s
	i32.ne
	i32.and
	end_function





saddll_overflow:
	local.get 2
	local.get 0
	local.get 1
	i64.add

	local.tee 3
	i64.store 0

	local.get 0
	i64.const -1
	i64.gt_s

	local.tee 2
	local.get 1

	i64.const -1
	i64.gt_s
	i32.eq

	local.get 2
	local.get 3

	i64.const -1
	i64.gt_s

	i32.ne
	i32.and
	end_function





uadd_overflow:
uaddl_overflow:
	local.get 2
	local.get 0
	local.get 1
	i32.add

	local.tee 1
	i32.store 0

	local.get 1
	local.get 0
	i32.lt_u
	end_function





uaddll_overflow:
	local.get 2
	local.get 0
	local.get 1
	i64.add

	local.tee 1
	i64.store 0

	local.get 1
	local.get 0
	i64.lt_u
	end_function
