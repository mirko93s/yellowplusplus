INCLUDE "engine/menus/settings.asm"

OptionsMenu_TextSpeed:
	call GetTextSpeed
	ldh a, [hJoy5]
	bit 4, a ; right
	jr nz, .pressedRight
	bit 5, a
	jr nz, .pressedLeft
	jr .nonePressed
.pressedRight
	ld a, c
	and a
	jr nz, .decrease
	ld c, $4
.decrease
	dec c
	ld a, d
	jr .save
.pressedLeft
	ld a, c
	cp $3
	jr c, .increase
	ld c, $ff
.increase
	inc c
	ld a, e
.save
	ld b, a
	ld a, [wOptions]
	and ~TEXT_SPEED_MASK
	or b
	ld [wOptions], a
.nonePressed
	ld b, $0
	ld hl, TextSpeedStringsPointerTable
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	call SettingsValuePosition
	call PlaceString
	and a
	ret

TextSpeedStringsPointerTable:
	dw WarpText ; $0 - 0
	dw FastText ; $1 - 1
	dw MidText  ; $2 - 3
	dw SlowText ; $3 - 5
WarpText:
	db "Warp@"
FastText:
	db "Fast@"
MidText:
	db "Mid @"
SlowText:
	db "Slow@"

GetTextSpeed:
	ld a, [wOptions]
	and TEXT_SPEED_MASK
	cp $5
	jr z, .slowTextOption
	cp $1
	jr z, .fastTextOption
	cp $0
	jr z, .warpTextOption
; mid text option
	ld c, $2
	lb de, 1, 5
	ret
.slowTextOption
	ld c, $3
	lb de, 3, 0
	ret
.fastTextOption
	ld c, $1
	lb de, 0, 3
	ret
.warpTextOption
	ld c, $0
	lb de, 5, 1
	ret

OptionsMenu_BattleAnimations:
	ldh a, [hJoy5]
	and D_RIGHT | D_LEFT
	jr nz, .asm_41d33
	ld a, [wOptions]
	and $80 ; mask other bits
	jr .asm_41d3b
.asm_41d33
	ld a, [wOptions]
	xor $80
	ld [wOptions], a
.asm_41d3b
	ld bc, $0
	sla a
	rl c
	ld hl, AnimationOptionStringsPointerTable
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	call SettingsValuePosition
	call PlaceString
	and a
	ret

AnimationOptionStringsPointerTable:
	dw AnimationOnText
	dw AnimationOffText

AnimationOnText:
	db "On @"
AnimationOffText:
	db "Off@"

OptionsMenu_BattleStyle:
	ldh a, [hJoy5]
	and D_LEFT | D_RIGHT
	jr nz, .asm_41d6b
	ld a, [wOptions]
	and $40 ; mask other bits
	jr .asm_41d73
.asm_41d6b
	ld a, [wOptions]
	xor $40
	ld [wOptions], a
.asm_41d73
	ld bc, $0
	sla a
	sla a
	rl c
	ld hl, BattleStyleOptionStringsPointerTable
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	call SettingsValuePosition
	call PlaceString
	and a
	ret

BattleStyleOptionStringsPointerTable:
	dw BattleStyleShiftText
	dw BattleStyleSetText

BattleStyleShiftText:
	db "Shift@"
BattleStyleSetText:
	db "Set  @"

OptionsMenu_SpeakerSettings:
	ld a, [wExtraOptions]
	and 3
	ld c, a
	ldh a, [hJoy5]
	bit BIT_D_RIGHT, a
	jr nz, .right
	bit BIT_D_LEFT, a
	jr z, .draw
	dec c
	jr .save
.right
	inc c
.save
	ld a, c
	and 3
	ld c, a
	ld a, [wExtraOptions]
	and $fc
	or c
	ld [wExtraOptions], a
	xor a
	ldh [rNR51], a
.draw
	ld b, 0
	ld hl, SpeakerOptionStringsPointerTable
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	call SettingsValuePosition
	call PlaceString
	and a
	ret

SpeakerOptionStringsPointerTable:
	dw MonoSoundText
	dw Earphone1SoundText
	dw Earphone2SoundText
	dw Earphone3SoundText

MonoSoundText:
	db "Mono@"
Earphone1SoundText:
	db "Ear1@"
Earphone2SoundText:
	db "Ear2@"
Earphone3SoundText:
	db "Ear3@"

OptionsMenu_GBPrinterBrightness:
	call Func_41e7b
	ldh a, [hJoy5]
	bit BIT_D_RIGHT, a
	jr nz, .increaseLight
	bit BIT_D_LEFT, a
	jr nz, .decreaseLight
	jr .asm_41e32
.decreaseLight
	ld a, c
	cp $4
	jr c, .asm_41e22
	ld c, $ff
.asm_41e22
	inc c
	ld a, e
	jr .asm_41e2e
.increaseLight
	ld a, c
	and a
	jr nz, .asm_41e2c
	ld c, $5
.asm_41e2c
	dec c
	ld a, d
.asm_41e2e
	ld b, a
	ld [wPrinterSettings], a
.asm_41e32
	ld b, $0
	ld hl, GBPrinterOptionStringsPointerTable
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	call SettingsValuePosition
	call PlaceString
	and a
	ret

GBPrinterOptionStringsPointerTable:
	dw LightestPrintText
	dw LighterPrintText
	dw NormalPrintText
	dw DarkerPrintText
	dw DarkestPrintText

LightestPrintText:
	db "+2  @"
LighterPrintText:
	db "+1  @"
NormalPrintText:
	db "Base@"
DarkerPrintText:
	db "-1  @"
DarkestPrintText:
	db "-2  @"

Func_41e7b:
	ld a, [wPrinterSettings]
	and a
	jr z, .asm_41e93
	cp $20
	jr z, .asm_41e99
	cp $60
	jr z, .asm_41e9f
	cp $7f
	jr z, .asm_41ea5
	ld c, $2
	lb de, $20, $60
	ret
.asm_41e93
	ld c, $0
	lb de, $7f, $20
	ret
.asm_41e99
	ld c, $1
	lb de, $0, $40
	ret
.asm_41e9f
	ld c, $3
	lb de, $40, $7f
	ret
.asm_41ea5
	ld c, $4
	lb de, $60, $0
	ret

OptionsMenu_Font:
	ldh a, [hJoy5]
	and D_LEFT | D_RIGHT
	jr z, .draw
	ld a, [wExtraOptions]
	xor 1 << BIT_FONT_OG
	ld [wExtraOptions], a
	call .draw
	call Delay3 ; let the updated value reach VRAM before loading the font
	call LoadFontTilePatterns
	and a
	ret
.draw
	ld de, .current
	ld a, [wExtraOptions]
	bit BIT_FONT_OG, a
	jr z, .place
	ld de, .original
.place
	call SettingsValuePosition
	call PlaceString
	and a
	ret
.current
	db "Nes@"
.original
	db "OG @"

OptionsMenu_Dummy:
	and a
	ret

OptionsMenu_Frame:
	ld a, [wTextboxFrame]
	cp NUM_TEXTBOX_FRAMES
	jr c, .valid
	xor a
	ld [wTextboxFrame], a
.valid
	ld c, a
	ldh a, [hJoy5]
	bit BIT_D_RIGHT, a
	jr nz, .right
	bit BIT_D_LEFT, a
	jr z, .draw
	ld a, c
	and a
	jr nz, .left
	ld c, NUM_TEXTBOX_FRAMES
.left
	dec c
	jr .save
.right
	inc c
	ld a, c
	cp NUM_TEXTBOX_FRAMES
	jr c, .save
	ld c, 0
.save
	ld a, c
	ld [wTextboxFrame], a
	call LoadTextBoxTilePatterns ; preview immediately without clearing the menu
.draw
	call SettingsValuePosition
	ld a, [wTextboxFrame]
	inc a
	ld b, '0'
.tens
	cp 10
	jr c, .digits
	sub 10
	inc b
	jr .tens
.digits
	ld [hl], b
	inc hl
	add '0'
	ld [hli], a
	ld [hl], ' '
	and a
	ret

OptionsMenu_ColorCorrection:
    ldh a, [hJoy5]
    ld b, a
    ld a, [wOptions]
    and COLOR_MODE_MASK
    swap a
    ld c, a
    ld a, b
    and D_RIGHT
    jr z, .checkLeft
    inc c
    ld a, c
    cp 4
    jr c, .store
    ld c, 0
    jr .store
.checkLeft
    ld a, b
    and D_LEFT
    jr z, .draw
    ld a, c
    and a
    jr nz, .decrement
    ld c, 4
.decrement
    dec c
.store
    ld a, c
    swap a
    ld b, a
    ld a, [wOptions]
    and %11001111
    or b
    ld [wOptions], a
    call RunDefaultPaletteCommand
.draw
    ld a, [wOptions]
    and COLOR_MODE_MASK
    swap a
    ld c, a
    ld b, 0
    ld hl, ColorModeStringsPointerTable
    add hl, bc
    add hl, bc
    ld e, [hl]
    inc hl
    ld d, [hl]
    call SettingsValuePosition
    call PlaceString
    and a
    ret

ColorModeStringsPointerTable:
    dw UncorrectedText
    dw GBCText
    dw DMGText
	dw BWText

UncorrectedText:
    db "None@"
GBCText:
    db "GBC @"
DMGText:
    db "DMG @"
BWText:
    db "B/W @"
