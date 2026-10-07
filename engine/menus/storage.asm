; DMG-compatible storage: top rows use signed background addressing for the
; front picture and font. At line 72, unsigned addressing exposes NPC tiles
; $00-$5f for all 24 minisprites; the custom frame starts at $62.
; Footer graphics reuse unused font/status tiles at $c8-$cd and $d0-$d4.

StoragePC::
	ld hl, wStatusFlags5
	set 6, [hl]
	ld a, [wListScrollOffset]
	push af
	; UI state and preview scratch borrow the live map, including collision
	; blocks. Preserve it before initializing any of the storage overlay.
	call StorageBackupOverworldMap
	ld a, [wMiscFlags]
	bit 3, a
	jr nz, .opened
	ld a, SFX_TURN_ON_PC
	call PlaySound
.opened
	xor a
	ld hl, wStorageState
	ld bc, wStorageStateEnd - wStorageState
	call FillMemory
	ld [wStorageEditing], a
	; Keep the initial PC menu's tile mode until its display is hidden.
	ld [wStorageUIActive], a
	ldh a, [rLCDC]
	ld [wStorageSavedLCDC], a
	ldh a, [rSTAT]
	ld [wStorageSavedSTAT], a
	ldh a, [rLYC]
	ld [wStorageSavedLYC], a
	ldh a, [rIE]
	ld [wStorageSavedIE], a
	ldh a, [hSCX]
	ld [wStorageSavedSCX], a
	ldh a, [hSCY]
	ld [wStorageSavedSCY], a
	ldh a, [hAutoBGTransferDest]
	ld [wStorageSavedBGDest], a
	ldh a, [hAutoBGTransferDest + 1]
	ld [wStorageSavedBGDest + 1], a
	ld a, [wUpdateSpritesEnabled]
	ld [wStorageSavedSpriteState], a
	xor a
	ld [wUpdateSpritesEnabled], a
	call ClearSprites
	ldh a, [hTileAnimations]
	ld [wStorageSavedTileAnimations], a
	xor a
	ldh [hTileAnimations], a
	ld a, [wCurrentBoxNum]
	and $7f
	ld [wStorageOriginalBox], a
	ld hl, wCurrentBoxNum
	bit 7, [hl]
	jr nz, .boxesReady
	farcall EmptyAllSRAMBoxes
	ld hl, wCurrentBoxNum
	set 7, [hl]
.boxesReady
	call StorageReadMap
	; A canonical copy of the live current box is harmless: the old save
	; still loads its authoritative current-box mirror until a commit.
	call StorageStoreBox
	; Hide the old map before replacing its tile patterns and palettes.
	call StorageBlankTransition
.redraw
	call StorageDrawScreen
	jr .input
.refresh
	call StorageRefreshSelection
.input
	call StorageAnimateSelected
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	bit BIT_B_BUTTON, a
	jp nz, .back
	bit BIT_A_BUTTON, a
	jp nz, .choose
	bit BIT_SELECT, a
	jp nz, .move
	bit BIT_D_UP, a
	jr nz, .up
	bit BIT_D_DOWN, a
	jr nz, .down
	bit BIT_D_LEFT, a
	jp nz, .left
	bit BIT_D_RIGHT, a
	jp nz, .right
	call DelayFrame
	jr .input
.up
	ld a, [wStoragePanel]
	and a
	jr z, .boxUp
	xor a
	ld [wStoragePanel], a
	ld a, [wStorageCursor]
	add 12
	ld [wStorageCursor], a
	jp .refresh
.boxUp
	ld a, [wStorageCursor]
	cp STORAGE_TITLE
	jr z, .input
	cp 6
	jr c, .title
	sub 6
	ld [wStorageCursor], a
	jr .refresh
.title
	ld [wStorageColumn], a
	ld a, STORAGE_TITLE
	ld [wStorageCursor], a
	jr .refresh
.down
	ld a, [wStorageCursor]
	cp STORAGE_TITLE
	jr nz, .nextRow
	ld a, [wStorageColumn]
	ld [wStorageCursor], a
	jr .refresh
.nextRow
	ld b, a
	ld a, [wStoragePanel]
	and a
	jr nz, .input
	ld a, b
	cp 12
	jr c, .boxDown
	sub 12
	ld [wStorageCursor], a
	ld a, 1
	ld [wStoragePanel], a
	jp .refresh
.boxDown
	add 6
	ld [wStorageCursor], a
	jp .refresh
.left
	ld a, [wStorageCursor]
	cp STORAGE_TITLE
	jr z, .previousBox
	ld b, a
	call StorageColumn
	and a
	jp z, .input
	ld a, b
	dec a
	ld [wStorageCursor], a
	jp .refresh
.right
	ld a, [wStorageCursor]
	cp STORAGE_TITLE
	jr z, .nextBox
	ld b, a
	call StorageColumn
	cp 5
	jp z, .input
	ld a, b
	inc a
	ld [wStorageCursor], a
	jp .refresh
.previousBox
	; Entry and completed transactions already maintain canonical box records.
	; Browsing needs only a read, without copying/checksumming six boxes.
	ld a, [wCurrentBoxNum]
	and $7f
	and a
	jr nz, .decrement
	ld a, NUM_BOXES
.decrement
	dec a
	jr .switchBox
.nextBox
	ld a, [wCurrentBoxNum]
	and $7f
	inc a
	cp NUM_BOXES
	jr c, .switchBox
	xor a
.switchBox
	call StorageLoadBox
	jp .redraw
.choose
	ld a, [wStorageCursor]
	cp STORAGE_TITLE
	jp z, .input
	ld a, [wStorageHolding]
	and a
	jr z, .monMenu
	call StoragePlaceHeld
	jp .redraw
.monMenu
	call StorageSelectMon
	jp c, .input
	call StorageMonMenu
	jp .redraw
.move
	ld a, [wStorageCursor]
	cp STORAGE_TITLE
	jp z, .input
	ld a, [wStorageHolding]
	and a
	jr z, .pickUp
	call StoragePlaceHeld
	jp .redraw
.pickUp
	call StoragePickUp
	jp .refresh
.back
	ld a, [wStorageHolding]
	and a
	jr z, .exit
	xor a
	ld [wStorageHolding], a
	jp .redraw
.exit
	xor a
	ld [wStorageHolding], a
	call StorageStoreBox
	farcall SaveSAVtoSRAM
	; Restore the whole overworld display before making it visible again.
	xor a
	ldh [hAutoBGTransferEnabled], a
	call DisableLCD
	xor a
	ld [wStorageUIActive], a
	call LoadTilesetTilePatternData
	; All NPC/player patterns at $8000 were borrowed by the minisprites.
	ld hl, wFontLoaded
	res 0, [hl]
	xor a
	ld [wSpriteSetID], a
	call InitMapSprites
	ld a, [wStorageSavedTileAnimations]
	ldh [hTileAnimations], a
	call LoadPlayerSpriteGraphics
	ld a, [wStorageSavedSpriteState]
	ld [wUpdateSpritesEnabled], a
	ld a, [wStorageSavedTileAnimations]
	ldh [hTileAnimations], a
	call LoadFontTilePatterns
	call LoadTextBoxTilePatterns
	ld a, [wStorageSavedSCX]
	ldh [hSCX], a
	ldh [rSCX], a
	ld a, [wStorageSavedSCY]
	ldh [hSCY], a
	ldh [rSCY], a
	; Menus transfer to the window map; selection double-buffering may have
	; left the destination pointing at the overworld BG map instead.
	ld a, [wStorageSavedBGDest]
	ldh [hAutoBGTransferDest], a
	ld a, [wStorageSavedBGDest + 1]
	ldh [hAutoBGTransferDest + 1], a
	call LoadScreenTilesFromBuffer2DisableBGTransfer
	call StorageCopyScreenNow
	call RunDefaultPaletteCommand
	; Palette setup can rewrite attributes, so restore the scrolling BG
	; after it, while the LCD is still off.
	call StorageRestoreOverworldBG
	ld a, [wStorageSavedLYC]
	ldh [rLYC], a
	ld a, [wStorageSavedSTAT]
	ldh [rSTAT], a
	ld a, [wStorageSavedIE]
	ldh [rIE], a
	ld a, [wStorageSavedLCDC]
	ldh [rLCDC], a
	; All saved UI fields have been consumed; restoring the map overwrites
	; this overlay. Keep runtime block edits instead of rebuilding from ROM.
	call StorageRestoreOverworldMap
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	pop af
	ld [wListScrollOffset], a
	ld hl, wStatusFlags5
	res 6, [hl]
	ld hl, wMiscFlags
	res 5, [hl]
	ld a, [hl]
	bit 3, a
	ret nz
	ld a, SFX_TURN_OFF_PC
	call PlaySound
	jp WaitForSoundToFinish

StorageColumn:
	cp 6
	ret c
	sub 6
	jr StorageColumn

; The initial transition uses a blank map so graphics uploads cannot expose
; overworld tiles using storage palettes. Normal input redraws keep LCD on.
StorageBlankTransition:
	xor a
	ldh [hAutoBGTransferEnabled], a
	call DisableLCD
	ld a, [wStorageBGBackupReady]
	and a
	call z, StorageBackupOverworldBG
	ld a, 1
	ld [wStorageUIActive], a
	xor a
	ldh [rVBK], a
	; Blank tile $7f must be blank in both addressing modes before the split
	; becomes visible; $87f0 still contains NPC artwork on first entry.
	ld hl, vChars0 tile $7f
	ld bc, 1 tiles
	call FillMemory
	ld hl, vChars2 tile $7f
	ld bc, 1 tiles
	call FillMemory
	ldh a, [hAutoBGTransferDest]
	ld l, a
	ldh a, [hAutoBGTransferDest + 1]
	ld h, a
	ld bc, BG_MAP_WIDTH * BG_MAP_HEIGHT
	ld a, ' '
	call FillMemory
	xor a
	ldh [rSCX], a
	ldh [rSCY], a
	ldh [hSCX], a
	ldh [hSCY], a
	ldh a, [hAutoBGTransferDest + 1]
	and 4
	ld a, $c1
	jr z, .mapReady
	or 8
.mapReady
	ldh [rLCDC], a
	call StorageEnableTileSplit
	ret

StorageEnableTileSplit:
	ld a, 71
	ldh [rLYC], a
	ldh a, [rSTAT]
	and $07
	or $40
	ldh [rSTAT], a
	ldh a, [rIE]
	or 1 << LCD_STAT
	ldh [rIE], a
	ret

; LCD is off. Copy all visible rows without waiting for partial VBlank writes.
StorageCopyScreenNow:
	ldh a, [hAutoBGTransferDest]
	ld e, a
	ldh a, [hAutoBGTransferDest + 1]
	ld d, a
	ld hl, wTileMap
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

; Mirror the existing font arrow into one unused battle-font tile.
StorageLoadLeftArrow:
	ld hl, FontGraphics + ($ed - $80) * 8
	ld a, [wExtraOptions]
	bit BIT_FONT_OG, a
	jr z, .font
	ld hl, OriginalFontGraphics + ($ed - $80) * 8
.font
	ld de, wStorageIconBuffer
	ld bc, 8
	ld a, BANK(FontGraphics)
	call FarCopyData
	ld hl, wStorageIconBuffer
	ld de, vFont tile ($d6 - $80)
	ld c, 8
.byte
	ld a, [hli]
	ld b, 8
	push hl
	ld l, 0
.bit
	rrca
	rl l
	dec b
	jr nz, .bit
	ld a, l
	ld h, d
	ld l, e
	call StorageWriteVRAMByte
	call StorageWriteVRAMByte
	ld d, h
	ld e, l
	pop hl
	dec c
	jr nz, .byte
	ret

StorageDrawScreen:
	call StorageEnableTileSplit
	xor a
	ld [wStorageAttributesReady], a
	ldh [hAutoBGTransferEnabled], a
	ld [wStorageRedrawHidden], a
	ld a, [wStorageFontReady]
	and a
	jr z, .initialMap
	ld a, 1
	ld [wStorageRedrawHidden], a
	ld a, [wStorageUIActive]
	cp 4
	jr z, .initialMap
	ldh a, [hAutoBGTransferDest + 1]
	xor 4
	ldh [hAutoBGTransferDest + 1], a
.initialMap
	; Preserve the displayed map while rebuilding the transfer destination.
	; Printer return deliberately prepares the other map before revealing it.
	ld a, [wStorageRedrawHidden]
	and a
	jr nz, .preserveMap
	ldh a, [hAutoBGTransferDest + 1]
	and 4
	jr .selectMap
.preserveMap
	ldh a, [rLCDC]
	and 8
.selectMap
	ld a, $c1
	jr z, .mapReady
	or 8
.mapReady
	ld b, a
	ldh a, [rLCDC]
	and $10
	or b
	ldh [rLCDC], a
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ldh [rSCX], a
	ldh [rSCY], a
	call ClearSprites
	ld hl, wTileMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, ' '
	call FillMemory
	ld a, [wStorageFontReady]
	and a
	jr nz, .fontReady
	; Initialize palettes only when entering from another screen. Reapplying
	; the generic palette during storage redraws briefly recolors every icon.
	ld b, SET_PAL_GENERIC
	call RunPaletteCommand
	call StorageClearAttributes
	call LoadFontTilePatterns
	call LoadTextBoxTilePatterns
	call StorageLoadLeftArrow
	call StorageLoadHintGraphics
	xor a
	ld [wStorageMiniCacheReady], a
	; Keep the selected standard frame for action/confirmation menus.
	ld a, [wTextboxFrame]
	ld hl, TextBoxGraphics
	ld bc, TEXTBOX_FRAME_TILES tiles
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, vChars0 tile $79
	lb bc, BANK(TextBoxGraphics), TEXTBOX_FRAME_TILES
	call CopyVideoDataAlternate
	ld de, StorageFrameGraphics
	ld hl, vChars2 tile $62
	lb bc, BANK(StorageFrameGraphics), 10
	call CopyVideoDataAlternate
	ld de, StorageFrameGraphics
	ld hl, vChars0 tile $62
	lb bc, BANK(StorageFrameGraphics), 10
	call CopyVideoDataAlternate
	ld a, 1
	ld [wStorageFontReady], a
.fontReady
	call StoragePrepareMiniCache
	ld hl, wStorageMiniPalettes
	ld bc, MONS_PER_BOX + PARTY_LENGTH
	xor a
	call FillMemory
	hlcoord 0, 0
	lb bc, 7, 7
	call StorageTextBoxBorder
	hlcoord 8, 0
	lb bc, 1, 10
	call StorageTextBoxBorder
	hlcoord 8, 2
	lb bc, 5, 10
	call StorageTextBoxBorder
	hlcoord 0, 8
	lb bc, 6, 18
	call StorageTextBoxBorder
	; Joined edges share the junction tiles from the supplied frame.
	ld a, $64
	ldcoord_a 8, 0
	ld a, $67
	ldcoord_a 8, 2
	ldcoord_a 0, 8
	ld a, $68
	ldcoord_a 19, 2
	ldcoord_a 19, 8
	ld a, $69
	ldcoord_a 8, 8
	call StorageDrawTitleArrows
	hlcoord 11, 1
	ld de, .boxText
	call PlaceString
	ld a, [wCurrentBoxNum]
	and $7f
	inc a
	ld [wStorageDrawSlot], a
	hlcoord 15, 1
	ld de, wStorageDrawSlot
	lb bc, LEFT_ALIGN | 1, 2
	call PrintNumber
	xor a
	ld [wStorageDrawSlot], a
.slot
	ld a, [wStorageDrawSlot]
	call StorageIconTile
	ld [wStorageDrawTile], a
	ld a, [wStorageDrawSlot]
	cp MONS_PER_BOX
	jr c, .boxSlot
	sub MONS_PER_BOX
	ld b, a
	ld a, [wPartyCount]
	cp b
	jr z, .emptySlot
	jr c, .emptySlot
	ld a, b
	ld [wWhichPokemon], a
	xor a
	ld [wMonDataLocation], a
	jr .icon
.boxSlot
	call StorageResolveSlot
	jr c, .emptySlot
	ld [wWhichPokemon], a
	ld a, BOX_DATA
	ld [wMonDataLocation], a
.icon
	call StorageDrawIcon
.emptySlot
	ld hl, wStorageDrawSlot
	inc [hl]
	ld a, [wStorageDrawSlot]
	cp MONS_PER_BOX + PARTY_LENGTH
	jr c, .slot
	call StorageDrawPreview
	call StorageDrawHints
	call StorageDrawCursor
	ld a, %11100100
	ldh [rBGP], a
	; Keep the storage palettes and attributes intact between redraws.
	call StorageSetAttributes
	ld a, [wStorageRedrawHidden]
	and a
	jr z, .initialPalettes
	farcall StoragePreparePreviewPalettes
	jr .palettesReady
.initialPalettes
	farcall StorageUpdatePalettes
.palettesReady
	call StorageCursorVisualIndex
	ld [wStorageLastCursor], a
	xor a
	ld [wStorageAnimCounter], a
	ld [wStorageAnimFrame], a
	call StorageUploadMap
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	ld a, [wStorageRedrawHidden]
	and a
	ret z
	farcall StorageCommitPreview
	ret
.boxText
	db "Box @"

; HL = top-left icon tile for visible slot A (six columns, three rows).
StorageSlotCoord:
	cp MONS_PER_BOX
	jr c, .box
	sub MONS_PER_BOX
	ld hl, wTileMap + 16 * SCREEN_WIDTH + 3
	jr .column
.box
	ld hl, wTileMap + 9 * SCREEN_WIDTH + 2
.row
	cp 6
	jr c, .column
	sub 6
	ld de, 2 * SCREEN_WIDTH
	add hl, de
	jr .row
.column
	ld e, a
	add a
	add e
	ld e, a
	ld d, 0
	add hl, de
	ret

StorageDrawIcon:
	call LoadMonData
	ld de, wLoadedMonDVs
	farcall IsMonShiny
	ld a, 3
	jr nz, .normal
	ld a, [wStorageDrawSlot]
	cp MONS_PER_BOX
	ld a, 2
	jr c, .normal
	ld a, 4
.normal
	ld [wStorageDrawPalette], a
	ld b, a
	ld a, [wStorageDrawSlot]
	ld e, a
	ld d, 0
	ld hl, wStorageMiniPalettes
	add hl, de
	ld [hl], b
	ld a, [wStorageDrawTile]
	call StorageMiniCacheIndex
	ld e, a
	ld d, 0
	ld hl, wStorageMiniSpecies
	add hl, de
	ld a, [wLoadedMonSpecies]
	cp [hl]
	jr z, .place
	ld a, [wStorageRedrawHidden]
	and a
	jr z, .currentSlot
	call StorageAllocateMiniSlot
	jr .loadSlot
.currentSlot
	ld a, [wStorageDrawTile]
	call StorageMiniCacheIndex
.loadSlot
	ld e, a
	ld d, 0
	ld hl, wStorageMiniSpecies
	add hl, de
	ld a, [wLoadedMonSpecies]
	ld [hl], a
	ld a, [wLoadedMonSpecies]
	ld de, wStorageIconBuffer
	farcall LoadStorageMonIcon
	ld a, [wStorageDrawTile]
	ld l, a
	ld h, 0
	REPT 4
		add hl, hl
	ENDR
	ld de, vChars0
	add hl, de
	ld d, h
	ld e, l
	ld hl, wStorageIconBuffer
	ld bc, 2 tiles
	call StorageCopyToVRAM
	ld hl, wStorageIconBuffer + 4 tiles
	ld bc, 2 tiles
	call StorageCopyToVRAM
.place
	ld a, [wStorageDrawSlot]
	call StorageSlotCoord
	ld a, [wStorageDrawTile]
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

StorageDrawPreview:
	ld a, [wStorageHolding]
	and a
	jr z, .selected
	ld hl, wStorageHeld
	ld de, wLoadedMon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyData
	ld a, [wLoadedMonSpecies]
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a
	call GetMonHeader
	ld de, wStorageHeld + PARTYMON_STRUCT_LENGTH + NAME_LENGTH
	jr .details
.selected
	call StorageSelectMon
	jp c, .empty
	call LoadMonData
	ld a, [wMonDataLocation]
	cp BOX_DATA
	jr nz, .partyLevel
	ld a, [wLoadedMonBoxLevel]
	ld [wLoadedMonLevel], a
.partyLevel
	ld a, [wMonDataLocation]
	and a
	ld hl, wPartyMonNicks
	jr z, .nickname
	ld hl, wBoxMonNicks
.nickname
	ld a, [wWhichPokemon]
	call SkipFixedLengthTextEntries
	ld d, h
	ld e, l
.details
	hlcoord 9, 3
	call PlaceString
	hlcoord 9, 5
	ld de, .levelText
	call PlaceString
	hlcoord 11, 5
	ld de, wLoadedMonLevel
	lb bc, LEFT_ALIGN | 1, 3
	call PrintNumber
	ld a, [wLoadedMonSpecies]
	ld [wGenderTemp], a
	ld de, wLoadedMonDVs
	farcall GetMonGender
	ld a, [wGenderTemp]
	and a
	jr z, .shiny
	dec a
	ld a, '♂'
	jr z, .gender
	ld a, '♀'
.gender
	ldcoord_a 9, 7
.shiny
	ld de, wLoadedMonDVs
	farcall IsMonShiny
	ld a, 0
	jr z, .notShiny
	inc a
	ld hl, wTileMap + 7 * SCREEN_WIDTH + 10
	ld [hl], '⁂'
.notShiny
	ld [wShinyMonFlag], a
	ld a, [wMonHType1]
	ld [wMoveTypeIconPalette], a
	ld a, [wMonHType2]
	or $80
	ld [wMoveCategoryIconPalette], a
	call StorageDrawFastFront
	call StorageDrawTypes
	ret
.empty
	xor a
	ld [wCurPartySpecies], a
	ld [wShinyMonFlag], a
	ld [wMoveTypeIconPalette], a
	ld a, $80
	ld [wMoveCategoryIconPalette], a
	ret
.levelText
	db "Lv@"

StorageDrawTypes:
	farcall StorageLoadTypeIcons
	hlcoord 15, 5
	ld a, MOVE_TYPE_ICON_TILE
	ld b, a
	ld a, [wStorageFrontBase]
	and a
	ld a, b
	jr z, .first
	ld a, $c0
.first
	call .place
	ld a, [wMoveTypeIconPalette]
	ld b, a
	ld a, [wMoveCategoryIconPalette]
	and $7f
	cp b
	ret z
	hlcoord 17, 5
	ld a, MOVE_CATEGORY_ICON_TILE
	ld b, a
	ld a, [wStorageFrontBase]
	and a
	ld a, b
	jr z, .second
	ld a, $c4
.second
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 17, 6
	ld a, $ce
	ld b, a
	ld a, [wStorageFrontBase]
	and a
	ld a, b
	jr z, .bottom
	ld a, $c6
.bottom
	ld [hli], a
	inc a
	ld [hl], a
	ret
.place
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

StorageDrawCursor:
	call StorageDrawSourceCursor
	call StorageCursorVisualIndex
	cp STORAGE_TITLE
	jr nz, .slot
	hlcoord 18, 1
	jr .draw
.slot
	call StorageSlotCoord
	ld de, SCREEN_WIDTH
	add hl, de
	dec hl
.draw
	ld [hl], '▶'
	ret

; Existing uncompressed PNG-derived fronts avoid the slow battle sprite
; decompressor. Upload into the unused preview buffer while the old one is
; still displayed. Neither the saved records nor artwork are changed.
StorageDrawFastFront:
	ld a, [wStorageFrontValid]
	and a
	jr z, .load
	ld a, [wLoadedMonSpecies]
	ld b, a
	ld a, [wStorageFrontSpecies]
	cp b
	jp z, .placeTiles
.load
	ld a, [wLoadedMonSpecies]
	ld [wStorageFrontSpecies], a
	ld a, 1
	ld [wStorageFrontValid], a
	ld a, [wStorageFrontBase]
	xor $31
	ld [wStorageFrontBase], a
	ld a, [wLoadedMonSpecies]
	dec a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld de, StorageFrontPointers
	add hl, de
	ld de, wStorageIconBuffer
	ld bc, 4
	ld a, BANK(StorageFrontPointers)
	call FarCopyData
	ld a, [wStorageIconBuffer + 3]
	ld l, a
	ld h, 0
	REPT 4
		add hl, hl
	ENDR
	ld b, h
	ld c, l
	push bc
	ld a, [wStorageIconBuffer + 1]
	ld l, a
	ld a, [wStorageIconBuffer + 2]
	ld h, a
	ld a, [wStorageIconBuffer]
	ld de, wTempPic
	call FarCopyData
	pop bc
	push bc
	ld hl, wTempPic
.mirror
	ld a, [hl]
	push hl
	ld l, a
	ld h, HIGH(StorageReverseBits)
	ld a, [hl]
	pop hl
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .mirror
	ld a, [wStorageFrontBase]
	ld l, a
	ld h, 0
	REPT 4
		add hl, hl
	ENDR
	ld de, vFrontPic
	add hl, de
	ld d, h
	ld e, l
	ld hl, wTempPic
	pop bc
	call StorageCopyToVRAM
.placeTiles
	; Raw graphics are row-major. Bottom-align and mirror their tile columns
	; inside the same seven-by-seven area as the original sprite routine.
	ld a, [wMonHSpriteDim]
	and $f
	ld [wStorageIndex], a
	ld c, a
	ld a, [wMonHSpriteDim]
	swap a
	and $f
	ld b, a
	ld a, 7
	sub b
	hlcoord 1, 1
	ld de, SCREEN_WIDTH
.alignY
	and a
	jr z, .alignX
	add hl, de
	dec a
	jr .alignY
.alignX
	ld a, 8
	sub c
	srl a
	ld e, a
	ld a, 6
	sub e
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wStorageFrontBase]
.row
	push hl
	push af
	ld a, [wStorageIndex]
	ld c, a
	pop af
.column
	ld [hld], a
	inc a
	dec c
	jr nz, .column
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .row
	ret

ALIGN 8
StorageReverseBits:
	FOR value, 256
		db ((value & 1) << 7) | ((value & 2) << 5) | ((value & 4) << 3) | ((value & 8) << 1) | ((value & $10) >> 1) | ((value & $20) >> 3) | ((value & $40) >> 5) | ((value & $80) >> 7)
	ENDR

StorageDrawSourceCursor:
	ld a, [wStorageHolding]
	and a
	ret z
	ld a, [wStorageSourceBox]
	cp STORAGE_PARTY
	jr z, .party
	ld b, a
	ld a, [wCurrentBoxNum]
	and $7f
	cp b
	ret nz
	ld a, [wStorageSourceSlot]
	jr .slot
.party
	ld a, [wStorageSourceSlot]
	add MONS_PER_BOX
.slot
	call StorageSlotCoord
	ld de, SCREEN_WIDTH
	add hl, de
	dec hl
	ld [hl], '▷'
	ret

; Contiguous four-tile minisprites, starting at NPC tile zero.
StorageIconTile:
	ld e, a
	ld d, 0
	ld hl, wStorageMiniTiles
	add hl, de
	ld a, [hl]
	ret

; Three spare four-tile slots ($6d-$78) stage changed icons off-screen.
; Normal/shiny swaps reuse their existing slots and update only the hidden
; map and attributes. Full box changes can fall back to replacing old slots.
StorageMiniCacheIndex:
	cp $6d
	jr c, .regular
	sub $6d
	rrca
	rrca
	add MONS_PER_BOX + PARTY_LENGTH
	ret
.regular
	rrca
	rrca
	ret

StoragePrepareMiniCache:
	ld a, [wStorageMiniCacheReady]
	and a
	jr nz, .snapshot
	ld hl, wStorageMiniTiles
	ld b, MONS_PER_BOX + PARTY_LENGTH
	xor a
.initialize
	ld [hli], a
	add 4
	dec b
	jr nz, .initialize
	ld hl, wStorageMiniSpecies
	ld bc, MONS_PER_BOX + PARTY_LENGTH + 3
	xor a
	call FillMemory
	inc a
	ld [wStorageMiniCacheReady], a
.snapshot
	ld hl, wStorageMiniTiles
	ld de, wStorageMiniPreviousTiles
	ld bc, MONS_PER_BOX + PARTY_LENGTH
	jp CopyData

StorageAllocateMiniSlot:
	ld c, 0
.candidate
	ld a, c
	cp MONS_PER_BOX + PARTY_LENGTH
	jr c, .regular
	sub MONS_PER_BOX + PARTY_LENGTH
	add a
	add a
	add $6d
	jr .check
.regular
	add a
	add a
.check
	ld b, a
	ld hl, wStorageMiniPreviousTiles
	call .used
	jr z, .next
	ld hl, wStorageMiniTiles
	call .used
	jr z, .next
	ld a, [wStorageDrawSlot]
	ld e, a
	ld d, 0
	ld hl, wStorageMiniTiles
	add hl, de
	ld [hl], b
	ld a, b
	ld [wStorageDrawTile], a
	ld a, c
	ret
.next
	inc c
	ld a, c
	cp MONS_PER_BOX + PARTY_LENGTH + 3
	jr c, .candidate
	ld a, [wStorageDrawTile]
	jp StorageMiniCacheIndex
.used
	ld d, MONS_PER_BOX + PARTY_LENGTH
.scan
	ld a, [hli]
	cp b
	ret z
	dec d
	jr nz, .scan
	or 1
	ret

StorageCursorVisualIndex:
	ld a, [wStorageCursor]
	cp STORAGE_TITLE
	ret z
	ld b, a
	ld a, [wStoragePanel]
	and a
	ld a, b
	ret z
	add MONS_PER_BOX
	ret

StorageLoadHintGraphics:
	ld de, StorageHintGraphics
	ld hl, vChars0 tile $c8
	lb bc, BANK(StorageHintGraphics), 6
	call CopyVideoDataAlternate
	ld de, StoragePartyLabelGraphics
	ld hl, vChars0 tile $d0
	lb bc, BANK(StoragePartyLabelGraphics), 5
	call CopyVideoDataAlternate
	ret

StorageDrawHints:
	hlcoord 0, 16
	ld a, $d0
	ld b, 3
	call .tiles
	hlcoord 0, 17
	ld a, $d3
	ld b, 2
	call .tiles
	; Column two on the bottom row stays blank for the first party cursor.
	hlcoord 7, 15
	ld a, $c8
	ld b, 6
.tiles
.tile
	ld [hli], a
	inc a
	dec b
	jr nz, .tile
	ret

StorageHintGraphics:
	INCBIN "gfx/storage/controls.2bpp"
StoragePartyLabelGraphics:
	; The sixth source tile is all white and belongs to the cursor position.
	INCBIN "gfx/storage/party_label.2bpp", 0, 5 tiles

StorageFrameGraphics:
	INCBIN "gfx/storage/storage_frame.2bpp"
.End
	ASSERT .End - StorageFrameGraphics == 10 tiles

; The main storage panels use the supplied ten-tile frame, regardless of
; the Options frame. Action and confirmation menus keep the standard frame.
StorageTextBoxBorder:
	push hl
	ld a, $62
	ld [hli], a
	ld a, $63
	call .fill
	ld [hl], $65
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
.row
	push hl
	ld a, $66
	ld [hli], a
	ld a, ' '
	call .fill
	ld [hl], $66
	pop hl
	add hl, de
	dec b
	jr nz, .row
	ld a, $6a
	ld [hli], a
	ld a, $63
	call .fill
	ld [hl], $6b
	ret
.fill
	ld d, c
.tile
	ld [hli], a
	dec d
	jr nz, .tile
	ld de, SCREEN_WIDTH
	ret

StorageDrawTitleArrows:
	ld a, [wStorageCursor]
	cp STORAGE_TITLE
	ld a, ' '
	jr nz, .left
	ld a, $d6
.left
	ldcoord_a 9, 1
	ld a, [wStorageCursor]
	cp STORAGE_TITLE
	ld a, ' '
	jr nz, .right
	ld a, '▶'
.right
	ldcoord_a 18, 1
	ret

; Cursor movement keeps all grid tiles in VRAM and never blanks the LCD.
StorageRefreshSelection:
	xor a
	ldh [hAutoBGTransferEnabled], a
	; Prepare the other map, retaining the old complete preview on screen.
	ldh a, [hAutoBGTransferDest + 1]
	xor 4
	ldh [hAutoBGTransferDest + 1], a
	ld a, [wStoragePanel]
	push af
	ld a, [wStorageCursor]
	push af
	ld a, [wStorageLastCursor]
	ld b, 0
	cp STORAGE_TITLE
	jr z, .oldSelection
	cp MONS_PER_BOX
	jr c, .oldSelection
	sub MONS_PER_BOX
	inc b
.oldSelection
	ld [wStorageCursor], a
	ld a, b
	ld [wStoragePanel], a
	xor a
	ld [wStorageAnimFrame], a
	call StorageUpdateSelectedIcon
	pop af
	ld [wStorageCursor], a
	pop af
	ld [wStoragePanel], a
	ld a, [wStorageLastCursor]
	cp STORAGE_TITLE
	jr nz, .oldSlot
	jr .preview
.oldSlot
	call StorageSlotCoord
	ld de, SCREEN_WIDTH
	add hl, de
	dec hl
.erase
	ld [hl], ' '
.preview
	hlcoord 1, 1
	lb bc, 7, 7
	call ClearScreenArea
	hlcoord 9, 3
	lb bc, 5, 10
	call ClearScreenArea
	call StorageDrawPreview
	call StorageDrawCursor
	call StorageDrawTitleArrows
	ld a, [wStorageAttributesReady]
	and a
	jr nz, .attributesReady
	call StorageSetAttributes
	ld a, 1
	ld [wStorageAttributesReady], a
.attributesReady
	farcall StoragePreparePreviewPalettes
	call StorageCursorVisualIndex
	ld [wStorageLastCursor], a
	xor a
	ld [wStorageAnimCounter], a
	ld [wStorageAnimFrame], a
	call StorageUploadMap
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	farcall StorageCommitPreview
	ret

; Copy the prepared 20x18 map directly through safe LCD access windows.
; The hidden destination needs no three-frame automatic-transfer wait.
StorageUploadMap:
	ld hl, wTileMap
	ldh a, [hAutoBGTransferDest]
	ld e, a
	ldh a, [hAutoBGTransferDest + 1]
	ld d, a
	ld b, SCREEN_HEIGHT
.row
	push bc
	ld bc, SCREEN_WIDTH
	call StorageCopyToVRAM
	ld a, e
	add BG_MAP_WIDTH - SCREEN_WIDTH
	ld e, a
	jr nc, .next
	inc d
.next
	pop bc
	dec b
	jr nz, .row
	ret

StorageAnimateSelected:
	ld a, [wStorageCursor]
	cp STORAGE_TITLE
	ret z
	ld hl, wStorageAnimCounter
	inc [hl]
	ld a, [hl]
	cp 10
	ret c
	xor a
	ld [hl], a
	ld a, [wStorageAnimFrame]
	xor 1
	ld [wStorageAnimFrame], a
	call StorageUpdateSelectedIcon
	jp StorageRestorePreviewData

; Replace just the selected icon's four tiles using the existing party frames.
StorageUpdateSelectedIcon:
	call StorageSelectMon
	ret c
	call LoadMonData
	farcall LoadStorageMonIcon
	call StorageCursorVisualIndex
	call StorageIconTile
	push af
	call StorageMiniCacheIndex
	ld e, a
	ld d, 0
	ld hl, wStorageMiniSpecies
	add hl, de
	ld a, [wStorageAnimFrame]
	and a
	jr z, .baseFrame
	xor a
	jr .cacheFrame
.baseFrame
	ld a, [wLoadedMonSpecies]
.cacheFrame
	; Animated tiles must be restored before being reused by a redraw.
	; Zero marks the alternate frame as needing a fresh base-frame upload.
	ld [hl], a
	pop af
	ld l, a
	ld h, 0
	REPT 4
		add hl, hl
	ENDR
	ld de, vChars0
	add hl, de
	ld d, h
	ld e, l
	ld hl, wStorageIconBuffer
	ld a, [wStorageAnimFrame]
	and a
	jr z, .top
	ld hl, wStorageIconBuffer + 2 tiles
.top
	ld bc, 2 tiles
	call StorageCopyToVRAM
	ld hl, wStorageIconBuffer + 4 tiles
	ld a, [wStorageAnimFrame]
	and a
	jr z, .bottom
	ld hl, wStorageIconBuffer + 6 tiles
.bottom
	ld bc, 2 tiles
	jp StorageCopyToVRAM

; A -> [HL++], without writing during inaccessible LCD modes.
StorageWriteVRAMByte:
	push af
	di
.wait
	ldh a, [rSTAT]
	and %10
	jr nz, .wait
	pop af
	ld [hli], a
	ei
	ret

; RAM HL -> VRAM DE, BC bytes. The LCD remains enabled throughout.
StorageCopyToVRAM:
	ld a, b
	or c
	ret z
	; Every graphics upload has an even length. Retain support for an odd
	; byte count, then copy pairs that fit in the mode-2 access window.
	bit 0, c
	jr z, .pair
	ld a, [hli]
	push hl
	ld h, d
	ld l, e
	call StorageWriteVRAMByte
	ld d, h
	ld e, l
	pop hl
	dec bc
	ld a, b
	or c
	ret z
.pair
	ld a, [hli]
	push af
	di
.wait
	ldh a, [rSTAT]
	and %10
	jr nz, .wait
	pop af
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ei
	dec bc
	dec bc
	ld a, b
	or c
	jr nz, .pair
	ret

StorageFillVRAM:
.byte
	call StorageWriteVRAMByte
	dec bc
	push af
	ld a, b
	or c
	jr z, .done
	pop af
	jr .byte
.done
	pop af
	ret

; CGB attributes only. On DMG all tile patterns work in VRAM bank zero.
; Clear inherited attributes once, rather than exposing palette zero on every
; box/party redraw while the LCD is running.
StorageClearAttributes:
	ldh a, [hGBC]
	and a
	ret z
	ld a, 1
	ldh [rVBK], a
	ld hl, vBGMap0
	ld bc, BG_MAP_WIDTH * BG_MAP_HEIGHT
	xor a
	call StorageFillVRAM
	ld hl, vBGMap1
	ld bc, BG_MAP_WIDTH * BG_MAP_HEIGHT
	xor a
	call StorageFillVRAM
	xor a
	ldh [rVBK], a
	ret

StorageSetAttributes:
	ldh a, [hGBC]
	and a
	ret z
	ld a, 1
	ldh [rVBK], a
	call StorageSetFrameAttributes
	ld hl, vBGMap0 + BG_MAP_WIDTH + 1
	lb bc, 7, 7
	ld a, 1
	call .rectangle
	ld hl, vBGMap1 + BG_MAP_WIDTH + 1
	lb bc, 7, 7
	ld a, 1
	call .rectangle
	xor a
	ld [wStorageDrawSlot], a
.icon
	; Drawing already classified every occupied slot. Reuse that result
	; instead of loading all box/party records again on each map page.
	ld a, [wStorageDrawSlot]
	ld e, a
	ld d, 0
	ld hl, wStorageMiniPalettes
	add hl, de
	ld a, [hl]
	and a
	jr z, .next
	ld [wStorageDrawPalette], a
	ld a, [wStorageDrawSlot]
	call .attributeCoord
	push hl
	ld a, [wStorageDrawPalette]
	lb bc, 2, 2
	call .rectangle
	pop hl
	ld de, vBGMap1 - vBGMap0
	add hl, de
	ld a, [wStorageDrawPalette]
	lb bc, 2, 2
	call .rectangle
.next
	ld hl, wStorageDrawSlot
	inc [hl]
	ld a, [wStorageDrawSlot]
	cp MONS_PER_BOX + PARTY_LENGTH
	jr c, .icon
	ld hl, vBGMap0 + 5 * BG_MAP_WIDTH + 15
	lb bc, 2, 2
	ld a, PAL_BG_MOVE_TYPE
	call .rectangle
	ld hl, vBGMap1 + 5 * BG_MAP_WIDTH + 15
	lb bc, 2, 2
	ld a, PAL_BG_MOVE_TYPE
	call .rectangle
	ld hl, vBGMap0 + 5 * BG_MAP_WIDTH + 17
	lb bc, 2, 2
	ld a, PAL_BG_MOVE_CATEGORY
	call .rectangle
	ld hl, vBGMap0 + 15 * BG_MAP_WIDTH + 7
	lb bc, 1, 6
	ld a, 2
	call .rectangle
	ld hl, vBGMap1 + 15 * BG_MAP_WIDTH + 7
	lb bc, 1, 6
	ld a, 2
	call .rectangle
	ld hl, vBGMap0 + 16 * BG_MAP_WIDTH
	lb bc, 1, 3
	ld a, 4
	call .rectangle
	ld hl, vBGMap1 + 16 * BG_MAP_WIDTH
	lb bc, 1, 3
	ld a, 4
	call .rectangle
	ld hl, vBGMap0 + 17 * BG_MAP_WIDTH
	lb bc, 1, 2
	ld a, 4
	call .rectangle
	ld hl, vBGMap1 + 17 * BG_MAP_WIDTH
	lb bc, 1, 2
	ld a, 4
	call .rectangle
	ld hl, vBGMap1 + 5 * BG_MAP_WIDTH + 17
	lb bc, 2, 2
	ld a, PAL_BG_MOVE_CATEGORY
	call .rectangle
	xor a
	ldh [rVBK], a
	; Attribute calculation used LoadMonData; restore preview species/palettes.
	jp StorageRestorePreviewData
.attributeCoord
	cp MONS_PER_BOX
	jr c, .boxCoord
	sub MONS_PER_BOX
	ld hl, vBGMap0 + 16 * BG_MAP_WIDTH + 3
	jr .column
.boxCoord
	ld hl, vBGMap0 + 9 * BG_MAP_WIDTH + 2
.row
	cp 6
	jr c, .column
	sub 6
	ld de, 2 * BG_MAP_WIDTH
	add hl, de
	jr .row
.column
	ld e, a
	add a
	add e
	ld e, a
	ld d, 0
	add hl, de
	ret
.rectangle
	; Only modify the map being prepared. The other map may still be showing
	; a printer message while storage is rebuilt off-screen.
	push af
	ld a, h
	and 4
	ld e, a
	ldh a, [hAutoBGTransferDest + 1]
	and 4
	cp e
	jr z, .activeMap
	pop af
	ret
.activeMap
	pop af
	ld d, a
.rectRow
	push bc
	push hl
.rectColumn
	ld a, d
	call StorageWriteVRAMByte
	dec c
	jr nz, .rectColumn
	pop hl
	ld bc, BG_MAP_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .rectRow
	ret

; Attribute only custom frame tiles in the map currently being prepared.
; BG7 owns its two gray shades; text, minis and badges keep their palettes.
StorageSetFrameAttributes:
	ld hl, wTileMap
	ldh a, [hAutoBGTransferDest]
	ld e, a
	ldh a, [hAutoBGTransferDest + 1]
	ld d, a
	ld b, SCREEN_HEIGHT
.row
	ld c, SCREEN_WIDTH
.tile
	ld a, [hli]
	cp $62
	jr c, .nextTile
	cp $6c
	jr nc, .nextTile
	push hl
	ld h, d
	ld l, e
	ld a, 7
	call StorageWriteVRAMByte
	pop hl
.nextTile
	inc de
	dec c
	jr nz, .tile
	ld a, e
	add BG_MAP_WIDTH - SCREEN_WIDTH
	ld e, a
	jr nc, .nextRow
	inc d
.nextRow
	dec b
	jr nz, .row
	ret

StorageRestorePreviewData:
	ld a, [wStorageHolding]
	and a
	jr z, .selected
	ld hl, wStorageHeld
	ld de, wLoadedMon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyData
	ld a, [wLoadedMonSpecies]
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a
	call GetMonHeader
	jr .palette
.selected
	call StorageSelectMon
	jr c, .empty
	call LoadMonData
.palette
	ld de, wLoadedMonDVs
	farcall IsMonShiny
	ld a, 0
	jr z, .flag
	inc a
.flag
	ld [wShinyMonFlag], a
	ld a, [wMonHType1]
	ld [wMoveTypeIconPalette], a
	ld a, [wMonHType2]
	or $80
	ld [wMoveCategoryIconPalette], a
	ret
.empty
	xor a
	ld [wCurPartySpecies], a
	ld [wShinyMonFlag], a
	ret

StorageMonMenu:
	ld hl, vBGMap0 + 7 * BG_MAP_WIDTH + 8
	lb bc, 9, 12
	call StorageNeutralOverlay
	hlcoord 8, 7
	lb bc, 7, 10
	call TextBoxBorder
	hlcoord 10, 8
	ld de, .actions
	call PlaceString
	lb bc, 8, 3
	call StorageActionInput
	ret c
	and a
	jp z, StorageSummary
	dec a
	jp z, StorageRelease
	dec a
	jp z, StoragePrintBox
	ret
.actions
	db "Summary"
	next "Release"
	next "Print Box"
	next "Cancel@"

; B = first row, C = highest menu item. Return A=item, carry on B.
StorageActionInput:
	ld a, b
	ld [wTopMenuItemY], a
	ld a, 9
	ld [wTopMenuItemX], a
	ld a, c
	ld [wMaxMenuItem], a
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld [wListScrollOffset], a
	ld [wMenuWatchMovingOutOfBounds], a
	ld a, A_BUTTON | B_BUTTON
	ld [wMenuWatchedKeys], a
	call HandleMenuInput
	bit BIT_B_BUTTON, a
	jr nz, .cancel
	ld a, [wCurrentMenuItem]
	and a
	ret
.cancel
	scf
	ret

StoragePrintBox:
	xor a
	ld [wStorageFrontValid], a
	call StorageBackupState
	; 2/3 identify printer mode and remember the original map outside the
	; scratch area borrowed by the printer. Leave the visible colors intact.
	ldh a, [hAutoBGTransferDest + 1]
	push af
	and 4
	rrca
	rrca
	add 2
	ld [wStorageUIActive], a
	callfar PrintPCBox
	call StorageRestoreState
	pop af
	ldh [hAutoBGTransferDest + 1], a
	xor a
	ldh [hAutoBGTransferDest], a
	ld a, 4
	ld [wStorageUIActive], a
	; Printer messages changed only the other map and did not replace font
	; graphics. Rebuild storage there, then reveal it without a blank frame.
	call StorageDrawScreen
	call StorageRevealMap
	ld a, 1
	ld [wStorageUIActive], a
	xor a
	ret

; Called after the printer has prepared its message in wTileMap. Compose
; tiles and neutral attributes on the hidden map before revealing either.
StorageShowPrinterMessage::
	ld a, [wStorageUIActive]
	cp 3
	ld a, HIGH(vBGMap0)
	jr z, .map
	ld a, HIGH(vBGMap1)
.map
	ldh [hAutoBGTransferDest + 1], a
	xor a
	ldh [hAutoBGTransferDest], a
	ldh a, [hGBC]
	and a
	jr z, .previewReady
	ld a, 1
	ldh [rVBK], a
	ld hl, vBGMap0 + BG_MAP_WIDTH + 1
	lb bc, 4, 7
	call StorageSetAttributes.rectangle
	ld hl, vBGMap1 + BG_MAP_WIDTH + 1
	lb bc, 4, 7
	ld a, 1
	call StorageSetAttributes.rectangle
	xor a
	ldh [rVBK], a
.previewReady
	ld hl, vBGMap0 + 5 * BG_MAP_WIDTH
	lb bc, 12, SCREEN_WIDTH
	call StorageNeutralOverlay
	ldh a, [hAutoBGTransferDest + 1]
	ld d, a
	ld e, 0
	ld hl, wTileMap
	ld b, SCREEN_HEIGHT
.row
	push bc
	ld bc, SCREEN_WIDTH
	call StorageCopyToVRAM
	ld a, e
	add BG_MAP_WIDTH - SCREEN_WIDTH
	ld e, a
	jr nc, .next
	inc d
.next
	pop bc
	dec b
	jr nz, .row
	call StorageRevealMap
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	ret

StorageRevealMap:
	ldh a, [hAutoBGTransferDest + 1]
	and 4
	add a
	ld b, a
	ldh a, [rLCDC]
	and ~8
	or b
	ld b, a
	; The storage STAT split must remain active throughout the wait.
	ei
.lastLine
	ldh a, [rLY]
	cp 143
	jr nz, .lastLine
	di
.vblank
	ldh a, [rLY]
	cp 144
	jr c, .vblank
	ld a, b
	ldh [rLCDC], a
	ei
	ret

StorageBackupState:
	xor a
	call SwitchSRAMBankAndLatchClockData
	xor a
	ld [MBC1SRamBank], a
	ld hl, wStorageState
	ld de, sStorageUIBackup
	ld bc, wStorageStateEnd - wStorageState
	call CopyData
	xor a
	ld [MBC1SRamEnable], a
	ld [MBC1SRamBankingMode], a
	ret

StorageBackupOverworldMap:
	xor a
	call SwitchSRAMBankAndLatchClockData
	ld hl, wOverworldMap
	ld de, sStorageOverworldMap
	ld bc, wOverworldMapEnd - wOverworldMap
	call CopyData
	jp StorageCloseSRAM

StorageRestoreOverworldMap:
	xor a
	call SwitchSRAMBankAndLatchClockData
	ld hl, sStorageOverworldMap
	ld de, wOverworldMap
	ld bc, wOverworldMapEnd - wOverworldMap
	call CopyData
	jp StorageCloseSRAM

; Both map pages are borrowed by storage double-buffering. The overworld
; retains a scrolling 32x32 BG map, beyond the visible 20x18 window snapshot.
; Preserve all tiles and CGB attributes while the LCD is disabled.
StorageBackupOverworldBG:
	xor a
	call SwitchSRAMBankAndLatchClockData
	ldh [rVBK], a
	ld a, 2
	ld [MBC1SRamBank], a
	ld hl, vBGMap0
	ld de, sStorageOverworldBGTiles
	ld bc, BG_MAP_WIDTH * BG_MAP_HEIGHT
	call CopyData
	ldh a, [hGBC]
	and a
	jr z, .done
	ld a, 1
	ldh [rVBK], a
	ld a, 3
	ld [MBC1SRamBank], a
	ld hl, vBGMap0
	ld de, sStorageOverworldBGAttributes
	ld bc, BG_MAP_WIDTH * BG_MAP_HEIGHT
	call CopyData
.done
	xor a
	ldh [rVBK], a
	ld a, 1
	ld [wStorageBGBackupReady], a
	jp StorageCloseSRAM

StorageRestoreOverworldBG:
	ld a, [wStorageBGBackupReady]
	and a
	ret z
	xor a
	call SwitchSRAMBankAndLatchClockData
	ldh [rVBK], a
	ld a, 2
	ld [MBC1SRamBank], a
	ld hl, sStorageOverworldBGTiles
	ld de, vBGMap0
	ld bc, BG_MAP_WIDTH * BG_MAP_HEIGHT
	call CopyData
	ldh a, [hGBC]
	and a
	jr z, .done
	ld a, 1
	ldh [rVBK], a
	ld a, 3
	ld [MBC1SRamBank], a
	ld hl, sStorageOverworldBGAttributes
	ld de, vBGMap0
	ld bc, BG_MAP_WIDTH * BG_MAP_HEIGHT
	call CopyData
.done
	xor a
	ldh [rVBK], a
	jp StorageCloseSRAM

StorageRestoreState:
	xor a
	call SwitchSRAMBankAndLatchClockData
	xor a
	ld [MBC1SRamBank], a
	ld hl, sStorageUIBackup
	ld de, wStorageState
	ld bc, wStorageStateEnd - wStorageState
	call CopyData
	xor a
	ld [MBC1SRamEnable], a
	ld [MBC1SRamBankingMode], a
	ret

StorageSummary:
	xor a
	ld [wStorageFrontValid], a
	call StorageSelectMon
	ret c
	call StorageBackupState
	xor a
	ld [wStorageUIActive], a
	ldh a, [rSTAT]
	and ~$40
	ldh [rSTAT], a
	ldh a, [rLCDC]
	and ~$10
	ldh [rLCDC], a
	predef StatusScreenOriginal
	call StorageRestoreState
	call StorageBlankTransition
	xor a
	ld [wStorageFontReady], a
	ld a, 1
	ld [wStorageUIActive], a
	ret

StoragePickUp:
	call StorageSelectMon
	ret c
	ld de, wStorageHeld
	call StorageReadRecord
	ld a, [wStorageCursor]
	ld [wStorageSourceSlot], a
	ld a, [wStoragePanel]
	and a
	ld a, STORAGE_PARTY
	jr nz, .source
	ld a, [wCurrentBoxNum]
	and $7f
.source
	ld [wStorageSourceBox], a
	ld a, 1
	ld [wStorageHolding], a
	ret

StoragePlaceHeld:
	ld a, [wCurrentBoxNum]
	and $7f
	ld [wStorageDisplayBox], a
	ld a, [wStoragePanel]
	and a
	ld a, STORAGE_PARTY
	jr nz, .target
	ld a, [wCurrentBoxNum]
	and $7f
.target
	ld [wStorageTargetBox], a
	ld b, a
	ld a, [wStorageCursor]
	; Empty party columns are append destinations, never record indexes.
	; Normalize before selection, swapping, or starting a transaction.
	ld c, a
	ld a, b
	cp STORAGE_PARTY
	ld a, c
	jr nz, .targetSlot
	ld a, [wPartyCount]
	cp c
	jr c, .targetSlot
	ld a, c
.targetSlot
	ld [wStorageTargetSlot], a
	ld c, a
	ld a, [wStorageSourceBox]
	cp b
	jr nz, .different
	ld a, [wStorageSourceSlot]
	cp c
	jr nz, .different
	xor a
	ld [wStorageHolding], a
	ret
.different
	call StorageSelectMon
	ld a, 0
	jr c, .emptyTarget
	ld de, wStorageOther
	call StorageReadRecord
	ld a, 1
.emptyTarget
	ld [wStorageTargetOccupied], a
	call StorageCheckPlacement
	ret c
	call StorageSwapMiniSlots
	ld a, [wStorageSourceBox]
	ld b, a
	ld a, [wStorageTargetBox]
	cp b
	jr nz, .cross
	cp STORAGE_PARTY
	jp z, StorageSwapParty
	jp StorageRearrangeBox
.cross
	call StorageBeginTransaction
	ld a, [wStorageSourceBox]
	cp STORAGE_PARTY
	jp z, .sourceParty
	call StorageLoadBox
	ld a, [wStorageSourceSlot]
	call StorageRemoveBoxSlot
	ld a, [wStorageTargetOccupied]
	and a
	jr z, .sourceStaged
	ld a, 1
	ld [wStorageMenuChoice], a
	ld hl, wStorageOther
	ld a, [wStorageSourceSlot]
	call StorageAppendBoxRecord
.sourceStaged
	call StorageStageBoxA
	ld a, [wStorageTargetBox]
	cp STORAGE_PARTY
	jr z, .targetParty
	call StorageLoadBox
	ld a, [wStorageTargetOccupied]
	and a
	jr z, .appendBox
	ld a, [wStorageTargetSlot]
	call StorageRemoveBoxSlot
.appendBox
	xor a
	ld [wStorageMenuChoice], a
	ld hl, wStorageHeld
	ld a, [wStorageTargetSlot]
	call StorageAppendBoxRecord
	call StorageStageBoxB
	jr .commit
.targetParty
	ld a, [wStorageTargetOccupied]
	and a
	jr z, .partyAppend
	ld a, [wStorageTargetSlot]
	call StorageRemovePartyIndex
.partyAppend
	ld a, [wPartyCount]
	ld b, a
	ld a, [wStorageTargetSlot]
	cp b
	jr c, .insertParty
	ld a, b
.insertParty
	ld hl, wStorageHeld
	call StorageInsertPartyRecord
	ld a, [wStorageIndex]
	ld [wStorageCursor], a
	ld a, [wCurrentBoxNum]
	and $7f
	ld b, a
	ld a, [wStorageDisplayBox]
	cp b
	jr z, .commit
	call StorageLoadBox
	call StorageStageBoxB
	jr .commit
.sourceParty
	ld a, [wStorageSourceSlot]
	call StorageRemovePartyIndex
	ld a, [wStorageTargetOccupied]
	and a
	jr z, .deposit
	ld hl, wStorageOther
	ld a, [wStorageSourceSlot]
	call StorageInsertPartyRecord
.deposit
	ld a, [wStorageTargetOccupied]
	and a
	jr z, .boxAppend
	ld a, [wStorageTargetSlot]
	call StorageRemoveBoxSlot
.boxAppend
	xor a
	ld [wStorageMenuChoice], a
	ld hl, wStorageHeld
	ld a, [wStorageTargetSlot]
	call StorageAppendBoxRecord
	call StorageStageBoxA
.commit
	call StorageCommitTransaction
	xor a
	ld [wStorageHolding], a
	ret

StorageRearrangeBox:
	call StorageBeginTransaction
	ld a, [wStorageSourceSlot]
	ld e, a
	ld d, 0
	ld hl, wStorageMap
	add hl, de
	ld b, [hl]
	push hl
	ld a, [wStorageTargetSlot]
	ld e, a
	ld hl, wStorageMap
	add hl, de
	ld c, [hl]
	ld [hl], b
	pop hl
	ld [hl], c
	call StorageStageBoxA
	call StorageCommitTransaction
	xor a
	ld [wStorageHolding], a
	ret

StorageSwapMiniSlots:
	ld a, [wStorageMiniCacheReady]
	and a
	ret z
	ld a, [wStorageTargetOccupied]
	and a
	ret z
	ld a, [wStorageSourceBox]
	cp STORAGE_PARTY
	jr z, .partySource
	ld b, a
	ld a, [wStorageDisplayBox]
	cp b
	ret nz
	ld a, [wStorageSourceSlot]
	jr .source
.partySource
	ld a, [wStorageSourceSlot]
	add MONS_PER_BOX
.source
	ld c, a
	ld a, [wStorageTargetBox]
	cp STORAGE_PARTY
	ld a, [wStorageTargetSlot]
	jr nz, .target
	add MONS_PER_BOX
.target
	ld e, a
	ld d, 0
	ld hl, wStorageMiniTiles
	add hl, de
	ld b, [hl]
	push hl
	ld e, c
	ld hl, wStorageMiniTiles
	add hl, de
	ld a, [hl]
	ld [hl], b
	pop hl
	ld [hl], a
	ret

StorageSwapParty:
	ld a, [wStorageTargetOccupied]
	and a
	jr nz, .swap
	; Dropping on an unused party slot moves the source to the end.
	call StorageBeginTransaction
	ld a, [wStorageSourceSlot]
	call StorageRemovePartyIndex
	ld hl, wStorageHeld
	call StorageAppendPartyRecord
	ld a, [wStorageIndex]
	ld [wStorageCursor], a
	jr .commit
.swap
	call StorageBeginTransaction
	ld hl, wStorageOther
	ld a, [wStorageSourceSlot]
	call StorageWritePartyRecord
	ld hl, wStorageHeld
	ld a, [wStorageTargetSlot]
	call StorageWritePartyRecord
.commit
	call StorageStageBoxA
	call StorageCommitTransaction
	xor a
	ld [wStorageHolding], a
	ret

StorageCheckPlacement:
	ld a, [wStorageSourceBox]
	cp STORAGE_PARTY
	jr nz, .boxSource
	ld a, [wStorageTargetBox]
	cp STORAGE_PARTY
	jr z, .ok
	ld a, [wStorageTargetOccupied]
	and a
	jr nz, .checkSourcePikachu
	ld a, [wPartyCount]
	cp 1
	jr z, .lastMon
.checkSourcePikachu
	ld a, [wStorageSourceSlot]
	ld [wWhichPokemon], a
	callfar IsThisPartymonStarterPikachu_Party
	jr nc, .ok
	call CheckPikachuFollowingPlayer
	jr nz, .pikachu
	jr .ok
.boxSource
	ld a, [wStorageTargetBox]
	cp STORAGE_PARTY
	jr nz, .ok
	ld a, [wStorageTargetOccupied]
	and a
	jr nz, .partySwap
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	jr c, .ok
	ld hl, .fullPartyText
	jr .error
.partySwap
	ld a, [wStorageTargetSlot]
	ld [wWhichPokemon], a
	callfar IsThisPartymonStarterPikachu_Party
	jr nc, .ok
	call CheckPikachuFollowingPlayer
	jr nz, .pikachu
.ok
	and a
	ret
.lastMon
	ld hl, .lastText
	jr .error
.pikachu
	ld hl, .pikachuText
.error
	call StorageMessage
	scf
	ret
.lastText
	db "Keep one in party.@"
.pikachuText
	db "Pikachu must stay.@"
.fullPartyText
	db "Party is full.@"

StorageRelease:
	call StorageSelectMon
	ret c
	ld a, [wStoragePanel]
	and a
	jr z, .box
	ld a, [wPartyCount]
	cp 1
	jr z, .lastMon
	callfar IsThisPartymonStarterPikachu_Party
	jr c, .pikachu
	jr .confirm
.box
	callfar IsThisPartymonStarterPikachu_Box
	jr c, .pikachu
.confirm
	hlcoord 1, 10
	ld de, .question
	call PlaceString
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ret nz
	call StorageBeginTransaction
	ld a, [wStoragePanel]
	and a
	ld a, [wStorageCursor]
	jr z, .removeBox
	call StorageRemovePartyIndex
	jr .commit
.removeBox
	call StorageRemoveBoxSlot
.commit
	call StorageStageBoxA
	call StorageCommitTransaction
	ret
.lastMon
	ld hl, .lastText
	jp StorageMessage
.pikachu
	ld hl, .pikachuText
	jp StorageMessage
.question
	db "Release this <PKMN>?@"
.lastText
	db "Keep one in party.@"
.pikachuText
	db "Can't release Pika.@"

; Small in-screen messages avoid borrowing the overworld/status scratch.
StorageMessage:
	push hl
	ld hl, vBGMap0 + 12 * BG_MAP_WIDTH
	lb bc, 6, SCREEN_WIDTH
	call StorageNeutralOverlay
	pop hl
	ld d, h
	ld e, l
	push de
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBoxBorder
	pop de
	hlcoord 1, 14
	call PlaceString
	call WaitForTextScrollButtonPress
	ret

; HL = rectangle in map zero, B = rows, C = columns. Clear both maps'
; attributes without touching the preview palette or resetting any colors.
StorageNeutralOverlay:
	ldh a, [hGBC]
	and a
	ret z
	ld a, 1
	ldh [rVBK], a
	push hl
	push bc
	xor a
	call StorageSetAttributes.rectangle
	pop bc
	pop hl
	ld de, vBGMap1 - vBGMap0
	add hl, de
	xor a
	call StorageSetAttributes.rectangle
	xor a
	ldh [rVBK], a
	ret
