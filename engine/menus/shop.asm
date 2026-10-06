; Full-screen buying UI. Selection/scroll survive the generic purchase prompts.
DisplayShopUI::
	ld a, [wStatusFlags5]
	push af
	set 6, a
	ld [wStatusFlags5], a
	ld a, [wShopUIActive]
	and a
	jr nz, .resume
	ld a, [wUpdateSpritesEnabled]
	ld [wShopUISavedSpriteState], a
	call GBPalWhiteOut
	xor a
	ld [wShopCursor], a
	ld [wShopScroll], a
	ld [wUpdateSpritesEnabled], a
	call ClearSprites
	call LoadTextBoxTilePatterns
	ld de, ShopUITiles
	ld hl, vChars2 tile SHOP_UI_TILE_BASE
	lb bc, BANK(ShopUITiles), SHOP_UI_TILE_COUNT
	call CopyVideoData
	call ShopResolveCityPalette
	ld [wShopCityPalette], a
	ld a, 1
	ld [wShopUIActive], a
.resume
	ld a, PRICEDITEMLISTMENU
	ld [wListMenuID], a
	ld a, [wItemList]
	ld [wListCount], a
	ld a, 1
	ldh [hJoy7], a
	call ShopDraw
.wait
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	bit BIT_B_BUTTON, a
	jp nz, .cancel
	bit BIT_D_UP, a
	jr nz, .up
	bit BIT_D_DOWN, a
	jr nz, .down
	bit BIT_A_BUTTON, a
	jr z, .wait
	ld a, [wListCount]
	and a
	jr z, .wait
	ld a, [wShopCursor]
	ld [wCurrentMenuItem], a
	ld [wChosenMenuItem], a
	ld b, a
	ld a, [wShopScroll]
	add b
	ld [wWhichPokemon], a
	call ShopResolveEntry
	ld [wCurListMenuItem], a
	call GetItemPrice
	call GetItemName
	call CopyToStringBuffer
	ld a, CHOSE_MENU_ITEM
	ld [wMenuExitMethod], a
	pop af
	ld [wStatusFlags5], a
	xor a
	ldh [hJoy7], a
	ret
.up
	ld a, [wShopCursor]
	and a
	jr z, .scrollUp
	dec a
	ld [wShopCursor], a
	jr .moved
.scrollUp
	ld hl, wShopScroll
	ld a, [hl]
	and a
	jr z, .wait
	dec [hl]
	jr .scrolled
.down
	ld a, [wShopCursor]
	ld b, a
	ld a, [wShopScroll]
	add b
	inc a
	ld c, a
	ld a, [wListCount]
	cp c
	jr c, .wait
	jr z, .wait
	ld a, b
	cp SHOP_VISIBLE_ROWS - 1
	jr z, .scrollDown
	inc a
	ld [wShopCursor], a
.moved
	xor a
	ldh [hAutoBGTransferEnabled], a
	call ShopUpdateListCursor
	call ShopDrawDescription
	call ShopUpdateThumb
.refreshDone
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	jp .wait
.scrollDown
	ld hl, wShopScroll
	inc [hl]
.scrolled
	xor a
	ldh [hAutoBGTransferEnabled], a
	call ShopDrawRows
	call ShopUpdateListCursor
	call ShopDrawDescription
	call ShopUpdateThumb
	jr .refreshDone
.cancel
	pop af
	ld [wStatusFlags5], a
	xor a
	ldh [hJoy7], a
	ld a, CANCELLED_MENU
	ld [wMenuExitMethod], a
	scf
	ret

CloseShopUI::
	ld a, [wShopUIActive]
	and a
	ret z
	call GBPalWhiteOut
	xor a
	ld [wShopUIActive], a
	call LoadScreenTilesFromBuffer1
	call Delay3
	call RunDefaultPaletteCommand
	call LoadGBPal
	ld a, [wShopUISavedSpriteState]
	ld [wUpdateSpritesEnabled], a
	ret

ShopResolveCityPalette:
	ld a, [wCurMap]
	cp FIRST_INDOOR_MAP
	jr c, .outdoor
	ld a, [wLastMap]
.outdoor
	cp NUM_CITY_MAPS
	jr c, .city
	ld a, PAL_ROUTE
	ret
.city
	inc a
	ret

ShopResolveEntry:
; A = inventory ordinal. The mart inventory contains item IDs, not stacks.
	ld e, a
	ld d, 0
	ld hl, wItemList + 1
	add hl, de
	ld a, [hl]
	ld [wCurItem], a
	ld [wNamedObjectIndex], a
	ret

ShopDraw:
	xor a
	ldh [hAutoBGTransferEnabled], a
	ld hl, ShopFrameTilemap
	ld de, wTileMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyData
	hlcoord 1, 1
	ld de, .shop
	call PlaceString
	hlcoord 6, 1
	ld de, .money
	call PlaceString
	call ShopDrawMoney
	call ShopDrawRows
	call ShopUpdateListCursor
	call ShopDrawDescription
	call ShopUpdateThumb
	call ShopUploadScreen
	call UpdateShopUIPalettes
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	jp LoadGBPal
.shop
	db "Shop@"
.money
	db "Money@"

ShopDrawMoney::
; Purchase accounting redraws MONEY_BOX; keep it in the existing shop header.
	hlcoord 12, 1
	push hl
	lb bc, 1, 7
	call ClearScreenArea
	pop hl
	ld de, wPlayerMoney
	ld c, $a3
	call PrintBCDNumber
	hlcoord 12, 1
	call MenuUICellAddress
	lb bc, 1, 7
	jp MenuUIUploadRectangle

ShopDrawRows:
	xor a
.row
	push af
	call ShopDrawRow
	pop af
	inc a
	cp SHOP_VISIBLE_ROWS
	jr c, .row
	ret

ShopRowAddress:
; A = visible row -> HL = first text cell.
	hlcoord 1, 3
	ld bc, SCREEN_WIDTH
	jp AddNTimes

ShopDrawRow:
	ld [wShopDrawRow], a
	call ShopRowAddress
	push hl
	lb bc, 1, 18
	call ClearScreenArea
	ld a, [wShopDrawRow]
	ld b, a
	ld a, [wShopScroll]
	add b
	ld c, a
	ld a, [wListCount]
	cp c
	jr c, .upload
	jr z, .upload
	ld a, c
	call ShopResolveEntry
	call GetItemPrice
	pop hl
	push hl
	ld bc, 13 ; currency stays at column 14; up to four digits follow it
	add hl, bc
	ld de, hItemPrice + 1
	ld c, $e2 ; suppress leading zeroes, left-align, currency, two BCD bytes
	call PrintBCDNumber
	call GetItemName
	pop hl
	push hl
	ld b, 13 ; fixed currency column 14 leaves columns 1..13 for names
.character
	ld a, [de]
	cp '@'
	jr z, .upload
	ld [hli], a
	inc de
	dec b
	jr nz, .character
.upload
	pop hl
	call MenuUICellAddress
	lb bc, 1, 18
	jp MenuUIUploadRectangle

ShopUpdateListCursor:
; Replace the left frame line; names and prices do not move or redraw.
	hlcoord 0, 3
	ld b, SHOP_VISIBLE_ROWS
.clear
	ld [hl], $65
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .clear
	ld a, [wListCount]
	and a
	jr z, .upload
	ld a, [wShopCursor]
	hlcoord 0, 3
	ld bc, SCREEN_WIDTH
	call AddNTimes
	ld [hl], SHOP_UI_CURSOR
.upload
	hlcoord 0, 3
	call MenuUICellAddress
	lb bc, SHOP_VISIBLE_ROWS, 1
	jp MenuUIUploadRectangle

ShopDrawDescription:
	hlcoord 1, 15
	lb bc, 2, 18
	call ClearScreenArea
	ld a, [wListCount]
	and a
	jr z, .upload
	ld a, [wShopCursor]
	ld b, a
	ld a, [wShopScroll]
	add b
	call ShopResolveEntry
	farcall DrawMenuItemDescription_
.upload
	hlcoord 1, 15
	call MenuUICellAddress
	lb bc, 2, 18
	jp MenuUIUploadRectangle

ShopUpdateThumb:
	hlcoord 19, 3
	ld b, SHOP_VISIBLE_ROWS
.clear
	ld [hl], $65
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .clear
	ld a, [wListCount]
	cp SHOP_VISIBLE_ROWS + 1
	jr c, .upload
	ld a, [wShopCursor]
	ld b, a
	ld a, [wShopScroll]
	add b
	ld hl, 0
	ld bc, SHOP_VISIBLE_ROWS - 1
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
	ld [hl], SHOP_UI_THUMB
.upload
	hlcoord 19, 3
	call MenuUICellAddress
	lb bc, SHOP_VISIBLE_ROWS, 1
	jp MenuUIUploadRectangle

ShopUploadScreen:
	ld hl, wTileMap
	call MenuUICellAddress
	lb bc, SCREEN_HEIGHT, SCREEN_WIDTH
	jp MenuUIUploadRectangle

ShopTilePalette:
	cp SHOP_UI_CURSOR
	jr z, .accent
	cp SHOP_UI_THUMB
	jr z, .accent
	xor a ; frame, text, background all use the city's BG0
	ret
.accent
	ld a, PAL_BG_SHOP_ACCENT
	ret

ShopTextBoxBorder::
; Height in scratch, C = width, DE = origin (home TextBoxBorder's adapter).
	ld a, [wShopBoxHeight]
	ld b, a
	ld h, d
	ld l, e
	push hl
	push bc
	call StandardTextBoxBorder
	pop bc
	pop hl
	push hl
	push bc
	inc b
	inc b
	inc c
	inc c
.row
	push bc
	push hl
.column
	ld a, [hl]
	sub $79
	cp 6
	jr nc, .next
	push hl
	ld e, a
	ld d, 0
	ld hl, .tiles
	add hl, de
	ld a, [hl]
	pop hl
	ld [hl], a
.next
	inc hl
	dec c
	jr nz, .column
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop bc
	dec b
	jr nz, .row
	pop bc
	pop hl
	call MenuUIFixBoxCorners
	push bc
	call MenuUICellAddress
	pop bc
	inc b
	inc b
	inc c
	inc c
	jp MenuUIUploadRectangle
.tiles
	db $68, $67, $69, $65, $6b, $6c

UpdateShopUIPalettes::
	ldh a, [hGBC]
	and a
	ret z
	call GetShopBasePaletteAddress
	ld a, BANK(SuperPalettes)
	call MenuUIConvertPalette
	xor a
	call MenuUIUploadPalette
	call ShopAccentPaletteAddress
	call MenuUIConvertPalette
	ld a, PAL_BG_SHOP_ACCENT
	jp MenuUIUploadPalette

ShopAccentPaletteAddress:
	ld a, [wOptions]
	and COLOR_MODE_MASK
	jr z, .raw
	cp COLOR_MODE_GBC << COLOR_MODE_SHIFT
	jr z, .corrected
	; Both palettes use the same base in monochrome modes.
	call GetShopBasePaletteAddress
	ld a, BANK(SuperPalettes)
	ret
.raw
	ld de, ShopAccentPalettes
	jr .offset
.corrected
	ld de, ShopAccentPalettesCorrected
.offset
	ld a, [wShopCityPalette]
	ld l, a
	ld h, 0
	REPT 3
		add hl, hl
	ENDR
	add hl, de
	ld d, h
	ld e, l
	ld a, BANK(ShopAccentPalettes)
	ret

ShopFrameTilemap:
	db $62,$61,$60,$61,$60,$63,$60,$61,$60,$61,$60,$61,$60,$61,$60,$61,$60,$61,$60,$64
	db $65,"    ",$65,"             ",$65
	db $68,$67,$67,$67,$67,$6a,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$69
	REPT SHOP_VISIBLE_ROWS
		db $65,"                  ",$65
	ENDR
	db $68,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$69
	REPT 2
		db $65,"                  ",$65
	ENDR
	db $6b,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$67,$6c
ShopFrameTilemapEnd:
	ASSERT ShopFrameTilemapEnd - ShopFrameTilemap == SCREEN_WIDTH * SCREEN_HEIGHT

ShopUITiles:
	INCBIN "gfx/shop/shop.2bpp"
ShopUITilesEnd:
	ASSERT ShopUITilesEnd - ShopUITiles == SHOP_UI_TILE_COUNT * 16

INCLUDE "data/sgb/shop_palettes.asm"
