UpdateIconOrBagPalettes::
	ld a, [wBagUIActive]
	and a
	jr nz, UpdateBagUIPalettes
	farcall UpdateBattleMoveTypePalette
	farcall UpdateBattleMoveCategoryPalette
	ret

UpdateBagUIPalettes::
	ldh a, [hGBC]
	and a
	ret z
	xor a
	call BagConvertPalette
	xor a ; neutral BG0 text
	call BagUploadPalette
	ld a, [wBagPocket]
	add a
	inc a
	call BagConvertPalette
	ld a, PAL_BG_BAG_FRAME
	call BagUploadPalette
	ld a, [wBagPocket]
	add a
	add 2
	call BagConvertPalette
	ld a, PAL_BG_BAG_ACCENT
	call BagUploadPalette
	ret

BagConvertPalette:
; Reuse existing name and palette scratch; apply the current BGP mapping.
	call GetBagUIPaletteAddress
	ld h, d
	ld l, e
	ld de, wNameBuffer
	ld bc, PALETTE_SIZE
	call FarCopyData
	ldh a, [rBGP]
	ld [wLastBGP], a
	ld c, a
	ld b, NUM_PAL_COLORS
	ld de, wGBCPal
.color
	ld a, c
	and 3
	add a
	push bc
	ld c, a
	ld b, 0
	ld hl, wNameBuffer
	add hl, bc
	pop bc
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld a, c
	rrca
	rrca
	ld c, a
	dec b
	jr nz, .color
	ret

BagUploadPalette:
; LCD-safe direct upload, matching the icon path without its bank argument.
	add a
	add a
	add a
	or $80
	ldh [rBGPI], a
	ld hl, wGBCPal
	ld b, PALETTE_SIZE
.byte
	ldh a, [rSTAT]
	and %10
	jr nz, .byte
	ld a, [hli]
	ldh [rBGPD], a
	dec b
	jr nz, .byte
	ret

GetBagUIPaletteAddress:
; A = palette index -> DE = ROM pointer, A = its bank.
	ld l, a
	ld h, 0
	REPT 3
		add hl, hl
	ENDR
	ld a, [wOptions]
	and COLOR_MODE_MASK
	ld de, BagUIPalettes
	jr z, .table
	ld de, BagUIPalettesCorrected
	cp COLOR_MODE_GBC << COLOR_MODE_SHIFT
	jr z, .table
	ld de, DMGGreenPalette
	cp COLOR_MODE_DMG << COLOR_MODE_SHIFT
	jr z, .dmg
	ld de, DMGGrayPalette
.dmg
	ld a, BANK(DMGGreenPalette)
	ret
.table
	add hl, de
	ld d, h
	ld e, l
	ld a, BANK(BagUIPalettes)
	ret

INCLUDE "data/sgb/bag_palettes.asm"
