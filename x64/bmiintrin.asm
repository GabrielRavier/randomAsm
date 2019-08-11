global __andn_u32
global __blsi_u32
global __blsmsk_u32
global __blsr_u32
global __andn_u64
global __blsi_u64
global __blsmsk_u64
global __blsr_u64

section .text align=16

	align 16
__andn_u32:
	andn eax, edi, esi
	ret





	align 16
__blsi_u32:
	blsi eax, edi
	ret





	align 16
__blsmsk_u32:
	blsmsk eax, edi
	ret





	align 16
__blsr_u32:
	blsr eax, edi
	ret





	align 16
__andn_u64:
	andn rax, rdi, rsi
	ret





	align 16
__blsi_u64:
	blsi rax, rdi
	ret





	align 16
__blsmsk_u64:
	blsmsk rax, rdi
	ret





	align 16
__blsr_u64:
	blsr rax, rdi
	ret
