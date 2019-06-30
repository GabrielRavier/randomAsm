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

	align 16
	addEqDat dd 1, 0, 0, 0

section .text align=16

	align 16
uint128_t_constructor_default:
	mov eax, [esp + 4]
	pxor xmm0
	movups [eax], xmm0
	ret





	align 16
uint128_t_constructor:
	mov eax, [esp + 8]
	movdqu xmm0, [eax]
	mov eax, [esp + 4]
	movups [eax], xmm0
	ret





	align 16
uint128_t_constructor_uint128_t_double_ref:
	mov eax, [esp + 8]
	mov edx, [esp + 4]

	movq xmm1, [eax]
	movq xmm2, [eax + 8]

	movq [edx], xmm1
	movq [edx + 8], xmm2

	cmp edx, eax
	je .same

	pxor xmm0
	movups [eax], xmm0

.same:
	ret





	align 16
uint128_t_operator_equal:
	mov edx, [esp + 8]
	mov eax, [esp + 4]
	movdqu xmm0, [edx]
	movups [eax], xmm0
	ret





	align 16
uint128_t_operator_equal_const_uint128_t_double_ref:
	mov eax, [esp + 4]
	mov edx, [esp + 8]

	cmp eax, edx
	je .same

	movq xmm1, [edx]
	pxor xmm0
	movq [eax], xmm1
	movq xmm2, [edx + 8]
	movq [eax + 8], xmm2
	movups [edx], xmm0

.same:
	ret





	align 16
uint128_t_operator_cast_bool:
	mov eax, [esp + 4]
	mov ecx, [eax + 8]
	mov edx, [eax + 12]
	or edx, [eax + 4]
	or ecx, [eax]
	or ecx, edx
	setne al
	ret





	align 16
uint128_t_operator_cast_uint8_t:
uint128_t_operator_cast_uint16_t:
uint128_t_operator_cast_uint32_t:
	mov eax, [esp + 4]
	mov eax, [eax + 8]
	ret





	align 16
uint128_t_operator_cast_uint64_t:
	mov eax, [esp + 4]
	mov edx, [eax + 12]
	mov eax, [eax + 8]
	ret





	align 16
uint128_t_operator_and:
	mov edx, [esp + 8]
	mov eax, [esp + 4]
	movdqu xmm0, [edx]
	mov edx, [esp + 12]
	movdqu xmm1, [edx]
	pand xmm0, xmm1
	movups [eax], xmm0
	ret 4





	align 16
uint128_t_operator_and_equal:
	mov eax, [esp + 4]
	mov edx, [esp + 8]
	movdqu xmm1, [eax]
	movdqu xmm0, [edx]
	pand xmm0, xmm1
	movups [eax], xmm0
	ret





	align 16
uint128_t_operator_or:
	mov edx, [esp + 8]
	mov eax, [esp + 4]
	movdqu xmm0, [edx]
	mov edx, [esp + 12]
	movdqu xmm1, [edx]
	por xmm0, xmm1
	movups [eax], xmm0
	ret 4





	align 16
uint128_t_operator_or_equal:
	mov eax, [esp + 4]
	mov edx, [esp + 8]
	movdqu xmm1, [eax]
	movdqu xmm0, [edx]
	por xmm0, xmm1
	movups [eax], xmm0
	ret





	align 16
uint128_t_operator_xor:
	mov edx, [esp + 8]
	mov eax, [esp + 4]
	movdqu xmm0, [edx]
	mov edx, [esp + 12]
	movdqu xmm1, [edx]
	pxor xmm0, xmm1
	movups [eax], xmm0
	ret 4





	align 16
uint128_t_operator_xor_equal:
	mov eax, [esp + 4]
	mov edx, [esp + 8]
	movdqu xmm1, [eax]
	movdqu xmm0, [edx]
	pxor xmm0, xmm1
	movups [eax], xmm0
	ret





	align 16
uint128_t_operator_not:
	mov edx, [esp + 8]
	mov eax, [esp + 4]
	pcmpeqd xmm1
	movdqu xmm0, [edx]
	pxor xmm0, xmm1
	movups [eax], xmm0
	ret 4





	align 16
uint128_t_operator_shiftLeft:
	push edi
	push ebp
	sub esp, 20
	mov eax, [esp + 40]
	mov edx, [eax]
	mov ebp, [eax + 8]
	mov ecx, [eax + 12]

	or edx, [eax + 4]
	jne .ret0

	mov edx, 0x80
	mov eax, ebp
	sub eax, edx
	mov edx, 0
	mov edi, ecx
	sbb edi, edx
	jae .ret0

	mov eax, 0x40
	mov edi, ebp
	sub edi, eax
	or edi, ecx
	jne .check64

	mov eax, [esp + 36]
	mov edx, [esp + 32]
	pxor xmm1
	movq xmm0, [eax + 8]
	movq [edx], xmm0
	movq [edx + 8], xmm1

	add esp, 20
	pop ebp
	pop edi
	ret 4

	align 16
.check64:
	mov edi, ebp
	or edi, ecx
	jne .checkLess64

	add esp, 8
	times 2 push dword [esp + 28]
	call uint128_t_constructor

	add esp, 20
	pop ebp
	pop edi
	ret 4

	align 16
.checkLess64:
	mov edi, ebp
	sub edi, eax
	mov eax, ecx
	sbb eax, edx
	jb .shiftLower

	mov edi, ebp
	mov eax, 0x3E

	add edi, -0x41
	adc ecx, -1

	sub edi, eax
	sbb ecx, edx
	jb .shiftUpper

	or edi, ecx
	jne .ret0

.shiftUpper:
	add ebp, -0x40
	mov eax, [esp + 36]
	pxor xmm2
	mov edx, [esp + 32]
	movq xmm1, [eax + 8]
	movd xmm0, ebp
	psllq xmm1, xmm0
	movq [edx], xmm1
	movq [edx + 8], xmm2

	add esp, 20
	pop ebp
	pop edi
	ret 4

	align 16
.ret0:
	add esp, 8
	push uint128_0
	push dword [esp + 28]
	call uint128_t_constructor

	add esp, 20
	pop ebp
	pop edi
	ret 4

	align 16
.shiftLower:
	movd xmm3, ebp
	neg ebp
	mov eax, [esp + 36]
	mov edx, eax
	add ebp, 0x40

	mov ecx, [esp + 32]
	movq xmm4, [eax + 8]
	movq xmm2, [edx]
	movdqa xmm1, xmm4
	movd xmm0, ebp
	psllq xmm2, xmm3
	psrlq xmm1, xmm0
	psllq xmm4, xmm3
	paddq xmm2, xmm1

	movq [ecx], xmm2
	movq [ecx + 8], xmm4

	add esp, 20
	pop ebp
	pop edi
	ret 4





	align 16
uint128_t_operator_shiftLeft_equal:
	push esi
	push ebx
	sub esp, 20
	mov ebx, [esp + 32]

	mov esi, esp
	sub esp, 4

	push dword [esp + 40]
	push ebx
	push esi
	call uint128_t_operator_shiftLeft

	mov [esp], esi
	push ebx
	call uint128_t_operator_equal_const_uint128_t_double_ref

	add esp, 36
	mov eax, ebx
	pop ebx
	pop esi
	ret





	align 16
uint128_t_operator_shiftRight:
	push esi
	push edi
	push ebx
	sub esp, 16
	mov eax, [esp + 40]
	mov esi, [esp + 32]

	mov edx, [eax]
	mov ebx, [eax + 8]
	mov ecx, [eax + 12]
	or edx, [eax + 4]
	jne .ret0

	mov edx, 0x80
	mov eax, ebx
	sub eax, edx
	mov edx, 0
	mov edi, ecx
	sbb edi, edx
	jae .ret0

	mov eax, 0x40
	mov edi, ebx
	sub edi, eax
	or edi, ecx
	jne .checkEq64

	mov eax, [esp + 36]
	pxor xmm0
	movq [esi], xmm0
	movq xmm1, [eax]
	movq [esi + 8], xmm1

	add esp, 16
	pop ebx
	pop edi
	pop esi
	ret 4

	align 16
.checkEq64:
	mov edi, ebx
	or edi, ecx
	jne .check64

	add esp, 8
	mov eax, [esp + 28]
	push eax
	push esi
	call uint128_t_constructor

	add esp, 16
	pop ebx
	pop edi
	pop esi
	ret 4

	align 16
.check64:
	mov edi, ebx
	sub edi, eax
	mov eax, ecx
	sbb eax, edx
	jb .shiftLower

	mov edi, ebx
	mov eax, 0x3E

	add edi, -0x41
	adc ecx, -1

	sub edi, eax
	sbb ecx, edx
	jb .shiftUpper

	or edi, ecx
	jne .ret0

.shiftUpper:
	add ebx, -0x40
	mov eax, [esp + 36]
	pxor xmm1
	movq xmm2, [eax]
	movd xmm0, ebx
	psrlq xmm2, xmm0
	movq [esi], xmm1
	movq [esi + 8], xmm2

	add esp, 16
	pop ebx
	pop edi
	pop esi
	ret 4

	align 16
.ret0:
	add esp, 8
	push uint128_0
	push esi
	call uint128_t_constructor

	add esp, 16
	pop ebx
	pop edi
	pop esi
	ret 4

	align 16
.shiftLower:
	mov ecx, ebx
	movd xmm2, ebx
	neg ecx

	mov eax, [esp + 36]
	mov edx, eax
	add ecx, 0x40

	movq xmm3, [eax]
	movq xmm1, [edx + 8]
	movdqa xmm4, xmm3
	movd xmm0, ecx

	psrlq xmm1, xmm2
	psllq xmm4, xmm0
	psrlq xmm3, xmm2
	paddq xmm4, xmm1

	movq [esi], xmm3
	movq [esi + 8], xmm4

	add esp, 16
	pop ebx
	pop edi
	pop esi
	ret 4





	align 16
uint128_t_operator_shiftRight_equal:
	push esi
	push ebx
	sub esp, 20
	mov ebx, [esp + 32]

	mov esi, esp
	sub esp, 4

	push dword [esp + 40]
	push ebx
	push esi
	call uint128_t_operator_shiftRight

	mov [esp], esi
	push ebx
	call uint128_t_operator_equal_const_uint128_t_double_ref

	add esp, 36
	mov eax, ebx
	pop ebx
	pop esi
	ret





	align 16
uint128_t_operator_exclamation_mark:
	mov eax, [esp + 4]
	mov ecx, [eax + 8]
	mov edx, [eax + 12]
	or edx, [eax + 4]
	or ecx, [eax]
	or ecx, edx
	sete al
	ret





	align 16
uint128_t_operator_and_and:
	sub esp, 12
	mov eax, [esp + 16]

	mov [esp], eax
	call uint128_t_operator_cast_bool

	test al
	je .ret0

	mov eax, [esp + 20]
	mov [esp], eax
	call uint128_t_operator_cast_bool

	add esp, 12
	ret

	align 16
.ret0:
	xor eax, eax
	add esp, 12
	ret





	align 16
uint128_t_operator_or_or:
	sub esp, 12
	mov eax, [esp + 16]

	mov [esp], eax
	call uint128_t_operator_cast_bool

	test al
	je .continue

	mov al, 1
	add esp, 12
	ret

	align 16
.continue:
	mov eax, [esp + 20]
	mov [esp], eax
	call uint128_t_operator_cast_bool

	add esp, 12
	ret





	align 16
uint128_t_operator_equal_equal:
	push esi
	mov ecx, [esp + 8]
	mov eax, [esp + 12]

	mov edx, [ecx]
	mov esi, [ecx + 4]
	xor esi, [eax + 4]
	xor edx, [eax]
	or edx, esi
	jne .ret0

	mov edx, [ecx + 8]
	mov ecx, [ecx + 12]
	xor ecx, [eax + 12]
	xor edx, [eax + 8]
	or edx, ecx
	sete al

	pop esi
	ret

	align 16
.ret0:
	xor eax
	pop esi
	ret





	align 16
uint128_t_operator_not_equal:
	push edi
	push esi

	mov ecx, [esp + 12]
	mov eax, [esp + 16]

	mov edx, [ecx]
	mov esi, [ecx + 4]
	mov edi, [ecx + 12]
	mov ecx, [ecx + 8]

	xor edx, [eax]
	xor ecx, [eax + 8]
	xor esi, [eax + 4]
	xor edi, [eax + 12]

	or ecx, edx
	or edi, esi
	or edi, ecx
	setne al

	pop esi
	pop edi
	ret





	align 16
uint128_t_operator_above:
	push ebp
	push ebx
	push edi
	push esi

	mov edx, [esp + 20]
	mov ecx, [esp + 24]
	mov eax, [edx]
	mov edx, [edx + 4]
	mov ebx, [ecx]
	mov edi, [ecx + 4]
	mov ebp, edx
	mov esi, eax
	xor ebp, edi
	xor esi, ebx
	or esi, ebp
	jne .continue

	mov eax, [ecx + 8]
	mov edx, [esp + 20]
	mov ecx, [ecx + 12]
	cmp eax, [edx + 8]
	sbb ecx, [edx + 12]
	jmp .finish

	align 16
.continue:
	cmp ebx, eax
	sbb edi, edx

.finish:
	setb al

	pop esi
	pop edi
	pop ebx
	pop ebp
	ret





	align 16
uint128_t_operator_below:
	push ebp
	push ebx
	push edi
	push esi

	mov ecx, [esp + 20]
	mov esi, [esp + 24]
	mov edx, [ecx + 4]
	mov eax, [ecx]
	mov ebx, [esi]
	mov edi, [esi + 4]
	mov ebp, edx
	mov esi, eax
	xor ebp, edi
	xor esi, ebx
	or esi, ebp
	jne .continue

	mov eax, [ecx + 8]
	mov edx, [esp + 24]
	mov ecx, [ecx + 12]
	cmp eax, [edx + 8]
	sbb ecx, [edx + 12]
	jmp .finish

	align 16
.continue:
	cmp eax, ebx
	sbb edx, edi

.finish:
	setb al

	pop esi
	pop edi
	pop ebx
	pop ebp
	ret





	align 16
uint128_t_operator_above_equal:
	push edi
	push esi
	push ebx
	mov esi, [esp + 16]
	mov edi, [esp + 20]

	sub esp, 8
	push edi
	push esi
	call uint128_t_operator_above
	mov ebx, eax
	pop eax
	pop edx

	push edi
	push esi
	call uint128_t_operator_equal_equal
	add esp, 16
	or eax, ebx

	pop ebx
	pop esi
	pop edi
	ret





	align 16
uint128_t_operator_below_equal:
	push edi
	push esi
	push ebx
	mov esi, [esp + 16]
	mov edi, [esp + 20]

	sub esp, 8
	push edi
	push esi
	call uint128_t_operator_below
	mov ebx, eax
	pop eax
	pop edx

	push edi
	push esi
	call uint128_t_operator_equal_equal
	add esp, 16
	or eax, ebx

	pop ebx
	pop esi
	pop edi
	ret





	align 16
uint128_t_operator_plus:
	push ebx
	push ebp
	mov ecx, [esp + 20]
	mov ebx, [esp + 16]

	mov edx, [ecx + 8]
	add edx, [ebx + 8]
	mov eax, [ecx + 12]
	mov ebp, ebx
	adc eax, [ebx + 12]

	sub ebp, [ebx + 8]
	mov ebp, eax
	sbb ebp, [ebx + 12]
	jae .continue

	mov ebp, 1
	jmp .finish

	align 16
.continue:
	xor ebp

.finish:
	movq xmm3, [ebx]
	movd xmm2, ebp
	movq xmm0, [ecx]
	pxor xmm1
	paddq xmm3, xmm0
	punpckldq xmm2, xmm1
	mov ecx, [esp + 12]
	paddq xmm3, xmm2

	mov [ecx + 8], edx
	movq [ecx], xmm3
	mov [ecx + 12], eax

	pop ebp
	pop ebx
	ret 4





	align 16
uint128_t_operator_plus_equal:
	push edi
	push esi
	push ebx
	mov ecx, [esp + 16]
	mov ebx, [esp + 20]

	movq xmm1, [ecx + 8]
	movq xmm2, [ebx]
	movdqa xmm0, xmm1
	movd esi, xmm1
	psrlq xmm0, 32

	movd eax, xmm0
	movq xmm0, [ebx + 8]
	paddq xmm1, xmm0

	movdqa xmm0, xmm1
	movd edi, xmm1
	psrlq xmm0, 32

	cmp edi, esi
	movd edx, xmm0
	movq xmm0, [ecx]
	sbb edx, eax
	paddq xmm0, xmm2
	movdqa xmm2, [addEqDat]
	jc .noXor

	pxor xmm2

.noXor:
	paddq xmm0, xmm2

	movq [ecx + 8], xmm1
	mov eax, ecx
	movq [ecx], xmm0

	pop ebx
	pop esi
	pop edi
	ret





	align
uint128_t_operator_minus:
	push ebx
	push edi
	push esi

	mov edx, [esp + 20]
	mov ecx, [esp + 24]
	mov eax, [esp + 16]

	mov esi, [edx]
	mov edi, [edx + 4]
	mov ebx, [edx + 12]
	mov edx, [edx + 8]

	sub esi, [ecx]
	sbb edi, [ecx + 4]
	sub edx, [ecx + 8]
	sbb ebx, [ecx + 12]
	setb cl

	movzx ecx, cl
	sub esi, ecx
	sbb edi, 0

	mov [eax], esi
	mov [eax + 4], edi
	mov [eax + 8], edx
	mov [eax + 12], ebx

	pop esi
	pop edi
	pop ebx
	ret 4





	align 16
uint128_t_operator_minus_equal:
	push esi
	push ebx
	sub esp, 20
	mov ebx, [esp + 32]

	mov esi, esp
	sub esp, 4

	push dword [esp + 40]
	push ebx
	push esi
	call uint128_t_operator_minus

	mov [esp], esi
	push ebx
	call uint128_t_operator_equal_const_uint128_t_double_ref

	add esp, 36
	mov eax, ebx
	pop ebx
	pop esi
	ret





	align 16
uint128_t_operator_multiply:
	push ebp
	push ebx
	push edi
	push esi
	sub esp, 44
	mov eax, [esp + 72]
	mov esi, [esp + 68]

	mov ebp, [eax + 8]
	mov ecx, [esi + 8]
	mov ebx, [esi + 12]
	mov edi, eax

	mov eax, ebp
	mov [esp], ebx
	mul ecx

	mov [esp + 40], eax
	mov eax, ebp
	mov [esp + 16], edx
	mul ebx

	mov ebx, [edi + 12]
	mov edi, [esp]
	mov [esp + 36], eax

	mov eax, ebp
	imul ebp, [esi + 4]

	mov esi, [esi]
	mov [esp + 28], edx
	mul esi

	mov [esp + 32], eax
	mov eax, ebx
	mov [esp + 12], edx
	mul ecx

	mov [esp + 4], eax
	mov eax, ebx
	mov [esp + 20], edx
	imul ebx, esi
	mul edi

	mov [esp + 24], eax
	mov eax, [esp + 72]
	mov [esp + 8], edx
	mov esi, [eax]

	mov eax, esi
	imul esi, edi

	mov edi, [esp + 4]
	mul ecx

	mov [esp], edx
	mov edx, [esp + 72]
	imul ecx, [edx + 4]

	xor edx
	add edi, [esp + 16]
	setb dl

	add ecx, [esp]
	add ecx, [esp + 8]
	add ecx, esi

	mov esi, edi
	add ecx, [esp + 12]
	add ecx, ebx

	xor ebx
	add ecx, ebp
	add eax, [esp + 20]
	setb bl

	add eax, [esp + 24]
	adc ebx, 0

	add esi, [esp + 36]
	adc eax, edx

	mov edx, [esp + 64]
	adc ebx, 0
	add eax, [esp + 32]

	mov [edx], eax
	mov eax, [esp + 40]
	adc ebx, ecx

	mov [edx + 4], ebx
	mov [edx + 12], esi
	mov [edx + 8], eax

	mov eax, edx
	add esp, 44
	pop esi
	pop edi
	pop ebx
	pop ebp
	ret 4





	align 16
uint128_t_operator_multiply_equal:
	push esi
	push ebx
	sub esp, 20
	mov ebx, [esp + 32]

	mov esi, esp
	sub esp, 4
	push dword [esp + 40]
	push ebx
	push esi
	call uint128_t_operator_multiply

	mov [esp], esi
	push ebx
	call uint128_t_operator_equal_const_uint128_t_double_ref

	add esp, 36
	mov eax, ebx
	pop ebx
	pop esi
	ret





	align 16
uint128_t_divmod:
	push ebp
	push ebx
	push edi
	push esi
	sub esp, 92
	mov esi, [esp + 124]
	mov edi, [esp + 112]
	mov ebx, [esp + 120]

	mov dword [esp + 4], uint128_1
	mov [esp], esi
	call uint128_t_operator_equal_equal

	test al
	je .checkEqual2

	mov [esp + 4], ebx
	mov [esp], edi
	jmp .do02

	align 16
.checkEqual2:
	mov [esp + 4], esi
	mov [esp], ebx
	call uint128_t_operator_equal_equal

	test al
	je .checkEqual

	mov [esp], edi
	mov dword [esp + 4], uint128_1

.do02:
	call uint128_t_constructor
	mov eax, edi
	mov dword [esp + 4], uint128_0
	jmp .finish

	align 16
.checkEqual:
	mov [esp], ebx
	mov dword [esp + 4], uint128_0
	call uint128_t_operator_equal_equal

	test al
	jne .do03

	mov [esp + 4], esi
	mov [esp], ebx
	mov uint128_t_operator_below

	test al
	je .do0

.do03:
	mov [esp], edi
	mov [esp + 4], uint128_0
	call uint128_t_constructor

	mov eax, edi
	mov [esp + 4], ebx

.finish:
	add eax, 16
	mov [esp], eax
	call uint128_t_constructor
	mov eax, edi

.return:
	add esp, 92
	pop esi
	pop edi
	pop ebx
	pop ebp
	ret 4

	align 16
.do0:
	lea eax, [esp + 40]
	mov dword [esp + 4], uint128_0
	mov [esp], eax
	call uint128_t_constructor

	lea ebp, [esp + 56]
	mov dword [esp + 4], uint128_0
	mov [esp], ebp
	call uint128_t_constructor

	mov [esp], ebx
	call uint128_t_bits

	test al
	je .doMoves

	movzx ebx, al
	lea edi, [esp + 24]
	dec ebx
	jmp .doShifts

	align 16
.loop:
	dec ebx
	cmp bl, -1
	je .return

.doShifts:
	lea eax, [esp + 40]
	mov dword [esp + 4], uint128_1
	mov [esp], eax
	call uint128_t_operator_shiftLeft_equal

	mov [esp], ebp
	mov dword [esp + 4], uint128_1
	call uint128_t_operator_shiftLeft_equal

	mov eax, [esp + 120]
	lea ecx, [esp + 72]

	mov dword [esp + 28], 0
	mov dword [esp + 24], 0
	mov [esp + 32], ebx
	mov dword [esp + 36], 0

	mov [esp + 8], edi
	mov [esp], ecx
	mov [esp + 4], eax
	call uint128_t_operator_shiftRight
	sub esp, 4

	mov eax, [esp + 80]
	mov dword [esp + 28], 0
	mov dword [esp + 24], 0
	mov dword [esp + 36], 0

	mov [esp], edi
	and eax, 1
	mov [esp + 32], eax
	call uint128_t_operator_cast_bool

	test al
	je .skipPlusPlus

	mov [esp], ebp
	call uint128_t_operator_plus_plus

.skipPlusPlus:
	mov [esp + 4], esi
	mov [esp], ebp
	call uint128_t_operator_above_equal

	test al
	je .loop

	mov [esp + 4], esi
	mov [esp], ebp
	call uint128_t_operator_minus_equal

	lea eax, [esp + 40]
	mov [esp], eax
	call uint128_t_operator_plus_plus
	jmp .loop

	align 16
.doMoves:
	mov esi, [esp + 112]
	lea eax, [esp + 40]
	mov [esp + 4], eax
	mov [esp], esi
	call uint128_t_constructor_uint128_t_double_ref

	mov eax, esi
	mov [esp + 4], ebp
	add eax, 16
	mov [esp], eax
	call uint128_t_constructor_uint128_t_double_ref

	mov eax, esi
	jmp .return





	align 16
uint128_t_operator_divide:
	push esi
	push ebx
	sub esp, 36
	mov eax, [esp + 52]
	mov esi, esp
	mov ebx, [esp + 48]

	push dword [esp + 56]
	times 2 push eax
	push esi
	call uint128_t_divmod

	mov [esp], esi
	push ebx
	call uint128_t_constructor_uint128_t_double_ref

	add esp, 52
	mov eax, ebx
	pop ebx
	pop esi
	ret 4





	align 16
uint128_t_operator_divide_equal:
	push esi
	push ebx
	sub esp, 20
	mov ebx, [esp + 32]

	mov esi, esp
	sub esp, 4
	push dword [esp + 40]
	push ebx
	push esi
	call uint128_t_operator_divide

	mov [esp], esi
	push ebx
	call uint128_t_operator_equal_const_uint128_t_double_ref

	add esp, 36
	mov eax, ebx
	pop ebx
	pop esi
	ret





	align 16
uint128_t_operator_modulo:
	push ebx
	sub esp, 40
	mov eax, [esp + 52]
	mov edx, esp
	mov ebx, [esp + 48]

	push dword [esp + 56]
	times 2 push eax
	push edx
	call uint128_t_divmod
	pop eax

	lea eax, [esp + 24]
	push eax
	push ebx
	call uint128_t_constructor_uint128_t_double_ref

	add esp, 56
	mov eax, ebx
	pop ebx
	ret 4





	align 16
uint128_t_operator_modulo_equal:
	push esi
	push ebx
	sub esp, 52
	mov ebx, [esp + 64]

	lea eax, [esp + 16]
	push dword [esp + 68]
	times 2 push ebx
	push eax
	call uint128_t_divmod
	pop eax

	lea eax, [esp + 40]
	push eax
	lea esi, [esp + 12]
	push esi
	call uint128_t_constructor_uint128_t_double_ref
	pop edx
	pop ecx

	push esi
	push ebx
	call uint128_t_operator_equal_const_uint128_t_double_ref

	add esp, 68
	mov eax, ebx
	pop ebx
	pop esi
	ret





	align 16
uint128_t_operator_plus_plus:
	sub esp, 20
	push uint128_1
	push dword [esp + 28]
	call uint128_t_operator_plus_equal

	add esp, 28
	ret





	align 16
uint128_t_operator_plus_plus_int:
	push edi
	sub esp, 24
	mov edi, [esp + 36]

	add esp, 8
	push edi
	push dword [esp + 28]
	call uint128_t_constructor

	add esp, 4
	push edi
	call uint128_t_operator_plus_plus

	add esp, 24
	pop edi
	ret 4





	align 16
uint128_t_operator_minus_minus:
	sub esp, 20
	push uint128_1
	push dword [esp + 28]
	call uint128_t_operator_minus_equal
	add esp, 28
	ret





	align 16
uint128_t_operator_minus_minus_int:
	push edi
	sub esp, 24
	mov edi, [esp + 36]

	add esp, 8
	push edi
	push dword [esp + 28]
	call uint128_t_constructor

	add esp, 4
	push edi
	call uint128_t_operator_minus_minus

	add esp, 24
	pop edi
	ret 4





	align 16
uint128_t_operator_single_plus:
	sub esp, 20
	times 2 push dword [esp + 28]
	call uint128_t_constructor
	add esp, 28
	ret 4





	align 16
uint128_t_operator_single_minus:
	push ebp
	sub esp, 24
	mov eax, [esp + 36]

	sub esp, 16
	lea ebp, [esp + 16]
	mov [esp], ebp
	mov [esp + 4], eax
	call uint128_t_operator_not

	sub esp, 4
	mov eax, [esp + 48]
	mov [esp], eax
	mov [esp + 4], ebp
	mov [esp + 8], uint128_1
	call uint128_t_operator_plus

	add esp, 36
	pop ebp
	ret 4





	align 16
uint128_t_upper:
	mov eax, [esp + 4]
	ret





	align 16
uint128_t_lower:
	mov eax, [esp + 4]
	add eax, 8
	ret





	align 16
uint128_t_bits:
	push esi
	mov edx, [esp + 8]

	mov ecx, [edx]
	mov eax, [edx + 4]
	mov esi, ecx
	or esi, eax
	je .noUpper

	bsr ecx
	bsr edx, eax
	xor ecx, 0x1F
	xor edx, 0x1F
	add cl, 32
	test eax
	mov al, -0x80
	jmp .finish

	align 16
.noUpper:
	mov ecx, [edx + 8]
	mov eax, [edx + 12]

	mov edx, ecx
	or edx, eax
	je .ret0

	bsr ecx
	bsr edx, eax
	xor ecx, 0x1F
	xor edx, 0x1F
	add cl, 32
	test eax
	mov al, 0x40

.finish:
	movzx ecx, cl
	cmovne ecx, edx

	sub al, cl
	pop esi
	ret

	align 16
.ret0:
	xor eax
	pop esi
	ret
