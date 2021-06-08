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
	mov eax, [esp, 4]
	andn eax, eax, [esp + 8]
	ret





	align 16
__blsi_u32:
	blsi eax, [esp + 4]
	ret





	align 16
__blsmsk_u32:
	blsmsk eax, [esp + 4]
	ret





	align 16
__blsr_u32:
	blsr eax, [esp + 4]
	ret





	align 16
__andn_u64:
	mov eax, [esp + 4]
	mov ecx, [esp + 8]
	andn eax, [esp + 12]
	andn ecx, [esp + 16]
	ret





	align 16
__blsi_u64:
	vmovq xmm1, [esp + 4]
	vpxor xmm0
	vpsubq xmm0, xmm1
	vpand xmm0, xmm1
	vmovd eax, xmm0
	vpextrd edx, xmm0, 1
	ret





	align 16
__blsmsk_u64:
	vmovq xmm1, [esp + 4]
	vpcmpeqd xmm0
	vpaddq xmm0, xmm1, xmm0
	vpxor xmm0, xmm1
	vmovd eax, xmm0
	vpextrd edx, xmm0, 1
	ret





	align 16
__blsr_u64:
	vmovq xmm1, [esp + 4]
	vpcmpeqd xmm0
	vpaddq xmm0, xmm1, xmm0
	vpand xmm0, xmm1
	vmovd eax, xmm0
	vpextrd edx, xmm0, 1
	ret
