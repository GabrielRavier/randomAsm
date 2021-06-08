global __blcfill_u32
global __blci_u32
global __blcic_u32
global __blcmsk_u32
global __blcs_u32
global __blsfill_u32
global __blsic_u32
global __t1mskc_u32
global __tzmsk_u32
global __blcfill_u64
global __blci_u64
global __blcic_u64
global __blcmsk_u64
global __blcs_u64
global __blsfill_u64
global __blsic_u64
global __t1mskc_u64
global __tzmsk_u64

section .text align=16

	align 16
__blcfill_u32:
	lea eax, [rdi + 1]
	and eax, edi
	ret
	
	
	
	
	
	align 16
__blci_u32:
	lea eax, [rdi + 1]
	not eax
	or eax, edi
	ret
	
	
	
	
	
	align 16
__blcic_u32:
	lea eax, [rdi + 1]
	andn eax, edi, eax
	ret
	
	
	
	
	
	align 16
__blcmsk_u32:
	lea eax, [rdi + 1]
	xor eax, edi
	ret
	
	
	
	
	
	align 16
__blcs_u32:
	lea eax, [rdi + 1]
	or eax, edi
	ret
	
	
	
	
	
	align 16
__blsfill_u32:
	lea eax, [rdi - 1]
	or eax, edi
	ret
	
	
	
	
	
	align 16
__blsic_u32:
	mov edx, edi
	not edx
	lea eax, [rdi - 1]
	or eax, edx
	ret
	
	
	
	
	
	align 16
__t1mskc_u32:
	mov edx, edi
	not edx
	lea eax, [rdi + 1]
	or eax, edx
	ret
	
	
	
	
	
	align 16
´__tzmsk_u32:
	lea eax, [rdi - 1]
	andn eax, edi, eax
	ret
	
	
	
	
	
	align 16
__blcfill_u64:
	lea rax, [rdi + 1]
	and rax, rdi
	ret
	
	
	
	
	
	align 16
__blci_u64:
	lea rax, [rdi + 1]
	not rax
	or rax, rdi
	ret
	
	
	
	
	
	align 16
__blcic_u64:
	lea rax, [rdi + 1]
	andn rax, rdi, rax
	ret
	
	
	
	
	
	align 16
__blcmsk_u64:
	lea rax, [rdi + 1]
	xor rax, rdi
	ret
	
	
	
	
	
	align 16
__blcs_u64:
	lea rax, [rdi + 1]
	or rax, rdi
	ret
	
	
	
	
	
	align 16
__blsfill_u64:
	lea rax, [rdi - 1]
	or rax, rdi
	ret
	
	
	
	
	
	align 16
__blsic_u64:
	mov rdx, rdi
	not rdx
	lea rax, [rdi - 1]
	or rax, rdi
	ret
	
	
	
	
	
	align 16
__t1mskc_u64:
	mov rdx, rdi
	not rdx
	lea rax, [rdi + 1]
	or rax, rdx
	ret
	
	
	
	
	
	align 16
__tzmsk_u64:
	lea rax, [rdi - 1]
	andn rax, rdi, rax
	ret