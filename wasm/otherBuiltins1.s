	.text

bzero:
	local.get 0
	i32.const 0
	local.get 1
	i32.call memset
	drop
	end_function





ffsll:
	i64.const 0
	local.get 0
	i64.ctz

	i64.const 1
	i64.add

	local.get 0
	i64.eqz
	i64.select
	i32.wrap_i64
	end_function





ffsl:
ffs:
	local.get 0
	i32.ctz

	i32.const 1
	i32.add

	i32.const 0
	local.get 0
	i32.select
	end_function





mempcpy:
	local.get 0
	local.get 1
	local.get 2
	i32.call memcpy
	local.get 2
	i32.add
	end_function





signbit:
	local.get 0
	i64.reinterpret_f64
	i64.const 63
	i64.shr_u
	i32.wrap_i64
	end_function





signbitf:
	local.get 0
	i32.reinterpret_f32
	i32.const 31
	i32.shr_u
	end_function





signbitl:
	local.get 1
	i64.const 63
	i64.shr_u
	i32.wrap_i64
	end_function
