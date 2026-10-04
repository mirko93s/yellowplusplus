; Temporary attributes live in unused CGB bank 1 graphics space, with rVBK = 1.
DEF vMoveLearningAttributeBackup EQU $8000

DrawMoveLearningMenu::
	xor a
	call MoveLearningAttributes
	hlcoord 0, 0
	lb bc, 12, 18
	call TextBoxBorder
	hlcoord 1, 1
	ld de, .heading
	call PlaceString
	ld hl, wMoves
	decoord 2, 2
	ld b, NUM_MOVES
.name
	ld a, [hli]
	push hl
	push bc
	push de
	ld [wNamedObjectIndex], a
	call GetMoveName
	pop hl
	push hl
	call PlaceString
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	ld d, h
	ld e, l
	pop bc
	pop hl
	dec b
	jr nz, .name
	hlcoord 1, 10
	ld de, .newMove
	call PlaceString
	ld a, [wMoveNum]
	ld [wNamedObjectIndex], a
	call GetMoveName
	hlcoord 2, 11
	call PlaceString
	farcall PrintLearningMoveStats
	ldh a, [hGBC]
	and a
	ret z
	farcall SetMoveLearningDetailsPalette
	jp GrayMoveLearningDetails
.heading
	db "Forget which move?@"
.newMove
	db "New move:@"

HandleMoveLearningInput::
	ldh a, [hUILayoutFlags]
	res 2, a ; descriptions use two rows with a blank row between them
	ldh [hUILayoutFlags], a
	xor a
	ld [wPartyMenuAnimMonEnabled], a
.draw
	; The last row is a preview of the incoming move, not a replacement slot.
	hlcoord 1, 2
	ld [hl], ' '
	hlcoord 1, 4
	ld [hl], ' '
	hlcoord 1, 6
	ld [hl], ' '
	hlcoord 1, 8
	ld [hl], ' '
	hlcoord 1, 11
	ld [hl], ' '
	ld a, [wCurrentMenuItem]
	add a
	ld c, a
	ld b, 0
	ld hl, .cursorPositions
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld [hl], '▶'
	call DrawLearningMoveDescription
	call Delay3
.input
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	bit BIT_B_BUTTON, a
	ret nz
	bit BIT_A_BUTTON, a
	jr nz, .select
	bit BIT_D_UP, a
	jr nz, .up
	bit BIT_D_DOWN, a
	jr z, .input
	ld a, [wCurrentMenuItem]
	inc a
	cp NUM_MOVES + 1
	jr c, .changed
	xor a
	jr .changed
.up
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .decrement
	ld a, NUM_MOVES + 1
.decrement
	dec a
.changed
	ld [wCurrentMenuItem], a
	jr .draw
.select
	ld a, [wCurrentMenuItem]
	cp NUM_MOVES
	jr z, .input
	ld a, SFX_PRESS_AB
	call PlaySound
	ret
.cursorPositions
	dw wTileMap + 2 * SCREEN_WIDTH + 1
	dw wTileMap + 4 * SCREEN_WIDTH + 1
	dw wTileMap + 6 * SCREEN_WIDTH + 1
	dw wTileMap + 8 * SCREEN_WIDTH + 1
	dw wTileMap + 11 * SCREEN_WIDTH + 1

DrawLearningMoveDescription:
	hlcoord 0, 13
	lb bc, 3, 18
	call TextBoxBorder
	ld a, [wCurrentMenuItem]
	cp NUM_MOVES
	jr z, .new
	ld c, a
	ld b, 0
	ld hl, wMoves
	add hl, bc
	ld a, [hl]
	jr .description
.new
	ld a, [wMoveNum]
.description
	dec a
	ld hl, MoveDescriptions
	ld bc, 2
	call AddNTimes
	ld a, [hli]
	ld d, [hl]
	ld e, a
	hlcoord 1, 14
	jp PlaceString

RestoreMoveLearningAttributes::
	ld a, 1
	call MoveLearningAttributes
	ldh a, [hGBC]
	and a
	ret z
	farcall UpdateBattleMoveTypePalette
	ret

; Save and clear the window's CGB attributes, or restore them on every exit.
; Keep both screen backups intact: buffer 2 contains the saved overworld.
MoveLearningAttributes:
	ld c, a
	ldh a, [hGBC]
	and a
	ret z
	call .begin
	ld de, vMoveLearningAttributeBackup
	ld b, 14
.row
	push bc
	ld b, SCREEN_WIDTH
.column
	call .waitVRAM
	ld a, c
	and a
	jr nz, .restore
	ld a, [hl]
	ld [de], a
	xor a
	jr .write
.restore
	ld a, [de]
.write
	push af
	call .waitVRAM
	pop af
	ld [hli], a
	inc de
	dec b
	jr nz, .column
	push de
	ld de, BG_MAP_WIDTH - SCREEN_WIDTH
	add hl, de
	pop de
	pop bc
	dec b
	jr nz, .row
	jr .end
.begin
	di
	ldh a, [rLCDC]
	bit 7, a
	jr z, .lcdOff
.wait
	ldh a, [rLY]
	cp 144
	jr nz, .wait
.lcdOff
	ld a, 1
	ldh [rVBK], a
	ldh a, [hAutoBGTransferDest]
	ld l, a
	ldh a, [hAutoBGTransferDest + 1]
	ld h, a
	ret
.end
	xor a
	ldh [rVBK], a
	ei
	ret
.waitVRAM
	ldh a, [rSTAT]
	and %10
	jr nz, .waitVRAM
	ret

GrayMoveLearningDetails:
	call MoveLearningAttributes.begin
	ld de, 3 * BG_MAP_WIDTH + 2
	add hl, de
	ld b, NUM_MOVES
.row
	call .detail
	ld de, 2 * BG_MAP_WIDTH - 12
	add hl, de
	dec b
	jr nz, .row
	; The fourth detail ends at row 9; the new move's detail is on row 12.
	ld de, BG_MAP_WIDTH
	add hl, de
	call .detail
	jp MoveLearningAttributes.end
.detail
	ld c, 12
.column
	call MoveLearningAttributes.waitVRAM
	ld a, PAL_BG_MOVE_TYPE
	ld [hli], a
	dec c
	jr nz, .column
	ret

INCLUDE "data/moves/descriptions.asm"
