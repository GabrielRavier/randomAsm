global uint128_0
global uint128_1
global uint128_t_constructor_default
global uint128_t_constructor
global uint128_t_constructor_uint128_t_double_ref
global uint128_t_operator_equal
global uint128_t_operator_equal_const_uint128_t_double_ref
global uint128_t_operator_cast_bool
global uint128_t_operator_cast_uint8_t
global uint128_t_operator_cast_uint16_t
global uint128_t_operator_cast_uint32_t
global uint128_t_operator_cast_uint64_t
global uint128_t_operator_and
global uint128_t_operator_and_equal
global uint128_t_operator_or
global uint128_t_operator_or_equal
global uint128_t_operator_xor
global uint128_t_operator_xor_equal
global uint128_t_operator_not
global uint128_t_operator_shiftLeft
global uint128_t_operator_shiftLeft_equal
global uint128_t_operator_shiftRight
global uint128_t_operator_shiftRight_equal
global uint128_t_operator_exclamation_mark
global uint128_t_operator_and_and
global uint128_t_operator_or_or
global uint128_t_operator_equal_equal
global uint128_t_operator_not_equal
global uint128_t_operator_above
global uint128_t_operator_below
global uint128_t_operator_above_equal
global uint128_t_operator_below_equal
global uint128_t_operator_plus
global uint128_t_operator_plus_equal
global uint128_t_operator_minus
global uint128_t_operator_minus_equal
global uint128_t_operator_multiply
global uint128_t_operator_multiply_equal
global uint128_t_divmod
global uint128_t_operator_divide
global uint128_t_operator_divide_equal
global uint128_t_operator_modulo
global uint128_t_operator_modulo_equal
global uint128_t_operator_plus_plus
global uint128_t_operator_plus_plus_int
global uint128_t_operator_minus_minus
global uint128_t_operator_minus_minus_int
global uint128_t_operator_single_plus
global uint128_t_operator_single_minus
global uint128_t_upper
global uint128_t_lower
global uint128_t_bits

section .rodata align=16

	align 16
	uint128_0 do 0

	align 16
	uint128_1 dq 0, 1

section .text align=16

	align 16
uint128_t_constructor_default:
	pxor xmm0
	movups [rdi], xmm0
	ret





	align 16
uint128_t_constructor:
uint128_t_operator_single_plus:
	movdqu xmm0, [rsi]
	movups [rdi], xmm0
	ret





	align 16
uint128_t_constructor_uint128_t_double_ref:
	mov rax, [rsi]
	mov [rdi], rax
	mov rax, [rsi + 8]
	mov [rdi + 8], rax

	cmp rdi, rsi
	je .return

	pxor xmm0
	movups [rsi], xmm0

.return:
	ret





	align 16
uint128_t_operator_equal:
	movdqu xmm0, [rsi]
	movups [rdi], xmm0
	mov rax, rdi
	ret





	align 16
uint128_t_operator_equal_const_uint128_t_double_ref:
	mov rax, rdi
	cmp rdi, rsi
	je .return

	mov rdx, [rsi]
	pxor xmm0
	mov [rdi], rdx
	mov rdx, [rsi + 8]
	mov [rdi + 8], rdx
	movups [rsi], xmm0

.return:
	ret





	align 16
uint128_t_operator_cast_bool:
	mov rax, [rdi]
	or rax, [rdi + 8]
	setne al

	ret





	align 16
uint128_t_operator_cast_uint8_t:
uint128_t_operator_cast_uint16_t:
uint128_t_operator_cast_uint32_t:
uint128_t_operator_cast_uint64_t:
	mov rax, [rdi + 8]
	ret





	align 16
uint128_t_operator_and:
uint128_t_operator_and_equal:
	movdqu xmm0, [rsi]
	movdqu xmm1, [rdx]
	mov rax, rdi
	pand xmm0, xmm1
	movups [rdi], xmm0
	ret





	align 16
uint128_t_operator_or:
uint128_t_operator_or_equal:
	movdqu xmm0, [rsi]
	movdqu xmm1, [rdx]
	mov rax, rdi
	por xmm0, xmm1
	movups [rdi], xmm0
	ret





	align 16
uint128_t_operator_xor:
uint128_t_operator_xor_equal:
	movdqu xmm0, [rsi]
	movdqu xmm1, [rdx]
	mov rax, rdi
	pxor xmm0, xmm1
	movups [rdi], xmm0
	ret





	align 16
uint128_t_operator_not:
	movdqu xmm0, [rsi]
	pcmpeqd xmm1

	mov rax, rdi
	pxor xmm0, xmm1
	movups [rdi], xmm0
	ret





	align 16
uint128_t_operator_shiftLeft:
	mov rax, [rdx + 8]
	cmp qword [rdx], 0
	jne .ret0

	cmp rax, 0x80
	jae .ret0

	cmp rax, 0x40
	jne .check64

	mov rax, [rsi + 8]
	mov [rdi], rax
	mov qword [rdi + 8], 0
	ret

	align 16
.check64:
	test rax
	jne .not64
	jmp uint128_t_constructor

	align 16
.not64:
	cmp rax, 0x40
	jb .less64

	lea rdx, [rax - 0x41]
	cmp rdx, 0x3E
	ja .ret0

	mov ecx, eax
	mov rdx, [rsi + 8]
	shl rdx, cl
	mov [rdi], rdx
	mov qword [rdi + 8], 0
	ret

	align 16
.ret0:
	mov esi, uint128_0
	jmp uint128_t_constructor

	align 16
.less64:
	mov r8d, eax
	neg rax
	mov ecx, r9d
	mov r9, [rsi + 8]
	mov rdx, [rsi]
	mov rsi, r9
	shl rdx, cl

	mov ecx, eax
	shl rsi, cl

	mov ecx, r8d
	shl r9, cl
	add rdx, rsi

	mov [rdi], rdx
	mov [rdi + 8], r9
	ret





	align 16
uint128_t_operator_shiftLeft_equal:
	push r12
	mov rdx, rsi
	mov r12, rdi
	mov rsi, rdi
	sub rsp, 16

	mov rdi, rsp
	call uint128_t_operator_shiftLeft

	mov rsi, rsp
	mov rdi, r12
	call uint128_t_operator_equal_const_uint128_t_double_ref

	add rsp, 16
	mov rax, r12
	pop r12
	ret





	align 16
uint128_t_operator_shiftRight:
	mov rax, rdx
	mov rdx, [rax + 8]

	cmp qword [rax], 0
	jne .ret0

	cmp rdx, 0x80
	jae .ret0

	cmp rdx, 0x40
	jne .not64

	mov qword [rdi], 0
	mov rax, [rsi]
	mov [rdi + 8], rax
	ret

	align 16
.not64:
	test rdx
	jne .no0
	jmp uint128_t_constructor

	align 16
.no0:
	cmp rdx, 0x40
	jb .less64

	lea rax, [rdx - 0x41]
	cmp rax, 0x3E
	ja .ret0

	mov ecx, edx
	mov rax, [rsi]
	shr rax, cl
	mov qword [rdi], 0
	mov [rdi + 8], rax
	ret

	align 16
.ret0:
	mov esi, uint128_0
	jmp uint128_t_constructor

	align 16
.less64:
	mov rcx, rdx
	neg rcx
	mov rax, [rsi]
	mov r8, rax
	mov rsi, [rsi + 8]
	shl r8, cl

	mov ecx, edx
	shr rsi, cl

	mov ecx, edx
	shr rax, cl
	add r8, rsi

	mov [rdi], rax
	mov [rdi + 8], r8
	ret





	align 16
uint128_t_operator_shiftRight_equal:
	push r12
	mov rdx, rsi
	mov r12, rdi
	mov rsi, rdi
	sub rsp, 16

	mov rdi, rsp
	call uint128_t_operator_shiftRight

	mov rsi, rsp
	mov rdi, r12
	call uint128_t_operator_equal_const_uint128_t_double_ref

	add rsp, 16
	mov rax, r12
	pop r12
	ret





	align 16
uint128_t_operator_exclamation_mark:
	mov rax, [rdi]
	or rax, [rdi + 8]
	sete al

	ret





	align 16
uint128_t_operator_and_and:
	push rbp
	mov rbp, rsi

	call uint128_t_operator_cast_bool
	test al
	jne .checkOther

	xor eax
	pop rbp
	ret

	align 16
.checkOther:
	mov rdi, rbp
	pop rbp
	jmp uint128_t_operator_cast_bool





	align 16
uint128_t_operator_or_or:
	push rbp
	mov rbp, rsi

	call uint128_t_operator_cast_bool
	test al, al
	je .checkOther

	pop rbp
	ret

	align 16
.checkOther:
	mov rdi, rbp
	pop rbp
	jmp uint128_t_operator_cast_bool





	align 16
uint128_t_operator_equal_equal:
	mov rdx, [rsi]
	xor eax
	cmp [rdi], rdx
	je .continue
	ret

	align 16
.continue:
	mov rax, [rsi + 8]
	cmp [rdi + 8], rax
	sete al
	ret





	align 16
uint128_t_operator_not_equal:
	mov rax, [rdi]
	mov rcx, [rdi + 8]
	xor rax, [rsi]
	xor rcx, [rsi + 8]
	or rcx, rax
	setne al
	ret





	align 16
uint128_t_operator_above:
	mov rax, [rsi]
	cmp [rdi], rax
	jne .notEqual

	mov rax, [rdi + 8]
	cmp rax, [rsi + 8]

.notEqual:
	seta al
	ret





	align 16
uint128_t_operator_below:
	mov rax, [rsi]
	cmp [rdi], rax
	jne .notEqual

	mov rax, [rdi + 8]
	cmp rax, [rsi + 8]

.notEqual:
	setb al
	ret





	align 16
uint128_t_operator_above_equal:
	push rbp
	push r14
	push rbx

	mov r14, rsi
	mov rbx, rdi

	call uint128_t_operator_above
	mov ebp, eax
	mov rdi, rbx
	mov rsi, r14

	call uint128_t_operator_equal_equal
	or al, bpl

	pop rbx
	pop r14
	pop rbp
	ret





	align 16
uint128_t_operator_below_equal:
	push rbp
	push r14
	push rbx
	mov r14, rsi
	mov rbx, rdi

	call uint128_t_operator_below
	mov ebp, eax
	mov rdi, rbx
	mov rsi, r14

	call uint128_t_operator_equal_equal
	or al, bpl

	pop rbx
	pop r14
	pop rbp
	ret





	align 16
uint128_t_operator_plus:
	mov rcx, [rdx + 8]
	mov rax, rdi
	xor edi
	add rcx, [rsi + 8]

	mov rdx, [rdx]
	setc dil

	add rdx, [rsi]
	mov [rax + 8], rcx
	add rdx, rdi
	mov [rax], rdx
	ret





	align 16
uint128_t_operator_plus_equal:
	xor ecx
	mov rdx, [rdi + 8]
	mov rax, rdi
	mov r8, [rsi + 8]

	add r8, rdx
	cmp r8, rdx
	mov [rdi + 8], r8
	setb cl

	add rcx, [rsi]
	mov [rdi], rcx
	ret





	align 16
uint128_t_operator_minus:
	mov rcx, [rsi + 8]
	sub rcx, [rdx + 8]

	mov rsi, [rsi]
	sbb rsi, [rdx]

	mov rax, rdi
	mov [rdi], rsi
	mov [rdi + 8], rcx
	ret





	align 16
uint128_t_operator_minus_equal:
	push r12
	mov rdx, rsi
	mov r12, rdi
	mov rsi, rdi

	sub rsp, 16
	mov rdi, rsp
	call uint128_t_operator_minus

	mov rsi, rsp
	mov rdi, r12
	call uint128_t_operator_equal_const_uint128_t_double_ref

	add rsp, 16
	mov rax, r12
	pop r12
	ret





	align 16
uint128_t_operator_multiply:
	push r15
	push r14
	push r13
	push r12
	push rbx
	mov rax, rdi

	mov r8, [rsi]
	mov rbx, [rsi + 8]
	mov r15d, r8d

	mov r9, [rdx + 8]
	mov r10, r9
	shr r10, 32

	mov rsi, r10
	mov r13, r10
	imul r10d, r8d

	shr r8, 32
	mov r14d, ebx

	mov r12, [rdx]
	mov r11, r12
	shr r11, 32

	imul r11d, ebx
	shr rbx, 32

	mov ecx, r12d
	mov edx, r9d
	mov rdi, rdx

	imul r15, rdx
	imul rdx, r14
	imul rdi, rbx
	imul r8d, r9d
	imul rsi, r14
	imul r13, rbx
	imul rcx, r14
	imul ebx, r12d

	mov r9d, edx
	mov r14d, esi
	shr rdx, 32
	add rdx, r14

	mov r14d, ecx
	shr rsi, 32

	add rsi, r14
	shr rcx, 32

	mov r14d, edi
	add r14, rdx

	mov edx, r13d
	shr rdi, 32

	add rdi, rsi
	add rdi, rdx
	shr r13, 32

	mov edx, r15d
	shr r15, 32

	add ecx, r11d
	add r13d, ecx
	add r13d, ebx
	add r15d, r13d
	add r15d, r10d
	add r15d, r8d

	mov rcx, r14
	shr rcx, 32
	add rcx, rdi
	add rcx, rdx

	shr r15, 32
	add r15, rcx
	shl r14, 32
	or r14, r9

	mov [rax], r15
	mov [rax + 8], r14

	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	ret





	align 16
uint128_t_operator_multiply_equal:
	push r12
	mov rdx, rsi
	mov r12, rdi
	mov rsi, rdi
	sub rsp, 16

	mov rdi, rsp
	call uint128_t_operator_multiply

	mov rsi, rsp
	mov rdi, r12
	call uint128_t_operator_equal_const_uint128_t_double_ref

	add rsp, 16
	mov rax, r12
	pop r12
	ret





	align 16
uint128_t_divmod:
	push r13
	mov esi, uint128_1
	push r12
	mov r12, rdi
	mov rdi, rcx
	push rbp
	mov rbp, rdx
	push rbx
	mov rbx, rcx
	sub rsp, 72

	call uint128_t_operator_equal_equal
	mov rsi, rbp
	test al
	jne .divBy1

	mov rsi, rbx
	mov rdi, rbp
	call uint128_t_operator_equal_equal

	test al
	je .checkLhs0

	mov esi, uint128_1

.divBy1:
	mov rdi, r12
	call uint128_t_constructor

	lea rdi, [r12 + 16]
	mov esi, uint128_0
	call uint128_t_constructor

.return:
	add rsp, 72
	mov rax, r12
	pop rbx
	pop rbp
	pop r12
	pop r13
	ret

	align 16
.checkLhs0:
	mov esi, uint128_0
	mov rdi, rbp

	call uint128_t_operator_equal_equal
	test al
	je .checkLhs0Part2

.result0:
	mov rdi, r12d
	mov esi, uint128_0
	call uint128_t_constructor

	lea rdi, [r12 + 16]
	mov rsi, rbp
	call uint128_t_constructor

	add rsp, 72
	mov rax, r12
	pop rbx
	pop rbp
	pop r12
	pop r13
	ret

	align 16
.checkLhs0Part2:
	mov rsi, rbx
	mov rdi, rbp
	call uint128_t_operator_below

	test al
	jne .result0

	mov esi, uint128_0
	lea rdi, [rsp + 32]
	call uint128_t_constructor

	lea rdi, [rsp + 48]
	mov esi, uint128_0
	call uint128_t_constructor

	mov rdi, rbp
	call uint128_t_bits

	test al
	je .doMove

	movzx r13d, al
	jmp .loop

	align 16
.checkAbove:
	mov rsi, rbx
	lea rdi, [rsp + 48]
	call uint128_t_operator_above_equal

	test al
	jne .gotAbove

.checkMove:
	test r13d
	je .doMove

.loop:
	mov esi, uint128_1
	lea rdi, [rsp + 32]
	call uint128_t_operator_shiftLeft_equal

	mov esi, uint128_1
	lea rdi, [rsp + 38]
	call uint128_t_operator_shiftRight_equal

	lea eax, [r13 - 1]
	mov rdi, rsp
	mov rsi, rbp
	lea rdx, [rsp + 18]

	mov [rsp + 24], rax
	mov r13, rax
	mov qword [rsp + 16], 0
	call uint128_t_operator_shiftRight

	mov rax, [rsp + 8]
	lea rdi, [rsp + 16]
	mov qword [rsp + 16], 0
	and eax,
	mov [rsp + 24], rax
	call uint128_t_operator_cast_bool

	test al
	je .checkAbove

	lea rdi, [rsp + 48]
	call uint128_t_operator_plus_plus
	jmp .checkAbove

	align 16
.gotAbove:
	lea rdi, [rsp + 48]
	mov rsi, rbx
	call uint128_t_operator_minus_equal

	lea rdi, [rsp + 32]
	call uint128_t_operator_plus_plus
	jmp .checkMove

	align 16
.doMove:
	lea rsi, [rsp + 32]
	mov rdi, r12d
	call uint128_t_constructor_uint128_t_double_ref

	lea rdi, [r12 + 16]
	lea rsi, [rsp + 48]
	call uint128_t_constructor_uint128_t_double_ref
	jmp .return





	align 16
uint128_t_operator_divide:
	push r14
	sub rsp, 32
	mov rcx, rdx
	mov r14, rdi

	lea rdi, [rsp]
	mov rdx, rsi
	call uint128_t_divmod

	mov rdi, r14
	lea rsi, [rsp]
	call uint128_t_constructor_uint128_t_double_ref

	add rsp, 32
	pop r14
	ret





	align 16
uint128_t_operator_divide_equal:
	push r12
	mov rdx, rsi
	mov r12, rdi
	mov rsi, rdi
	sub rsp, 16

	mov rdi, rsp
	call uint128_t_operator_divide

	mov rsi, rsp
	mov rdi, r12
	call uint128_t_operator_equal_const_uint128_t_double_ref

	add rsp, 16
	mov rax, r12
	pop r12
	ret





	align 16
uint128_t_operator_modulo:
	push r14
	sub rsp, 32
	mov rcx, rdx
	mov r14, rdi

	lea rdi, [rsp]
	mov rdx, rsi
	call uint128_t_divmod

	mov rdi, r14
	lea rsi, [rsp + 16]
	call uint128_t_constructor_uint128_t_double_ref

	add rsp, 32
	pop r14
	ret





	align 16
uint128_t_operator_modulo_equal:
	push r12
	mov rdx, rsi
	mov r12, rdi
	mov rsi, rdi
	sub rsp, 16

	mov rdi, rsp
	call uint128_t_operator_modulo

	mov rsi, rsp
	mov rdi, r12
	call uint128_t_operator_equal_const_uint128_t_double_ref

	add rsp, 16
	mov rax, r12
	pop r12
	ret





	align 16
uint128_t_operator_plus_plus:
	mov esi, uint128_1
	jmp uint128_t_operator_plus_equal





	align 16
uint128_t_operator_plus_plus_int:
	push rbp
	mov rbp, rsi
	call uint128_t_constructor

	mov rdi, rbp
	pop rbp
	jmp uint128_t_operator_plus_plus





	align 16
uint128_t_operator_minus_minus:
	mov esi, uint128_1
	jmp uint128_t_operator_minus_equal





	align 16
uint128_t_operator_minus_minus_int:
	push rbp
	mov rbp, rsi
	call uint128_t_constructor

	mov rdi, rbp
	pop rbp
	jmp uint128_t_operator_minus_minus





	align 16
uint128_t_operator_single_minus:
	push r15
	sub rsp, 16
	mov r15, rdi

	lea rdi, [rsp]
	call uint128_t_operator_not

	mov rdi, r15
	lea rsi, [rsp]
	mov edx, uint128_1
	call uint128_t_operator_plus

	add rsp, 16
	pop r15
	ret





	align 16
uint128_t_upper:
	mov rax, rdi
	ret





	align 16
uint128_t_lower:
	lea rax, [rdi + 8]
	ret





	align 16
uint128_t_bits:
	mov rcx, [rdi]
	test rcx
	je .lower0

	bsr rdx, rcx
	mov eax, 0x40
	add edx, 0x41

	test rcx
	cmovne eax, edx
	ret

	align 16
.lower0:
	mov rcx, [rdi + 8]
	xor eax, eax
	bsr rdx, rcx
	inc edx

	test rcx
	cmovne eax, edx
	ret
