LoadFontTilePatterns::
	ld hl, FontGraphics
	ld a, [wExtraOptions]
	bit BIT_FONT_OG, a
	jr z, .selected
	ld hl, OriginalFontGraphics
.selected
	ldh a, [rLCDC]
	bit 7, a ; is the LCD enabled?
	jr nz, .on
.off
	ld de, vFont
	ld bc, FontGraphicsEnd - FontGraphics
	ld a, BANK(FontGraphics)
	jp FarCopyDataDouble ; if LCD is off, transfer all at once
.on
	ld d, h
	ld e, l
	ld hl, vFont
	lb bc, BANK(FontGraphics), (FontGraphicsEnd - FontGraphics) / $8
	jp CopyVideoDataDouble ; if LCD is on, transfer during V-blank

LoadTextBoxTilePatterns::
	ld a, [wTextboxFrame]
	cp NUM_TEXTBOX_FRAMES
	jr c, .valid
	xor a ; old saves can have any value in this formerly unused byte
	ld [wTextboxFrame], a
.valid
	ld hl, TextBoxGraphics
	ld bc, TEXTBOX_FRAME_TILES tiles
	call AddNTimes
	ldh a, [rLCDC]
	bit 7, a ; is the LCD enabled?
	jr nz, .on
.off
	ld de, vChars2 tile $79
	ld bc, TEXTBOX_FRAME_TILES tiles
	ld a, BANK(TextBoxGraphics)
	jp FarCopyData ; if LCD is off, transfer all at once
.on
	ld d, h
	ld e, l
	ld hl, vChars2 tile $79
	lb bc, BANK(TextBoxGraphics), TEXTBOX_FRAME_TILES
	jp CopyVideoData ; if LCD is on, transfer during V-blank

LoadHpBarAndStatusTilePatterns::
	ld de, HpBarAndStatusGraphics
	ld hl, vChars2 tile $62
	lb bc, BANK(HpBarAndStatusGraphics), (HpBarAndStatusGraphicsEnd - HpBarAndStatusGraphics) / $10
	call GoodCopyVideoData
	ld de, SharedLevelGraphics
	ld hl, vChars2 tile $6e
	lb bc, BANK(SharedLevelGraphics), 1
	call GoodCopyVideoData
	ld de, SharedIDGraphics
	ld hl, vChars2 tile $73
	lb bc, BANK(SharedIDGraphics), 2
	call GoodCopyVideoData
	ld de, SharedNamingGraphics
	ld hl, vChars2 tile $76
	lb bc, BANK(SharedNamingGraphics), 2
	call GoodCopyVideoData
	call LoadTextBoxTilePatterns
	ld de, EXPBarGraphics
	ld hl, vChars1 tile $40
	lb bc, BANK(EXPBarGraphics), (EXPBarShinySparkleGraphicsEnd - EXPBarGraphics) / $10
	jp GoodCopyVideoData
