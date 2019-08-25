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

section .rodata align=16

	xmmDat dd 0, 1, 0, 0

section .text align=16

	align 16
__blcfill_u32:
	mov edx, [esp + 4]
	lea eax, [edx + 1]
	and eax, edx
	ret
	
	
	
	
	
	align 16
__blci_u32:
	mov edx, [esp + 4]
	lea eax, [edx + 1]
	not eax
	or eax, edx
	ret
	
	
	
	
	
	align 16
__blcic_u32:
	mov eax, [esp + 4]
	lea edx, [eax + 1]
	andn eax, edx
	ret
	
	
	
	
	
	align 16
__blcmsk_u32:
	mov edx, [esp + 4]
	lea eax, [edx + 1]
	xor eax, edx
	ret
	
	
	
	
	
	align 16
__blcs_u32:
	mov edx, [esp + 4]
	lea eax, [edx + 1]
	or eax, edx
	ret
	
	
	
	
	
	align 16
__blsfill_u32:
	mov edx, [esp + 4]
	lea eax, [edx - 1]
	or eax, edx
	ret
	
	
	
	
	
	align 16
__blsic_u32:
	mov edx, [esp + 4]
	mov ecx, edx
	not ecx
	lea eax, [edx - 1]
	or eax, ecx
	ret
	
	
	
	
	
	align 16
__t1mskc_u32:
	mov edx, [esp + 4]
	mov ecx, edx
	not ecx
	lea eax, [edx + 1]
	or eax, ecx
	ret
	
	
	
	
	
	align 16
__tzmsk_u32:
	mov eax, [esp + 4]
	lea edx, [eax - 1]
	andn eax, edx
	ret
	
	
	
	
	
	align 16
__blcfill_u64:
	vmovq xmm1, [esp + 4]
	vmovdqa64 xmm0, [xmmDat]
	vpaddq xmm0, xmm1, xmm0
	vpand xmm0, xmm1
	
	vmovd eax, xmm0
	vpextrd edx, xmm0, 1
	ret
	
	
	
	
	
	align 16
__blci_u64:
	vmovq xmm1, [esp + 4]
	vmovdqa64 xmm0, [xmmDat]
	vpaddq xmm0, xmm1, xmm0
	vpternlogq xmm0, 0x55
	vpor xmm0, xmm1
	
	vmovd eax, xmm0
	vpextrd edx, xmm0, 1
	ret
	
	
	
	
	
	align 16
__blcic_u64:
	vmovq xmm0, [esp + 4]
	vmovdqa64 xmm1, [xmmDat]
	vpaddq xmm1, xmm0, xmm1
	vpandn xmm0, xmm1
	
	vmovd eax, xmm0
	vpextrd edx, xmm0, 1
	ret
	
	
	
	
	
	align 16
__blcmsk_u64:
	vmovq xmm1, [esp + 4]
	vmovdqa64 xmm0, [xmmDat]
	vpaddq xmm0, xmm1, xmm0
	vpxor xmm0, xmm1
	
	vmovd eax, xmm0
	vpextrd edx, xmm0, 1
	ret
	
	
	
	
	
	align 16
__blcs_u64:
	vmovq xmm1, [esp + 4]
	vmovdqa64 xmm0, [xmmDat]
	vpaddq xmm0, xmm1, xmm0
	vpor xmm0, xmm1
	vmovd eax, xmm0
	vpextrd edx, xmm0, 1
	ret
	
	
	
	
	
	align 16
__blsfill_u64:
	vmovq xmm1, [esp + 4]
	vpcmpeqd xmm0
	vpaddq xmm0, xmm1, xmm0
	vpor xmm0, xmm1
	
	vmovd eax, xmm0
	vpextrd edx, xmm0, 1
	ret
	
	
	
	
	
	align 16
__blsic_u64:
	vmovq xmm1, [esp + 4]
	vpcmpeqd xmm2
	vpternlogq xmm0, xmm1, 0x55
	vpaddq xmm1, xmm2
	vpor xmm0, xmm1
	
	vmovd eax, xmm0
	vpextrd edx, xmm0, 1
	ret
	
	
	
	
	
	align 16
__t1mskc_u64:
	vmovq xmm1, [esp + 4]
	vmovdqa64 xmm2, [xmmDat]
	vpternlogq xmm0, xmm1, 0x55
	vpaddq xmm1, xmm2
	vpor xmm0, xmm1
	
	vmovd eax, xmm0
	vpextrd edx, xmm0, 1
	ret
	
	
	
	
	
	align 16
__tzmsk_u64:
	vmovq xmm0, [esp + 4]
	vpcmpeqd xmm1
	vpaddq xmm1, xmm0, xmm1
	vpandn xmm0, xmm1
	vmovd eax, xmm0
	vpextrd edx, xmm0, 1
	ret