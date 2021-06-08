global add8
global add8s
global add16
global add16s
global add32
global add32s
global add64
global add64s
global add128
global add128s

section .text align=16

	align 16
add8:
add8s:
add16:
add16s:
add32:
add32s:
add64:
add64s:
	lea rax, [rdi + rsi]
	ret





	align 16
add128:
add128s:
	mov rax, rdi
	add rax, rdx
	add rsi, rcx
	mov rdx, rsi
	ret
