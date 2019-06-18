global sync_fetch_and_add_32
global sync_add_and_fetch_32
global sync_bool_compare_and_swap_32
global sync_val_compare_and_swap_32
global sync_synchronize
global sync_lock_test_and_set_32
global sync_lock_release_32

section .text align=16

	align 16
sync_fetch_and_add_32:
	mov edx, [esp + 4]
	mov eax, [esp + 8]
	lock xadd [edx], eax
	ret





	align 16
sync_add_and_fetch_32:
	mov ecx, [esp + 4]
	mov edx, [esp + 8]

	mov eax, edx
	lock xadd [ecx], eax
	add eax, edx
	ret





	align 16
sync_bool_compare_and_swap_32:
	mov edx, [esp + 4]
	mov eax, [esp + 8]
	mov ecx, [esp + 12]

	lock cmpxchg [edx], ecx
	sete al

	ret





	align 16
sync_val_compare_and_swap_32:
	mov edx, [esp + 4]
	mov eax, [esp + 8]
	mov ecx, [esp + 12]
	lock cmpxchg [edx], ecx
	ret





	align 16
sync_synchronize:
	mfence
	ret





	align 16
sync_lock_test_and_set_32:
	mov edx, [esp + 4]
	mov eax, [esp + 8]
	xchg eax, [edx]
	ret





	align 16
sync_lock_release_32:
	mov eax, [esp + 4]
	mov dword [eax], 0
	ret
