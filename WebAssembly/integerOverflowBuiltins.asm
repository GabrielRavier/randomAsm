sadd_overflow:
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
