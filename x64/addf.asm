global addflt
global adddbl
global addldbl
global addcflt
global addcflt
global addcdbl
global addcldbl

section .text align=16

%macro mkAdd 2

    align 16
%1:
    %2 xmm0, xmm1
    ret

%endmacro

    mkAdd addflt, vaddss
    mkAdd adddbl, vaddsd





    align 16
addldbl:
    fld tword [rsp + 8]
    fld tword [rsp + 24]
    faddp st1, st0
    ret





    mkAdd addcflt, vaddps





    align 16
addcdbl:
    vaddsd xmm0, xmm2, xmm0
    vaddsd xmm1, xmm3, xmm1
    ret





    align 16
addcldbl:
    fld tword [rsp + 8]
    fld tword [rsp + 40]
    faddp st1, st0

    fld tword [rsp + 24]
    fld tword [rsp + 56]
    faddp st1, st0
    fxch st1
    ret
