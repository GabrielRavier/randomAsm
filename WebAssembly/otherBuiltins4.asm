abs:
labs:
	local.get 0
	local.get 0

	i32.const 31
	i32.shr_s

	local.tee 1
	i32.add

	local.get 1
	i32.xor
	end_function





ceil:
	local.get 0
	f64.ceil
	end_function





fabs:
	local.get 0
	f64.abs
	end_function





floor:
	local.get 0
	f64.floor
	end_function
