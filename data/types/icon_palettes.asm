; Display colors for the move icons (RGB555).
; The actual icon PNGs are grayscale, with darkest pixels at shade index 3.
ASSERT BANK(BattleMoveTypePalettes) == BANK(SuperPalettes)
ASSERT BANK(BattleMoveTypePalettesCorrected) == BANK(SuperPalettes)
ASSERT BANK(BattleMoveCategoryPalettes) == BANK(SuperPalettes)
ASSERT BANK(BattleMoveCategoryPalettesCorrected) == BANK(SuperPalettes)
ASSERT BANK(BattleMoveEffectivenessPalettes) == BANK(SuperPalettes)
ASSERT BANK(BattleMoveEffectivenessPalettesCorrected) == BANK(SuperPalettes)
ASSERT BANK(StatusMoveStatsPalette) == BANK(SuperPalettes)
ASSERT BANK(StatusMoveStatsPaletteCorrected) == BANK(SuperPalettes)
ASSERT BANK(StatusMoveStatsPaletteDMG) == BANK(SuperPalettes)

ASSERT BANK(StatusIndicatorPalettes) == BANK(SuperPalettes)
ASSERT BANK(StatusIndicatorPalettesCorrected) == BANK(SuperPalettes)

; Shade 0 stays white outside the masked areas; shade 1 is the page tint.
StatusIndicatorPalettes::
	RGB 31,31,31, 17,24,31, 03,03,03, 03,03,03
	RGB 31,31,31, 19,28,16, 03,03,03, 03,03,03
	RGB 31,31,31, 26,19,31, 03,03,03, 03,03,03
	RGB 31,31,31, 31,23,14, 03,03,03, 03,03,03

StatusIndicatorPalettesCorrected::
	RGB 30,30,30, 19,25,30, 05,05,05, 05,05,05
	RGB 30,30,30, 21,28,18, 05,05,05, 05,05,05
	RGB 30,30,30, 26,21,30, 05,05,05, 05,05,05
	RGB 30,30,30, 30,24,17, 05,05,05, 05,05,05

StatusMoveStatsPalette::
	RGB 31,31,31, 27,27,27, 24,24,24, 22,22,22


StatusMoveStatsPaletteCorrected::
; Gambatte accurate correction, central frontlight (gamma 1.7, luminance 0.94).
	RGB 30,30,30, 27,27,27, 25,25,25, 23,23,23

StatusMoveStatsPaletteDMG::
; Keep detail text light, interpolating the DMG palette's two lightest shades.
	RGB 28,31,26, 24,29,22, 22,27,19, 19,26,17

; Font ink uses shade 3. Keep white backgrounds for both indicator tiles.
BattleMoveEffectivenessPalettes:
	table_width PALETTE_SIZE, BattleMoveEffectivenessPalettes
	RGB 31,31,31, 31,31,31, 31,31,31, 31,00,00 ; immune: red
	RGB 31,31,31, 31,31,31, 31,31,31, 31,16,00 ; quarter: orange
	RGB 31,31,31, 31,31,31, 31,31,31, 31,26,00 ; half: yellow
	RGB 31,31,31, 31,31,31, 31,31,31, 31,31,31 ; neutral: hide old ink until tilemap clears
	RGB 31,31,31, 31,31,31, 31,31,31, 00,13,00 ; double: dark green
	RGB 31,31,31, 31,31,31, 31,31,31, 00,31,00 ; quadruple: bright green
	assert_table_length 6

BattleMoveEffectivenessPalettesCorrected:
	table_width PALETTE_SIZE, BattleMoveEffectivenessPalettesCorrected
	RGB 30,30,30, 30,30,30, 30,30,30, 29,08,08 ; immune: red
	RGB 30,30,30, 30,30,30, 30,30,30, 30,18,08 ; quarter: orange
	RGB 30,30,30, 30,30,30, 30,30,30, 30,25,08 ; half: yellow
	RGB 30,30,30, 30,30,30, 30,30,30, 30,30,30 ; neutral: hide old ink until tilemap clears
	RGB 30,30,30, 30,30,30, 30,30,30, 04,13,04 ; double: dark green
	RGB 30,30,30, 30,30,30, 30,30,30, 08,29,08 ; quadruple: bright green
	assert_table_length 6

BattleMoveTypePalettes:
	table_width PALETTE_SIZE, BattleMoveTypePalettes
	RGB 31,31,31, 30,30,30, 30,30,30, 19,20,19 ; Normal
	RGB 31,31,31, 31,31,21, 31,26,10, 31,16,00 ; Fighting
	RGB 31,31,31, 26,31,31, 26,31,31, 16,23,29 ; Flying
	RGB 31,31,31, 31,29,31, 28,18,31, 18,08,25 ; Poison
	RGB 31,31,31, 31,31,25, 28,20,14, 18,10,04 ; Ground
	RGB 31,31,31, 31,31,26, 31,31,26, 21,21,16 ; Rock
	RGB 31,31,31, 31,29,29, 20,18,18, 10,08,07 ; Typeless
	RGB 31,31,31, 31,31,24, 28,30,13, 18,20,03 ; Bug
	RGB 31,31,31, 31,29,31, 24,18,24, 14,08,14 ; Ghost
	RGB 31,31,31, 31,29,29, 20,18,18, 10,08,07 ; Unused (Typeless)
	RGB 31,31,31, 31,29,29, 20,18,18, 10,08,07 ; Unused (Typeless)
	RGB 31,31,31, 31,29,29, 20,18,18, 10,08,07 ; Unused (Typeless)
	RGB 31,31,31, 31,29,29, 20,18,18, 10,08,07 ; Unused (Typeless)
	RGB 31,31,31, 31,29,29, 20,18,18, 10,08,07 ; Unused (Typeless)
	RGB 31,31,31, 31,29,29, 20,18,18, 10,08,07 ; Unused (Typeless)
	RGB 31,31,31, 31,29,29, 20,18,18, 10,08,07 ; Unused (Typeless)
	RGB 31,31,31, 31,29,29, 20,18,18, 10,08,07 ; Unused (Typeless)
	RGB 31,31,31, 31,29,29, 20,18,18, 10,08,07 ; Unused (Typeless)
	RGB 31,31,31, 31,29,29, 20,18,18, 10,08,07 ; Unused (Typeless)
	RGB 31,31,31, 31,29,29, 20,18,18, 10,08,07 ; Unused (Typeless)
	RGB 31,31,31, 31,26,26, 31,15,15, 28,05,05 ; Fire
	RGB 31,31,31, 21,31,31, 10,24,31, 00,13,25 ; Water
	RGB 31,31,31, 29,31,26, 18,30,15, 07,20,05 ; Grass
	RGB 31,31,31, 31,31,21, 31,31,10, 31,24,00 ; Electric
	RGB 31,31,31, 31,29,31, 31,18,25, 29,08,15 ; Psychic
	RGB 31,31,31, 29,31,31, 18,31,31, 07,27,31 ; Ice
	RGB 31,31,31, 31,31,31, 20,22,31, 10,12,28 ; Dragon
	assert_table_length NUM_TYPES

BattleMoveCategoryPalettes:
	table_width PALETTE_SIZE, BattleMoveCategoryPalettes
	RGB 31,31,31, 31,24,06, 30,10,06, 14,04,01 ; Physical
	RGB 31,31,31, 24,27,31, 10,14,21, 09,07,10 ; Special
	RGB 31,31,31, 31,31,31, 21,20,18, 10,10,10 ; Status
	assert_table_length 3

BattleMoveTypePalettesCorrected:
; Gambatte accurate correction, central frontlight (gamma 1.7, luminance 0.94).
	table_width PALETTE_SIZE, BattleMoveTypePalettesCorrected
	RGB 30,30,30, 29,29,29, 29,29,29, 21,21,21 ; Normal
	RGB 30,30,30, 31,29,25, 30,25,19, 29,18,15 ; Fighting
	RGB 30,30,30, 27,30,29, 27,30,29, 19,24,27 ; Flying
	RGB 30,30,30, 30,29,30, 26,24,29, 18,16,24 ; Poison
	RGB 30,30,30, 30,29,27, 27,21,20, 19,13,11 ; Ground
	RGB 30,30,30, 30,29,27, 30,29,27, 23,22,19 ; Rock
	RGB 30,30,30, 30,29,29, 21,20,20, 12,11,10 ; Typeless
	RGB 30,30,30, 30,29,26, 29,27,20, 21,19,12 ; Bug
	RGB 30,30,30, 30,29,30, 24,22,24, 15,13,16 ; Ghost
	RGB 30,30,30, 30,29,29, 21,20,20, 12,11,10 ; Unused (Typeless)
	RGB 30,30,30, 30,29,29, 21,20,20, 12,11,10 ; Unused (Typeless)
	RGB 30,30,30, 30,29,29, 21,20,20, 12,11,10 ; Unused (Typeless)
	RGB 30,30,30, 30,29,29, 21,20,20, 12,11,10 ; Unused (Typeless)
	RGB 30,30,30, 30,29,29, 21,20,20, 12,11,10 ; Unused (Typeless)
	RGB 30,30,30, 30,29,29, 21,20,20, 12,11,10 ; Unused (Typeless)
	RGB 30,30,30, 30,29,29, 21,20,20, 12,11,10 ; Unused (Typeless)
	RGB 30,30,30, 30,29,29, 21,20,20, 12,11,10 ; Unused (Typeless)
	RGB 30,30,30, 30,29,29, 21,20,20, 12,11,10 ; Unused (Typeless)
	RGB 30,30,30, 30,29,29, 21,20,20, 12,11,10 ; Unused (Typeless)
	RGB 30,30,30, 30,29,29, 21,20,20, 12,11,10 ; Unused (Typeless)
	RGB 30,30,30, 29,27,27, 28,19,21, 26,13,15 ; Fire
	RGB 30,30,30, 24,29,29, 15,25,27, 04,17,22 ; Water
	RGB 30,30,30, 29,29,27, 23,26,19, 14,18,10 ; Grass
	RGB 30,30,30, 31,29,25, 31,28,19, 30,23,16 ; Electric
	RGB 30,30,30, 30,29,30, 28,23,26, 26,16,20 ; Psychic
	RGB 30,30,30, 29,30,30, 22,29,28, 14,26,27 ; Ice
	RGB 30,30,30, 30,30,30, 21,25,28, 11,18,25 ; Dragon
	assert_table_length NUM_TYPES

BattleMoveCategoryPalettesCorrected:
; Gambatte accurate correction, central frontlight (gamma 1.7, luminance 0.94).
	table_width PALETTE_SIZE, BattleMoveCategoryPalettesCorrected
	RGB 30,30,30, 30,23,17, 27,15,16, 15,08,08 ; Physical
	RGB 30,30,30, 25,27,29, 13,17,20, 11,11,12 ; Special
	RGB 30,30,30, 30,30,30, 22,21,20, 13,13,13 ; Status
	assert_table_length 3
