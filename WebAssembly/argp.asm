__argp_usage:
	local.get 0
	i32.const 0
	i32.load stderr
	i32.const 0x106
	call __argp_state_help
	end_function





__option_is_short:
	i32.const 0
	local.set 1

	block
	local.get 0
	i32.load8_u 12
	i32.const 8
	i32.and
	br_if 0	; To .ret1

	local.get 0
	i32.load 4

	local.tee 0
	i32.const -1
	i32.add
	i32.const 0xFE
	i32.gt_u
	br_if 0	; To .ret1

	local.get 0
	i32.call isprint
	i32.const 0
	i32.ne
	local.set 1
	end_block	; .ret1:

	local.get 1
	end_function





__option_is_end:
	i32.const 0
	local.set 1

	block
	local.get 0
	i32.load 4
	br_if 0	; To .ret1

	local.get 0
	i32.load 0
	br_if 0	; To .ret1

	local.get 0
	i32.load 16
	br_if 0	; To .ret1

	local.get 0
	i32.load 20
	i32.eqz
	local.set 1
	end_block	; .ret1:

	local.get 1
	end_function
