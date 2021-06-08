	.text

_mm_malloc:
	global.get __stack_pointer
	i32.const 0x10
	i32.sub
	
	local.tee 2
	global.set __stack_pointer
	block
	block
	
	local.get 1
	i32.const -1
	i32.add
	
	local.tee 3
	i32.gt_u
	br_if 0
	
	block
	block
	local.get 3
	br_table {0, 1, 0}
	end_block
	
	local.get 0
	i32.call malloc
	local.set 1
	br 2
	end_block
	
	i32.const 4
	local.set 1
	end_block
	
	local.get 2
	i32.const 12
	i32.add
	
	local.get 1
	local.get 0
	i32.call posix_memalign
	
	local.set 1
	i32.const 0
	
	local.get 2
	i32.load 12
	
	local.get 1
	i32.select
	local.set 1
	end_block
	
	local.get 2
	i32.const 16
	i32.add
	local.set __stack_pointer
	local.get 1
	end_function
	
	
	
	
	
_mm_free:
	local.get 0
	call free
	end_function