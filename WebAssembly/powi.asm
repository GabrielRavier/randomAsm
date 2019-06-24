powi:
__powidf2:
	local.get 0
	f64.const 1p0

	local.get 1
	i32.const 1
	i32.and
	f64.select
	local.set 2

	block
	local.get 1
	i32.const 1
	i32.add
	i32.const 3
	i32.lt_u
	br_if 0	; to .endLoop

	local.get 1
	local.set 3

	loop	; .loop:
	local.get 2
	local.get 0
	local.get 0
	f64.mul

	local.tee 0
	f64.mul

	local.get 2
	local.get 3
	i32.const 2
	i32.div_s

	local.tee 3
	i32.const 1

	i32.and
	f64.select
	local.set 2

	local.get 3
	i32.const 1
	i32.add
	i32.const 2
	i32.gt_u
	br_if 0	; up to .loop
	end_loop
	end_block ; .endLoop:

	f64.const 1p0
	local.get 2
	f64.div
	local.get 2

	local.get 1
	i32.const 0
	i32.lt_s

	f64.select
	end_function





powif:
__powisf2:
	local.get 0
	f32.const 1p0
	local.get 1
	i32.const 1
	i32.and
	f32.select
	local.set 2

	block
	local.get 1
	i32.const 1
	i32.add
	i32.const 3
	i32.lt_u
	br_if 0	; to .endLoop

	local.get 1
	local.set 3

	loop	; .loop:
	local.get 2
	local.get 0
	local.get 0
	f32.mul

	local.tee 0
	f32.mul

	local.get 2
	local.get 3
	i32.const 2
	i32.div_s

	local.tee 3
	i32.const 1
	i32.and
	f32.select
	local.set 2

	local.get 3
	i32.const 1
	i32.add
	i32.const 2
	i32.gt_u
	br_if 0	; to .loop
	end_loop
	end_block	; .endLoop:

	f32.const 1p0
	local.get 2
	f32.div

	local.get 2
	local.get 1
	i32.const 0
	i32.lt_s
	f32.select
	end_function
