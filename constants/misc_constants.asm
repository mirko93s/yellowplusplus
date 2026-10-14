; Boolean checks
DEF FALSE EQU 0
DEF TRUE  EQU 1

; flag operations
	const_def
	const FLAG_RESET ; 0
	const FLAG_SET   ; 1
	const FLAG_TEST  ; 2

; wOptions
DEF TEXT_SPEED_MASK EQU %00001111

; wExtraOptions: bits 0-1 = sound, bit 2 = original font, bit 3 = always run
DEF BIT_FONT_OG EQU 2
DEF BIT_ALWAYS_RUN EQU 3
DEF TEXT_DELAY_FAST   EQU %001 ; 1
DEF TEXT_DELAY_MEDIUM EQU %011 ; 3
DEF TEXT_DELAY_SLOW   EQU %101 ; 5

DEF NUM_TEXTBOX_FRAMES EQU 15
DEF TEXTBOX_FRAME_TILES EQU 7 ; six border tiles and the blank space tile

; bits 4-5 = color mode
DEF COLOR_MODE_SHIFT       EQU 4
DEF COLOR_MODE_MASK        EQU %00110000
DEF COLOR_MODE_UNCORRECTED EQU 0
DEF COLOR_MODE_GBC         EQU 1
DEF COLOR_MODE_DMG         EQU 2
DEF COLOR_MODE_DMG_GRAY    EQU 3

    const_def 6
    const BIT_BATTLE_SHIFT     ; 6
    const BIT_BATTLE_ANIMATION ; 7
