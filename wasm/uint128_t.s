	.bss

uint128_0:
	.zero 16

	.data

uint128_1:
	.quad 0, 1

	.text

uint128_t_constructor_default:
	local.get 0
	i64.const 0
	i64.store 0

	local.get 0
	i32.const 8
	i32.add

	i64.const 0
	i64.store

	local.get 0
	end_function





uint128_t_constructor:
uint128_t_operator_equal:
	local.get 0
	local.get 1
	i64.load 0
	i64.store 0

	local.get 0
	local.get 1
	i64.load 8
	i64.store 8

	local.get 0
	end_function





uint128_t_constructor_uint128_t_double_ref:
	local.get 0
	local.get 1
	i64.load 0
	i64.store 0

	local.get 0
	local.get 1
	i64.load 8
	i64.store 8

	block
	local.get 0
	local.get 1
	i32.eq
	br_if 0	; to .return

	local.get 1
	i64.const 0
	i64.store 0

	local.get 1
	i32.const 8
	i32.add

	i64.const 0
	i64.store 0
	end_block

; .return:
	local.get 0
	end_function





uint128_t_operator_equal_const_uint128_t_double_ref:
	block
	local.get 0
	local.get 1
	i32.eq
	br_if 0	; to .return

	local.get 0
	local.get 1
	i64.load 0
	i64.store 0

	local.get 0
	local.get 1
	i64.load 8
	i64.store 8

	local.get 1
	i64.const 0
	i64.store 8

	local.get 1
	i64.const 0
	i64.store 0
	end_block

; .return:
	local.get 0
	end_function





uint128_t_operator_cast_bool:
	local.get 0
	i64.load 8

	local.get 0
	i64.load 0
	i64.or

	i64.const 0
	i64.ne
	end_function





uint128_t_operator_cast_uint8_t:
	local.get 0
	i32.load8_u 8
	end_function





uint128_t_operator_cast_uint16_t:
	local.get 0
	i32.load16_u 8
	end_function





uint128_t_operator_cast_uint32_t:
	local.get 0
	i32.load 8
	end_function





uint128_t_operator_cast_uint64_t:
	local.get 0
	i64.load 8
	end_function





uint128_t_operator_and:
	local.get 0
	local.get 2
	i64.load 8

	local.get 1
	i64.load 8
	i64.and
	i64.store 8

	local.get 0
	local.get 2
	i64.load 0

	local.get 1
	i64.load 0
	i64.and
	i64.store 0
	end_function





uint128_t_operator_and_equal:
	global.get __stack_pointer
	i32.const 16
	i32.sub

	local.tee 2
	global.set __stack_pointer

	local.get 2
	local.get 0
	local.get 1
	call uint128_t_operator_and

	local.get 0
	local.get 2
	i32.call uint128_t_operator_equal_const_uint128_t_double_ref
	drop

	local.get 2
	i32.const 16
	i32.add

	global.set __stack_pointer
	local.get 0
	end_function





uint128_t_operator_or:
	local.get 0
	local.get 2
	i64.load 8

	local.get 1
	i64.load 8
	i64.or
	i64.store 8

	local.get 0
	local.get 2
	i64.load 0

	local.get 1
	i64.load 0
	i64.or
	i64.store 0
	end_function





uint128_t_operator_or_equal:
	global.get __stack_pointer
	i32.const 16
	i32.sub

	local.tee 2
	global.set __stack_pointer

	local.get 2
	local.get 0
	local.get 1
	call uint128_t_operator_or

	local.get 0
	local.get 2
	i32.call uint128_t_operator_equal_const_uint128_t_double_ref
	drop

	local.get 2
	i32.const 16
	i32.add

	global.set __stack_pointer
	local.get 0
	end_function





uint128_t_operator_xor:
	local.get 0
	local.get 2
	i64.load 8

	local.get 1
	i64.load 8
	i64.xor
	i64.store 8

	local.get 0
	local.get 2
	i64.load 0

	local.get 1
	i64.load 0
	i64.xor
	i64.store 0
	end_function





uint128_t_operator_xor_equal:
	global.get __stack_pointer
	i32.const 16
	i32.sub

	local.tee 2
	global.set __stack_pointer

	local.get 2
	local.get 0
	local.get 1
	call uint128_t_operator_xor

	local.get 0
	local.get 2
	i32.call uint128_t_operator_equal_const_uint128_t_double_ref
	drop

	local.get 2
	i32.const 16
	i32.add

	global.set __stack_pointer
	local.get 0
	end_function





uint128_t_operator_not:
	local.get 0
	local.get 1
	i64.load 8
	i64.const -1
	i64.xor
	i64.store 8

	local.get 0
	local.get 1
	i64.load 0
	i64.const -1
	i64.xor
	i64.store 0
	end_function





uint128_t_operator_shiftLeft:
	block
	block
	local.get 2
	i64.load 8

	local.tee 3
	i64.const 0x7F

	i64.gt_u
	br_if 0	; to .checkEq2

	local.get 2
	i64.load 0

	i64.eqz
	br_if 1	; to .checks
	end_block

	local.get 0
	i32.const uint128_0
	i32.call uint128_t_constructor
	drop
	return
	end_block

; .checks:
	block
	block
	local.get 3
	i64.eqz
	br_if 0	; to .doCnst

	local.get 3
	i64.const 0x40
	i64.ne
; 	br_if 1	; to .check3F

	local.get 0
	i64.const 0
	i64.store 8

	local.get 0
	local.get 1
	i64.load 8
	i64.store 0
	return
	end_block

; .doCnst:
	local.get 0
	local.get 1
	i32.call uint128_t_constructor
	drop
	return
	end_block

; .check3F:
	block
	local.get 3
	i64.const 0x3F
	i64.gt_u
	br_if 0	; to .check40

	local.get 0
	local.get 1
	i64.load 8

	local.tee 4
	local.get 3
	i64.shl
	i64.store 8

	local.get 0
	local.get 4
	i64.const 0x40

	local.get 3
	i64.sub
	i64.shr_u

	local.get 1
	i64.load 0

	local.get 3
	i64.shl
	i64.add
	i64.store 0
	return
	end_block

; .check40:
	block
	local.get 3
	i64.const 0x40
	i64.eq
	br_if 0	; to .ret0

	local.get 0
	i64.const 0
	i64.store 8

	local.get 0
	local.get 1
	i64.load 8

	local.get 3
	i64.const -0x40
	i64.add
	i64.shl
	i64.store 0
	return
	end_block

; .ret0:
	local.get 0
	i32.const uint128_0
	i32.call uint128_t_constructor
	drop
	end_function





uint128_t_operator_shiftLeft_equal:
	global.get __stack_pointer
	i32.const 16
	i32.sub

	local.tee 2
	global.set __stack_pointer

	local.get 2
	local.get 0
	local.get 1
	call uint128_t_operator_shiftLeft

	local.get 0
	local.get 2
	i32.call uint128_t_operator_equal_const_uint128_t_double_ref
	drop

	local.get 2
	i32.const 16
	i32.add

	global.set __stack_pointer
	local.get 0
	end_function





uint128_t_operator_shiftRight:
	block
	block
	local.get 2
	i64.load 8

	local.tee 3
	i64.const 0x7F

	i64.gt_u
	br_if 0	; to .checkEq2

	local.get 2
	i64.load 0

	i64.eqz
	br_if 1	; to .checks
	end_block

	local.get 0
	i32.const uint128_0
	i32.call uint128_t_constructor
	drop
	return
	end_block

; .checks:
	block
	block
	local.get 3
	i64.eqz
	br_if 0	; to .doCnst

	local.get 3
	i64.const 0x40
	i64.ne
; 	br_if 1	; to .check3F

	local.get 0
	i64.const 0
	i64.store 0

	local.get 0
	local.get 1
	i64.load 0
	i64.store 8
	return
	end_block

; .doCnst:
	local.get 0
	local.get 1
	i32.call uint128_t_constructor
	drop
	return
	end_block

; .check3F:
	block
	local.get 3
	i64.const 0x3F
	i64.gt_u
	br_if 0	; to .check40

	local.get 0
	local.get 1
	i64.load 0

	local.tee 4
	local.get 3
	i64.shr_u
	i64.store 0

	local.get 0
	local.get 1
	i64.load 8

	local.get 3
	i64.shr_u

	local.get 4
	i64.const 0x40

	local.get 3
	i64.sub
	i64.shl
	i64.add
	i64.store 8
	return
	end_block

; .check40:
	block
	local.get 3
	i64.const 0x40
	i64.eq
	br_if 0	; to .ret0

	local.get 0
	i64.const 0
	i64.store 0

	local.get 0
	local.get 1
	i64.load 0

	local.get 3
	i64.const -0x40
	i64.add
	i64.shr_u
	i64.store 8
	return
	end_block

; .ret0:
	local.get 0
	i32.const uint128_0
	i32.call uint128_t_constructor
	drop
	end_function





uint128_t_operator_shiftRight_equal:
	global.get __stack_pointer
	i32.const 16
	i32.sub

	local.tee 2
	global.set __stack_pointer

	local.get 2
	local.get 0
	local.get 1
	call uint128_t_operator_shiftRight

	local.get 0
	local.get 2
	i32.call uint128_t_operator_equal_const_uint128_t_double_ref
	drop

	local.get 2
	i32.const 16
	i32.add

	global.set __stack_pointer
	local.get 0
	end_function





uint128_t_operator_exclamation_mark:
	local.get 0
	i32.call uint128_t_operator_cast_bool
	i32.const 1
	i32.xor
	end_function





uint128_t_operator_and_and:
	i32.const 0
	local.set 2

	block
	local.get 0
	i32.call uint128_t_operator_cast_bool
	i32.eqz
	br_if 0	; to .return

	local.get 1
	i32.call uint128_t_operator_cast_bool
	local.set 2
	end_block

; .return:
	local.get 2
	end_function





uint128_t_operator_or_or:
	i32.const 1
	local.set 2

	block
	local.get 0
	i32.call uint128_t_operator_cast_bool
	br_if 0	; to .return

	local.get 1
	i32.call uint128_t_operator_cast_bool
	local.set 2
	end_block

; .return:
	local.get 2
	end_function





uint128_t_operator_equal_equal:
	i32.const 0
	local.set 2

	block
	local.get 0
	i64.load 0

	local.get 1
	i64.ne
	br_if 0	; to .return

	local.get 0
	i64.load 8

	local.get 1
	i64.load 8
	i64.eq
	local.set 2
	end_block

; .return:
	local.get 2
	end_function





uint128_t_operator_not_equal:
	local.get 0
	local.get 1
	i32.call uint128_t_operator_equal_equal
	i32.const 1
	i32.xor
	end_function





uint128_t_operator_above:
	block
	local.get 0
	i64.load 0
	local.tee 2

	local.get 1
	i64.load 0
	local.tee 3
	i64.ne
	br_if 0	; to .checkGt

	local.get 0
	i64.load 8
	local.get 1
	i64.load 8
	i64.gt_u
	return
	end_block

; .checkGt:
	local.get 2
	local.get 3
	i64.gt_u
	end_function





uint128_t_operator_below:
	i32.const 0
	local.set 2

	block
	local.get 0
	local.get 1
	i32.call uint128_t_operator_equal_equal
	br_if 0	; to .return

	local.get 0
	local.get 1
	i32.call uint128_t_operator_above
	i32.const 1
	i32.xor
	local.set 2
	end_block

; .return:
	local.get 2
	end_function





uint128_t_operator_above_equal:
	local.get 0
	local.get 1
	i32.call uint128_t_operator_below
	i32.const 1
	i32.xor
	end_function





uint128_t_operator_below_equal:
	local.get 0
	local.get 1
	i32.call uint128_t_operator_above
	i32.const 1
	i32.xor
	end_function





uint128_t_operator_plus:
	local.get 0
	local.get 2
	i64.load 8
	local.tee 3

	local.get 1
	i64.load 8
	local.tee 4
	i64.add
	i64.store 8

	local.get 0
	local.get 2
	i64.load 0

	local.get 1
	i64.load 0
	i64.add

	local.get 3
	local.get 4
	i64.const -1
	i64.xor
	i64.gt_u
	i64.extend_i32_u
	i64.add
	i64.store 0
	end_function





uint128_t_operator_plus_equal:
	global.get __stack_pointer
	i32.const 16
	i32.sub

	local.tee 2
	global.set __stack_pointer

	local.get 2
	local.get 0
	local.get 1
	call uint128_t_operator_plus

	local.get 0
	local.get 2
	i32.call uint128_t_operator_equal_const_uint128_t_double_ref
	drop

	local.get 2
	i32.const 16
	i32.add

	global.set __stack_pointer
	local.get 0
	end_function





uint128_t_operator_minus:
	local.get 0
	local.get 1
	i64.load 8
	local.tee 3

	local.get 2
	i64.load 8
	local.tee 4
	i64.sub
	i64.store 8

	local.get 0
	local.get 1
	i64.load 0

	local.get 2
	i64.load 0
	i64.sub

	local.get 3
	local.get 4
	i64.lt_u
	i64.extend_i32_u
	i64.sub
	i64.store 0
	end_function





uint128_t_operator_minus_equal:
	global.get __stack_pointer
	i32.const 16
	i32.sub

	local.tee 2
	global.set __stack_pointer

	local.get 2
	local.get 0
	local.get 1
	call uint128_t_operator_minus

	local.get 0
	local.get 2
	i32.call uint128_t_operator_equal_const_uint128_t_double_ref
	drop

	local.get 2
	i32.const 16
	i32.add

	global.set __stack_pointer
	local.get 0
	end_function





uint128_t_operator_multiply:
	local.get 0
	local.get 2
	i64.load 8

	local.tee 3
	i64.const 0x20
	i64.shr_u

	local.tee 4
	local.get 1
	i64.load 8

	local.tee 5
	i64.const 0xFFFFFFFF
	i64.and

	local.tee 6
	i64.mul

	local.tee 7
	i64.const 0xFFFFFFFF
	i64.and

	local.get 3
	i64.const 0xFFFFFFFF
	i64.and

	local.tee 3
	local.get 6
	i64.mul

	local.tee 8
	i64.const 32
	i64.shr_u
	i64.add

	local.get 3
	local.get 5
	i64.const 32
	i64.shr_u

	local.tee 5
	i64.mul

	local.tee 9
	i64.const 0xFFFFFFFF
	i64.and
	i64.add

	local.tee 10
	i64.const 32
	i64.shl

	local.get 8
	i64.const 0xFFFFFFFF
	i64.and
	i64.or
	i64.store 8

	local.get 0
	local.get 2
	i64.load 0

	local.tee 8
	i64.const 0xFFFFFFFF
	i64.and

	local.tee 11
	local.get 6
	i64.mul

	local.tee 12
	i64.const 0xFFFFFFFF
	i64.and

	local.get 7
	i64.const 32
	i64.shr_u
	i64.add

	local.get 9
	i64.const 32
	i64.shr_u
	i64.add

	local.get 4
	local.get 5
	i64.mul

	local.tee 7
	i64.const 0xFFFFFFFF
	i64.and
	i64.add

	local.get 10
	i64.const 32
	i64.shr_u
	i64.add

	local.get 3
	local.get 1
	i64.load 0

	local.tee 9
	i64.const 0xFFFFFFFF
	i64.and

	local.tee 10
	i64.mul

	local.tee 13
	i64.const 0xFFFFFFFF
	i64.and
	i64.add

	local.get 8
	i64.const 32
	i64.shr_u

	local.get 6
	i64.mul

	local.get 12
	i64.const 32
	i64.shr_u
	i64.add

	local.get 7
	i64.const 32
	i64.shr_u
	i64.add

	local.get 11
	local.get 5
	i64.mul
	i64.add

	local.get 13
	i64.const 32
	i64.shr_u
	i64.add

	local.get 4
	local.get 10
	i64.mul
	i64.add

	local.get 3
	local.get 9
	i64.const 32
	i64.shr_u
	i64.mul
	i64.add

	i64.const 32
	i64.shl
	i64.add
	i64.store 0
	end_function





uint128_t_operator_multiply_equal:
	global.get __stack_pointer
	i32.const 16
	i32.sub

	local.tee 2
	global.set __stack_pointer

	local.get 2
	local.get 0
	local.get 1
	call uint128_t_operator_multiply

	local.get 0
	local.get 2
	i32.call uint128_t_operator_equal_const_uint128_t_double_ref
	drop

	local.get 2
	i32.const 16
	i32.add

	global.set __stack_pointer
	local.get 0
	end_function





uint128_t_divmod:
	global.set __stack_pointer
	i32.const 80
	i32.sub
	local.tee 4
	global.set __stack_pointer

	block
	block
	local.get 3
	i32.const uint128_1
	i32.call uint128_t_operator_equal_equal
	i32.eqz
	br_if 0	; to .checkEq2

	local.get 0
	local.get 2
	i32.call uint128_t_constructor
	drop

	local.get 0
	i32.const 16
	i32.add
	i32.const uint128_0
	i32.call uint128_t_constructor
	drop
	br 1	; to .return
	end_block

; .checkEq2:
	block
	local.get 2
	local.get 3
	i32.call uint128_t_operator_equal_equal
	i32.eqz
	br_if 0	; to .checkEq

	local.get 0
	i32.const uint128_1
	i32.call uint128_t_constructor
	drop

	local.get 0
	i32.const 16
	i32.add
	i32.const uint128_0
	i32.call uint128_t_constructor
	drop
	br 1	; to .return
	end_block

; .checkEq:
	block
	block
	local.get 2
	i32.const uint128_0
	i32.call uint128_t_operator_equal_equal
	br_if 0	; to .do02

	local.get 2
	local.get 3
	i32.call uint128_t_operator_below
	i32.eqz
	br_if 1	; to .do0
	end_block

; .do02:
	local.get 0
	i32.const uint128_0
	i32.call uint128_t_constructor
	drop

	local.get 0
	i32.const 16
	i32.add

	local.get 2
	i32.call uint128_t_constructor
	drop
	br 1	; to .return
	end_block

; .do0:
	local.get 4
	i32.const 32
	i32.add
	i32.const uint128_0
	i32.call uint128_t_constructor
	local.set 5

	local.get 4
	i32.const 32
	i32.add
	i32.const 16
	i32.add
	i32.const uint128_0
	i32.call uint128_t_constructor
	local.set 6

	block
	local.get 2
	i32.call uint128_t_bits

	local.tee 7
	i32.eqz
	br_if 0	; to .doMoves

	local.get 7
	i64.extend_i32_u
	local.set 8

; .loop:
	loop
	local.get 5
	i32.const uint128_1
	i32.call uint128_t_operator_shiftLeft_equal
	drop

	local.get 6
	i32.const uint128_1
	i32.call uint128_t_operator_shiftLeft_equal
	drop

	local.get 4
	local.get 8
	i64.const -1
	i64.add

	local.tee 9
	i64.const 0xFFFFFFFF

	i64.and
	i64.store 72

	local.get 4
	i64.const 0
	i64.store 64

	local.get 4
	local.get 2
	local.get 4
	i32.const 64
	i32.add
	call uint128_t_operator_shiftRight

	local.get 4
	i64.const 0
	i64.store 16

	local.get 4
	local.get 4
	i64.load 8
	i64.const 1
	i64.and
	i64.store 24

	block
	local.get 4
	i32.const 16
	i32.add
	i32.call uint128_t_operator_cast_bool
	i32.eqz
	br_if 0	; to .checkAboveEq

	local.get 6
	i32.call uint128_t_operator_plus_plus
	drop
	end_block

; .checkAboveEq:
	block
	local.get 6
	local.get 3
	i32.call uint128_t_operator_above_equal
	i32.eqz
	br_if 0	; to .endLoop

	local.get 6
	local.get 3
	i32.call uint128_t_operator_minus_equal
	drop

	local.get 5
	i32.call uint128_t_operator_plus_plus
	drop
	end_block

; .endLoop:
	local.get 8
	i32.wrap_i64
	local.set 7
	local.get 9
	local.set 8
	local.get 7
	i32.const 0xFF
	i32.and
	i32.const 1
	i32.ne
	br_if 0	; to .loop
	end_loop
	end_block

; .doMoves:
	local.get 0
	local.get 5
	i32.call uint128_t_constructor_uint128_t_double_ref
	drop

	local.get 0
	i32.const 16
	i32.add

	local.get 6
	i32.call uint128_t_constructor_uint128_t_double_ref
	drop
	end_block

; .return:
	local.get 4
	i32.const 80
	i32.add
	global.set __stack_pointer
	end_function





uint128_t_operator_divide:
	global.get __stack_pointer
	i32.const 32
	i32.sub
	local.tee 3
	global.set __stack_pointer

	local.get 3
	local.get 1
	local.get 1
	local.get 2
	call uint128_t_divmod

	local.get 0
	local.get 3
	i32.call uint128_t_constructor_uint128_t_double_ref
	drop

	local.get 3
	i32.const 32
	i32.add
	global.set __stack_pointer
	end_function





uint128_t_operator_divide_equal:
	global.get __stack_pointer
	i32.const 16
	i32.sub

	local.tee 2
	global.set __stack_pointer

	local.get 2
	local.get 0
	local.get 1
	call uint128_t_operator_divide

	local.get 0
	local.get 2
	i32.call uint128_t_operator_equal_const_uint128_t_double_ref
	drop

	local.get 2
	i32.const 16
	i32.add

	global.set __stack_pointer
	local.get 0
	end_function





uint128_t_operator_modulo:
	global.get __stack_pointer
	i32.const 32
	i32.sub
	local.tee 3
	global.set __stack_pointer

	local.get 3
	local.get 1
	local.get 1
	local.get 2
	call uint128_t_divmod

	local.get 0
	local.get 3
	i32.const 16
	i32.add
	i32.call uint128_t_constructor_uint128_t_double_ref
	drop

	local.get 3
	i32.const 32
	i32.add
	global.set __stack_pointer
	end_function





uint128_t_operator_modulo_equal:
	global.get __stack_pointer
	i32.const 16
	i32.sub

	local.tee 2
	global.set __stack_pointer

	local.get 2
	local.get 0
	local.get 1
	call uint128_t_operator_modulo

	local.get 0
	local.get 2
	i32.call uint128_t_operator_equal_const_uint128_t_double_ref
	drop

	local.get 2
	i32.const 16
	i32.add

	global.set __stack_pointer
	local.get 0
	end_function





uint128_t_operator_plus_plus:
	local.get 0
	i32.const uint128_1
	i32.call uint128_t_operator_plus_equal
	end_function





uint128_t_operator_plus_plus_int:
	local.get 0
	local.get 1
	i32.call uint128_t_constructor
	drop

	local.get 1
	i32.call uint128_t_operator_plus_plus
	drop
	end_function





uint128_t_operator_minus_minus:
	local.get 0
	i32.const uint128_1
	i32.call uint128_t_operator_minus_equal
	end_function





uint128_t_operator_minus_minus_int:
	local.get 0
	local.get 1
	i32.call uint128_t_constructor
	drop

	local.get 1
	i32.call uint128_t_operator_minus_minus
	drop
	end_function





uint128_t_operator_single_plus:
	local.get 0
	local.get 1
	i32.call uint128_t_constructor
	drop
	end_function





uint128_t_operator_single_minus:
	global.get __stack_pointer
	i32.const 16
	i32.sub
	local.tee 2
	global.set __stack_pointer

	local.get 2
	local.get 1
	call uint128_t_operator_not

	local.get 0
	local.get 2
	i32.const uint128_1
	call uint128_t_operator_plus

	local.get 2
	i32.const 16
	i32.add
	global.set __stack_pointer
	end_function





uint128_t_upper:
	local.get 0
	end_function





uint128_t_lower:
	local.get 0
	i32.const 8
	i32.add
	end_function





uint128_t_bits:
	block
	block
	local.get 0
	i64.load 0

	local.tee 1
	i64.eqz
	br_if 0	; to .continue

	i32.const -0x80

	local.get 1
	i64.clz
	i32.wrap_i64
	i32.sub
	local.set 0

	br 1	; to .return
	end_block

; .continue:
	block
	local.get 0
	i64.load 8

	local.tee 1
	i64.eqz
	i32.eqz
	br_if 0	; to .not0

	i32.const 0
	local.set 0
	br 1	; to .return
	end_block

; .not0:
	i32.const 64

	local.get 1
	i64.clz
	i32.wrap_i64
	i32.sub
	local.set 0
	end_block

; .return:
	local.get 0
	i32.const 0xFF
	i32.and
	end_function
