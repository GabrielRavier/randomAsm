	.text
	
__blcfill_u32:
	local.get 0
	i32.const 1
	i32.add
	
	local.get 0
	i32.and
	end_function
	
	
	
	
	
__blci_u32:
	i32.const -2
	local.get 0
	i32.sub
	
	local.get 0
	i32.or
	end_function
	
	
	
	
	
__blcic_u32:
	local.get 0
	i32.const 1
	i32.add
	
	local.get 0
	i32.const -1
	i32.xor
	i32.and
	end_function
	
	
	
	
	
__blcmsk_u32:
	local.get 0
	i32.const 1
	i32.add
	
	local.get 0
	i32.xor
	end_function
	
	
	
	
	
__blcs_u32:
	local.get 0
	i32.const 1
	i32.add
	
	local.get 0
	i32.or
	end_function
	
	
	
	
	
__blsfill_u32:
	local.get 0
	i32.const -1
	i32.add
	
	local.get 0
	i32.or
	end_function
	
	
	
	
	
__blsic_u32:
	local.get 0
	i32.const -1
	i32.add
	
	local.get 0
	i32.const -1
	i32.xor
	i32.or
	end_function
	
	
	
	
	
__t1mskc_u32:
	local.get 0
	i32.const 1
	i32.add
	
	local.get 0
	i32.const -1
	i32.xor
	i32.or
	end_function
	
	
	
	
	
__tzmsk_u32:
	local.get 0
	i32.const -1
	i32.add
	
	local.get 0
	i32.const -1
	i32.xor
	i32.and
	end_function
	
	
	
	
	
__blcfill_u64:
	local.get 0
	i64.const 1
	i64.add
	
	local.get 0
	i64.and
	end_function
	
	
	
	
	
__blci_u64:
	i64.const -2
	local.get 0
	i64.sub
	
	local.get 0
	i64.or
	end_function
	
	
	
	
	
__blcic_u64:
	local.get 0
	i64.const 1
	i64.add
	
	local.get 0
	i64.const -1
	i64.xor
	i64.and
	end_function
	
	
	
	
	
__blcmsk_u64:
	local.get 0
	i64.const 1
	i64.add
	
	local.get 0
	i64.xor
	end_function
	
	
	
	
	
__blcs_u64:
	local.get 0
	i64.const 1
	i64.add
	
	local.get 0
	i64.or
	end_function
	
	
	
	
	
__blsfill_u64:
	local.get 0
	i64.const -1
	i64.add
	
	local.get 0
	i64.or
	end_function
	
	
	
	
	
__blsic_u64:
	local.get 0
	i64.const -1
	i64.add
	
	local.get 0
	i64.const -1
	i64.xor
	i64.or
	end_function
	
	
	
	
	
__t1mskc_u64:
	local.get 0
	i64.const 1
	i64.add
	
	local.get 0
	i64.const -1
	i64.xor
	i64.or
	end_function
	
	
	
	
	
__tzmsk_u64:
	local.get 0
	i64.const -1
	i64.add
	
	local.get 0
	i64.const -1
	i64.xor
	i64.and
	end_function