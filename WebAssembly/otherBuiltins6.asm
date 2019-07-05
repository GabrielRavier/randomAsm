	.text

clz:
clzl:
	local.get 0
	i32.clz
	end_function





ctz:
ctzl:
	local.get 0
	i32.ctz
	end_function





clrsb:
clrsbl:
	local.get 0
	i32.const 31
	i32.shr_s

	local.get 0
	i32.xor
	i32.clz

	i32.const -1
	i32.add
	end_function





popcount:
popcountl:
	local.get 0
	i32.popcnt
	end_function





parity:
parityl:
	local.get 0
	i32.popcnt

	i32.const 1
	i32.and
	end_function





clzll:
	local.get 0
	i64.clz
	i32.wrap_i64
	end_function





ctzll:
	local.get 0
	i64.ctz
	i32.wrap_i64
	end_function





clrsbll:
	local.get 0
	i64.const 63
	i64.shr_s

	local.get 0
	i64.xor
	i64.clz
	i32.wrap_i64

	i32.const -1
	i32.add
	end_function





popcountll:
	local.get 0
	i64.popcnt
	i32.wrap_i64
	end_function





parityll:
	local.get 0
	i64.popcnt
	i32.wrap_i64

	i32.const 1
	i32.and
	end_function
