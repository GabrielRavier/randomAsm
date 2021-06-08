	.text

__andn_u32:
	local.get 0
	i32.const -1
	i32.xor

	local.get 1
	i32.and
	end_function





__blsi_u32:
	i32.const 0
	local.get 0
	i32.sub

	local.get 0
	i32.and
	end_function





__blsmsk_u32:
	local.get 0
	i32.const -1
	i32.add

	local.get 0
	i32.xor
	end_function





__blsr_u32:
	local.get 0
	i32.const -1
	i32.add

	local.get 0
	i32.and
	end_function





__andn_u64:
	local.get 0
	i64.const -1
	i64.xor

	local.get 1
	i64.and
	end_function





__blsi_u64:
	i64.const 0
	local.get 0
	i64.sub

	local.get 0
	i64.and
	end_function





__blsmsk_u64:
	local.get 0
	i64.const -1
	i64.add

	local.get 0
	i64.xor
	end_function





__blsr_u64:
	local.get 0
	i64.const -1
	i64.add

	local.get 0
	i64.and
	end_function
