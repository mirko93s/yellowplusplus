; See data/gender_ratios.asm

; Used to define gender ratios
DEF MALE_ONLY         EQU $00
DEF MALE_88_PERCENT   EQU $1F
DEF MALE_75_PERCENT   EQU $3F
DEF SAME_BOTH_GENDERS EQU $7F
DEF FEMALE_75_PERCENT EQU $BF
DEF FEMALE_ONLY       EQU $FE
DEF NO_GENDER         EQU $FF

; used when returning a Pokemon's gender
DEF GENDERLESS EQU $00
DEF MALE       EQU $01
DEF FEMALE     EQU $02 