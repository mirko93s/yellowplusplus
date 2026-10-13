; Scrollable player. Menu scratch bytes belong to this screen until exit.
; wCurrentMenuItem: category; wListScrollOffset: selected entry.
; wLastMenuItem: first visible entry; wMenuItemToSwap: row being drawn.
; wMenuJoypadPollCount / wMaxMenuItem: playing group / entry.
SoundTestDebugMenu:
	xor a
	ld [wSoundTestPaused], a
	ld [wSoundTestProgressActive], a
	ld [wSoundTestElapsedFrames], a
	ld [wSoundTestElapsedFrames + 1], a
	ld a, [wLetterPrintingDelayFlags]
	push af
	res 1, a ; redraw the list immediately, without dialogue delays
	ld [wLetterPrintingDelayFlags], a
	ld a, [wFrequencyModifier]
	push af
	ld a, [wTempoModifier]
	push af
	call StopAllMusic
	xor a
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
	ld [wLastMenuItem], a
	ldh [hJoy6], a
	ld a, 1
	ldh [hJoy7], a ; repeat directions after the initial delay
	ld a, $ff
	ld [wMenuJoypadPollCount], a
	call ClearScreen
	ld b, SET_PAL_GENERIC
	call RunPaletteCommand
	call .initColors
	ld de, SoundTestPlayerGraphics
	ld hl, vChars2
	lb bc, BANK(SoundTestPlayerGraphics), 48
	call CopyVideoData
	hlcoord 0, 0
	lb bc, 3, 18
	call .border
	hlcoord 0, 4
	lb bc, 10, 18
	call .border
	; Join the header and list with the supplied middle-frame tiles.
	hlcoord 0, 4
	ld a, $09
	ld [hli], a
	ld a, $04
	ld c, 18
	call StandardTextBoxBorder.PlaceChars
	ld [hl], $0a
	hlcoord 4, 1
	ld de, .title
	call PlaceString
	hlcoord 0, 17
	ld b, 20
	ld a, 16
.controlsTiles
	ld [hli], a
	inc a
	dec b
	jr nz, .controlsTiles
.refresh
	; Keep the previous list visible while composing the new tilemap.
	ldh a, [hAutoBGTransferEnabled]
	push af
	xor a
	ldh [hAutoBGTransferEnabled], a
	hlcoord 1, 5
	lb bc, 10, 18
	call ClearScreenArea
	ld a, [wCurrentMenuItem]
	add a
	ld e, a
	ld d, 0
	ld hl, SoundTestCategoryTitles
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	hlcoord 1, 2
	push hl
	push de
	lb bc, 2, 18
	call ClearScreenArea
	pop de
	pop hl
	call .centerString
	call .drawPlayingTitle
	call .getEntry
	ld a, b
	ld [wNamedObjectIndex], a ; group size, separate from selected index
	ld a, [wLastMenuItem]
	ld [wMenuItemToSwap], a
	hlcoord 1, 5
	ld b, 10
.row
	ld a, [wMenuItemToSwap]
	ld c, a
	ld a, [wNamedObjectIndex]
	cp c
	jp z, .commit
	push bc
	push hl
	ld a, [wListScrollOffset]
	cp c
	jr nz, .playingMarker
	ld [hl], '▶'
.playingMarker
.name
	inc hl
	push hl
	ld a, [wMenuItemToSwap]
	call .copyName
	; Leave the right frame visible even for the longest fixed-width title.
	ld a, '@'
	ld [wStringBuffer + 17], a
	pop hl
	ld de, wStringBuffer
	call PlaceString
	pop hl
	pop bc
	ld de, SCREEN_WIDTH
	add hl, de
	ld a, [wMenuItemToSwap]
	inc a
	ld [wMenuItemToSwap], a
	dec b
	jr nz, .row
.commit
	call .drawSoundMode
	call .drawProgress
	; Publish only the completed list, never the cleared intermediate state.
	pop af
	ldh [hAutoBGTransferEnabled], a
	call Delay3
.loop
	call DelayFrame
	call .oneShotEnded
	jp c, .stop
	call .drawProgress
	call JoypadLowSensitivity
	ldh a, [hJoyPressed]
	bit BIT_SELECT, a
	jp nz, .cycleSoundMode
	ldh a, [hJoy5]
	bit BIT_B_BUTTON, a
	jp nz, .stop
	bit BIT_START, a
	jp nz, .exit
	bit BIT_A_BUTTON, a
	jp nz, .play
	bit BIT_D_LEFT, a
	jp nz, .previousGroup
	bit BIT_D_RIGHT, a
	jp nz, .nextGroup
	bit BIT_D_UP, a
	jr nz, .previous
	bit BIT_D_DOWN, a
	jr z, .loop
	call .getEntry
	ld a, [wListScrollOffset]
	inc a
	cp b
	jr c, .setIndex
	xor a
.setIndex
	ld [wListScrollOffset], a
	ld c, a
	ld a, [wLastMenuItem]
	cp c
	jr c, .checkBottom
	jr z, .checkBottom
	ld a, c
	jr .setTop
.checkBottom
	add 10
	cp c
	jp c, .scrollDown
	jp nz, .refresh
.scrollDown
	ld a, c
	sub 9
.setTop
	ld [wLastMenuItem], a
	jp .refresh
.previous
	call .getEntry
	ld a, [wListScrollOffset]
	and a
	jr nz, .decrement
	ld a, b
.decrement
	dec a
	jr .setIndex
.previousGroup
	ld a, [wCurrentMenuItem]
	dec a
	jr .setGroup
.nextGroup
	ld a, [wCurrentMenuItem]
	inc a
.setGroup
	and 3
	ld [wCurrentMenuItem], a
	xor a
	ld [wLastMenuItem], a
	jr .setIndex
.play
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .newTrack ; one-shot SFX, cries and instruments always restart
	ld a, [wMenuJoypadPollCount]
	ld b, a
	ld a, [wCurrentMenuItem]
	cp b
	jr nz, .newTrack
	ld a, [wMaxMenuItem]
	ld b, a
	ld a, [wListScrollOffset]
	cp b
	jr nz, .newTrack
	ld a, [wSoundTestPaused]
	xor 1
	ld [wSoundTestPaused], a
	and a
	jr z, .resume
	ldh a, [rNR51]
	ld [wSoundTestSavedPanning], a
	xor a
	ldh [rNR51], a
	jp .refresh
.resume
	ld a, [wSoundTestSavedPanning]
	ldh [rNR51], a
	jp .refresh
.newTrack
	xor a
	ld [wSoundTestPaused], a
	ld [wSoundTestProgressActive], a
	call StopAllMusic
	; Use neutral pitch/length modifiers for base cries and battle SFX.
	xor a
	ld [wFrequencyModifier], a
	ld a, $80
	ld [wTempoModifier], a
	call .getEntry
	call PlayMusic
	ld a, [wCurrentMenuItem]
	ld [wMenuJoypadPollCount], a
	ld a, [wListScrollOffset]
	ld [wMaxMenuItem], a
	call .startProgress
	jp .refresh
.oneShotEnded
	; Follow the playing category even if the user is browsing another list.
	ld a, [wMenuJoypadPollCount]
	and a
	ret z ; songs retain their existing play/pause behavior
	cp $ff
	jr z, .notEnded
	ld hl, wChannelSoundIDs
	ld b, 8
.checkChannels
	ld a, [hli]
	and a
	ret nz ; wait for every channel of the sound to finish
	dec b
	jr nz, .checkChannels
	scf
	ret
.notEnded
	and a ; clear carry
	ret

.stop
	xor a
	ld [wSoundTestPaused], a
	ld [wSoundTestProgressActive], a
	call StopAllMusic
	ld a, $ff
	ld [wMenuJoypadPollCount], a
	jp .refresh
.cycleSoundMode
	ld a, [wExtraOptions]
	ld b, a
	inc a
	and 3
	ld c, a
	ld a, b
	and $fc ; preserve font and other settings
	or c
	ld [wExtraOptions], a
	xor a
	ldh [rNR51], a ; audio updates rebuild panning in the new mode
	jp .refresh
.exit
	xor a
	ld [wSoundTestPaused], a
	ld [wSoundTestProgressActive], a
	call StopAllMusic
	pop af
	ld [wTempoModifier], a
	pop af
	ld [wFrequencyModifier], a
	pop af
	ld [wLetterPrintingDelayFlags], a
	xor a
	ldh [hJoy7], a
	jp DebugMenu

; Music timings include the intro on the first pass. The audio engine resets
; elapsed frames at the real loop boundary and then uses the loop duration.
.startProgress
	ld a, [wCurrentMenuItem]
	and a
	ret nz
	ld a, [wListScrollOffset]
	ld e, a
	ld d, 0
	ld h, d
	ld l, e
	add hl, hl
	add hl, hl
	add hl, de ; five bytes per track
	ld de, SoundTestMusicTimings
	add hl, de
	ld a, [hli]
	ld [wSoundTestDurationFrames], a
	ld a, [hli]
	ld [wSoundTestDurationFrames + 1], a
	ld a, [hli]
	ld [wSoundTestLoopFrames], a
	ld a, [hli]
	ld [wSoundTestLoopFrames + 1], a
	ld a, [hl]
	ld [wSoundTestProgressChannel], a
	xor a
	ld [wSoundTestElapsedFrames], a
	ld [wSoundTestElapsedFrames + 1], a
	ld a, 1
	ld [wSoundTestProgressActive], a
	ret

.drawProgress
	xor a
	ld [wSoundTestProgressPixels], a
	ld a, [wSoundTestProgressActive]
	and a
	jr z, .drawBar
	ld a, 56
	call .progressRatio
	ld [wSoundTestProgressPixels], a
.drawBar
	; Reuse the capped health bar, filling from left to right.
	ld a, [wSoundTestProgressPixels]
	ld e, a
	ld d, 7
	ld c, 0 ; allow a completely empty bar at the start of a loop
	hlcoord 0, 16
	call DrawHPBar
	; Remove DrawHPBar's blank prefix, leaving room for the transport icon.
	hlcoord 1, 16
	decoord 0, 16
	ld bc, 9
	call CopyData
	hlcoord 0, 16
	ld [hl], $0b ; musical note replaces the HP bar's heart
	hlcoord 9, 16
	ld a, 15 ; stopped
	ld b, a
	ld a, [wMenuJoypadPollCount]
	cp $ff
	jr z, .transport
	ld b, 13 ; playing
	ld a, [wSoundTestPaused]
	and a
	jr z, .transport
	inc b ; paused
.transport
	ld [hl], b
	hlcoord 11, 16
	ld a, [wSoundTestProgressActive]
	and a
	jr nz, .printTimes
	ld de, .noProgress
	jp PlaceString
.printTimes
	; Snapshot both words together: the audio loop can replace them in VBlank.
	di
	ld a, [wSoundTestDurationFrames]
	ld e, a
	ld a, [wSoundTestDurationFrames + 1]
	ld d, a
	push de
	ld a, [wSoundTestElapsedFrames]
	ld e, a
	ld a, [wSoundTestElapsedFrames + 1]
	ld d, a
	ei
	call .printTime
	ld [hl], '/'
	inc hl
	pop de
	jp .printTime
.noProgress
	db "-:--/-:--@"

; Print audio frames in DE as m:ss. A DMG frame is 70224/4194304 seconds.
; 59 + 47678/65536 frames per second approximates the hardware within .001
; frame across every track in the table. Start the fraction at 65535 to round up
; each second's frame threshold, so the display never advances early.
.printTime
	push hl
	ld h, d
	ld l, e
	ld de, $ffff
	ld b, 0
.seconds
	ld a, e
	add LOW(47678)
	ld e, a
	ld a, d
	adc HIGH(47678)
	ld d, a
	ld a, 59
	adc 0
	ld c, a
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc 0
	ld h, a
	jr c, .secondsDone
	inc b
	jr .seconds
.secondsDone
	ld a, b
	ld b, '0'
.minutes
	cp 60
	jr c, .minuteDone
	sub 60
	inc b
	jr .minutes
.minuteDone
	pop hl
	ld [hl], b
	inc hl
	ld [hl], ':'
	inc hl
	ld b, '0'
.tens
	cp 10
	jr c, .digits
	sub 10
	inc b
	jr .tens
.digits
	ld [hl], b
	inc hl
	add '0'
	ld [hli], a
	ret

; Return floor(elapsed * a / duration), without overflowing a 16-bit sum.
; Track durations are under 6000 frames, so even two durations fit in hl.
.progressRatio
	push af
	xor a
	ld [wSoundTestRatioResult], a
.snapshot
	; The loop boundary changes both words during VBlank.
	di
	ld a, [wSoundTestElapsedFrames + 1]
	ld d, a
	ld a, [wSoundTestElapsedFrames]
	ld e, a
	ld a, [wSoundTestDurationFrames]
	ld c, a
	ld a, [wSoundTestDurationFrames + 1]
	ld b, a
	ei
	ld hl, 0
	pop af
.ratioStep
	push af
	add hl, de
	ld a, h
	cp b
	jr c, .ratioNext
	jr nz, .ratioSubtract
	ld a, l
	cp c
	jr c, .ratioNext
.ratioSubtract
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	ld a, [wSoundTestRatioResult]
	inc a
	ld [wSoundTestRatioResult], a
.ratioNext
	pop af
	dec a
	jr nz, .ratioStep
	ld a, [wSoundTestRatioResult]
	ret

.drawSoundMode
	hlcoord 0, 17
	ld a, $10
	ld b, 6
.playHint
	ld [hli], a
	inc a
	dec b
	jr nz, .playHint
	ld a, [wCurrentMenuItem]
	and a
	jr z, .modeHint
	hlcoord 3, 17
	ld a, $2e ; finish the PLAY outline without the PAUSE text
	ld [hli], a
	ld a, ' '
	ld [hli], a
	ld [hl], a
.modeHint
	ld a, [wExtraOptions]
	and 3
	ld b, a
	add a
	add b
	add $21 ; MONO / EAR1 / EAR2 / EAR3, three tiles each
	hlcoord 17, 17
	ld b, 3
.modeTiles
	ld [hli], a
	inc a
	dec b
	jr nz, .modeTiles
	ret

; Color the frame, progress row and two-tone footer independently.
.initColors
	ldh a, [hGBC]
	and a
	ret z
	ld c, 1
.uploadColor
	push bc
	farcall SoundTestUploadPalette
	pop bc
	inc c
	ld a, c
	cp 7
	jr nz, .uploadColor
	; Both maps can be displayed by the menu's BG/window setup.
	ld hl, vBGMap0
	call .screenAttributes
	ld hl, vBGMap1
	jp .screenAttributes

.screenAttributes
	push hl
	push hl
	ld de, BG_MAP_WIDTH
	add hl, de
	ld b, 14
.frameSides
	ld c, 4
	call .writeAttribute
	ld de, SCREEN_WIDTH - 2
	add hl, de
	call .writeAttribute
	ld de, BG_MAP_WIDTH - SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .frameSides
	pop hl
	push hl
	call .frameAttributeRow
	pop hl
	push hl
	ld de, 4 * BG_MAP_WIDTH
	add hl, de
	call .frameAttributeRow
	pop hl
	ld de, 15 * BG_MAP_WIDTH
	add hl, de
	call .frameAttributeRow
	pop hl
	push hl
	ld de, 16 * BG_MAP_WIDTH
	add hl, de
	call .progressAttributes
	ld c, 6 ; keep play/pause/stop yellow independently of the note
	call .writeAttribute
	pop hl
	ld de, 17 * BG_MAP_WIDTH
	add hl, de
	ld b, SCREEN_WIDTH
	ld c, 5
.footerAttributes
	call .writeAttribute
	dec b
	jr nz, .footerAttributes
	ret

.frameAttributeRow
	ld c, 3
	call .writeAttribute
	ld b, SCREEN_WIDTH - 2
	ld c, 4
.frameLine
	call .writeAttribute
	dec b
	jr nz, .frameLine
	ld c, 3
	jp .writeAttribute

.progressAttributes
	ld c, 1 ; note
	call .writeAttribute
	ld b, 8 ; bar body and right cap
	ld c, 2
.barAttribute
	call .writeAttribute
	dec b
	jr nz, .barAttribute
	ret

.writeAttribute
	di
.waitVRAM
	ldh a, [rSTAT]
	and %10
	jr nz, .waitVRAM
	ld a, 1
	ldh [rVBK], a
	ld [hl], c
	inc hl
	xor a
	ldh [rVBK], a
	ei
	ret

; The nine frame tiles are laid out top, sides, bottom in player.png.
.border
	push hl
	xor a
	ld [hli], a
	inc a
	call StandardTextBoxBorder.PlaceChars
	ld [hl], 2
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
.borderRow
	push hl
	ld [hl], 3
	ld de, 19
	add hl, de
	ld [hl], 5
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .borderRow
	ld a, 6
	ld [hli], a
	inc a
	call StandardTextBoxBorder.PlaceChars
	ld [hl], 8
	ret

; Center an at-most-18-character string in the interior row at HL.
.centerString
	push de
	ld b, 0
.measure
	ld a, [de]
	cp '@'
	jr z, .measured
	inc de
	inc b
	jr .measure
.measured
	ld a, 18
	sub b
	srl a
	ld e, a
	ld d, 0
	add hl, de
	pop de
	jp PlaceString

.drawPlayingTitle
	ld a, [wMenuJoypadPollCount]
	cp $ff
	ret z
	ld b, a
	ld a, [wCurrentMenuItem]
	push af
	ld a, b
	ld [wCurrentMenuItem], a
	ld a, [wMaxMenuItem]
	call .copyName
	pop af
	ld [wCurrentMenuItem], a
	; Remove the fixed-width name's padding before centering it.
	ld hl, wStringBuffer + 17
.trim
	ld a, [hl]
	cp ' '
	jr nz, .trimmed
	dec hl
	jr .trim
.trimmed
	inc hl
	ld [hl], '@'
	hlcoord 1, 3
	ld de, wStringBuffer
	jp .centerString

; Copy title a from the selected group into wStringBuffer.
.copyName
	push af
	ld a, [wCurrentMenuItem]
	add a
	ld e, a
	ld d, 0
	ld hl, SoundTestNameGroups
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	push hl
	ld e, a
	ld h, d
	ld l, e
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, hl
	add hl, de ; index * 19
	pop de
	add hl, de
	ld de, wStringBuffer
	ld bc, 19
	ld a, BANK(SoundTestNames)
	jp FarCopyData

; Returns sound ID in a, audio bank in c, and group size in b.
.getEntry
	ld a, [wCurrentMenuItem]
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, SoundTestGroups
	add hl, de
	ld b, [hl]
	inc hl ; reserved byte
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wListScrollOffset]
	ld e, a
	sla e
	rl d ; each entry contains a sound ID and its audio bank
	add hl, de
	ld a, [hli]
	ld c, [hl]
	ret

.title
	db "Music Player@"
.music
	db $2d, " Songs ", $0c, "@"
.sfx
	db $2d, " SFX ", $0c, "@"
.cries
	db $2d, " Cries ", $0c, "@"
.instruments
	db $2d, " Instruments ", $0c, "@"

SoundTestPlayerGraphics:
	INCBIN "gfx/debug/music_player.2bpp"

INCLUDE "engine/debug/sound_test_timings.asm"

; Called once per VBlank while a music track is being timed.
SoundTestProgressTick::
	ld a, [wSoundTestPaused]
	and a
	ret nz
	ld hl, wSoundTestElapsedFrames
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, wSoundTestDurationFrames
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld a, d
	cp b
	jr c, .tick
	ret nz
	ld a, e
	cp c
	ret nc
.tick
	inc de
	ld a, e
	ld [wSoundTestElapsedFrames], a
	ld a, d
	ld [wSoundTestElapsedFrames + 1], a
	ret

SoundTestCategoryTitles:
	dw SoundTestDebugMenu.music, SoundTestDebugMenu.sfx
	dw SoundTestDebugMenu.cries, SoundTestDebugMenu.instruments

SoundTestGroups:
	db 49, 0
	dw SoundTest_music
	db 111, 0
	dw SoundTest_sfx
	db 38, 0
	dw SoundTest_cries
	db 19, 0
	dw SoundTest_instruments

SoundTest_music:
	db (Music_PalletTown - SFX_Headers_1) / 3, BANK(Music_PalletTown)
	db (Music_Pokecenter - SFX_Headers_1) / 3, BANK(Music_Pokecenter)
	db (Music_Gym - SFX_Headers_1) / 3, BANK(Music_Gym)
	db (Music_Cities1 - SFX_Headers_1) / 3, BANK(Music_Cities1)
	db (Music_Cities2 - SFX_Headers_1) / 3, BANK(Music_Cities2)
	db (Music_Celadon - SFX_Headers_1) / 3, BANK(Music_Celadon)
	db (Music_Cinnabar - SFX_Headers_1) / 3, BANK(Music_Cinnabar)
	db (Music_Vermilion - SFX_Headers_1) / 3, BANK(Music_Vermilion)
	db (Music_Lavender - SFX_Headers_1) / 3, BANK(Music_Lavender)
	db (Music_SSAnne - SFX_Headers_1) / 3, BANK(Music_SSAnne)
	db (Music_MeetProfOak - SFX_Headers_1) / 3, BANK(Music_MeetProfOak)
	db (Music_MeetRival - SFX_Headers_1) / 3, BANK(Music_MeetRival)
	db (Music_MuseumGuy - SFX_Headers_1) / 3, BANK(Music_MuseumGuy)
	db (Music_SafariZone - SFX_Headers_1) / 3, BANK(Music_SafariZone)
	db (Music_PkmnHealed - SFX_Headers_1) / 3, BANK(Music_PkmnHealed)
	db (Music_Routes1 - SFX_Headers_1) / 3, BANK(Music_Routes1)
	db (Music_Routes2 - SFX_Headers_1) / 3, BANK(Music_Routes2)
	db (Music_Routes3 - SFX_Headers_1) / 3, BANK(Music_Routes3)
	db (Music_Routes4 - SFX_Headers_1) / 3, BANK(Music_Routes4)
	db (Music_IndigoPlateau - SFX_Headers_1) / 3, BANK(Music_IndigoPlateau)
	db (Music_GymLeaderBattle - SFX_Headers_2) / 3, BANK(Music_GymLeaderBattle)
	db (Music_TrainerBattle - SFX_Headers_2) / 3, BANK(Music_TrainerBattle)
	db (Music_WildBattle - SFX_Headers_2) / 3, BANK(Music_WildBattle)
	db (Music_FinalBattle - SFX_Headers_2) / 3, BANK(Music_FinalBattle)
	db (Music_DefeatedTrainer - SFX_Headers_2) / 3, BANK(Music_DefeatedTrainer)
	db (Music_DefeatedWildMon - SFX_Headers_2) / 3, BANK(Music_DefeatedWildMon)
	db (Music_DefeatedGymLeader - SFX_Headers_2) / 3, BANK(Music_DefeatedGymLeader)
	db (Music_TitleScreen - SFX_Headers_3) / 3, BANK(Music_TitleScreen)
	db (Music_Credits - SFX_Headers_3) / 3, BANK(Music_Credits)
	db (Music_HallOfFame - SFX_Headers_3) / 3, BANK(Music_HallOfFame)
	db (Music_OaksLab - SFX_Headers_3) / 3, BANK(Music_OaksLab)
	db (Music_JigglypuffSong - SFX_Headers_3) / 3, BANK(Music_JigglypuffSong)
	db (Music_BikeRiding - SFX_Headers_3) / 3, BANK(Music_BikeRiding)
	db (Music_Surfing - SFX_Headers_3) / 3, BANK(Music_Surfing)
	db (Music_GameCorner - SFX_Headers_3) / 3, BANK(Music_GameCorner)
	db (Music_YellowIntro - SFX_Headers_3) / 3, BANK(Music_YellowIntro)
	db (Music_Dungeon1 - SFX_Headers_3) / 3, BANK(Music_Dungeon1)
	db (Music_Dungeon2 - SFX_Headers_3) / 3, BANK(Music_Dungeon2)
	db (Music_Dungeon3 - SFX_Headers_3) / 3, BANK(Music_Dungeon3)
	db (Music_CinnabarMansion - SFX_Headers_3) / 3, BANK(Music_CinnabarMansion)
	db (Music_PokemonTower - SFX_Headers_3) / 3, BANK(Music_PokemonTower)
	db (Music_SilphCo - SFX_Headers_3) / 3, BANK(Music_SilphCo)
	db (Music_MeetEvilTrainer - SFX_Headers_3) / 3, BANK(Music_MeetEvilTrainer)
	db (Music_MeetFemaleTrainer - SFX_Headers_3) / 3, BANK(Music_MeetFemaleTrainer)
	db (Music_MeetMaleTrainer - SFX_Headers_3) / 3, BANK(Music_MeetMaleTrainer)
	db (Music_SurfingPikachu - SFX_Headers_4) / 3, BANK(Music_SurfingPikachu)
	db (Music_MeetJessieJames - SFX_Headers_4) / 3, BANK(Music_MeetJessieJames)
	db (Music_YellowUnusedSong - SFX_Headers_4) / 3, BANK(Music_YellowUnusedSong)
	db (Music_GBPrinter - SFX_Headers_4) / 3, BANK(Music_GBPrinter)
	assert (@ - SoundTest_music) / 2 == 49

SoundTest_sfx:
	db (SFX_Get_Item1_1 - SFX_Headers_1) / 3, BANK(SFX_Get_Item1_1)
	db (SFX_Get_Item2_1 - SFX_Headers_1) / 3, BANK(SFX_Get_Item2_1)
	db (SFX_Tink_1 - SFX_Headers_1) / 3, BANK(SFX_Tink_1)
	db (SFX_Heal_HP_1 - SFX_Headers_1) / 3, BANK(SFX_Heal_HP_1)
	db (SFX_Heal_Ailment_1 - SFX_Headers_1) / 3, BANK(SFX_Heal_Ailment_1)
	db (SFX_Start_Menu_1 - SFX_Headers_1) / 3, BANK(SFX_Start_Menu_1)
	db (SFX_Press_AB_1 - SFX_Headers_1) / 3, BANK(SFX_Press_AB_1)
	db (SFX_Pokedex_Rating_1 - SFX_Headers_1) / 3, BANK(SFX_Pokedex_Rating_1)
	db (SFX_Get_Key_Item_1 - SFX_Headers_1) / 3, BANK(SFX_Get_Key_Item_1)
	db (SFX_Poisoned_1 - SFX_Headers_1) / 3, BANK(SFX_Poisoned_1)
	db (SFX_Trade_Machine_1 - SFX_Headers_1) / 3, BANK(SFX_Trade_Machine_1)
	db (SFX_Turn_On_PC_1 - SFX_Headers_1) / 3, BANK(SFX_Turn_On_PC_1)
	db (SFX_Turn_Off_PC_1 - SFX_Headers_1) / 3, BANK(SFX_Turn_Off_PC_1)
	db (SFX_Enter_PC_1 - SFX_Headers_1) / 3, BANK(SFX_Enter_PC_1)
	db (SFX_Shrink_1 - SFX_Headers_1) / 3, BANK(SFX_Shrink_1)
	db (SFX_Switch_1 - SFX_Headers_1) / 3, BANK(SFX_Switch_1)
	db (SFX_Healing_Machine_1 - SFX_Headers_1) / 3, BANK(SFX_Healing_Machine_1)
	db (SFX_Teleport_Exit1_1 - SFX_Headers_1) / 3, BANK(SFX_Teleport_Exit1_1)
	db (SFX_Teleport_Enter1_1 - SFX_Headers_1) / 3, BANK(SFX_Teleport_Enter1_1)
	db (SFX_Teleport_Exit2_1 - SFX_Headers_1) / 3, BANK(SFX_Teleport_Exit2_1)
	db (SFX_Ledge_1 - SFX_Headers_1) / 3, BANK(SFX_Ledge_1)
	db (SFX_Teleport_Enter2_1 - SFX_Headers_1) / 3, BANK(SFX_Teleport_Enter2_1)
	db (SFX_Fly_1 - SFX_Headers_1) / 3, BANK(SFX_Fly_1)
	db (SFX_Denied_1 - SFX_Headers_1) / 3, BANK(SFX_Denied_1)
	db (SFX_Arrow_Tiles_1 - SFX_Headers_1) / 3, BANK(SFX_Arrow_Tiles_1)
	db (SFX_Push_Boulder_1 - SFX_Headers_1) / 3, BANK(SFX_Push_Boulder_1)
	db (SFX_SS_Anne_Horn_1 - SFX_Headers_1) / 3, BANK(SFX_SS_Anne_Horn_1)
	db (SFX_Withdraw_Deposit_1 - SFX_Headers_1) / 3, BANK(SFX_Withdraw_Deposit_1)
	db (SFX_Cut_1 - SFX_Headers_1) / 3, BANK(SFX_Cut_1)
	db (SFX_Go_Inside_1 - SFX_Headers_1) / 3, BANK(SFX_Go_Inside_1)
	db (SFX_Swap_1 - SFX_Headers_1) / 3, BANK(SFX_Swap_1)
	db (SFX_59_1 - SFX_Headers_1) / 3, BANK(SFX_59_1)
	db (SFX_Purchase_1 - SFX_Headers_1) / 3, BANK(SFX_Purchase_1)
	db (SFX_Collision_1 - SFX_Headers_1) / 3, BANK(SFX_Collision_1)
	db (SFX_Go_Outside_1 - SFX_Headers_1) / 3, BANK(SFX_Go_Outside_1)
	db (SFX_Save_1 - SFX_Headers_1) / 3, BANK(SFX_Save_1)
	db (SFX_Pokeflute - SFX_Headers_1) / 3, BANK(SFX_Pokeflute)
	db (SFX_Safari_Zone_PA - SFX_Headers_1) / 3, BANK(SFX_Safari_Zone_PA)
	db (SFX_Level_Up - SFX_Headers_2) / 3, BANK(SFX_Level_Up)
	db (SFX_Ball_Toss - SFX_Headers_2) / 3, BANK(SFX_Ball_Toss)
	db (SFX_Ball_Poof - SFX_Headers_2) / 3, BANK(SFX_Ball_Poof)
	db (SFX_Faint_Thud - SFX_Headers_2) / 3, BANK(SFX_Faint_Thud)
	db (SFX_Run - SFX_Headers_2) / 3, BANK(SFX_Run)
	db (SFX_Dex_Page_Added - SFX_Headers_2) / 3, BANK(SFX_Dex_Page_Added)
	db (SFX_Caught_Mon - SFX_Headers_2) / 3, BANK(SFX_Caught_Mon)
	db (SFX_Peck - SFX_Headers_2) / 3, BANK(SFX_Peck)
	db (SFX_Faint_Fall - SFX_Headers_2) / 3, BANK(SFX_Faint_Fall)
	db (SFX_Battle_09 - SFX_Headers_2) / 3, BANK(SFX_Battle_09)
	db (SFX_Pound - SFX_Headers_2) / 3, BANK(SFX_Pound)
	db (SFX_Battle_0B - SFX_Headers_2) / 3, BANK(SFX_Battle_0B)
	db (SFX_Battle_0C - SFX_Headers_2) / 3, BANK(SFX_Battle_0C)
	db (SFX_Battle_0D - SFX_Headers_2) / 3, BANK(SFX_Battle_0D)
	db (SFX_Battle_0E - SFX_Headers_2) / 3, BANK(SFX_Battle_0E)
	db (SFX_Battle_0F - SFX_Headers_2) / 3, BANK(SFX_Battle_0F)
	db (SFX_Damage - SFX_Headers_2) / 3, BANK(SFX_Damage)
	db (SFX_Not_Very_Effective - SFX_Headers_2) / 3, BANK(SFX_Not_Very_Effective)
	db (SFX_Battle_12 - SFX_Headers_2) / 3, BANK(SFX_Battle_12)
	db (SFX_Battle_13 - SFX_Headers_2) / 3, BANK(SFX_Battle_13)
	db (SFX_Battle_14 - SFX_Headers_2) / 3, BANK(SFX_Battle_14)
	db (SFX_Vine_Whip - SFX_Headers_2) / 3, BANK(SFX_Vine_Whip)
	db (SFX_Battle_16 - SFX_Headers_2) / 3, BANK(SFX_Battle_16)
	db (SFX_Battle_17 - SFX_Headers_2) / 3, BANK(SFX_Battle_17)
	db (SFX_Battle_18 - SFX_Headers_2) / 3, BANK(SFX_Battle_18)
	db (SFX_Battle_19 - SFX_Headers_2) / 3, BANK(SFX_Battle_19)
	db (SFX_Super_Effective - SFX_Headers_2) / 3, BANK(SFX_Super_Effective)
	db (SFX_Battle_1B - SFX_Headers_2) / 3, BANK(SFX_Battle_1B)
	db (SFX_Battle_1C - SFX_Headers_2) / 3, BANK(SFX_Battle_1C)
	db (SFX_Doubleslap - SFX_Headers_2) / 3, BANK(SFX_Doubleslap)
	db (SFX_Battle_1E - SFX_Headers_2) / 3, BANK(SFX_Battle_1E)
	db (SFX_Horn_Drill - SFX_Headers_2) / 3, BANK(SFX_Horn_Drill)
	db (SFX_Battle_20 - SFX_Headers_2) / 3, BANK(SFX_Battle_20)
	db (SFX_Battle_21 - SFX_Headers_2) / 3, BANK(SFX_Battle_21)
	db (SFX_Battle_22 - SFX_Headers_2) / 3, BANK(SFX_Battle_22)
	db (SFX_Battle_23 - SFX_Headers_2) / 3, BANK(SFX_Battle_23)
	db (SFX_Battle_24 - SFX_Headers_2) / 3, BANK(SFX_Battle_24)
	db (SFX_Battle_25 - SFX_Headers_2) / 3, BANK(SFX_Battle_25)
	db (SFX_Battle_26 - SFX_Headers_2) / 3, BANK(SFX_Battle_26)
	db (SFX_Battle_27 - SFX_Headers_2) / 3, BANK(SFX_Battle_27)
	db (SFX_Battle_28 - SFX_Headers_2) / 3, BANK(SFX_Battle_28)
	db (SFX_Battle_29 - SFX_Headers_2) / 3, BANK(SFX_Battle_29)
	db (SFX_Battle_2A - SFX_Headers_2) / 3, BANK(SFX_Battle_2A)
	db (SFX_Battle_2B - SFX_Headers_2) / 3, BANK(SFX_Battle_2B)
	db (SFX_Battle_2C - SFX_Headers_2) / 3, BANK(SFX_Battle_2C)
	db (SFX_Psybeam - SFX_Headers_2) / 3, BANK(SFX_Psybeam)
	db (SFX_Battle_2E - SFX_Headers_2) / 3, BANK(SFX_Battle_2E)
	db (SFX_Battle_2F - SFX_Headers_2) / 3, BANK(SFX_Battle_2F)
	db (SFX_Psychic_M - SFX_Headers_2) / 3, BANK(SFX_Psychic_M)
	db (SFX_Battle_31 - SFX_Headers_2) / 3, BANK(SFX_Battle_31)
	db (SFX_Battle_32 - SFX_Headers_2) / 3, BANK(SFX_Battle_32)
	db (SFX_Battle_33 - SFX_Headers_2) / 3, BANK(SFX_Battle_33)
	db (SFX_Battle_34 - SFX_Headers_2) / 3, BANK(SFX_Battle_34)
	db (SFX_Battle_35 - SFX_Headers_2) / 3, BANK(SFX_Battle_35)
	db (SFX_Battle_36 - SFX_Headers_2) / 3, BANK(SFX_Battle_36)
	db (SFX_Silph_Scope - SFX_Headers_2) / 3, BANK(SFX_Silph_Scope)
	db (SFX_Turn_On_PC_3 - SFX_Headers_3) / 3, BANK(SFX_Turn_On_PC_3)
	db (SFX_Enter_PC_3 - SFX_Headers_3) / 3, BANK(SFX_Enter_PC_3)
	db (SFX_Save_3 - SFX_Headers_3) / 3, BANK(SFX_Save_3)
	db (SFX_Intro_Lunge - SFX_Headers_3) / 3, BANK(SFX_Intro_Lunge)
	db (SFX_Intro_Hip - SFX_Headers_3) / 3, BANK(SFX_Intro_Hip)
	db (SFX_Intro_Hop - SFX_Headers_3) / 3, BANK(SFX_Intro_Hop)
	db (SFX_Intro_Raise - SFX_Headers_3) / 3, BANK(SFX_Intro_Raise)
	db (SFX_Intro_Whoosh - SFX_Headers_3) / 3, BANK(SFX_Intro_Whoosh)
	db (SFX_Slots_Stop_Wheel - SFX_Headers_3) / 3, BANK(SFX_Slots_Stop_Wheel)
	db (SFX_Slots_Reward - SFX_Headers_3) / 3, BANK(SFX_Slots_Reward)
	db (SFX_Slots_New_Spin - SFX_Headers_3) / 3, BANK(SFX_Slots_New_Spin)
	db (SFX_Shooting_Star - SFX_Headers_3) / 3, BANK(SFX_Shooting_Star)
	db (SFX_Surfing_Jump - SFX_Headers_4) / 3, BANK(SFX_Surfing_Jump)
	db (SFX_Surfing_Flip - SFX_Headers_4) / 3, BANK(SFX_Surfing_Flip)
	db (SFX_Surfing_Crash - SFX_Headers_4) / 3, BANK(SFX_Surfing_Crash)
	db (SFX_Unknown_802cc - SFX_Headers_4) / 3, BANK(SFX_Unknown_802cc)
	db (SFX_Surfing_Land - SFX_Headers_4) / 3, BANK(SFX_Surfing_Land)
	assert (@ - SoundTest_sfx) / 2 == 111

SoundTest_cries:
	db (SFX_Cry00_1 - SFX_Headers_1) / 3, BANK(SFX_Cry00_1)
	db (SFX_Cry01_1 - SFX_Headers_1) / 3, BANK(SFX_Cry01_1)
	db (SFX_Cry02_1 - SFX_Headers_1) / 3, BANK(SFX_Cry02_1)
	db (SFX_Cry03_1 - SFX_Headers_1) / 3, BANK(SFX_Cry03_1)
	db (SFX_Cry04_1 - SFX_Headers_1) / 3, BANK(SFX_Cry04_1)
	db (SFX_Cry05_1 - SFX_Headers_1) / 3, BANK(SFX_Cry05_1)
	db (SFX_Cry06_1 - SFX_Headers_1) / 3, BANK(SFX_Cry06_1)
	db (SFX_Cry07_1 - SFX_Headers_1) / 3, BANK(SFX_Cry07_1)
	db (SFX_Cry08_1 - SFX_Headers_1) / 3, BANK(SFX_Cry08_1)
	db (SFX_Cry09_1 - SFX_Headers_1) / 3, BANK(SFX_Cry09_1)
	db (SFX_Cry0A_1 - SFX_Headers_1) / 3, BANK(SFX_Cry0A_1)
	db (SFX_Cry0B_1 - SFX_Headers_1) / 3, BANK(SFX_Cry0B_1)
	db (SFX_Cry0C_1 - SFX_Headers_1) / 3, BANK(SFX_Cry0C_1)
	db (SFX_Cry0D_1 - SFX_Headers_1) / 3, BANK(SFX_Cry0D_1)
	db (SFX_Cry0E_1 - SFX_Headers_1) / 3, BANK(SFX_Cry0E_1)
	db (SFX_Cry0F_1 - SFX_Headers_1) / 3, BANK(SFX_Cry0F_1)
	db (SFX_Cry10_1 - SFX_Headers_1) / 3, BANK(SFX_Cry10_1)
	db (SFX_Cry11_1 - SFX_Headers_1) / 3, BANK(SFX_Cry11_1)
	db (SFX_Cry12_1 - SFX_Headers_1) / 3, BANK(SFX_Cry12_1)
	db (SFX_Cry13_1 - SFX_Headers_1) / 3, BANK(SFX_Cry13_1)
	db (SFX_Cry14_1 - SFX_Headers_1) / 3, BANK(SFX_Cry14_1)
	db (SFX_Cry15_1 - SFX_Headers_1) / 3, BANK(SFX_Cry15_1)
	db (SFX_Cry16_1 - SFX_Headers_1) / 3, BANK(SFX_Cry16_1)
	db (SFX_Cry17_1 - SFX_Headers_1) / 3, BANK(SFX_Cry17_1)
	db (SFX_Cry18_1 - SFX_Headers_1) / 3, BANK(SFX_Cry18_1)
	db (SFX_Cry19_1 - SFX_Headers_1) / 3, BANK(SFX_Cry19_1)
	db (SFX_Cry1A_1 - SFX_Headers_1) / 3, BANK(SFX_Cry1A_1)
	db (SFX_Cry1B_1 - SFX_Headers_1) / 3, BANK(SFX_Cry1B_1)
	db (SFX_Cry1C_1 - SFX_Headers_1) / 3, BANK(SFX_Cry1C_1)
	db (SFX_Cry1D_1 - SFX_Headers_1) / 3, BANK(SFX_Cry1D_1)
	db (SFX_Cry1E_1 - SFX_Headers_1) / 3, BANK(SFX_Cry1E_1)
	db (SFX_Cry1F_1 - SFX_Headers_1) / 3, BANK(SFX_Cry1F_1)
	db (SFX_Cry20_1 - SFX_Headers_1) / 3, BANK(SFX_Cry20_1)
	db (SFX_Cry21_1 - SFX_Headers_1) / 3, BANK(SFX_Cry21_1)
	db (SFX_Cry22_1 - SFX_Headers_1) / 3, BANK(SFX_Cry22_1)
	db (SFX_Cry23_1 - SFX_Headers_1) / 3, BANK(SFX_Cry23_1)
	db (SFX_Cry24_1 - SFX_Headers_1) / 3, BANK(SFX_Cry24_1)
	db (SFX_Cry25_1 - SFX_Headers_1) / 3, BANK(SFX_Cry25_1)
	assert (@ - SoundTest_cries) / 2 == 38

SoundTest_instruments:
	db (SFX_Noise_Instrument01_1 - SFX_Headers_1) / 3, BANK(SFX_Noise_Instrument01_1)
	db (SFX_Noise_Instrument02_1 - SFX_Headers_1) / 3, BANK(SFX_Noise_Instrument02_1)
	db (SFX_Noise_Instrument03_1 - SFX_Headers_1) / 3, BANK(SFX_Noise_Instrument03_1)
	db (SFX_Noise_Instrument04_1 - SFX_Headers_1) / 3, BANK(SFX_Noise_Instrument04_1)
	db (SFX_Noise_Instrument05_1 - SFX_Headers_1) / 3, BANK(SFX_Noise_Instrument05_1)
	db (SFX_Noise_Instrument06_1 - SFX_Headers_1) / 3, BANK(SFX_Noise_Instrument06_1)
	db (SFX_Noise_Instrument07_1 - SFX_Headers_1) / 3, BANK(SFX_Noise_Instrument07_1)
	db (SFX_Noise_Instrument08_1 - SFX_Headers_1) / 3, BANK(SFX_Noise_Instrument08_1)
	db (SFX_Noise_Instrument09_1 - SFX_Headers_1) / 3, BANK(SFX_Noise_Instrument09_1)
	db (SFX_Noise_Instrument10_1 - SFX_Headers_1) / 3, BANK(SFX_Noise_Instrument10_1)
	db (SFX_Noise_Instrument11_1 - SFX_Headers_1) / 3, BANK(SFX_Noise_Instrument11_1)
	db (SFX_Noise_Instrument12_1 - SFX_Headers_1) / 3, BANK(SFX_Noise_Instrument12_1)
	db (SFX_Noise_Instrument13_1 - SFX_Headers_1) / 3, BANK(SFX_Noise_Instrument13_1)
	db (SFX_Noise_Instrument14_1 - SFX_Headers_1) / 3, BANK(SFX_Noise_Instrument14_1)
	db (SFX_Noise_Instrument15_1 - SFX_Headers_1) / 3, BANK(SFX_Noise_Instrument15_1)
	db (SFX_Noise_Instrument16_1 - SFX_Headers_1) / 3, BANK(SFX_Noise_Instrument16_1)
	db (SFX_Noise_Instrument17_1 - SFX_Headers_1) / 3, BANK(SFX_Noise_Instrument17_1)
	db (SFX_Noise_Instrument18_1 - SFX_Headers_1) / 3, BANK(SFX_Noise_Instrument18_1)
	db (SFX_Noise_Instrument19_1 - SFX_Headers_1) / 3, BANK(SFX_Noise_Instrument19_1)
	assert (@ - SoundTest_instruments) / 2 == 19

SoundTestNameGroups:
	dw SoundTestNames_music
	dw SoundTestNames_sfx
	dw SoundTestNames_cries
	dw SoundTestNames_instruments
