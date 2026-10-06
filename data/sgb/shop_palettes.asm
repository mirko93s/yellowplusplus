; Route and city order matches PAL_ROUTE through PAL_SAFFRON.
; Middle colors are RGB5 complements (31 - channel); endpoints stay unchanged.
ShopAccentPalettes:
	RGB 31,31,31, 15,08,18, 26,19,22, 03,03,03 ; route fallback
	RGB 31,31,31, 08,09,15, 15,16,23, 03,03,03 ; Pallet
	RGB 31,31,31, 14,02,21, 21,10,30, 03,03,03 ; Viridian
	RGB 31,31,31, 12,14,10, 21,23,18, 03,03,03 ; Pewter
	RGB 31,31,31, 19,07,02, 29,16,10, 03,03,03 ; Cerulean
	RGB 31,31,31, 10,18,06, 18,26,13, 03,03,03 ; Lavender
	RGB 31,31,31, 01,12,21, 09,19,30, 03,03,03 ; Vermilion
	RGB 31,31,31, 18,02,11, 29,10,20, 03,03,03 ; Celadon
	RGB 31,31,31, 01,23,11, 08,30,18, 03,03,03 ; Fuchsia
	RGB 31,31,31, 01,18,23, 09,25,30, 03,03,03 ; Cinnabar
	RGB 31,31,31, 19,11,00, 23,22,00, 03,03,03 ; Indigo
	RGB 31,31,31, 01,03,21, 06,10,30, 03,03,03 ; Saffron
ShopAccentPalettesEnd:
	ASSERT ShopAccentPalettesEnd - ShopAccentPalettes == (NUM_CITY_MAPS + 1) * PALETTE_SIZE

ShopAccentPalettesCorrected:
; Complement the corrected city colors, retaining that mode's white/black floor.
	RGB 30,30,30, 11,09,14, 22,18,20, 05,05,05
	RGB 30,30,30, 07,09,11, 13,15,18, 05,05,05
	RGB 30,30,30, 09,06,15, 15,12,22, 05,05,05
	RGB 30,30,30, 11,11,09, 19,19,16, 05,05,05
	RGB 30,30,30, 15,06,05, 24,13,11, 05,05,05
	RGB 30,30,30, 10,12,07, 17,19,13, 05,05,05
	RGB 30,30,30, 03,10,13, 09,16,19, 05,05,05
	RGB 30,30,30, 12,05,10, 19,12,18, 05,05,05
	RGB 30,30,30, 04,14,08, 09,19,14, 05,05,05
	RGB 30,30,30, 03,14,14, 10,20,20, 05,05,05
	RGB 30,30,30, 16,08,04, 23,13,04, 05,05,05
	RGB 30,30,30, 01,05,12, 05,10,17, 05,05,05
ShopAccentPalettesCorrectedEnd:
	ASSERT ShopAccentPalettesCorrectedEnd - ShopAccentPalettesCorrected == (NUM_CITY_MAPS + 1) * PALETTE_SIZE
