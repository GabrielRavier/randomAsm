	.text

sync_fetch_and_add_32:
	local.get 0
	local.get 0
	i32.load 0

	local.tee 2
	local.get 1
	i32.add
	i32.store 0
	local.get 2
	end_function





sync_add_and_fetch_32:
	local.get 0
	local.get 0
	i32.load 0

	local.get 1
	i32.add

	local.tee 1
	i32.store 0
	local.get 1
	end_function





sync_bool_compare_and_swap_32:
	local.get 0
	local.get 2
	local.get 0
	i32.load 0

	local.tee 3
	local.get 3
	local.get 1
	i32.eq

	local.tee 1
	i32.select
	i32.store 0

	local.get 1
	end_function





sync_val_compare_and_swap_32:
	local.get 0
	local.get 2
	local.get 0
	i32.load 0

	local.tee 3
	local.get 3
	local.get 1
	i32.eq
	i32.select
	i32.store 0

	local.get 3
	end_function





sync_synchronize:
	end_function





sync_lock_test_and_set:
	local.get 0
	i32.load
	local.set 2

	local.get 0
	local.get 1
	i32.store 0

	local.get 2
	end_function
