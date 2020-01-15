global and8
global and8s
global and16
global and16s
global and32
global and32s
global and64
global and64s
global and128
global and128s

section .text align=16

    align 16
and8:
and8s:
and16:
and16s:
and32:
and32s:
    mov eax, edi
    and eax, esi
    ret





    align 16
and64:
and64s:
    mov rax, rdi
    and rax, rsi
    ret





    align 16
and128:
and128s:
    mov rax, rdi
    and rsi, rcx
    and rax, rdx
    mov rdx, rsi
    ret
