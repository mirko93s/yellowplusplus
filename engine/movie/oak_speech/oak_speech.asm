SetDefaultNames:
	ld a, [wLetterPrintingDelayFlags]
	push af
	ld a, [wOptions]
	push af
IF DEF(_DEBUG)
	ld a, [wStatusFlags6]
	push af
ENDC
	ld a, [wPrinterSettings]
	push af
	ld hl, wPlayerName
	ld bc, wBoxDataEnd - wPlayerName
	xor a
	call FillMemory
	ld hl, wSpriteDataStart
	ld bc, wSpriteDataEnd - wSpriteDataStart
	xor a
	call FillMemory
	xor a
	ld [wSurfingMinigameHiScore], a
	ld [wSurfingMinigameHiScore + 1], a
	ld [wSurfingMinigameHiScore + 2], a
	pop af
	ld [wPrinterSettings], a
	pop af
IF DEF(_DEBUG)
	ld [wStatusFlags6], a
	pop af
ENDC
	ld [wOptions], a
	pop af
	ld [wLetterPrintingDelayFlags], a
	ld a, [wOptionsInitialized]
	and a
	call z, InitOptions
	ld hl, NintenText
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyData
	ld hl, SonyText
	ld de, wRivalName
	ld bc, NAME_LENGTH
	call CopyData ; rip optimizations
	ret

OakSpeech:
	call StopAllMusic ; stop music
	ld a, BANK(Music_SurfingPikachu)
	ld c, a
	ld a, MUSIC_SURFING_PIKACHU
	call PlayMusic
	call ClearScreen
	call LoadTextBoxTilePatterns
	call SetDefaultNames
	predef InitPlayerData2
	ld hl, wNumBoxItems
	ld a, SUPER_POTION
	ld [wCurItem], a
	ld a, 1
	ld [wItemQuantity], a
	call AddItemToInventory  ; give one potion
	ld a, [wDefaultMap]
	ld [wDestinationMap], a
	call SpecialWarpIn
	xor a
	ldh [hTileAnimations], a
	ld a, [wStatusFlags6]
	bit 1, a ; possibly a debug mode bit
	jp nz, .skipChoosingNames
	;;;;;;;;;;;;;;;;;;; mirko93s intro
	call ShowCaterpie
	ld hl, MirkoIntroText
	call PrintText
	call MovePicLeft
	farcall SendPokeballPal
	call MovePicLeft
	farcall SendPikaPal
	call MovePicLeft
	farcall SendPlayerPal
	call MovePicLeft
	farcall SendRivalPal
	call MovePicLeft
	farcall SendOakPal
	call MovePicLeft
	farcall SendShinyCaterpiePal
	ld hl, MirkoIntroText2
	call PrintText
	call ClearScreen
	; game difficulty selection screen
	call ChooseGameDifficulty
	call ClearScreen
	ld a, [wExtraFlags]
	bit 3, a
	jr z, .noNuzlocke ; if no nuzlocke skip asking about dupe clause
	; dupe clause
	call ShowCaterpie
	ld hl, NuzlockeDupeClauseText
	call PrintText
    hlcoord 14, 7
    lb bc, 8, 15
    ld a, NO_YES_MENU
    ld [wTwoOptionMenuID], a
    ld a, TWO_OPTION_MENU
    ld [wTextBoxID], a
	ld a, B_BUTTON
	ld [wJoyIgnore], a
    call DisplayTextBoxID
	xor a
	ld [wJoyIgnore], a
    ld a, [wCurrentMenuItem]
    and a
    jr z, .dontUseDupeClause
	ld hl, wExtraFlags
	set 4, [hl] ; set dupe clause
.dontUseDupeClause
	call ClearScreen
.noNuzlocke
	call RandomizerSeed
	ld hl, BoyGirlText  ; added to the same file as the other oak text
	call PrintText     ; show this text
	call BoyGirlChoice ; added routine at the end of this file
	ld a, [wCurrentMenuItem]
	ld [wPlayerGender], a ; store player's gender. 00 for boy, 01 for girl
	call ClearScreen ; clear the screen before resuming normal intro
	farcall SendOakPal
	ld de, ProfOakPic
	lb bc, BANK(ProfOakPic), $00
	call IntroDisplayPicCenteredOrUpperRight
	call FadeInIntroPic
	ld hl, OakSpeechText1
	call PrintText
	call GBFadeOutToWhite
	call ClearScreen
	farcall SendPikaPal
	ld a, STARTER_PIKACHU
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a
	call GetMonHeader
	hlcoord 6, 4
	call LoadFlippedFrontSpriteByMonIndex
	call MovePicLeft
	ld hl, OakSpeechText2
	call PrintText
	call GBFadeOutToWhite
	call ClearScreen
	farcall SendPlayerPal
	ld de, RedPicFront
	lb bc, BANK(RedPicFront), $00
	ld a, [wPlayerGender] 	; check gender
	and a      				; check gender
	jr z, .NotGreen1
	ld de, GreenPicFront
	lb bc, BANK(GreenPicFront), $00
.NotGreen1:
	call IntroDisplayPicCenteredOrUpperRight
	call MovePicLeft
	ld hl, IntroducePlayerText
	call PrintText
	call ChoosePlayerName
	call GBFadeOutToWhite
	farcall SendRivalPal
	call ClearScreen
	ld de, Rival1Pic
	lb bc, BANK(Rival1Pic), $00
	call IntroDisplayPicCenteredOrUpperRight
	call FadeInIntroPic
	ld hl, IntroduceRivalText
	call PrintText
	call ChooseRivalName
.skipChoosingNames
	call GBFadeOutToWhite
	call ClearScreen
	farcall SendPlayerPal
	ld de, RedPicFront
	lb bc, BANK(RedPicFront), $00
	ld a, [wPlayerGender] ; check gender
	and a      ; check gender
  	jr z, .NotGreen2
 	ld de, GreenPicFront
    lb bc, BANK(GreenPicFront), $00
.NotGreen2:
 	call IntroDisplayPicCenteredOrUpperRight
	call GBFadeInFromWhite
	ld a, [wStatusFlags3]
	and a
	jr nz, .next
	ld hl, OakSpeechText3
	call PrintText
.next
	ldh a, [hLoadedROMBank]
	push af
	ld a, SFX_SHRINK
	call PlaySound
	pop af
	call BankswitchCommon
	ld c, 4
	call DelayFrames
	ld hl, vSprites
	ld de, RedSprite
	ld b, BANK(RedSprite)
	ld c, $0C
	; call CopyVideoData
	; ld de, ShrinkPic1
	; lb bc, BANK(ShrinkPic1), $00
	; call IntroDisplayPicCenteredOrUpperRight
 	ld a, [wPlayerGender] ; check gender
 	and a      ; check gender
 	jr z, .NotGreen3
 	ld de,GreenSprite
 	lb bc, BANK(GreenSprite), $0C
.NotGreen3:
	ld hl, vSprites
	call CopyVideoData
	ld a, [wPlayerGender] ; check gender
 	and a      ; check gender
	jr nz, .shrinkG
 	ld de,ShrinkPic1
	lb bc, BANK(ShrinkPic1), $00
	call IntroDisplayPicCenteredOrUpperRight
	ld c, 4
	call DelayFrames
	ld de, ShrinkPic2
	lb bc, BANK(ShrinkPic2), $00
	call IntroDisplayPicCenteredOrUpperRight
	ld c,4
	call DelayFrames
	ld de,ShrinkPic3
	lb bc, BANK(ShrinkPic3), $00
	jr .continue
.shrinkG
	ld de,ShrinkPic1G
	lb bc, BANK(ShrinkPic1G), $00
	call IntroDisplayPicCenteredOrUpperRight
	ld c, 4
	call DelayFrames
	ld de, ShrinkPic2G
	lb bc, BANK(ShrinkPic2G), $00
	call IntroDisplayPicCenteredOrUpperRight
	ld c,4
	call DelayFrames
	ld de,ShrinkPic3G
	lb bc, BANK(ShrinkPic3G), $00
.continue
	call IntroDisplayPicCenteredOrUpperRight
	call ResetPlayerSpriteData
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(Music_PalletTown)
	ld [wAudioROMBank], a
	ld [wAudioSavedROMBank], a
	ld a, 10
	ld [wAudioFadeOutControl], a
	call StopAllMusic
	pop af
	call BankswitchCommon
	ld c, 20
	call DelayFrames
	hlcoord 6, 5
	lb bc, 7, 7
	call ClearScreenArea
	call LoadTextBoxTilePatterns
	ld a, 1
	ld [wUpdateSpritesEnabled], a
	ld c, 50
	call DelayFrames
	call GBFadeOutToWhite
	call ClearScreen ; rip more tail-end optimizations
	ret

OakSpeechText1:
	text_far _OakSpeechText1
	text_end
OakSpeechText2:
	text_far _OakSpeechText2A
	sound_cry_pikachu
	text_far _OakSpeechText2B
	text_end
IntroducePlayerText:
	text_far _IntroducePlayerText
	text_end
IntroduceRivalText:
	text_far _IntroduceRivalText
	text_end
OakSpeechText3:
	text_far _OakSpeechText3
	text_end
BoyGirlText: ; This is new so we had to add a reference to get it to compile
    text_far _BoyGirlText
    text_end
MirkoIntroText:
	sound_cry_caterpie
	text_far _MirkoIntroText
    text_end
MirkoIntroText2:
	text_far _MirkoIntroText2
    text_end
NuzlockeDupeClauseText:
	sound_cry_caterpie
	text_far _NuzlockeDupeClauseText
    text_end
SeedRandomizerText:
	sound_cry_caterpie
	text_far _SeedRandomizerText
    text_end

FadeInIntroPic:
	ld hl, IntroFadePalettes
	ld b, 6
.next
	ld a, [hli]
	ldh [rBGP], a
	call UpdateGBCPal_BGP
	ld c, 10
	call DelayFrames
	dec b
	jr nz, .next
	ret

IntroFadePalettes:
	db %01010100
	db %10101000
	db %11111100
	db %11111000
	db %11110100
	db %11100100

MovePicLeft:
	ld a, 119
	ldh [rWX], a
	call DelayFrame

	ld a, %11100100
	ldh [rBGP], a
	call UpdateGBCPal_BGP
.next
	call DelayFrame
	ldh a, [rWX]
	sub 8
	cp $FF
	ret z
	ldh [rWX], a
	jr .next

DisplayPicCenteredOrUpperRight:
	call GetPredefRegisters
IntroDisplayPicCenteredOrUpperRight:
; b = bank
; de = address of compressed pic
; c: 0 = centred, non-zero = upper-right
	push bc
	ld a, b
	call UncompressSpriteFromDE
	ld a, $0
	call SwitchSRAMBankAndLatchClockData
	ld hl, sSpriteBuffer1
	ld de, sSpriteBuffer0
	ld bc, $310
	call CopyData
	call PrepareRTCDataAndDisableSRAM
	ld de, vFrontPic
	call InterlaceMergeSpriteBuffers
	pop bc
	ld a, c
	and a
	hlcoord 15, 1
	jr nz, .next
	hlcoord 6, 4
.next
	xor a
	ldh [hStartTileID], a
	predef_jump CopyUncompressedPicToTilemap

	; displays boy/girl choice
BoyGirlChoice::
	call SaveScreenTilesToBuffer1
	call InitBoyGirlTextBoxParameters
	jr DisplayBoyGirlChoice

InitBoyGirlTextBoxParameters::
   ld a, $1 ; loads the value for the unused North/West choice, that was changed to say Boy/Girl
	ld [wTwoOptionMenuID], a
	coord hl, 13, 7 
	ld bc, $80e
	ret
	
DisplayBoyGirlChoice::
	ld a, $14
	ld [wTextBoxID], a
	ld a, B_BUTTON
	ld [wJoyIgnore], a
	call DisplayTextBoxID
	xor a
	ld [wJoyIgnore], a
	jp LoadScreenTilesFromBuffer1

RandomizerSeed::
	; bg pokemon sprite
	call ShowCaterpie
	; randomizer seed input menu
	ld hl, SeedRandomizerText
	call PrintText
    hlcoord 14, 7
    lb bc, 8, 15
    ld a, NO_YES_MENU
    ld [wTwoOptionMenuID], a
    ld a, TWO_OPTION_MENU
    ld [wTextBoxID], a
	ld a, B_BUTTON
	ld [wJoyIgnore], a
    call DisplayTextBoxID
	xor a
	ld [wJoyIgnore], a
    ld a, [wCurrentMenuItem]
    and a
    jr z, .dontUseSeedRandomizer
	ld hl, wSeedString
    ld a, NAME_SEED_SCREEN
    ld [wNamingScreenType], a
    call DisplayNamingScreen
; hash seed (input a string in hl and outputs a 16bit seed in de)
    ld de, $1993 ; this just needs to be not zero
.loop
    ld a, [hli]
    cp $50
    jr z, .hashDone
    ; E ^= character
    xor e
    ld e, a
    ; D = ROL(D, 3) + E
    ld a, d
    rlca
    rlca
    rlca
    add e
    ld d, a
    ; E = ROL(E, 5) ^ D
    ld a, e
    rlca
    rlca
    rlca
    rlca
    rlca
    xor d
    ld e, a
    ; D ^= ROL(E, 1)
    ld a, e
    rlca
    xor d
    ld d, a
    jr .loop
.hashDone
	; save hashed seed to wram
	ld a, e
	ld [wRandomizerSeed], a
	ld a, d
	ld [wRandomizerSeed + 1], a
	; set randomizer seed bit
	ld hl, wExtraFlags
	set 5, [hl]
.dontUseSeedRandomizer
	call ClearScreen
	ret

ShowCaterpie:
	farcall SendShinyCaterpiePal
	ld a, CATERPIE
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a
	call GetMonHeader
	hlcoord 6, 4
	call LoadFlippedFrontSpriteByMonIndex
	call MovePicLeft
	ret
