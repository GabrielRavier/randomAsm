tosaddeax:
    clc

    adc (sp)
    ldy #1

    sta tmp1
    txa
    adc (sp), y
    tax
    iny
    lda sreg
    adc (sp), y
    sta sreg
    iny
    lda sreg+1
    adc (sp), y
    sta sreg+1
    lda tmp1
    jmp addysp1
