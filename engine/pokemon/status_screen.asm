GetStringPointer:
	ld a, [wMonDataLocation]
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMonDataLocation]
	cp DAYCARE_DATA
	ret z
	ld a, [wWhichPokemon]
	jp SkipFixedLengthTextEntries

PrintGenderStatusScreen:
	ld de, wLoadedMonDVs
	farcall GetMonGender
	ld a, [wGenderTemp]
	and a
	ret z
	dec a
	ld a, '♂'
	jr z, .ok
	ld a, '♀'
.ok
	coord hl, 15, 1
	ld [hl], a
	ret

PrintShinySymbol:
	ld de, wLoadedMonDVs
	callfar IsMonShiny
	ret z
	coord hl, 16, 1
	ld [hl], '⁂'
	ret

NumText:
	db "№@"
; Predef 0x37
StatusScreen:
	call LoadMonData
	ld a, [wMonDataLocation]
	cp BOX_DATA
	jr c, .DontRecalculate
; mon is in a box or daycare
	ld a, [wLoadedMonBoxLevel]
	ld [wLoadedMonLevel], a
	ld [wCurEnemyLevel], a
	ld hl, wLoadedMonHPExp - 1
	ld de, wLoadedMonStats
	ld b, $1
	call CalcStats ; Recalculate stats
.DontRecalculate
	ld hl, wStatusFlags2
	set 1, [hl]
	ld a, $33
	ldh [rNR50], a ; Reduce the volume
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	call UpdateSprites
	call LoadHpBarAndStatusTilePatterns
	; new status_screen.png
	; 6f-7e arrows
	; 75-76 unselected page
	; 77-78 selected page
	; 79 vertical line
	; 7a horizontal line
	; 7b top line
	; 7c mid line
	; 6d-7d bottom corners (left-right)
	ld de, StatusScreenTile
	ld hl, vChars2 tile $6d
	lb bc, BANK(StatusScreenTile), 18
	call CopyVideoDataDouble ; bold P (for PP)
	ldh a, [hTileAnimations]
	push af
	xor a
	ldh [hTileAnimations], a	
	; menu arrows
	hlcoord 10, 6
	ld [hl], $6f
	hlcoord 19, 6
	ld [hl], $7e
	; pokemon level
	hlcoord 10, 3
	call PrintLevel
	; Pokémon name
	ld hl, NamePointers2
	call GetStringPointer
	ld d, h
	ld e, l
	hlcoord 10, 4
	call PlaceString
	; shiny
	call PrintShinySymbol
	; gender
	ld a, [wLoadedMonSpecies]
	ld [wGenderTemp], a
	call PrintGenderStatusScreen
	; pokemon index
	ld a, [wMonHIndex]
	ld [wPokedexNum], a
	ld [wCurSpecies], a
	hlcoord 11, 1
	ld de, wPokedexNum
	lb bc, LEADING_ZEROES | 1, 3
	call PrintNumber
	; index "#"
	ld de, NumText
	hlcoord 10, 1
	call PlaceString
	; get hp bar color
	; get correct pokemon palette (shiny or not)
	ld de, wLoadedMonDVs
	callfar IsMonShiny
	ld hl, wShinyMonFlag
	jr nz, .shiny
	res 0, [hl]
	jr .setPal
.shiny
	set 0, [hl]
.setPal
	ld hl, wStatusScreenHPBarColor
	call GetHealthBarColor
	ld b, SET_PAL_STATUS_SCREEN
	call RunPaletteCommand
	; pokemon sprite
	call Delay3
	call GBPalNormal
	hlcoord 1, 0
	call LoadFlippedFrontSpriteByMonIndex ; draw Pokémon picture
	; cry
	ld a, [wMonDataLocation]
	cp ENEMY_PARTY_DATA
	jr z, .playRegularCry
	cp BOX_DATA
	jr z, .checkBoxData
	callfar IsThisPartymonStarterPikachu_Party
	jr nc, .playRegularCry
	jr .playPikachuSoundClip
.checkBoxData
	callfar IsThisPartymonStarterPikachu_Box
	jr nc, .playRegularCry
.playPikachuSoundClip
	ld e, 16
	callfar PlayPikachuSoundClip
	jr .continue
.playRegularCry
	ld a, [wCurPartySpecies]
	call GetCryData
	call PlaySound ; use PlaySound instead of PlayCry so we don't need to wait for the cry to finish before browsing menus
.continue
	pop af
	ret

NamePointers2:
	dw wPartyMonNicks
	dw wEnemyMonNicks
	dw wBoxMonNicks
	dw wDayCareMonName

ClearStatusScreen:
	; clear bottom half
	hlcoord 0, 8
	lb bc, 10, 20
	call ClearScreenArea
	; reset middle line
	ld b, SCREEN_WIDTH
	hlcoord 0, 7
	call DrawHorizontalLine
	ret

Page0: ; hp, status, type/s, stats
	xor a
	ld [wCurrentPage], a
	call ClearStatusScreen
	; vertical line
	ld b, 10
	hlcoord 10, 8
	call DrawVerticalLine
	hlcoord 10, 7
	ld [hl], $7b
	; stats
	ld d, $0
	call PrintStatsBox
	; HP bar
	hlcoord 0, 8
	predef DrawHP
	; menu pages
	hlcoord 11, 6
	ld [hl], $77
	hlcoord 12, 6
	ld [hl], $78
	hlcoord 13, 6
	ld [hl], $75
	hlcoord 14, 6
	ld [hl], $76
	hlcoord 15, 6
	ld [hl], $75
	hlcoord 16, 6
	ld [hl], $76
	hlcoord 17, 6
	ld [hl], $75
	hlcoord 18, 6
	ld [hl], $76
	; "TYPE/"
	hlcoord 1, 14
	ld de, TypesText
	call PlaceString
	; Pokémon types
	ld a, [wMonHIndex]
	ld [wCurSpecies], a
	hlcoord 2, 15
	predef PrintMonType
	; "STATUS/"
	hlcoord 1, 11
	ld de, StatusText
	call PlaceString
	; actual pokemon status
	hlcoord 7, 12
	ld de, wLoadedMonStatus
	call PrintStatusCondition
	ret nz
	hlcoord 7, 12
	ld de, OKText
	call PlaceString ; "OK"
	ret

DrawHP:
; Draws the HP bar in the stats screen
	call GetPredefRegisters
	ld a, $1
	jr DrawHP_

DrawHP2:
; Draws the HP bar in the party screen
	call GetPredefRegisters
	ld a, $2

DrawHP_:
	ld [wHPBarType], a
	push hl
	ld a, [wLoadedMonHP]
	ld b, a
	ld a, [wLoadedMonHP + 1]
	ld c, a
	or b
	jr nz, .nonzeroHP
	xor a
	ld c, a
	ld e, a
	ld a, $6
	ld d, a
	jp .drawHPBarAndPrintFraction
.nonzeroHP
	ld a, [wLoadedMonMaxHP]
	ld d, a
	ld a, [wLoadedMonMaxHP + 1]
	ld e, a
	predef HPBarLength
	ld a, $6
	ld d, a
	ld c, a
.drawHPBarAndPrintFraction
	pop hl
	push de
	push hl
	push hl
	call DrawHPBar
	pop hl
	ldh a, [hUILayoutFlags]
	bit 0, a
	jr z, .printFractionBelowBar
	ld bc, $9 ; right of bar
	jr .printFraction
.printFractionBelowBar
	ld bc, SCREEN_WIDTH + 1 ; below bar
.printFraction
	add hl, bc
	ld de, wLoadedMonHP
	lb bc, 2, 3
	call PrintNumber
	ld a, '/'
	ld [hli], a
	ld de, wLoadedMonMaxHP
	lb bc, 2, 3
	call PrintNumber
	pop hl
	pop de
	ret

PrintStatsBox:
	ld a, d
	and a ; a is 0 from the status screen
	jr nz, .DifferentBox
	hlcoord 11, 8 ; Start printing stats from here
	ld bc, $1a ; Number offset
	jr PrintNormalStats
.DifferentBox
	hlcoord 9, 0
	lb bc, 10, 9
	call TextBoxBorder
	hlcoord 11, 1
	ld bc, $18
	; fall through
PrintNormalStats:
	push bc
	push hl
	ld de, StatsText
	call PlaceString
	pop hl
	pop bc
	add hl, bc
	ld de, wLoadedMonAttack
	lb bc, 2, 3
	; set 6, b ; left aligned
	call PrintStat
	ld de, wLoadedMonDefense
	call PrintStat
	ld de, wLoadedMonSpeed
	call PrintStat
	ld de, wLoadedMonSpclAtk
	call PrintStat
	ld de, wLoadedMonSpclDef
	jp PrintNumber
	ret

TypesText:
	db   "TYPE/@"
StatusText:
	db   "STATUS/@"
OKText:
	db	 "OK@"
StatsText:
	db   "ATTACK"
	next "DEFENSE"
	next "SPEED"
	next "SP.ATK"
	next "SP.DEF@"

Page1: ; xp, ot-id
	ld a, 1
	ld [wCurrentPage], a
	call ClearStatusScreen
	; menu pages
	hlcoord 11, 6
	ld [hl], $75
	hlcoord 12, 6
	ld [hl], $76
	hlcoord 13, 6
	ld [hl], $77
	hlcoord 14, 6
	ld [hl], $78
	hlcoord 15, 6
	ld [hl], $75
	hlcoord 16, 6
	ld [hl], $76
	hlcoord 17, 6
	ld [hl], $75
	hlcoord 18, 6
	ld [hl], $76
	; lines
	ld b, 10
	hlcoord 9, 8
	call DrawVerticalLine
	hlcoord 9, 7
	ld [hl], $7b
	; texts
	hlcoord 1, 10
	ld de, OTText
	call PlaceString
	hlcoord 1, 13
	ld de, IDText
	call PlaceString
	hlcoord 10, 10
	ld de, XPPointsText
	call PlaceString
	hlcoord 11, 13
	ld de, LevelUpText
	call PlaceString
	; ot
	ld hl, OTPointers
	call GetStringPointer
	ld d, h
	ld e, l
	hlcoord 2, 11
	call PlaceString
	; id
	hlcoord 2, 14
	ld de, wLoadedMonOTID
	lb bc, LEADING_ZEROES | 2, 5
	call PrintNumber
	; next level
	ld a, [wLoadedMonLevel]
	push af
	cp MAX_LEVEL
	jr z, .Level100
	inc a
	ld [wLoadedMonLevel], a ; Increase temporarily if not 100
.Level100
	hlcoord 15, 14
	ld [hl], '<to>'
	inc hl
	; inc hl
	call PrintLevel
	pop af
	ld [wLoadedMonLevel], a
	; backup exp
	ld hl, wLoadedMonExp
	ld a, [hli]
	push af
	ld a, [hli]
	push af
	ld a, [hl]
	push af
	; total exp
	ld de, wLoadedMonExp
	hlcoord 12, 11
	lb bc, 3, 7
	call PrintNumber ; exp
	; exp to levelup
	call CalcExpToLevelUp
	ld de, wLoadedMonExp
	hlcoord 8, 14
	lb bc, 3, 7
	call PrintNumber ; exp needed to level up
	; restore backedup exp
	pop af
	ld hl, wLoadedMonExp+2
	ld [hl], a
	pop af
	ld hl, wLoadedMonExp+1
	ld [hl], a
	pop af
	ld hl, wLoadedMonExp
	ld [hl], a
	ret

CalcExpToLevelUp:
	ld a, [wLoadedMonLevel]
	cp MAX_LEVEL
	jr z, .atMaxLevel
	inc a
	ld d, a
	callfar CalcExperience
	ld hl, wLoadedMonExp + 2
	ldh a, [hExperience + 2]
	sub [hl]
	ld [hld], a
	ldh a, [hExperience + 1]
	sbc [hl]
	ld [hld], a
	ldh a, [hExperience]
	sbc [hl]
	ld [hld], a
	ret
.atMaxLevel
	ld hl, wLoadedMonExp
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

OTPointers:
	dw wPartyMonOT
	dw wEnemyMonOT
	dw wBoxMonOT
	dw wDayCareMonOT

XPPointsText:
	db   "XP POINTS@"
LevelUpText:
	db   "LEVEL UP@"
OTText:
	db   "OT/@"
IDText:
	db   "<ID>№/@"

Page2:
	ld a, 2
	ld [wCurrentPage], a
	call ClearStatusScreen
	; menu pages
	hlcoord 11, 6
	ld [hl], $75
	hlcoord 12, 6
	ld [hl], $76
	hlcoord 13, 6
	ld [hl], $75
	hlcoord 14, 6
	ld [hl], $76
	hlcoord 15, 6
	ld [hl], $77
	hlcoord 16, 6
	ld [hl], $78
	hlcoord 17, 6
	ld [hl], $75
	hlcoord 18, 6
	ld [hl], $76
	; text
	hlcoord 0, 8
	ld de, MovesText
	call PlaceString
	; lines
	ld b, SCREEN_WIDTH
	hlcoord 0, 9
	call DrawHorizontalLine
	ld b, 10
	hlcoord 13, 8
	call DrawVerticalLine
	hlcoord 13, 7
	ld [hl], $7b
	hlcoord 13, 9
	ld [hl], $7c
	; moves
	ld bc, NUM_MOVES + 1
	ld hl, wMoves
	call FillMemory
	ld hl, wLoadedMonMoves
	ld de, wMoves
	ld bc, NUM_MOVES
	call CopyData
	callfar FormatMovesString
	hlcoord 1, 10
	ld de, wMovesString
	call PlaceString ; Print moves
	ld a, [wNumMovesMinusOne]
	inc a
	ld c, a
	ld a, $4
	sub c
	ld b, a ; Number of moves ?
	hlcoord 14, 10
	ld de, SCREEN_WIDTH * 2
	ld a, ' '
	call StatusScreen_PrintPP ; Print "PP"
	ld a, b
	and a
	jr z, .InitPP
	ld c, a
	ld a, '-'
	call StatusScreen_PrintPP ; Fill the rest with --
	; pps
	.InitPP
	ld hl, wLoadedMonMoves
	decoord 14, 10
	ld b, 0
.PrintPP
	ld a, [hli]
	and a
	jr z, .PPDone
	push bc
	push hl
	push de
	ld hl, wCurrentMenuItem
	ld a, [hl]
	push af
	ld a, b
	ld [hl], a
	push hl
	callfar GetMaxPP
	pop hl
	pop af
	ld [hl], a
	pop de
	pop hl
	push hl
	ld bc, wPartyMon1PP - wPartyMon1Moves - 1
	add hl, bc
	ld a, [hl]
	and $3f
	ld [wStatusScreenCurrentPP], a
	ld h, d
	ld l, e
	push hl
	ld de, wStatusScreenCurrentPP
	lb bc, 1, 2
	call PrintNumber
	ld a, '/'
	ld [hli], a
	ld de, wMaxPP
	lb bc, 1, 2
	call PrintNumber
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	ld d, h
	ld e, l
	pop hl
	pop bc
	inc b
	ld a, b
	cp $4
	jr nz, .PrintPP
.PPDone
	ret

StatusScreen_PrintPP:
; print PP or -- c times, going down two rows each time
	ld [hli], a
	ld [hld], a
	add hl, de
	dec c
	jr nz, StatusScreen_PrintPP
	ret

MovesText:
	db	 "    MOVES       <BOLD_P><BOLD_P>@"

Page3:
	ld a, 3
	ld [wCurrentPage], a
	call ClearStatusScreen
	; menu pages
	hlcoord 11, 6
	ld [hl], $75
	hlcoord 12, 6
	ld [hl], $76
	hlcoord 13, 6
	ld [hl], $75
	hlcoord 14, 6
	ld [hl], $76
	hlcoord 15, 6
	ld [hl], $75
	hlcoord 16, 6
	ld [hl], $76
	hlcoord 17, 6
	ld [hl], $77
	hlcoord 18, 6
	ld [hl], $78
	; texts
	hlcoord 1, 8
	ld de, DvText
	call PlaceString
	; lines
	ld b, 5
	hlcoord 6, 9
	call DrawHorizontalLine

	ld b, 10
	hlcoord 8, 8
	call DrawVerticalLine
	
	ld a, $7b
	hlcoord 5, 7
	ld [hl], a
	hlcoord 8, 7
	ld [hl], a
	hlcoord 11, 7
	ld [hl], a
	
	ld a, $79
	hlcoord 5, 8
	ld [hl], a
	hlcoord 8, 8
	ld [hl], a
	hlcoord 11, 8
	ld [hl], a

	hlcoord 8, 9
	ld [hl], $7c
	hlcoord 5, 9
	ld [hl], $6d
	hlcoord 11, 9
	ld [hl], $7d
	; parse dvs
	call PrintDVs
	; parse evs
	call PrintEVs
	ret

DvText:
	db	 "HP   DV EV"
	next "ATTACK     HP SPEED"
	next "DEFENSE                       ATK S.ATK"
	next "SPEED"
	next "SPECIAL   DEF S.DEF@"

DVParse:
	push hl
	push bc
	ld hl, wStatusScreenDVs
	ld b, $00
	ld a, [wLoadedMonDVs] ; attack
	swap a
	and $0F
	ld [hl], a
	inc hl
	and $01
	sla a
	sla a
	sla a
	or b
	ld b, a
	ld a, [wLoadedMonDVs] ; defense
	and $0F
	ld [hl], a
	inc hl
	and $01
	sla a
	sla a
	or b
	ld b, a
	ld a, [wLoadedMonDVs + 1] ; speed
	swap a
	and $0F
	ld [hl], a
	inc hl
	and $01
	sla a
	or b
	ld b, a
	ld a, [wLoadedMonDVs + 1] ; special
	and $0F
	ld [hl], a
	inc hl
	and $01
	or b
	ld b, a
	ld [hl], b	;hp
	pop bc
	pop hl
	ret

PrintDVs:
	call DVParse
	hlcoord 1, 9
	lb bc, 1, 2
	ld de, wStatusScreenHPDVs ; hp
	call PrintStat
	hlcoord 6, 11
	ld de, wStatusScreenDVs ; attack
	call PrintStat
	hlcoord 6, 13
	ld de, wStatusScreenDVs + 1 ; defense
	call PrintStat
	hlcoord 6, 15
	ld de, wStatusScreenDVs + 2 ; speed
	call PrintStat
	hlcoord 6, 17
	ld de, wStatusScreenDVs + 3 ; special
	jp PrintNumber
	ret

PrintEVs:
	lb bc, 2, 5
	hlcoord 9, 11
	ld de, wLoadedMonHPExp ; hp
	call PrintStat
	hlcoord 9, 14
	ld de, wLoadedMonAttackExp ; attack
	call PrintStat
	hlcoord 9, 17
	ld de, wLoadedMonDefenseExp ; defense
	call PrintStat
	hlcoord 15, 11
	ld de, wLoadedMonSpeedExp ; speed
	call PrintStat
	hlcoord 15, 14
	ld de, wLoadedMonSpclAtkExp ; sp.atk
	call PrintStat
	hlcoord 15, 17
	ld de, wLoadedMonSpclDefExp ; sp.def
	jp PrintNumber
	ret	

StatusScreenTile: INCBIN "gfx/battle/status_screen.1bpp"

; Draws a vertical line starting from hl long b
DrawVerticalLine:
	ld de, SCREEN_WIDTH ; New line
.PrintVerticalLine	
	ld [hl], $79 ; │
	add hl, de
	dec b
	jr nz, .PrintVerticalLine
	ret
; Draws a horizontal line starting from hl long b
DrawHorizontalLine:	
	ld [hl], $7a ; -
	inc hl
	dec b
	jr nz, DrawHorizontalLine
	ret

PrintStat:
	push hl
	call PrintNumber
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	ret

; used for bill's pc and cable club
StatusScreenOriginal:
	call StatusScreenLoop
	call LoadHpBarAndStatusTilePatterns
	ret

ExitStatusScreen:
	pop af
	ldh [hTileAnimations], a
	ld hl, wStatusFlags2
	res 1, [hl]
	ld a, $77
	ldh [rNR50], a
	call GBPalWhiteOut
	jp ClearScreen

StatusScreenLoop:
	ldh a, [hTileAnimations]
	push af
	xor a
	ld [wCurrentPage], a
	call StatusScreen
	call Page0
.loop
	call WaitForButtonPress
    ldh a, [hJoy5]
	bit BIT_B_BUTTON, a
	jp nz, ExitStatusScreen
    bit BIT_D_LEFT, a
    jr nz, .prevPage
    bit BIT_D_RIGHT, a
    jr nz, .nextPage
	; if pc is open up-down scrolling is disabled
	ld a, [wMiscFlags]
	bit 3, a
	jr nz, .loop
	ldh a, [hJoy5]
	bit BIT_D_UP, a
    jr nz, .prevMon
    bit BIT_D_DOWN, a
    jr nz, .nextMon
	jr .loop
.prevPage
	ld a, [wCurrentPage]
	dec a
	cp $ff
	jr nz, .ok
	ld a, 3
	jr .ok
.nextPage
	ld a, [wCurrentPage]
	inc a
	cp 4
	jr nz, .ok
	xor a
	; fallthrough
.ok
	ld [wCurrentPage], a
	ld hl, .pagesTable
	call CallFunctionInTable
	jr .loop
.pagesTable:
	dw Page0
	dw Page1
	dw Page2
	dw Page3
.prevMon
    ld a, [wWhichPokemon]
    and a
    jr nz, .decrease
    ld a, [wPartyCount]
    dec a
    jr .reloadPage
.decrease
    dec a
	jr .reloadPage
.nextMon
    ld a, [wWhichPokemon]
    ld c, a
    ld a, [wPartyCount]
	dec a
	cp c
	jr nz, .increase
	xor a
    jr .reloadPage
.increase
	ld a, [wWhichPokemon]
    inc a
.reloadPage
    ld [wWhichPokemon], a
	call StatusScreen
	ld a, [wCurrentPage]
	jr .ok

WaitForButtonPress:
    ld b, BIT_D_UP | BIT_D_DOWN | BIT_D_LEFT | BIT_D_RIGHT | BIT_B_BUTTON
.waitLoop
    call JoypadLowSensitivity
    ldh a, [hJoy5]
    and b
    jr z, .waitLoop
    ret

