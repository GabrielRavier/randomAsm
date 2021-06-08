; implement tosaddeax

add8:
    jsr pusha
    lda (sp)
    clc
    ldy #1
    adc (sp), y
    ldx #0
    jmp incsp2





add8s:
    jsr pusha
    ldy #1
    ldx #0
    lda (sp), y
    bpl .noDex

    dex

.noDex:
    sta ptr1
    stx ptr1+1
    ldx #0
    bpl .noDex2

    dex

.noDex2:
    adc ptr1
    pha
    txa
    adc ptr1+1
    pla
    ldx #0
    cmp #$80
    bcc .noDex3

    dex

.noDex3:
    jmp incsp2





add16:
add16s:
    jsr pushax
    ldy #2
    lda (sp), y
    clc
    adc (sp)
    pha
    iny
    lda (sp), y
    ldy #1
    adc (sp), y
    tax
    pla
    jmp incsp4





add32:
add32s:
    jsr pusheax
    ldy #7
    jsr ldeaxysp
    jsr pusheax
    ldy #7
    jsr ldeaxysp
    jsr tosaddeax
    jmp incsp8
