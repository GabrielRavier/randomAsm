global RGBtoHSL
global RGBtoHCT
global HueToLetter
global lightnessToLetter
global RGBtoLetter
global getICCUint16
global getICCUint32
global getICCInt32
global getICC15Fixed16
global getICC16Fixed16

section .text align=16

    align 16
RGBtoHSL:
    push rbp
    push r15
    push r14
    push rbx
    mov r10d, ebx
    cmp sil, r10b
    mov ebx, edx
    cmova ebx, esi
    cmovb edx, esi

    cmp ebx, edi
    mov r15d, edi
    cmova r15d, ebx

    cmp edx, edi
    cmovae edx, edi

    mov r11d, r15d
    sub r11d, edx
    jne .noQuickEnd

    mov byte [r8], 0
    mov byte [rcx], 0
    mov [r9], dil
    jmp .return

    align 16
.noQuickEnd:
    add edx, r15d
    mov r14d, edx
    shr r14d, 1
    mov [r9], r14b

    mov eax, r11d
    shl eax, 8
    sub eax, r11d

    mov ebp, 0x200
    sub ebp, ebx
    test r14b, r14b
    cmovns ebp, edx
    cdq
    idiv ebp
    mov [r8], al

    cmp bl, dil
    jbe .div1

    cmp r15d, esi
    jne .div1Plus400

    sub r10d, edi
    mov eax, r10d
    shl eax, 8
    sub eax, r10d
    cdq
    idiv r11d

    add eax, 0x200
    jmp .doDiv6

    align 16
.div1:
    sub esi, r10d
    mov eax, esi
    shl eax, 8
    sub eax, esi
    cdq
    idiv r11d
    jmp .doDiv6

    align 16
.div1Plus400:
    sub edi, esi
    mov eax, edi
    shl eax, 8
    sub eax, edi
    cdq
    idiv r11d
    add eax, 0x400

.doDiv6:
    cdqe
    imul rax, 0x2AAAAAAB
    mov rdx, rax
    shr rdx, 0x3F
    shr rax, 0x20
    add eax, edx
    mov [rcx], al

.return:
    pop rbx
    pop r14
    pop r15
    pop rbp
    ret





    align 16
RGBtoHCT:
    push r15
    push r14
    push r12
    push rbx
    push rax
    mov r14, r9
    mov r15, r8

    cmp sil, dl
    mov r12d, esi
    cmovb r12d, edx

    cmp r12d, edi
    cmovbe r12d, edi

    cmp dl, sil
    mov ebx, esi
    cmovb ebx, edx

    cmp ebx, edi
    cmovae ebx, edi
    call RGBtoHSL

    mov eax, r12d
    sub eax, edx
    mov [r15], al
    cmp al, -1
    jne .continue

    xor eax, eax
    jmp .return

    align 16
.continue:
    mov eax, ebx
    shl eax, 8
    sub eax, ebx
    neg r12d
    lea ecx, [rbx + r12]
    add ecx, 0xFF
    cdq
    idiv ecx

.return:
    mov [r14], al
    add rsp, 8
    pop r12
    pop r14
    pop r15
    ret





%macro HueToLetterMakeMovCmp 3

    lea edx, [rdi - %1]
    mov eax, %2
    cmp edx, %3
    jbe .return

%endmacro

    align 16
HueToLetter:
    lea edx, [rdi - 11]
    mov eax, 82
    cmp edx, 232
    ja .return

    mov eax, 79
    cmp edx, 20
    ja .continue

.return:
    ret

    align 16
.continue:
    HueToLetterMakeMovCmp 32, 89, 20
    HueToLetterMakeMovCmp 53, 76, 20
    HueToLetterMakeMovCmp 74, 71, 21
    HueToLetterMakeMovCmp 96, 84, 20
    HueToLetterMakeMovCmp 117, 67, 20
    HueToLetterMakeMovCmp 138, 65, 20
    HueToLetterMakeMovCmp 159, 66, 21
    HueToLetterMakeMovCmp 181, 86, 20

    sub edi, 202
    cmp edi, 21
    sbb eax, eax
    and eax, 7
    add eax, 70
    ret





%macro lightnessToLetterMakeMovCmp 2

    mov al, %1
    cmp edi, %2
    jl .return

%endmacro

    align 16
lightnessToLetter:
    lightnessToLetterMakeMovCmp 32, 16
    lightnessToLetterMakeMovCmp 46, 48
    lightnessToLetterMakeMovCmp 58, 80
    lightnessToLetterMakeMovCmp 45, 112
    lightnessToLetterMakeMovCmp 33, 144
    lightnessToLetterMakeMovCmp 42, 176
    lightnessToLetterMakeMovCmp 43, 208

    cmp edi, 240
    mov ecx, 61
    mov eax, 35
    cmovl eax, ecx

.return:
    ret





