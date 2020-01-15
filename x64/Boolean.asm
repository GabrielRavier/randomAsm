global BooleanToString
global BooleanEquals
global BooleanCompareTo
extern strdup

section .rodata align=16

    align 16
    falseString db "False", 0

    align 16
    trueString db "True", 0

section .text align=16

    align 16
BooleanToString:
    test dil, dil
    jne .true

    mov edi, falseString
    jmp strdup

    align 16
.true:
    mov edi, trueString
    jmp strdup





    align 16
BooleanEquals:
    cmp dil, sil
    sete al
    ret





    align 16
BooleanCompareTo:
    xor esi, rdi
    lea eax, [rdi + rdi - 1]
    cmove eax, esi
    ret
