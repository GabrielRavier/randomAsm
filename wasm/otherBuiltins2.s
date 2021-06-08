	.text

cimagf:
	local.get 0
	f32.load 4
	end_function





cimagl:
	local.get 0
	local.get 1

	i32.const 24
	i32.add

	i64.load 0
	i64.store 8

	local.get 0
	local.get 1

	i64.load 16
	i64.store 0
	end_function





cimag:
	local.get 0
	f64.load 8
	end_function





conjf:
	local.get 0
	local.get 1

	i32.load 0
	i32.store 0

	local.get 0
	local.get 1

	f32.load 4
	f32.neg
	f32.store 4
	end_function





conjl:
	local.get 0
	local.get 1

	i64.load 16
	i64.store 16

	local.get 0
	local.get 1

	i64.load 0
	i64.store 0

	local.get 0
	local.get 1

	i32.const 8
	i32.add

	i64.load 0
	i64.store 8

	local.get 0
	i32.const 24
	i32.add

	i64.load 0
	i64.const 0x8000000000000000
	i64.xor
	i64.sotre 0
	end_function





conj:
	local.get 0
	local.get 1

	i64.load 0
	i64.store 0

	local.get 0
	local.get 1

	f64.load 8
	f64.neg
	f64.store 8
	end_function





copysignf:
	local.get 0
	local.get 1
	f32.copysign
	end_function





copysignl:
	local.get 0
	local.get 1
	i64.store 0

	local.get 0
	local.get 2
	i64.const 0x7FFFFFFFFFFFFFFF
	i64.and

	local.get 4
	i64.const 0x8000000000000000
	i64.and
	i64.or
	i64.store 8
	end_function





copysign:
	local.get 0
	local.get 1
	f64.copysign
	end_function





crealf:
	local.get 0
	f32.load 0
	end_function





creall:
	local.get 0
	local.get 1

	i32.const 8
	i32.add

	i64.load 0
	i64.store 8

	local.get 0
	local.get 1

	i64.load 0
	i64.store 0
	end_function





creal:
	local.get 0
	f64.load 0
	end_function





fmaxf:
	local.get 0
	local.get 1
	f32.max
	end_function





fmax:
	local.get 0
	local.get 1
	f64.max
	end_function





fminf:
	local.get 0
	local.get 1
	f32.min
	end_function





fmin:
	local.get 0
	local.get 1
	f64.min
	end_function





llabs:
	local.get 0
	local.get 0

	i64.const 63
	i64.shr_s

	local.tee 1
	i64.add

	local.get 1
	i64.xor
	end_function





nearbyintf:
rintf:
	local.get 0
	f32.nearest
	end_function





nearbyint:
rint:
	local.get 0
	f64.nearest
	end_function





truncf:
	local.get 0
	f32.trunc
	end_function





trunc:
	local.get 0
	f64.trunc
	end_function
