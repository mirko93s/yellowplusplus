; Shared compact Options/Cheats navigation and rendering.
DisplayOptionMenu_:
	xor a
	jr DisplaySettingsMenu
DisplayCheatMenu_:
	ld a, 1
DisplaySettingsMenu:
	ld [wSettingsMenuKind], a
	ld a, [wStatusFlags5]
	push af
	or 1 << 6 ; settings strings render immediately
	ld [wStatusFlags5], a
	xor a
	ld [wCurrentPage], a
	ld [wOptionsCursorLocation], a
	ld [wSettingsFooter], a
	hlcoord 0, 0
	lb bc, SCREEN_HEIGHT - 2, SCREEN_WIDTH - 2
	call TextBoxBorder
	call DrawSettingsPage
.loop
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	and B_BUTTON | START
	jp nz, .exit
	ldh a, [hJoy5]
	bit BIT_D_DOWN, a
	jr nz, .down
	bit BIT_D_UP, a
	jr nz, .up
	and D_LEFT | D_RIGHT | A_BUTTON
	jp z, .delay ; idle frames do not need to redraw values or the cursor
	ld a, [wOptionsCursorLocation]
	ld b, a
	ld a, [wSettingsRowCount]
	cp b
	jr z, .footer
	call GetOptionPointer
	call SettingsUpdateCursor
	jp .delay
.down
	ld hl, wOptionsCursorLocation
	ld a, [wSettingsRowCount]
	cp [hl]
	jr nz, .increment
	ld [hl], 0
	jr .cursor
.increment
	inc [hl]
	jr .cursor
.up
	ld hl, wOptionsCursorLocation
	ld a, [hl]
	and a
	jr nz, .decrement
	ld a, [wSettingsRowCount]
	inc a
	ld [hl], a
.decrement
	dec [hl]
.cursor
	xor a
	ld [wSettingsFooter], a ; vertical navigation always enters Exit
.updateCursor
	call SettingsUpdateCursor
	jp .delay
.footer
	call SettingsPageCount
	cp 1
	jr z, .activate
	ldh a, [hJoy5]
	bit BIT_D_RIGHT, a
	jr nz, .footerRight
	bit BIT_D_LEFT, a
	jr z, .activate
	ld hl, wSettingsFooter
	ld a, [hl]
	and a
	jr nz, .footerLeft
	ld [hl], 3
.footerLeft
	dec [hl]
	jr .updateCursor
.footerRight
	ld hl, wSettingsFooter
	inc [hl]
	ld a, [hl]
	cp 3
	jr c, .updateCursor
	ld [hl], 0
	jr .updateCursor
.activate
	ldh a, [hJoy5]
	and A_BUTTON
	jr z, .delay
	ld a, [wSettingsFooter]
	and a
	jr z, .exit
	call SettingsPageCount
	ld c, a
	ld a, [wCurrentPage]
	ld b, a
	ld a, [wSettingsFooter]
	cp 2
	ld a, b
	jr z, .next
	and a
	jr nz, .previous
	ld a, c
.previous
	dec a
	jr .page
.next
	inc a
	cp c
	jr c, .page
	xor a
.page
	ld [wCurrentPage], a
	ld a, $ff ; redraw clamps this to the new page's footer row
	ld [wOptionsCursorLocation], a
	call DrawSettingsPage
.delay
	call Delay3
	jp .loop
.exit
	pop af
	ld [wStatusFlags5], a
	ret
SettingsItemCount:
	ld a, [wSettingsMenuKind]
	and a
	ld a, (OptionsLabels.end - OptionsLabels) / 2
	ret z
	ld a, (CheatSettings.end - CheatSettings) / 3
	ret

SettingsPageCount:
	call SettingsItemCount
	ld b, 0
.loop
	inc b
	sub SETTINGS_PAGE_SIZE
	jr z, .done
	jr nc, .loop
.done
	ld a, b
	ret

SettingsPageOffset:
	ld a, [wCurrentPage]
	ld b, a
	and a
	ret z
	xor a
.loop
	add SETTINGS_PAGE_SIZE
	dec b
	jr nz, .loop
	ret

SettingsItemIndex:
	call SettingsPageOffset
	ld b, a
	ld a, [wOptionsCursorLocation]
	add b
	ret

GetOptionPointer:
	ld a, [wSettingsMenuKind]
	and a
	jp nz, SettingsCheatValue
	call SettingsItemIndex
	ld e, a
	ld d, 0
	ld hl, OptionMenuJumpTable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

OptionMenuJumpTable:
	dw OptionsMenu_TextSpeed
	dw OptionsMenu_BattleAnimations
	dw OptionsMenu_BattleStyle
	dw OptionsMenu_SpeakerSettings
	dw OptionsMenu_GBPrinterBrightness
	dw OptionsMenu_ColorCorrection
	dw OptionsMenu_Frame
	dw OptionsMenu_Font

SettingsValuePosition:
	push bc
	push de
	call SettingsItemIndex
	ld e, a
	ld d, 0
	ld hl, SettingsValueColumns
	add hl, de
	ld e, [hl]
	ld d, 0
	hlcoord 0, 3
	add hl, de
	ld a, [wOptionsCursorLocation]
	ld bc, SCREEN_WIDTH
	call AddNTimes
	pop de
	pop bc
	ret
SettingsValueColumns:
	db 14, 14, 14, 14, 14, 14, 14, 14

DrawSettingsPage:
	ld a, [wOptionsCursorLocation]
	push af ; preserve focus while using the cursor byte to render rows
	xor a
	ldh [hAutoBGTransferEnabled], a
	hlcoord 1, 1
	lb bc, SCREEN_HEIGHT - 2, SCREEN_WIDTH - 2
	call ClearScreenArea ; preserve the border on every page change
	ld de, .options
	ld a, [wSettingsMenuKind]
	and a
	jr z, .title
	ld de, .cheats
.title
	hlcoord 2, 1
	call PlaceString
	call SettingsPageCount
	cp 1
	jr z, .rows
	ld b, a
	ld a, [wCurrentPage]
	add '1'
	hlcoord 15, 1
	ld [hli], a
	ld a, '/'
	ld [hli], a
	ld a, b
	add '0'
	ld [hl], a
.rows
	call SettingsItemCount
	ld c, a
	call SettingsPageOffset
	ld b, a
	ld a, c
	sub b
	cp SETTINGS_PAGE_SIZE + 1
	jr c, .count
	ld a, SETTINGS_PAGE_SIZE
.count
	ld [wSettingsRowCount], a
	xor a
	ld [wOptionsCursorLocation], a
	ldh [hJoy5], a ; redraw must never adjust settings
.row
	call SettingsItemIndex
	ld e, a
	ld d, 0
	ld hl, OptionsLabels
	ld a, [wSettingsMenuKind]
	and a
	jr z, .optionLabel
	ld hl, CheatSettings
	add hl, de
.optionLabel
	add hl, de
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	hlcoord 2, 3
	ld a, [wOptionsCursorLocation]
	ld bc, SCREEN_WIDTH
	call AddNTimes
	call PlaceString
	call GetOptionPointer
	ld hl, wOptionsCursorLocation
	inc [hl]
	ld a, [wSettingsRowCount]
	cp [hl]
	jr nz, .row
	hlcoord 2, 16
	ld de, .exit
	call PlaceString
	call SettingsPageCount
	cp 1
	jr z, .finish
	hlcoord 8, 16
	ld de, .previous
	call PlaceString
	hlcoord 14, 16
	ld de, .next
	call PlaceString
.finish
	pop af
	ld b, a
	ld a, [wSettingsRowCount]
	cp b
	jr nc, .restoreCursor
	ld b, a
.restoreCursor
	ld a, b
	ld [wOptionsCursorLocation], a
	call SettingsUpdateCursor
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	jp Delay3
.options
	db "Options@"
.cheats
	db "Cheats@"
.exit
	db "Exit@"
.previous
	db "Prev@"
.next
	db "Next@"

SettingsUpdateCursor:
	hlcoord 1, 3
	ld de, SCREEN_WIDTH
	ld c, SETTINGS_PAGE_SIZE
.clear
	ld [hl], ' '
	add hl, de
	dec c
	jr nz, .clear
	hlcoord 1, 16
	ld [hl], ' '
	hlcoord 7, 16
	ld [hl], ' '
	hlcoord 13, 16
	ld [hl], ' '
	ld a, [wOptionsCursorLocation]
	ld b, a
	ld a, [wSettingsRowCount]
	cp b
	jr z, .footer
	hlcoord 1, 3
	ld a, b
	ld bc, SCREEN_WIDTH
	call AddNTimes
	jr .place
.footer
	hlcoord 1, 16
	ld a, [wSettingsFooter]
	ld bc, 6
	call AddNTimes
.place
	ld [hl], '▶'
	ret

OptionsLabels:
	dw .speed, .animation, .style, .sound, .print, .color, .frame, .font
.end
.speed
	db "Text Speed@"
.animation
	db "Animation@"
.style
	db "Battle@"
.sound
	db "Sound@"
.print
	db "Print Light@"
.color
	db "Color Corr.@"
.frame
	db "Frame@"
.font
	db "Font@"

CheatSettings:
; Battle effects and capture.
	dw .hp
	db CHEAT_HP | CHEAT_SCOPED
	dw .pp
	db CHEAT_PP
	dw .ohko
	db CHEAT_OHKO | CHEAT_SCOPED
	dw .critical
	db CHEAT_CRITICAL | CHEAT_SCOPED
	dw .accuracy
	db CHEAT_ACCURACY | CHEAT_SCOPED
	dw .super
	db CHEAT_SUPER_EFFECTIVE | CHEAT_SCOPED
	dw .status
	db CHEAT_STATUS | CHEAT_SCOPED
	dw .catch
	db CHEAT_CATCH
; Reward multipliers.
	dw .exp
	db $80
	dw .money
	db $81
; Teaching, items, movement and Safari.
	dw .learn
	db CHEAT_LEARN_ANY
	dw .items
	db CHEAT_ITEMS
	dw .walls
	db CHEAT_WALLS
	dw .safari
	db CHEAT_SAFARI
; Wild/new mon generation (keep the exclusive DV settings adjacent).
	dw .shiny
	db CHEAT_SHINY
	dw .perfect
	db CHEAT_PERFECT_DVS
	dw .encounters
	db CHEAT_ENCOUNTERS
	dw .wildLevel
	db CHEAT_WILD_LEVEL_SETTING
	dw .wildSpecies
	db CHEAT_WILD_SPECIES_SETTING
.end
.shiny
	db "All Shiny@"
.perfect
	db "Perfect DVs@"
.exp
	db "EXP Boost@"
.catch
	db "100% Catch@"
.pp
	db "Infinite PP@"
.hp
	db "Infinite HP@"
.ohko
	db "1-hit KO@"
.critical
	db "Always Crit@"
.accuracy
	db "Never Miss@"
.money
	db "Money Boost@"
.walls
	db "B: No Clip@"
.items
	db "Inf. Items@"
.encounters
	db "No Wild Mons@"
.status
	db "No Status@"
.super
	db "Super Eff.@"
.learn
	db "Learn Any TM@"
.safari
	db "Inf. Safari@"
.wildLevel
	db "Wild Level@"
.wildSpecies
	db "Next WildMon@"

SettingsCheatValue:
	call SettingsItemIndex
	ld e, a
	ld d, 0
	ld hl, CheatSettings + 2
	add hl, de
	add hl, de
	add hl, de
	ld a, [hl]
	cp CHEAT_WILD_LEVEL_SETTING
	jp nc, SettingsWildValue
	bit 7, a
	jp nz, .multiplier
	ld d, a ; bit 6 selects Off/User/Enemy/Both
	and $0f
	ld e, a
	ld hl, wCheatFlags
	cp 8
	jr c, .mask
	inc hl
	sub 8
.mask
	ld b, a
	ld a, 1
	inc b
.shift
	dec b
	jr z, .input
	add a
	jr .shift
.input
	ld b, a
	ld c, 0
	ld a, [hl]
	and b
	jr z, .enemyValue
	inc c
.enemyValue
	bit 6, d
	jr z, .changeValue
	push hl
	push de
	ld de, wEnemyCheatFlags - wCheatFlags
	add hl, de
	ld a, [hl]
	and b
	pop de
	pop hl
	jr z, .changeValue
	set 1, c
.changeValue
	ldh a, [hJoy5]
	and D_LEFT | D_RIGHT
	jr z, .flagText
	ldh a, [hJoy5]
	bit BIT_D_LEFT, a
	jr z, .flagIncrease
	dec c
	jr .flagWrap
.flagIncrease
	inc c
.flagWrap
	ld a, c
	and 3
	bit 6, d
	jr nz, .flagStore
	and 1
.flagStore
	ld c, a
	ld a, b
	cpl
	and [hl]
	bit 0, c
	jr z, .storePlayer
	or b
.storePlayer
	ld [hl], a
	bit 6, d
	jr z, .exclusive
	push de
	ld de, wEnemyCheatFlags - wCheatFlags
	add hl, de
	ld a, b
	cpl
	and [hl]
	bit 1, c
	jr z, .storeEnemy
	or b
.storeEnemy
	ld [hl], a
	pop de
.exclusive
	bit 0, c
	jr z, .flagText
	ld a, e
	cp CHEAT_SHINY
	jr z, .disablePerfect
	cp CHEAT_PERFECT_DVS
	jr nz, .flagText
	ld hl, wCheatFlags
	res CHEAT_SHINY, [hl]
	jr .redraw
.disablePerfect
	ld hl, wCheatFlags + 1
	res CHEAT_PERFECT_DVS - 8, [hl]
.redraw
	jp DrawSettingsPage ; also update the adjacent mutually exclusive value
.flagText
	ld hl, .toggleValues
	bit 6, d
	jr z, .valuePointer
	ld hl, .sideValues
.valuePointer
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	jp .draw
.multiplier
	and 1
	ld b, a
	ld a, [wCheatMultipliers]
	bit 0, b
	jr z, .expValue
	rrca
	rrca
	rrca
.expValue
	and 7
	ld c, a
	ldh a, [hJoy5]
	bit BIT_D_RIGHT, a
	jr nz, .increase
	bit BIT_D_LEFT, a
	jr z, .multiplierText
	ld a, c
	and a
	jr nz, .decrease
	ld c, 5
.decrease
	dec c
	jr .store
.increase
	inc c
	ld a, c
	cp 5
	jr c, .store
	ld c, 0
.store
	ld a, c
	bit 0, b
	jr nz, .storeMoney
	ld b, a
	ld a, [wCheatMultipliers]
	and $f8
	or b
	jr .save
.storeMoney
	add a
	add a
	add a
	ld b, a
	ld a, [wCheatMultipliers]
	and $c7
	or b
.save
	ld [wCheatMultipliers], a
.multiplierText
	ld b, 0
	ld hl, .multipliers
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
.draw
	call SettingsCheatValuePosition
	push hl
	ld b, 4
.clearValue
	ld [hl], ' '
	inc hl
	dec b
	jr nz, .clearValue
	pop hl
	call PlaceString
	and a
	ret
.toggleValues
	dw .off, .on
.sideValues
	dw .off, .user, .enemy, .both
.user
	db "User@"
.enemy
	db "Foe@"
.both
	db "Both@"
.off
	db "Off@"
.on
	db "On@"
.multipliers
	dw .off, .x2, .x3, .x4, .x8
.x2
	db "x2@"
.x3
	db "x3@"
.x4
	db "x4@"
.x8
	db "x8@"

SettingsCheatValuePosition:
	hlcoord 15, 3
	ld a, [wOptionsCursorLocation]
	ld bc, SCREEN_WIDTH
	call AddNTimes
	ret

SettingsWildValue:
	ld hl, wCheatWildLevel
	cp CHEAT_WILD_LEVEL_SETTING
	ld b, 255
	jr z, .input
	ld hl, wCheatWildSpecies
	ld b, NUM_POKEMON_INDEXES
.input
	ldh a, [hJoy5]
	bit BIT_D_RIGHT, a
	jr nz, .increase
	bit BIT_D_LEFT, a
	jr z, .draw
	ld a, [hl]
	and a
	jr nz, .decrease
	ld a, b
	inc a
.decrease
	dec a
	jr .validate
.increase
	ld a, [hl]
	cp b
	jr c, .increment
	ld a, $ff
.increment
	inc a
.validate
	ld c, a
	ld a, b
	cp 255
	ld a, c
	jr nz, .store
	cp 1
	jr nz, .store
	ldh a, [hJoy5]
	and D_RIGHT
	jr z, .store ; Left from 2 skips 1 and selects Off
	ld a, 2
.store
	ld [hl], a
.draw
	ld d, h
	ld e, l
	call SettingsCheatValuePosition
	push hl
	ld c, 4
.clear
	ld [hl], ' '
	inc hl
	dec c
	jr nz, .clear
	pop hl
	ld a, [de]
	and a
	jr z, .off
	lb bc, LEADING_ZEROES | 1, 3
	jp PrintNumber
.off
	ld de, .offText
	jp PlaceString
.offText
	db "Off@"
