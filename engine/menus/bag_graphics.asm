BagLoadUITiles:
	ld de, BagUITiles
	ld hl, vChars2 tile BAG_UI_TILE_BASE
	lb bc, BANK(BagUITiles), BAG_UI_TILE_COUNT
	jp CopyVideoData

ClosePocketBagUI::
; Restore shared graphics and the host screen's palettes/attributes.
	ld a, [wBagUIActive]
	and a
	ret z
	call GBPalWhiteOut
	xor a
	ld [wBagUIActive], a
	ld a, [wIsInBattle]
	and a
	jr z, .screen
	call LoadHpBarAndStatusTilePatterns
	farcall LoadHudTilePatterns
.screen
	ld a, [wBagContext]
	cp BAG_CONTEXT_BATTLE
	jr z, .buffer1
	cp BAG_CONTEXT_SELL
	jr z, .buffer1
	call LoadScreenTilesFromBuffer2
	jr .show
.buffer1
	call LoadScreenTilesFromBuffer1
.show
	call Delay3 ; finish the tilemap transfer before revealing shared graphics
	call RunDefaultPaletteCommand
	call LoadGBPal
	ld a, [wBagUISavedSpriteState]
	ld [wUpdateSpritesEnabled], a
	ret

ClosePocketBagUIForParty::
; A replacement screen loads its own graphics/palettes without revealing the map.
	ld a, [wBagUIActive]
	and a
	ret z
	call GBPalWhiteOut
	xor a
	ld [wBagUIActive], a
	ld a, [wBagUISavedSpriteState]
	ld [wUpdateSpritesEnabled], a
	ret

BagDrawScrollThumb:
	ld a, [wListCount]
	cp BAG_VISIBLE_ROWS + 1
	ret c
	call BagSelectedOrdinal
	ld hl, 0
	ld bc, BAG_VISIBLE_ROWS - 1
	call AddNTimes
	ld a, [wListCount]
	dec a
	ld e, a
	ld d, 0
	ld b, 0
.divide
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	jr c, .position
	inc b
	jr .divide
.position
	ld a, b
	hlcoord 19, 3
	ld bc, SCREEN_WIDTH
	call AddNTimes
	ld [hl], BAG_UI_TILE_BASE + 14
	ret

BagTilePalette:
; A = tile. Text/default border tiles remain on BG0.
	sub BAG_UI_TILE_BASE
	jr c, .text
	cp BAG_UI_TILE_COUNT
	jr nc, .text
	cp 14
	jr c, .frame
	cp 17
	jr z, .frame
	ld a, PAL_BG_BAG_ACCENT
	ret
.frame
	ld a, PAL_BG_BAG_FRAME
	ret
.text
	xor a
	ret

BagApplyAttributes:
	ld hl, wTileMap
	call BagCellAddress
	lb bc, SCREEN_HEIGHT, SCREEN_WIDTH
; fall through
BagUploadRectangle:
; HL = source, DE = hardware target, B/C = height/width.
; Upload only changed regions, with paired CGB tiles/attributes.
	di
	ldh a, [rVBK]
	push af
.row
	push bc
.column
	ld a, [hli]
	push af
	ldh a, [hGBC]
	and a
	jr z, .tile
	ld a, 1
	ldh [rVBK], a
	dec hl
	ld a, [hli]
	call BagTilePalette
	push af
.waitAttribute
	ldh a, [rSTAT]
	and %10
	jr nz, .waitAttribute
	pop af
	ld [de], a
.tile
	xor a
	ldh [rVBK], a
.waitTile
	ldh a, [rSTAT]
	and %10
	jr nz, .waitTile
	pop af
	ld [de], a
	inc de
	dec c
	jr nz, .column
	pop bc
	push de
	ld a, SCREEN_WIDTH
	sub c
	ld e, a
	ld d, 0
	add hl, de
	pop de
	ld a, BG_MAP_WIDTH
	sub c
	add e
	ld e, a
	jr nc, .next
	inc d
.next
	dec b
	jr nz, .row
	pop af
	ldh [rVBK], a
	ei
	ret

BagUITiles:
	INCBIN "gfx/bag/bag.2bpp", 0, BAG_UI_TILE_COUNT * 16
BagUITilesEnd:
	ASSERT BagUITilesEnd - BagUITiles == BAG_UI_TILE_COUNT * 16

BagFrameTilemap:
	db $62,$66,$66,$66,$66,$6d,$66,$66,$66,$66,$66,$66,$66,$6d,$66,$66,$66,$66,$66,$63
	db $69,"    ",$6f,$74,"     ",$76,$6f,"     ",$6a
	db $6b,$68,$68,$68,$68,$6e,$68,$68,$68,$68,$68,$68,$68,$6e,$68,$68,$68,$68,$68,$6c
	REPT BAG_VISIBLE_ROWS
		db $69,"                  ",$6a
	ENDR
	db $6b,$68,$68,$68,$68,$68,$68,$68,$68,$68,$68,$68,$68,$68,$68,$68,$68,$68,$68,$6c
	REPT 2
		db $69,"                  ",$6a
	ENDR
	db $64,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$65
BagFrameTilemapEnd:
	ASSERT BagFrameTilemapEnd - BagFrameTilemap == SCREEN_WIDTH * SCREEN_HEIGHT
