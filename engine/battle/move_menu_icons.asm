; wTempMoveID = physical/special/status category after PhysicalSpecialSplit.
; Read it from WRAM: Bankswitch replaces a with the destination ROM bank.
; GetCurrentMove has populated the type.
; Reuse $da-$dd for the type, and $de-$df for the selected category.
DrawBattleMoveIcons::
	ld a, [wPlayerMoveType]
	call GetTypeIconGraphicsAddress
	ld hl, vFont tile (MOVE_TYPE_ICON_TILE - $80)
	lb bc, BANK(BattleMoveTypeGraphics), 4
	call CopyBattleMoveIconTiles
	ld a, [wTempMoveID]
	ld l, a
	ld h, 0
	REPT 5
		add hl, hl
	ENDR
	ld de, BattleMoveCategoryGraphics
	add hl, de
	ld d, h
	ld e, l
	ld hl, vFont tile (MOVE_CATEGORY_ICON_TILE - $80)
	lb bc, BANK(BattleMoveCategoryGraphics), 2
	call CopyBattleMoveIconTiles

	hlcoord 3, 13
	ld a, MOVE_TYPE_ICON_TILE
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 3, 14
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 1, 13
	ld a, MOVE_CATEGORY_ICON_TILE
	ld [hli], a
	inc a
	ld [hl], a
	farcall SetBattleMoveTypePalette
	ret

.TypeGraphicsIndexes
	table_width 1, .TypeGraphicsIndexes
	db 0, 1, 2, 3, 4, 5, 6, 7, 8
	REPT UNUSED_TYPES_END - UNUSED_TYPES
		db 6 ; gaps in the type constants use the typeless icon
	ENDR
	db 9, 10, 11, 12, 13, 14, 15
	assert_table_length NUM_TYPES

; These small uploads use graphics in the current ROM bank. Copy during
; accessible LCD modes instead of waiting a whole frame for each icon.
; Keep interrupts out of the STAT-check/write pair so VRAM stays accessible.
CopyBattleMoveIconTiles:
	ld a, c
	swap a ; four or two tiles -> 64 or 32 bytes
	ld c, a
.byte
	di
.waitVRAM
	ldh a, [rSTAT]
	and %10
	jr nz, .waitVRAM
	ld a, [de]
	ld [hli], a
	ei
	inc de
	dec c
	jr nz, .byte
	ret

; Grayscale PNGs use the existing PNG-to-2bpp graphics rule.
; Status icons share this artwork and these six battle-only font tiles.
; The second icon also uses the two unused font tiles $ce-$cf.
DrawStatusTypeIcons::
	ld a, [wMoveTypeIconPalette]
	call GetTypeIconGraphicsAddress
	ld hl, vFont tile (MOVE_TYPE_ICON_TILE - $80)
	lb bc, BANK(BattleMoveTypeGraphics), 4
	call CopyVideoData
	hlcoord 2, 15
	ld a, MOVE_TYPE_ICON_TILE
	call .placeIcon
	ld a, [wMoveTypeIconPalette]
	ld b, a
	ld a, [wMoveCategoryIconPalette]
	and $7f
	cp b
	jr z, .palettes
	call GetTypeIconGraphicsAddress
	push de
	ld hl, vFont tile (MOVE_CATEGORY_ICON_TILE - $80)
	lb bc, BANK(BattleMoveTypeGraphics), 2
	call CopyVideoData
	pop hl
	ld de, 2 * LEN_2BPP_TILE
	add hl, de
	ld d, h
	ld e, l
	ld hl, vFont tile ($ce - $80)
	lb bc, BANK(BattleMoveTypeGraphics), 2
	call CopyVideoData
	hlcoord 4, 15
	ld a, MOVE_CATEGORY_ICON_TILE
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 4, 16
	ld a, $ce
	ld [hli], a
	inc a
	ld [hl], a
.palettes
	farcall SetStatusTypeIconPalettes
	farcall ApplyStatusTypeIconAttributes
	ret
.placeIcon
	ld [hli], a
	inc a
	ld [hl], a
	ld de, SCREEN_WIDTH - 1
	add hl, de
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	ret

; a = type ID; de = address of its four row-major tiles.
GetTypeIconGraphicsAddress:
	cp NUM_TYPES
	jr c, .validType
	ld a, TYPELESS
.validType
	ld e, a
	ld d, 0
	ld hl, DrawBattleMoveIcons.TypeGraphicsIndexes
	add hl, de
	ld l, [hl]
	ld h, 0
	REPT 6
		add hl, hl
	ENDR
	ld de, BattleMoveTypeGraphics
	add hl, de
	ld d, h
	ld e, l
	ret

; Type order: Normal, Fighting, Flying, Poison, Ground, Rock, Typeless, Bug,
; Ghost, Fire, Water, Grass, Electric, Psychic, Ice, Dragon (16x16 each).
BattleMoveTypeGraphics:
	INCBIN "gfx/battle/type_icons.2bpp"
.End
	ASSERT .End - BattleMoveTypeGraphics == 16 * 4 * LEN_2BPP_TILE

; Category order: Physical, Special, Status (16x8 each).
BattleMoveCategoryGraphics:
	INCBIN "gfx/battle/category_icons.2bpp"
.End
	ASSERT .End - BattleMoveCategoryGraphics == 3 * 2 * LEN_2BPP_TILE
