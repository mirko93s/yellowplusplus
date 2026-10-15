DisplayTypeChart::
	farcall ClosePocketBagUIForParty
	ldh a, [hTileAnimations]
	push af
	ld a, [wUpdateSpritesEnabled]
	push af
	ldh a, [rLCDC]
	push af
	ldh a, [hSCX]
	push af
	ldh a, [hSCY]
	push af
	ldh a, [hWY]
	push af
	ldh a, [hAutoBGTransferEnabled]
	push af
	ldh a, [hJoy7]
	push af
	call DisableLCD
	xor a
	ldh [hTileAnimations], a
	ldh [hAutoBGTransferEnabled], a
	ldh [hSCX], a
	ldh [hSCY], a
	ldh [rSCX], a
	ldh [rSCY], a
	ldh [hJoy7], a
	ld a, $ff ; retain the chart's OAM instead of updating map sprites
	ld [wUpdateSpritesEnabled], a
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	ldh [rWY], a
	; Use the menu map at $9c00, preserving the scrolling overworld at $9800.
	; Signed BG tiles at $9000, 8x8 objects, no window.
	ld a, %00001011
	ldh [rLCDC], a
	call ClearSprites
	ld hl, TypeChartTiles
	ld de, vChars2
	ld bc, TypeChartTilesEnd - TypeChartTiles
	call CopyData
	ld hl, TypeChartDragonTiles
	ld de, vSprites
	ld bc, TypeChartDragonTilesEnd - TypeChartDragonTiles
	call CopyData
	ld hl, TypeChartTilemap
	call TypeChartCopyMap
	ldh a, [hGBC]
	and a
	jr z, .attributesDone
	ld a, 1
	ldh [rVBK], a
	ld hl, TypeChartAttributes
	call TypeChartCopyMap
	xor a
	ldh [rVBK], a
.attributesDone
	ld hl, TypeChartOAM
	ld de, wShadowOAM
	ld bc, TypeChartOAMEnd - TypeChartOAM
	call CopyData
	ld a, %11100100
	ldh [rBGP], a
	; Dragon uses light index 1; white ink uses index 2; index 0 is transparent.
	ld a, %11000100
	ldh [rOBP0], a
	call TypeChartLoadPalettes
	call EnableLCD
.wait
	call DelayFrame
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	and A_BUTTON | B_BUTTON
	jr z, .wait
	call DisableLCD
	call ClearSprites
	; Hide all eight palettes before the normal five-palette fade takes over.
	ldh a, [hGBC]
	and a
	jr z, .whiteDone
	ld a, $80
	ldh [rBGPI], a
	ldh [rOBPI], a
	ld b, 64
	ld a, $ff
.white
	ldh [rBGPD], a
	ldh [rOBPD], a
	dec b
	jr nz, .white
.whiteDone
	xor a
	ldh [rBGP], a
	ldh [rOBP0], a
	pop af
	ldh [hJoy7], a
	pop af
	ldh [hAutoBGTransferEnabled], a
	pop af
	ldh [hWY], a
	ldh [rWY], a
	pop af
	ldh [hSCY], a
	ldh [rSCY], a
	pop af
	ldh [hSCX], a
	ldh [rSCX], a
	pop af
	ldh [rLCDC], a
	; Restore each graphics set once; the Town Map exit reloads them twice.
	call ReloadMapData
	call RestoreScreenTilesAndReloadTilePatterns
	call ClearScreen
	pop af
	ld [wUpdateSpritesEnabled], a
	pop af
	ldh [hTileAnimations], a
	ret

TypeChartCopyMap:
; Copy a packed 20x18 map to the LCD-disabled 32-wide hardware map.
	ld de, vBGMap1
	ld b, SCREEN_HEIGHT
.row
	ld c, SCREEN_WIDTH
.tile
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .tile
	ld a, e
	add BG_MAP_WIDTH - SCREEN_WIDTH
	ld e, a
	jr nc, .next
	inc d
.next
	dec b
	jr nz, .row
	ret

TypeChartLoadPalettes:
; Own all eight BG palettes directly; do not overrun wBGPPalsBuffer.
	ldh a, [hGBC]
	and a
	ret z
	ld a, [wOptions]
	and COLOR_MODE_MASK
	ld hl, TypeChartPalettes
	jr z, .color
	ld hl, TypeChartPalettesCorrected
	cp COLOR_MODE_GBC << COLOR_MODE_SHIFT
	jr z, .color
	; The standard palette lookup honors both monochrome options.
	ld de, PAL_ROUTE
	farcall GetGBCBasePalAddress
	ld h, d
	ld l, e
	ld de, wGBCPal
	ld bc, PALETTE_SIZE
	ld a, BANK(DMGGreenPalette)
	call FarCopyData
	ld a, $80
	ldh [rBGPI], a
	ld b, 8
.monoPalette
	ld hl, wGBCPal
	ld c, PALETTE_SIZE
.monoByte
	ld a, [hli]
	ldh [rBGPD], a
	dec c
	jr nz, .monoByte
	dec b
	jr nz, .monoPalette
	; Keep Dragon at light index 1 to continue the alternating type shades.
	; Object white ink uses index 2, rather than BG index 0.
	ld a, [wGBCPal]
	ld [wGBCPal + 4], a
	ld a, [wGBCPal + 1]
	ld [wGBCPal + 5], a
	ld hl, wGBCPal
	jr .object
.color
	ld a, $80
	ldh [rBGPI], a
	ld b, 8 * PALETTE_SIZE
.byte
	ld a, [hli]
	ldh [rBGPD], a
	dec b
	jr nz, .byte
.object
	ld a, $80
	ldh [rOBPI], a
	ld b, PALETTE_SIZE
.objectByte
	ld a, [hli]
	ldh [rOBPD], a
	dec b
	jr nz, .objectByte
	ret

TypeChartTiles:
	; One PNG atlas: 96 BG tiles, then eight Dragon OBJ tiles, then padding.
	INCBIN "gfx/type_chart/tiles.2bpp", 0, 96 tiles
TypeChartTilesEnd:
ASSERT TypeChartTilesEnd - TypeChartTiles <= $80 tiles
TypeChartDragonTiles:
	INCBIN "gfx/type_chart/tiles.2bpp", 96 tiles, 8 tiles
TypeChartDragonTilesEnd:

TypeChartOAM:
	db 16, 160, 0, 0
	db 24, 160, 1, 0
	db 32, 160, 2, 0
	db 152, 8, 3, 0
	db 152, 16, 4, 0
	db 152, 24, 5, 0
	db 152, 32, 6, 0
	db 152, 40, 7, 0
TypeChartOAMEnd:

INCLUDE "data/items/type_chart.asm"
